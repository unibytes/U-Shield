package main

import (
	"context"
	"fmt"
	"log"

	"github.com/gin-gonic/gin"
	"github.com/unibytes/u-sheild/controller"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"
	"go.mongodb.org/mongo-driver/mongo/readpref"
)

// configs
const (
	dbname     = "u-sheild"
	collection = "users"
	URI        = "mongodb+srv://admin:123@u-sheild.p8kad2d.mongodb.net/?retryWrites=true&w=majority"
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
	usercollection := mongoclient.Database(dbname).Collection(collection)
	usercontroller := controller.NewUserController(usercollection, ctx)
	usercontroller.RegisterRoutes(apiroutes)

	// run the server
	log.Fatal(server.Run(":5555"))
}
