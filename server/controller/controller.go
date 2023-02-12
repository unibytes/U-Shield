package controller

import "github.com/gin-gonic/gin"

type Controller interface {
	Create(*gin.Context)
	Get(*gin.Context)
	GetAll(*gin.Context)
	Update(*gin.Context)
	Delete(*gin.Context)
	RegisterRoutes(*gin.RouterGroup)
}
