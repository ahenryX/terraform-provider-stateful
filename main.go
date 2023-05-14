package main

import (
	"github.com/ahenryX/terraform-provider-stateful/stateful"
	"github.com/hashicorp/terraform-plugin-sdk/plugin"
	"github.com/hashicorp/terraform-plugin-sdk/terraform"
)

func main() {
	plugin.Serve(&plugin.ServeOpts{
		ProviderFunc: func() terraform.ResourceProvider {
			return stateful.Provider()
		},
	})
}
