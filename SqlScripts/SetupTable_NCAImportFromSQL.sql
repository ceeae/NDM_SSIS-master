DECLARE @TableName VARCHAR(20);
SET @TableName = '_ProvvIncassiStaging'; -- DO NOT CHANGE! Table Name change requires alignment with project variable

DECLARE @CreateTableSQLQuery VARCHAR(MAX);

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = @TableName)
	
	BEGIN
		SET @CreateTableSQLQuery = 
			'CREATE TABLE ' + @TableName + ' (
				[CHIAVE] numeric(38,0),
				[NUMTIPOMODELLO] nvarchar(38),
				[INDICATORESE] nvarchar(1),
				[NUMEROFATTURA] numeric(38,0),
				[DATAQUIETANZA] datetime,
				[DENOMINAZIONESPAZIO] nvarchar(50),
				[TOPONIMOLOCALE] nvarchar(30),
				[STRADALOCALE] nvarchar(100),
				[NUMEROCIVICO] nvarchar(30),
				[CODICECOMUNESIAE] nvarchar(3),
				[CODCATEGLOCALE] nvarchar(1),
				[GENERELOCALE] nvarchar(3),
				[COGNOMEORGANIZZATORE] nvarchar(100),
				[NOMEORGANIZZATORE] nvarchar(100),
				[CODICEFISCALE] nvarchar(16),
				[PARTITAIVA] nvarchar(11),
				[IDSTRADAORGANIZZATORE] numeric(38,0),
				[TOPONIMOORGANIZZATORE] nvarchar(30),
				[STRADAORGANIZZATORE] nvarchar(100),
				[NUMCIVICOORGANIZZATORE] nvarchar(30),
				[COMUNEORGANIZZATORE] nvarchar(80),
				[PROVINCIAORGANIZZATORE] nvarchar(2),
				[STRADAESETEROORGANIZZATORE] nvarchar(300),
				[DATAINIZIO] datetime,
				[DATAFINE] datetime,
				[SEPRAG] nvarchar(7),
				[SEPRAGLOCALE] nvarchar(7),
				[IDSPAZIO] numeric(38,0),
				[NUMEROREVERSALE] nvarchar(38),
				[CODICETIPODOCUMENTO] nvarchar(2),
				[NUMREVERSALERIFERIMENTO] nvarchar(16),
				[DATANUMREVERESALERIFERIMENTO] datetime,
				[TITOLARELOCALE] nvarchar(50),
				[CODGENEREEVENTOQUIETANZA] nvarchar(2),
				[IMPORTOQUIETANZA] numeric(12,2),
				[IDQUIETANZA] numeric(38,0),
				[INCASSONETTO] nvarchar(38),
				[NUMEROBIGLIETTI] nvarchar(38),
				[NUMERODOCUMENTI] nvarchar(38),
				[NUMEROEVENTI] nvarchar(38),
				[NUMEROGIORNATEEVENTI] nvarchar(38),
				[DENOMINAZIONELOCALE] nvarchar(50),
				[LOCALITALOCALE] nvarchar(80),
				[STATOQUIETANZA] nvarchar(1),
				[FLAG398] nvarchar(1),
				[TIPODOCUMENTO] nvarchar(1),
				[CODACCORDOSPEICATEGORIA] nvarchar(6),
				[NOTEQUIETANZA] nvarchar(250),
				[CODGENERELOCALE] nvarchar(3),
				[CODBASPAZIO] nvarchar(13),
				[NUMERODITTA] nvarchar(5),
				[CODSPEI] nvarchar(13),
				[TIPOMODELLO] numeric(38,0),
				[FLAGPRIVACY] nvarchar(1),
				[MISSIONIPROTOCOLLOSAP] nvarchar(5),
				[CODICEIPAQUIETANZA] nvarchar(20),
				[REGIMEIVAAPPLICATO] nvarchar(20),

				[Id] [bigint] IDENTITY(1,1) NOT NULL,
				[InsertedOn] [datetime] NOT NULL,

			    CONSTRAINT [PK_' + @TableName + '] PRIMARY KEY CLUSTERED ([Id] ASC)
			    WITH (PAD_INDEX=OFF, STATISTICS_NORECOMPUTE=OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS=ON, ALLOW_PAGE_LOCKS=ON) ON [PRIMARY]
			) ON [PRIMARY];			
			';
		EXEC (@CreateTableSQLQuery);

		SET @CreateTableSQLQuery = 
			'ALTER TABLE ' + @TableName + ' ADD CONSTRAINT [DF_' + @TableName + '_InsertedOn] DEFAULT (GETUTCDATE()) FOR [InsertedOn]'
		EXEC (@CreateTableSQLQuery);
	
	END

SET @CreateTableSQLQuery = 'TRUNCATE TABLE ' + @TableName;
EXEC (@CreateTableSQLQuery); 
