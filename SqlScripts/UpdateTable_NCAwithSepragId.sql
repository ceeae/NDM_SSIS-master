DECLARE @TableName VARCHAR(20);
SET @TableName = 'ProvvIncassi'; -- DO NOT CHANGE! Table Name change requires alignment with project variable

DECLARE @CreateTableSQLQuery VARCHAR(MAX);
BEGIN
	SET @CreateTableSQLQuery = 
		'UPDATE ' + @TableName + ' SET IdSeprag = n.IdSeprag FROM (

				select TOP 100 PERCENT pri.Id, pri.CodiceSede + pri.CodiceProvincia + pri.CodiceAgenzia as seprag, uts.ID as IdSeprag , uts.Denominazione
				FROM ProvvIncassi pri
				LEFT JOIN [dbo].[UnitaTerritorialiSeprag] uts On uts.CodiceSede = pri.CodiceSede AND 
													 uts.CodiceProvincia = pri.CodiceProvincia AND 
													 uts.CodiceAgenzia = pri.CodiceAgenzia

				ORDER BY uts.ID
				) n 
				WHERE n.seprag = ProvvIncassi.CodiceSede + ProvvIncassi.CodiceProvincia + ProvvIncassi.CodiceAgenzia;
		 SELECT @@ROWCOUNT AS RowsUpdated;
		'
	EXEC (@CreateTableSQLQuery);
END
