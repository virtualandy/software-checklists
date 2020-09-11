package main

import (
	"fmt"

	"nomatter.press/greetings"
)

func main() {
	// Get a greeting message and print it.
	message := greetings.Hello("Denver Startup Week 2020!")
	fmt.Println(message)
}
