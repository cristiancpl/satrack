
SET IDENTITY_INSERT [dbo].[Ciudades] ON 

GO
INSERT [dbo].[Ciudades] ([id], [nombre]) VALUES (1, N'Bogotá Aeropuerto Int''l El Dorado')
GO
INSERT [dbo].[Ciudades] ([id], [nombre]) VALUES (2, N'Medellín Aeropuerto Int''l José Ma. Córdova')
GO
INSERT [dbo].[Ciudades] ([id], [nombre]) VALUES (3, N'Medellín Aeropuerto Olaya Herrera')
GO
INSERT [dbo].[Ciudades] ([id], [nombre]) VALUES (4, N'Barranquilla Aeropuerto Int''l Ernesto Cortissoz')
GO
INSERT [dbo].[Ciudades] ([id], [nombre]) VALUES (5, N'Cartagena Aeropuerto Int''l Rafael Núñez')
GO
INSERT [dbo].[Ciudades] ([id], [nombre]) VALUES (6, N'Santa Marta Aeropuerto Int''l Simón Bolívar')
GO
INSERT [dbo].[Ciudades] ([id], [nombre]) VALUES (7, N'Buenaventura Aeropuerto Gerardo Tobar')
GO
INSERT [dbo].[Ciudades] ([id], [nombre]) VALUES (8, N'Cali Aeropuerto Int''l Alfonso Bonilla')
GO
INSERT [dbo].[Ciudades] ([id], [nombre]) VALUES (9, N'San Andrés Aeropuerto Int''l Gustavo Rojas')
GO
SET IDENTITY_INSERT [dbo].[Ciudades] OFF
GO
SET IDENTITY_INSERT [dbo].[Estados] ON 

GO
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (1, N'Disponible')
GO
INSERT [dbo].[Estados] ([id], [nombre]) VALUES (2, N'Cancelado')
GO
SET IDENTITY_INSERT [dbo].[Estados] OFF
GO
SET IDENTITY_INSERT [dbo].[Aerolineas] ON 

GO
INSERT [dbo].[Aerolineas] ([id], [nombre]) VALUES (1, N'Avianca')
GO
INSERT [dbo].[Aerolineas] ([id], [nombre]) VALUES (2, N'Copa Airlines')
GO
INSERT [dbo].[Aerolineas] ([id], [nombre]) VALUES (3, N'EasyFly')
GO
INSERT [dbo].[Aerolineas] ([id], [nombre]) VALUES (4, N'LATAM')
GO
INSERT [dbo].[Aerolineas] ([id], [nombre]) VALUES (5, N'Viva Colombia')
GO
INSERT [dbo].[Aerolineas] ([id], [nombre]) VALUES (6, N'West Caribbean Airways')
GO
INSERT [dbo].[Aerolineas] ([id], [nombre]) VALUES (7, N'LAN')
GO
SET IDENTITY_INSERT [dbo].[Aerolineas] OFF
GO
SET IDENTITY_INSERT [dbo].[Vuelos] ON 

GO
INSERT [dbo].[Vuelos] ([id], [id_aerolinea], [id_ciudad_origen], [id_ciudad_destino], [id_estado], [tarifa], [fecha], [total_asientos], [asientos_ocupados]) VALUES (1, 1, 1, 9, 1, 150000, CAST(N'2016-08-21' AS Date), 50, 3)
GO
INSERT [dbo].[Vuelos] ([id], [id_aerolinea], [id_ciudad_origen], [id_ciudad_destino], [id_estado], [tarifa], [fecha], [total_asientos], [asientos_ocupados]) VALUES (2, 2, 2, 8, 1, 200000, CAST(N'2016-08-22' AS Date), 40, 3)
GO
INSERT [dbo].[Vuelos] ([id], [id_aerolinea], [id_ciudad_origen], [id_ciudad_destino], [id_estado], [tarifa], [fecha], [total_asientos], [asientos_ocupados]) VALUES (3, 3, 3, 7, 1, 170000, CAST(N'2016-08-23' AS Date), 55, 2)
GO
INSERT [dbo].[Vuelos] ([id], [id_aerolinea], [id_ciudad_origen], [id_ciudad_destino], [id_estado], [tarifa], [fecha], [total_asientos], [asientos_ocupados]) VALUES (4, 4, 4, 6, 1, 90000, CAST(N'2016-08-23' AS Date), 55, 1)
GO
INSERT [dbo].[Vuelos] ([id], [id_aerolinea], [id_ciudad_origen], [id_ciudad_destino], [id_estado], [tarifa], [fecha], [total_asientos], [asientos_ocupados]) VALUES (7, 4, 7, 3, 1, 100000, CAST(N'2016-08-24' AS Date), 55, 2)
GO
INSERT [dbo].[Vuelos] ([id], [id_aerolinea], [id_ciudad_origen], [id_ciudad_destino], [id_estado], [tarifa], [fecha], [total_asientos], [asientos_ocupados]) VALUES (10, 7, 2, 7, 1, 170000, CAST(N'2016-08-21' AS Date), 55, 1)
GO
SET IDENTITY_INSERT [dbo].[Vuelos] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

GO
INSERT [dbo].[Usuarios] ([id], [nombre_usuario], [contrasena], [fecha_nacimiento]) VALUES (1, N'cperez', N'123', CAST(N'1993-01-19' AS Date))
GO
INSERT [dbo].[Usuarios] ([id], [nombre_usuario], [contrasena], [fecha_nacimiento]) VALUES (2, N'juli', N'33', CAST(N'1993-01-19' AS Date))
GO
INSERT [dbo].[Usuarios] ([id], [nombre_usuario], [contrasena], [fecha_nacimiento]) VALUES (3, N't', N't', CAST(N'1993-01-19' AS Date))
GO
INSERT [dbo].[Usuarios] ([id], [nombre_usuario], [contrasena], [fecha_nacimiento]) VALUES (4, N'2', N'2', CAST(N'2016-08-01' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
SET IDENTITY_INSERT [dbo].[Reservas] ON 

GO
INSERT [dbo].[Reservas] ([id], [id_vuelo], [id_usuario]) VALUES (4, 1, 1)
GO
INSERT [dbo].[Reservas] ([id], [id_vuelo], [id_usuario]) VALUES (5, 2, 1)
GO
INSERT [dbo].[Reservas] ([id], [id_vuelo], [id_usuario]) VALUES (8, 1, 3)
GO
INSERT [dbo].[Reservas] ([id], [id_vuelo], [id_usuario]) VALUES (9, 2, 3)
GO
SET IDENTITY_INSERT [dbo].[Reservas] OFF
GO
