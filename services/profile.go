package services

import (
	"bee-blog/commons"
	"bee-blog/models"
	"github.com/beego/beego/v2/client/orm"
	"github.com/beego/beego/v2/server/web/context"
	"github.com/spf13/viper"
)

type profileService struct{}

// GetProfileByMap 把map的数据转化为Profile Model数据
func GetProfileByMap(p interface{}, profile models.Profile) models.Profile {
	for i, v := range p.(map[string]interface{}) {
		switch i {
		case "alias":
			profile.Alias = v.(string)
		case "name":
			profile.Name = v.(string)
		case "type":
			in := v.(int)
			profile.Type = uint(in)
		}
	}
	return profile
}

func GetMapByProfile(profiles []models.Profile) map[string]string {
	p := make(map[string]string)
	for _, profile := range profiles {
		switch profile.Alias {
		case "motto":
			p["motto"] = profile.Content
		case "motto_e":
			p["motto_e"] = profile.Content
		case "introduction":
			p["introduction"] = profile.Content
		case "qq":
			p["qq"] = profile.Content
		case "email":
			p["email"] = profile.Content
		case "github":
			p["github"] = profile.Content
		case "nickname":
			p["nickname"] = profile.Content
		case "avatar":
			p["avatar"] = profile.Content
		}
	}
	return p
}

// SaveOrUpdateProfile 处理数据，添加或者更新
func SaveOrUpdateProfile(c *context.Context, avatar string, err error) {
	o := orm.NewOrm()
	var profile models.Profile
	// 从配置文件中获取profile配置信息
	for k, v := range viper.GetStringMap("profile") {
		// 获取表单内容
		a := c.Request.FormValue(k)
		if a == "undefined" {
			continue
		}
		// 通过配置文件的key值获取表的其他数据
		e := o.QueryTable("profile").Filter("alias", k).One(&profile, "id")
		pid := profile.Id
		// 把profile model 数据转为map
		profile = GetProfileByMap(v, models.Profile{})
		// 把表单的数据赋值到profile.Content
		profile.Content = a
		// 数据是否存在，存在则更新，否则添加
		if e == nil {
			profile.Id = pid
			// 图片上传成功才更新图片数据
			if k == "avatar" && err == nil {
				profile.Content = avatar
			}
			// 更新
			if _, e := o.Update(&profile); e != nil {
				commons.Fail(c, "更新失败", nil, "")
			}
		} else {
			if k == "avatar" {
				profile.Content = avatar
			}
			// 添加
			if _, e := orm.NewOrm().Insert(&profile); e != nil {
				commons.Fail(c, "添加失败", nil, "")
			}
		}
	}
	commons.Success(c, 0, "操作成功", "")
}
