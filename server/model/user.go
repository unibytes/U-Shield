package model

type User struct {
	Email       string  `json:"user_email" bson:"user_email"`
	Password    string  `json:"user_password" bson:"user_password"`
	Name        string  `json:"user_name" bson:"user_name"`
	Address     Address `json:"user_address" bson:"user_address"`
	PhoneNumber string  `json:"user_phonenumber" bson:"user_phonenumber"`

	EmergencyContact []EmergencyContact `json:"user_emergencycontact" bson:"user_emergencycontact"`

	Events []Event `json:"user_events" bson:"user_events"`
}

type Address struct {
	State   string `json:"state" bson:"state"`
	City    string `json:"city" bson:"city"`
	ZipCode int    `json:"zipcode" bson:"zipcode"`
	Street  string `json:"street" bson:"street"`
}

type EmergencyContact struct {
	Name        string `json:"emergency_name" bson:"emergency_name"`
	Relation    string `json:"emergency_relation" bson:"emergency_relation"`
	PhoneNumber string `json:"emergency_phonenumber" bson:"emergency_phonenumber"`
	Email       string `json:"emergency_email" bson:"emergency_email"`
}

type Event struct {
	Content string `json:"event_content" bson:"event_content"`
}
