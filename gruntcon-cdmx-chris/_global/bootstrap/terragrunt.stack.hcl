locals {
  // Read from parent configurations instead of defining these values locally
  // so that other stacks and units in this directory can reuse the same configurations.
  account_hcl = read_terragrunt_config(find_in_parent_folders("account.hcl"))
}

stack "bootstrap" {
  source = "github.com/gruntwork-io/terragrunt-scale-catalog//stacks/aws/github/pipelines-bootstrap?ref=v1.8.0"
  path   = "bootstrap"

  values = {
    terragrunt_scale_catalog_ref = "v1.8.0"

    aws_account_id = "636155394402"

    oidc_resource_prefix = "pipelines"

    github_org_name  = "phamcp"
    github_repo_name = "infra-live"
    deploy_branch = "main"

    state_bucket_name = local.account_hcl.locals.state_bucket_name



    // =========================================================================
    // Import Variables
    //
    // The following variables are used to import existing AWS resources into
    // OpenTofu/Terraform state. Once the stack has been applied and resources
    // have been successfully imported, it is safe to remove this entire section.
    // =========================================================================
    oidc_provider_import_arn = "arn:aws:iam::636155394402:oidc-provider/token.actions.githubusercontent.com"
    plan_iam_role_import_existing = true
    plan_iam_policy_import_arn = "arn:aws:iam::636155394402:policy/pipelines-plan"
    plan_iam_role_policy_attachment_import_arn = "pipelines-plan/arn:aws:iam::636155394402:policy/pipelines-plan"
    apply_iam_role_import_existing = true
    apply_iam_policy_import_arn = "arn:aws:iam::636155394402:policy/pipelines-apply"
    apply_iam_role_policy_attachment_import_arn = "pipelines-apply/arn:aws:iam::636155394402:policy/pipelines-apply"
    // =========================================================================
    // End Import Variables
    // =========================================================================

  }
}
