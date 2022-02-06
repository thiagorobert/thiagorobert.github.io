#!/bin/sh

set -e

git add .
git commit -m "Add today's post."
git push
