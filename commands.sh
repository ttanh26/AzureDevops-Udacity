#!/usr/bin/env bash
az webapp up -n flask-app-ml --location eastus --sku B1 --runtime "Python:3.7" --os "Linux"