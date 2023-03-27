package service

import (
	"context"

	"github.com/unibytes/u-sheild/model"
	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/mongo"
)

type UserService struct {
	usercollection *mongo.Collection
	ctx            context.Context
}

func NewUserService(usercollection *mongo.Collection, ctx context.Context) *UserService {
	return &UserService{
		usercollection: usercollection,
		ctx:            ctx,
	}
}

func (u *UserService) Create(user *model.User) error {
	_, err := u.usercollection.InsertOne(u.ctx, user)
	return err
}

func (u *UserService) Get(email string) (*model.User, error) {
	var user *model.User
	query := bson.D{bson.E{Key: "user_email", Value: email}}
	err := u.usercollection.FindOne(u.ctx, query).Decode(&user)
	return user, err
}

func (u *UserService) GetAll() ([]*model.User, error) {
	return nil, nil
}

func (u *UserService) Update(*model.User) error {
	return nil
}

func (u *UserService) Delete(string) error {
	return nil
}
