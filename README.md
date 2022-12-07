# Overview

In this project, we are going to build a Flask application to predict Boston house's price and implement CICD using Azure Pipelines.

# Project Plan

* Trello board for the project: https://trello.com/b/h2l3aabo/azure-devops-project-2
* Spreadsheet for the original and final project plan: https://docs.google.com/spreadsheets/d/1eqNchFjEEeegu5_OV40iQpWq6YAhN0QuGGe7r99RU_k/edit?usp=sharing

# Instructions

## Prerequisites
* An Azure account to login Azure Portal (https://portal.azure.com/)
* An Azure Devops account to login Azure Devops organization (https://dev.azure.com/)
* A Github account for version control and implement CICD (http://github.com/)

## Implement CI with Github Actions
### Architectural Diagram
![image](https://github.com/javier-caparo/Udacity-DevOps-Azure-Project-2/blob/main/images/ci-diagram.png)

### Instructions
In this step, you'll set up a cloud-based development structure using Azure Cloud Shell and implement CI with your Github Actions.

![azure-cloud-shell](https://user-images.githubusercontent.com/41542622/196384333-e9e38a48-e23a-4b4d-aede-3e56b87d7762.png)

* Login to Github (http://github.com/).
* Login Azure Portal (https://portal.azure.com/) and open Azure Cloud Shell (using Bash). If this is your first time using Azure Cloud Shell, just follow the first creation to setup your Cloud Shell.
* Create your ssh key to access and write data in repositories on GitHub. Run `ssh-key -t rsa` in your Cloud Shell and enter several times to apply default settings for your ssh key.
* Get your new ssh key by running `cat ~/.ssh/id_rsa.pub` to print your ssh key. Copy and add it to your Github account. For detailed instructions on how to generate & add ssh key to Github account, you can read [Github documentation](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)
* Clone this repo into Cloud Shell using `git clone git@github.com:ttanh26/AzureDevops-Udacity.git`.
### Testing in local environment
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

### Testing in remote server with Github Actions
* Make sure that Github Action is enabled in your account. To enable Github Action, please follow the instruction [here](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/enabling-features-for-your-repository/managing-github-actions-settings-for-a-repository)
* GitHub Actions uses YAML syntax to define the workflow. Each workflow is stored as a separate YAML file in your code repository, in a directory named `.github/workflows`. In this repository, there is already have 1 defined workflow named `pythonapp`. This workflow will be triggered whenever there is a new change in this repo.
> *Noted: If you want to create another workflow for your use, please follow the instructions [here](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions)* 

For example, when you have some changes on `README.md` file. The `pythonapp` workflow will be automatically triggered and build like this:
![image](https://user-images.githubusercontent.com/41542622/196403925-6a0076c1-b1ac-4500-bb3b-4c3a6209dd02.png)

## Implement CD with Azure Pipelines
### Architecture diagram
![CD flows](cd-diagram.png)

### Instructions
#### Manually deploy Web App
Before implementing CD with Azure Pipelines, we need to deploy the web application first. If not, the CD flows can not run successfully.

To create a new web app, make sure that your terminal is connecting with Azure Portal and your current working folder is your root folder. Then, you can execute `host_webapp.sh` script to deploy your web application to Azure.
Or, you can run the below command:
`az webapp up -n <name of webapp> --location southcentralus --sku B1 --runtime "Python3.7"`

#### Setup Azure Pipelines
Please follow these steps to successfully setup Continuous Delivery with Azure Pipelines
* Login to Azure Devops with your Azure account. If this is your first time using Azure Devops, you will need to create an organization to manage your pipelines. 
* In your new organization, go to Organization settings --> Policies to enable `Allow public projects` option.
* Create new project with your custom name (i.e: azuredevops-proj2) with public mode.
* Go to Project settings --> service connection and create a new service connection named `myserviceconnection` with Azure Resource Manager type. For detailed instructions, please check out the Youtube link below.
* If you're using Udacity Cloud lab for this project, you will have to create a Linux self-hosted agent to be able to run Azure Pipelines. For instructions on how to create self-hosted agent, you can check out [here](https://learn.microsoft.com/en-us/azure/devops/pipelines/agents/v2-linux?view=azure-devops) or you can follow the instructions in the Youtube link.

* In your Project in Azure Devops, go to `Pipelines` --> `New Pipeline` --> `Github` --> `Select your repo` --> `Existing Azure Pipeline YAML File` --> choose your brach (i.e: `master`) & choose path to `azure-pipeline.yaml` file --> `Continue` 
> *Note: In case you're using different name for agent pool, service connection or web application, you need to follow TODO comment to update your new resource's name to this YAML file.*

* Choose `Save and run` to save your latest changes for this pipeline and run the pipeline. Your pipeline will start to run

* Whenever a new change is updated to this repo, it will triggered the pipeline running again to deploy new change to your application

* After the deployment is successfully, you can check your web app running via the URL `https://<name of webapp>.azurewebsites.net`, with `<name of webapp>` is the name of web application you deployed manualy earlier.

* Update the file make_predict_azure_app.sh with your webapp service end point (your web app URL)

* Run `make_predict_auzre_app.sh` script to start make prediction using your flask application. The response would be something like below

* Execute a Load Testing with Locust by running the `loadtest.sh` script:
```bash
./loadtest.sh
```

* To look deeper for how your web app is running under the hood, you can check the log tail with `az webapp log tail -n <name of webapp> -g <resrouce-group-id>` command or with the Azure Portal

## Enhancements

<TODO: A short description of how to improve the project in the future>

## Demo 

<TODO: Add link Screencast on YouTube>
