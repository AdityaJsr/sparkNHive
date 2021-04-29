<h1>Apache Beeline client with Apache Hive<h1>
<h2>Prerequisites<h2>

<h4>A Hadoop cluster on HDInsight.
URI scheme for your cluster's primary storage
An SSH client
Run a Hive query

Open an SSH connection to the cluster with the code below. Replace sshuser with the SSH user for your cluster, and replace CLUSTERNAME with the name of your cluster. When prompted, enter the password for the SSH user account.
ssh sshuser@CLUSTERNAME-ssh.azurehdinsight.net
Connect to HiveServer2 with your Beeline client from your open SSH session by entering the following command:
beeline -u 'jdbc:hive2://headnodehost:10001/;transportMode=http'
Beeline commands begin with a ! character, for example !help displays help. However the ! can be omitted for some commands. For example, help also works.
There's !sql, which is used to execute HiveQL statements. However, HiveQL is so commonly used that you can omit the preceding !sql. The following two statements are equivalent:
!sql show tables;
show tables;
Use the following command to display the schema for the hivesampletable:
describe hivesampletable;
Exit Beeline
!exit
Run a HiveQL file

Use the following command to create a file named query.hql:
nano query.hql
Use the following text as the contents of the file. This query creates a new 'internal' table named errorLogs:
CREATE TABLE IF NOT EXISTS errorLogs (t1 string, t2 string, t3 string, t4 string, t5 string, t6 string, t7 string) STORED AS ORC; INSERT OVERWRITE TABLE errorLogs SELECT t1, t2, t3, t4, t5, t6, t7 FROM log4jLogs WHERE t4 = '[ERROR]' AND INPUT__FILE__NAME LIKE '%.log';
To save the file, use Ctrl+X, then enter Y, and finally Enter.
Use the following to run the file using Beeline
beeline -u 'jdbc:hive2://headnodehost:10001/;transportMode=http' -i query.hql
To verify that the errorLogs table was created, use the following statement to return all the rows from errorLogs
SELECT * from errorLogs;<h4>
  
<h2>Create a hql file by using<h2>
  
<h4>nano <filename>.hql
write the HQL query
press CTRL+O to save
press CTRL+X toexit the hql file

TO EXECUTE THE HQL FILE IN BEELINE USE COMMAND
beeline -u 'jdbc:hive2://headnodehost:10001/;transportMode=http' <filename>.hql

NOW CHECK FOR THE TABLE IF CREATED OR NOT BY STRATING THE BEELINE USING COMMAND:
beeline -u 'jdbc:hive2://headnodehost:10001/;transportMode=http'

AS YOU CAN SEE THAT THERE IS NO DATA. WE WILL ADD THE DATA WE UPLOADED IN OUT BLOB BY USING

LOAD DATA INPATH 'wasb:///inputData/worldwise.csv' INTO TABLE worldwise;

**note this works only if you data is in the same container shard with the cluster:
if the container is different use:
LOAD data <LOCAL> inpath <file path> into table [tablename]
wasb://<containername>@<accountname>.blob.core.windows.net/<file.path>/
wasbs://<containername>@<accountname>.blob.core.windows.net/<file.path>/

AS YOU CAN SEE WE HAVE SUCESSFULLY INSERTED OUR DATA IN THE TABLE

NOW LETS CREATE A FILE TO RUN QUERIES ON THIS TABLE:

**USE !exit to get out of beeline:
**USE CLRL+L to clear of command prompt:

As YOU CAN SEE WE CREATED A TABLE AND RAN A QUERY FROM THE DATA OF AN EXTERNAL TABLE

I AM COPYING JUST THE STRUCTURE OF THE TABLE BECAUSE AM A SLOW TYPER
YOU CAN WRITE YOUR TABLE STRUCTURE AS IT SUITS YOUR DATA

all the tables are created sucessfully

Always clear your resource group if not needed.<h4>
  
Reference :

https://docs.microsoft.com/en-us/azure/hdinsight/hadoop/apache-hadoop-use-hive-beeline
