package service

import (
	"context"

	"github.com/unibytes/u-sheild/model"
	"go.mongodb.org/mongo-driver/mongo"
)

type UserService struct {
	usercollection *mongo.Collection
	ctx            context.Context
}

func NewUserService(usercollection *mongo.Collection, ctx context.Context) Service {
	return &UserService{
		usercollection: usercollection,
		ctx:            ctx,
	}
}

func (u *UserService) Create(user model.Model) error {
	_, err := u.usercollection.InsertOne(u.ctx, user)
	return err
}

func (u *UserService) Get(name string) (model.Model, error) {
	return nil, nil
}

func (u *UserService) GetAll() ([]model.Model, error) {
	return nil, nil
}

func (u *UserService) Update(model.Model) error {
	return nil
}

func (u *UserService) Delete(string) error {
	return nil
}
