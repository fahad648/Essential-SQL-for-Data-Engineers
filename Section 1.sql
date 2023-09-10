-- SELECT
--     pl.productLine,
--     COUNT(od.orderNumber) AS orderCount
-- FROM
--     productlines pl
-- INNER JOIN
--     products p ON pl.productLine = p.productLine
-- INNER JOIN
--     orderdetails od ON p.productCode = od.productCode
-- INNER JOIN
--     orders o ON od.orderNumber = o.orderNumber
-- GROUP BY
--     pl.productLine
-- HAVING
--     orderCount > 100;


-- SELECT
--     CONCAT(m.firstName, ' ', m.lastName) AS managerName,
--     COUNT(e.employeeNumber) AS employeeCount
-- FROM
--     employees m
-- LEFT JOIN
--     employees e ON m.employeeNumber = e.reportsTo
-- GROUP BY
--     managerName
-- ORDER BY
--     managerName;


-- SELECT
--     c.city,
--     SUM(CASE WHEN o.status = 'Shipped' THEN 1 ELSE 0 END) AS Shipped,
--     SUM(CASE WHEN o.status = 'Resolved' THEN 1 ELSE 0 END) AS Resolved,
--     SUM(CASE WHEN o.status = 'Cancelled' THEN 1 ELSE 0 END) AS Cancelled,
--     SUM(CASE WHEN o.status = 'On Hold' THEN 1 ELSE 0 END) AS OnHold
-- FROM
--     customers c
-- LEFT JOIN
--     orders o ON c.customerNumber = o.customerNumber
-- GROUP BY
--     c.city;



-- SELECT
--     o.officeCode,
--     o.city AS officeCity,
--     SUM(od.quantityOrdered * od.priceEach) AS totalSales
-- FROM
--     offices o
-- JOIN
--     employees e ON o.officeCode = e.officeCode
-- JOIN
--     customers c ON e.employeeNumber = c.salesRepEmployeeNumber
-- JOIN
--     orders odr ON c.customerNumber = odr.customerNumber
-- JOIN
--     orderdetails od ON odr.orderNumber = od.orderNumber
-- GROUP BY
--     o.officeCode, o.city
-- ORDER BY
--     o.officeCode;
-- 




-- SELECT
--     e.employeeNumber,
--     CONCAT(e.firstName, ' ', e.lastName) AS employeeName,
--     SUM(od.quantityOrdered * od.priceEach) AS totalSales
-- FROM
--     employees e
-- JOIN
--     customers c ON e.employeeNumber = c.salesRepEmployeeNumber
-- JOIN
--     orders o ON c.customerNumber = o.customerNumber
-- JOIN
--     orderdetails od ON o.orderNumber = od.orderNumber
-- WHERE
--     e.employeeNumber NOT IN (
--         SELECT
--             employeeNumber
--         FROM
--             employees
--         WHERE
--             country = 'USA'
--     )
-- GROUP BY
--     e.employeeNumber, employeeName
-- ORDER BY
--     e.employeeNumber;


















