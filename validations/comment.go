package validations

type CommentValidate struct {
	Name    string `valid:"Required;"`
	Email   string `valid:"Required;Email;"`
	Content string `valid:"Required;"`
	Aid     int    `valid:"Required;"`
	Pid     int    ``
}
