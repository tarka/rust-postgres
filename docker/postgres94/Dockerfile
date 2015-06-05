FROM postgres:9.4

COPY pg_hba.conf /

COPY setup.sql /
COPY init-test-db.sh /docker-entrypoint-initdb.d/
