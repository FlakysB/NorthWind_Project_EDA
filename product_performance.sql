SELECT 
     p.productID,
    productName,
    discontinued,
    p.categoryID,
    categoryName,
    COUNT(od.orderID) AS orders,
    SUM (od.quantity) AS total_sales,
    p.unitPrice,
    ROUND(SUM(od.unitPrice * od.quantity * (1 - od.discount)), 2) AS total_sales_amount,
    ROUND( SUM(discount),2) AS total_discount
FROM
    `project-3-394210.Northwind_Traders.products` p
LEFT JOIN 
    `Northwind_Traders.order_details` od ON od.productID = p.productID
LEFT JOIN 
    `Northwind_Traders.orders` o ON o.orderID = od.orderID
LEFT JOIN 
     `Northwind_Traders.categories` c ON p.categoryID = c.categoryID
GROUP BY 
    1,2,3,4,5,8  ;
