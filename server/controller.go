package server

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

type JsonResponseBody struct {
	JSONResponse
	Success bool
	Error   string
}

type CNNResponse struct {
	JSONResponse JSONResponse `json:"jsonresponse"`
	Content      Result       `json:"flaskresponsetest"`
}

func CNNHandler(c *gin.Context) {
	c.JSON(http.StatusOK, SuccessResponse("everything ok"))
}

func TestHandler(c *gin.Context) {
	c.JSON(http.StatusOK, SuccessResponse("the value is ok"))
}

func FlaskController(c *gin.Context) {
	data, err := FetchAPIResponse("http://127.0.0.1:5000")
	if err != nil {
		c.JSON(http.StatusBadGateway, ErrorResponse("Problems"))
	}
	c.JSON(http.StatusOK, CNNResponse{
		JSONResponse: SuccessResponse("ok"),
		Content:      data,
	})
}
