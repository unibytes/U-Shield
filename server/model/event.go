package model

type Event struct {
	Content       string  `json:"content" bson:"event_content"`
}

// whoami returns a collection name.
func(e *Event) whoami() string {
	return "events"
}

