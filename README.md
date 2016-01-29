# prime8base-cookbook

This cookbook is to configure the base instance for prime 8 consulting's applications.
The ubuntu build includes meteor-angular and dependencies as well as a few packages 
useful for system administration.

## Supported Platforms

ubuntu 14.04, windows 2012

## Attributes

## Usage

### prime8base::default

Include `prime8base` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[prime8base::default]"
  ]
}
```
## Development Set Up
Kitchen is the test suite for Chef, and in this cookbook we're using the kitchen-docker driver.
Benefits of kitchen-docker include speed and platform independence. After pulling the repo, you 
must have the chef-dk installed and run `bundle install`. 

Add your user to the docker group with `sudo adduser yourusername docker` to enable the docker
daemon to run. 

To authenticate with AWS with shared credentials ini file at ~/.aws/credentials. You can specify multiple profiles in this file and select one with the AWS_PROFILE environment variable or the shared_credentials_profile driver config. Read this for more information 

## License and Authors

Author:: Ele Mooney (<ellenm@prime8consulting.com>)
