CREATE OR REPLACE TABLE`analog-hour-508316-p9.kimiafarma_data.tabel_analisa`AS
SELECT  
  t.transaction_id,
  t.date,
  b.branch_id,
  b.branch_name,
  b.kota,
  b.provinsi

FROM `analog-hour-508316-p9.kimiafarma_data.kf_final_transaction` AS t
LEFT JOIN `analog-hour-508316-p9.kimiafarma_data.kf_kantor_cabang` AS b 
  ON t.branch_id = b.branch_id;
