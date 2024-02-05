# create secrutity files
# create polices

aws iam create-role \
    --role-name lambda-ex \
    --assume-role-policy-document file://polices.json \
| tee logs/role.log 


# zip file
zip function.zip src/index.js


aws lambda create-function \
    --function-name hello-cli \
    --zip-file fileb://function.zip \
    --handler index.handler \
    --runtime nodejs20.x \
    --role arn:aws:iam::271526550953:role/lambda-ex \
    | tee logs/lambda-create.log 
