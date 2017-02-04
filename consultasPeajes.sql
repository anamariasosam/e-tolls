-- Las personas que tienen una n en el nombre
SELECT * FROM personas WHERE nombre LIKE '%n%';

-- Las personas que vive en Medellin
SELECT p.nombre
FROM personas p, ciudades c
WHERE (
  ciudad_id_vive = c.id
  AND
  c.nombre LIKE 'Medellin'
);

-- Las personas y la ciudad donde trabajan sin incluir las nulas
SELECT p.nombre, c.nombre
FROM personas p, ciudades c
WHERE
  ciudad_id_trabaja = c.id;

-- Las personas y la ciudad donde trabajan incluyendo las nulas
SELECT p.nombre, c.nombre
FROM personas p
LEFT JOIN ciudades c
  ON p.ciudad_id_trabaja = c.id;

-- Las personas y la ciudad donde trabajan incluyendo las nulas y la lista de
-- las ciudades asi no viva nadie ahi
SELECT p.nombre, c.nombre
FROM personas p
RIGHT JOIN ciudades c
  ON p.ciudad_id_trabaja = c.id;

-- La lista de las personas con la ciudad en la que viven y en la que trabajan
SELECT
p.nombre as 'Persona Nombre',
ciudadTrabaja.nombre as 'Ciudad Trabaja',
ciudadVive.nombre as 'Ciudad Vive'
FROM personas p, ciudades ciudadTrabaja, ciudades ciudadVive
WHERE
  p.ciudad_id_trabaja = ciudadTrabaja.id
  AND p.ciudad_id_vive = ciudadVive.id

-- La lista de las personas con la ciudad en la que viven y en la que trabajan incluyendo nulas
SELECT
p.nombre as 'Persona Nombre',
ciudadTrabaja.nombre as 'Ciudad Trabaja',
ciudadVive.nombre as 'Ciudad Vive'
FROM ciudades ciudadVive,
  personas p
  LEFT JOIN ciudades ciudadTrabaja
    ON p.ciudad_id_trabaja = ciudadTrabaja.id
WHERE p.ciudad_id_vive = ciudadVive.id;

-- Listar el nombre de las personas que no tienen ciudad donde trabajan
SELECT p.nombre AS 'Persona Nombre'
FROM personas p
WHERE p.ciudad_id_trabaja IS NULL
