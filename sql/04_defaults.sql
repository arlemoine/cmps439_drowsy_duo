-- Customer Table

ALTER TABLE customer
ADD CONSTRAINT df_customer_last_contact
DEFAULT CAST(GETDATE() AS DATE) for last_contact;