CREATE OR REPLACE PROCEDURE tasty_bytes_sample_data.raw_pos.sp.STUDENTS()
RETURN ARRAY
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS 
  $$
      var v_whereAmI =1;
      var v_sql_cmd = "";
      var v_sql_message = "";
      var v_row_count =0;
      var v_cursor_count =0;
      var v_return_array = [];
      var v_error_array = [];

      try{

         var v_whereAmI =1;
         var v_return_array.push("Executing sp process ... start");

         var v_sql_cmd = `
                 INSERT INTO 
                    tasty_bytes_sample_data.raw_pos.tbl.STUDENTS_NEW
                 SELECT
                    s.STUDENT_ID        ,
                    s.STUDENT_NAME      ,
                    s.AGE               ,
                    s.GRADE             ,
                    s.GRADE_AVG         
                 FROM tasty_bytes_sample_data.raw_pos.tbl.STUDENTS s
                 WHERE NOT EXISTS (
                    SELECT 1
                    FROM tasty_bytes_sample_data.raw_pos.tbl.STUDENTS_NEW ns
                    WHERE ns.student_id = s.student_id
                    
                 )
         
         `;


      }
  $$