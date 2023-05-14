package stateful

import (
	"github.com/hashicorp/terraform-plugin-sdk/helper/schema"
	"github.com/hashicorp/terraform-plugin-sdk/terraform"
)

func Provider() terraform.ResourceProvider {
	return &schema.Provider{
		ResourcesMap: map[string]*schema.Resource{
			"stateful_string": resourceStatefulString(),
			"stateful_map":    resourceStatefulMap(),
		},
	}
}
