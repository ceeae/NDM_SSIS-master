
-- Disclaimer 
-- This is a demo that shows how to implement incremental data upload 
-- from an input table or view (VInput) to an output table.
-- The script creates two table VInput and VOutput with some demostration data.

-- Create VInput table

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'VInput')
	DROP TABLE [dbo].[VInput]

CREATE TABLE [dbo].[VInput](
	[NumeroAtto] [nchar](10) NOT NULL,
	[DataDocumento] [date] NOT NULL,
	[Test] [varchar](50) NULL
) ON [PRIMARY]

-- Create VOutput table

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'VOutput')
	DROP TABLE [dbo].[VOutput]

CREATE TABLE [dbo].[VOutput](
	[InsertedOn] [datetime] NOT NULL,  
	[LastModifiedOn] [datetime] NULL,  

	[NumeroAtto] [nchar](10) NOT NULL,
	[DataDocumento] [date] NOT NULL,
	[Test] [varchar](50) NULL
) ON [PRIMARY]

ALTER TABLE [dbo].[VOutput]
	ADD CONSTRAINT [DF_InsertedOn]
		DEFAULT GETUTCDATE() FOR [InsertedOn]

GO

-- Insert some demo data to VInput

INSERT INTO [dbo].[VInput] ([NumeroAtto],[DataDocumento],[Test]) VALUES ('0000000001', '2017-01-01', 'Test 1')
INSERT INTO [dbo].[VInput] ([NumeroAtto],[DataDocumento],[Test]) VALUES ('0000000002', '2017-01-01', 'Test 2')
INSERT INTO [dbo].[VInput] ([NumeroAtto],[DataDocumento],[Test]) VALUES ('0000000003', '2017-01-02', 'Test 3')

-- Insert some demo data to VOutput

INSERT INTO [dbo].[VOutput] ([NumeroAtto],[DataDocumento],[Test]) VALUES ('0000000001', '2017-01-01', 'Test 4')

GO
