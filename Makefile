help: ## Display this help screen
	@grep -h \
		-E '^[a-zA-Z_0-9-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

login_db: ## if need use pswd:
	@psql -h localhost -U postgres

start_explorer_local: ## start explorer locally
	@docker compose -f docker-compose-explorer-local.yml up -d

start_explorer_mainnet: ## start explorer mainnet
	@docker compose -f docker-compose-explorer-mainnet.yml up -d


start_zkstack: ## start zkstack
	@docker compose -f docker-compose-zkstack.yml up -d

clear: ## clear docker
	docker compose down --volumes
	docker compose pull


.PHONY: clippy fmt test
