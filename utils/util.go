package utils

import (
	"fmt"
	"reflect"
	"strconv"
)

// ToInt 把数据转为Int格式
func ToInt(v any) (d int, err error) {
	val := reflect.ValueOf(v)
	switch v.(type) {
	case int, int8, int16, int32, int64:
		d = int(val.Int())
	case uint, uint8, uint16, uint32, uint64:
		d = int(val.Uint())
	case float32, float64:
		d = int(val.Float())
	case string:
		d, _ = strconv.Atoi(val.String())
	default:
		err = fmt.Errorf("unknown type `%T`", v)
	}
	return
}

// ToUInt 把数据转为uint格式
func ToUInt(v any) (d uint, err error) {
	intNum, e := ToInt(v)
	d = uint(intNum)
	err = e
	return
}
