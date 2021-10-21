### Introduction
This is a starting point for all Terraform deployable configuations into Nebula 2.0 environments. Using this template gets you started with a model that will work across multiple regions, use best practices, and utilize standard shared modules.

### Included Out of the Box

#### Terraform Remote State
In Nebula 2.0 each application no longer needs to create their own S3 remote state and DynamoDB for locking. In each account there is already a central bucket and DynamoDB table created. This is preconfigured for you in [scripts/entrypoint.bash](scripts/entrypoint.bash)

### Getting Started
Pre-req - Create a new repo (named `<app-name>-terraform`) from this template repo.

1) Replace all instances of `###PROJECT_NAME###` with your repo name. Should be something like app-name-terraform.
2) Replace all instances of `###VERTICAL_NAME###` with the application's vertical name.
3) Rename `terraform/modules/my-app` to the name of your app.
4) Find the latest version of core-info and update the instance in `terraform/main.tf`.
5) Create your resources in `terraform/modules/my-app/main.tf`. Feel free to reorganize files in this directory as you see fit. Keep in mind that it is best to group resources in files (or even sub-modules) by function, not by AWS service. For example, don't create a file called kinesis.tf and put all Kinesis streams in it. Put them in a file that describes the functionality, e.g. `ingest-pipeline.tf`.

## Future Work
Future work will automate some of the above steps, namely 1, 2, 3, and 4.
