package models

import "github.com/beego/beego/v2/client/orm"

type Profile struct {
	Id      uint   `orm:"column(id);auto;size(11)" description:"表ID" json:"id"`
	Alias   string `orm:"column(alias);size(50)" description:"别名"`
	Name    string `orm:"column(name);size(50)" description:"名字"`
	Content string `orm:"column(content);size(255)" description:"内容"`
	Type    uint   `orm:"column(type);size(11);default(0)" description:"类型"`
	Sort    uint   `orm:"column(sort);size(11);default(0)" description:"排序"`
}

// Read 读取数据
func (m *Profile) Read(fields ...string) error {
	if err := orm.NewOrm().Read(m, fields...); err != nil {
		return err
	}
	return nil
}

func init() {
	orm.RegisterModel(new(Profile))
}
