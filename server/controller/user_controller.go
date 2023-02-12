package controller

import (
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/unibytes/u-sheild/model"
	"github.com/unibytes/u-sheild/service"
)

type UserController struct {
	service service.Service
}

func NewUserController(service service.Service) Controller {
	return &UserController{
		service: service,
	}
}

func (uc *UserController) Create(ctx *gin.Context) {
	var user model.Model = &model.User{}
	// failed to bind.
	if err := ctx.ShouldBindJSON(&user); err != nil {
		ctx.JSON(http.StatusBadRequest, gin.H{"message": err.Error()})
		return
	}
	err := uc.service.Create(user)
	if err != nil {
		ctx.JSON(http.StatusBadGateway, gin.H{"message": err.Error()})
	}
	ctx.JSON(http.StatusOK, gin.H{"message": "success"})
}

func (uc *UserController) Get(ctx *gin.Context) {
	ctx.JSON(200, "")
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
	userroute.POST("/create", uc.Create)
	userroute.GET("/get/:name", uc.Get)
	userroute.GET("/getall", uc.GetAll)
	userroute.PATCH("/update", uc.Update)
	userroute.DELETE("/delete/:name", uc.Delete)
}
