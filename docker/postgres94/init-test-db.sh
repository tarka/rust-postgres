#!/bin/bash

echo "#### Initialise test DB ####"

cp /pg_hba.conf /var/lib/postgresql/data/
gosu postgres postgres --single postgres -j < /setup.sql

echo
echo "#### Test DB initialised ####"
