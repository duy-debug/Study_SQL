
--CREATE DATABASE mydatabase;
CREATE DATABASE NVDB
ON
(	NAME ='nvdb_data',
	FILENAME = 'D:\Study_SQL\nvdb_data.mdf',
	SIZE = 10MB,
	MAXSIZE = 100MB,
	FILEGROWTH = 5MB)
LOG ON
(	NAME = 'dvdb_log',
	FILENAME = 'D:\Study_SQL\nvdb_data.ldf',
	SIZE = 5MB,
	MAXSIZE = 50MB,
	FILEGROWTH = 5MB)