package inits

import (
	"fmt"
	"github.com/spf13/viper"
)

func init() {
	viper.AddConfigPath(".")
	viper.SetConfigName("env")
	viper.SetConfigType("yaml")
	err := viper.ReadInConfig()
	if err != nil {
		_ = fmt.Errorf("fatal error config file: %w", err)
	}
}
