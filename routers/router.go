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
		// /admin/profile 个人信息页面Get、Post请求
		beego.NSRouter("/profile", &controllers.ProfileController{}),
	)
	beego.AddNamespace(ns)
}
