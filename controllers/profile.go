package controllers

import (
	"bee-blog/models"
	"bee-blog/services"
	"github.com/beego/beego/v2/client/orm"
	"github.com/spf13/viper"
)

type ProfileController struct {
	BaseController
}

// Get 个人介绍GET请求，页面
func (c *ProfileController) Get() {
	var profiles []models.Profile
	// 从数据库获取数据
	orm.NewOrm().QueryTable(new(models.Profile)).All(&profiles)
	m := make(map[string]string)
	// 把profile 数据表的数据转为Map类型
	for _, v := range profiles {
		m[v.Alias] = v.Content
	}
	// 通过循环已知的个人信息数据来初始化个人信息的数据（数据表没有数据时）
	for k, _ := range viper.GetStringMap("profile") {
		if _, o := m[k]; !o {
			m[k] = ""
			if k == "avatar" {
				m[k] = viper.GetString("default_avatar")
			}
		}
	}
	c.Data["m"] = m
	c.Layout = "admin_layout.tpl"
	c.TplName = "profile.tpl"
}

// Post 个人介绍POST请求，按钮提交
func (c *ProfileController) Post() {
	// 上传头像
	avatar, err := c.UploadFile("avatar")
	// 处理数据，新增或者更新数据
	services.SaveOrUpdateProfile(c.Ctx, avatar, err)
}
