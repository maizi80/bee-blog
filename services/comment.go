package services

import (
	"bee-blog/models"
	"github.com/beego/beego/v2/client/orm"
)

type commentService struct {
}

type Comments struct {
	Id        int         `json:"id"`
	Pid       int         `json:"pid"`
	Aid       int         `json:"aid"`
	UserName  string      `json:"username"`
	Content   string      `json:"content"`
	CreatedAt string      `json:"created_at"`
	Children  []*Comments `json:"children"`
}

func GetComments(aid int) []*Comments {
	var comments []models.Comment
	o := orm.NewOrm().QueryTable(new(models.Comment))
	o.Filter("aid", aid).OrderBy("-created_at").All(&comments)
	cs := BuildTree(comments, 0)
	return cs
}

func BuildTree(comments []models.Comment, parentId int) []*Comments {
	c := make([]*Comments, 0)
	for _, v := range comments {
		var r = new(Comments)
		r.Id = int(v.Id)
		r.Pid = v.Pid
		r.Aid = v.Aid
		r.UserName = v.Username
		r.Content = v.Content
		r.CreatedAt = v.CreatedAt.Format("2006-01-02")
		pid := v.Pid
		if pid == parentId {
			id := int(v.Id)
			children := BuildTree(comments, id)
			if len(children) > 0 {
				r.Children = BuildTree(comments, id)
			}
			c = append(c, r)
		}
	}
	return c
}
