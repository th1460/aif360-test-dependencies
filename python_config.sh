#!/bin/bash

pip3 install virtualenv
echo "VIRTUALENV INSTALLED!"

virtualenv venv
echo "VIRTUALENV CREATED!"

source venv/bin/activate
echo "VIRTUALENV ACTIVATED!"