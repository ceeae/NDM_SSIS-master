DECLARE @TableName VARCHAR(20);
SET @TableName = 'ProvvJournal'

DECLARE @CreateTableSQLQuery VARCHAR(MAX);

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = @TableName)	
	BEGIN
		SET @CreateTableSQLQuery = 'CREATE TABLE ' + @TableName + 
			' (
				[id] [int] IDENTITY(1,1) NOT NULL,
				[Package] [varchar](500) NOT NULL,
				[Source] [varchar](500) NOT NULL,
				[StartDate] [datetime] NOT NULL,
				[Destination] [varchar](500) NULL,
				[EndDate] [datetime] NULL,
				[RowsInserted] [int] NULL,
				[RowsUpdated] [int] NULL,
				[RowsWithError] [int] NULL,
			    CONSTRAINT [PK_' + @TableName + '] PRIMARY KEY CLUSTERED 
					(
						[id] ASC
					) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
			 ) ON [PRIMARY]';
		
		EXEC (@CreateTableSQLQuery);
				
		SET @CreateTableSQLQuery = 
			'ALTER TABLE ' + @TableName + ' ADD CONSTRAINT [DF_' + @TableName + '_StartDate] DEFAULT (GETUTCDATE()) FOR [StartDate]'
		EXEC (@CreateTableSQLQuery);

	END
