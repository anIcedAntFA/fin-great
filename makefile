c_m: 
	# creates a new migration
	migrate create -ext sql -dir db/migrations -seq $(name)

p_up: 
	# postgres up - creates postgres server
	docker-compose up -d

p_down: 
	# postgres down - delete postgres server
	docker-compose down

db_up:
	docker exec -it fingreat_postgres createdb --username=root --owner=root fingreat_db

db_down:
	docker exec -it fingreat_postgres dropdb --username=root  fingreat_db

m_up:
	# run migrate up
	migrate -path db/migrations -database "postgres://root:secret@localhost:5432/fingreat_db?sslmode=disable" up

m_down:
	# run migrate down
	migrate -path db/migrations -database "postgres://root:secret@localhost:5432/fingreat_db?sslmode=disable" down

sqlc:
	sqlc generate