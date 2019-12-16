# Chef cookbook action
This action performs the standard set of tasks on a chef cookbook. It is reusable, meant to be called multiple times in a workflow, pattered after how the terraform github action is structured. 

Currently working: 

* cookstyle -  https://github.com/chef/cookstyle
* foodcritic - https://foodcritic.io

Planned:
* rspec
* kitchen test
* some form of bump/tag (stove?)
* berks install/upload

## Secrets
* cloud secrets for kitchen
* 

## Inputs
 none. We expect you to deviate from the default behavior of the tools via a checked-in `.rubocop.yml` or setting `FC*` environment variables for foodcritic.
 
 ## Outputs
 none. The Action commands will either all exit cleanly or will throw a non-zero RC and log their complaint.  Fix it or Mask it and try again.
 
 ## Example usage
 
 Fast linting on any branch/commit
 ```yaml
 name: Unit
 uses: FastRobot/chef-cookbook-action@v0.1.0
 with:
  chef_actions_command: 'rspec'
```

Full kitchen create/converge/verify/destroy cycle, optionally using other cloud resources
```yaml
name: Integration
uses: FastRobot/chef-cookbook-action@v0.1.0
with:
  chef_action_command: 'kitchen test -d always'
env:
  AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
  AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
```
