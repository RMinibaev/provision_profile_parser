# provision_profile_parser

Apple provisioning profile parser utility.

**Fastlane required.**

Gem can parse following properties:
* profile identity
* team ID
* profile name
* bundle ID
* profile UUID

## Installing
Specify gem in your gemfile:

```ruby
gem "provisioning_profile_parser", git:"https://github.com/RMinibaev/provision_profile_parser.git"
```

## Usage

First, mark gem as required for easier debugging:

```ruby
fastlane_require "provisioning_profile_parser"
```

Then, create a parser object, passing a path to `MyProvProfile.mobileprovision` :

```ruby
prov_prof_path = "./examplepath/MyProvProfile.mobileprovision"
parser = Parser.new(prov_prof_path)
```

Finally, you can use parser methods to access info that you need: 

```ruby
parser.profile_identity
```
#=> "iPhone Developer: John Doe (FOO1337BAR)"


```ruby
parser.profile_team
```
#=> "FOO1337BAR"

```ruby
parser.profile_name
```
#=> "MyAppProvProfile_19700101"

```ruby
parser.profile_uuid
```
#=> "ed8ed34e-0c0a-4c45-9f58-ed77a5b89e3a"

```ruby
parser.bundle_id
```
#=> "com.MyCompany.Distributuion.MyProject.MyApp"


###### by Ramil Minibaev, 2019
