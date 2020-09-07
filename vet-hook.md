# Checklist - is our code looking correct?

[Overview](https://golang.org/cmd/vet/)


```
#!/bin/sh
#

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

