/*
 * Last Update @Fri, 6th March 2017
 *
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

Notes
=====

- ProvvIncassi Table
- [IdSeprag] FK points to 'UnitaTerritorialiSeprag'
- [DataChiusuraElaborazione] contains a date when logically belongs to a closed a period
- [IsConfirmed] default=True to be considered for calculation on current open period
- [InsertedOn] default=GetUtcDate()

M501 Data Conversion Checks
===========================

 1. DataFattura [varchar](6) 'ggmmaa'							DataQuietanza [date] (Error raised)
 2. NumeroFattura [varchar] (7)								NumeroFattura [varchar] (10) '9' + 'yy' + NumeroFattura
 3. DataNotaCredito [varchar](6) 'ggmmaa'						DataDocumentoRiferimento [date] (Not raised any error. gets NULL)
 4. CodiceProvincia [varchar](2) '00'...'99','A0','A1',...	varchar[3] '000','001',...,'099','100','101',...
 5. CodiceBA [varchar](30)									CodiceLocale (will change in the future)
 6. Importo [varchar](9) '(7,2) nnnnnnnnn'					decimal(18,2)
 7. ImportoIva5082 [varchar](8) '(6,2) nnnnnnnn'				decimal(18,2)
 8. ImportoIva5183 [varchar](8) '(6,2) nnnnnnnn'				decimal(18,2)
 9. ImportoTotaleInEuro [varchar](10) '(8,2) nnnnnnnnnn'		decimal(18,2)
10. ImportoTotaleInLire [varchar](10) 'nnnnnnnnnn'			decimal(18,2)
11. ImportoImpostaLorda [varchar](9) '(7,2) nnnnnnnnn'		decimal(18,2)
12. ImportoAbbuoniContestuali [varchar](8) '(6,2) nnnnnnnn'	decimal(18,2)

M221 Data Conversion Checks
===========================
All M501 Checks are applied, not 7. and 8.
Amounts are made negative (6. 9. 10. 11. 12.)

Open Questions
==============

* CodiceProvincia A9=109 and B0=110 ?
* DataNotaCredito '000000' or any conversion error implies DataDocumentoRiferimento = NULL
* Splitting input filename "NCA-*.txt"
* ... Import track "1" input filename "NCA-M501-*.txt"
* ... Import track "2" input filename "NCA-M221-*.txt"
* SSIS 2012 Not easy way to get ErrorColumn Name


