package main

import (
	"fmt"

	api "github.com/anIcedAntFA/fingreat-server/apis"
)

func main() {
	fmt.Println("hello me")

	server := api.NewServer(".")

	server.Start(3000)
}
