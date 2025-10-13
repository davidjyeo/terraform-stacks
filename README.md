## Instructions

### STEP 1: Setup the Entra ID Application

#### STEP 1.1: Update `terraform.tfvars`

The Setup module is located in the `src\terraform\setup` folder. You need to update the values in the `terraform.tfvars` file before running `terraform apply` on this module.

1. `organization` should match your HCP Terraform Cloud Organization
2. `application_name` should match your HCP Terraform Cloud Project Name
3. `service_name` will be used along with `application_name` to build the fully qualified stack name.

For example, if:
- `application_name=contoso` and,
- `service_name=product1` 

Then, the stack name will be `contoso-product1`

4. `dev_subscription` should be the Azure Subscription where your Development environment will be deployed to.
5. `prod_subscription` should be the Azure Subscription where your Production environment will be deployed to.

#### STEP 1.2: Run Terraform Apply

From the terminal in VS Code run the following commands:

```
cd ./src/terraform/setup
az login
terraform init
terraform apply
```

### STEP 2: Configure the Stack

#### STEP 2.1: Update the `deployments.tfdeploy.hcl`

The Terraform Stacks deployments are centrally managed from the `deployments.tfdeploy.hcl` file in the root directory.

First, update the locals. Start with updating the `tenant_id` to match your Entra ID Tenant. If you want to change the `primary_location` you can do so. However, the `application_name` must match what you entered in STEP 1.1.

Next, update the `client_id` for the application created in STEP 1.2.

Finally, update the `subscription_id` for both the `dev` and `prod` deployment blocks.

### STEP 3: Run `terraform stacks init`

terraform login
terraform stacks init

You'll need to ensure you have the Terraform Stacks beta installed otherwise the command `terraform stacks init` will not be recognized. I highly recommend installing `tfenv` so you can install and switch between different terraform versions.

### STEP 4: Commit to main and go watch Terraform Cloud work!!!