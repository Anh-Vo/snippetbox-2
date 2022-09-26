
# Build the docker file and create a volume to hold our snippet data
docker:
	@echo "Building mysql docker container"
	docker build -f ./db/mysql/Dockerfile -t letsgo/mysql:latest .
	docker volume create snippetbox

clean-docker:
	@echo "WARNING: Deleting the snippetbox volume will destroy all data!" 
	@read -p "Are you sure? " -n 1 -r; \
	if [[ $$REPLY =~ ^[Yy] ]]; \
	then \
		echo "\nHere goes nothing...\n"; \
		docker volume rm snippetbox; \
	fi

# Start the letsgo-mysql container 
dbup:
	@echo "Starting letsgo-mysql container"
	docker run -d --rm -p 3306:3306 -v snippetbox:/var/lib/mysql --name letsgo-mysql letsgo/mysql

# Stop the letsgo-mysql container
dbdown:
	@echo "Shutting down letsgo-mysql"
	docker stop letsgo-mysql

# Run the latest version of our server
server:
	go run ./cmd/web

# Verify all module checksums
verify:
	go mod verify

.PHONY: docker dbup dbdown server verify