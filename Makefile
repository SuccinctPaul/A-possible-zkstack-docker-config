help: ## Display this help screen
	@grep -h \
		-E '^[a-zA-Z_0-9-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

login_db: ## if need use pswd:
	@psql -h localhost -U postgres

start: ##
	@docker compose -f docker-compose-NodleCode.yml up -d


start_zkstack: ##
	@docker compose -f docker-compose-zkstack.yml up -d



.PHONY: clippy fmt test
