create database bai5;
use bai5;


CREATE TABLE Records_North (
    Record_ID INT PRIMARY KEY,
    Patient_Name VARCHAR(100),
    Diagnosis TEXT,
    Record_Date DATE
);

-- Bảng chi nhánh miền Nam
CREATE TABLE Records_South (
    Record_ID INT PRIMARY KEY,
    Patient_Name VARCHAR(100),
    Diagnosis TEXT,
    Record_Date DATE
);

-- Dữ liệu mẫu (có trùng ID để test xung đột)
INSERT INTO Records_North VALUES
(1, 'Nguyen Van A', 'Flu', '2026-04-28'),
(2, 'Tran Thi B', 'Fever', '2026-04-29'),
(3, 'Le Van C', 'Covid', '2026-04-30');

INSERT INTO Records_South VALUES
(1, 'Pham Van D', 'Cold', '2026-04-28'),
(4, 'Hoang Thi E', 'Headache', '2026-04-29'),
(5, 'Nguyen Van F', 'Stomachache', '2026-04-30');

-- Tạo View tổng hợp toàn quốc
CREATE VIEW National_Record_View AS
SELECT 
    Record_ID,
    Patient_Name,
    Diagnosis,
    Record_Date,
    'North' AS Branch_Name
FROM Records_North
UNION ALL
SELECT 
    Record_ID,
    Patient_Name,
    Diagnosis,
    Record_Date,
    'South' AS Branch_Name
FROM Records_South;