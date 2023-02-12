package service

import (
	"context"

	"github.com/unibytes/u-sheild/model"
	"go.mongodb.org/mongo-driver/mongo"
)

type EventService struct {
	eventcollection *mongo.Collection
	ctx             context.Context
}

func NewEventService(eventcollection *mongo.Collection, ctx context.Context) Service {
	return &EventService{
		eventcollection: eventcollection,
		ctx:             ctx,
	}
}

func (e *EventService) Create(event model.Model) error {
	_, err := e.eventcollection.InsertOne(e.ctx, event)
	return err
}

func (e *EventService) Get(name string) (model.Model, error) {
	return nil, nil
}

func (e *EventService) GetAll() ([]model.Model, error) {
	return nil, nil
}

func (e *EventService) Update(model.Model) error {
	return nil
}

func (e *EventService) Delete(string) error {
	return nil
}
