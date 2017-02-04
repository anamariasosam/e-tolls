-- Procedimiento para insertar en la tabla pasos dado el id del peaje y el rfid
DELIMITER $$
DROP PROCEDURE IF EXISTS p_insertar_paso$$
CREATE
    PROCEDURE p_insertar_paso(IN v_peaje_id INT, IN v_rfid VARCHAR(15))
    COMMENT 'Procedimiento para insertar cuando pase un vehiculo'
    	BEGIN
		DECLARE v_propietario_id INT;
		DECLARE v_pspagos DEC(10,2);

		SELECT categoria.psValor, propietario.id
		INTO v_pspagos ,v_propietario_id
		FROM
		propietarios propietario,
		vehiculos vehiculo,
		categorias categoria
		WHERE
		  propietario.vehiculo_id = vehiculo.id
		  AND
		  categoria.id = vehiculo.categoria_id
		  AND
		  propietario.rfid = v_rfid;

		INSERT INTO pasos
		( peajes_id,
  		propietario_id,
  		pspago
		)
		VALUES
		( v_peaje_id,
  		v_propietario_id,
  		v_pspagos
		);

    	END$$
DELIMITER ;
