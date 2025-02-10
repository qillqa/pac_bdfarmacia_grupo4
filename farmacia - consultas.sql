--GRUPO IV

--PREGUNTA 01	¿Cuál es el top 5 de las presentaciones con mayor número de transacciones y su monto de ventas correspondiente en el 2025?
select 
top 5
c.id_presentacion,
c.nombre as Presentacion,
count(*) as Transacciones,
sum(precio_final) as Monto
from g4.Ventas v
left join g4.DetalleVentas dv on v.id_venta = dv.id_venta
left join g4.Productos p on dv.id_producto = p.id_producto
left join g4.Presentaciones c on p.id_presentacion = c.id_presentacion
where year(v.fecha) = 2025
group by c.id_presentacion, c.nombre
order by Transacciones desc



--PREGUNTA 02	¿Cuál es el monto total de ventas del año 2025 y la variación del monto mensual de ventas de enero a diciembre para el top 5 de productos más vendidos en 2025?
select top 5
id_producto
, producto
, monto_ventas = sum(precio_final)
--literales
, mes_2_1 = sum(case when mes = 2 then precio_final else 0 end) - sum(case when mes = 1 then precio_final else 0 end)
, mes_3_2 = sum(case when mes = 3 then precio_final else 0 end) - sum(case when mes = 2 then precio_final else 0 end)
, mes_4_3 = sum(case when mes = 4 then precio_final else 0 end) - sum(case when mes = 3 then precio_final else 0 end)
, mes_5_4 = sum(case when mes = 5 then precio_final else 0 end) - sum(case when mes = 4 then precio_final else 0 end)
, mes_6_5 = sum(case when mes = 6 then precio_final else 0 end) - sum(case when mes = 5 then precio_final else 0 end)
, mes_7_6 = sum(case when mes = 7 then precio_final else 0 end) - sum(case when mes = 6 then precio_final else 0 end)
, mes_8_7 = sum(case when mes = 8 then precio_final else 0 end) - sum(case when mes = 7 then precio_final else 0 end)
, mes_9_8 = sum(case when mes = 9 then precio_final else 0 end) - sum(case when mes = 8 then precio_final else 0 end)
, mes_10_9 = sum(case when mes = 10 then precio_final else 0 end) - sum(case when mes = 9 then precio_final else 0 end)
, mes_11_10 = sum(case when mes = 11 then precio_final else 0 end) - sum(case when mes = 10 then precio_final else 0 end)
, mes_12_11 = sum(case when mes = 12 then precio_final else 0 end) - sum(case when mes = 11 then precio_final else 0 end)
from (
	select p.id_producto, p.nombre as producto, month(v.fecha) as mes, sum(dv.precio_final) as precio_final
	from g4.Ventas v
	left join g4.DetalleVentas dv on v.id_venta = dv.id_venta
	left join g4.Productos p on dv.id_producto = p.id_producto
	where year(v.fecha) = 2025
	group by p.id_producto, p.nombre, month(v.fecha)
) t
group by id_producto, producto
order by monto_ventas desc



--PREGUNTA 03	¿Cuál es el top 5 de productos con mayor número de transacciones y su monto de ventas correspondiente en el primer trimestre de 2025?
select 
top 5
p.id_producto,
p.nombre as Producto,
COUNT(*) as Transacciones,
SUM(dv.precio_final) AS Monto
from g4.Ventas v
left join g4.DetalleVentas dv on v.id_venta = dv.id_venta
left join g4.Productos p on dv.id_producto = p.id_producto
where year(v.fecha) = 2025 
and DATEPART(QUARTER,fecha) = 1
GROUP BY p.id_producto, p.nombre
ORDER BY Transacciones DESC



--PREGUNTA 04	¿Cuál es el monto total de ventas por categoria y su porcentaje de participación correspondiente en el monto total de venta. Incluido el monto de ventas descontado por cada categoria en el 2025?
select
c.id_categoria,
c.nombre as Categoria,
sum(precio_final) as Monto,
convert(decimal(10, 2), sum(precio_final) * 1.0 / sum(sum(precio_final)) over() ) as Monto_Porcentaje,
sum(monto_descuento) as Monto_Descontado
from g4.Ventas v
left join g4.DetalleVentas dv on v.id_venta = dv.id_venta
left join g4.Productos p on dv.id_producto = p.id_producto
left join g4.Categorias c on p.id_categoria = c.id_categoria
where year(v.fecha) = 2025
group by c.id_categoria, c.nombre
order by Monto desc



