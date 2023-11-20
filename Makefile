postgres:
	docker run --name postgres15 -p 3333:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=appak -d postgres:15-alpine

createdb:
	docker exec -it postgres15 createdb --username=root --owner=root my_bank

dropdb:
	docker exec -it postgres15 dropdb my_bank

migrateup:
	migrate -path db/migration -database "postgresql://root:appak@localhost:3333/my_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:appak@localhost:3333/my_bank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

test:
	go test -v -cover ./...

.PHONY: postgres createdb dropdb migrateup migratedown sqlc test