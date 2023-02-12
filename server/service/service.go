package service

import "github.com/unibytes/u-sheild/model"

// Service provide interfaces for generatic CRUD
type Service interface {
	Create(model.Model) error
	Get(string) (model.Model, error)
	GetAll() ([]model.Model, error)
	Update(model.Model) error
	Delete(string) error
}
