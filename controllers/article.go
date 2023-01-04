package controllers

import (
	"bee-blog/commons"
	"bee-blog/models"
	"bee-blog/utils"
	"bee-blog/validations"
	"github.com/beego/beego/v2/client/orm"
	"github.com/spf13/viper"
	"time"
)

type ArticleController struct {
	BaseController
}

// Get 处理GET请求，显示列表页面
func (c *ArticleController) Get() {
	var articles []*models.Article
	limit := viper.GetInt("page_size")

	qs := orm.NewOrm().QueryTable("article").Filter("Category__gt", 0)
	nums, _ := qs.Count()
	pager := c.SetPaginator(limit, nums)
	qs.Limit(limit, pager.Offset()).OrderBy("-created_at").RelatedSel().All(&articles)
	c.Data["articles"] = articles
	c.Layout = "admin_layout.tpl"
	c.TplName = "article/index.tpl"
}

// Create 处理GET请求，显示添加文章页面
func (c *ArticleController) Create() {
	var categorys []models.Category
	var tags []models.Tag
	o := orm.NewOrm()
	o.QueryTable(new(models.Category)).All(&categorys)
	o.QueryTable(new(models.Tag)).All(&tags)
	c.Data["categorys"] = categorys
	c.Data["tags"] = tags
	c.Layout = "admin_layout.tpl"
	c.TplName = "article/create.tpl"
}

// Post 处理POST请求，处理添加文章处理逻辑
func (c *ArticleController) Post() {
	cid, _ := c.GetInt("category_id", 0)
	f, h, err := c.GetFile("image")
	image := ""
	if err == nil {
		image = "static/upload/" + h.Filename
		defer f.Close()
		c.SaveToFile("image", image)
		image = "/" + image
	}
	a := validations.ArticleValidate{
		Title:        c.GetString("title"),
		CategoryId:   cid,
		Introduction: c.GetString("introduction"),
		Content:      c.GetString("content"),
		Image:        image,
		Tag:          c.GetStrings("tag"),
	}
	commons.Valid(c.Ctx, &a)

	category := models.Category{Id: uint(a.CategoryId)}
	ao := models.Article{
		Title:        a.Title,
		Introduction: a.Introduction,
		Content:      a.Content,
		Image:        a.Image,
		Category:     &category,
		Tag:          utils.Convert(a.Tag),
	}
	insert, err := orm.NewOrm().Insert(&ao)
	if err != nil {
		commons.Fail(c.Ctx, "添加失败", "", "")
	}
	commons.Success(c.Ctx, insert, "添加成功", "")
}

// Edit 处理GET请求，显示修改文章页面
func (c *ArticleController) Edit() {
	var categorys []models.Category
	var tags []models.Tag
	o := orm.NewOrm()
	o.QueryTable(new(models.Category)).All(&categorys)
	o.QueryTable(new(models.Tag)).All(&tags)

	aid := c.Ctx.Input.Param(":aid")
	aidUInt, _ := utils.ToUInt(aid)
	// 验证数据
	if aidUInt == 0 {
		commons.Fail(c.Ctx, "ID不能为空", "", "")
	}
	article := models.Article{Id: aidUInt}
	err := o.Read(&article)
	if err == orm.ErrNoRows {
		c.Abort("404")
	}
	c.Data["a"] = article
	c.Data["categorys"] = categorys
	c.Data["tags"] = tags
	c.Data["contains"] = utils.ContainsIntInString
	c.Layout = "admin_layout.tpl"
	c.TplName = "article/edit.tpl"
}

// Put 处理PUT请求，处理编辑更新文章处理逻辑
func (c *ArticleController) Put() {
	aid := c.Ctx.Input.Param(":aid")
	aidUInt, _ := utils.ToUInt(aid)
	cid, _ := c.GetInt("category_id", 0)
	f, h, err := c.GetFile("image")
	image := c.GetString("img")
	if err != nil {
		image = c.GetString("img")
	} else {
		image = "static/upload/" + h.Filename
		defer f.Close()
		c.SaveToFile("image", image)
		image = "/" + image
	}

	a := validations.ArticleValidate{
		Title:        c.GetString("title"),
		CategoryId:   cid,
		Introduction: c.GetString("introduction"),
		Content:      c.GetString("content"),
		Image:        image,
		Tag:          c.GetStrings("tag"),
	}
	commons.Valid(c.Ctx, &a)
	o := orm.NewOrm()
	aerr := o.Read(&models.Article{Id: aidUInt})
	if aerr == orm.ErrNoRows {
		commons.Fail(c.Ctx, "数据错误", nil, "")
	}
	category := models.Category{Id: uint(a.CategoryId)}
	// 保存数据
	ao := models.Article{
		Id:           aidUInt,
		Title:        a.Title,
		Introduction: a.Introduction,
		Content:      a.Content,
		Image:        a.Image,
		Category:     &category,
		Tag:          utils.Convert(a.Tag),
	}

	num, err := orm.NewOrm().Update(&ao)
	if err != nil {
		commons.Fail(c.Ctx, "更新失败", nil, "")
	}
	commons.Success(c.Ctx, num, "更新成功", "")
}

// Delete 处理DELETE请求，处理删除文章逻辑
func (c *ArticleController) Delete() {
	aid := c.Ctx.Input.Param(":aid")
	aidUInt, _ := utils.ToUInt(aid)
	// 验证数据
	if aidUInt == 0 {
		commons.Fail(c.Ctx, "ID不能为空", "", "")
	}
	a := models.Article{Id: aidUInt}
	o := orm.NewOrm()
	err := o.Read(&a)
	if err == orm.ErrNoRows {
		commons.Fail(c.Ctx, "数据错误", nil, "")
	}
	num, err := o.Delete(&a)
	if err != nil {
		commons.Fail(c.Ctx, "删除失败", nil, "")
	}
	commons.Success(c.Ctx, num, "删除成功", "")
}

// ChangeStatus 处理POST请求，处理文章列表页修改文章状态等操作逻辑
func (c *ArticleController) ChangeStatus() {
	aid := c.Ctx.Input.Param(":aid")
	aidInt, _ := utils.ToUInt(aid)
	t := c.Ctx.Input.Param(":type")
	status := c.Ctx.Input.Param(":status")
	statusInt, _ := utils.ToUInt(status)
	// 验证数据
	if aidInt == 0 {
		commons.Fail(c.Ctx, "ID不能为空", "", "")
	}
	a := models.Article{Id: aidInt}
	o := orm.NewOrm()
	err := o.Read(&a)
	if err == orm.ErrNoRows {
		commons.Fail(c.Ctx, "数据错误", nil, "")
	}
	// 保存数据
	switch t {
	case "status":
		a.Status = statusInt
		a.PublishedAt = time.Now()
	case "top":
		a.IsTop = statusInt
	case "recommend":
		a.IsRecommend = statusInt
	}
	num, err := orm.NewOrm().Update(&a)
	if err != nil {
		commons.Fail(c.Ctx, "操作失败", nil, "")
	}
	commons.Success(c.Ctx, num, "操作成功", "")
}
