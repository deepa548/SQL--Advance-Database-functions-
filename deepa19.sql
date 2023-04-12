CREATE OR REPLACE PROCEDURE TAX_COST_SP(p_state IN BB_TAX.STATE%type, p_subtotal IN BB_BASKET.SUBTOTAL%type, p_tax_amt  OUT number )
IS 
CURSOR cur_bb_tax_cursor IS
    SELECT state
    FROM BB_TAX
    where state = p_state;
BEGIN
    FOR tax_rec IN cur_bb_tax_cursor
    LOOP
    IF (tax_rec.state != p_state)
        THEN p_tax_amt := p_subtotal;
    ELSIF tax_rec.state = 'VA'
        THEN p_tax_amt := 0.045 * p_subtotal;
    ELSIF tax_rec.state = 'NC'
        THEN p_tax_amt :=0.03 * p_subtotal; 
    ELSIF tax_rec.state = 'SC'
        THEN p_tax_amt :=0.06 * p_subtotal;
    END IF;
    END LOOP;
   COMMIT;
END TAX_COST_SP;


DECLARE
    v_totalamt DECIMAL(4,2);
BEGIN
    TAX_COST_SP('VA',100, v_totalamt);
    DBMS_OUTPUT.PUT_LINE('The tax amount is $' ||to_char(v_totalamt,'0.00'));    
END;
