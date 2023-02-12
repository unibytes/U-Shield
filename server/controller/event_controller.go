package controller

import (
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/unibytes/u-sheild/model"
	"github.com/unibytes/u-sheild/service"
)

type EventController struct {
	service service.Service
}

func NewEventController(service service.Service) Controller {
	return &EventController{
		service: service,
	}
}

func (uc *EventController) Create(ctx *gin.Context) {
	var event model.Model = &model.Event{}
	// failed to bind.
	if err := ctx.ShouldBindJSON(&event); err != nil {
		ctx.JSON(http.StatusBadRequest, gin.H{"message": err.Error()})
		return
	}
	err := uc.service.Create(event)
	if err != nil {
		ctx.JSON(http.StatusBadGateway, gin.H{"message": err.Error()})
	}
	ctx.JSON(http.StatusOK, gin.H{"message": "success"})
}

func (uc *EventController) Get(ctx *gin.Context) {
	ctx.JSON(200, "")
}

func (uc *EventController) GetAll(ctx *gin.Context) {
	ctx.JSON(200, "")
}

func (uc *EventController) Update(ctx *gin.Context) {
	ctx.JSON(200, "")
}

func (uc *EventController) Delete(ctx *gin.Context) {
	ctx.JSON(200, "")
}

// register routes for user services.
func (ec *EventController) RegisterRoutes(rg *gin.RouterGroup) {
	eventroute := rg.Group("/event")
	eventroute.POST("/create", ec.Create)
	eventroute.GET("/get/:name", ec.Get)
	eventroute.GET("/getall", ec.GetAll)
	eventroute.PATCH("/update", ec.Update)
	eventroute.DELETE("/delete/:name", ec.Delete)
}
