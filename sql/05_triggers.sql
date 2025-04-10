-- Part Table

-- Description: When a part’s inventory hits the minimum level, it’s automatically restocked to the maximum so we never run out.
GO
	CREATE TRIGGER trg_auto_restock_part
	ON part
	AFTER UPDATE
	AS
	BEGIN
	    -- Update the part's qty_current to qty_max if qty_current hits the minimum threshold, "restocking the supply"
	    UPDATE p
	    SET qty_current = p.qty_max  -- Restock to max
	    FROM part p
	    JOIN inserted i ON p.part_id = i.part_id  -- Use 'inserted' to get recently updated rows
	    WHERE i.qty_current = p.qty_min;  -- Only restock if qty_current equals qty_min
	END;
GO