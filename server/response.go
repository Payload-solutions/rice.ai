package server

import "strings"

func SuccessResponse(msg ...string) JSONResponse {
	var message string = ""
	if len(msg) > 0 {
		message = strings.Join(msg, " ")
	}
	return JSONResponse{
		Success: true,
		Message: message,
	}
}

func ErrorResponse(msg ...string) JSONResponse {
	var message string = "An error ocurred"
	if len(msg) > 0 {
		message = strings.Join(msg, " ")
	}
	return JSONResponse{
		Success: false,
		Error:   message,
	}
}
