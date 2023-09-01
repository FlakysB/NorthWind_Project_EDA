SELECT 
    c.customerID,
    companyName,
    city,
    country,
    COUNT(p.productID) AS product_sold,
    SUM (od.quantity) AS total_sales,
    ROUND(SUM(od.unitPrice * od.quantity * (1 - od.discount)), 2) AS total_sales_amount,
FROM
    `project-3-394210.Northwind_Traders.customers` c
LEFT JOIN 
    `Northwind_Traders.orders` o ON c.customerID = o.customerID
LEFT JOIN 
    `Northwind_Traders.order_details` od ON o.orderID = od.orderID
LEFT JOIN `Northwind_Traders.products` p ON od.productID = p.productID
GROUP BY 
     1,2,3,4 ;
