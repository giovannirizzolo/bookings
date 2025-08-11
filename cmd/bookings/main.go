package main

import (
	"github.com/gin-gonic/gin"
	"github.com/giovannirizzolo/bookings/internal/http"
)

func main(){
	r := gin.Default()

	routes := r.Group("/api")
	{
		routes.GET("/healthz", getHealth)
	}
	r.Run(":8080")
}