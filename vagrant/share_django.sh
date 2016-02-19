#!/bin/bash

ME=$(whoami)
vagrant share --http 8000 --domain vagrant.into.uk.com --name $ME-plugins-django
