package models

import (
	"github.com/beego/beego/v2/client/orm"
	"time"
)

// User Model的属性和生成 user 表的字段信息
type User struct {
	Id        uint      `orm:"column(id);auto;size(11)" description:"表ID"`
	Name      string    `orm:"column(name);size(30);" description:"用户名"`
	Password  string    `orm:"column(password);size(100);" description:"密码"`
	Email     string    `orm:"column(email);size(30);" description:"邮箱"`
	CreatedAt time.Time `orm:"column(created_at);type(datetime);auto_now_add" description:"添加时间"`
}

func init() {
	// 注册model
	orm.RegisterModel(new(User))
}
