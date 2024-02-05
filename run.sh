# create secrutity files
# create polices

aws iam create-role \
    --role-name lambda-ex \
    --assume-role-policy-document file://polices.json \
| tee logs/role.log 


# zip file
zip function.zip index.js

# create lambda func
aws lambda create-function \
    --function-name hello-cli \
    --zip-file fileb://function.zip \
    --handler index.handler \
    --runtime nodejs18.x \
    --role arn:aws:iam::271526550953:role/lambda-ex \
    | tee logs/lambda-create.log 

# invoke lambda
aws lambda invoke \
    --function-name hello-cli \
    --log-type Tail \
    logs/lambda-exec.log 

# zip file
zip function.zip index.js


# update lambda func
aws lambda update-function-code \
    --zip-file fileb://function.zip \
    --function-name hello-cli \
    --publish \
    | tee logs/lambda-update.log


# invoke lambda
aws lambda invoke \
    --function-name hello-cli \
    --log-type Tail \
    logs/lambda-exec.log

# delete lambda func
aws lambda delete-function \
    --function-name hello-cli

# delete role
aws iam delete-role \
    --role-name lambda-ex
    