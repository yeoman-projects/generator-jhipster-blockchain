CHANNEL_NAME="$1"
DELAY="$2"
CC_SRC_LANGUAGE="$3"
TIMEOUT="$4"
VERBOSE="$5"
NO_CHAINCODE="$6"
: ${CHANNEL_NAME:="diplomas"}
: ${DELAY:="3"}
: ${CC_SRC_LANGUAGE:="go"}
: ${TIMEOUT:="10"}
: ${VERBOSE:="false"}
: ${NO_CHAINCODE:="false"}
CC_SRC_LANGUAGE=`echo "$CC_SRC_LANGUAGE" | tr [:upper:] [:lower:]`
COUNTER=1
MAX_RETRY=20
PACKAGE_ID=""

export PATH=${PWD}/../../bin:${PWD}/../:$PATH
export FABRIC_CFG_PATH=${PWD}/../

if [ "$CC_SRC_LANGUAGE" = "go" -o "$CC_SRC_LANGUAGE" = "golang" ]; then
	CC_RUNTIME_LANGUAGE=golang
	CC_SRC_PATH="github.com/hyperledger/fabric-samples/chaincode/ugachaincode/go"
fi

. scripts/utils.sh

## Test chaincodeQueryHash function
echo "Test chaincodeQueryHash function..."
chaincodeQueryHash 0 1 hashtotest VALID

exit 0
