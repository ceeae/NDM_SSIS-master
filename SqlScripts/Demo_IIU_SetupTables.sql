-- Create a 'View' kind of table

DROP TABLE [dbo].[VInput]

CREATE TABLE [dbo].[VInput](
	[NumeroAtto] [nchar](10) NOT NULL,
	[DataDocumento] [date] NOT NULL,
	[Test] [varchar](50) NULL
) ON [PRIMARY]

DROP TABLE [dbo].[VOutput]

CREATE TABLE [dbo].[VOutput](
	[InsertedOn] [datetime] NOT NULL,  
	[LastModifiedOn] [datetime] NULL,  

	[NumeroAtto] [nchar](10) NOT NULL,
	[DataDocumento] [date] NOT NULL,
	[Test] [varchar](50) NULL
) ON [PRIMARY]

ALTER TABLE [dbo].[VOutput]
	ADD CONSTRAINT [K_InsertedOn_GetUtcDate]
		DEFAULT GETUTCDATE() FOR [InsertedOn]

GO

-- Insert some demo data [VInput]
INSERT INTO [dbo].[VInput] ([NumeroAtto],[DataDocumento],[Test]) VALUES ('0000000001', '2017-01-01', 'Test 1')
INSERT INTO [dbo].[VInput] ([NumeroAtto],[DataDocumento],[Test]) VALUES ('0000000002', '2017-01-01', 'Test 2')
INSERT INTO [dbo].[VInput] ([NumeroAtto],[DataDocumento],[Test]) VALUES ('0000000003', '2017-01-02', 'Test 3')

-- Insert some demo data [VOutput]
INSERT INTO [dbo].[VOutput] ([NumeroAtto],[DataDocumento],[Test]) VALUES ('0000000001', '2017-01-01', 'Test 4')
--INSERT INTO [dbo].[VOutput] ([NumeroAtto],[DataDocumento],[Test]) VALUES ('0000000002', '2017-01-01', 'Test 2')
--INSERT INTO [dbo].[VOutput] ([NumeroAtto],[DataDocumento],[Test]) VALUES ('0000000003', '2017-01-02', 'Test 3')

GO

-- BULK INSERT
-- ===========

--INSERT INTO VOutput (NumeroAtto, DataDocumento, Test)

--	SELECT A.NumeroAtto, A.DataDocumento, A.Test
--	FROM VInput A
--	LEFT JOIN VOutput B
--	ON A.NumeroAtto = B.NumeroAtto AND A.DataDocumento = B.DataDocumento
--	WHERE B.DataDocumento IS NULL AND B.NumeroAtto IS NULL

-- BULK UPDATE
-- ===========

--UPDATE VOutput 
--SET VOutput.LastModifiedOn = GETUTCDATE(), VOutput.NumeroAtto = A.NumeroAtto, VOutput.DataDocumento = A.DataDocumento, VOutput.Test = A.Test
--FROM VInput A
--	INNER JOIN VOutput B
--	ON A.NumeroAtto = B.NumeroAtto AND A.DataDocumento = B.DataDocumento