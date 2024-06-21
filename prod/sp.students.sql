-- Yhid id stored procedure 
CREATE OR REPLACE PROCEDURE TASTY_BYTES_SAMPLE_DATA.RAW_POS.SP.STUDENTS()
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

         var v_whereAmI =2;
         var v_return_arry.push("Executing sp process ... start");

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
                    
                 );        
         
         `;

         v_sql_stmt = snowflake.createStatement({ sqlText: v_sql_cmd });
         v_sql_result = v_sql_stmt.execute();

         v_cursor_count = v_sql_result.getNumRowsAffected();
         v_row_count = v_sql_result.getNumRowsAffected();

         //----------------------------------------------------------------------------------//
         //                         Finalalizing the process                                 
         //


         v_return_array.push(v_cursor_count);
         v_return_array.push(v_row_count);
         v_return_array.push(v_row_count  + "  rows were just inserted.");

       RETURN v_return_array;
      }
      catch(err){
          //----------------------------------------------------------------------------------//
         //                         Finalalizing the error process                                 
         //


         var v_error_message = err.message;
         var v_fixed_message = v_error_message.replaceAll(/,/g,"|").replaceAll(/\"g,"").replaceAll(/'/g,"''").replaceAll(/\n/g,":");
        
        v_error_result = "ERR\n";
        v_error_result += "FAILURE: An error occured while attempting to load the Table.\n";
        v_error_result += v_whereAmI + "\n";
        v_error_result += err.coe + "\n";     
        v_error_result += v_fixed_message;   

        throw v_error_result; 

      }
  $$