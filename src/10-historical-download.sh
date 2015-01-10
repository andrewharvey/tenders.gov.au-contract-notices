#!/bin/sh

mkdir -p downloads

wget --directory-prefix downloads --no-clobber 'http://data.gov.au/dataset/5c7fa69b-b0e9-4553-b8df-2a022dd2e982/resource/3ea0631b-7715-49fa-9bba-64717e22ae1b/download/austendercndatabase1jul07to31dec13.zip'
unzip downloads/austendercndatabase1jul07to31dec13.zip

wget --directory-prefix downloads --no-clobber 'http://data.gov.au/storage/f/2013-05-12T175745/tmpT8I11_All_GaPS_Contracts.xlsx'
localc --invisible --convert-to csv downloads/tmpT8I11_All_GaPS_Contracts.xlsx

