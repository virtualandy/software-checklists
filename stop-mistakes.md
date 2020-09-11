# Checklist - is our code looking correct?

[Overview of go vet](https://golang.org/cmd/vet/)

## Step 1: Make a Mistake

Update `hello.go` with something like:

```golang

var thing string
```

But don't use that variable. And make the formatting wrong (without your IDE auto formatting for you,
which can be tricker than it sounds :) ).

## Step 2: Check for Mistakes

```
#!/bin/sh
#

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
```

Write that to `.git/hooks/pre-commit` and then `chmod +x .git/hooks/pre-commit`

## Step 3: Try your best to make a mistake

```
git commit -a -m ":yolo:"
```
