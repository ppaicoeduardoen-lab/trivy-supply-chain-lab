package main

import (
	"fmt"
	"os"

	"github.com/lab/trivy-supply-chain-lab/internal/scanner"
)

func main() {
	target := "samples/vulnerable.env"

	if len(os.Args) > 1 {
		target = os.Args[1]
	}

	fmt.Println("Trivy Lab - simulador académico")
	scanner.ScanFile(target)
}