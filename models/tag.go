package models

import (
	"github.com/beego/beego/v2/client/orm"
)

type Tag struct {
	Id    int64
	Alias string `orm:"size(128)"`
	Name  string `orm:"size(128)"`
	Sort  int
}

func init() {
	orm.RegisterModel(new(Tag))
}
