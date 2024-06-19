
Create table IF NOT EXISTS tasty_bytes_sample_data.raw_pos.tbl.STUDENTS_NEW(
STUDENT_ID             INT,
STUDENT_NAME           VARCHAR(50),
AGE                    INT,
GRADE                  INT,
GRADE_AVG              FLOAT,
DW_LOAD_DATE           DATETIME,
DW_UPDATE_DATE         DATETIME,
DW_DATA_SOURCE         VARCHAR(200)
);