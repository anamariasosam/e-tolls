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
WHERE p.ciudad_id_trabaja IS NULL;

--  El nombre de la persona, la placa de los vehiculos y el vehiculo por donde ha pasado
SELECT
persona.nombre as 'Nombre Persona',
vehiculo.placa,
paso.id as 'paso',
peaje.nombre as 'Nombre Peajes'
FROM
personas persona,
propietarios propietario,
vehiculos vehiculo,
pasos paso,
peajes peaje
WHERE
  persona.id = propietario.persona_id
  AND
  propietario.vehiculo_id = vehiculo.id
  AND
  paso.peajes_id = peaje.id
  AND
  paso.propietario_id = propietario.id;

-- Listado de las personas con los peajes que ha pasado con el vehiculo  y el
-- numero de veces que ha pasado por ese peaje
SELECT
persona.nombre as 'Nombre Persona',
vehiculo.placa,
peaje.nombre as 'Nombre Peajes',
COUNT(*) as 'Veces que ha pasado por peaje'
FROM
personas persona,
propietarios propietario,
vehiculos vehiculo,
pasos paso,
peajes peaje
WHERE
  persona.id = propietario.persona_id
  AND
  propietario.vehiculo_id = vehiculo.id
  AND
  paso.peajes_id = peaje.id
  AND
  paso.propietario_id = propietario.id
GROUP BY persona.nombre, vehiculo.placa, peaje.nombre;

-- Listado de las personas con los peajes que ha pasado con el vehiculo  y el
-- numero de veces que ha pasado un carro por peaje
SELECT
persona.nombre as 'Nombre Persona',
vehiculo.placa,
COUNT(*) as 'Veces que ha pasado un carro por peaje'
FROM
personas persona,
propietarios propietario,
vehiculos vehiculo,
pasos paso,
peajes peaje
WHERE
  persona.id = propietario.persona_id
  AND
  propietario.vehiculo_id = vehiculo.id
  AND
  paso.peajes_id = peaje.id
  AND
  paso.propietario_id = propietario.id
GROUP BY persona.nombre, vehiculo.placa;

-- Listado de las personas con los peajes que ha pasado con el vehiculo  y el
-- numero de veces que la gente ha pasado por un peaje
SELECT
peaje.nombre as 'Nombre Peaje',
COUNT(*) as 'Veces que la gente ha pasado por un peaje'
FROM
personas persona,
propietarios propietario,
vehiculos vehiculo,
pasos paso,
peajes peaje
WHERE
  persona.id = propietario.persona_id
  AND
  propietario.vehiculo_id = vehiculo.id
  AND
  paso.peajes_id = peaje.id
  AND
  paso.propietario_id = propietario.id
GROUP BY peaje.nombre;

-- Listado de los vehiculos que han pagado mas de un peaje
SELECT
vehiculo.placa
FROM
personas persona,
propietarios propietario,
vehiculos vehiculo,
pasos paso,
peajes peaje
WHERE
  persona.id = propietario.persona_id
  AND
  propietario.vehiculo_id = vehiculo.id
  AND
  paso.peajes_id = peaje.id
  AND
  paso.propietario_id = propietario.id
GROUP BY vehiculo.placa
HAVING COUNT(*) > 2;

-- Listado con el nombre de la personas y el vehiculo que han pagado mas de un peaje
SELECT PE.nombre, PAGO_MAS_DE_DOS.placa
FROM
vehiculos V,
propietarios PR,
personas PE,
( SELECT
  vehiculo.placa
  FROM
  personas persona,
  propietarios propietario,
  vehiculos vehiculo,
  pasos paso,
  peajes peaje
  WHERE
    persona.id = propietario.persona_id
    AND
    propietario.vehiculo_id = vehiculo.id
    AND
    paso.peajes_id = peaje.id
    AND
    paso.propietario_id = propietario.id
  GROUP BY vehiculo.placa
  HAVING COUNT(*) > 2
) PAGO_MAS_DE_DOS
WHERE
  PAGO_MAS_DE_DOS.placa = V.placa
  AND V.id = PR.vehiculo_id
  AND PR.persona_id = PE.id;

-- Nombre de la persona que mas a pagado
SELECT PER.nombre, COUNT(*) conteo
FROM
personas PER,
propietarios PRO,
vehiculos VEH,
pasos PAS,
peajes PEA
WHERE
  PER.id = PRO.persona_id
  AND
  PRO.vehiculo_id = VEH.id
  AND
  PRO.id = PAS.propietario_id
  AND
  PAS.peajes_id = PEA.id
GROUP BY PER.nombre
HAVING COUNT(*) =
                ( SELECT COUNT(*) conteo
                  FROM
                  personas PER, 
                  propietarios PRO,
                  vehiculos VEH,
                  pasos PAS,
                  peajes PEA
                  WHERE
                    PER.id = PRO.persona_id
                    AND
                    PRO.vehiculo_id = VEH.id
                    AND
                    PRO.id = PAS.propietario_id
                    AND
                    PAS.peajes_id = PEA.id
                  GROUP BY PER.nombre
                  ORDER BY 1 DESC
                  LIMIT 1 )
