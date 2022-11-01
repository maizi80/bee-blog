package inits

import (
	"fmt"
	"github.com/spf13/viper"
)

func init() {
	viper.AddConfigPath(".")
	viper.SetConfigType("yaml")
	viper.SetConfigName("env")

	err := viper.ReadInConfig()
	if err != nil {
		_ = fmt.Errorf("fatal error config file: %w", err)
	}
	// 配置文件目录
	viper.AddConfigPath("./conf")
	// 配置文件名字
	viper.SetConfigName("viper")
	// 把配置信息添加到上面的配置信息后
	viper.MergeInConfig()
}
