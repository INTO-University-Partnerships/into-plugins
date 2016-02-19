#!/bin/bash

ME=$(whoami)
vagrant share --http 80 --domain vagrant.into.uk.com --name $ME-plugins-moodle
