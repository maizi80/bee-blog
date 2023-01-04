package commons

import (
	"github.com/beego/beego/v2/core/validation"
	"github.com/beego/beego/v2/server/web/context"
)

func Valid(c *context.Context, o interface{}) {
	v := validation.Validation{}
	b, er := v.Valid(o)
	if er != nil {
		Fail(c, er.Error(), "", "")
	}
	if !b {
		e := map[string]string{}
		for _, err := range v.Errors {
			e[err.Key] = err.Message
		}
		Fail(c, "Validation Error", e, "")
	}
}
