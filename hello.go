package main

import (
	"fmt"

	"nomatter.press/greetings"
)

func main() {
	// Get a greeting message and print it.
	message := greetings.Hello("Gladys the Conqueror")
	fmt.Println(message)
}
