.PHONY: up
up: 
	@ echo "\033[32m"[Execute CMD]"\033[0m \033[33m"COMPOSE_PROFILES=hive,impala,dbt,airflow docker-compose -f docker-compose.yml up --build -d --remove-orphans"\033[0m"
	COMPOSE_PROFILES=hive,impala,dbt,airflow docker-compose -f docker-compose.yml up --build -d --remove-orphans
	@ echo ""
	@ echo "##########################################"
	@ echo "Container Hosts"
	@ echo ""
	@ echo "# Hadoop #################################"
	@ echo "\033[32m"[namenode] localhost:9870"\033[0m"
	@ echo "\033[32m"[datanode] localhost:9864"\033[0m"
	@ echo ""
	@ echo "# Hive ###################################"
	@ echo "\033[32m"[hive] localhost:10002"\033[0m"
	@ echo ""
	@ echo "# trino ###################################"
	@ echo "\033[32m"[trino] localhost:8080"\033[0m"
	@ echo ""
	@ echo "# airflow #################################"
	@ echo "\033[32m"[airflow] localhost:8888"\033[0m"
	@ echo ""
	@ echo "##########################################"


.PHONY: down
down:
	@ echo "[\033[32m"[Execute CMD]"\033[0m \033[33m"docker compose -f docker-compose.yml --profile '*' down"\033[0m"
	docker compose -f docker-compose.yml --profile '*' down

.PHONY: delete.all
delete.all:
	@ echo "[\033[32m"[Execute CMD]"\033[0m \033[33m"docker compose -f docker-compose.yml --profile '*' down"\033[0m"
	docker compose -f docker-compose.yml --profile '*' down -v --rmi all
	@ echo "[\033[32m"[Execute CMD]"\033[0m \033[33m"remove ./mnt/hadoop/*, ./mnt/mysql/*, ./mnt/schematool-check/* ./mnt/airflow/*"\033[0m"
	rm -rf ./mnt/hadoop/* ./mnt/mysql/* ./mnt/schematool-check/* ./mnt/airflow/*