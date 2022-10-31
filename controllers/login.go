package controllers

import (
	"bee-blog/commons"
	"bee-blog/services"
	beego "github.com/beego/beego/v2/server/web"
)

// LoginController 声明LoginController控制器
type LoginController struct {
	// 继承 Controller
	beego.Controller
}

// Get /**处理GET请求
func (c *LoginController) Get() {
	/*// 创建ORM
	o := orm.NewOrm()
	// 定义 User Model
	var user models.User
	// 给各个属性赋值
	user.Name = "maizi"
	password := "abc123"
	// 密码使用 bcrypt 加密
	hashPassword, err := bcrypt.GenerateFromPassword([]byte(password), bcrypt.DefaultCost)
	if err != nil {
		fmt.Println("密码加密错误")
	}
	user.Password = string(hashPassword)
	user.Email = "maizi@abc.com"
	// 添加数据，返回两个值 id插入表后的主键值，err 错误信息，无错误返回nil
	id, err := o.Insert(&user)
	// 判断操作是否有错误
	if err == nil {
		fmt.Printf("id:%d\n", id)
	}
	// 查询
	u := models.User{Id: uint(id)}
	e := o.Read(&u)
	if e == orm.ErrNoRows {
		fmt.Println("查询不到")
	} else if e == orm.ErrMissPK {
		fmt.Println("找不到主键")
	} else {
		fmt.Printf("id:%d Name:%s\n", u.Id, u.Name)
	}
	*/
	c.TplName = "login.tpl"
}

// Post /** 处理POST请求
func (c *LoginController) Post() {
	// 接收数据
	username := c.GetString("username")
	password := c.GetString("password")
	// 验证数据
	if username == "" {
		commons.Fail(c.Ctx, "用户名不能为空", "", "")
	}
	if password == "" {
		commons.Fail(c.Ctx, "密码不能为空", "", "")
	}
	// 检测用户数据
	uid := services.CheckUser(username, password)
	if uid == 0 {
		commons.Fail(c.Ctx, "用户或者密码错误", "", "")
	}
	// 保存session
	c.SetSession("uid", uid)
	c.SetSession("username", username)
	// 响应
	commons.Success(c.Ctx, username, "登录成功", "")
}
