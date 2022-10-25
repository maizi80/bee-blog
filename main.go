package main

import (
	_ "bee-blog/routers"
	"fmt"
	beego "github.com/beego/beego/v2/server/web"
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
	beego.Run()
}
