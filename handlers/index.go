package handlers

import (
	"github.com/a-h/templ"
	"github.com/anesheim-uni/template_go/models"
	"github.com/anesheim-uni/template_go/views"
	"github.com/labstack/echo/v4"
)

func IndexHandler(c echo.Context) error {
	return render(c, views.Greeting(models.Person{Name: "John Doe"}))
}

func render(ctx echo.Context, cmp templ.Component) error {
	return cmp.Render(ctx.Request().Context(), ctx.Response())
}
