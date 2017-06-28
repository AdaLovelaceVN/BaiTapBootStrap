CREATE PROCEDURE getListFunction
	@functionType INT
AS
BEGIN

	SELECT * 
	FROM [Function] f
	WHERE (f.FunctionType = @functionType OR @functionType = 0) 
		   AND f.FunctionLink IN ('GioiThieu') 
	ORDER BY f.[Description] asc	

END