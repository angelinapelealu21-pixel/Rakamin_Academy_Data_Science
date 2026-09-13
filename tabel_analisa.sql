CREATE OR REPLACE TABLE`analog-hour-508316-p9.kimiafarma_data.tabel_analisa`AS
SELECT  
  t.transaction_id,
  t.date,
  t.branch_id,
  b.branch_name,
  b.kota,
  b.provinsi,
  b.rating AS rating_cabang,
  t.customer_name,
  t.product_id,
  p.product_name,
  t.price AS actual_price,
  t.discount_percentage,

  CASE 
    WHEN t.price <= 50000 THEN 0.10
    WHEN t.price <=100000 THEN 0.15
    WHEN t.price <= 300000 THEN 0.20
    WHEN t.price <=500000 THEN 0.25
    WHEN t.price > 500000 THEN 0.30
  END AS persentase_gross_laba,
  
  t.price * (1-(t.discount_percentage/100)) AS nett_sales,

  (t.price * (1-(t.discount_percentage/100))) *
  (CASE
    WHEN t.price <= 50000 THEN 0.10
    WHEN t.price <=100000 THEN 0.15
    WHEN t.price <= 300000 THEN 0.20
    WHEN t.price <=500000 THEN 0.25
    WHEN t.price > 500000 THEN 0.30
  END) AS nett_profit,
  
  t.rating AS rating_transaksi
  
FROM `analog-hour-508316-p9.kimiafarma_data.kf_final_transaction` AS t
LEFT JOIN `analog-hour-508316-p9.kimiafarma_data.kf_kantor_cabang` AS b 
  ON t.branch_id = b.branch_id
LEFT JOIN `analog-hour-508316-p9.kimiafarma_data.kf_product`AS p
  ON t.product_id = p.product_id
