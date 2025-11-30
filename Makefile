.PHONY: help build run export export-images clean

# Default target
help:
	@echo "Medium Post Exporter - Available Commands"
	@echo ""
	@echo "  make build          Build the Docker image"
	@echo "  make run            Run with default options (markdown only)"
	@echo "  make export         Export posts (markdown only)"
	@echo "  make export-images  Export posts with images"
	@echo "  make clean          Remove Docker containers and images"
	@echo ""
	@echo "Environment Variables:"
	@echo "  RAPIDAPI_KEY        Your RapidAPI key (required)"
	@echo "  USERNAME            Medium username (default: mister.funable)"
	@echo ""
	@echo "Example:"
	@echo "  RAPIDAPI_KEY=your-key USERNAME=some-user make export-images"

# Default values
USERNAME ?= mister.funable

# Build the Docker image
build:
	docker-compose build

# Run with default options
run: build
	docker-compose run --rm medium-exporter

# Export markdown only
export: build
	docker-compose run --rm medium-exporter python fetch_medium_posts.py \
		--username $(USERNAME) \
		--prepend-order

# Export with images
export-images: build
	docker-compose run --rm medium-exporter python fetch_medium_posts.py \
		--username $(USERNAME) \
		--download-images \
		--prepend-order

# Clean up Docker resources
clean:
	docker-compose down --rmi local --volumes --remove-orphans

