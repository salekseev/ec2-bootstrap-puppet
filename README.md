h3. Pre-requisites:
- Git clone this repo.

- Need a read only IAM role (in our case 'saltmaster') configured like:
```
{
    "Statement": [
        {
            "Action": [
                "ec2:DescribeInstances"
            ],
            "Effect": "Allow",
            "Resource": [
                "*"
            ]
        }
    ],
    "Version": "2012-10-17"
}
```
- Need a network security group (in our case it's called default and has id of sg-66f6fb03) that allows HTTPS and optionally SSH.

- Need a VPC subnet (in our case id of subnet-810defaa).

h3. Start an instance with Debian Jessie (https://wiki.debian.org/Cloud/AmazonEC2Image/Jessie)
```
aws ec2 run-instances --image-id ami-116d857a --count 1 --instance-type t2.micro --key-name salekseev-dfci --security-group-ids sg-66f6fb03 --subnet-id subnet-810defaa --iam-instance-profile Name="saltmaster" --user-data file://user-data.txt
```
where security-group-ids contains the security group you have created for those instances and subnet-id is the VPC subnet you'd like to use.

h3. Connect
- Lookup Public IP in AWS console for your new instance and connect with SSH as user admin to verify that puppet has ran successfully.
- Go to https://$public_ip/_cat/nodes?v and use user:password for authentication and see the list of nodes in the cluster.