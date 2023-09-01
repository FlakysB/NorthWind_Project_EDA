SELECT 
    p.categoryID,
    categoryName,
    COUNT(p.productID) AS product_sold,
    SUM (od.quantity) AS total_sales,
    ROUND(SUM(od.unitPrice * od.quantity * (1 - od.discount)), 2) AS total_sales_amount,
FROM
    `project-3-394210.Northwind_Traders.products` p
LEFT JOIN 
    `Northwind_Traders.order_details` od ON od.productID = p.productID
LEFT JOIN 
    `Northwind_Traders.categories` c ON p.categoryID = c.categoryID
GROUP BY 
    1,2 ;
