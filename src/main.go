package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello, World!")
	})
	http.HandleFunc("/rosalia", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello, Rosalia!")
	})
	http.HandleFunc("/mandi", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello, Mandi!")
	})

	fmt.Println("Starting server on :8080")
	log.Fatal(http.ListenAndServe(":8080", nil))
}
