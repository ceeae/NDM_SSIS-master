DECLARE @TableName VARCHAR(100);
SET @TableName = '_ProvvIncassiDettagliStaging'; -- DO NOT CHANGE! Table Name change requires alignment with project variable

DECLARE @CreateTableSQLQuery VARCHAR(MAX);

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = @TableName)
	
	BEGIN
		SET @CreateTableSQLQuery = 
			'CREATE TABLE ' + @TableName + ' (
				[CODICEVOCEINCASSO] nvarchar(4),
				[IMPORTOVOCEINCASSO] float,
				[CODGENEREEVENTOVOCEINCASSO] nvarchar(2),
				[FLAGENTRUSC] nvarchar(1),
				[ID_QUIETANZA] numeric(38,0),
			
				[InsertedOn] [datetime] NOT NULL,

			    CONSTRAINT [PK_' + @TableName + '] PRIMARY KEY CLUSTERED ([ID_QUIETANZA] ASC)
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
