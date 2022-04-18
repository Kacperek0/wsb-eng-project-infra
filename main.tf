module "policy" {
    source = "./modules/roles"
}

module "users" {
    source = "./modules/user"

    for_each = toset(var.users)

    name = each.key
    policy_arn = module.policy.policy_arn
}
