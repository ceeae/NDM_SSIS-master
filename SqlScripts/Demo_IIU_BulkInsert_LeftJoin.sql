-- Bulk insert missing rows from VInput to VOutput
-- Key (NumeroAtto AND DataDocumento)

INSERT INTO VOutput (NumeroAtto, DataDocumento, Test)

	SELECT A.NumeroAtto, A.DataDocumento, A.Test
	FROM VInput A
	LEFT JOIN VOutput B
	ON A.NumeroAtto = B.NumeroAtto AND A.DataDocumento = B.DataDocumento
	WHERE B.DataDocumento IS NULL AND B.NumeroAtto IS NULL
