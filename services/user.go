package services

import (
	"bee-blog/models"
	"github.com/beego/beego/v2/client/orm"
	"golang.org/x/crypto/bcrypt"
)

type userService struct {
}

func CheckUser(username string, password string) uint {
	var user models.User
	o := orm.NewOrm()
	qs := o.QueryTable("user")
	qs = qs.Filter("name", username)
	r := qs.One(&user, "Id", "password")
	if r != nil {
		return 0
	}
	if password != "" {
		// 判断密码是否正确
		err := bcrypt.CompareHashAndPassword([]byte(user.Password), []byte(password))
		if err != nil {
			return 0
		}
	}
	return user.Id
}
