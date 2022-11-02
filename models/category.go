package models

import (
	"github.com/beego/beego/v2/client/orm"
)

type Category struct {
	Id    uint   `orm:"column(id);auto;size(11)" description:"表ID" json:"id"`
	Alias string `orm:"column(alias);size(50)" description:"别名"`
	Name  string `orm:"column(name);size(50)" description:"名字"`
	Sort  uint   `orm:"column(sort);size(11);default(0)" description:"排序"`
}

func init() {
	orm.RegisterModel(new(Category))
}
