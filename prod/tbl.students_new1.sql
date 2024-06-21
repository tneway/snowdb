
/* unique data will store in this 
   use password = 'kjlkjl7i8';
   use database = 'tasty_bytes_sample_data' */
CREATE OR REPLACE TABLE tasty_bytes_sample_data.raw_pos.tbl.STUDENTS_NEW1(
STUDENT_ID             INT,
STUDENT_NAME           VARCHAR(50),
AGE                    INT,
GRADE                  INT,
GRADE_AVG              FLOAT,
DW_LOAD_DATE           DATETIME,
DW_UPDATE_DATE         DATETIME,
DW_DATA_SOURCE         VARCHAR(200)
);

