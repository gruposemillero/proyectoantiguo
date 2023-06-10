-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-12-2022 a las 14:13:08
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `empresa`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ACTUALIZACION_PAGO_GENERAL` (IN `IDP` INT, IN `PT` FLOAT, IN `PP` FLOAT, IN `BI` FLOAT, IN `BF` FLOAT, IN `BE` FLOAT, IN `BP` FLOAT, IN `BEM` FLOAT, IN `PRU` FLOAT)   BEGIN

SET @B:=(select Pago_Parcial from pago WHERE Id_Pago = IDP) + PP;

SET @C:=(PT-@B);

SET @BINICIO:=(select Biatico_Inicio from pago WHERE Id_Pago = IDP);

SET @BFINAL:=(select Biatico_Final from pago WHERE Id_Pago = IDP);

SET @BEXTRAS:=(select Biatico_Extras from pago WHERE Id_Pago = IDP);

SET @BPERSONAL:=(select Biatico_Personal from pago WHERE Id_Pago = IDP);

SET @BEMPRESA:=(select Biatico_Empresa from pago WHERE Id_Pago = IDP);

INSERT INTO fechapago(Id_Pago,Fecha_Modificacion,Pago) VALUES (IDP,CURDATE(),PP);



UPDATE pago SET

Pago_Total = PT,

Pago_Parcial = @B,

Restante = @C,

Biatico_Inicio = @BINICIO+ BI,

Biatico_Final = @BFINAL + BF,

Biatico_Extras = @BEXTRAS + BE,

Biatico_Personal =  @BPERSONAL+ BP,

Biatico_Empresa = @BEMPRESA + BEM,

Precio_Unidad = PRU 

WHERE Id_Pago = IDP;



IF@C = 0 THEN

	UPDATE pago SET Estado = 'PAGADO'  WHERE Id_Pago = IDP;

ELSE

	UPDATE pago SET Estado = 'DEUDA'  WHERE Id_Pago = IDP;

END IF;

SET @D:=BI;



IF@D != 0 THEN

	UPDATE pago SET Tipo = 'VENTA'  WHERE Id_Pago = IDP;

	SET @E:=(select distinct Id_Grupo from registrodeganado where Id_Pago = IDP);

	SET @F:=(select count(Id_Grupo) from registrodeganado WHERE Id_Grupo = @E);

	SET @G:= (BI+BE+BP+BEM)/@F;

	UPDATE registrodeganado SET Biatico_Ganado = @G WHERE Id_Grupo = @E;

ELSE

	UPDATE pago SET Tipo = 'COMPRA'  WHERE Id_Pago = IDP;

END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ACTUALIZAR_PAGO_GANADO` (IN `IDGRUPOT` INT, IN `IDPAGOT` INT, IN `PAGOTOTBIA` FLOAT)   BEGIN

	SET @E:= (select sum(Precio) from empresa.registrodeganado  where Id_Grupo =  IDGRUPOT );

	UPDATE pago SET Pago_Total = @E WHERE Id_Pago = IDPAGOT;

	SET @D:= (SELECT Pago_Parcial FROM empresa.pago WHERE Id_Pago = IDPAGOT);

	SET @F:= (SELECT Pago_Total FROM empresa.pago WHERE Id_Pago = IDPAGOT);

	UPDATE pago SET Restante = @E-@D, Fecha_Modificado = CURDATE() where Id_Pago = IDPAGOT;

	SET @G:= (select count(Id_Grupo) from registrodeganado where Id_Grupo =  IDGRUPOT);

	SET @I:= PAGOTOTBIA/@G;

	UPDATE registrodeganado SET Biatico_Ganado = @I WHERE Id_Grupo = IDGRUPOT;



END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ACTUALIZAR_PAGO_GANADO_PRECIO_UNITARIO` (IN `IDGV` INT, `PESOT` FLOAT, `PRECIOUNI` FLOAT)   BEGIN

UPDATE empresa.registroventaganado SET

Peso_Actual = PESOT,

Precio_Unitario = PRECIOUNI,

Precio_Final = PESOT * PRECIOUNI 

WHERE 

 Id_Venta_Ganado = IDGV;



END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ACTUALIZAR_PAGO_GANADO_PRECIO_UNITARIO_GANADO` (IN `IDGV` INT, `PESOT` FLOAT, `PRECIOUNI` FLOAT)   BEGIN



UPDATE empresa.registroventaganado SET

Peso_Actual = PESOT,

Precio_Unitario = PRECIOUNI,

Precio_Final = PESOT * PRECIOUNI 

WHERE 

 Id_Ganado_Registro = IDGV;



END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ACTUALIZAR_PAGO_GANADO_TOTAL` (IN `IDGRUPOT` INT, IN `IDPAGOT` INT, IN `PAGOTOTBIA` FLOAT)   BEGIN

	SET @E:= (select Pago_Total from empresa.pago  where Id_Pago =  IDPAGOT );

	

	SET @D:= (SELECT Pago_Parcial FROM empresa.pago WHERE Id_Pago = IDPAGOT);

	UPDATE pago SET Restante = @E-@D where Id_Pago = IDPAGOT;

	SET @G:= (select count(Id_Grupo) from registrodeganado where Id_Grupo =  IDGRUPOT);

	SET @I:= PAGOTOTBIA/@G;

	SET @F:= @E/@G;

	UPDATE registrodeganado SET Biatico_Ganado = @I WHERE Id_Grupo = IDGRUPOT;

	

	UPDATE registrodeganado SET Precio = @F WHERE Id_Grupo = IDGRUPOT;

	IF(@E-@D) = 0 THEN

	UPDATE pago SET Estado = 'PAGADO', Fecha_Modificado = CURDATE();

ELSE

	UPDATE pago SET Estado = 'DEUDA', Fecha_Modificado = CURDATE();

END IF;



END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ACTUALIZAR_PAGO_GANADO_UNIDAD` (IN `IDGRUPOT` INT, IN `IDPAGOT` INT, IN `PAGOTOTBIA` FLOAT)   BEGIN

	SET @E:= (select sum(Precio) from empresa.registrodeganado  where Id_Grupo =  IDGRUPOT );

	UPDATE pago SET Pago_Total = @E WHERE Id_Pago = IDPAGOT;

	SET @D:= (SELECT Pago_Parcial FROM empresa.pago WHERE Id_Pago = IDPAGOT);

	SET @F:= (SELECT Pago_Total FROM empresa.pago WHERE Id_Pago = IDPAGOT);

	UPDATE pago SET Restante = @E-@D, Fecha = CURDATE() where Id_Pago = IDPAGOT;

	SET @G:= (select count(Id_Grupo) from registrodeganado where Id_Grupo =  IDGRUPOT);

	SET @I:= PAGOTOTBIA/@G;

	UPDATE registrodeganado SET Biatico_Ganado = @I WHERE Id_Grupo = IDGRUPOT;



END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ACTUALIZAR_PAGO_GANADO_VISTA` (IN `IDGRUPOT` INT, IN `IDPAGOT` INT, IN `PRECIOT` FLOAT)   BEGIN

	UPDATE empresa.pago SET Pago_Total = PRECIOT WHERE Id_Pago = IDPAGOT;

	SET @D:= (SELECT Pago_Parcial FROM empresa.pago WHERE Id_Pago = IDPAGOT);

	SET @F:= (SELECT Pago_Total FROM empresa.pago WHERE Id_Pago = IDPAGOT);

	UPDATE pago SET Restante = @F-@D, Fecha_Modificado = CURDATE() where Id_Pago = IDPAGOT;

	SET @G:= (select count(Id_Grupo) from registrodeganado where Id_Grupo =  IDGRUPOT);

	SET @H:= (SELECT Biatico_Inicio FROM empresa.pago WHERE Id_Pago = IDPAGOT);

	SET @J:= (SELECT Biatico_Extras FROM empresa.pago WHERE Id_Pago = IDPAGOT);

	SET @K:= (SELECT Biatico_Personal FROM empresa.pago WHERE Id_Pago = IDPAGOT);

	SET @L:= (SELECT Biatico_Empresa FROM empresa.pago WHERE Id_Pago = IDPAGOT);

	SET @M:= @H+@J+@K+@L;

	SET @I:= @M/@G;

	UPDATE registrodeganado SET Biatico_Ganado = @I WHERE Id_Grupo = IDGRUPOT;



END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ACTUALIZAR_PAGO_TOTAL_VENTA` (IN `grupoventa` INT, IN `pesototal` FLOAT, IN `preciounidadventa` FLOAT)   BEGIN

	SET @E:= (select distinct Id_Pago_Venta from registroventaganado where Grupo_Venta =  grupoventa);

	SET @F:= (SELECT Pago_Parcial FROM empresa.pago WHERE Id_Pago = @E);

	SET @G:= pesototal*preciounidadventa;

	SET @I:= (SELECT count(Grupo_Venta) FROM empresa.registroventaganado WHERE Grupo_Venta =grupoventa);

	SET @C:= @G - @F;

	IF@C < 0 THEN

	SELECT 1;

