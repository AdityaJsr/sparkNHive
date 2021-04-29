<h1>Preprocess Data<h1>
<h2>perform basic cleansing operation on csv file<h2>

<h4>Load data and run queries on an Apache Spark cluster in Azure HDInsight

Prerequisites
An Apache Spark cluster on HDInsight
Create a Jupyter Notebook

Edit the URL https://SPARKCLUSTER.azurehdinsight.net/jupyter by replacing SPARKCLUSTER with the name of your Spark cluster. Then enter the edited URL in a web browser. If prompted, enter the cluster login credentials for the cluster.
From the Jupyter web page, Select New > PySpark to create a notebook.
Create a dataframe from a csv file

Paste the following code in an empty cell of the Jupyter Notebook, and then press SHIFT + ENTER to run the code. The code imports the types required for this scenario:
from pyspark.sql import *
from pyspark.sql.types import *
Note the session id returned. From the picture above, the session id is 0. If desired, you can retrieve the session details by navigating to https://CLUSTERNAME.azurehdinsight.net/livy/sessions/ID/statements where CLUSTERNAME is the name of your Spark cluster and ID is your session id number.
Run the following code to create a dataframe and a temporary table (hvac) by running the following code.
Run queries on the dataframe

%%sql
SELECT buildingID, (targettemp - actualtemp) AS temp_diff, date FROM hvac WHERE date = "6/1/13"
Clean up resources

With HDInsight, your data and Jupyter Notebooks are stored in Azure Storage or Azure Data Lake Storage, so you can safely delete a cluster when it isn't in use. You're also charged for an HDInsight cluster, even when it's not in use.
Reference :

https://docs.microsoft.com/en-us/azure/hdinsight/spark/apache-spark-jupyter-spark-sql-use-portal<h4>
