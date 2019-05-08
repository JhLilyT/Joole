use [dbJooleMarketplace]
CREATE TABLE [dbo].[tblProject](
    [Project_ID] [int] NOT NULL,
    [Project_Name] [nchar](30) NOT NULL,
    [User_Id] [int] NOT NULL,
    [Project_Address1] [nvarchar](50) NOT NULL,
    [Project_Address2] [nvarchar](50) NOT NULL,
    [Project_City] [int] NOT NULL,
    [Project_State] [int] NOT NULL,
    [Project_Size] [nvarchar](50) NOT NULL,
    [Client_Name] [nvarchar](50) NOT NULL,
CONSTRAINT [PK_tblProject] PRIMARY KEY CLUSTERED
(
    [Project_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tblProject]  WITH CHECK ADD  CONSTRAINT [FK_tblProject_tblCity] FOREIGN KEY([Project_ID])
REFERENCES [dbo].[tblCity] ([City_ID])
GO

ALTER TABLE [dbo].[tblProject] CHECK CONSTRAINT [FK_tblProject_tblCity]
GO

ALTER TABLE [dbo].[tblProject]  WITH CHECK ADD  CONSTRAINT [FK_tblProject_tblState] FOREIGN KEY([Project_ID])
REFERENCES [dbo].[tblState] ([State_ID])
GO

ALTER TABLE [dbo].[tblProject] CHECK CONSTRAINT [FK_tblProject_tblState]
GO

ALTER TABLE [dbo].[tblProject]  WITH CHECK ADD  CONSTRAINT [FK_tblProject_tblUser] FOREIGN KEY([Project_ID])
REFERENCES [dbo].[tblUser] ([User_ID])
GO

ALTER TABLE [dbo].[tblProject] CHECK CONSTRAINT [FK_tblProject_tblUser]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblState](
    [State_ID] [int] NOT NULL,
    [State_Name] [nvarchar](50) NOT NULL,
CONSTRAINT [PK_tblState] PRIMARY KEY CLUSTERED
(
    [State_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblCity](
    [City_ID] [int] NOT NULL,
    [City_Name] [nvarchar](50) NOT NULL,
    [State_ID] [int] NOT NULL,
CONSTRAINT [PK_tblCity] PRIMARY KEY CLUSTERED
(
    [City_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tblCity]  WITH CHECK ADD  CONSTRAINT [FK_tblCity_tblState] FOREIGN KEY([City_ID])
REFERENCES [dbo].[tblState] ([State_ID])
GO

ALTER TABLE [dbo].[tblCity] CHECK CONSTRAINT [FK_tblCity_tblState]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblProperty](
    [Property_ID] [int] NOT NULL,
    [Property_Name] [nvarchar](50) NOT NULL,
    [IsType] [bit] NOT NULL,
    [IsTechSpec] [bit] NOT NULL,
CONSTRAINT [PK_tblProperty] PRIMARY KEY CLUSTERED
(
    [Property_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

create table tblUser(
User_ID int identity primary key,
User_Name varchar(500),
User_Email varchar(255),
User_Image varbinary(max),
User_Password varchar(500)
)

create table tblProduct(
Product_ID int identity primary key,
Product_Name varchar(500),
Product_Image varbinary(max),
Manufacturer_Name varchar(500),
Category_Name varchar(500),
Model varchar(500),
Model_Year int,
Series int,
Use_Type varchar(500),
Application_Place varchar(500),
Mounting_Location varchar(500),
Accessories varchar(500),
Fans_Airflow int,
Fans_MaxPower int,
Fans_MaxSpeed int,
Fans_SeepDiameter int,
TVs_ScreenSize int,
TVs_Resolution varchar(500),
TVs_Color varchar(500),
TVs_Types varchar(500),
)

create table tblManufacturer(
Manufacturer_ID int Primary key,
Manufactorer_Name varchar,
Manufacturer_Department varchar,
Manufacturer_Web varchar,
)

create table tblDepartment (
	Department_ID	int		not null primary key,
	Manufacturer_ID	int,
	Department_Name		varchar(50)	not null,
	Department_Phone	varchar(50)	not null,
	Department_Email	varchar(50)	not null,
	CONSTRAINT FK_Manufacturer_ID FOREIGN KEY (Manufacturer_ID)
	REFERENCES tblManufacturer(Manufacturer_ID)
	);

create table tblSales (
	Sales_ID			int			not null	primary key,
	Sales_Name			varchar(50)		not null,
	Sales_Phone			varchar(50)		not null,
	Sales_Email			varchar(50)		not null,
	Sales_Web			varchar(50)
	);

create table tblCategory (
	Category_ID			int		not null		primary key,
	Category_Name	varchar(50)		not null,
	);

create table tblSubCategory (
	SubCategory_ID		int		not null	primary key,
	Category_ID			int		not null,
	SubCategory_name	varchar(50)		not null,
	CONSTRAINT FK_Category_ID FOREIGN KEY (Category_ID)
	REFERENCES tblCategory(Category_ID)
	);

create table tblDocuemnt (
	Document_ID			int		not null		primary key,
	Document_Folder_Path	varchar(200)		not null,
	);

/******table Credentials******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblCredential](
	[Credential_ID] [int] NOT NULL,
	[User_Type] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Credential_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/******table Feedback******/

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblFeedBack](
	[FeedBack_ID] [int] NOT NULL,
	[User_ID] [int] NULL,
	[Product_ID] [int] NULL,
	[Feedback_Time] [datetime] NOT NULL,
	[Feedback_Score] [int] NOT NULL,
	[Feedback_Content] [text] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FeedBack_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


ALTER TABLE [dbo].[tblFeedBack]  WITH CHECK ADD FOREIGN KEY([Product_ID])
REFERENCES [dbo].[tblProduct] ([Product_ID])


ALTER TABLE [dbo].[tblFeedBack]  WITH CHECK ADD FOREIGN KEY([User_ID])
REFERENCES [dbo].[tblUser] ([User_ID])
Go


/******table ProjToProd******/

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblProjToProd](
	[Project_ID] [int] NOT NULL,
	[Product_ID] [int] NOT NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_tblProjToProd] PRIMARY KEY CLUSTERED 
(
	[Project_ID] ASC,
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tblProjToProd]  WITH CHECK ADD FOREIGN KEY([Product_ID])
REFERENCES [dbo].[tblProduct] ([Product_ID])
GO

ALTER TABLE [dbo].[tblProjToProd]  WITH CHECK ADD FOREIGN KEY([Project_ID])
REFERENCES [dbo].[tblProject] ([Project_ID])
GO


/******table Property Value******/

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblPropertyValue](
	[Property_ID] [int] NOT NULL,
	[Product_ID] [int] NOT NULL,
	[Value] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblPropertyValue] PRIMARY KEY CLUSTERED 
(
	[Property_ID] ASC,
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tblPropertyValue]  WITH CHECK ADD FOREIGN KEY([Product_ID])
REFERENCES [dbo].[tblProduct] ([Product_ID])
GO

ALTER TABLE [dbo].[tblPropertyValue]  WITH CHECK ADD FOREIGN KEY([Property_ID])
REFERENCES [dbo].[tblProperty] ([Property_ID])
GO


/******table Type Filter******/

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblTypeFilter](
	[Property_ID] [int] NOT NULL,
	[SubCategory_ID] [int] NOT NULL,
	[Type_Name] [nvarchar](50) NOT NULL,
	[Type_Options] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblTypeFilter] PRIMARY KEY CLUSTERED 
(
	[Property_ID] ASC,
	[SubCategory_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tblTypeFilter]  WITH CHECK ADD FOREIGN KEY([Property_ID])
REFERENCES [dbo].[tblProperty] ([Property_ID])
GO

ALTER TABLE [dbo].[tblTypeFilter]  WITH CHECK ADD FOREIGN KEY([SubCategory_ID])
REFERENCES [dbo].[tblSubCategory] ([SubCategory_ID])
GO

ALTER TABLE tblUser 
ADD FOREIGN KEY (Credential_ID) REFERENCES tblCredential(Credential_ID);

ALTER TABLE tblProject
ADD FOREIGN KEY (User_Id) REFERENCES tblUser(User_Id);

ALTER TABLE tblProject
ADD FOREIGN KEY (Project_City) REFERENCES tblCity(City_ID);

ALTER TABLE tblProject
ADD FOREIGN KEY (Project_State) REFERENCES tblState(State_ID);

ALTER TABLE tblCity
ADD FOREIGN KEY (State_ID) REFERENCES tblState(State_ID);

ALTER TABLE tblFeedBack
ADD FOREIGN KEY (User_ID) REFERENCES tblUser(User_ID);

ALTER TABLE tblFeedBack
ADD FOREIGN KEY (Product_ID) REFERENCES tblProduct(Product_ID);

ALTER TABLE tblProjToProd
ADD FOREIGN KEY (Project_ID) REFERENCES tblProject(Project_ID);

ALTER TABLE tblProjToProd
ADD FOREIGN KEY (Product_ID) REFERENCES tblProduct(Product_ID);

ALTER TABLE tblPropertyValue
ADD FOREIGN KEY (Property_ID) REFERENCES tblProperty(Property_ID);

ALTER TABLE tblPropertyValue
ADD FOREIGN KEY (Product_ID) REFERENCES tblProduct(Product_ID);

ALTER TABLE tblTypeFilter
ADD FOREIGN KEY (Property_ID) REFERENCES tblProperty(Property_ID);

ALTER TABLE tblTypeFilter
ADD FOREIGN KEY (SubCategory_ID) REFERENCES tblSubCategory(SubCategory_ID);
