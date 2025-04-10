-- Customer Table

ALTER TABLE customer
ADD CONSTRAINT df_customer_last_contact
DEFAULT CAST(GETDATE() AS DATE) for last_contact;

ALTER TABLE sale
ADD CONSTRAINT df_sale_date
DEFAULT CAST(GETDATE() AS DATE) for sale_date;