ELSE

	UPDATE pago SET Pago_Total =  @G ,  Restante = @C, Precio_Unidad = preciounidadventa where Id_Pago =  @E;

	UPDATE registroventaganado SET Peso_Actual = preciounidadventa, Precio_Final = @G/@I WHERE Grupo_Venta = grupoventa;

	SELECT 2;

END IF;

	

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ACTUALIZAR_PAGO_VENTA` (IN `IG` INT, IN `PP` FLOAT, IN `IDP` FLOAT)   BEGIN

-- SET @C:=(select sum(Precio) from registroventaganado WHERE Grupo_Venta =IG);

-- SET  @D:= @C - PP;

-- UPDATE pago SET

-- Pago_Total = @C,

-- Pago_Parcial = PP,

-- Restante = @D

-- WHERE Id_Pago = IDP;

SET @E:=(SELECT Biatico_Final FROM pago WHERE Id_Pago =IDP);

SET @F:=(SELECT Biatico_Extras FROM pago WHERE Id_Pago =IDP);

SET @G:=(SELECT Biatico_Personal FROM pago WHERE Id_Pago =IDP);

SET @H:=(SELECT Biatico_Empresa FROM pago WHERE Id_Pago =IDP);

SET @I:= (SELECT count(Grupo_Venta) FROM registroventaganado WHERE Grupo_Venta =IG);

SET @J:= (@E+@F+@G+@H)/@I;

UPDATE registroventaganado SET

Biatico_Ganado = @J WHERE Grupo_Venta = IG;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ACTUALIZAR_PAGO_VENTA_PRECIO_UNIDAD_DEVERDAD` (IN `IDGV` INT)   BEGIN

SET @C:=(SELECT Id_Pago_Venta from registroventaganado WHERE Id_Ganado_Registro = IDGV);	

SET @E:=(SELECT Grupo_Venta from registroventaganado WHERE Id_Ganado_Registro = IDGV);	

SET @D:=(SELECT sum(Precio_Final) from registroventaganado WHERE Grupo_Venta = @E);	

SET @F:=(SELECT Pago_Parcial from pago WHERE Id_Pago = @C);	

UPDATE empresa.pago SET

Pago_Total = @D, Restante = @D-@F WHERE Id_Pago = @C;



END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ACTUALIZAR_PAGO_VENTA_PRECIO_UNIDAD_UJUM` (IN `IDGV` INT)   BEGIN



SET @C:=(SELECT Id_Pago_Venta from registroventaganado WHERE Id_Ganado_Registro = IDGV);	

SET @E:=(SELECT Grupo_Venta from registroventaganado WHERE Id_Venta_Ganado = IDGV);	

SET @D:=(SELECT sum(Precio_Final) from registroventaganado WHERE Grupo_Venta = @E);	

SET @F:=(SELECT Pago_Parcial from pago WHERE Id_Pago = @C);	

UPDATE empresa.pago SET

Pago_Total = @D, Restante = @D-@F WHERE Id_Pago = @C;



END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ELIMINAR_BIATICO` (IN `ID_PAGO32` INT)   DELETE FROM pago

WHERE Id_Pago = ID_PAGO32$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ELIMINAR_BIATICO_PAGO` (IN `ID_PAGO32` INT)   DELETE FROM fechapago WHERE fechapago.Id_Pago = ID_PAGO32$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ELIMINAR_COMPRADOR` (IN `ID_VENDEDOR` INT)   DELETE FROM comprador

WHERE Id_Comprador = ID_VENDEDOR$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ELIMINAR_PROVEEDOR` (IN `ID_VENDEDOR` INT)   DELETE FROM proveedor
WHERE Id_Proveedor = ID_VENDEDOR$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ELIMINAR_REGISTRO_BIATICO` (IN `ID_PAGO32` INT)   DELETE FROM fechapago WHERE fechapago.Id_Pago = ID_PAGO32$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ELIMINAR_TRANSPORTISTA` (IN `ID_VENDEDOR` INT)   DELETE FROM transportista

WHERE Id_Transportista = ID_VENDEDOR$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTADO_GRUPO_VENTAS_FILTRADO` (IN `DNIBS` INT)   BEGIN

SET @C:=DNIBS;

IF LENGTH(@C) <= 1 THEN

SELECT

	registroventaganado.Grupo_Venta,

	pago.Fecha, 

	CONCAT_WS(' ',comprador.Nombre,comprador.Apellido) AS nombre,

	comprador.Documento,

	transportista.Licencia, 

	pago.Id_Pago, 

	count(Grupo_Venta) AS cantidad, 

	pago.Ubicacion, 

	pago.Precio_Unidad, 

	TRUNCATE(pago.Pago_Total,2) AS Pago_Total, 

	TRUNCATE(pago.Restante,2) AS Restante,

    TRUNCATE(sum(registrodeganado.Peso),2) AS Peso_Total,

	TRUNCATE(sum(registrodeganado.Precio) + sum(registrodeganado.Biatico_Ganado),2) AS precio_compra_total

FROM

	registroventaganado

	INNER JOIN

	pago

	ON 

		registroventaganado.Id_Pago_Venta = pago.Id_Pago

	INNER JOIN

	comprador

	ON 

		registroventaganado.Id_Comprador = comprador.Id_Comprador

    INNER JOIN

			registrodeganado

			ON 

				registroventaganado.Id_Ganado_Registro = registrodeganado.Id_Registro_Ganado



	INNER JOIN

	transportista

	ON 

		registroventaganado.Id_Transportista = transportista.Id_Transportista

		 GROUP BY Grupo_Venta;

ELSE

SELECT

	registroventaganado.Grupo_Venta,

	pago.Fecha, 

	CONCAT_WS(' ',comprador.Nombre,comprador.Apellido) AS nombre,

	comprador.Documento,

	transportista.Licencia, 

	pago.Id_Pago, 

	count(Grupo_Venta) AS cantidad, 

	pago.Ubicacion, 

	pago.Precio_Unidad, 

	TRUNCATE(pago.Pago_Total,2) AS Pago_Total, 

	TRUNCATE(pago.Restante,2) AS Restante

FROM

	registroventaganado

	INNER JOIN

	pago

	ON 

		registroventaganado.Id_Pago_Venta = pago.Id_Pago

	INNER JOIN

	comprador

	ON 

		registroventaganado.Id_Comprador = comprador.Id_Comprador

	INNER JOIN

	transportista

	ON 

		registroventaganado.Id_Transportista = transportista.Id_Transportista

		 WHERE comprador.Documento = @C GROUP BY Grupo_Venta;

END IF;







END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_BIATICO` ()   SELECT

	pago.Id_Pago, 

	TRUNCATE(pago.Pago_Total,2)as Pago_Total, 

	TRUNCATE(pago.Pago_Parcial,2) as Pago_Parcial, 

	TRUNCATE(pago.Restante,2) as Restante, 

	TRUNCATE(pago.Biatico_Inicio,2) as Biatico_Inicio, 

	TRUNCATE(pago.Biatico_Final,2) as Biatico_Final, 

	TRUNCATE(pago.Biatico_Extras,2) as Biatico_Extras, 

	TRUNCATE(pago.Biatico_Personal,2) as Biatico_Personal, 

	TRUNCATE(pago.Biatico_Empresa,2) as Biatico_Empresa, 

	pago.Fecha, 

	pago.Estado,

	pago.Precio_Unidad,

	pago.Tipo

FROM

	pago$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_COMPRADOR` ()   SELECT
	empresa.comprador.Id_Comprador, 
	empresa.comprador.Nombre, 
	empresa.comprador.Documento, 
	empresa.comprador.Apellido, 
	empresa.comprador.RUC
