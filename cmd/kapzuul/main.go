package main

import (
	"fmt"
	"github.com/spf13/cobra"
	"os"
)

func rootCmd() *cobra.Command {
	cmd := &cobra.Command{
		Use:   "kapzuul",
		Short: "A simple easy to configure self-hosted cloud",
		Long: `Kapzuul is designed to make it really simple
                to build your own self-hosted cloud without
                onerous configuration management`,
	}
	cmd.AddCommand(versionCmd())
	return cmd
}

func main() {
	if err := rootCmd().Execute(); err != nil {
		fmt.Printf("ERROR: %s", err.Error())
		os.Exit(1)
	}
}
