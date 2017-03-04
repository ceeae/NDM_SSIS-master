DECLARE @TableName VARCHAR(20);
SET @TableName = 'ProvvJournal'

DECLARE @CreateTableSQLQuery VARCHAR(MAX);

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = @TableName)	
	BEGIN
		SET @CreateTableSQLQuery = 'CREATE TABLE ' + @TableName + 
			' (
				[id] [int] IDENTITY(1,1) NOT NULL,
				[Package] [varchar](500) NOT NULL,
				[Filename] [varchar](500) NOT NULL,
				[ImportStartDate] [datetime] NOT NULL,
				[ImportEndDate] [datetime] NULL,
				[RowsInserted] [int] NULL,
				[RowsWithError] [int] NULL,
			    CONSTRAINT [PK_' + @TableName + '] PRIMARY KEY CLUSTERED 
					(
						[id] ASC
					) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
			 ) ON [PRIMARY]';
		
		EXEC (@CreateTableSQLQuery);		
	END
