DROP TABLE IF EXISTS VENDE;
DROP TABLE IF EXISTS GUSTA;
DROP TABLE IF EXISTS BEBIDA;
DROP TABLE IF EXISTS FRECUENTA;
DROP TABLE IF EXISTS FUENTE_SODA;
DROP TABLE IF EXISTS BEBEDOR;


CREATE TABLE FUENTE_SODA (
    CodFS integer primary key,
    NombreFS varchar(50) NOT NULL);

CREATE TABLE BEBEDOR (
    CI integer primary key,
    Nombre varchar(50) NOT NULL);

CREATE TABLE FRECUENTA (
    CI integer references BEBEDOR(CI),
    CodFS integer references FUENTE_SODA(CodFS));

CREATE TABLE BEBIDA (
    CodBeb integer primary key,
    NombreBeb varchar(50) NOT NULL);

CREATE TABLE GUSTA (
    CI integer references BEBEDOR(CI),
    CodBeb integer references BEBIDA(CodBeb));

CREATE TABLE VENDE (
    CodFS integer references FUENTE_SODA(CodFS),
    CodBeb integer references BEBIDA(CodBeb),
    Precio integer NOT NULL);



