﻿--Tạo cơ sở dữ liệu lớp 1907
CREATE DATABASE db_1907
GO

 USE db_1907
 GO
 
--Tạo bảng sinh viên
CREATE TABLE tbStudent
(
	st_id VARCHAR(5) NOT NULL PRIMARY KEY,
	st_name NVARCHAR(40) NOT NULL, 
	st_gender BIT NOT NULL DEFAULT 1,
	st_dob DATE,
	st_add VARCHAR(50)
)
GO	

ALTER TABLE dbo.tbStudent
		ALTER COLUMN st_name NVARCHAR(60) NOT NULL
GO	

ALTER TABLE dbo.tbStudent
		ADD	st_iq TINYINT
GO	

CREATE TABLE tbExample
(
	person_id UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
	person_name NVARCHAR(60) NOT NULL
);
GO	

INSERT dbo.tbExample
	(person_name)
VALUES
    (N'Kim Dung'   -- person_name - nvarchar(60)   ),
    (N'Bảo Bảo'   -- person_name - nvarchar(60)	   ),
    (N'Ngọc Huyền'   -- person_name - nvarchar(60) ),
    (N'Hoàng Anh'   -- person_name - nvarchar(60)  ),
    (N'Minh Tâm'   -- person_name - nvarchar(60)   )
GO	

SELECT * FROM dbo.tbExample
GO	

--Tạo bảng môn học
CREATE TABLE tbSubject
(
	sub_id TINYINT IDENTITY(100,5) PRIMARY KEY,
	sub_name VARCHAR(30) UNIQUE NOT NULL,
	sub_fee SMALLINT NOT NULL DEFAULT 100 ,
	sub_hours TINYINT NOT NULL
)
GO	

--Tạo bảng Kiểm tra
CREATE TABLE tbExam
(
	exam_id INT IDENTITY(1000,1) PRIMARY KEY,
	st_id VARCHAR(5) NOT NULL,
	sub_id TINYINT NOT NULL,
	mark TINYINT,
	FOREIGN KEY (st_id) REFERENCES dbo.tbStudent,
	FOREIGN KEY (sub_id) REFERENCES dbo.tbSubject	
)
GO	


-- Thêm 1 ràng buộc kiểm tra điểm phải trong giới hạn 0>100
ALTER TABLE dbo.tbExam
	ADD CONSTRAINT ckMark CHECK (mark >=0 AND mark <=100);
GO	


ALTER TABLE dbo.tbStudent
	ADD	CONSTRAINT ckIQ CHECK	(st_iq BETWEEN 80 AND 160);
GO 


-- Tạo dữ liệu cho bảng Student
SELECT * FROM dbo.tbStudent
GO	

INSERT dbo.tbStudent
(
    st_id,
    st_name,
    st_gender,
    st_dob,
    st_add,
    st_iq
)
VALUES
(   'ST01',        -- st_id - varchar(5)
    N'Hoàng Minh Tâm',       -- st_name - nvarchar(60)
    1,      -- st_gender - bit
    '19920309', -- st_dob - date
    'CMT8',        -- st_add - varchar(50)
    150          -- st_iq - tinyint
),
(   'ST02',        -- st_id - varchar(5)
    N'Ngô Thị Đoan Dung',       -- st_name - nvarchar(60)
    0,      -- st_gender - bit
    '20011231', -- st_dob - date
    'CMT8',        -- st_add - varchar(50)
    140          -- st_iq - tinyint
),
(   'ST03',        -- st_id - varchar(5)
    N'Nguyễn Ngọc Huyền',       -- st_name - nvarchar(60)
    0,      -- st_gender - bit
    '20060401', -- st_dob - date
    'Nam Kỳ Khởi Nghĩa',        -- st_add - varchar(50)
    120          -- st_iq - tinyint
)
GO	


