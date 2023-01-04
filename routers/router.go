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
		// /admin/category 处理分类的Get、Post请求，分类管理
		beego.NSRouter("/category", &controllers.CategoryController{}),
		// /admin/category/add 处理添加分类的Get请求
		beego.NSRouter("/category/add", &controllers.CategoryController{}, "get:Create"),
		// /admin/category/cid 处理分类页面Get请求、更新数据Put请求、删除数据请求
		beego.NSRouter("/category/:cid", &controllers.CategoryController{}, "get:Edit;put:Put;delete:Delete"),
		// /admin/category 处理标签的Get、Post请求，标签管理
		beego.NSRouter("/tag", &controllers.TagController{}, "get:GetAll;post:Post"),
		// /admin/tag/add 处理添加分类的Get请求
		beego.NSRouter("/tag/add", &controllers.TagController{}, "get:Create"),
		// /admin/tag/cid 处理分类页面Get请求、更新数据Put请求、处理删除数据请求
		beego.NSRouter("/tag/:tid", &controllers.TagController{}, "get:Edit;put:Put;delete:Delete"),
		// /admin/article 处理文章管理页面Get、Post请求
		beego.NSRouter("/article", &controllers.ArticleController{}),
		// /admin/article/add 处理文章添加页面Get请求
		beego.NSRouter("/article/add", &controllers.ArticleController{}, "get:Create"),
		// /admin/article/aid 处理文章编辑页面Get请求、更新数据Put请求、处理删除数据请求
		beego.NSRouter("/article/:aid", &controllers.ArticleController{}, "get:Edit;put:Put;delete:Delete"),
		// /admin/article/aid/type/status 处理文章列表页面的修改文章状态的请求 aid是文章id，type是类型，如推荐：recommend 置顶：top 状态：status status是状态id
		beego.NSRouter("/article/:aid/:type/:status", &controllers.ArticleController{}, "put:ChangeStatus"),

	)
	beego.AddNamespace(ns)
}
