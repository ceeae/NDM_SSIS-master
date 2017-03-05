-- Bulk update existing rows in VOutput with corresponding "fresh" data in VInput
-- Key (NumeroAtto AND DataDocumento)

UPDATE VOutput
SET VOutput.LastModifiedOn = GETUTCDATE(), VOutput.NumeroAtto = A.NumeroAtto, VOutput.DataDocumento = A.DataDocumento, VOutput.Test = A.Test
FROM VInput A
	INNER JOIN VOutput B
	ON A.NumeroAtto = B.NumeroAtto AND A.DataDocumento = B.DataDocumento;

SELECT @@ROWCOUNT as RowsUpdated;
