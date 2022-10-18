# Overview

In this project, we are going to build a Flask application to predict Boston house's price and implement CICD using Azure Pipelines.

## Project Plan

* Trello board for the project: https://trello.com/b/h2l3aabo/azure-devops-project-2
* Spreadsheet for the original and final project plan: https://docs.google.com/spreadsheets/d/1eqNchFjEEeegu5_OV40iQpWq6YAhN0QuGGe7r99RU_k/edit?usp=sharing

## Instructions

### Architectural Diagram
![image](https://github.com/javier-caparo/Udacity-DevOps-Azure-Project-2/blob/main/images/ci-diagram.png)

### Prerequisites
* An Azure account to login Azure Portal (https://portal.azure.com/)
* An Azure Devops account to login Azure Devops organization (https://dev.azure.com/)
* A Github account for version control and implement CICD (http://github.com/)

### How-to-use
Please follow these steps to be able to deploy our web app successfully

#### 1/ Setup Azure Cloud Shell as a development environment
In this step, you'll set up a cloud-based development structure using Azure Cloud Shell. You will create a Makefile, tests, and application scaffolding. Once you complete this step you will be able to test code locally in the Azure Cloud Shell. This is a local continuous integration step.

![azure-cloud-shell](https://user-images.githubusercontent.com/41542622/196384333-e9e38a48-e23a-4b4d-aede-3e56b87d7762.png)

* Create a new Github repo. Create new Github repo using your Github account
* 
<TODO:  Instructions for running the Python project.  How could a user with no context run this project without asking you for any help.  Include screenshots with explicit steps to create that work. Be sure to at least include the following screenshots:

* Project running on Azure App Service

* Project cloned into Azure Cloud Shell

* Passing tests that are displayed after running the `make all` command from the `Makefile`

* Output of a test run

* Successful deploy of the project in Azure Pipelines.  [Note the official documentation should be referred to and double checked as you setup CI/CD](https://docs.microsoft.com/en-us/azure/devops/pipelines/ecosystems/python-webapp?view=azure-devops).

* Running Azure App Service from Azure Pipelines automatic deployment

* Successful prediction from deployed flask app in Azure Cloud Shell.  [Use this file as a template for the deployed prediction](https://github.com/udacity/nd082-Azure-Cloud-DevOps-Starter-Code/blob/master/C2-AgileDevelopmentwithAzure/project/starter_files/flask-sklearn/make_predict_azure_app.sh).
The output should look similar to this:

```bash
udacity@Azure:~$ ./make_predict_azure_app.sh
Port: 443
{"prediction":[20.35373177134412]}
```

* Output of streamed log files from deployed application

> 

## Enhancements

<TODO: A short description of how to improve the project in the future>

## Demo 

<TODO: Add link Screencast on YouTube>


