SELECT nombre FROM tienda.producto;
SELECT nombre, precio FROM tienda.producto;
SELECT * FROM tienda.producto;
SELECT nombre , precio , precio*0.93 FROM tienda.producto;
SELECT nombre AS "nom de producto", precio AS euros, precio*0.93 AS dolars FROM tienda.producto;
SELECT UPPER(nombre), precio FROM tienda.producto;
SELECT LOWER(nombre), precio FROM tienda.producto;
SELECT nombre, LEFT(UPPER(nombre), 2) FROM tienda.fabricante;
SELECT nombre, ROUND(precio) FROM tienda.producto;
SELECT nombre, TRUNCATE(precio, 0) FROM tienda.producto;
SELECT codigo_fabricante FROM tienda.producto;
SELECT DISTINCT codigo_fabricante FROM tienda.producto;
SELECT nombre FROM tienda.fabricante ORDER BY nombre ASC;
SELECT nombre FROM tienda.fabricante ORDER BY nombre DESC;
SELECT nombre FROM tienda.producto ORDER BY nombre ASC, precio DESC;
SELECT * FROM tienda.fabricante LIMIT 5;
SELECT * FROM tienda.fabricante LIMIT 3,2;
SELECT nombre, precio FROM tienda.producto ORDER BY precio ASC LIMIT 1;
SELECT nombre, precio FROM tienda.producto ORDER BY precio DESC LIMIT 1;
SELECT nombre FROM tienda.producto WHERE codigo_fabricante = 2;
SELECT producto.nombre, producto.precio, fabricante.nombre AS "Fabricante" FROM tienda.producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;
SELECT producto.nombre, producto.precio, fabricante.nombre AS "Fabricante" FROM tienda.producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY fabricante.nombre ASC;
SELECT producto.codigo, producto.nombre, producto.codigo_fabricante, fabricante.nombre AS "Fabricante" FROM tienda.producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;
SELECT producto.nombre, producto.precio, fabricante.nombre AS "Fabricante" FROM tienda.producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY producto.precio ASC LIMIT 1;
SELECT producto.nombre, producto.precio, fabricante.nombre AS "Fabricante" FROM tienda.producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY producto.precio DESC LIMIT 1;
SELECT producto.nombre FROM tienda.producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = "Lenovo";
SELECT producto.nombre, producto.precio FROM tienda.producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = "Crucial" AND producto.precio > "200";
SELECT producto.nombre FROM tienda.producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = "Lenovo" OR fabricante.nombre = "Hewlett-Packard" OR fabricante.nombre = "Seagate";
SELECT producto.nombre FROM tienda.producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre IN("Lenovo", "Hewlett-Packard", "Seagate");
SELECT producto.nombre, producto.precio FROM tienda.producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE "%e";
SELECT producto.nombre, producto.precio FROM tienda.producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE "%w%";
SELECT producto.nombre, producto.precio, fabricante.nombre AS "Fabricante" FROM tienda.producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE producto.precio > "180" ORDER BY producto.precio DESC, producto.nombre ASC;
SELECT fabricante.codigo, fabricante.nombre AS "Fabricante" FROM tienda.fabricante INNER JOIN producto ON producto.codigo_fabricante = fabricante.codigo;
SELECT fabricante.nombre AS "Fabricante", producto.nombre FROM tienda.fabricante LEFT JOIN producto ON producto.codigo_fabricante = fabricante.codigo;
SELECT fabricante.nombre AS "Fabricante" FROM tienda.fabricante LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante WHERE producto.nombre IS null;
SELECT producto.nombre FROM tienda.producto LEFT JOIN tienda.fabricante ON 1 = 1 WHERE producto.codigo_fabricante = fabricante.codigo AND fabricante.nombre = "Lenovo";
SELECT * FROM tienda.producto LEFT JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE producto.precio = (SELECT producto.precio FROM tienda.producto LEFT JOIN tienda.fabricante ON 1 = 1 WHERE producto.codigo_fabricante = fabricante.codigo AND fabricante.nombre = "Lenovo" ORDER BY producto.precio DESC LIMIT 1) ;
SELECT producto.nombre FROM tienda.producto LEFT JOIN tienda.fabricante ON 1 = 1 WHERE producto.codigo_fabricante = fabricante.codigo AND fabricante.nombre = "Lenovo" ORDER BY producto.precio DESC LIMIT 1;
SELECT producto.nombre FROM tienda.producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo AND fabricante.nombre = "Hewlett-Packard" ORDER BY producto.precio ASC LIMIT 1;
SELECT * FROM tienda.producto LEFT JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE producto.precio >= (SELECT producto.precio FROM tienda.producto LEFT JOIN tienda.fabricante ON 1 = 1 WHERE producto.codigo_fabricante = fabricante.codigo AND fabricante.nombre = "Lenovo" ORDER BY producto.precio DESC LIMIT 1) ;
SELECT producto.nombre FROM tienda.producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Asus' AND producto.precio > (SELECT AVG(producto.precio) FROM producto INNER JOIN fabricante WHERE fabricante.nombre = 'Asus');