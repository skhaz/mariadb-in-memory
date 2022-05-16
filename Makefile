.PHONY: mariadb

mariadb:
	@docker stop mariadb > /dev/null 2>&1 || true
	@docker rm mariadb > /dev/null 2>&1 || true
	@docker run --interactive --tty --rm --name mariadb \
		--mount type=tmpfs,destination=/var/lib/mysql \
		--publish 3306:3306 \
		--env MYSQL_ALLOW_EMPTY_PASSWORD=1 \
		--env MYSQL_INNODB_IO_CAPACITY=400 \
		wodby/mariadb:10.4
