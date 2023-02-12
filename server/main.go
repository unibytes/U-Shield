package main

import (
	"context"
	"fmt"
	"log"

	"github.com/gin-gonic/gin"
	"github.com/unibytes/u-sheild/controller"
	"github.com/unibytes/u-sheild/service"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
	"go.mongodb.org/mongo-driver/mongo/readpref"
)

// configs
const (
	dbname = "u-sheild"
	URI    = "mongodb+srv://admin:123@u-sheild.p8kad2d.mongodb.net/?retryWrites=true&w=majority"
)

// kind of like factory design pattern....
var (
	collNames = []string{
		"users",
		"events",
	}

	servicesBinding = map[string]func(usercollection *mongo.Collection, ctx context.Context) service.Service{
		"users":  service.NewUserService,
		"events": service.NewEventService,
	}

	controllersBinding = map[string]func(service service.Service) controller.Controller{
		"users":  controller.NewUserController,
		"events": controller.NewEventController,
	}
)

// connectMongoDB establish mongo DB connection.
func connectMongoDB() (context.Context, *mongo.Client, *gin.Engine) {
	ctx := context.TODO()
	mongoconn := options.Client().ApplyURI(URI)
	mongoclient, err := mongo.Connect(ctx, mongoconn)
	if err != nil {
		log.Fatal("error while connecting with mongo", err)
	}
	err = mongoclient.Ping(ctx, readpref.Primary())
	if err != nil {
		log.Fatal("error while trying to ping mongo", err)
	}
	fmt.Println("mongo connection established")
	server := gin.Default()
	return ctx, mongoclient, server
}

func registerRoutes(mongoclient *mongo.Client, ctx context.Context, routerGroup *gin.RouterGroup) {
	for _, collName := range collNames {
		curCollection := mongoclient.Database(dbname).Collection(collName)
		curservice := servicesBinding[collName](curCollection, ctx)
		curcontroller := controllersBinding[collName](curservice)
		curcontroller.RegisterRoutes(routerGroup)
	}
}

// entry point of the program
// go run main.go to start up the server
func main() {
	ctx, mongoclient, server := connectMongoDB()
	defer mongoclient.Disconnect(ctx)

	// this is nothing but a homepage route
	server.GET("/", func(ctx *gin.Context) {
		ctx.JSON(200, gin.H{
			"Homepage": "RESTAPIs",
		})
	})

	// register api routes
	apiroutes := server.Group("/api")
	registerRoutes(mongoclient, ctx, apiroutes)

	// run the server
	log.Fatal(server.Run(":9090"))
}
