package controllers

import (
	"bee-blog/commons"
	"bee-blog/models"
	"bee-blog/validations"
	"github.com/beego/beego/v2/client/orm"
	beego "github.com/beego/beego/v2/server/web"
)

type CommentController struct {
	beego.Controller
}

func (c *CommentController) Post() {

	pid, _ := c.GetInt("comment_parent", 0)
	parent, _ := c.GetInt("parent", 0)
	if parent != 0 {
		pid = parent
	}
	aid, _ := c.GetInt("comment_post_ID", 0)
	uid, _ := c.GetInt("uid", 0)
	d := validations.CommentValidate{
		Name:    c.GetString("name"),
		Email:   c.GetString("email"),
		Content: c.GetString("content"),
		Pid:     pid,
		Aid:     aid,
	}
	commons.Valid(c.Ctx, &d)

	if uid == 0 {
		// 插入用户
		u := models.User{
			Name:  d.Name,
			Email: d.Email,
		}
		uid, e := orm.NewOrm().Insert(&u)
		if e != nil {
			commons.Fail(c.Ctx, "添加失败", nil, "")
		}
		// 设置 session
		c.SetSession("uid", uid)
		c.SetSession("username", d.Name)
	}

	co := models.Comment{
		Username: d.Name,
		Content:  d.Content,
		Aid:      d.Aid,
		Pid:      d.Pid,
	}
	insert, err := orm.NewOrm().Insert(&co)
	if err != nil {
		commons.Fail(c.Ctx, "添加失败", nil, "")
	}
	// 评论数量+1
	orm.NewOrm().QueryTable("article").Filter("id", uint(aid)).Update(orm.Params{
		"comment_count": orm.ColValue(orm.ColAdd, 1),
	})
	commons.Success(c.Ctx, insert, "添加成功", "")
}
