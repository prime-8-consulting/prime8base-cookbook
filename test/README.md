## How To Run Tests

The test utility we're using is Kitchen, and we have two drivers installed for our tests.
The first is docker, which is useful for local dev of cookbook configuration. The second
is the ec2 kitchen driver; it will launch an instance and run serverspec tests on the ami
in our own aws account, then tear down the server. 

The first kind of test is configured on our own dev boxes and runs with a configuration
in the .kitchen.yml, the second takes a configuration file with your aws credentials to
launch, test, and destroy and instance in AWS. 


