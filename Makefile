.PHONY: build test lint format clean help

# Project settings
PROJECT = FutTrack.xcodeproj
SCHEME = FutTrack
DESTINATION = platform=iOS Simulator,name=iPhone 16,OS=latest

help: ## Show available commands
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

build: ## Build the project
	xcodebuild build \
		-project $(PROJECT) \
		-scheme $(SCHEME) \
		-destination '$(DESTINATION)' \
		-quiet

test: ## Run unit tests
	xcodebuild test \
		-project $(PROJECT) \
		-scheme $(SCHEME) \
		-destination '$(DESTINATION)' \
		-quiet

lint: ## Run SwiftLint
	@if command -v swiftlint >/dev/null 2>&1; then \
		swiftlint; \
	else \
		echo "Error: SwiftLint not installed. Run 'brew install swiftlint'"; \
		exit 1; \
	fi

format: ## Run SwiftFormat (placeholder)
	@if command -v swiftformat >/dev/null 2>&1; then \
		swiftformat FutTrack/; \
	else \
		echo "Error: SwiftFormat not installed. Run 'brew install swiftformat'"; \
		exit 1; \
	fi

clean: ## Clean build artifacts
	xcodebuild clean \
		-project $(PROJECT) \
		-scheme $(SCHEME) \
		-quiet
	rm -rf ~/Library/Developer/Xcode/DerivedData