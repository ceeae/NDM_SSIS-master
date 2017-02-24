
/*
 * NDM_SSIS Readme
 * 
 */

Package Setup
=============
The project use a "Package Deployment Model". Find '.dtsConfig' XML configuration files in the "ConfigurationFiles" folder.
All SQL scripts are stored in SqlScripts folder.
Scripts mainly concern tables setup, such as Journal, NCA, etc. and refer to table names that MUST be aligned with corresponding package variable.
Script table name is dynalically linked to @TableName variable. Please do not chage variable content.


Importing Process
=================
Importing process of flat files starts with file presence in "Import" folder (speficied by User::sFolderPathImport variable).
If file is present is firstly moved to staging and successively to archive folder.
Folders are specified by User::sFolderPath* like variables.


Logging
=======
Packages are configured to use as log provider "SQL Server". 
Please define logging levels by selecting "SSIS -> Logging..." menu option.
Information is logged on database table under "Tables -> SystemTables -> dbo.sysssislog".
Current logging level is: OnError, OnTaskFailed, OnWarning.





