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
		// admin/category 处理分类的Get、Post请求，分类管理
		beego.NSRouter("/category", &controllers.CategoryController{}),
		// admin/category/add 处理添加分类的Get请求
		beego.NSRouter("/category/add", &controllers.CategoryController{}, "get:Create"),
		// admin/category/cid 处理分类页面Get请求、更新数据Put请求
		beego.NSRouter("/category/:cid", &controllers.CategoryController{}, "get:Edit;put:Put"),
		// admin/category/cid 处理删除数据请求
		beego.NSRouter("/category/:cid", &controllers.CategoryController{}, "get:Edit;put:Put;delete:Delete"),
	)
	beego.AddNamespace(ns)
}
