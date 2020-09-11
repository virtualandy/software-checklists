# Step 1: Try to be sneaky

Create a file like `env.example`.
Add some secrets to it:

```
AWS_ACCESS_KEY_ID=AKIAZOO32XLEOWBB8007
AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
ADMIN_SECRET=password123
```

# Step 2: Close the loophole

Install the secrets - see https://github.com/awslabs/git-secrets/blob/master/README.rst if you haven't already.

Make it double secure:
```
git secrets --add '.*SECRET\s*=\s*.+'
```

# Step 3: Check your work

```
git secrets --scan env.example
```

