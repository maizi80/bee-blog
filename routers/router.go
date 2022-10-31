package routers

import (
	"bee-blog/controllers"
	beego "github.com/beego/beego/v2/server/web"
)

func init() {
	beego.Router("/", &controllers.MainController{})
	beego.Router("/login", &controllers.LoginController{})

	ns := beego.NewNamespace("/admin",
		// /admin/
		beego.NSRouter("/", &controllers.AdminController{}),
	)
	beego.AddNamespace(ns)
}
