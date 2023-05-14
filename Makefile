NAME := terraform-provider-stateful
PLATFORMS := linux/amd64
VERSION = $(shell git describe 1>/dev/null 2>/dev/null && echo "_$$(git describe)")

temp = $(subst /, ,$@)
os = $(word 1, $(temp))
arch = $(word 2, $(temp))

BASE := $(NAME)$(VERSION)
RELEASE_DIR := ./release

all: clean release

clean:
	rm -rf $(RELEASE_DIR) ./$(NAME)*

format:
	GOPROXY="off" GOFLAGS="-mod=vendor" go fmt ./...

build:
	GOPROXY="off" GOFLAGS="-mod=vendor" go build -o $(BASE)

release: $(PLATFORMS)

$(PLATFORMS):
	GOPROXY="off" GOFLAGS="-mod=vendor" GOOS=$(os) GOARCH=$(arch) go build -o '$(RELEASE_DIR)/$(BASE)-$(os)-$(arch)'

.PHONY: $(PLATFORMS) release build fmt clean all
