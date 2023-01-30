<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ecr_lifecycle_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_lifecycle_policy) | resource |
| [aws_ecr_repository.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [aws_ecr_repository_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository_policy) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.only_pull](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.push_and_pull](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_image_tag_mutability"></a> [image\_tag\_mutability](#input\_image\_tag\_mutability) | Whether images are allowed to overwrite existing tags. | `string` | `"MUTABLE"` | no |
| <a name="input_max_tagged_image_count"></a> [max\_tagged\_image\_count](#input\_max\_tagged\_image\_count) | The maximum number of tagged images that you want to retain in repository. | `number` | `30` | no |
| <a name="input_max_untagged_image_count"></a> [max\_untagged\_image\_count](#input\_max\_untagged\_image\_count) | The maximum number of untagged images that you want to retain in repository. | `number` | `1` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the repository. | `string` | n/a | yes |
| <a name="input_only_pull_accounts"></a> [only\_pull\_accounts](#input\_only\_pull\_accounts) | AWS accounts which pull only. | `list(string)` | `[]` | no |
| <a name="input_push_and_pull_accounts"></a> [push\_and\_pull\_accounts](#input\_push\_and\_pull\_accounts) | AWS accounts which push and pull. | `list(string)` | `[]` | no |
| <a name="input_scan_on_push"></a> [scan\_on\_push](#input\_scan\_on\_push) | Whether images should automatically be scanned on push or not. | `bool` | `false` | no |
| <a name="input_tag_prefix_list"></a> [tag\_prefix\_list](#input\_tag\_prefix\_list) | List of image tag prefixes on which to take action with lifecycle policy. | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags for the ECR Repository | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ecr_repository_arn"></a> [ecr\_repository\_arn](#output\_ecr\_repository\_arn) | Full ARN of the repository. |
| <a name="output_ecr_repository_name"></a> [ecr\_repository\_name](#output\_ecr\_repository\_name) | The name of the repository. |
| <a name="output_ecr_repository_registry_id"></a> [ecr\_repository\_registry\_id](#output\_ecr\_repository\_registry\_id) | The registry ID where the repository was created. |
| <a name="output_ecr_repository_url"></a> [ecr\_repository\_url](#output\_ecr\_repository\_url) | The URL of the repository (in the form aws\_account\_id.dkr.ecr.region.amazonaws.com/repositoryName) |
<!-- END_TF_DOCS -->