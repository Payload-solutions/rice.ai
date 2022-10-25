package server

import "github.com/gin-gonic/gin"

func Router(router *gin.Engine) *gin.Engine {
	router.Group("/cnn").
		GET("/", CNNHandler).
		GET("/test", TestHandler).
		GET("/value", FlaskController)

	router.Use(func(ctx *gin.Context) {
		ctx.JSON(404, JSONResponse{
			Success: false,
			Error:   "resource not found",
		})
	})
	return router
}
