package controllers

import (
	"bee-blog/models"
	"github.com/beego/beego/v2/client/orm"
	beego "github.com/beego/beego/v2/server/web"
)

type MainController struct {
	beego.Controller
}

func (c *MainController) Prepare() {
	var categorys []models.Category
	o := orm.NewOrm()
	o.QueryTable(new(models.Category)).All(&categorys)
	c.Data["categorys"] = categorys
}
