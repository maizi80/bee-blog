package main

import (
	_ "bee-blog/routers"
	"database/sql"
	"fmt"
	beego "github.com/beego/beego/v2/server/web"
	_ "github.com/go-sql-driver/mysql"
	"github.com/spf13/viper"
)

func main() {
	viper.AddConfigPath(".")
	viper.SetConfigName("env")
	viper.SetConfigType("yaml")
	err := viper.ReadInConfig()
	if err != nil {
		fmt.Errorf("fatal error config file: %w", err)
	}
	appname := viper.Get("appname")
	fmt.Println(appname)

	dsn := "root:0987abc123@tcp(192.168.9.204:3306)/bee-blog"
	//打开数据库链接
	db, err := sql.Open("mysql", dsn)
	if err != nil {
		fmt.Println("db err:", err)
		return
	}
	//关闭数据库链接
	defer db.Close()
	fmt.Println("数据库连接成功")

	beego.Run()
}
