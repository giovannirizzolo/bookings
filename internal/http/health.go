package http

func getHealth(c *gin.Context){
	c.JSON(200, gin.H{
		"message": "ok",
	})
}