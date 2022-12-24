package main

import (
	"fmt"
	"github.com/spf13/cobra"
)

var version = "main"
var gitSha = ""

func versionCmd() *cobra.Command {
	cmd := &cobra.Command{
		Use:   "version",
		Short: "The version of this binary",
		Run: func(cmd *cobra.Command, args []string) {
			fmt.Print(version, gitSha, "\n")
		},
	}
	return cmd
}
