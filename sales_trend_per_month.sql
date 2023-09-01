SELECT 
    EXTRACT(YEAR FROM orderDate) AS year,
    EXTRACT(MONTH FROM orderDate) AS month,
    COUNT(od.orderID) AS sales_count,
    ROUND(SUM(od.unitPrice * od.quantity * (1 - od.discount)), 2) AS total_sales_amount
FROM 
    `project-3-394210.Northwind_Traders.orders` o
LEFT JOIN 
    `Northwind_Traders.order_details` od ON od.orderID = o.orderID
LEFT JOIN 
    `Northwind_Traders.products` p ON p.productID = od.productID
GROUP BY 
    1,2 ;
