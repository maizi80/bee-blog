package models

import (
	"github.com/beego/beego/v2/client/orm"
	"time"
)

type Article struct {
	Id           uint      `orm:"column(id);auto;size(11)" description:"表ID" json:"id"`
	Title        string    `orm:"column(title);size(50)" description:"标题" json:"title"`
	Introduction string    `orm:"column(introduction);size(200)" description:"简介" json:"introduction"`
	Content      string    `orm:"column(content);type(text)" description:"内容" json:"content"`
	Image        string    `orm:"column(image);size(50)" description:"图片地址" json:"image"`
	Category     *Category `orm:"rel(fk);on_delete(do_nothing)"`
	Tag          string    `orm:"column(tag);size(50)" description:"标签" json:"tag"`
	Status       uint      `orm:"column(status);size(1)" description:"是否启用 0：否 1：是" json:"status"`
	IsTop        uint      `orm:"column(is_top);size(1)" description:"是否置顶 0：否 1：是" json:"is_top"`
	IsRecommend  uint      `orm:"column(is_recommend);size(1)" description:"是否推荐 0：否 1：是" json:"is_recommend"`
	Sort         uint      `orm:"column(sort);size(3)" description:"排序" json:"sort"`
	ViewCount    uint      `orm:"column(view_count);size(11)" description:"浏览量" json:"view_count"`
	CommentCount uint      `orm:"column(comment_count);size(11)" description:"评论数量" json:"comment_count"`
	LikeCount    uint      `orm:"column(like_count);size(11)" description:"点赞数量" json:"like_count"`
	CreatedAt    time.Time `orm:"type(datetime);column(created_at);auto_now_add" description:"添加时间" json:"created_at"`
	UpdatedAt    time.Time `orm:"type(datetime);column(updated_at);auto_now" description:"最后更新时间" json:"updated_at"`
	PublishedAt  time.Time `orm:"null;type(datetime);column(published_at)" description:"发布时间" json:"published_at"`
}

// 注册模块
func init() {
	orm.RegisterModel(new(Article))
}
