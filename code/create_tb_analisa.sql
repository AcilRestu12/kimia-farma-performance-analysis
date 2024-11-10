CREATE OR REPLACE TABLE `kimia_farma.tb_analisa` AS
WITH transaction_data AS (
    SELECT
        t.transaction_id,
        t.date,
        t.branch_id,
        t.customer_name,
        t.product_id,
        t.price AS actual_price,
        t.discount_percentage,
        t.rating AS rating_transaksi
    FROM
        `kimia_farma.kf_final_transaction` t
),
product_data AS (
    SELECT
        p.product_id,
        p.product_name
    FROM
        `kimia_farma.kf_product` p
),
branch_data AS (
    SELECT
        c.branch_id,
        c.branch_name,
        c.kota,
        c.provinsi,
        c.rating AS rating_cabang
    FROM
        `kimia_farma.kf_kantor_cabang` c
),
calculated_data AS (
    SELECT
        td.transaction_id,
        td.date,
        bd.branch_id,
        bd.branch_name,
        bd.kota,
        bd.provinsi,
        bd.rating_cabang,
        td.customer_name,
        pd.product_id,
        pd.product_name,
        td.actual_price,
        td.discount_percentage,
        CASE 
            WHEN td.actual_price <= 50000 THEN 0.10
            WHEN td.actual_price > 50000 AND td.actual_price <= 100000 THEN 0.15
            WHEN td.actual_price > 100000 AND td.actual_price <= 300000 THEN 0.20
            WHEN td.actual_price > 300000 AND td.actual_price <= 500000 THEN 0.25
            ELSE 0.30
        END AS persentase_gross_laba,
        (td.actual_price * (1 - td.discount_percentage / 100)) AS nett_sales,
        ((td.actual_price * (1 - td.discount_percentage / 100)) * CASE 
            WHEN td.actual_price <= 50000 THEN 0.10
            WHEN td.actual_price > 50000 AND td.actual_price <= 100000 THEN 0.15
            WHEN td.actual_price > 100000 AND td.actual_price <= 300000 THEN 0.20
            WHEN td.actual_price > 300000 AND td.actual_price <= 500000 THEN 0.25
            ELSE 0.30
        END) AS nett_profit,
        td.rating_transaksi
    FROM
        transaction_data td
    JOIN
        product_data pd ON td.product_id = pd.product_id
    JOIN
        branch_data bd ON td.branch_id = bd.branch_id
)
SELECT
    transaction_id,
    date,
    branch_id,
    branch_name,
    kota,
    provinsi,
    rating_cabang,
    customer_name,
    product_id,
    product_name,
    actual_price,
    discount_percentage,
    persentase_gross_laba,
    nett_sales,
    nett_profit,
    rating_transaksi
FROM
    calculated_data;
