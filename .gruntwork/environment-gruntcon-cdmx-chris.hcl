environment "gruntcon-cdmx-chris" {
  filter {
    paths = ["gruntcon-cdmx-chris/*"]
  }

  authentication {
    aws_oidc {
      account_id         = "636155394402"
      plan_iam_role_arn  = "arn:aws:iam::636155394402:role/pipelines-plan"
      apply_iam_role_arn = "arn:aws:iam::636155394402:role/pipelines-apply"
    }
  }
}
