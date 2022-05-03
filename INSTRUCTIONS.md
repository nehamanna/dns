# Your deliverable: Terraform Module - DNS Updater

The first version of this Terraform module is just capable of creating a fixed set of DNS entries against a DNS Server as per RFC-2136 by using the official [DNS Terraform provider](https://registry.terraform.io/providers/hashicorp/dns/latest).

In order to create DNS records dynamically without hard coding values, **you have been tasked with the enhancement of ensuring the module can read an arbitrary number of JSON files from disk on a local directory named `input-json` that contains all the necessary attributes to create DNS records**. 


> Do not worry if you are not able to complete the exercise. Please ensure that you push your code to your repo so that you can talk about your approach at the interview.

> Please, do not allocate more than 2/3 hours to the development of this exercise.

As we are still prototyping the solution, we are only going to support `A` DNS Record types. It's also safe to assume that one JSON file equates to one DNS record. Also, the DNS authoritative zone will always be `example.com.`

```
# JSON File structure

├── examples
│   └── exercise
│       ├── input-json
│       │   ├── subdomain-a.json
│       │   └── subdomain-b.json

## JSON File Name --> DNS Record Name
## JSON File Object --> Attributes of a DNS Record
## Example:
# finance.json
{
    "addresses": [
        "192.168.100.1"
    ],
    "ttl": 600,
    "zone": "example.com.",
    "dns_record_type": "a"
}
```

The examples folder contains a [basic example](./examples/basic) to get you started, however you are supposed to provide another working example under the `exercise` folder. So, feel free to update, create, or delete any file you consider pertinent within this repository.

## Way of working

You should exclusively work under a xNIX-like Operating System (e.g. Linux). Moreover, apart from the expected dev. tools that you should already have installed on your local environment (e.g. git) you'd need a recent version of:

- Bash
- Docker
- Terraform

1. Create a new public `GitHub` repository under your profile and branch out from this sample code, either after cloning it or straightaway on the remote.
2. Start getting familiar with all inner folders and files so you understand how everything ties together. Bear in mind that this initial simple implementation does not go beyond a single `main.tf` at the root of the TF module with hardcoded values, so you are expected to make us of the other `variables.tf` and `outputs.tf`.
3. In order to get your development environment ready, run the `shell script` available under `tests` (`tests/build-and-run.sh`) so you mock out a local DNS service based on `BIND9` with no authentication that will let you test the Terraform module. This execution will spin up a local Docker container with a systemd BIND enabled.
4. Make sure you can successfully run `terraform` commands under the basic example, and it works whenever you execute terraform `init` `plan` `apply` and `destroy` commands.
5. After applying the basic Terraform module example, ensure you can query the DNS server by running `nslookup www.example.com 127.0.0.1`
6. Collect information from the DNS Terraform provider documentation if you have never worked with this plugin before, and find out how you would consume all the JSON files under `examples/exercise/input-json` so that the code becomes more versatile. Bear in mind that you can use Terraform syntax with `for` and `for_each` syntax as well as other `built-in` functions
7. Remember this initial prototype must work with any number of JSON files that are dropped under `examples/exercise/input-json` and should ignore any other non-json file extensions.

Once you finish, make sure you `commit` and `push` all the files you have been working on to your own repo, as well as share the GitHub URL with your recruiter.

## Checklist

 - [ ] Add comments to the Terraform module in the header section of [main.tf](./main.tf) that explains what the module does, and how to use it (as is if you did not improve it).
 - [ ] Populate the root `variable.tf` and `output.tf` with your best guesses about what you would expect from a well-written Terraform module (as is if you did not improve it).
 - [ ] Create an automated README file (markdown style) based on [terraform-docs](https://github.com/terraform-docs/terraform-docs) (as is if you did not improve it).
 - [ ] Create dynamically all DNS A-type records defined as JSON under `input-json` in the mock DNS server spun up via Docker. You can decide where to write the logic for reading the JSON inputs from; either in the Terraform module itself, or at the inputs level in the `exercise` example.

## Optional Checklist

 - [ ] List possible enhancements you would love to incorporate to the Terraform module
 - [ ] Codify further Terraform functionality to support other types of DNS records defined in JSON format, following the same folder structure (e.g. CNAME)

## Reference material

[DNS Provider Official Docs](https://registry.terraform.io/providers/hashicorp/dns/latest/docs)
[DNS Provider GitHub Page](https://github.com/hashicorp/terraform-provider-dns/)
[Terraform Language Documentation](https://www.terraform.io/docs/language/index.html)
[Terraform Built-in functions](https://www.terraform.io/docs/language/functions/index.html)
