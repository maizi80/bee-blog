package main

import (
	_ "bee-blog/inits"
	_ "bee-blog/routers"
	"github.com/beego/beego/v2/client/orm"
	beego "github.com/beego/beego/v2/server/web"
)

func main() {
	// 开启orm debug
	orm.Debug = true
	// 开启根据model自动建表
	// 第二个参数如果是true就会每次启动都会清除数据
	orm.RunSyncdb("default", false, true)
	beego.Run()
}
