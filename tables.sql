CREATE TABLE public.productos
(
    productoid serial,
    codigo character varying(10)  NOT NULL,
    nombre character varying(100) NOT NULL,
    preciounidad numeric(10,2) NOT NULL,
    CONSTRAINT producto_pk PRIMARY KEY (productoid)
)

CREATE TABLE public.compras
(
    compraid serial,
    productoid character varying(10)  NOT NULL,
    proveedor character varying(100) NOT NULL,
    cantidad numeric(50,2) NOT NULL,
    fecharegistro date,
    preciounitario numeric(50,0),
	preciototal numeric(50,0),
    CONSTRAINT compraid_pk PRIMARY KEY (compraid)
)

CREATE TABLE public.ventas
(
    ventaid serial,
    productoid character varying(10)  NOT NULL,
    cliente character varying(100) NOT NULL,
    cantidad numeric(50,2) NOT NULL,
    fecharegistro date,
    preciounitario numeric(50,0),
	preciototal numeric(50,0),
    CONSTRAINT ventaid_pk PRIMARY KEY (ventaid)
)

CREATE TABLE public.stock
(
	stockid serial,
    productoid numeric(50,2)  NOT NULL,
    compras numeric(50,2) ,
    ventas numeric(50,2),
    disponible numeric(50,0),
    CONSTRAINT stockid_pk PRIMARY KEY (stockid)
)