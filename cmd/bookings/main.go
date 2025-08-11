package main

import (
	"github.com/gin-gonic/gin"
	"github.com/giovannirizzolo/bookings/internal/adapters/gin"
)

func main() {
	r := gin.Default()

	routes := r.Group("/api")
	{
		routes.GET("/healthz", http.GetHealth)
	}
	r.Run(":8080")
}