FROM
	empresa.comprador$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_FECHA_PAGO` (IN `IDP` INT)   SELECT

	fechapago.Id_Fecha_Pago, 

	fechapago.Id_Pago, 

	fechapago.Fecha_Modificacion, 

	TRUNCATE(fechapago.Pago,2) as Pago

FROM

	fechapago 

WHERE

	fechapago.Id_Pago = IDP$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_GANADO_FILTRADO` (IN `idg` INT)   BEGIN

 SELECT * FROM empresa.registrodeganado WHERE Id_Grupo = idg;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_GRUPO` ()   SELECT DISTINCT 

	registrodeganado.Id_Grupo, 

	pago.Fecha,

	registrodeganado.Id_Proveedor, 

	registrodeganado.Id_Transportista, 

	registrodeganado.Id_Pago, 

	concat_ws(' ',proveedor.Nombre, proveedor.Apellido) AS Nombre,

	proveedor.Documento, 

	transportista.Licencia,

	pago.Ubicacion AS Ubicacion,

	TRUNCATE((sum(registrodeganado.Peso)),2) AS Peso,

	Pago.Precio_Unidad AS Precio_Unidad,

	TRUNCATE(sum(registrodeganado.Precio),2) AS Precio

	

FROM

	registrodeganado

	INNER JOIN

	pago

	ON 

		registrodeganado.Id_Pago = pago.Id_Pago

	INNER JOIN

	transportista

	ON 

		registrodeganado.Id_Transportista = transportista.Id_Transportista

	INNER JOIN

	proveedor

	ON 

		registrodeganado.Id_Proveedor = proveedor.Id_Proveedor

		

	GROUP BY Id_Grupo$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_GRUPO_COMPRA` ()   SELECT DISTINCT 

	registrodeganado.Id_Grupo, 

	pago.Fecha,

	registrodeganado.Id_Proveedor, 

	registrodeganado.Id_Transportista, 

	registrodeganado.Id_Pago, 

	concat_ws(' ',proveedor.Nombre, proveedor.Apellido) AS Nombre,

	proveedor.Documento, 

	transportista.Licencia,

	pago.Ubicacion AS Ubicacion,

	TRUNCATE((sum(registrodeganado.Peso)),2) AS Peso,

	Pago.Precio_Unidad AS Precio_Unidad,

	TRUNCATE(pago.Pago_Total,2) AS Precio,

	pago.Restante

FROM

	registrodeganado

	INNER JOIN

	pago

	ON 

		registrodeganado.Id_Pago = pago.Id_Pago

	INNER JOIN

	transportista

	ON 

		registrodeganado.Id_Transportista = transportista.Id_Transportista

	INNER JOIN

	proveedor

	ON 

		registrodeganado.Id_Proveedor = proveedor.Id_Proveedor

		

	GROUP BY Id_Grupo$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_GRUPO_GANANCIAS` ()   SELECT

	registroventaganado.Grupo_Venta, 

	pago.Fecha, 

	concat_ws(' ',comprador.Nombre, comprador.Apellido) AS Nombre,

	comprador.Documento, 

	transportista.Licencia,

	count(Grupo_Venta) AS cantidad,

	TRUNCATE(sum(registrodeganado.Precio),2) AS precio_compra,

	TRUNCATE(sum(registrodeganado.Biatico_Ganado),2) AS gasto_inicial,

	TRUNCATE(sum(registrodeganado.Precio),2) + 	TRUNCATE(sum(registrodeganado.Biatico_Ganado),2) AS precio_compra_total , 

	TRUNCATE(Pago.Pago_Total,2) AS precio_venta,

	TRUNCATE(sum(registroventaganado.Biatico_Ganado),2) AS gasto_final,

	TRUNCATE(Pago.Pago_Total,2) + TRUNCATE(sum(registroventaganado.Biatico_Ganado),2) AS precio_venta_total,

	TRUNCATE((Pago.Pago_Total + sum(registroventaganado.Biatico_Ganado)) - (sum(registrodeganado.Precio) + 	sum(registrodeganado.Biatico_Ganado)),2) AS ganancia

	

FROM

	registroventaganado 

	INNER JOIN

	pago

	ON 

		registroventaganado.Id_Pago_Venta = pago.Id_Pago

	INNER JOIN

	comprador

	ON 

		registroventaganado.Id_Comprador = comprador.Id_Comprador

	INNER JOIN

	transportista

	ON 

		registroventaganado.Id_Transportista = transportista.Id_Transportista

	INNER JOIN

	registrodeganado

	ON 

		registroventaganado.Id_Ganado_Registro = registrodeganado.Id_Registro_Ganado

		

	GROUP BY Grupo_Venta$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_GRUPO_GANANCIAS_PRUEBA` (IN `DNIBS` INT)   BEGIN



SET @C:=DNIBS;

IF LENGTH(@C) <= 1 THEN

		SELECT

			registroventaganado.Grupo_Venta, 

			pago.Fecha, 

			concat_ws(' ',comprador.Nombre, comprador.Apellido) AS Nombre,

			comprador.Documento, 

			transportista.Licencia,

			count(Grupo_Venta) AS cantidad,

			TRUNCATE(sum(registrodeganado.Precio),2) AS precio_compra,

			TRUNCATE(sum(registrodeganado.Biatico_Ganado),2) AS gasto_inicial,

			TRUNCATE(sum(registrodeganado.Precio) + 	sum(registrodeganado.Biatico_Ganado),2) AS precio_compra_total , 

			TRUNCATE(Pago.Pago_Total,2) AS precio_venta,

			TRUNCATE(sum(registroventaganado.Biatico_Ganado),2) AS gasto_final,

			TRUNCATE(Pago.Pago_Total - sum(registroventaganado.Biatico_Ganado),2) AS precio_venta_total,

			TRUNCATE((Pago.Pago_Total - sum(registroventaganado.Biatico_Ganado)) - (sum(registrodeganado.Precio) + 	sum(registrodeganado.Biatico_Ganado)),2) AS ganancia

			

		FROM

			registroventaganado 

			INNER JOIN

			pago

			ON 

				registroventaganado.Id_Pago_Venta = pago.Id_Pago

			INNER JOIN

			comprador

			ON 

				registroventaganado.Id_Comprador = comprador.Id_Comprador

			INNER JOIN

			transportista

			ON 

				registroventaganado.Id_Transportista = transportista.Id_Transportista

			INNER JOIN

			registrodeganado

			ON 

				registroventaganado.Id_Ganado_Registro = registrodeganado.Id_Registro_Ganado

				

			GROUP BY Grupo_Venta;

ELSE

	SELECT

	registroventaganado.Grupo_Venta, 

	pago.Fecha, 

	concat_ws(' ',comprador.Nombre, comprador.Apellido) AS Nombre,

	comprador.Documento, 

	transportista.Licencia,

	count(Grupo_Venta) AS cantidad,

	TRUNCATE(sum(registrodeganado.Precio),2) AS precio_compra,

			TRUNCATE(sum(registrodeganado.Biatico_Ganado),2) AS gasto_inicial,

			TRUNCATE(sum(registrodeganado.Precio) + 	sum(registrodeganado.Biatico_Ganado),2) AS precio_compra_total , 

			TRUNCATE(Pago.Pago_Total,2) AS precio_venta,

			TRUNCATE(sum(registroventaganado.Biatico_Ganado),2) AS gasto_final,

			TRUNCATE(Pago.Pago_Total - sum(registroventaganado.Biatico_Ganado),2) AS precio_venta_total,

			TRUNCATE((Pago.Pago_Total - sum(registroventaganado.Biatico_Ganado)) - (sum(registrodeganado.Precio) + 	sum(registrodeganado.Biatico_Ganado)),2) AS ganancia

