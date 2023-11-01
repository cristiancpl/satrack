
/****** Object:  Table [dbo].[categorias]    Script Date: 31/10/2023 9:52:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categorias](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_categorias] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estados]    Script Date: 31/10/2023 9:52:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estados](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_estados] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tareas]    Script Date: 31/10/2023 9:52:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tareas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_categoria] [int] NOT NULL,
	[id_estado] [int] NOT NULL,
	[fecha_limite] [date] NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](max) NULL,
 CONSTRAINT [PK_tareas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tareas]  WITH CHECK ADD  CONSTRAINT [FK_tareas_categorias] FOREIGN KEY([id_categoria])
REFERENCES [dbo].[categorias] ([id])
GO
ALTER TABLE [dbo].[tareas] CHECK CONSTRAINT [FK_tareas_categorias]
GO
ALTER TABLE [dbo].[tareas]  WITH CHECK ADD  CONSTRAINT [FK_tareas_estados] FOREIGN KEY([id_estado])
REFERENCES [dbo].[estados] ([id])
GO
ALTER TABLE [dbo].[tareas] CHECK CONSTRAINT [FK_tareas_estados]
GO
/****** Object:  StoredProcedure [dbo].[categorias_consultar]    Script Date: 31/10/2023 9:52:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  StoredProcedure [dbo].[estados_consultar]    Script Date: 31/10/2023 9:52:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  StoredProcedure [dbo].[tareas_consultar]    Script Date: 31/10/2023 9:52:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  StoredProcedure [dbo].[tareas_consultar_id]    Script Date: 31/10/2023 9:52:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  StoredProcedure [dbo].[tareas_eliminar]    Script Date: 31/10/2023 9:52:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  StoredProcedure [dbo].[tareas_merge_json]    Script Date: 31/10/2023 9:52:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
