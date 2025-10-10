#!/bin/bash

set -e

error(){

}
trap error ERR

echo "Hello.."
echo "Before error"
asdfasf:;;;dasd #here shell understatnds there is an error and signal is ERR 
echo "After error"