#!/bin/bash

USERID=$(id -u)
package=$@
dnf list installed $package
if [ $? -ne 0 ]; then
    echo "Uninstalling $package"
    dnf remove $package -y
else
    echo "$package not yet installed"
fi