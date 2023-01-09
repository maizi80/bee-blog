package models

import (
	"github.com/beego/beego/v2/client/orm"
	"time"
)

type Comment struct {
	Id        uint      `orm:"column(id);auto;size(11)" description:"表ID"`
	Aid       int       `orm:"column(aid);size(10);default(0)" description:"文章ID"`
	Username  string    `orm:"column(username);size(30);default('')" description:"用户名"`
	Pid       int       `orm:"column(pid);size(10);default(0)" description:"父级ID"`
	Content   string    `orm:"column(content);type(text)" description:"内容"`
	CreatedAt time.Time `orm:"auto_now;column(created_at);type(datetime)" description:"添加时间"`
}

func init() {
	orm.RegisterModel(new(Comment))
}