FROM

	registroventaganado 

	INNER JOIN

	pago

	ON 

		registroventaganado.Id_Pago_Venta = pago.Id_Pago

	INNER JOIN

	comprador

	ON 

		registroventaganado.Id_Comprador = comprador.Id_Comprador

	INNER JOIN

	transportista

	ON 

		registroventaganado.Id_Transportista = transportista.Id_Transportista

	INNER JOIN

	registrodeganado

	ON 

		registroventaganado.Id_Ganado_Registro = registrodeganado.Id_Registro_Ganado

		

	 WHERE comprador.Documento = @C GROUP BY Grupo_Venta;

END IF;

	

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_GRUPO_NUEVO` ()   SELECT DISTINCT 

	registrodeganado.Id_Grupo, 

	pago.Fecha,

	registrodeganado.Id_Proveedor, 

	registrodeganado.Id_Transportista, 

	registrodeganado.Id_Pago, 

	concat_ws(' ',proveedor.Nombre, proveedor.Apellido) AS Nombre,

	proveedor.Documento, 

	transportista.Licencia,

	pago.Ubicacion AS Ubicacion,

	TRUNCATE((sum(registrodeganado.Peso)),2) AS Peso,

	TRUNCATE(Pago.Precio_Unidad,2) AS Precio_Unidad,

	TRUNCATE(sum(registrodeganado.Precio),2) AS Precio

FROM

	registrodeganado

	INNER JOIN

	pago

	ON 

		registrodeganado.Id_Pago = pago.Id_Pago

	INNER JOIN

	transportista

	ON 

		registrodeganado.Id_Transportista = transportista.Id_Transportista

	INNER JOIN

	proveedor

	ON 

		registrodeganado.Id_Proveedor = proveedor.Id_Proveedor

		

	GROUP BY Id_Grupo$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_PROVEEDOR` ()   BEGIN
	select * FROM empresa.proveedor;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_TRANSPORTISTA` ()   BEGIN
select * FROM empresa.transportista;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_VENTA_GANADO` (IN `idg` INT)   SELECT

	registroventaganado.Id_Ganado_Registro, 

	registrodeganado.Raza, 

	registrodeganado.Peso, 

	registrodeganado.Precio, 

	registrodeganado.Sexo, 

	registrodeganado.Color, 

	registrodeganado.Salud, 

	registrodeganado.Aretes, 

	registrodeganado.Marca, 

	registrodeganado.Descripcion, 

	registrodeganado.Id_Grupo, 

	registroventaganado.Grupo_Venta, 

	CONCAT(registrodeganado.Edad," ",registrodeganado.Tipo) as Edad,

	TRUNCATE(registroventaganado.Precio_Final,2) AS Precio_Venta,

	TRUNCATE(registroventaganado.Precio_Final - registrodeganado.Precio ,2) AS Gananicas,

	CONCAT(proveedor.Apellido," ",proveedor.Nombre) as nombre,

	TRUNCATE(registroventaganado.Precio_Unitario,2) AS Precio_Unitario,

	registroventaganado.Peso_Actual AS Peso_Actual

	FROM

	registroventaganado

	

	INNER JOIN

	registrodeganado

	ON 

		registroventaganado.Id_Ganado_Registro = registrodeganado.Id_Registro_Ganado 

		INNER JOIN

	proveedor

	ON 

		registrodeganado.Id_Proveedor = proveedor.Id_Proveedor

		

		WHERE Grupo_Venta = idg$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTAR_VENTA_GANADO_VENDIDOS` (IN `idg` INT)   SELECT

	registroventaganado.Id_Ganado_Registro, 

	registrodeganado.Raza, 

	registrodeganado.Peso, 

	registrodeganado.Precio, 

	registrodeganado.Sexo, 

	registrodeganado.Color, 

	registrodeganado.Salud, 

	registrodeganado.Aretes, 

	registrodeganado.Marca, 

	registrodeganado.Descripcion, 

	registrodeganado.Id_Grupo, 

	registroventaganado.Grupo_Venta, 

	registrodeganado.Edad

FROM

	registroventaganado

	INNER JOIN

	registrodeganado

	ON 

		registroventaganado.Id_Ganado_Registro = registrodeganado.Id_Registro_Ganado WHERE Grupo_Venta = idg$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LISTA_PAGO_FILTRADO_COMPRA` (IN `GRUP` INT)   SELECT

	pago.Id_Pago, 

	pago.Id_Grupo_Compra, 

	pago.Id_Grupo_Venta, 

	pago.Pago_Total, 

	pago.Pago_Parcial, 

	pago.Restante, 

	pago.Biatico_Inicio, 

	pago.Biatico_Extras, 

	pago.Biatico_Final, 

	pago.Biatico_Personal, 

	pago.Biatico_Empresa, 

	pago.Fecha

FROM

	pago

WHERE

pago.Id_Grupo_Compra = GRUP$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MODIFICAR_COMPRADOR` (IN `ID_VENDEDOR` INT, IN `NOMBRE_VENDEDOR` VARCHAR(30), IN `APELLIDO_VENDEDOR` VARCHAR(30), IN `DOCUMENTO_VENDEDOR` VARCHAR(20), IN `RUC_VENDEDOR` VARCHAR(30))   UPDATE comprador SET

Nombre = NOMBRE_VENDEDOR,

Apellido = APELLIDO_VENDEDOR,

Documento = DOCUMENTO_VENDEDOR,

RUC = RUC_VENDEDOR

WHERE Id_Comprador = ID_VENDEDOR$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MODIFICAR_GANADO` (IN `IDGANADOMOD` INT, IN `RAZA_GANADO` VARCHAR(20), IN `PESO_GANDO` FLOAT, IN `COLOR_GANADO` VARCHAR(20), IN `SEXO_GANADO` VARCHAR(1), IN `SALUD_GANADO` VARCHAR(4), IN `MARCA_GANADO` VARCHAR(10), IN `ARETES_GANADO` VARCHAR(10), IN `SCRIPCION_GANADO` TEXT, IN `EDAD_GANADO` INT, `PRECIO_GANADO` FLOAT)   BEGIN

UPDATE registrodeganado SET

Raza = RAZA_GANADO,

Color = COLOR_GANADO,

Sexo = SEXO_GANADO,

Salud = SALUD_GANADO,

Marca = MARCA_GANADO,

Aretes = ARETES_GANADO,

Descripcion = SCRIPCION_GANADO,

Edad = EDAD_GANADO

WHERE Id_Registro_Ganado = IDGANADOMOD;



SET @C:= (SELECT Id_Grupo FROM empresa.registrodeganado where Id_Registro_Ganado =IDGANADOMOD );

SET @E:= (SELECT Id_Pago FROM empresa.registrodeganado where Id_Registro_Ganado =IDGANADOMOD );



SET @D:= (SELECT sum(Precio) from registrodeganado where Id_Grupo = @C);



SET @F:= (Select Pago_Parcial from pago where Id_Pago = @E);



UPDATE pago SET



Pago_Total = @D,

Restante = @D-@F

WHERE Id_Pago = @E;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MODIFICAR_PAGO` (IN `IDS` INT, IN `GRUPOIDCOMPRA` INT, IN `PAGOTOTAL` FLOAT, IN `PAGOPARCIAL` FLOAT, `RESTANTE1` FLOAT, IN `BIATICOINICIO` FLOAT, IN `BIATICOEXTRAS` FLOAT, IN `BIATICOPERSONAL` FLOAT, IN `BIATICOEMPRESA` FLOAT, IN `PAGOTOTALBIATICO` FLOAT)   BEGIN

	UPDATE pago SET

	Id_Grupo_Compra =GRUPOIDCOMPRA ,

	Pago_Total = PAGOTOTAL,

	Pago_Parcial = PAGOPARCIAL,

	Restante = RESTANTE,

	Biatico_Inicio = BIATICOINICIO,

	Biatico_Extras = BIATICOEXTRAS,

	Biatico_Personal = BIATICOPERSONAL,

	Biatico_Empresa = BIATICOEMPRESA,

	Fecha_Modificado = CURDATE()

	WHERE pago.Id_Pago = IDS;

	SET @D:=(SELECT count(Id_Grupo) from registrodeganado where Id_Grupo = GRUPOIDCOMPRA);

SET @C:=(PAGOTOTALBIATICO/@D);



UPDATE registrodeganado SET Biatico_Ganado = @C WHERE Id_Grupo = GRUPOIDCOMPRA;



END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MODIFICAR_PROVEEDOR` (IN `ID_PROVEEDORT` INT, IN `NOMBRE_PROVEEDOR` VARCHAR(30), IN `APELLIDO_PROVEEDOR` VARCHAR(30), IN `DOCUMENTO_PROVEEDOR` VARCHAR(30), IN `RUC_PROVEEDOR` VARCHAR(20))   UPDATE proveedor SET

