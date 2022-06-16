
USE [Harvest]
GO

/****** Object:  Table [dbo].[GROWERS]    Script Date: 6/14/2022 10:29:36 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[GROWERS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [varchar](50) NOT NULL,
	[CITY] [varchar](50) NULL,
	[STATE] [varchar](50) NULL,
 CONSTRAINT [PK_GROWERS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[SHIPPER](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SHIPPER] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[FIELDS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GROWER_ID] [int] NOT NULL,
	[NAME] [varchar](50) NOT NULL,
	[SIZE] [real] NULL,
	[NEAREST_CITY] [varchar](50) NULL,
	[STATE] [varchar](50) NULL,
	[HARVEST_START_DATE] [date] NULL,
	[HARVEST_COMPLETE_DATE] [date] NULL,
 CONSTRAINT [PK_FIELDS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[FIELDS]  WITH CHECK ADD  CONSTRAINT [FK_FIELDS_GROWERS] FOREIGN KEY([GROWER_ID])
REFERENCES [dbo].[GROWERS] ([ID])
GO

ALTER TABLE [dbo].[FIELDS] CHECK CONSTRAINT [FK_FIELDS_GROWERS]
GO

CREATE TABLE [dbo].[TRUCKS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SHIPPER_ID] [int] NOT NULL,
	[NAME] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TRUCKS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TRUCKS]  WITH CHECK ADD  CONSTRAINT [FK_TRUCKS_SHIPPER] FOREIGN KEY([SHIPPER_ID])
REFERENCES [dbo].[SHIPPER] ([ID])
GO

ALTER TABLE [dbo].[TRUCKS] CHECK CONSTRAINT [FK_TRUCKS_SHIPPER]
GO

CREATE TABLE [dbo].[STATES](
	[STATE] [varchar](50) NOT NULL,
	[NEXT_STATE] [varchar](50) NOT NULL,
 CONSTRAINT [PK_STATES] PRIMARY KEY CLUSTERED 
(
	[STATE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



CREATE TABLE [dbo].[FIELD_TRUCK](
	[FIELD_ID] [int] NOT NULL,
	[TRUCK_ID] [int] NOT NULL,
	[CURRENT_STATE] [varchar](50) NULL,
 CONSTRAINT [PK_FIELD_TRUCK] PRIMARY KEY CLUSTERED 
(
	[FIELD_ID] ASC,
	[TRUCK_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[FIELD_TRUCK]  WITH CHECK ADD  CONSTRAINT [FK_FIELD_TRUCK_TRUCKS] FOREIGN KEY([TRUCK_ID])
REFERENCES [dbo].[TRUCKS] ([ID])
GO

ALTER TABLE [dbo].[FIELD_TRUCK] CHECK CONSTRAINT [FK_FIELD_TRUCK_TRUCKS]
GO

CREATE TABLE [dbo].[LOADS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FIELD_ID] [int] NOT NULL,
	[TRUCK_ID] [int] NOT NULL,
	[GROSS] [real] NULL,
	[TARE] [real] NULL,
	[NET] [real] NULL,
	[CREATED_DATE] [date] NULL,
	[DELIVERED_DATE] [date] NULL,
 CONSTRAINT [PK_LOADS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[LOADS]  WITH CHECK ADD  CONSTRAINT [FK_LOADS_FIELDS] FOREIGN KEY([FIELD_ID])
REFERENCES [dbo].[FIELDS] ([ID])
GO

ALTER TABLE [dbo].[LOADS] CHECK CONSTRAINT [FK_LOADS_FIELDS]
GO

ALTER TABLE [dbo].[LOADS]  WITH CHECK ADD  CONSTRAINT [FK_LOADS_TRUCKS] FOREIGN KEY([TRUCK_ID])
REFERENCES [dbo].[TRUCKS] ([ID])
GO

ALTER TABLE [dbo].[LOADS] CHECK CONSTRAINT [FK_LOADS_TRUCKS]
GO

ALTER TABLE [dbo].[FIELD_TRUCK]  WITH CHECK ADD  CONSTRAINT [FK_FIELD_TRUCK_STATES] FOREIGN KEY([CURRENT_STATE])
REFERENCES [dbo].[STATES] ([STATE])
GO

ALTER TABLE [dbo].[FIELD_TRUCK] CHECK CONSTRAINT [FK_FIELD_TRUCK_STATES]


CREATE TABLE [dbo].[FIELD_TRUCK_STATE_LOG](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FIELD_ID] [int] NOT NULL,
	[TRUCK_ID] [int] NOT NULL,
	[STATE] [varchar](50) NOT NULL,
	[ENTRY_TIME] [datetime] NOT NULL,
	[EXIT_TIME] [datetime] NULL,
 CONSTRAINT [PK_FIELD_TRUCK_STATE_LOG] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[FIELD_TRUCK_STATE_LOG]  WITH CHECK ADD  CONSTRAINT [FK_FIELD_TRUCK_STATE_LOG_FIELDS] FOREIGN KEY([FIELD_ID])
REFERENCES [dbo].[FIELDS] ([ID])
GO

ALTER TABLE [dbo].[FIELD_TRUCK_STATE_LOG] CHECK CONSTRAINT [FK_FIELD_TRUCK_STATE_LOG_FIELDS]
GO

ALTER TABLE [dbo].[FIELD_TRUCK_STATE_LOG]  WITH CHECK ADD  CONSTRAINT [FK_FIELD_TRUCK_STATE_LOG_TRUCKS] FOREIGN KEY([TRUCK_ID])
REFERENCES [dbo].[TRUCKS] ([ID])
GO

ALTER TABLE [dbo].[FIELD_TRUCK_STATE_LOG] CHECK CONSTRAINT [FK_FIELD_TRUCK_STATE_LOG_TRUCKS]
GO

USE [Harvest]
GO

/****** Object:  Table [dbo].[FIELD_TRUCK_STATE_LOG]    Script Date: 6/15/2022 2:32:08 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FIELD_TRUCK_STATE_LOG](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FIELD_ID] [int] NOT NULL,
	[TRUCK_ID] [int] NOT NULL,
	[STATE] [varchar](50) NOT NULL,
	[ENTRY_TIME] [datetime] NOT NULL,
	[EXIT_TIME] [datetime] NULL,
 CONSTRAINT [PK_FIELD_TRUCK_STATE_LOG] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[FIELD_TRUCK_STATE_LOG]  WITH CHECK ADD  CONSTRAINT [FK_FIELD_TRUCK_STATE_LOG_FIELDS] FOREIGN KEY([FIELD_ID])
REFERENCES [dbo].[FIELDS] ([ID])
GO

ALTER TABLE [dbo].[FIELD_TRUCK_STATE_LOG] CHECK CONSTRAINT [FK_FIELD_TRUCK_STATE_LOG_FIELDS]
GO

ALTER TABLE [dbo].[FIELD_TRUCK_STATE_LOG]  WITH CHECK ADD  CONSTRAINT [FK_FIELD_TRUCK_STATE_LOG_TRUCKS] FOREIGN KEY([TRUCK_ID])
REFERENCES [dbo].[TRUCKS] ([ID])
GO

ALTER TABLE [dbo].[FIELD_TRUCK_STATE_LOG] CHECK CONSTRAINT [FK_FIELD_TRUCK_STATE_LOG_TRUCKS]
GO

ALTER TABLE [dbo].[FIELD_TRUCK_STATE_LOG]  WITH CHECK ADD  CONSTRAINT [FK_FIELD_TRUCK_STATE_LOG_STATES] FOREIGN KEY([STATE])
REFERENCES [dbo].[STATES] ([STATE])
GO

ALTER TABLE [dbo].[FIELD_TRUCK_STATE_LOG] CHECK CONSTRAINT [FK_FIELD_TRUCK_STATE_LOG_STATES]
GO

USE [Harvest]
GO

CREATE TABLE [dbo].[FIELD_TRUCK_STATE](
	[FIELD] [varchar](50) NOT NULL,
	[TRUCK] [varchar](50) NOT NULL,
	[CURRENT_STATE] [varchar](50) NOT NULL,
	[GROWER] [varchar](50) NOT NULL,
 CONSTRAINT [PK_FIELD_TRUCK_STATE] PRIMARY KEY CLUSTERED 
(
	[FIELD] ASC,
	[TRUCK] ASC
)
) ON [PRIMARY]
GO


USE [Harvest]
GO

CREATE TABLE [dbo].[FIELD_TRUCK_LOAD](
	[FIELD] [varchar](50) NOT NULL,
	[TRUCK] [varchar](50) NOT NULL,
	[LOAD_NUM] [int] NOT NULL,
	[GROSS] [real] NOT NULL,
	[TARE] [real] NOT NULL,
	[NET] [real] NOT NULL,
	[DATE] [date] NOT NULL,
 CONSTRAINT [PK_FIELD_TRUCK_LOAD] PRIMARY KEY CLUSTERED 
(
	[FIELD] ASC,
	[TRUCK] ASC,
	[LOAD_NUM] ASC
)
) ON [PRIMARY]
GO





USE [Harvest]
GO

INSERT INTO [dbo].[GROWERS]
           ([NAME], [CITY], [STATE])
     VALUES
           ('MFarms', 'Pullman', 'WA'),
           ('DFarms', 'Palouse', 'WA'),
           ('KFarms', 'Garfield', 'WA'),
           ('SFarms', 'Albion', 'WA');
          
GO

INSERT INTO [dbo].[SHIPPER]
           ([NAME])
     VALUES
           ('MFarmsShipper'),
           ('DFarmShipper'),
           ('KFarmsShipper'),
           ('SFarmsShipper');
GO  

INSERT INTO [dbo].[TRUCKS]
           ([SHIPPER_ID], [NAME])
     VALUES
           (1, 'MT1'),
           (1, 'MT2'),
           (1, 'MT3'),
           (1, 'MT4'),
           (2, 'DT1'),
           (2, 'DT2'),
           (2, 'DT3'),
           (2, 'DT4'),
           (3, 'KT1'),
           (3, 'KT2'),
           (3, 'KT3'),
           (3, 'KT4'),
           (4, 'ST1'),
           (4, 'ST2'),
           (4, 'ST3'),
           (4, 'ST4');  
GO                

INSERT INTO [dbo].[FIELDS]
           ([GROWER_ID], [NAME], [SIZE], [NEAREST_CITY], [STATE])
     VALUES
           (1, 'MF1', 300, 'PULLMAN', 'WA'),
           (1, 'MF2', 400, 'PALOUSE', 'WA'),
           (1, 'MF3', 550, 'GARFIELD', 'WA'),
           (1, 'MF4', 500, 'ALBION', 'WA'),
           (2, 'DF1', 450, 'COLFAX', 'WA'),
           (2, 'DF2', 550, 'DUSTY', 'WA'), 
           (2, 'DF3', 550, 'LaGrange', 'WA'),
           (2, 'DF4', 550, 'DAYTON', 'WA'),
           (3, 'KF1', 550, 'PRESTON', 'WA'),
           (3, 'KF2', 550, 'PENAWAWA', 'WA'),
           (3, 'KF3', 550, 'ENDICOT', 'WA'),
           (3, 'KF4', 550, 'STEPTOE', 'WA'),
           (4, 'SF1', 550, 'FARMINGTON', 'WA'),
           (4, 'SF2', 550, 'PULLMAN', 'WA'),
           (4, 'SF3', 550, 'PALOUSE', 'WA'),
           (4, 'SF4', 550, 'ALBION', 'WA');   
GO   

INSERT INTO [dbo].[FIELD_TRUCK]
           ([FIELD_ID], [TRUCK_ID] )
     VALUES
           (1, 1),
           (1, 2),
           (1, 3),
           (1, 4),
           (2, 1),
           (2, 2), 
           (2, 3),
           (2, 4),
           (3, 1),
           (3, 2),
           (3, 3),
           (3, 4),
           (4, 1),
           (4, 2),
           (4, 3),
           (4, 4),
           (5, 5),
           (5, 6),
           (5, 7),
           (5, 8),
           (6, 5),
           (6, 6), 
           (6, 7),
           (6, 8),
           (7, 5),
           (7, 6),
           (7, 7),
           (7, 8),
           (8, 5),
           (8, 6),
           (8, 7),
           (8, 8),
           (9, 9),
           (9, 10),
           (9, 11),
           (9, 12),
           (10, 9),
           (10, 10), 
           (10, 11),
           (10, 12),
           (11, 9),
           (11, 10),
           (11, 11),
           (11, 12),
           (12, 9),
           (12, 10),
           (12, 11),
           (12, 12),
           (13, 13),
           (13, 14),
           (13, 15),
           (13, 16),
           (14, 13),
           (14, 14), 
           (14, 15),
           (14, 16),
           (15, 13),
           (15, 14),
           (15, 15),
           (15, 16),
           (16, 13),
           (16, 14),
           (16, 15),
           (16, 16);                           
GO

insert into states (state, next_state) 
values
('WAITING_TO_LOAD', 'LOADING'),
('LOADING', 'ENROUTE_TO_STORAGE'),
('ENROUTE_TO_STORAGE', 'WAITING_TO_UNLOAD'),
('WAITING_TO_UNLOAD', 'UNLOADING'),
('UNLOADING', 'ENROUTE_TO_FIELD'),
('ENROUTE_TO_FIELD', 'WAITING_TO_LOAD')
GO

 insert into field_truck_state (grower, field, truck, current_state)
 select g.name, f.name, t.name, 'WAITING_TO_LOAD' from dbo.growers g, fields f, dbo.trucks t, dbo.field_truck ft
 where
 f.grower_id = g.id and
 ft.field_id =  f.id and
 ft.truck_id = t.id

 INSERT INTO [dbo].[FIELD_TRUCK_LOAD]
           ([FIELD]
           ,[TRUCK]
           ,[LOAD_NUM]
           ,[GROSS]
           ,[TARE]
           ,[NET]
           ,[DATE])
     VALUES
           ('MF1', 'MT1', 1, 100050, 45000, 55050, GETDATE()),
		   ('MF1', 'MT2', 2, 101050, 43000, 58050, GETDATE()),
		   ('MF1', 'MT3', 3, 102050, 44000, 58050, GETDATE()),
		   ('MF1', 'MT4', 4, 99050, 42000, 57050, GETDATE()),
		   ('MF1', 'MT1', 5, 106050, 46000, 60050, GETDATE()),
		   ('MF2', 'MT2', 1, 100050, 45000, 55050, GETDATE()),
		   ('MF2', 'MT3', 2, 101050, 43000, 58050, GETDATE()),
		   ('MF2', 'MT4', 3, 102050, 44000, 58050, GETDATE()),
		   ('MF2', 'MT1', 4, 99050, 42000, 57050, GETDATE()),
		   ('MF2', 'MT2', 5, 106050, 46000, 60050, GETDATE())

GO