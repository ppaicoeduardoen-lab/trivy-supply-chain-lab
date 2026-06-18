package scanner

import (
	"fmt"
	"os"
	"strings"
)

func ScanFile(path string) {
	fmt.Println("=== Trivy Supply Chain Lab Scanner ===")
	fmt.Println("Objetivo:", path)

	data, err := os.ReadFile(path)
	if err != nil {
		fmt.Println("[WARN] No se pudo leer el archivo:", err)
		return
	}

	content := strings.ToLower(string(data))

	patterns := []string{
		"password",
		"secret",
		"token",
		"api_key",
		"private_key",
	}

	found := false

	for _, pattern := range patterns {
		if strings.Contains(content, pattern) {
			fmt.Println("[ALERTA] Patrón sensible detectado:", pattern)
			found = true
		}
	}

	if !found {
		fmt.Println("[OK] No se encontraron patrones sensibles básicos.")
	}
}