Nombre = NOMBRE_PROVEEDOR,

Apellido = APELLIDO_PROVEEDOR,

Documento = DOCUMENTO_PROVEEDOR,

ruc = RUC_PROVEEDOR

WHERE Id_Proveedor = ID_PROVEEDORT$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `MODIFICAR_TRANSPORTISTA` (IN `ID_TR` INT, IN `PLACA_T` VARCHAR(20), IN `LICENCIA_T` VARCHAR(30), IN `DOCUMENTO_T` VARCHAR(10), IN `RUC_T` VARCHAR(15))   UPDATE transportista SET

Placa = PLACA_T,

Licencia = LICENCIA_T,

Documento = DOCUMENTO_T,

RUC = RUC_T

WHERE Id_Transportista = ID_TR$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_COMPRADOR` (IN `NOMBREV` VARCHAR(30), IN `APELLIDOV` VARCHAR(30), IN `DOCUMENTOV` VARCHAR(10), IN `RUCV` VARCHAR(20))   BEGIN



DECLARE C INT;

SET @C:=(SELECT COUNT(*) from comprador WHERE Documento = BINARY DOCUMENTOV);

IF@C <= 1 THEN

	INSERT INTO comprador(Nombre,Apellido,Documento,RUC)VALUES(NOMBREV,APELLIDOV,DOCUMENTOV,RUCV);

	SELECT 1;

ELSE

	SELECT 2;

END IF;



END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_GANADO_VENTA` (IN `IGR` INT, IN `IGV` INT, IN `COM` INT, IN `TRANS` INT, IN `IPG` INT)   BEGIN

INSERT INTO registroventaganado(Id_Ganado_Registro,Grupo_Venta,Id_Comprador,Id_Transportista,Id_Pago_Venta) VALUES (IGR,IGV,COM,TRANS,IPG);



update empresa.registrodeganado set Estado = 'VENDIDO' where Id_Registro_Ganado = IGR ;



END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_GRUPO_COMPRA` ()   BEGIN

 SET @A:= (SELECT max(Id_Grupo) from registrodeganado);

 

IF LENGTH(@A) >= 1 THEN

	SELECT max(Id_Grupo) from registrodeganado;

ELSE

	SELECT 1;

END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_GRUPO_VENTA` ()   BEGIN

 SET @A:= (SELECT max(Grupo_Venta) from registroventaganado);

 

IF LENGTH(@A) >= 1 THEN

	SELECT max(Grupo_Venta) from registroventaganado;

ELSE

	SELECT 1;

END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_PAGO` (IN `PAGOPARCIAL` FLOAT, IN `BIATICOINICIO` FLOAT, IN `BIATICOEXTRAS` FLOAT, IN `BIATICOPERSONAL` FLOAT, IN `BIATICOEMPRESA` FLOAT, IN `PAGOTOTALBIATICO` FLOAT, IN `UBICACIONGM` TEXT, IN `PRU` FLOAT)   BEGIN

INSERT INTO pago(Pago_Parcial,Biatico_Inicio,Biatico_Extras,Biatico_Personal,Biatico_Empresa,Fecha,Ubicacion,Precio_Unidad,Tipo) VALUES (PAGOPARCIAL,BIATICOINICIO,BIATICOEXTRAS,BIATICOPERSONAL,BIATICOEMPRESA,CURDATE(),UBICACIONGM,PRU,'COMPRA');

SET @B:=(SELECT LAST_INSERT_ID());



INSERT INTO fechapago(Id_Pago,Fecha_Modificacion,Pago) VALUES (@B,CURDATE(),PAGOPARCIAL);

SELECT @B;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_PAGO_TOTAL` (IN `PAGOTOTALP` FLOAT, IN `PAGOPARCIAL` FLOAT, IN `BIATICOINICIO` FLOAT, IN `BIATICOEXTRAS` FLOAT, IN `BIATICOPERSONAL` FLOAT, IN `BIATICOEMPRESA` FLOAT, IN `PAGOTOTALBIATICO` FLOAT, IN `UBICACIONGM` TEXT, IN `PRU` FLOAT)   BEGIN



INSERT INTO pago(Pago_Total,Pago_Parcial,Restante,Biatico_Inicio,Biatico_Extras,Biatico_Personal,Biatico_Empresa,Fecha,Ubicacion,Precio_Unidad,Tipo) VALUES (PAGOTOTALP,PAGOPARCIAL,PAGOTOTALP-PAGOPARCIAL,BIATICOINICIO,BIATICOEXTRAS,BIATICOPERSONAL,BIATICOEMPRESA,CURDATE(),UBICACIONGM,PRU,'COMPRA');





SET @B:=(SELECT LAST_INSERT_ID());



INSERT INTO fechapago(Id_Pago,Fecha_Modificacion,Pago) VALUES (@B,CURDATE(),PAGOPARCIAL);

SELECT @B;



END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_PAGO_VENTA` (IN `PAGOPARCIAL` FLOAT, IN `BIATICOINICIO` FLOAT, IN `BIATICOEXTRAS` FLOAT, IN `BIATICOPERSONAL` FLOAT, IN `BIATICOEMPRESA` FLOAT, IN `PAGOTOTALBIATICO` FLOAT, IN `UBI` TEXT)   BEGIN

	INSERT INTO pago(Pago_Parcial,Biatico_Final,Biatico_Extras,Biatico_Personal,Biatico_Empresa,Fecha,Ubicacion,Tipo) VALUES (PAGOPARCIAL,BIATICOINICIO,BIATICOEXTRAS,BIATICOPERSONAL,BIATICOEMPRESA,CURDATE(),UBI,'VENTA');

SET @B:=(SELECT LAST_INSERT_ID());



INSERT INTO fechapago(Id_Pago,Fecha_Modificacion,Pago) VALUES (@B,CURDATE(),PAGOPARCIAL);

SELECT @B;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_PROVEEDOR` (IN `NOMBREV` VARCHAR(30), IN `APELLIDOV` VARCHAR(30), IN `DOCUMENTOV` VARCHAR(10), IN `RUCV` VARCHAR(20))   BEGIN



DECLARE C INT;

SET @C:=(SELECT COUNT(*) from proveedor WHERE Documento = BINARY DOCUMENTOV);

IF@C = 0 THEN

	INSERT INTO proveedor(Nombre,Apellido,Documento,ruc)VALUES(NOMBREV,APELLIDOV,DOCUMENTOV,RUCV);

	SELECT 1;

ELSE

	SELECT 2;

END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRAR_TRANSPORTISTA` (IN `PLACA_T` VARCHAR(20), IN `LICENCIA_T` VARCHAR(30), IN `DOCUMENTO_T` VARCHAR(10), IN `RUC_T` VARCHAR(15))   BEGIN



DECLARE CANTIDAD INT;

SET @CANTIDAD:=(SELECT COUNT(*) from transportista WHERE Licencia = BINARY LICENCIA_T);

IF@CANTIDAD = 0 THEN

	INSERT INTO transportista(Licencia,PLaca,Documento,RUC)VALUES(LICENCIA_T,PLACA_T,DOCUMENTO_T,RUC_T);

	SELECT 1;

ELSE

	SELECT 2;

END IF;



END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRO_GANADO` (IN `RAZA_GANADO` VARCHAR(20), IN `PESO` FLOAT, IN `COLOR_GANADO` VARCHAR(20), IN `SEXO_GANADO` VARCHAR(1), IN `SALUD_GANADO` VARCHAR(4), IN `MARCA_GANADO` VARCHAR(10), IN `ARETES_GANADO` VARCHAR(10), IN `SCRIPCION_GANADO` TEXT, IN `IDGRUPO_GANADO` INT, IN `EDAD_GANADO` INT, `PRECIO_GANADO` FLOAT, IN `ID_PROVEEDOR_GANADO` INT, IN `ID_TRANSPORTISTA_GANADO` INT, IN `ID_PAGO_GANADO` INT, IN `TIP` VARCHAR(29))   BEGIN