--PREGUNTA 05	¿Cuál es el top 3 de medios de pago con mayor cantidad de transacciones y su monto de ventas correspondiente del 2025?
select 
top 3
m.id_medio_pago,
m.nombre as Medio_Pago,
count(*) as Transacciones,
sum(precio_final) as Monto
from g4.Ventas v
left join g4.DetalleVentas dv on v.id_venta = dv.id_venta
left join g4.MedioPago m on v.id_medio_pago = m.id_medio_pago
where year(v.fecha) = 2025
group by m.id_medio_pago, m.nombre
order by transacciones desc



--PREGUNTA 06	¿En qué horas se concentran la mayor cantidad de transacciones y su porcentaje de participación correspondiente con respecto al total de transacciones en el 2025? 
select 
DATEPART(HH,v.hora) as Hora,
count(*) as Transacciones,
convert(decimal(10, 2), count(*) * 1.0 / sum(count(*)) over()) as Monto_Porc
from g4.Ventas v
left join g4.DetalleVentas dv on v.id_venta = dv.id_venta
where year(v.fecha) = 2025
group by DATEPART(HH,v.hora)
order by Transacciones desc



--PREGUNTA 07	Mostrar la lista de todos los empleados junto con su número de transacciones generado y su monto de ventas correspondiente en el segundo trimestre de 2025?
select
e.id_empleado,
e.nombres+' '+e.apellidos as Empleado,
count(*) as Transacciones,
sum(precio_final) as Monto
from g4.Ventas v
left join g4.DetalleVentas dv on v.id_venta = dv.id_venta
left join g4.Empleados e on v.id_empleado = e.id_empleado
where year(v.fecha) = 2025 
and datepart(QUARTER,v.fecha) = 2
group by e.id_empleado, e.nombres, e.apellidos
order by Monto desc



--PREGUNTA 08	¿Cuál es el top 5 de proveedores con mayor número de transacciones y su monto de ventas correspondiente en el primer trimestre de 2025?
select 
top 5
pv.id_proveedor,
pv.nombre as Proveedor,
count(*) as Transacciones,
sum(precio_final) as Monto
from g4.Ventas v
left join g4.DetalleVentas dv on v.id_venta = dv.id_venta
left join g4.Productos p on dv.id_producto = p.id_producto
left join g4.Proveedores pv on p.id_proveedor = pv.id_proveedor
where year(v.fecha) = 2025 
and datepart(QUARTER,v.fecha) = 1
group by pv.id_proveedor, pv.nombre
order by Transacciones desc



--PREGUNTA 09	¿Cuál es el top 5 de laboratorios con mayor número de transacciones y su monto de ventas correspondiente en el primer trimestre de 2025?
select 
top 5
l.id_laboratorio,
l.nombre as Laboratorio,
count(*) as Transacciones,
sum(precio_final) as Monto
from g4.Ventas v
left join g4.DetalleVentas dv on v.id_venta = dv.id_venta
left join g4.Productos p on dv.id_producto = p.id_producto
left join g4.Laboratorios l on p.id_laboratorio = l.id_laboratorio
where year(v.fecha) = 2025 
and datepart(QUARTER,v.fecha) = 1
group by l.id_laboratorio,l.nombre
order by Transacciones desc



--PREGUNTA 10	¿Cuál es el monto total de venta por trimeste y su porcentaje de participacion correspondiente con respecto al monto total de venta. Incluir el monto total descontado para cada uno de los trimestres de 2025?
select 
DATEPART(QUARTER,v.fecha) as Trimestre,
sum(precio_final) as Monto,
convert(decimal(10, 2), sum(precio_final) * 1.0 / sum(sum(precio_final)) over() ) as Monto_Porcentaje,
sum(monto_descuento) as Monto_Descontado
from g4.Ventas v
left join g4.DetalleVentas dv on v.id_venta = dv.id_venta
where year(v.fecha) = 2025
group by DATEPART(QUARTER,v.fecha)


