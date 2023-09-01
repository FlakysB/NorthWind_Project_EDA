SELECT 
    EXTRACT(YEAR FROM orderDate) AS year,
    EXTRACT(MONTH FROM orderDate) AS month,
    COUNT(od.orderID) AS sales_count,
    ROUND(SUM(od.unitPrice * od.quantity * (1 - od.discount)), 2) AS total_sales_amount,
    COUNT(p.productID) AS product_shipped,
    SUM (od.quantity) AS total_quantity_shipped,
    ROUND(SUM(freight), 2) AS total_shipping_cost
FROM
    `project-3-394210.Northwind_Traders.shippers`s
JOIN 
    `Northwind_Traders.orders` o ON s.shipperID = o.shipperID
JOIN 
    `Northwind_Traders.order_details`od ON o. orderID = od. orderID
JOIN 
     `Northwind_Traders.products` p ON od.productID = p.productID
WHERE
     shippedDate IS NOT NULL
GROUP BY 
    1,2 ;
