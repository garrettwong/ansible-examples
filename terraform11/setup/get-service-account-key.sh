#!/bin/sh

SA_NAME=terraform-sa
SA_DISPLAY_NAME="Terraform service account"

PROJECT_ID=$(gcloud config get-value core/project)

gcloud iam service-accounts create $SA_NAME --display-name "$SA_DISPLAY_NAME"
gcloud iam service-accounts keys create sa-key.json --iam-account $SA_NAME@${PROJECT_ID}.iam.gserviceaccount.com
gcloud projects add-iam-policy-binding ${PROJECT_ID} --member "serviceAccount:${SA_NAME}@${PROJECT_ID}.iam.gserviceaccount.com" --role "roles/editor"

export GOOGLE_APPLICATION_CREDENTIALS="sa-key.json"

