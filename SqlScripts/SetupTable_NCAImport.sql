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
-- M501 Importo [varchar](9) '(7,2) nnnnnnnnn'							decimal(18,2)
-- M501 ImportoIva5082 [varchar](8) '(6,2) nnnnnnnn'					decimal(18,2)
-- M501 ImportoIva5183 [varchar](8) '(6,2) nnnnnnnn'					decimal(18,2)
-- M501 ImportoTotaleInEuro [varchar](10) '(8,2) nnnnnnnnnn'			decimal(18,2)
-- M501 ImportoTotaleInLire [varchar](10) 'nnnnnnnnnn'					decimal(18,2)
-- M501 ImportoImpostaLorda [varchar](9) '(7,2) nnnnnnnnn'				decimal(18,2)
-- M501 ImportoAbbuoniContestuali [varchar](8) '(6,2) nnnnnnnn'			decimal(18,2)


DECLARE @TableName VARCHAR(20);
SET @TableName = 'ProvvIncassi'; -- DO NOT CHANGE! Table Name change requires alignment with project variable

DECLARE @CreateTableSQLQuery VARCHAR(MAX);

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = @TableName)
	
	BEGIN
		SET @CreateTableSQLQuery = 
			'CREATE TABLE ' + @TableName + ' (
				[Id] [bigint] IDENTITY(1,1) NOT NULL,
				[IdSeprag] [int] NULL,
				[DataChiusuraElaborazione] date NULL,
				[TipoRecord] [numeric](1,0) NULL,
				[Contabilita] varchar(4),
				[CodiceSede] varchar(2),
				[NumeroQuietanza] varchar(7),
				[CodiceProvincia] [varchar](3) NULL,
				[CodiceAgenzia] varchar(2),
				[NumeroFattura] varchar(7),
				[DataFattura] [date] NULL,
				[CodiceBA] [varchar](30) NULL,
				[TipoDocumento] varchar(2),
				[NumeroDocumentoRiferimento] varchar(7),
				[DataNotaCredito] [date] NULL,
				[NomeLocale] varchar(25),
				[IndirizzoLocale] varchar(25),
				[TitolareLocale] varchar(22),
				[CodiceComune] varchar(3),
				[CodiceLocale] varchar(7),
				[CategoriaLocale] varchar(1),
				[GenereAttivitaLocale] varchar(2),
				[NomeOrganizzatore] varchar(30),
				[CodiceFiscaleOrganizzatore] varchar(16),
				[IndirizzoOrganizzatore] varchar(30),
				[NumeroDitta] varchar(5),
				[ComuneOrganizzatore] varchar(25),
				[SiglaProvinciaOrganizzatore] varchar(2),
				[GenereManifestazione] varchar(2),
				[DataInizioManifestazione] varchar(6),
				[DataFineManifestazione] varchar(6),
				[NumeroGiornate] varchar(2),
				[Filler1] varchar(15),
				[Voce] varchar(4),
				[Importo] [numeric](18,2),
				[FillerA1] varchar(169),
				[ImportoIva5082] [numeric](18,2),
				[ImportoIva5183] [numeric](18,2),
				[ImportoTotaleInEuro] [numeric](18,2),
				[ImportoTotaleInLire] [numeric](18,2),
				[FlagLireEuro] varchar(1),
				[Filler2] varchar(20),
				[NumeroDistinte] varchar(2),
				[Filler3] varchar(6),
				[NumeroDichiarazioni] varchar(2),
				[IncassoNetto] varchar(12),
				[NumeroBiglietti] varchar(6),
				[ImportoImpostaLorda] [numeric](18,2),
				[ImportoAbbuoniContestuali] [numeric](18,2),
				[TipoStrumentoMeccanico] varchar(2),
				[CodiceAccordoPerStrumMecc] varchar(2),
				[Filler4] varchar(4),
				[NumeroLibretto] varchar(6),
				[Filler5] varchar(5),
				[DataInizioAbbonamento] varchar(6),
				[DataFineAbbonamento] varchar(6),
				[NumeroRataInizio] varchar(1),
				[NumeroRataFine] varchar(1),
				[DataInizioRata] varchar(6),
				[DataFineRata] varchar(6),
				[FlagAgisTeatro] varchar(1),
				[CompagniaAnnotazioni] varchar(30),
				[NumeroCaratteriAcquisiti] varchar(4),
				[CaratteriControllo] varchar(15),
				[ContrassegnoMinisteriale] varchar(10),
				[Filler6] varchar(4),
				[PrezzoUnitarioGettone] varchar(6),
				[ProgressivoGestione] varchar(1),
				[TipoLocale] varchar(1),
				[AssociazioneCategoriaLocale] varchar(2),
				[ImponibileMedioNazionale] varchar(7),
				[IsConfirmed] [bit] NOT NULL,

			    CONSTRAINT [PK_' + @TableName + '] PRIMARY KEY CLUSTERED ([Id] ASC)
			    WITH (PAD_INDEX=OFF, STATISTICS_NORECOMPUTE=OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS=ON, ALLOW_PAGE_LOCKS=ON) ON [PRIMARY]
			) ON [PRIMARY];			
			';

		EXEC (@CreateTableSQLQuery);

		SET @CreateTableSQLQuery = 
			'ALTER TABLE ' + @TableName + ' ADD CONSTRAINT [DF_' + @TableName + '_IsConfirmed] DEFAULT ((1)) FOR [IsConfirmed]'

		EXEC (@CreateTableSQLQuery);
	
	END

