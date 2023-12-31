
SET IDENTITY_INSERT [dbo].[categorias] ON 
GO
INSERT [dbo].[categorias] ([id], [nombre]) VALUES (1, N'Trabajo')
GO
INSERT [dbo].[categorias] ([id], [nombre]) VALUES (2, N'Estudio')
GO
INSERT [dbo].[categorias] ([id], [nombre]) VALUES (3, N'Hogar')
GO
SET IDENTITY_INSERT [dbo].[categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[estados] ON 
GO
INSERT [dbo].[estados] ([id], [nombre]) VALUES (1, N'Tareas por hacer')
GO
INSERT [dbo].[estados] ([id], [nombre]) VALUES (2, N'En proceso')
GO
INSERT [dbo].[estados] ([id], [nombre]) VALUES (3, N'Completadas')
GO
SET IDENTITY_INSERT [dbo].[estados] OFF
GO
SET IDENTITY_INSERT [dbo].[tareas] ON 
GO
INSERT [dbo].[tareas] ([id], [id_categoria], [id_estado], [fecha_limite], [nombre], [descripcion]) VALUES (21, 3, 1, CAST(N'2023-10-31' AS Date), N'Tender la cama', N'Arreglar las sábanas y almohadas en la cama.')
GO
INSERT [dbo].[tareas] ([id], [id_categoria], [id_estado], [fecha_limite], [nombre], [descripcion]) VALUES (22, 3, 1, CAST(N'2023-11-02' AS Date), N'Preparar el desayuno', N'Cocinar o servir el desayuno.')
GO
INSERT [dbo].[tareas] ([id], [id_categoria], [id_estado], [fecha_limite], [nombre], [descripcion]) VALUES (23, 3, 2, CAST(N'2023-11-10' AS Date), N'Lavar la ropa', N'Prender lavadora, secar y doblar la ropa')
GO
INSERT [dbo].[tareas] ([id], [id_categoria], [id_estado], [fecha_limite], [nombre], [descripcion]) VALUES (24, 2, 1, CAST(N'2023-11-12' AS Date), N'Estudiar para un examen', N'Repasar el contenido para un examen.')
GO
INSERT [dbo].[tareas] ([id], [id_categoria], [id_estado], [fecha_limite], [nombre], [descripcion]) VALUES (25, 2, 2, CAST(N'2023-11-14' AS Date), N'Realizar trabajos escritos', N'Completar tareas escritas asignadas.')
GO
INSERT [dbo].[tareas] ([id], [id_categoria], [id_estado], [fecha_limite], [nombre], [descripcion]) VALUES (26, 1, 3, CAST(N'2023-11-22' AS Date), N'Responder correos', N'Revisar y contestar correos.')
GO
INSERT [dbo].[tareas] ([id], [id_categoria], [id_estado], [fecha_limite], [nombre], [descripcion]) VALUES (27, 1, 2, CAST(N'2023-11-29' AS Date), N'Hacer llamadas de seguimiento', N'Realizar llamadas de seguimiento.')
GO
INSERT [dbo].[tareas] ([id], [id_categoria], [id_estado], [fecha_limite], [nombre], [descripcion]) VALUES (28, 1, 3, CAST(N'2023-11-23' AS Date), N'Realizar llamadas de seguimiento.', N'Revisar desempeño y fijar objetivos.')
GO
SET IDENTITY_INSERT [dbo].[tareas] OFF
GO
