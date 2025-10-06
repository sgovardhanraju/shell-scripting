#!/bin/bash

USERID=$(id -u)
dnf remove mysql -y
dnf remove nginx -y
dnf remove mongodb -y
dnf remove python3 -y
dnf remove nodejs -y