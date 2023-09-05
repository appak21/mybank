postgres:
	docker run --name postgres15 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=appak -d postgres:15-alpine

createdb:
	docker exec -it postgres15 createdb --username=root --owner=root my_bank

dropdb:
	docker exec -it postgres15 dropdb my_bank

migrateup:
	migrate -path db/migration -database "postgresql://root:appak@localhost:5432/my_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:appak@localhost:5432/my_bank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

.PHONY: postgres createdb dropdb migrateup migratedown sqlc