INSERT dbo.tbStudent
(
    st_id,
    st_name,
    st_gender,
    st_dob,
    st_add,
    st_iq
)
VALUES
(   'ST04',        -- st_id - varchar(5)
    N'Bùi Đình Hùng',       -- st_name - nvarchar(60)
    1,      -- st_gender - bit
    '20011002', -- st_dob - date
    'Tân Phú',        -- st_add - varchar(50)
    120          -- st_iq - tinyint
),
(   'ST05',        -- st_id - varchar(5)
    N'Nguyễn Đình Huy',       -- st_name - nvarchar(60)
    1,      -- st_gender - bit
    '20010520', -- st_dob - date
    'DakLak',        -- st_add - varchar(50)
    80          -- st_iq - tinyint
),
(   'ST06',        -- st_id - varchar(5)
    N'Lôi Bửu Bửu',       -- st_name - nvarchar(60)
    0,      -- st_gender - bit
    '20080524', -- st_dob - date
    'LonDon',        -- st_add - varchar(50)
    145          -- st_iq - tinyint
),
(   'ST07',        -- st_id - varchar(5)
    N'Nguyễn Ngọc Thiên Kim',       -- st_name - nvarchar(60)
    0,      -- st_gender - bit
    '20021010', -- st_dob - date
    'Đồng Nai',        -- st_add - varchar(50)
    81         -- st_iq - tinyint
),
(   'ST08',        -- st_id - varchar(5)
    N'Phạm Trọng Nghĩa',       -- st_name - nvarchar(60)
    1,      -- st_gender - bit
    '20001231', -- st_dob - date
    'Nam Định',        -- st_add - varchar(50)
    100          -- st_iq - tinyint
),
(   'ST09',        -- st_id - varchar(5)
    N'Lương Trúc Quỳnh',       -- st_name - nvarchar(60)
    0,      -- st_gender - bit
    '20010725', -- st_dob - date
    'Tây Ninh',        -- st_add - varchar(50)
    99          -- st_iq - tinyint
),
(   'ST10',        -- st_id - varchar(5)
    N'Võ Hoàng Trung',       -- st_name - nvarchar(60)
    1,      -- st_gender - bit
    '20010607', -- st_dob - date
    'Hà Nội',        -- st_add - varchar(50)
    80          -- st_iq - tinyint
),
(   'ST11',        -- st_id - varchar(5)
    N'Lê Bá Hưng',       -- st_name - nvarchar(60)
    1,      -- st_gender - bit
    '20011109', -- st_dob - date
    'Bình Thuận',        -- st_add - varchar(50)
    120          -- st_iq - tinyint
),
(   'ST12',        -- st_id - varchar(5)
    N'Lê Thanh Ân',       -- st_name - nvarchar(60)
    1,      -- st_gender - bit
    '20070101', -- st_dob - date
    'Quảng Trị',        -- st_add - varchar(50)
    120          -- st_iq - tinyint
),
(   'ST13',        -- st_id - varchar(5)
    N'Phạm Anh Đức',       -- st_name - nvarchar(60)
    1,      -- st_gender - bit
    '20080425', -- st_dob - date
    'Quảng Bình',        -- st_add - varchar(50)
    130         -- st_iq - tinyint
),
(   'ST14',        -- st_id - varchar(5)
    N'Nguyễn Văn Bình',       -- st_name - nvarchar(60)
    1,      -- st_gender - bit
    '20080520', -- st_dob - date
    'Bình Dương',        -- st_add - varchar(50)
    120          -- st_iq - tinyint
),
(   'ST15',        -- st_id - varchar(5)
    N'Đàm Hoàng Anh',       -- st_name - nvarchar(60)
    1,      -- st_gender - bit
    '20090520', -- st_dob - date
    'Hà Tĩnh',        -- st_add - varchar(50)
    140          -- st_iq - tinyint
),
(   'ST16',        -- st_id - varchar(5)
    N'Lê Minh Tiến Đoàn',       -- st_name - nvarchar(60)
    1,      -- st_gender - bit
    '19970520', -- st_dob - date
    'Đà Lạt',        -- st_add - varchar(50)
    143          -- st_iq - tinyint
)
GO	