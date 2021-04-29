Create Apache Spark cluster in Azure HDInsight using Azure portal
Prerequisites

An Azure account with an active subscriptio
Create an Apache Spark cluster in HDInsight

Sign in to the Azure portal.

From the top menu, select + Create a resource.

Select Analytics > Azure HDInsight to go to the Create HDInsight cluster page.

From the Basics tab, provide the following information:

Property : Description Subscription : From the drop-down list, select the Azure that's used for the cluster. Resource group : From the drop-down list, select your existing resource group, or select Create new. Cluster name : Enter a globally unique name. Region From the drop-down list, select a region where the cluster is created. Cluster type : Select Select cluster type to open a list. From the list, select Spark. Cluster version : This field will auto-populate with the default version once the cluster type has been selected. Cluster login username : Enter the cluster login username. The default name is admin. You use this account to login in to the Jupyter Notebook later in the quickstart. Cluster login password : Enter the cluster login password. Secure Shell (SSH) username : Enter the SSH username. The SSH username used for this quickstart is sshuser. By default, this account shares the same password as the Cluster Login username account.

Select Next: Storage >> to continue to the Storage page.

Under Storage, provide the following values:

Under Storage, provide the following values: Property : Description Primary storage type : Use the default value Azure Storage. Selection method : Use the default value Select from list. Primary storage account: Use the auto-populated value. Container : Use the auto-populated value.
Select Review + create to continue.

Under Review + create, select Create. It takes about 20 minutes to create the cluster. The cluster must be created before you can proceed to the next session.

Reference :

https://docs.microsoft.com/en-us/azure/hdinsight/spark/apache-spark-jupyter-spark-sql-use-portal
