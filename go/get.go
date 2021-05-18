package main

import (
	"fmt"
	"io/ioutil"
	"net/http"
)

func main() {
	url := "your_endpoint"

	resp, err := http.Get(url)

	if err != nil {
		fmt.Println(err)
	}

	defer resp.Body.Close()

	body, err := ioutil.ReadAll(resp.Body)

	fmt.Println(string(body))
}
