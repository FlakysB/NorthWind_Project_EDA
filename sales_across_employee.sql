SELECT
  e.employeeID,
  employeeName,
  title,
  city,
  country,
  SUM (od.quantity) AS total_sales,
  ROUND(SUM(od.unitPrice * od.quantity * (1 - od.discount)), 2) AS total_sales_amount
FROM
  `project-3-394210.Northwind_Traders.employees` e
 LEFT JOIN 
    `Northwind_Traders.orders` o ON e.employeeID = o.employeeID
 LEFT JOIN 
    `Northwind_Traders.order_details` od ON o.orderID = od.orderID
GROUP BY 1,2,3,4,5  ;
