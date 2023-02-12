package model

type User struct {
	Email       string  `json:"email" bson:"user_email"`
	Password    string  `json:"password" bson:"user_password"`
	Name        string  `json:"name" bson:"user_name"`
	Address     Address `json:"address" bson:"user_address"`
	PhoneNumber string  `json:"phonenumber" bson:"user_phonenumber"`

	// [PENDING JOB]
	// maybe we should make this another collection, so one user can have multiple
	// emergency contact
	EmergencyContact []EmergencyContact `json:"emergencycontact" bson:"user_emergencycontact"`
}

// whoami returns a collection name.
func(u *User) whoami() string {
	return "users"
}



type Address struct {
	State   string `json:"state" bson:"state"`
	City    string `json:"city" bson:"city"`
	ZipCode int    `json:"zipcode" bson:"zipcode"`
	Street  string `json:"street" bson:"street"`
}

type EmergencyContact struct {
	Relation    string `json:"relation" bson:"relation"`
	PhoneNumber string `json:"phonenumber" bson:"phonenumber"`
	Email       string `json:"email" bson:"email"`
}
