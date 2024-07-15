#!/bin/bash

SECRET_KEY_BASE=$(gcloud secrets versions access latest --secret=SECRET_KEY_BASE)
DB_HOST=$(gcloud secrets versions access latest --secret=DB_HOST)
DB_USER=$(gcloud secrets versions access latest --secret=DB_USER)
DB_PASSWORD=$(gcloud secrets versions access latest --secret=DB_PASSWORD)

sed -e "s/__SECRET_KEY_BASE/$SECRET_KEY_BASE/g" \
    -e "s/__DB_HOST/$DB_HOST/g" \
    -e "s/__DB_USER/$DB_USER/g" \
    -e "s/__DB_PASSWORD/$DB_PASSWORD/g" \
    "app.yaml.tmp" > "app.yaml"

gcloud app deploy --quiet --verbosity=debug