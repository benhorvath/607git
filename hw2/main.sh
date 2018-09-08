#!/usr/bin/env bash

Rscript generate_reviews.R

# # Set up PSQL
# brew install postgres
# pg_ctl -D /usr/local/var/postgres start

createdb -h localhost bmh607
psql -d bmh607 -f create_insert.sql
Rscript -e "rmarkdown::render('hw2.Rmd', output_format='html_document')"