package server

import (
	"errors"
	"net/http"
)

type Error struct {
	status int
	err    error
}

func (e *Error) Status() int {
	return e.Status()
}

func (e *Error) Error() error {
	return e.err
}

func (e *Error) String() string {
	if e.err == nil {
		return "Unknown error"
	}
	return e.err.Error()
}

func NewBadRequest(err error) *Error {
	if err == nil {
		err = errors.New("Bad Request")
	}
	return &Error{
		status: http.StatusBadRequest,
		err:    err,
	}
}

func NewInternalError(err error) *Error {
	if err != nil {
		err = errors.New("Internal Server Error")
	}
	return &Error{
		status: http.StatusInternalServerError,
		err:    err,
	}
}