INSERT INTO registrodeganado(Raza,Peso,Color,Sexo,Salud,Marca,Aretes,Descripcion,Id_Grupo,Edad,

Precio,Id_Proveedor,Id_Transportista,Estado,Id_Pago,Tipo)VALUES(RAZA_GANADO,PESO,COLOR_GANADO,SEXO_GANADO,SALUD_GANADO,MARCA_GANADO,

ARETES_GANADO,SCRIPCION_GANADO,IDGRUPO_GANADO,EDAD_GANADO,PRECIO_GANADO,ID_PROVEEDOR_GANADO,ID_TRANSPORTISTA_GANADO,'DISPONIBLE',

ID_PAGO_GANADO,TIP);

select sum(Precio) from registrodeganado where Id_Grupo =IDGRUPO_GANADO;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `REGISTRO_GANADO_TOTAL` (IN `RAZA_GANADO` VARCHAR(20), IN `PESO` FLOAT, IN `COLOR_GANADO` VARCHAR(20), IN `SEXO_GANADO` VARCHAR(1), IN `SALUD_GANADO` VARCHAR(4), IN `MARCA_GANADO` VARCHAR(10), IN `ARETES_GANADO` VARCHAR(10), IN `SCRIPCION_GANADO` TEXT, IN `IDGRUPO_GANADO` INT, IN `EDAD_GANADO` INT, IN `ID_PROVEEDOR_GANADO` INT, IN `ID_TRANSPORTISTA_GANADO` INT, IN `ID_PAGO_GANADO` INT, IN `TIP` VARCHAR(29))   BEGIN

INSERT INTO registrodeganado(Raza,Peso,Color,Sexo,Salud,Marca,Aretes,Descripcion,Id_Grupo,Edad,Id_Proveedor,Id_Transportista,Estado,Id_Pago,Tipo)VALUES(RAZA_GANADO,PESO,COLOR_GANADO,SEXO_GANADO,SALUD_GANADO,MARCA_GANADO,

ARETES_GANADO,SCRIPCION_GANADO,IDGRUPO_GANADO,EDAD_GANADO,ID_PROVEEDOR_GANADO,ID_TRANSPORTISTA_GANADO,'DISPONIBLE',

ID_PAGO_GANADO,TIP);



END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SELECT_GANADO` (IN `grupogranadot` INT)   SELECT DISTINCT

	registrodeganado.Id_Registro_Ganado, 

	registrodeganado.Precio, 

	registrodeganado.Peso,

	registrodeganado.Raza, 

	 

	registrodeganado.Color, 

	registrodeganado.Sexo, 

	registrodeganado.Salud, 

	registrodeganado.Marca, 

	registrodeganado.Aretes, 

	registrodeganado.Descripcion, 

	registrodeganado.Id_Grupo, 

	registrodeganado.Edad, 

	

	registrodeganado.Estado

FROM

	registrodeganado

WHERE

	registrodeganado.Estado  = 'DISPONIBLE' AND registrodeganado.Id_Grupo = grupogranadot$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SELECT_GANADO_INPUT` (IN `idganadot` INT)   SELECT

	registrodeganado.Id_Registro_Ganado, 

	registrodeganado.Precio, 

	registrodeganado.Peso,

	registrodeganado.Raza, 

	registrodeganado.Color, 

	registrodeganado.Sexo, 

	registrodeganado.Salud, 

	registrodeganado.Marca, 

	registrodeganado.Aretes, 

	registrodeganado.Descripcion, 

	registrodeganado.Id_Grupo, 

	registrodeganado.Edad, 

	registrodeganado.Estado

FROM

	registrodeganado

WHERE

	registrodeganado.Estado  = 'DISPONIBLE' AND registrodeganado.Id_Registro_Ganado = idganadot$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SELECT_GANADO_INPUT_LISTA_VENTA` (IN `idganadot` INT)   SELECT

	registrodeganado.Id_Registro_Ganado, 

	registrodeganado.Precio, 

	registrodeganado.Peso,

	registrodeganado.Raza, 

	registrodeganado.Color, 

	registrodeganado.Sexo, 

	registrodeganado.Salud, 

	registrodeganado.Marca, 

	registrodeganado.Aretes, 

	registrodeganado.Descripcion, 

	registrodeganado.Id_Grupo, 

	registrodeganado.Edad, 

	registrodeganado.Estado

FROM

	registrodeganado

WHERE

	registrodeganado.Estado  = 'VENDIDO' AND registrodeganado.Id_Registro_Ganado = idganadot$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SELECT_GANADO_VENTA` (IN `GDV` INT)   SELECT

	registrodeganado.Id_Registro_Ganado,

	registrodeganado.Raza, 

	registrodeganado.Peso, 

	registrodeganado.Color, 

	registrodeganado.Sexo, 

	registrodeganado.Salud, 

	registrodeganado.Marca, 

	registrodeganado.Aretes, 

	registrodeganado.Descripcion, 

	registrodeganado.Id_Grupo, 

	registrodeganado.Edad, 

	registrodeganado.Precio, 

	registroventaganado.Grupo_Venta

FROM

	registroventaganado

	INNER JOIN

	registrodeganado

	ON 

		registroventaganado.Id_Ganado_Registro = registrodeganado.Id_Registro_Ganado

		

	WHERE registroventaganado.Grupo_Venta = GDV AND registroventaganado.Precio_Final = 0$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SELECT_GRUPO_COMPRA` ()   SELECT DISTINCT

	registrodeganado.Id_Grupo, 

	registrodeganado.Estado,

	registrodeganado.Id_Registro_Ganado

FROM

	registrodeganado 

WHERE

	registrodeganado.Estado ='DISPONIBLE'

GROUP BY Id_Grupo$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SELECT_GRUPO_COMPRA_TOTAL` ()   SELECT DISTINCT

	registroventaganado.Grupo_Venta, 

	registroventaganado.Id_Pago_Venta, 

	pago.Pago_Total

FROM

	registroventaganado

	INNER JOIN

	pago

	ON 

		registroventaganado.Id_Pago_Venta = pago.Id_Pago

		WHERE pago.Pago_Total = 0

		GROUP BY Grupo_Venta$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `VERIFICAR_USUARIO` (IN `USUARIOT` VARCHAR(30))   SELECT

	usuario.Id_Usuario, 

	usuario.Nombre, 

	usuario.Apellido, 

	usuario.Documento, 

	usuario.Usuario, 

	usuario.Pass

FROM

	usuario		

	WHERE Usuario = BINARY USUARIOT$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprador`
--

CREATE TABLE `comprador` (
  `Id_Comprador` int(11) NOT NULL,
  `Nombre` varchar(30) DEFAULT NULL,
  `Apellido` varchar(30) DEFAULT NULL,
  `Documento` varchar(10) DEFAULT NULL,
  `RUC` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comprador`
--

