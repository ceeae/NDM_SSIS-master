UPDATE VOutput
SET VOutput.LastModifiedOn = GETUTCDATE(), VOutput.NumeroAtto = A.NumeroAtto, VOutput.DataDocumento = A.DataDocumento, VOutput.Test = A.Test
FROM VInput A
	INNER JOIN VOutput B
	ON A.NumeroAtto = B.NumeroAtto AND A.DataDocumento = B.DataDocumento;

SELECT @@ROWCOUNT as RowsUpdated;
