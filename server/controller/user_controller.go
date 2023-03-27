package controller

import (
	"context"
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/unibytes/u-sheild/model"
	"github.com/unibytes/u-sheild/service"
	"go.mongodb.org/mongo-driver/mongo"
)

type UserController struct {
	userservice *service.UserService
}

func NewUserController(dbcollection *mongo.Collection, ctx context.Context) *UserController {
	return &UserController{
		userservice: service.NewUserService(dbcollection, ctx),
	}
}

func (uc *UserController) Auth(ctx *gin.Context) {
	var loginUser model.User
	if err := ctx.ShouldBindJSON(&loginUser); err != nil {
		ctx.JSON(http.StatusBadRequest, gin.H{"message": err.Error()})
		return
	}
	systemUser, err := uc.userservice.Get(loginUser.Email)
	if err != nil {
		ctx.JSON(http.StatusUnauthorized, gin.H{"message":  gin.H{"error": "Invalid username or password"}})
		return
	}

	if loginUser.Password != systemUser.Password {
		ctx.JSON(http.StatusUnauthorized, gin.H{"message":  gin.H{"error": "Invalid username or password"}})
		return
	}

	ctx.JSON(http.StatusOK, gin.H{"message": "success"})
}

func (uc *UserController) CreateUser(ctx *gin.Context) {
	var user model.User
	// failed to bind.
	if err := ctx.ShouldBindJSON(&user); err != nil {
		ctx.JSON(http.StatusBadRequest, gin.H{"message": err.Error()})
		return
	}
	err := uc.userservice.Create(&user)
	if err != nil {
		ctx.JSON(http.StatusBadGateway, gin.H{"message": err.Error()})
	}
	ctx.JSON(http.StatusOK, gin.H{"message": "success"})
}

func (uc *UserController) GetUser(ctx *gin.Context) {
	var email string = ctx.Param("user_email")
	user, err := uc.userservice.Get(email)
	if err != nil {
		ctx.JSON(http.StatusBadGateway, gin.H{"message": err.Error()})
		return
	}
	ctx.JSON(http.StatusOK, user)
}

func (uc *UserController) GetAll(ctx *gin.Context) {
	ctx.JSON(200, "")
}

func (uc *UserController) Update(ctx *gin.Context) {
	ctx.JSON(200, "")
}

func (uc *UserController) Delete(ctx *gin.Context) {
	ctx.JSON(200, "")
}

// register routes for user services.
func (uc *UserController) RegisterRoutes(rg *gin.RouterGroup) {
	userroute := rg.Group("/user")
	userroute.POST("/auth", uc.Auth)
	userroute.POST("/create", uc.CreateUser)
	userroute.GET("/get/:user_email", uc.GetUser)
	userroute.GET("/getall", uc.GetAll)
	userroute.PATCH("/update", uc.Update)
	userroute.DELETE("/delete/:name", uc.Delete)
}
