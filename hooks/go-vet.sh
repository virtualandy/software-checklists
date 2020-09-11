#!/bin/sh
# https://levelup.gitconnected.com/committing-better-go-code-with-static-analysis-and-git-hooks-23216b8a1674

FILES=$(go list ./...  | grep -v /vendor/)
go fmt ${FILES}

{
  go vet ${FILES}
} || {
  exitStatus=$?

  if [ $exitStatus ]; then
    printf "\nIssues found in your code, please fix them and try again.\n"
    exit 1
  fi
}

