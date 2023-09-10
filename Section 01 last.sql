USE `classicmodels`;

WITH RankedProducts AS (
    SELECT
        p.productLine,
        od.quantityOrdered * od.priceEach AS sales,
        ROW_NUMBER() OVER (PARTITION BY p.productLine ORDER BY od.quantityOrdered * od.priceEach DESC) AS rn
    FROM
        products p
    JOIN
        orderdetails od ON p.productCode = od.productCode
)
SELECT
    rp.productLine,
    p.productName AS secondHighestSellingProduct,
    MAX(rp.sales) AS sales
FROM
    RankedProducts rp
JOIN
    products p ON rp.productLine = p.productLine
WHERE
    rp.rn = 2
GROUP BY
    rp.productLine, p.productName;
