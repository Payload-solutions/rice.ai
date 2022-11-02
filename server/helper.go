package server

import (
	"encoding/json"
	"errors"
	"io/ioutil"
	"net/http"
)

// json response for
type Result struct {
	Ping  string `json:"ping"`
	Value int64  `json:"value"`
}

func FetchAPIResponse(url string) (Result, error) {
	resp, err := http.Get(url)
	if err != nil {
		return Result{}, err
	}
	defer resp.Body.Close()

	body, err := ioutil.ReadAll(resp.Body)
	var result Result
	if err := json.Unmarshal(body, &result); err != nil {
		return Result{}, errors.New("can't marshall the response")
	}
	return result, nil
}

func PrettyPrint(i interface{}) string {
	s, _ := json.MarshalIndent(i, "", "\n")
	return string(s)
}
