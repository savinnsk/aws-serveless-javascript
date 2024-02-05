# create secrutity files
# create polices

aws iam create-role \
    --role-name lambda-ex \
    --assume-role-policy-document file://polices.json \
| tee logs/role.log 


# zip file
zip function.zip src/index.js