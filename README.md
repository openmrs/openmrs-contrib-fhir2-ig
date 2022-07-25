# OpenMRS FHIR2 Module Implementation Guide

This is the source code for the Implementation Guide for the OpenMRS FHIR2 module.

## Overview
See Published IG [here](https://fhir.openmrs.org/): 

### Building Locally
1. Install nodejs   
   https://nodejs.org/en/download/


2. Install Ruby and Ruby gems  
https://www.ruby-lang.org/en/documentation/installation/

3. Install Jekyll gem

        gem install jekyll

4. Install Sushi

        npm install -g fsh-sushi
        sushi --help

4. Install Java   
https://java.com/en/download/help/download_options.html

5. Update IG Publisher

         ./_updatePublisher.sh

6. Run IG Publisher

        ./_genonce.sh

7. Open Published IG Static files under the `./output/` folder and view the built IG in the Browser.
   
