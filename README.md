# druid insallation

### Resources
Create an ec2 instance on AWS t2.micro (AWS free tier) is not enough resources for druid,
so install druid on t2.medium (2 vcores, 4GB memory).

Minimum memory required for starting services is 4250m

for more details: https://druid.apache.org/docs/latest/operations/single-server.html

### security rule:
allow 8888 port for druid web ui
![image](images/add-security-group-rule-port-8888.jpg)

**The software requirements for the installation machine are:**
* Java 8u92+ or Java 11
```bash
sudo yum install java-11
```
* Python 3 (preferred) or Python 2 : already installed
* Perl 5 : already installed
```bash
sudo yum install perl
```

## installations:

environments variables:
```export JAVA_HOME=```

install Druid
```bash
wget https://dlcdn.apache.org/druid/26.0.0/apache-druid-26.0.0-bin.tar.gz
tar -xzf apache-druid-26.0.0-bin.tar.gz
cd apache-druid-26.0.0

# run druid only nano (because of the resources)
./bin/start-nano-quickstart &
```

## problems:

problem 1: can't process parquet file format
install extensions: druid-parquet-extensions
Requires druid-avro-extensions to be loaded.

https://druid.apache.org/docs/latest/development/extensions.html
https://druid.apache.org/docs/latest/development/extensions-core/parquet.html

```bash
vim /home/ec2-user/apache-druid-26.0.0/conf/druid/single-server/nano-quickstart/_common/common.runtime.properties
```

add to the list of extensions

```druid.extensions.loadList=["druid-avro-extensions", "druid-parquet-extensions"]```

# Work with Druid
load data from parquet file sources:
[top-reviews.parquet
](https://github.com/ofirshmuel/druid-insallation/raw/main/top-reviews.parquet)

[funniest_recommendation.parquet
](https://github.com/ofirshmuel/druid-insallation/raw/main/funniest_recommendation.parquet)

monitor data and logs:

apache-druid-26.0.0/logs
