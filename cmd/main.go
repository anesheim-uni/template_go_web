package main

import (
	"github.com/anesheim-uni/template_go/handlers"
	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
)

func main() {
	// Echo instance
	e := echo.New()

	// Middleware
	e.Use(middleware.Logger())
	e.Use(middleware.Recover())

	// Static files
	e.Static("/static", "static")

	// Routes
	e.GET("/", handlers.IndexHandler)

	// Start server
	e.Logger.Fatal(e.Start(":1223"))
}
