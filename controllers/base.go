package controllers

import (
	"bee-blog/commons"
	beego "github.com/beego/beego/v2/server/web"
	"github.com/spf13/viper"
)

type BaseController struct {
	beego.Controller
}

func (c *BaseController) Prepare() {
	uid := c.GetSession("uid")
	if uid == nil {
		// 先注释跳转，方便调试
		//c.Redirect("/login", 302)
	}
}

// UploadFile 上传头像
func (c *BaseController) UploadFile(name string) (string, error) {
	// 上传头像
	f, h, err := c.GetFile(name)
	str := ""
	if err != nil {
		str = viper.GetString("default_avatar")
	} else {
		str = "static/upload/" + h.Filename
		defer f.Close()
		c.SaveToFile(name, str)
		str = "/" + str
	}
	return str, err
}

// SetPaginator 设置翻页
func (c *BaseController) SetPaginator(per int, nums int64) *commons.Paginator {
	p := commons.NewPaginator(c.Ctx.Request, per, nums)
	c.Data["paginator"] = p
	return p
}