INSERT INTO `comprador` (`Id_Comprador`, `Nombre`, `Apellido`, `Documento`, `RUC`) VALUES
(1, 'Nicolas', 'leon nolasco', '20664898', '00000000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fechapago`
--

CREATE TABLE `fechapago` (
  `Id_Fecha_Pago` int(11) NOT NULL,
  `Id_Pago` int(11) DEFAULT NULL,
  `Fecha_Modificacion` date DEFAULT NULL,
  `Pago` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `fechapago`
--

INSERT INTO `fechapago` (`Id_Fecha_Pago`, `Id_Pago`, `Fecha_Modificacion`, `Pago`) VALUES
(1, 31, '2022-12-20', 0),
(2, 32, '2022-12-20', 0),
(3, 31, '2022-12-20', 3000),
(4, 31, '2022-12-20', 240),
(5, 32, '2022-12-20', 3192),
(6, 33, '2022-12-20', 0),
(7, 34, '2022-12-20', 0),
(8, 34, '2022-12-20', 4056);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `listado_biatico`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `listado_biatico` (
`Id_Pago` int(11)
,`proveedor` varchar(10)
,`comprador` varchar(10)
,`Pago_Total` float
,`Pago_Parcial` float
,`Restante` float
,`Biatico_Inicio` float
,`Biatico_Final` float
,`Biatico_Extras` float
,`Biatico_Personal` float
,`Biatico_Empresa` float
,`Fecha` date
,`Estado` enum('PAGADO','DEUDA')
,`Precio_Unidad` float
,`Tipo` enum('COMPRA','VENTA')
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `listado_comprador`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `listado_comprador` (
`Id_Comprador` int(11)
,`Nombre` varchar(30)
,`Apellido` varchar(30)
,`Documento` varchar(10)
,`RUC` varchar(15)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `listado_grupo_ventas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `listado_grupo_ventas` (
`Grupo_Venta` int(11)
,`Fecha` date
,`Id_Pago` int(11)
,`Nombre` varchar(61)
,`Documento` varchar(10)
,`Licencia` varchar(20)
,`cantidad` bigint(21)
,`Ubicacion` text
,`Precio_Unidad` float
,`Pago_Total` double(19,2)
,`Restante` double(19,2)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `listado_proveedor`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `listado_proveedor` (
`Id_Proveedor` int(11)
,`Nombre` varchar(30)
,`Apellido` varchar(30)
,`Documento` varchar(10)
,`Ruc` varchar(20)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `listado_transportista`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `listado_transportista` (
`Id_Transportista` int(11)
,`Placa` varchar(10)
,`Licencia` varchar(20)
,`Documento` varchar(10)
,`RUC` varchar(15)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `Id_Pago` int(11) NOT NULL,
  `Pago_Total` float DEFAULT 0,
  `Pago_Parcial` float DEFAULT 0,
  `Restante` float DEFAULT 0,
  `Biatico_Inicio` float DEFAULT 0,
  `Biatico_Final` float DEFAULT 0,
  `Biatico_Extras` float DEFAULT 0,
  `Biatico_Personal` float DEFAULT 0,
  `Biatico_Empresa` float DEFAULT 0,
  `Fecha` date DEFAULT NULL,
  `Ubicacion` text DEFAULT NULL,
  `Estado` enum('PAGADO','DEUDA') DEFAULT NULL,
  `Precio_Unidad` float DEFAULT 0,
  `Tipo` enum('COMPRA','VENTA') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`Id_Pago`, `Pago_Total`, `Pago_Parcial`, `Restante`, `Biatico_Inicio`, `Biatico_Final`, `Biatico_Extras`, `Biatico_Personal`, `Biatico_Empresa`, `Fecha`, `Ubicacion`, `Estado`, `Precio_Unidad`, `Tipo`) VALUES
(31, 3240, 3240, 0, 0, 0, 200, 0, 0, '2022-12-20', 'cayran', 'PAGADO', 7.2, 'COMPRA'),
(32, 3192, 3192, 0, 0, 550, 0, 0, 0, '2022-12-20', 'LIMA', 'PAGADO', 0, 'COMPRA'),
(33, 5600, 0, 5600, 550, 0, 0, 0, 0, '2022-12-20', 'huanuco', NULL, 0, 'COMPRA'),
(34, 4056, 4056, 0, 0, 200, 0, 0, 0, '2022-12-20', 'lima', 'PAGADO', 7.8, 'COMPRA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `Id_Proveedor` int(11) NOT NULL,
  `Nombre` varchar(30) DEFAULT NULL,
  `Apellido` varchar(30) DEFAULT NULL,
  `Documento` varchar(10) DEFAULT NULL,
  `ruc` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`Id_Proveedor`, `Nombre`, `Apellido`, `Documento`, `ruc`) VALUES
(1, 'Ian James', 'León Esteban', '73949069', '00000000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registrodeganado`
--

CREATE TABLE `registrodeganado` (
  `Id_Registro_Ganado` int(11) NOT NULL,
  `Raza` varchar(20) DEFAULT NULL,
  `Peso` float DEFAULT 0,
  `Color` varchar(20) DEFAULT NULL,
  `Sexo` varchar(1) DEFAULT NULL,
  `Salud` varchar(4) DEFAULT NULL,
  `Marca` varchar(10) DEFAULT NULL,
  `Aretes` varchar(10) DEFAULT NULL,
  `Descripcion` text DEFAULT NULL,
  `Id_Grupo` int(11) DEFAULT NULL,
  `Edad` int(11) DEFAULT NULL,
  `Precio` float DEFAULT 0,
  `Id_Proveedor` int(11) DEFAULT NULL,
  `Id_Transportista` int(11) DEFAULT NULL,
  `Estado` enum('DISPONIBLE','VENDIDO') DEFAULT NULL,
  `Biatico_Ganado` float DEFAULT 0,
  `Id_Pago` int(11) DEFAULT NULL,
  `Tipo` varchar(45) DEFAULT 'Meses'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `registrodeganado`
--

INSERT INTO `registrodeganado` (`Id_Registro_Ganado`, `Raza`, `Peso`, `Color`, `Sexo`, `Salud`, `Marca`, `Aretes`, `Descripcion`, `Id_Grupo`, `Edad`, `Precio`, `Id_Proveedor`, `Id_Transportista`, `Estado`, `Biatico_Ganado`, `Id_Pago`, `Tipo`) VALUES
(1, 'cruzado', 450, 'negro', 'M', 'bien', '', '', '', 2, 2, 3240, 1, 1, 'VENDIDO', 200, 31, 'Años'),
(2, 'cruzado', 550, 'negro', 'M', 'bien', '', '', '', 3, 3, 5600, 1, 1, 'VENDIDO', 550, 33, 'Años');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registroventaganado`
--

CREATE TABLE `registroventaganado` (
  `Id_Venta_Ganado` int(11) NOT NULL,
  `Id_Ganado_Registro` int(11) NOT NULL,
  `Grupo_Venta` int(11) DEFAULT NULL,
  `Id_Comprador` int(11) DEFAULT NULL,
  `Id_Transportista` int(11) DEFAULT NULL,
  `Id_Pago_Venta` int(11) DEFAULT NULL,
  `Biatico_Ganado` float DEFAULT 0,
  `Precio_Final` float DEFAULT 0,
  `Precio_Unitario` float DEFAULT 0,
  `Peso_Actual` float DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `registroventaganado`
--

INSERT INTO `registroventaganado` (`Id_Venta_Ganado`, `Id_Ganado_Registro`, `Grupo_Venta`, `Id_Comprador`, `Id_Transportista`, `Id_Pago_Venta`, `Biatico_Ganado`, `Precio_Final`, `Precio_Unitario`, `Peso_Actual`) VALUES
(1, 1, 2, 1, 2, 32, 550, 3192, 420, 7.6),
(2, 2, 3, 1, 2, 34, 200, 4056, 0, 7.8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transportista`
--

CREATE TABLE `transportista` (
  `Id_Transportista` int(11) NOT NULL,
  `Placa` varchar(10) DEFAULT NULL,
  `Licencia` varchar(20) DEFAULT NULL,
  `Documento` varchar(10) DEFAULT NULL,
  `RUC` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `transportista`
--

INSERT INTO `transportista` (`Id_Transportista`, `Placa`, `Licencia`, `Documento`, `RUC`) VALUES
(1, 'NINGUNO', 'NINGUNO', '00000000', '00000000000'),
(2, 'COZ-884', 'L-2578978569', '00000000', '102035478963');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `Id_Usuario` int(11) NOT NULL,
  `Nombre` varchar(30) DEFAULT NULL,
  `Apellido` varchar(30) DEFAULT NULL,
  `Usuario` varchar(30) DEFAULT NULL,
  `Documento` varchar(10) DEFAULT NULL,
  `Pass` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`Id_Usuario`, `Nombre`, `Apellido`, `Usuario`, `Documento`, `Pass`) VALUES
(1, 'Nicolas', 'Leon Nolasco', 'nicolas1210', '22664898', '$2y$10$DVBg1SJLCSw.DusLNVuKCuNcGQ5Yh1GqpTxHT5yApAsW2HRw0F0vG');

-- --------------------------------------------------------

--
-- Estructura para la vista `listado_biatico`
--
DROP TABLE IF EXISTS `listado_biatico`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `listado_biatico`  AS SELECT `pago`.`Id_Pago` AS `Id_Pago`, `proveedor`.`Documento` AS `proveedor`, `comprador`.`Documento` AS `comprador`, `pago`.`Pago_Total` AS `Pago_Total`, `pago`.`Pago_Parcial` AS `Pago_Parcial`, `pago`.`Restante` AS `Restante`, `pago`.`Biatico_Inicio` AS `Biatico_Inicio`, `pago`.`Biatico_Final` AS `Biatico_Final`, `pago`.`Biatico_Extras` AS `Biatico_Extras`, `pago`.`Biatico_Personal` AS `Biatico_Personal`, `pago`.`Biatico_Empresa` AS `Biatico_Empresa`, `pago`.`Fecha` AS `Fecha`, `pago`.`Estado` AS `Estado`, `pago`.`Precio_Unidad` AS `Precio_Unidad`, `pago`.`Tipo` AS `Tipo` FROM ((((`pago` join `registrodeganado` on(`pago`.`Id_Pago` = `registrodeganado`.`Id_Pago`)) join `proveedor` on(`registrodeganado`.`Id_Proveedor` = `proveedor`.`Id_Proveedor`)) join `registroventaganado` on(`registrodeganado`.`Id_Registro_Ganado` = `registroventaganado`.`Id_Ganado_Registro` or `pago`.`Id_Pago` = `registroventaganado`.`Id_Pago_Venta`)) join `comprador` on(`registroventaganado`.`Id_Comprador` = `comprador`.`Id_Comprador`))  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `listado_comprador`
--
DROP TABLE IF EXISTS `listado_comprador`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `listado_comprador`  AS SELECT `comprador`.`Id_Comprador` AS `Id_Comprador`, `comprador`.`Nombre` AS `Nombre`, `comprador`.`Apellido` AS `Apellido`, `comprador`.`Documento` AS `Documento`, `comprador`.`RUC` AS `RUC` FROM `comprador``comprador`  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `listado_grupo_ventas`
--
DROP TABLE IF EXISTS `listado_grupo_ventas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `listado_grupo_ventas`  AS SELECT `registroventaganado`.`Grupo_Venta` AS `Grupo_Venta`, `pago`.`Fecha` AS `Fecha`, `pago`.`Id_Pago` AS `Id_Pago`, concat_ws(' ',`comprador`.`Nombre`,`comprador`.`Apellido`) AS `Nombre`, `comprador`.`Documento` AS `Documento`, `transportista`.`Licencia` AS `Licencia`, count(`registroventaganado`.`Grupo_Venta`) AS `cantidad`, `pago`.`Ubicacion` AS `Ubicacion`, `pago`.`Precio_Unidad` AS `Precio_Unidad`, truncate(`pago`.`Pago_Total`,2) AS `Pago_Total`, truncate(`pago`.`Restante`,2) AS `Restante` FROM (((`registroventaganado` join `pago` on(`registroventaganado`.`Id_Pago_Venta` = `pago`.`Id_Pago`)) join `comprador` on(`registroventaganado`.`Id_Comprador` = `comprador`.`Id_Comprador`)) join `transportista` on(`registroventaganado`.`Id_Transportista` = `transportista`.`Id_Transportista`)) GROUP BY `registroventaganado`.`Grupo_Venta``Grupo_Venta`  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `listado_proveedor`
--
DROP TABLE IF EXISTS `listado_proveedor`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `listado_proveedor`  AS SELECT `proveedor`.`Id_Proveedor` AS `Id_Proveedor`, `proveedor`.`Nombre` AS `Nombre`, `proveedor`.`Apellido` AS `Apellido`, `proveedor`.`Documento` AS `Documento`, `proveedor`.`ruc` AS `Ruc` FROM `proveedor``proveedor`  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `listado_transportista`
--
DROP TABLE IF EXISTS `listado_transportista`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `listado_transportista`  AS SELECT `transportista`.`Id_Transportista` AS `Id_Transportista`, `transportista`.`Placa` AS `Placa`, `transportista`.`Licencia` AS `Licencia`, `transportista`.`Documento` AS `Documento`, `transportista`.`RUC` AS `RUC` FROM `transportista``transportista`  ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comprador`
--
ALTER TABLE `comprador`
  ADD PRIMARY KEY (`Id_Comprador`);

--
-- Indices de la tabla `fechapago`
--
ALTER TABLE `fechapago`
  ADD PRIMARY KEY (`Id_Fecha_Pago`),
  ADD KEY `Id_Pago` (`Id_Pago`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`Id_Pago`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`Id_Proveedor`);

--
-- Indices de la tabla `registrodeganado`
--
ALTER TABLE `registrodeganado`
  ADD PRIMARY KEY (`Id_Registro_Ganado`),
  ADD KEY `Id_Proveedor` (`Id_Proveedor`),
  ADD KEY `Id_Transportista` (`Id_Transportista`),
  ADD KEY `Id_Pago` (`Id_Pago`);

--
-- Indices de la tabla `registroventaganado`
--
ALTER TABLE `registroventaganado`
  ADD PRIMARY KEY (`Id_Venta_Ganado`),
  ADD KEY `Id_Ganado_Registro` (`Id_Ganado_Registro`),
  ADD KEY `Id_Comprador` (`Id_Comprador`),
  ADD KEY `Id_Transportista` (`Id_Transportista`),
  ADD KEY `Id_Pago_Venta` (`Id_Pago_Venta`);

--
-- Indices de la tabla `transportista`
--
ALTER TABLE `transportista`
  ADD PRIMARY KEY (`Id_Transportista`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Id_Usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comprador`
--
ALTER TABLE `comprador`
  MODIFY `Id_Comprador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `fechapago`
--
ALTER TABLE `fechapago`
  MODIFY `Id_Fecha_Pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `Id_Pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `Id_Proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `registrodeganado`
--
ALTER TABLE `registrodeganado`
  MODIFY `Id_Registro_Ganado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `registroventaganado`
--
ALTER TABLE `registroventaganado`
  MODIFY `Id_Venta_Ganado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `transportista`
--
ALTER TABLE `transportista`
  MODIFY `Id_Transportista` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `Id_Usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `fechapago`
--
ALTER TABLE `fechapago`
  ADD CONSTRAINT `fechapago_ibfk_1` FOREIGN KEY (`Id_Pago`) REFERENCES `pago` (`Id_Pago`);

--
-- Filtros para la tabla `registrodeganado`
--
ALTER TABLE `registrodeganado`
  ADD CONSTRAINT `registrodeganado_ibfk_1` FOREIGN KEY (`Id_Proveedor`) REFERENCES `proveedor` (`Id_Proveedor`),
  ADD CONSTRAINT `registrodeganado_ibfk_2` FOREIGN KEY (`Id_Transportista`) REFERENCES `transportista` (`Id_Transportista`),
  ADD CONSTRAINT `registrodeganado_ibfk_3` FOREIGN KEY (`Id_Pago`) REFERENCES `pago` (`Id_Pago`);

--
-- Filtros para la tabla `registroventaganado`
--
ALTER TABLE `registroventaganado`
  ADD CONSTRAINT `registroventaganado_ibfk_1` FOREIGN KEY (`Id_Ganado_Registro`) REFERENCES `registrodeganado` (`Id_Registro_Ganado`),
  ADD CONSTRAINT `registroventaganado_ibfk_2` FOREIGN KEY (`Id_Comprador`) REFERENCES `comprador` (`Id_Comprador`),
  ADD CONSTRAINT `registroventaganado_ibfk_3` FOREIGN KEY (`Id_Transportista`) REFERENCES `transportista` (`Id_Transportista`),
  ADD CONSTRAINT `registroventaganado_ibfk_4` FOREIGN KEY (`Id_Pago_Venta`) REFERENCES `pago` (`Id_Pago`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
