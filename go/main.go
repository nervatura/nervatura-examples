package main

import (
	"fmt"

	"github.com/nervatura/nervatura-examples/app"
)

func main() {
	err := app.New()
	if err != nil {
		fmt.Println(err.Error())
	}
}
