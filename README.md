
# Stress test for Drupal with Apache JMeter

> Check and measure the performance of your site in Drupal with Apache Jmeter.

<!--[![Build Status](http://img.shields.io/travis/badges/badgerbadgerbadger.svg?style=flat-square)](https://travis-ci.org/lucacracco/jmeter_drupal) [![Dependency Status]-->
<!--[![Github Issues](http://githubbadges.herokuapp.com/badges/badgerbadgerbadger/issues.svg?style=flat-square)](https://github.com/lucacracco/jmeter_drupal/issues)-->
<!--[![Pending Pull-Requests](http://githubbadges.herokuapp.com/badges/badgerbadgerbadger/pulls.svg?style=flat-square)](https://github.com/lucacracco/jmeter_drupal/pulls)-->
<!--[![Gem Version](http://img.shields.io/gem/v/badgerbadgerbadger.svg?style=flat-square)](https://rubygems.org/gems/badgerbadgerbadger) [![License]-->

This repository contains basic configurations and examples to run tests with 
[Apache JMeter](https://jmeter.apache.org/) on websites made in [Drupal]().
There are examples of tests with logged-in users, anonymous user, view and edit
node, ecc... (see [templates](./templates))

You can use [Apache JMeter binaries](https://jmeter.apache.org/) or a docker image [justb4/jmeter](https://hub.docker.com/r/justb4/jmeter/).

## Table of Contents (Optional)

> If you're `README` has a lot of info, section headers might be nice.

- [Installation](#installation)
- [Features](#features)
- [Contributing](#contributing)
- [Team](#team)
- [FAQ](#faq)
- [Support](#support)
- [License](#license)

## Installation

* Download the [last release](https://github.com/lucacracco/jmeter_drupal/releases);
* Unzip zip package;

**Apache JMeter Binaries**

If you want use the Apache JMeter binaries you must download this from [official site](https://jmeter.apache.org/download_jmeter.cgi)
and extract files in directory `./apache-jmeter-5.0`.

You can also use the script [download-jmeter-binaries](./download-jmeter-binaries.sh).

```bash
sh download-jmeter-binaries.sh
```

**Apache JMeter Docker `justb4/jmeter`**

If you want to use [Docker](https://www.docker.com/) you have to install it first ;)
See Docker [documentation](https://docs.docker.com/).

### Setup

- Customize the file .env

```yml
name: MyProject
```

- Customize from [templates](./templates) or create a [new test plan](https://jmeter.apache.org/usermanual/get-started.html#template).

---

## Features

### Usage with docker

@todo

### Usage with binaries

@todo

### Test URL nodes

The file `urls.csv` contains a list of URLs for the browsing threads. A simple list can be generated with the following query:

```sql
SELECT CONCAT('/node/', nid) FROM node WHERE STATUS = 1
  ORDER BY changed LIMIT 1000;
```

For an active site, an alternative might be to extract this list from your site's access logs; such a list would closely match actual traffic patterns.

### Tests login user authentication

@todo


---

## Contributing

> To get started...

### Step 1

- **Option 1**
    - 🍴 Fork this repo!

- **Option 2**
    - 👯 Clone this repo to your local machine using `https://github.com/lucacracco/jmeter_drupal.git`

### Step 2

- **HACK AWAY!** 🔨🔨🔨

### Step 3

- 🔃 Create a new pull request using <a href="https://github.com/lucacracco/jmeter_drupal/compare/" target="_blank">`https://github.com/lucacracco/jmeter_drupal/compare/`</a>.

---

## FAQ

- **How do I do *specifically* so and so?**
    - No problem! Just do this.

---

## License

[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://badges.mit-license.org)

- **[MIT license](http://opensource.org/licenses/mit-license.php)**

### Credits

Thanks to [https://www.metaltoad.com/blog/jmeter-test-plan-drupal](https://www.metaltoad.com/blog/jmeter-test-plan-drupal) that inspired me.
