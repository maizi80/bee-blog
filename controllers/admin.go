package controllers

type AdminController struct {
	BaseController
}

func (c *AdminController) Get() {
	c.Layout = "admin_layout.tpl"
	c.TplName = "admin.tpl"
}
