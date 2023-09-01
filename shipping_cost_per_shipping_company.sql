SELECT 
    s.shipperID,
    companyName,
    ROUND(SUM(freight), 2) AS total_shipping_cost,
FROM
    `project-3-394210.Northwind_Traders.shippers`s
inner JOIN 
    `Northwind_Traders.orders` o ON s.shipperID = o.shipperID
WHERE shippedDate IS NOT NULL
GROUP BY 
    1,2 ;
