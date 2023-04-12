
DECLARE 
v_name  varchar(20) := '&name';
v_hmtimes  number(8) := '&numb';

BEGIN
    DBMS_OUTPUT.PUT_LINE('Please enter your name:'); 
     DBMS_OUTPUT.PUT_LINE('Please enter the number of times you want to output your name'); 
  FOR i IN 1..v_hmtimes LOOP
   DBMS_OUTPUT.PUT_LINE(v_name);  
  END LOOP;
END;

