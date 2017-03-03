
/*
 * NDM_SSIS Readme
 * 
 */

Package Setup
=============
The project use a "Package Deployment Model". 

Find '.dtsConfig' XML configuration files in the "ConfigurationFiles" folder.

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

-- @Fri, 3rd March 2017

-- Notes
-- =====

-- [IdSeprag] FK to 'UnitaTerritorialiSeprag' to be added
-- [DataChiusuraElaborazione] contains a date when logically belongs to a closed a period
-- [IsConfirmed] dafault=True if to be considered for calculation on current open period

-- Data Conversion Checks
-- ======================

-- M501 DataFattura [varchar](6) 'ggmmaa'								DataQuietanza [date] (Error raised)
-- M501 DataNotaCredito [varchar](6) 'ggmmaa'							DataDocumentoRiferimento [date] (Not raised any error. gets NULL)
-- M501 CodiceProvincia [varchar](2) '00','01',...,'99','A0','A1',...   varchar[3] '000','001',...,'099','100','101',...
-- m501 CodiceBA [varchar](30)											CodiceLocale (to be changed in the future)
-- M501 Importo [varchar](9) '(7,2) nnnnnnnnn'								decimal(18,2)
-- M501 ImportoIva5082 [varchar](8) '(6,2) nnnnnnnn'					decimal(18,2)
-- M501 ImportoIva5183 [varchar](8) '(6,2) nnnnnnnn'					decimal(18,2)
-- M501 ImportoTotaleInEuro [varchar](10) '(8,2) nnnnnnnnnn'			decimal(18,2)
-- M501 ImportoTotaleInLire [varchar](10) 'nnnnnnnnnn'					decimal(18,2)
-- M501 ImportoImpostaLorda [varchar](9) '(7,2) nnnnnnnnn'				decimal(18,2)
-- M501 ImportoAbbuoniContestuali [varchar](8) '(6,2) nnnnnnnn'			decimal(18,2)





