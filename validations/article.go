package validations

type ArticleValidate struct {
	Title        string `valid:"Required;"`
	Image        string `valid:"Required;"`
	Content      string `valid:"Required;"`
	Introduction string `valid:"Required;"`
	CategoryId   int    `valid:"Required;"`
	Tag          []string
}
