**Infrastructure :**

<img width="100%" alt="Infra " src="https://github.com/arunesh04/Stream_Application_Infra/assets/108666502/1c61a0d5-4bec-4842-b03f-0630c9177084">
# Terraform Infrastructure Deployment

This repository contains the Terraform configuration files for deploying and managing an AWS Infrastructure for Data Streaming Application with various lambdas to perform CRUD operations and Dynamo DB as Database. 
AWS Kinesis is used for effective streaming of the data from the Producer to Consumer. 

## Getting Started

To get started with deploying infrastructure using Terraform, follow these steps:

1. **Install Terraform**: If you haven't already installed Terraform, follow the [official installation guide](https://learn.hashicorp.com/tutorials/terraform/install-cli) for your operating system.

2. **Clone Repository**: Clone this repository to your local machine using Git:

    ```bash
    git clone https://github.com/your-username/terraform-infrastructure.git
    ```

3. **Configure Credentials**: If deploying infrastructure on a cloud platform (e.g., AWS, Azure, GCP), ensure that you have the necessary credentials configured locally. Refer to the documentation of the respective cloud provider for instructions on obtaining and configuring credentials.

4. **Initialize Terraform**: Initialize Terraform within the cloned repository directory:

    ```bash
    cd terraform-infrastructure
    terraform init
    ```

    This command initializes Terraform and installs any necessary plugins based on the provider configurations defined in the Terraform files.

## Deployment Workflow

Once you've initialized Terraform and configured your credentials, you can deploy infrastructure using the following workflow:

1. **Plan Deployment**: Generate an execution plan to preview the changes that Terraform will make to the infrastructure:

    ```bash
    terraform plan
    ```

    This command will perform a dry-run of the Terraform configuration and output a summary of the actions that will be taken.

2. **Review Plan**: Review the execution plan generated by Terraform. Ensure that the planned actions align with your expectations and requirements.

3. **Apply Changes**: Apply the Terraform configuration to create, update, or delete infrastructure resources:

    ```bash
    terraform apply
    ```

    Terraform will prompt for confirmation before making any changes. Review the proposed changes and type `yes` to proceed with the deployment.

4. **Verify Deployment**: Once the deployment is complete, verify that the infrastructure has been provisioned correctly. You can also use the cloud provider's management console or CLI to inspect the deployed resources.

## Customization

You can customize the Terraform configuration files (`dev/variables.tf`) in this repository to suit your specific infrastructure requirements. Modify the resource definitions, configuration parameters, and variable values as needed.

## Contributing

Contributions to this repository are welcome! If you have any suggestions, improvements, or bug fixes, feel free to open an issue or submit a pull request.
