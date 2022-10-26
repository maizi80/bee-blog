package controllers

import (
	beego "github.com/beego/beego/v2/server/web"
)

// LoginController 声明LoginController控制器
type LoginController struct {
	// 继承 Controller
	beego.Controller
}

// Get /**处理GET请求
func (c *LoginController) Get() {
	c.TplName = "login.tpl"
}
