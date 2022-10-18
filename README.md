# Overview

In this project, we are going to build a Flask application to predict Boston house's price and implement CICD using Azure Pipelines.

## Project Plan

* Trello board for the project: https://trello.com/b/h2l3aabo/azure-devops-project-2
* Spreadsheet for the original and final project plan: https://docs.google.com/spreadsheets/d/1eqNchFjEEeegu5_OV40iQpWq6YAhN0QuGGe7r99RU_k/edit?usp=sharing

## Instructions

### Prerequisites
* An Azure account to login Azure Portal (https://portal.azure.com/)
* An Azure Devops account to login Azure Devops organization (https://dev.azure.com/)
* A Github account for version control and implement CICD (http://github.com/)

### How-to-use
Please follow these steps to be able to deploy our web app successfully

#### 1/ Implement CI with Github Actions
##### Architectural Diagram
![image](https://github.com/javier-caparo/Udacity-DevOps-Azure-Project-2/blob/main/images/ci-diagram.png)

In this step, you'll set up a cloud-based development structure using Azure Cloud Shell and implement CI with your Github Actions.

![azure-cloud-shell](https://user-images.githubusercontent.com/41542622/196384333-e9e38a48-e23a-4b4d-aede-3e56b87d7762.png)

* Login to Github (http://github.com/).
* Login Azure Portal (https://portal.azure.com/) and open Azure Cloud Shell (using Bash). If this is your first time using Azure Cloud Shell, just follow the first creation to setup your Cloud Shell.
* Create your ssh key to access and write data in repositories on GitHub. Run `ssh-key -t rsa` in your Cloud Shell and enter several times to apply default settings for your ssh key.
* Get your new ssh key by running `cat ~/.ssh/id_rsa.pub` to print your ssh key. Copy and add it to your Github account. For detailed instructions on how to generate & add ssh key to Github account, you can read [Github documentation](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)
* Clone this repo into Cloud Shell using `git clone git@github.com:ttanh26/AzureDevops-Udacity.git`.
##### Testing in local environment
After cloning the repo, you can do testing directly in your Cloud Shell
* Update the current working folder to make sure your working folder be `AzureDevops-Udacity`
```bash
cd AzureDevops-Udacity/
```
* Create new virtual environment for your application testing
```bash
python3 -m venv ~/.myenv
source ~/.myenv/bin/activate
```
* Install all Python dependencies listed in the `requirements.txt` file
```bash
pip install -r requirements.txt
```
> *Noted: Due to some recent updates, Azure Cloud Shell now has built-in Python 3.9 version. It may lead to conflicts when installing some specific Python dependencies listed in requirement file. To resolve that, you can temporary to remove specific version listed in the `requirements.txt` file when testing in local. But please be noted that our application will be built based on Python 3.7 in production environment. So please kindly do not change `requirements.txt` file when remote testing or deploy to Azure App Services.*

* Run `make all` to install Python dependencies, lint and test code

##### Testing in remote server with Github Actions
* Make sure that Github Action is enabled in your account. To enable Github Action, please follow the instruction [here](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/enabling-features-for-your-repository/managing-github-actions-settings-for-a-repository)
* GitHub Actions uses YAML syntax to define the workflow. Each workflow is stored as a separate YAML file in your code repository, in a directory named `.github/workflows`. In this repository, there is already have 1 defined workflow named `pythonapp`. This workflow will be triggered whenever there is a new change on this repo.
> *Noted: If you want to create another workflow for your use, please follow the instructions [here](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions)* 

For example, when you have some changes on `README.md` file. The `pythonapp` workflow will be automatically triggered and build like this:
![image](https://user-images.githubusercontent.com/41542622/196403925-6a0076c1-b1ac-4500-bb3b-4c3a6209dd02.png)

#### 2/ Implement CD with Azure Pipelines
#####
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


