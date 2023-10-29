IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tareas_merge_json]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
	DROP PROCEDURE [dbo].[tareas_merge_json]
END
GO

-- ==================================================================================================================
-- Author:	 Cristian Pérez <cristianperez@outlook.com>
-- Create date: 27/10/2023
-- Description: Guarda o actualiza una tarea y retorna su identificador.
-- ==================================================================================================================
CREATE PROCEDURE [dbo].[tareas_merge_json]
(
 @Json  	VARCHAR(MAX) 
)
AS 
BEGIN

	DECLARE @registro_procesado TABLE (id INT)
	
	MERGE dbo.tareas AS TARGET

	USING
		  ( SELECT
			   id,
			   id_categoria,
			   id_estado,
			   fecha_limite,
			   nombre,
			   descripcion
			   FROM OPENJSON(@Json)
		   WITH (
			   id				INT '$.id',
			   id_categoria		INT '$.categoria.id',
			   id_estado		INT '$.estado.id',
			   fecha_limite		DATE '$.fecha_limite',
			   nombre			VARCHAR(50) '$.nombre',
			   descripcion		VARCHAR(MAX) '$.descripcion'
		   )) AS SOURCE

	ON (TARGET.id = SOURCE.id)
	WHEN MATCHED THEN

		UPDATE 
			SET	id_categoria = SOURCE.id_categoria,
				id_estado = SOURCE.id_estado,
				fecha_limite = SOURCE.fecha_limite,
				nombre = SOURCE.nombre,
				descripcion = SOURCE.descripcion
			
	WHEN NOT MATCHED THEN 

		INSERT (id_categoria,
				id_estado,
				fecha_limite,
				nombre,
				descripcion)
		VALUES (
				SOURCE.id_categoria,
				SOURCE.id_estado,
				SOURCE.fecha_limite,
				SOURCE.nombre,
				SOURCE.descripcion)

	OUTPUT inserted.id INTO @registro_procesado;


	SELECT id
	FROM @registro_procesado

END
GO



IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tareas_consultar]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
	DROP PROCEDURE [dbo].[tareas_consultar]
END
GO

-- ==================================================================================================================
-- Author:	 Cristian Pérez <cristianperez@outlook.com>
-- Create date: 27/10/2023
-- Description: Consulta todos las tareas.
-- ==================================================================================================================
CREATE PROCEDURE [dbo].[tareas_consultar]
AS 
BEGIN

		SELECT T.id
			  ,T.id_categoria
			  ,C.nombre as nombre_categoria
			  ,T.id_estado
			  ,E.nombre as nombre_estado
			  ,T.fecha_limite
			  ,T.nombre
			  ,T.descripcion
		  FROM dbo.tareas T
		  INNER JOIN dbo.categorias C ON C.id = T.id_categoria
		  INNER JOIN dbo.estados E ON E.id = T.id_estado

END
GO



IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[estados_consultar]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
	DROP PROCEDURE [dbo].[estados_consultar]
END
GO

-- ==================================================================================================================
-- Author:	 Cristian Pérez <cristianperez@outlook.com>
-- Create date: 27/10/2023
-- Description: Consulta todos los estados.
-- ==================================================================================================================
CREATE PROCEDURE [dbo].[estados_consultar]
AS 
BEGIN

	SELECT id
		  ,nombre
	  FROM dbo.estados

END
GO



IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[categorias_consultar]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
	DROP PROCEDURE [dbo].[categorias_consultar]
END
GO

-- ==================================================================================================================
-- Author:	 Cristian Pérez <cristianperez@outlook.com>
-- Create date: 27/10/2023
-- Description: Consulta todos las categorías.
-- ==================================================================================================================
CREATE PROCEDURE [dbo].[categorias_consultar]
AS 
BEGIN

	SELECT id
		  ,nombre
	  FROM dbo.categorias

END
GO



IF EXISTS
(
    SELECT *
    FROM sysobjects
    WHERE id = OBJECT_ID(N'[dbo].[tareas_eliminar]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1
)
    BEGIN
        DROP PROCEDURE [dbo].[tareas_eliminar]
    END
GO

-- ==================================================================================================================
-- Author:	 Cristian Pérez <cristianperez@outlook.com>
-- Create date: 28/10/2023
-- Description: Borra una tarea
-- ==================================================================================================================
CREATE PROCEDURE [dbo].[tareas_eliminar]
(
    @id  INT
)
AS
     BEGIN

	   DELETE FROM tareas WHERE id = @Id

     END
GO


IF EXISTS
(
    SELECT *
    FROM sysobjects
    WHERE id = OBJECT_ID(N'[dbo].[tareas_consultar_id]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1
)
    BEGIN
        DROP PROCEDURE [dbo].[tareas_consultar_id]
    END
GO

-- ==================================================================================================================
-- Author:	 Cristian Pérez <cristianperez@outlook.com>
-- Create date: 28/10/2023
-- Description: Consulta la tarea asociada con el identificador
-- ==================================================================================================================
CREATE PROCEDURE [dbo].[tareas_consultar_id]
(
    @id INT
)
AS
     BEGIN

		SELECT T.id
			  ,T.id_categoria
			  ,C.nombre as nombre_categoria
			  ,T.id_estado
			  ,E.nombre as nombre_estado
			  ,T.fecha_limite
			  ,T.nombre
			  ,T.descripcion
		  FROM dbo.tareas T
		  INNER JOIN dbo.categorias C ON C.id = T.id_categoria
		  INNER JOIN dbo.estados E ON E.id = T.id_estado
		  WHERE T.id = @id

     END
GO