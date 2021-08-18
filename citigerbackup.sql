PGDMP     !                    y            citigerproject    13.3 (Debian 13.3-1)    13.3 (Debian 13.3-1) 1   u           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            v           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            w           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            x           1262    16385    citigerproject    DATABASE     c   CREATE DATABASE citigerproject WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'es_SV.UTF-8';
    DROP DATABASE citigerproject;
                postgres    false                       1255    16386    sp_historialinventario()    FUNCTION     �   CREATE FUNCTION public.sp_historialinventario() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO historialInventario(idMaterial, cantidad, fecha) VALUES(old.idMaterial, old.cantidad, current_date);
RETURN NEW;
END
$$;
 /   DROP FUNCTION public.sp_historialinventario();
       public          postgres    false            �            1259    16387    alquiler    TABLE     ^  CREATE TABLE public.alquiler (
    idalquiler integer NOT NULL,
    idestadoalquiler integer NOT NULL,
    idespacio integer NOT NULL,
    precio numeric NOT NULL,
    idusuario integer NOT NULL,
    idresidente integer NOT NULL,
    fecha date NOT NULL,
    horainicio time without time zone NOT NULL,
    horafin time without time zone NOT NULL
);
    DROP TABLE public.alquiler;
       public         heap    postgres    false            �            1259    16393    alquiler_idalquiler_seq    SEQUENCE     �   CREATE SEQUENCE public.alquiler_idalquiler_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.alquiler_idalquiler_seq;
       public          postgres    false    200            y           0    0    alquiler_idalquiler_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.alquiler_idalquiler_seq OWNED BY public.alquiler.idalquiler;
          public          postgres    false    201            �            1259    16395 
   aportacion    TABLE       CREATE TABLE public.aportacion (
    idaportacion integer NOT NULL,
    idcasa integer NOT NULL,
    idestadoaportacion integer NOT NULL,
    monto numeric NOT NULL,
    idmespago integer NOT NULL,
    fechapago date NOT NULL,
    descripcion character varying(200) NOT NULL
);
    DROP TABLE public.aportacion;
       public         heap    postgres    false            �            1259    16401    aportacion_idaportacion_seq    SEQUENCE     �   CREATE SEQUENCE public.aportacion_idaportacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.aportacion_idaportacion_seq;
       public          postgres    false    202            z           0    0    aportacion_idaportacion_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.aportacion_idaportacion_seq OWNED BY public.aportacion.idaportacion;
          public          postgres    false    203            �            1259    16403    bitacora    TABLE       CREATE TABLE public.bitacora (
    idbitacora integer NOT NULL,
    idusuario integer NOT NULL,
    hora time without time zone NOT NULL,
    fecha date NOT NULL,
    accion character varying(20) NOT NULL,
    descripcion character varying(200) NOT NULL
);
    DROP TABLE public.bitacora;
       public         heap    postgres    false            �            1259    16406    bitacora_idbitacora_seq    SEQUENCE     �   CREATE SEQUENCE public.bitacora_idbitacora_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.bitacora_idbitacora_seq;
       public          postgres    false    204            {           0    0    bitacora_idbitacora_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.bitacora_idbitacora_seq OWNED BY public.bitacora.idbitacora;
          public          postgres    false    205            �            1259    16408    casa    TABLE     �   CREATE TABLE public.casa (
    idcasa integer NOT NULL,
    idestadocasa integer NOT NULL,
    numerocasa numeric NOT NULL,
    direccion character varying(200) NOT NULL
);
    DROP TABLE public.casa;
       public         heap    postgres    false            �            1259    16414    casa_idcasa_seq    SEQUENCE     �   CREATE SEQUENCE public.casa_idcasa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.casa_idcasa_seq;
       public          postgres    false    206            |           0    0    casa_idcasa_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.casa_idcasa_seq OWNED BY public.casa.idcasa;
          public          postgres    false    207            �            1259    16416 	   categoria    TABLE     r   CREATE TABLE public.categoria (
    idcategoria integer NOT NULL,
    categoria character varying(40) NOT NULL
);
    DROP TABLE public.categoria;
       public         heap    postgres    false            �            1259    16419    categoria_idcategoria_seq    SEQUENCE     �   CREATE SEQUENCE public.categoria_idcategoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.categoria_idcategoria_seq;
       public          postgres    false    208            }           0    0    categoria_idcategoria_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.categoria_idcategoria_seq OWNED BY public.categoria.idcategoria;
          public          postgres    false    209            �            1259    16421    denuncia    TABLE     8  CREATE TABLE public.denuncia (
    iddenuncia integer NOT NULL,
    idempleado integer,
    idresidente integer NOT NULL,
    idtipodenuncia integer NOT NULL,
    idestadodenuncia integer NOT NULL,
    fecha date NOT NULL,
    descripcion character varying(200) NOT NULL,
    respuesta character varying(200)
);
    DROP TABLE public.denuncia;
       public         heap    postgres    false            �            1259    16424    denuncia_iddenuncia_seq    SEQUENCE     �   CREATE SEQUENCE public.denuncia_iddenuncia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.denuncia_iddenuncia_seq;
       public          postgres    false    210            ~           0    0    denuncia_iddenuncia_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.denuncia_iddenuncia_seq OWNED BY public.denuncia.iddenuncia;
          public          postgres    false    211            �            1259    16426    detallematerial    TABLE     �   CREATE TABLE public.detallematerial (
    iddetallematerial integer NOT NULL,
    idpedido integer NOT NULL,
    idmaterial integer NOT NULL,
    preciomaterial numeric NOT NULL,
    cantidadmaterial numeric NOT NULL
);
 #   DROP TABLE public.detallematerial;
       public         heap    postgres    false            �            1259    16432 %   detallematerial_iddetallematerial_seq    SEQUENCE     �   CREATE SEQUENCE public.detallematerial_iddetallematerial_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.detallematerial_iddetallematerial_seq;
       public          postgres    false    212                       0    0 %   detallematerial_iddetallematerial_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.detallematerial_iddetallematerial_seq OWNED BY public.detallematerial.iddetallematerial;
          public          postgres    false    213            �            1259    16434    detallevisita    TABLE     �   CREATE TABLE public.detallevisita (
    iddetallevisita integer NOT NULL,
    idvisita integer NOT NULL,
    idvisitante integer NOT NULL
);
 !   DROP TABLE public.detallevisita;
       public         heap    postgres    false            �            1259    16437 !   detallevisita_iddetallevisita_seq    SEQUENCE     �   CREATE SEQUENCE public.detallevisita_iddetallevisita_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.detallevisita_iddetallevisita_seq;
       public          postgres    false    214            �           0    0 !   detallevisita_iddetallevisita_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.detallevisita_iddetallevisita_seq OWNED BY public.detallevisita.iddetallevisita;
          public          postgres    false    215            �            1259    16439    empleado    TABLE     �  CREATE TABLE public.empleado (
    idempleado integer NOT NULL,
    idestadoempleado integer NOT NULL,
    idtipoempleado integer NOT NULL,
    nombre character varying(30) NOT NULL,
    apellido character varying(30) NOT NULL,
    telefono character(9) NOT NULL,
    dui character(10) NOT NULL,
    genero character(1) NOT NULL,
    foto character varying(50),
    direccion character varying(200) NOT NULL,
    correo character varying(50) NOT NULL,
    fechanacimiento date NOT NULL
);
    DROP TABLE public.empleado;
       public         heap    postgres    false            �            1259    16442    empleado_idempleado_seq    SEQUENCE     �   CREATE SEQUENCE public.empleado_idempleado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.empleado_idempleado_seq;
       public          postgres    false    216            �           0    0    empleado_idempleado_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.empleado_idempleado_seq OWNED BY public.empleado.idempleado;
          public          postgres    false    217            �            1259    16444    espacio    TABLE       CREATE TABLE public.espacio (
    idespacio integer NOT NULL,
    idestadoespacio integer NOT NULL,
    nombre character varying(30) NOT NULL,
    descripcion character varying(200) NOT NULL,
    capacidad numeric NOT NULL,
    imagenprincipal character varying(50)
);
    DROP TABLE public.espacio;
       public         heap    postgres    false            �            1259    16450    espacio_idespacio_seq    SEQUENCE     �   CREATE SEQUENCE public.espacio_idespacio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.espacio_idespacio_seq;
       public          postgres    false    218            �           0    0    espacio_idespacio_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.espacio_idespacio_seq OWNED BY public.espacio.idespacio;
          public          postgres    false    219            �            1259    16452    estadoalquiler    TABLE     �   CREATE TABLE public.estadoalquiler (
    idestadoalquiler integer NOT NULL,
    estadoalquiler character varying(15) NOT NULL
);
 "   DROP TABLE public.estadoalquiler;
       public         heap    postgres    false            �            1259    16455 #   estadoalquiler_idestadoalquiler_seq    SEQUENCE     �   CREATE SEQUENCE public.estadoalquiler_idestadoalquiler_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.estadoalquiler_idestadoalquiler_seq;
       public          postgres    false    220            �           0    0 #   estadoalquiler_idestadoalquiler_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.estadoalquiler_idestadoalquiler_seq OWNED BY public.estadoalquiler.idestadoalquiler;
          public          postgres    false    221            �            1259    16457    estadoaportacion    TABLE     �   CREATE TABLE public.estadoaportacion (
    idestadoaportacion integer NOT NULL,
    estadoaportacion character varying(15) NOT NULL
);
 $   DROP TABLE public.estadoaportacion;
       public         heap    postgres    false            �            1259    16460 '   estadoaportacion_idestadoaportacion_seq    SEQUENCE     �   CREATE SEQUENCE public.estadoaportacion_idestadoaportacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.estadoaportacion_idestadoaportacion_seq;
       public          postgres    false    222            �           0    0 '   estadoaportacion_idestadoaportacion_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public.estadoaportacion_idestadoaportacion_seq OWNED BY public.estadoaportacion.idestadoaportacion;
          public          postgres    false    223            �            1259    16462 
   estadocasa    TABLE     u   CREATE TABLE public.estadocasa (
    idestadocasa integer NOT NULL,
    estadocasa character varying(15) NOT NULL
);
    DROP TABLE public.estadocasa;
       public         heap    postgres    false            �            1259    16465    estadocasa_idestadocasa_seq    SEQUENCE     �   CREATE SEQUENCE public.estadocasa_idestadocasa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.estadocasa_idestadocasa_seq;
       public          postgres    false    224            �           0    0    estadocasa_idestadocasa_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.estadocasa_idestadocasa_seq OWNED BY public.estadocasa.idestadocasa;
          public          postgres    false    225            �            1259    16467    estadodenuncia    TABLE     �   CREATE TABLE public.estadodenuncia (
    idestadodenuncia integer NOT NULL,
    estadodenuncia character varying(15) NOT NULL
);
 "   DROP TABLE public.estadodenuncia;
       public         heap    postgres    false            �            1259    16470 #   estadodenuncia_idestadodenuncia_seq    SEQUENCE     �   CREATE SEQUENCE public.estadodenuncia_idestadodenuncia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.estadodenuncia_idestadodenuncia_seq;
       public          postgres    false    226            �           0    0 #   estadodenuncia_idestadodenuncia_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.estadodenuncia_idestadodenuncia_seq OWNED BY public.estadodenuncia.idestadodenuncia;
          public          postgres    false    227            �            1259    16472    estadoempleado    TABLE     �   CREATE TABLE public.estadoempleado (
    idestadoempleado integer NOT NULL,
    estadoempleado character varying(20) NOT NULL
);
 "   DROP TABLE public.estadoempleado;
       public         heap    postgres    false            �            1259    16475 #   estadoempleado_idestadoempleado_seq    SEQUENCE     �   CREATE SEQUENCE public.estadoempleado_idestadoempleado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.estadoempleado_idestadoempleado_seq;
       public          postgres    false    228            �           0    0 #   estadoempleado_idestadoempleado_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.estadoempleado_idestadoempleado_seq OWNED BY public.estadoempleado.idestadoempleado;
          public          postgres    false    229            �            1259    16477    estadoespacio    TABLE     ~   CREATE TABLE public.estadoespacio (
    idestadoespacio integer NOT NULL,
    estadoespacio character varying(15) NOT NULL
);
 !   DROP TABLE public.estadoespacio;
       public         heap    postgres    false            �            1259    16480 !   estadoespacio_idestadoespacio_seq    SEQUENCE     �   CREATE SEQUENCE public.estadoespacio_idestadoespacio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.estadoespacio_idestadoespacio_seq;
       public          postgres    false    230            �           0    0 !   estadoespacio_idestadoespacio_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.estadoespacio_idestadoespacio_seq OWNED BY public.estadoespacio.idestadoespacio;
          public          postgres    false    231            �            1259    16482    estadopedido    TABLE     {   CREATE TABLE public.estadopedido (
    idestadopedido integer NOT NULL,
    estadopedido character varying(15) NOT NULL
);
     DROP TABLE public.estadopedido;
       public         heap    postgres    false            �            1259    16485    estadopedido_idestadopedido_seq    SEQUENCE     �   CREATE SEQUENCE public.estadopedido_idestadopedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.estadopedido_idestadopedido_seq;
       public          postgres    false    232            �           0    0    estadopedido_idestadopedido_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.estadopedido_idestadopedido_seq OWNED BY public.estadopedido.idestadopedido;
          public          postgres    false    233            �            1259    16487    estadoresidente    TABLE     �   CREATE TABLE public.estadoresidente (
    idestadoresidente integer NOT NULL,
    estadoresidente character varying(15) NOT NULL
);
 #   DROP TABLE public.estadoresidente;
       public         heap    postgres    false            �            1259    16490 %   estadoresidente_idestadoresidente_seq    SEQUENCE     �   CREATE SEQUENCE public.estadoresidente_idestadoresidente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.estadoresidente_idestadoresidente_seq;
       public          postgres    false    234            �           0    0 %   estadoresidente_idestadoresidente_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.estadoresidente_idestadoresidente_seq OWNED BY public.estadoresidente.idestadoresidente;
          public          postgres    false    235            �            1259    16492    estadousuario    TABLE     ~   CREATE TABLE public.estadousuario (
    idestadousuario integer NOT NULL,
    estadousuario character varying(20) NOT NULL
);
 !   DROP TABLE public.estadousuario;
       public         heap    postgres    false            �            1259    16495 !   estadousuario_idestadousuario_seq    SEQUENCE     �   CREATE SEQUENCE public.estadousuario_idestadousuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.estadousuario_idestadousuario_seq;
       public          postgres    false    236            �           0    0 !   estadousuario_idestadousuario_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.estadousuario_idestadousuario_seq OWNED BY public.estadousuario.idestadousuario;
          public          postgres    false    237            �            1259    16497    estadovisita    TABLE     {   CREATE TABLE public.estadovisita (
    idestadovisita integer NOT NULL,
    estadovisita character varying(15) NOT NULL
);
     DROP TABLE public.estadovisita;
       public         heap    postgres    false            �            1259    16500    estadovisita_idestadovisita_seq    SEQUENCE     �   CREATE SEQUENCE public.estadovisita_idestadovisita_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.estadovisita_idestadovisita_seq;
       public          postgres    false    238            �           0    0    estadovisita_idestadovisita_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.estadovisita_idestadovisita_seq OWNED BY public.estadovisita.idestadovisita;
          public          postgres    false    239            �            1259    16502    historialinventario    TABLE     �   CREATE TABLE public.historialinventario (
    idhistorialinventario integer NOT NULL,
    idmaterial integer NOT NULL,
    cantidad numeric NOT NULL,
    fecha date NOT NULL
);
 '   DROP TABLE public.historialinventario;
       public         heap    postgres    false            �            1259    16508 -   historialinventario_idhistorialinventario_seq    SEQUENCE     �   CREATE SEQUENCE public.historialinventario_idhistorialinventario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 D   DROP SEQUENCE public.historialinventario_idhistorialinventario_seq;
       public          postgres    false    240            �           0    0 -   historialinventario_idhistorialinventario_seq    SEQUENCE OWNED BY        ALTER SEQUENCE public.historialinventario_idhistorialinventario_seq OWNED BY public.historialinventario.idhistorialinventario;
          public          postgres    false    241            �            1259    16510    imagenesespacio    TABLE     �   CREATE TABLE public.imagenesespacio (
    idimagenesespacio integer NOT NULL,
    imagen character varying(50),
    idespacio integer
);
 #   DROP TABLE public.imagenesespacio;
       public         heap    postgres    false            �            1259    16513 %   imagenesespacio_idimagenesespacio_seq    SEQUENCE     �   CREATE SEQUENCE public.imagenesespacio_idimagenesespacio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.imagenesespacio_idimagenesespacio_seq;
       public          postgres    false    242            �           0    0 %   imagenesespacio_idimagenesespacio_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.imagenesespacio_idimagenesespacio_seq OWNED BY public.imagenesespacio.idimagenesespacio;
          public          postgres    false    243            �            1259    16515    marca    TABLE     f   CREATE TABLE public.marca (
    idmarca integer NOT NULL,
    marca character varying(15) NOT NULL
);
    DROP TABLE public.marca;
       public         heap    postgres    false            �            1259    16518    marca_idmarca_seq    SEQUENCE     �   CREATE SEQUENCE public.marca_idmarca_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.marca_idmarca_seq;
       public          postgres    false    244            �           0    0    marca_idmarca_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.marca_idmarca_seq OWNED BY public.marca.idmarca;
          public          postgres    false    245            �            1259    16520    material    TABLE     �  CREATE TABLE public.material (
    idmaterial integer NOT NULL,
    nombreproducto character varying(40) NOT NULL,
    costo numeric NOT NULL,
    imagen character varying(50),
    idcategoria integer NOT NULL,
    "tamaño" character varying(10) NOT NULL,
    descripcion character varying(200) NOT NULL,
    cantidad numeric NOT NULL,
    idmarca integer NOT NULL,
    idunidadmedida integer NOT NULL
);
    DROP TABLE public.material;
       public         heap    postgres    false            �            1259    16526    material_idmaterial_seq    SEQUENCE     �   CREATE SEQUENCE public.material_idmaterial_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.material_idmaterial_seq;
       public          postgres    false    246            �           0    0    material_idmaterial_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.material_idmaterial_seq OWNED BY public.material.idmaterial;
          public          postgres    false    247            �            1259    16528    mespago    TABLE     �   CREATE TABLE public.mespago (
    idmespago integer NOT NULL,
    mes character varying(10) NOT NULL,
    ano numeric NOT NULL
);
    DROP TABLE public.mespago;
       public         heap    postgres    false            �            1259    16534    mespago_idmespago_seq    SEQUENCE     �   CREATE SEQUENCE public.mespago_idmespago_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.mespago_idmespago_seq;
       public          postgres    false    248            �           0    0    mespago_idmespago_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.mespago_idmespago_seq OWNED BY public.mespago.idmespago;
          public          postgres    false    249            �            1259    16536    pedido    TABLE     �   CREATE TABLE public.pedido (
    idpedido integer NOT NULL,
    idestadopedido integer NOT NULL,
    idusuario integer NOT NULL,
    idempleado integer,
    fechapedido date NOT NULL
);
    DROP TABLE public.pedido;
       public         heap    postgres    false            �            1259    16539    pedido_idpedido_seq    SEQUENCE     �   CREATE SEQUENCE public.pedido_idpedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.pedido_idpedido_seq;
       public          postgres    false    250            �           0    0    pedido_idpedido_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.pedido_idpedido_seq OWNED BY public.pedido.idpedido;
          public          postgres    false    251            �            1259    16541 	   residente    TABLE     9  CREATE TABLE public.residente (
    idresidente integer NOT NULL,
    idestadoresidente integer,
    nombre character varying(30) NOT NULL,
    apellido character varying(30) NOT NULL,
    telefonofijo character(9) NOT NULL,
    telefonocelular character(9) NOT NULL,
    foto character varying(50),
    correo character varying(50) NOT NULL,
    fechanacimiento date NOT NULL,
    genero character(1) NOT NULL,
    dui character(10) NOT NULL,
    username character varying(25) NOT NULL,
    contrasena character varying(60) NOT NULL,
    modo character varying(6)
);
    DROP TABLE public.residente;
       public         heap    postgres    false            �            1259    16544    residente_idresidente_seq    SEQUENCE     �   CREATE SEQUENCE public.residente_idresidente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.residente_idresidente_seq;
       public          postgres    false    252            �           0    0    residente_idresidente_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.residente_idresidente_seq OWNED BY public.residente.idresidente;
          public          postgres    false    253            �            1259    16546    residentecasa    TABLE     �   CREATE TABLE public.residentecasa (
    idresidentecasa integer NOT NULL,
    idresidente integer NOT NULL,
    idcasa integer NOT NULL
);
 !   DROP TABLE public.residentecasa;
       public         heap    postgres    false            �            1259    16549 !   residentecasa_idresidentecasa_seq    SEQUENCE     �   CREATE SEQUENCE public.residentecasa_idresidentecasa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.residentecasa_idresidentecasa_seq;
       public          postgres    false    254            �           0    0 !   residentecasa_idresidentecasa_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.residentecasa_idresidentecasa_seq OWNED BY public.residentecasa.idresidentecasa;
          public          postgres    false    255                        1259    16551    tipodenuncia    TABLE     {   CREATE TABLE public.tipodenuncia (
    idtipodenuncia integer NOT NULL,
    tipodenuncia character varying(15) NOT NULL
);
     DROP TABLE public.tipodenuncia;
       public         heap    postgres    false                       1259    16554    tipodenuncia_idtipodenuncia_seq    SEQUENCE     �   CREATE SEQUENCE public.tipodenuncia_idtipodenuncia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.tipodenuncia_idtipodenuncia_seq;
       public          postgres    false    256            �           0    0    tipodenuncia_idtipodenuncia_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.tipodenuncia_idtipodenuncia_seq OWNED BY public.tipodenuncia.idtipodenuncia;
          public          postgres    false    257                       1259    16556    tipoempleado    TABLE     {   CREATE TABLE public.tipoempleado (
    idtipoempleado integer NOT NULL,
    tipoempleado character varying(15) NOT NULL
);
     DROP TABLE public.tipoempleado;
       public         heap    postgres    false                       1259    16559    tipoempleado_idtipoempleado_seq    SEQUENCE     �   CREATE SEQUENCE public.tipoempleado_idtipoempleado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.tipoempleado_idtipoempleado_seq;
       public          postgres    false    258            �           0    0    tipoempleado_idtipoempleado_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.tipoempleado_idtipoempleado_seq OWNED BY public.tipoempleado.idtipoempleado;
          public          postgres    false    259                       1259    16561 
   tipounidad    TABLE     u   CREATE TABLE public.tipounidad (
    idtipounidad integer NOT NULL,
    tipounidad character varying(20) NOT NULL
);
    DROP TABLE public.tipounidad;
       public         heap    postgres    false                       1259    16564    tipounidad_idtipounidad_seq    SEQUENCE     �   CREATE SEQUENCE public.tipounidad_idtipounidad_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.tipounidad_idtipounidad_seq;
       public          postgres    false    260            �           0    0    tipounidad_idtipounidad_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.tipounidad_idtipounidad_seq OWNED BY public.tipounidad.idtipounidad;
          public          postgres    false    261                       1259    16566    tipousuario    TABLE     x   CREATE TABLE public.tipousuario (
    idtipousuario integer NOT NULL,
    tipousuario character varying(15) NOT NULL
);
    DROP TABLE public.tipousuario;
       public         heap    postgres    false                       1259    16569    tipousuario_idtipousuario_seq    SEQUENCE     �   CREATE SEQUENCE public.tipousuario_idtipousuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.tipousuario_idtipousuario_seq;
       public          postgres    false    262            �           0    0    tipousuario_idtipousuario_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.tipousuario_idtipousuario_seq OWNED BY public.tipousuario.idtipousuario;
          public          postgres    false    263                       1259    16571    unidadmedida    TABLE     �   CREATE TABLE public.unidadmedida (
    idunidadmedida integer NOT NULL,
    idtipounidad integer NOT NULL,
    unidadmedida character varying(15) NOT NULL
);
     DROP TABLE public.unidadmedida;
       public         heap    postgres    false            	           1259    16574    unidadmedida_idunidadmedida_seq    SEQUENCE     �   CREATE SEQUENCE public.unidadmedida_idunidadmedida_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.unidadmedida_idunidadmedida_seq;
       public          postgres    false    264            �           0    0    unidadmedida_idunidadmedida_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.unidadmedida_idunidadmedida_seq OWNED BY public.unidadmedida.idunidadmedida;
          public          postgres    false    265            
           1259    16576    usuario    TABLE     �  CREATE TABLE public.usuario (
    idusuario integer NOT NULL,
    idestadousuario integer NOT NULL,
    idtipousuario integer NOT NULL,
    nombre character varying(30) NOT NULL,
    apellido character varying(30) NOT NULL,
    telefonofijo character(9) NOT NULL,
    telefonocelular character(9) NOT NULL,
    foto character varying(50),
    correo character varying(50) NOT NULL,
    fechanacimiento date NOT NULL,
    genero character(1) NOT NULL,
    dui character(10) NOT NULL,
    username character varying(25) NOT NULL,
    contrasena character varying(60) NOT NULL,
    direccion character varying(200) NOT NULL,
    modo character varying(6)
);
    DROP TABLE public.usuario;
       public         heap    postgres    false                       1259    16579    usuario_idusuario_seq    SEQUENCE     �   CREATE SEQUENCE public.usuario_idusuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.usuario_idusuario_seq;
       public          postgres    false    266            �           0    0    usuario_idusuario_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.usuario_idusuario_seq OWNED BY public.usuario.idusuario;
          public          postgres    false    267                       1259    16581    visita    TABLE     �   CREATE TABLE public.visita (
    idvisita integer NOT NULL,
    idresidente integer NOT NULL,
    fecha date NOT NULL,
    visitarecurrente character(2) NOT NULL,
    observacion character varying(200) NOT NULL,
    idestadovisita integer NOT NULL
);
    DROP TABLE public.visita;
       public         heap    postgres    false                       1259    16584    visita_idvisita_seq    SEQUENCE     �   CREATE SEQUENCE public.visita_idvisita_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.visita_idvisita_seq;
       public          postgres    false    268            �           0    0    visita_idvisita_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.visita_idvisita_seq OWNED BY public.visita.idvisita;
          public          postgres    false    269                       1259    16586 	   visitante    TABLE       CREATE TABLE public.visitante (
    idvisitante integer NOT NULL,
    nombre character varying(30) NOT NULL,
    apellido character varying(30) NOT NULL,
    dui character(10) NOT NULL,
    genero character(1) NOT NULL,
    placa character varying(10) NOT NULL
);
    DROP TABLE public.visitante;
       public         heap    postgres    false                       1259    16589    visitante_idvisitante_seq    SEQUENCE     �   CREATE SEQUENCE public.visitante_idvisitante_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.visitante_idvisitante_seq;
       public          postgres    false    270            �           0    0    visitante_idvisitante_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.visitante_idvisitante_seq OWNED BY public.visitante.idvisitante;
          public          postgres    false    271                       2604    16591    alquiler idalquiler    DEFAULT     z   ALTER TABLE ONLY public.alquiler ALTER COLUMN idalquiler SET DEFAULT nextval('public.alquiler_idalquiler_seq'::regclass);
 B   ALTER TABLE public.alquiler ALTER COLUMN idalquiler DROP DEFAULT;
       public          postgres    false    201    200                       2604    16592    aportacion idaportacion    DEFAULT     �   ALTER TABLE ONLY public.aportacion ALTER COLUMN idaportacion SET DEFAULT nextval('public.aportacion_idaportacion_seq'::regclass);
 F   ALTER TABLE public.aportacion ALTER COLUMN idaportacion DROP DEFAULT;
       public          postgres    false    203    202                       2604    16593    bitacora idbitacora    DEFAULT     z   ALTER TABLE ONLY public.bitacora ALTER COLUMN idbitacora SET DEFAULT nextval('public.bitacora_idbitacora_seq'::regclass);
 B   ALTER TABLE public.bitacora ALTER COLUMN idbitacora DROP DEFAULT;
       public          postgres    false    205    204                       2604    16594    casa idcasa    DEFAULT     j   ALTER TABLE ONLY public.casa ALTER COLUMN idcasa SET DEFAULT nextval('public.casa_idcasa_seq'::regclass);
 :   ALTER TABLE public.casa ALTER COLUMN idcasa DROP DEFAULT;
       public          postgres    false    207    206                       2604    16595    categoria idcategoria    DEFAULT     ~   ALTER TABLE ONLY public.categoria ALTER COLUMN idcategoria SET DEFAULT nextval('public.categoria_idcategoria_seq'::regclass);
 D   ALTER TABLE public.categoria ALTER COLUMN idcategoria DROP DEFAULT;
       public          postgres    false    209    208                       2604    16596    denuncia iddenuncia    DEFAULT     z   ALTER TABLE ONLY public.denuncia ALTER COLUMN iddenuncia SET DEFAULT nextval('public.denuncia_iddenuncia_seq'::regclass);
 B   ALTER TABLE public.denuncia ALTER COLUMN iddenuncia DROP DEFAULT;
       public          postgres    false    211    210                       2604    16597 !   detallematerial iddetallematerial    DEFAULT     �   ALTER TABLE ONLY public.detallematerial ALTER COLUMN iddetallematerial SET DEFAULT nextval('public.detallematerial_iddetallematerial_seq'::regclass);
 P   ALTER TABLE public.detallematerial ALTER COLUMN iddetallematerial DROP DEFAULT;
       public          postgres    false    213    212            	           2604    16598    detallevisita iddetallevisita    DEFAULT     �   ALTER TABLE ONLY public.detallevisita ALTER COLUMN iddetallevisita SET DEFAULT nextval('public.detallevisita_iddetallevisita_seq'::regclass);
 L   ALTER TABLE public.detallevisita ALTER COLUMN iddetallevisita DROP DEFAULT;
       public          postgres    false    215    214            
           2604    16599    empleado idempleado    DEFAULT     z   ALTER TABLE ONLY public.empleado ALTER COLUMN idempleado SET DEFAULT nextval('public.empleado_idempleado_seq'::regclass);
 B   ALTER TABLE public.empleado ALTER COLUMN idempleado DROP DEFAULT;
       public          postgres    false    217    216                       2604    16600    espacio idespacio    DEFAULT     v   ALTER TABLE ONLY public.espacio ALTER COLUMN idespacio SET DEFAULT nextval('public.espacio_idespacio_seq'::regclass);
 @   ALTER TABLE public.espacio ALTER COLUMN idespacio DROP DEFAULT;
       public          postgres    false    219    218                       2604    16601    estadoalquiler idestadoalquiler    DEFAULT     �   ALTER TABLE ONLY public.estadoalquiler ALTER COLUMN idestadoalquiler SET DEFAULT nextval('public.estadoalquiler_idestadoalquiler_seq'::regclass);
 N   ALTER TABLE public.estadoalquiler ALTER COLUMN idestadoalquiler DROP DEFAULT;
       public          postgres    false    221    220                       2604    16602 #   estadoaportacion idestadoaportacion    DEFAULT     �   ALTER TABLE ONLY public.estadoaportacion ALTER COLUMN idestadoaportacion SET DEFAULT nextval('public.estadoaportacion_idestadoaportacion_seq'::regclass);
 R   ALTER TABLE public.estadoaportacion ALTER COLUMN idestadoaportacion DROP DEFAULT;
       public          postgres    false    223    222                       2604    16603    estadocasa idestadocasa    DEFAULT     �   ALTER TABLE ONLY public.estadocasa ALTER COLUMN idestadocasa SET DEFAULT nextval('public.estadocasa_idestadocasa_seq'::regclass);
 F   ALTER TABLE public.estadocasa ALTER COLUMN idestadocasa DROP DEFAULT;
       public          postgres    false    225    224                       2604    16604    estadodenuncia idestadodenuncia    DEFAULT     �   ALTER TABLE ONLY public.estadodenuncia ALTER COLUMN idestadodenuncia SET DEFAULT nextval('public.estadodenuncia_idestadodenuncia_seq'::regclass);
 N   ALTER TABLE public.estadodenuncia ALTER COLUMN idestadodenuncia DROP DEFAULT;
       public          postgres    false    227    226                       2604    16605    estadoempleado idestadoempleado    DEFAULT     �   ALTER TABLE ONLY public.estadoempleado ALTER COLUMN idestadoempleado SET DEFAULT nextval('public.estadoempleado_idestadoempleado_seq'::regclass);
 N   ALTER TABLE public.estadoempleado ALTER COLUMN idestadoempleado DROP DEFAULT;
       public          postgres    false    229    228                       2604    16606    estadoespacio idestadoespacio    DEFAULT     �   ALTER TABLE ONLY public.estadoespacio ALTER COLUMN idestadoespacio SET DEFAULT nextval('public.estadoespacio_idestadoespacio_seq'::regclass);
 L   ALTER TABLE public.estadoespacio ALTER COLUMN idestadoespacio DROP DEFAULT;
       public          postgres    false    231    230                       2604    16607    estadopedido idestadopedido    DEFAULT     �   ALTER TABLE ONLY public.estadopedido ALTER COLUMN idestadopedido SET DEFAULT nextval('public.estadopedido_idestadopedido_seq'::regclass);
 J   ALTER TABLE public.estadopedido ALTER COLUMN idestadopedido DROP DEFAULT;
       public          postgres    false    233    232                       2604    16608 !   estadoresidente idestadoresidente    DEFAULT     �   ALTER TABLE ONLY public.estadoresidente ALTER COLUMN idestadoresidente SET DEFAULT nextval('public.estadoresidente_idestadoresidente_seq'::regclass);
 P   ALTER TABLE public.estadoresidente ALTER COLUMN idestadoresidente DROP DEFAULT;
       public          postgres    false    235    234                       2604    16609    estadousuario idestadousuario    DEFAULT     �   ALTER TABLE ONLY public.estadousuario ALTER COLUMN idestadousuario SET DEFAULT nextval('public.estadousuario_idestadousuario_seq'::regclass);
 L   ALTER TABLE public.estadousuario ALTER COLUMN idestadousuario DROP DEFAULT;
       public          postgres    false    237    236                       2604    16610    estadovisita idestadovisita    DEFAULT     �   ALTER TABLE ONLY public.estadovisita ALTER COLUMN idestadovisita SET DEFAULT nextval('public.estadovisita_idestadovisita_seq'::regclass);
 J   ALTER TABLE public.estadovisita ALTER COLUMN idestadovisita DROP DEFAULT;
       public          postgres    false    239    238                       2604    16611 )   historialinventario idhistorialinventario    DEFAULT     �   ALTER TABLE ONLY public.historialinventario ALTER COLUMN idhistorialinventario SET DEFAULT nextval('public.historialinventario_idhistorialinventario_seq'::regclass);
 X   ALTER TABLE public.historialinventario ALTER COLUMN idhistorialinventario DROP DEFAULT;
       public          postgres    false    241    240                       2604    16612 !   imagenesespacio idimagenesespacio    DEFAULT     �   ALTER TABLE ONLY public.imagenesespacio ALTER COLUMN idimagenesespacio SET DEFAULT nextval('public.imagenesespacio_idimagenesespacio_seq'::regclass);
 P   ALTER TABLE public.imagenesespacio ALTER COLUMN idimagenesespacio DROP DEFAULT;
       public          postgres    false    243    242                       2604    16613    marca idmarca    DEFAULT     n   ALTER TABLE ONLY public.marca ALTER COLUMN idmarca SET DEFAULT nextval('public.marca_idmarca_seq'::regclass);
 <   ALTER TABLE public.marca ALTER COLUMN idmarca DROP DEFAULT;
       public          postgres    false    245    244                       2604    16614    material idmaterial    DEFAULT     z   ALTER TABLE ONLY public.material ALTER COLUMN idmaterial SET DEFAULT nextval('public.material_idmaterial_seq'::regclass);
 B   ALTER TABLE public.material ALTER COLUMN idmaterial DROP DEFAULT;
       public          postgres    false    247    246                       2604    16615    mespago idmespago    DEFAULT     v   ALTER TABLE ONLY public.mespago ALTER COLUMN idmespago SET DEFAULT nextval('public.mespago_idmespago_seq'::regclass);
 @   ALTER TABLE public.mespago ALTER COLUMN idmespago DROP DEFAULT;
       public          postgres    false    249    248                       2604    16616    pedido idpedido    DEFAULT     r   ALTER TABLE ONLY public.pedido ALTER COLUMN idpedido SET DEFAULT nextval('public.pedido_idpedido_seq'::regclass);
 >   ALTER TABLE public.pedido ALTER COLUMN idpedido DROP DEFAULT;
       public          postgres    false    251    250                       2604    16617    residente idresidente    DEFAULT     ~   ALTER TABLE ONLY public.residente ALTER COLUMN idresidente SET DEFAULT nextval('public.residente_idresidente_seq'::regclass);
 D   ALTER TABLE public.residente ALTER COLUMN idresidente DROP DEFAULT;
       public          postgres    false    253    252                       2604    16618    residentecasa idresidentecasa    DEFAULT     �   ALTER TABLE ONLY public.residentecasa ALTER COLUMN idresidentecasa SET DEFAULT nextval('public.residentecasa_idresidentecasa_seq'::regclass);
 L   ALTER TABLE public.residentecasa ALTER COLUMN idresidentecasa DROP DEFAULT;
       public          postgres    false    255    254                       2604    16619    tipodenuncia idtipodenuncia    DEFAULT     �   ALTER TABLE ONLY public.tipodenuncia ALTER COLUMN idtipodenuncia SET DEFAULT nextval('public.tipodenuncia_idtipodenuncia_seq'::regclass);
 J   ALTER TABLE public.tipodenuncia ALTER COLUMN idtipodenuncia DROP DEFAULT;
       public          postgres    false    257    256                       2604    16620    tipoempleado idtipoempleado    DEFAULT     �   ALTER TABLE ONLY public.tipoempleado ALTER COLUMN idtipoempleado SET DEFAULT nextval('public.tipoempleado_idtipoempleado_seq'::regclass);
 J   ALTER TABLE public.tipoempleado ALTER COLUMN idtipoempleado DROP DEFAULT;
       public          postgres    false    259    258                        2604    16621    tipounidad idtipounidad    DEFAULT     �   ALTER TABLE ONLY public.tipounidad ALTER COLUMN idtipounidad SET DEFAULT nextval('public.tipounidad_idtipounidad_seq'::regclass);
 F   ALTER TABLE public.tipounidad ALTER COLUMN idtipounidad DROP DEFAULT;
       public          postgres    false    261    260            !           2604    16622    tipousuario idtipousuario    DEFAULT     �   ALTER TABLE ONLY public.tipousuario ALTER COLUMN idtipousuario SET DEFAULT nextval('public.tipousuario_idtipousuario_seq'::regclass);
 H   ALTER TABLE public.tipousuario ALTER COLUMN idtipousuario DROP DEFAULT;
       public          postgres    false    263    262            "           2604    16623    unidadmedida idunidadmedida    DEFAULT     �   ALTER TABLE ONLY public.unidadmedida ALTER COLUMN idunidadmedida SET DEFAULT nextval('public.unidadmedida_idunidadmedida_seq'::regclass);
 J   ALTER TABLE public.unidadmedida ALTER COLUMN idunidadmedida DROP DEFAULT;
       public          postgres    false    265    264            #           2604    16624    usuario idusuario    DEFAULT     v   ALTER TABLE ONLY public.usuario ALTER COLUMN idusuario SET DEFAULT nextval('public.usuario_idusuario_seq'::regclass);
 @   ALTER TABLE public.usuario ALTER COLUMN idusuario DROP DEFAULT;
       public          postgres    false    267    266            $           2604    16625    visita idvisita    DEFAULT     r   ALTER TABLE ONLY public.visita ALTER COLUMN idvisita SET DEFAULT nextval('public.visita_idvisita_seq'::regclass);
 >   ALTER TABLE public.visita ALTER COLUMN idvisita DROP DEFAULT;
       public          postgres    false    269    268            %           2604    16626    visitante idvisitante    DEFAULT     ~   ALTER TABLE ONLY public.visitante ALTER COLUMN idvisitante SET DEFAULT nextval('public.visitante_idvisitante_seq'::regclass);
 D   ALTER TABLE public.visitante ALTER COLUMN idvisitante DROP DEFAULT;
       public          postgres    false    271    270            +          0    16387    alquiler 
   TABLE DATA           �   COPY public.alquiler (idalquiler, idestadoalquiler, idespacio, precio, idusuario, idresidente, fecha, horainicio, horafin) FROM stdin;
    public          postgres    false    200   �      -          0    16395 
   aportacion 
   TABLE DATA           x   COPY public.aportacion (idaportacion, idcasa, idestadoaportacion, monto, idmespago, fechapago, descripcion) FROM stdin;
    public          postgres    false    202   �      /          0    16403    bitacora 
   TABLE DATA           [   COPY public.bitacora (idbitacora, idusuario, hora, fecha, accion, descripcion) FROM stdin;
    public          postgres    false    204   �      1          0    16408    casa 
   TABLE DATA           K   COPY public.casa (idcasa, idestadocasa, numerocasa, direccion) FROM stdin;
    public          postgres    false    206   ��      3          0    16416 	   categoria 
   TABLE DATA           ;   COPY public.categoria (idcategoria, categoria) FROM stdin;
    public          postgres    false    208   �      5          0    16421    denuncia 
   TABLE DATA           �   COPY public.denuncia (iddenuncia, idempleado, idresidente, idtipodenuncia, idestadodenuncia, fecha, descripcion, respuesta) FROM stdin;
    public          postgres    false    210   k�      7          0    16426    detallematerial 
   TABLE DATA           t   COPY public.detallematerial (iddetallematerial, idpedido, idmaterial, preciomaterial, cantidadmaterial) FROM stdin;
    public          postgres    false    212   ņ      9          0    16434    detallevisita 
   TABLE DATA           O   COPY public.detallevisita (iddetallevisita, idvisita, idvisitante) FROM stdin;
    public          postgres    false    214   !�      ;          0    16439    empleado 
   TABLE DATA           �   COPY public.empleado (idempleado, idestadoempleado, idtipoempleado, nombre, apellido, telefono, dui, genero, foto, direccion, correo, fechanacimiento) FROM stdin;
    public          postgres    false    216   S�      =          0    16444    espacio 
   TABLE DATA           n   COPY public.espacio (idespacio, idestadoespacio, nombre, descripcion, capacidad, imagenprincipal) FROM stdin;
    public          postgres    false    218   _�      ?          0    16452    estadoalquiler 
   TABLE DATA           J   COPY public.estadoalquiler (idestadoalquiler, estadoalquiler) FROM stdin;
    public          postgres    false    220   `�      A          0    16457    estadoaportacion 
   TABLE DATA           P   COPY public.estadoaportacion (idestadoaportacion, estadoaportacion) FROM stdin;
    public          postgres    false    222   ��      C          0    16462 
   estadocasa 
   TABLE DATA           >   COPY public.estadocasa (idestadocasa, estadocasa) FROM stdin;
    public          postgres    false    224   ݉      E          0    16467    estadodenuncia 
   TABLE DATA           J   COPY public.estadodenuncia (idestadodenuncia, estadodenuncia) FROM stdin;
    public          postgres    false    226   �      G          0    16472    estadoempleado 
   TABLE DATA           J   COPY public.estadoempleado (idestadoempleado, estadoempleado) FROM stdin;
    public          postgres    false    228   f�      I          0    16477    estadoespacio 
   TABLE DATA           G   COPY public.estadoespacio (idestadoespacio, estadoespacio) FROM stdin;
    public          postgres    false    230   ��      K          0    16482    estadopedido 
   TABLE DATA           D   COPY public.estadopedido (idestadopedido, estadopedido) FROM stdin;
    public          postgres    false    232   �      M          0    16487    estadoresidente 
   TABLE DATA           M   COPY public.estadoresidente (idestadoresidente, estadoresidente) FROM stdin;
    public          postgres    false    234   6�      O          0    16492    estadousuario 
   TABLE DATA           G   COPY public.estadousuario (idestadousuario, estadousuario) FROM stdin;
    public          postgres    false    236   l�      Q          0    16497    estadovisita 
   TABLE DATA           D   COPY public.estadovisita (idestadovisita, estadovisita) FROM stdin;
    public          postgres    false    238   ��      S          0    16502    historialinventario 
   TABLE DATA           a   COPY public.historialinventario (idhistorialinventario, idmaterial, cantidad, fecha) FROM stdin;
    public          postgres    false    240   �      U          0    16510    imagenesespacio 
   TABLE DATA           O   COPY public.imagenesespacio (idimagenesespacio, imagen, idespacio) FROM stdin;
    public          postgres    false    242   C�      W          0    16515    marca 
   TABLE DATA           /   COPY public.marca (idmarca, marca) FROM stdin;
    public          postgres    false    244   ��      Y          0    16520    material 
   TABLE DATA           �   COPY public.material (idmaterial, nombreproducto, costo, imagen, idcategoria, "tamaño", descripcion, cantidad, idmarca, idunidadmedida) FROM stdin;
    public          postgres    false    246   ܌      [          0    16528    mespago 
   TABLE DATA           6   COPY public.mespago (idmespago, mes, ano) FROM stdin;
    public          postgres    false    248   ��      ]          0    16536    pedido 
   TABLE DATA           ^   COPY public.pedido (idpedido, idestadopedido, idusuario, idempleado, fechapedido) FROM stdin;
    public          postgres    false    250   &�      _          0    16541 	   residente 
   TABLE DATA           �   COPY public.residente (idresidente, idestadoresidente, nombre, apellido, telefonofijo, telefonocelular, foto, correo, fechanacimiento, genero, dui, username, contrasena, modo) FROM stdin;
    public          postgres    false    252   s�      a          0    16546    residentecasa 
   TABLE DATA           M   COPY public.residentecasa (idresidentecasa, idresidente, idcasa) FROM stdin;
    public          postgres    false    254   �      c          0    16551    tipodenuncia 
   TABLE DATA           D   COPY public.tipodenuncia (idtipodenuncia, tipodenuncia) FROM stdin;
    public          postgres    false    256   $�      e          0    16556    tipoempleado 
   TABLE DATA           D   COPY public.tipoempleado (idtipoempleado, tipoempleado) FROM stdin;
    public          postgres    false    258   h�      g          0    16561 
   tipounidad 
   TABLE DATA           >   COPY public.tipounidad (idtipounidad, tipounidad) FROM stdin;
    public          postgres    false    260   ��      i          0    16566    tipousuario 
   TABLE DATA           A   COPY public.tipousuario (idtipousuario, tipousuario) FROM stdin;
    public          postgres    false    262   ۑ      k          0    16571    unidadmedida 
   TABLE DATA           R   COPY public.unidadmedida (idunidadmedida, idtipounidad, unidadmedida) FROM stdin;
    public          postgres    false    264   �      m          0    16576    usuario 
   TABLE DATA           �   COPY public.usuario (idusuario, idestadousuario, idtipousuario, nombre, apellido, telefonofijo, telefonocelular, foto, correo, fechanacimiento, genero, dui, username, contrasena, direccion, modo) FROM stdin;
    public          postgres    false    266   J�      o          0    16581    visita 
   TABLE DATA           m   COPY public.visita (idvisita, idresidente, fecha, visitarecurrente, observacion, idestadovisita) FROM stdin;
    public          postgres    false    268   ��      q          0    16586 	   visitante 
   TABLE DATA           V   COPY public.visitante (idvisitante, nombre, apellido, dui, genero, placa) FROM stdin;
    public          postgres    false    270   ~�      �           0    0    alquiler_idalquiler_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.alquiler_idalquiler_seq', 3, true);
          public          postgres    false    201            �           0    0    aportacion_idaportacion_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.aportacion_idaportacion_seq', 72, true);
          public          postgres    false    203            �           0    0    bitacora_idbitacora_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.bitacora_idbitacora_seq', 64, true);
          public          postgres    false    205            �           0    0    casa_idcasa_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.casa_idcasa_seq', 5, true);
          public          postgres    false    207            �           0    0    categoria_idcategoria_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.categoria_idcategoria_seq', 9, true);
          public          postgres    false    209            �           0    0    denuncia_iddenuncia_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.denuncia_iddenuncia_seq', 15, true);
          public          postgres    false    211            �           0    0 %   detallematerial_iddetallematerial_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.detallematerial_iddetallematerial_seq', 30, true);
          public          postgres    false    213            �           0    0 !   detallevisita_iddetallevisita_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.detallevisita_iddetallevisita_seq', 4, true);
          public          postgres    false    215            �           0    0    empleado_idempleado_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.empleado_idempleado_seq', 6, true);
          public          postgres    false    217            �           0    0    espacio_idespacio_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.espacio_idespacio_seq', 5, true);
          public          postgres    false    219            �           0    0 #   estadoalquiler_idestadoalquiler_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.estadoalquiler_idestadoalquiler_seq', 4, true);
          public          postgres    false    221            �           0    0 '   estadoaportacion_idestadoaportacion_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.estadoaportacion_idestadoaportacion_seq', 2, true);
          public          postgres    false    223            �           0    0    estadocasa_idestadocasa_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.estadocasa_idestadocasa_seq', 2, true);
          public          postgres    false    225            �           0    0 #   estadodenuncia_idestadodenuncia_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.estadodenuncia_idestadodenuncia_seq', 5, true);
          public          postgres    false    227            �           0    0 #   estadoempleado_idestadoempleado_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.estadoempleado_idestadoempleado_seq', 3, true);
          public          postgres    false    229            �           0    0 !   estadoespacio_idestadoespacio_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.estadoespacio_idestadoespacio_seq', 4, true);
          public          postgres    false    231            �           0    0    estadopedido_idestadopedido_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.estadopedido_idestadopedido_seq', 4, true);
          public          postgres    false    233            �           0    0 %   estadoresidente_idestadoresidente_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.estadoresidente_idestadoresidente_seq', 2, true);
          public          postgres    false    235            �           0    0 !   estadousuario_idestadousuario_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.estadousuario_idestadousuario_seq', 2, true);
          public          postgres    false    237            �           0    0    estadovisita_idestadovisita_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.estadovisita_idestadovisita_seq', 3, true);
          public          postgres    false    239            �           0    0 -   historialinventario_idhistorialinventario_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('public.historialinventario_idhistorialinventario_seq', 11, true);
          public          postgres    false    241            �           0    0 %   imagenesespacio_idimagenesespacio_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.imagenesespacio_idimagenesespacio_seq', 3, true);
          public          postgres    false    243            �           0    0    marca_idmarca_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.marca_idmarca_seq', 5, true);
          public          postgres    false    245            �           0    0    material_idmaterial_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.material_idmaterial_seq', 6, true);
          public          postgres    false    247            �           0    0    mespago_idmespago_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.mespago_idmespago_seq', 60, true);
          public          postgres    false    249            �           0    0    pedido_idpedido_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.pedido_idpedido_seq', 7, true);
          public          postgres    false    251            �           0    0    residente_idresidente_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.residente_idresidente_seq', 6, true);
          public          postgres    false    253            �           0    0 !   residentecasa_idresidentecasa_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.residentecasa_idresidentecasa_seq', 1, true);
          public          postgres    false    255            �           0    0    tipodenuncia_idtipodenuncia_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.tipodenuncia_idtipodenuncia_seq', 3, true);
          public          postgres    false    257            �           0    0    tipoempleado_idtipoempleado_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.tipoempleado_idtipoempleado_seq', 3, true);
          public          postgres    false    259            �           0    0    tipounidad_idtipounidad_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.tipounidad_idtipounidad_seq', 3, true);
          public          postgres    false    261            �           0    0    tipousuario_idtipousuario_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.tipousuario_idtipousuario_seq', 2, true);
          public          postgres    false    263            �           0    0    unidadmedida_idunidadmedida_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.unidadmedida_idunidadmedida_seq', 3, true);
          public          postgres    false    265            �           0    0    usuario_idusuario_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.usuario_idusuario_seq', 4, true);
          public          postgres    false    267            �           0    0    visita_idvisita_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.visita_idvisita_seq', 19, true);
          public          postgres    false    269            �           0    0    visitante_idvisitante_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.visitante_idvisitante_seq', 4, true);
          public          postgres    false    271            '           2606    16628    alquiler alquiler_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.alquiler
    ADD CONSTRAINT alquiler_pkey PRIMARY KEY (idalquiler);
 @   ALTER TABLE ONLY public.alquiler DROP CONSTRAINT alquiler_pkey;
       public            postgres    false    200            )           2606    16630    aportacion aportacion_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.aportacion
    ADD CONSTRAINT aportacion_pkey PRIMARY KEY (idaportacion);
 D   ALTER TABLE ONLY public.aportacion DROP CONSTRAINT aportacion_pkey;
       public            postgres    false    202            +           2606    16632    bitacora bitacora_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.bitacora
    ADD CONSTRAINT bitacora_pkey PRIMARY KEY (idbitacora);
 @   ALTER TABLE ONLY public.bitacora DROP CONSTRAINT bitacora_pkey;
       public            postgres    false    204            -           2606    16634    casa casa_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.casa
    ADD CONSTRAINT casa_pkey PRIMARY KEY (idcasa);
 8   ALTER TABLE ONLY public.casa DROP CONSTRAINT casa_pkey;
       public            postgres    false    206            /           2606    16636    categoria categoria_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (idcategoria);
 B   ALTER TABLE ONLY public.categoria DROP CONSTRAINT categoria_pkey;
       public            postgres    false    208            1           2606    16638    denuncia denuncia_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.denuncia
    ADD CONSTRAINT denuncia_pkey PRIMARY KEY (iddenuncia);
 @   ALTER TABLE ONLY public.denuncia DROP CONSTRAINT denuncia_pkey;
       public            postgres    false    210            3           2606    16640 $   detallematerial detallematerial_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.detallematerial
    ADD CONSTRAINT detallematerial_pkey PRIMARY KEY (iddetallematerial);
 N   ALTER TABLE ONLY public.detallematerial DROP CONSTRAINT detallematerial_pkey;
       public            postgres    false    212            5           2606    16642     detallevisita detallevisita_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.detallevisita
    ADD CONSTRAINT detallevisita_pkey PRIMARY KEY (iddetallevisita);
 J   ALTER TABLE ONLY public.detallevisita DROP CONSTRAINT detallevisita_pkey;
       public            postgres    false    214            7           2606    16644    empleado empleado_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_pkey PRIMARY KEY (idempleado);
 @   ALTER TABLE ONLY public.empleado DROP CONSTRAINT empleado_pkey;
       public            postgres    false    216            ?           2606    16646    espacio espacio_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.espacio
    ADD CONSTRAINT espacio_pkey PRIMARY KEY (idespacio);
 >   ALTER TABLE ONLY public.espacio DROP CONSTRAINT espacio_pkey;
       public            postgres    false    218            C           2606    16648 "   estadoalquiler estadoalquiler_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.estadoalquiler
    ADD CONSTRAINT estadoalquiler_pkey PRIMARY KEY (idestadoalquiler);
 L   ALTER TABLE ONLY public.estadoalquiler DROP CONSTRAINT estadoalquiler_pkey;
       public            postgres    false    220            E           2606    16650 &   estadoaportacion estadoaportacion_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.estadoaportacion
    ADD CONSTRAINT estadoaportacion_pkey PRIMARY KEY (idestadoaportacion);
 P   ALTER TABLE ONLY public.estadoaportacion DROP CONSTRAINT estadoaportacion_pkey;
       public            postgres    false    222            G           2606    16652    estadocasa estadocasa_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.estadocasa
    ADD CONSTRAINT estadocasa_pkey PRIMARY KEY (idestadocasa);
 D   ALTER TABLE ONLY public.estadocasa DROP CONSTRAINT estadocasa_pkey;
       public            postgres    false    224            I           2606    16654 "   estadodenuncia estadodenuncia_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.estadodenuncia
    ADD CONSTRAINT estadodenuncia_pkey PRIMARY KEY (idestadodenuncia);
 L   ALTER TABLE ONLY public.estadodenuncia DROP CONSTRAINT estadodenuncia_pkey;
       public            postgres    false    226            K           2606    16656 "   estadoempleado estadoempleado_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.estadoempleado
    ADD CONSTRAINT estadoempleado_pkey PRIMARY KEY (idestadoempleado);
 L   ALTER TABLE ONLY public.estadoempleado DROP CONSTRAINT estadoempleado_pkey;
       public            postgres    false    228            M           2606    16658     estadoespacio estadoespacio_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.estadoespacio
    ADD CONSTRAINT estadoespacio_pkey PRIMARY KEY (idestadoespacio);
 J   ALTER TABLE ONLY public.estadoespacio DROP CONSTRAINT estadoespacio_pkey;
       public            postgres    false    230            O           2606    16660    estadopedido estadopedido_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.estadopedido
    ADD CONSTRAINT estadopedido_pkey PRIMARY KEY (idestadopedido);
 H   ALTER TABLE ONLY public.estadopedido DROP CONSTRAINT estadopedido_pkey;
       public            postgres    false    232            Q           2606    16662 $   estadoresidente estadoresidente_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.estadoresidente
    ADD CONSTRAINT estadoresidente_pkey PRIMARY KEY (idestadoresidente);
 N   ALTER TABLE ONLY public.estadoresidente DROP CONSTRAINT estadoresidente_pkey;
       public            postgres    false    234            S           2606    16664     estadousuario estadousuario_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.estadousuario
    ADD CONSTRAINT estadousuario_pkey PRIMARY KEY (idestadousuario);
 J   ALTER TABLE ONLY public.estadousuario DROP CONSTRAINT estadousuario_pkey;
       public            postgres    false    236            U           2606    16666    estadovisita estadovisita_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.estadovisita
    ADD CONSTRAINT estadovisita_pkey PRIMARY KEY (idestadovisita);
 H   ALTER TABLE ONLY public.estadovisita DROP CONSTRAINT estadovisita_pkey;
       public            postgres    false    238            W           2606    16668 ,   historialinventario historialinventario_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public.historialinventario
    ADD CONSTRAINT historialinventario_pkey PRIMARY KEY (idhistorialinventario);
 V   ALTER TABLE ONLY public.historialinventario DROP CONSTRAINT historialinventario_pkey;
       public            postgres    false    240            Y           2606    16670 $   imagenesespacio imagenesespacio_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.imagenesespacio
    ADD CONSTRAINT imagenesespacio_pkey PRIMARY KEY (idimagenesespacio);
 N   ALTER TABLE ONLY public.imagenesespacio DROP CONSTRAINT imagenesespacio_pkey;
       public            postgres    false    242            [           2606    16672    marca marca_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.marca
    ADD CONSTRAINT marca_pkey PRIMARY KEY (idmarca);
 :   ALTER TABLE ONLY public.marca DROP CONSTRAINT marca_pkey;
       public            postgres    false    244            ]           2606    16674    material material_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.material
    ADD CONSTRAINT material_pkey PRIMARY KEY (idmaterial);
 @   ALTER TABLE ONLY public.material DROP CONSTRAINT material_pkey;
       public            postgres    false    246            _           2606    16676    mespago mespago_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.mespago
    ADD CONSTRAINT mespago_pkey PRIMARY KEY (idmespago);
 >   ALTER TABLE ONLY public.mespago DROP CONSTRAINT mespago_pkey;
       public            postgres    false    248            a           2606    16678    pedido pedido_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (idpedido);
 <   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_pkey;
       public            postgres    false    250            c           2606    16680    residente residente_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.residente
    ADD CONSTRAINT residente_pkey PRIMARY KEY (idresidente);
 B   ALTER TABLE ONLY public.residente DROP CONSTRAINT residente_pkey;
       public            postgres    false    252            e           2606    16682     residentecasa residentecasa_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.residentecasa
    ADD CONSTRAINT residentecasa_pkey PRIMARY KEY (idresidentecasa);
 J   ALTER TABLE ONLY public.residentecasa DROP CONSTRAINT residentecasa_pkey;
       public            postgres    false    254            g           2606    16684    tipodenuncia tipodenuncia_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.tipodenuncia
    ADD CONSTRAINT tipodenuncia_pkey PRIMARY KEY (idtipodenuncia);
 H   ALTER TABLE ONLY public.tipodenuncia DROP CONSTRAINT tipodenuncia_pkey;
       public            postgres    false    256            i           2606    16686    tipoempleado tipoempleado_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.tipoempleado
    ADD CONSTRAINT tipoempleado_pkey PRIMARY KEY (idtipoempleado);
 H   ALTER TABLE ONLY public.tipoempleado DROP CONSTRAINT tipoempleado_pkey;
       public            postgres    false    258            k           2606    16688    tipounidad tipounidad_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.tipounidad
    ADD CONSTRAINT tipounidad_pkey PRIMARY KEY (idtipounidad);
 D   ALTER TABLE ONLY public.tipounidad DROP CONSTRAINT tipounidad_pkey;
       public            postgres    false    260            m           2606    16690    tipousuario tipousuario_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.tipousuario
    ADD CONSTRAINT tipousuario_pkey PRIMARY KEY (idtipousuario);
 F   ALTER TABLE ONLY public.tipousuario DROP CONSTRAINT tipousuario_pkey;
       public            postgres    false    262            o           2606    16692    unidadmedida unidadmedida_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.unidadmedida
    ADD CONSTRAINT unidadmedida_pkey PRIMARY KEY (idunidadmedida);
 H   ALTER TABLE ONLY public.unidadmedida DROP CONSTRAINT unidadmedida_pkey;
       public            postgres    false    264            9           2606    16694    empleado uq_empleado_correo 
   CONSTRAINT     X   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT uq_empleado_correo UNIQUE (correo);
 E   ALTER TABLE ONLY public.empleado DROP CONSTRAINT uq_empleado_correo;
       public            postgres    false    216            ;           2606    16696    empleado uq_empleado_dui 
   CONSTRAINT     R   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT uq_empleado_dui UNIQUE (dui);
 B   ALTER TABLE ONLY public.empleado DROP CONSTRAINT uq_empleado_dui;
       public            postgres    false    216            =           2606    16698    empleado uq_empleado_telefono 
   CONSTRAINT     \   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT uq_empleado_telefono UNIQUE (telefono);
 G   ALTER TABLE ONLY public.empleado DROP CONSTRAINT uq_empleado_telefono;
       public            postgres    false    216            A           2606    16700    espacio uq_espacio_nombre 
   CONSTRAINT     V   ALTER TABLE ONLY public.espacio
    ADD CONSTRAINT uq_espacio_nombre UNIQUE (nombre);
 C   ALTER TABLE ONLY public.espacio DROP CONSTRAINT uq_espacio_nombre;
       public            postgres    false    218            q           2606    16702    usuario uq_usuario_correo 
   CONSTRAINT     V   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT uq_usuario_correo UNIQUE (correo);
 C   ALTER TABLE ONLY public.usuario DROP CONSTRAINT uq_usuario_correo;
       public            postgres    false    266            s           2606    16704    usuario uq_usuario_dui 
   CONSTRAINT     P   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT uq_usuario_dui UNIQUE (dui);
 @   ALTER TABLE ONLY public.usuario DROP CONSTRAINT uq_usuario_dui;
       public            postgres    false    266            u           2606    16706 #   usuario uq_usuario_telefono_celular 
   CONSTRAINT     i   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT uq_usuario_telefono_celular UNIQUE (telefonocelular);
 M   ALTER TABLE ONLY public.usuario DROP CONSTRAINT uq_usuario_telefono_celular;
       public            postgres    false    266            w           2606    16708     usuario uq_usuario_telefono_fijo 
   CONSTRAINT     c   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT uq_usuario_telefono_fijo UNIQUE (telefonofijo);
 J   ALTER TABLE ONLY public.usuario DROP CONSTRAINT uq_usuario_telefono_fijo;
       public            postgres    false    266            y           2606    16710    usuario uq_usuario_username 
   CONSTRAINT     Z   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT uq_usuario_username UNIQUE (username);
 E   ALTER TABLE ONLY public.usuario DROP CONSTRAINT uq_usuario_username;
       public            postgres    false    266                       2606    16712    visitante uq_visitante_dui 
   CONSTRAINT     T   ALTER TABLE ONLY public.visitante
    ADD CONSTRAINT uq_visitante_dui UNIQUE (dui);
 D   ALTER TABLE ONLY public.visitante DROP CONSTRAINT uq_visitante_dui;
       public            postgres    false    270            �           2606    16714    visitante uq_visitante_placa 
   CONSTRAINT     X   ALTER TABLE ONLY public.visitante
    ADD CONSTRAINT uq_visitante_placa UNIQUE (placa);
 F   ALTER TABLE ONLY public.visitante DROP CONSTRAINT uq_visitante_placa;
       public            postgres    false    270            {           2606    16716    usuario usuario_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (idusuario);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public            postgres    false    266            }           2606    16718    visita visita_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.visita
    ADD CONSTRAINT visita_pkey PRIMARY KEY (idvisita);
 <   ALTER TABLE ONLY public.visita DROP CONSTRAINT visita_pkey;
       public            postgres    false    268            �           2606    16720    visitante visitante_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.visitante
    ADD CONSTRAINT visitante_pkey PRIMARY KEY (idvisitante);
 B   ALTER TABLE ONLY public.visitante DROP CONSTRAINT visitante_pkey;
       public            postgres    false    270            �           2620    16721    material tr_historialinventario    TRIGGER     �   CREATE TRIGGER tr_historialinventario BEFORE UPDATE ON public.material FOR EACH ROW EXECUTE FUNCTION public.sp_historialinventario();
 8   DROP TRIGGER tr_historialinventario ON public.material;
       public          postgres    false    246    272            �           2606    16722     alquiler alquiler_idespacio_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.alquiler
    ADD CONSTRAINT alquiler_idespacio_fkey FOREIGN KEY (idespacio) REFERENCES public.espacio(idespacio);
 J   ALTER TABLE ONLY public.alquiler DROP CONSTRAINT alquiler_idespacio_fkey;
       public          postgres    false    218    200    3135            �           2606    16727 '   alquiler alquiler_idestadoalquiler_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.alquiler
    ADD CONSTRAINT alquiler_idestadoalquiler_fkey FOREIGN KEY (idestadoalquiler) REFERENCES public.estadoalquiler(idestadoalquiler);
 Q   ALTER TABLE ONLY public.alquiler DROP CONSTRAINT alquiler_idestadoalquiler_fkey;
       public          postgres    false    200    220    3139            �           2606    16732 "   alquiler alquiler_idresidente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.alquiler
    ADD CONSTRAINT alquiler_idresidente_fkey FOREIGN KEY (idresidente) REFERENCES public.residente(idresidente);
 L   ALTER TABLE ONLY public.alquiler DROP CONSTRAINT alquiler_idresidente_fkey;
       public          postgres    false    200    252    3171            �           2606    16737     alquiler alquiler_idusuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.alquiler
    ADD CONSTRAINT alquiler_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);
 J   ALTER TABLE ONLY public.alquiler DROP CONSTRAINT alquiler_idusuario_fkey;
       public          postgres    false    266    200    3195            �           2606    16742 !   aportacion aportacion_idcasa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.aportacion
    ADD CONSTRAINT aportacion_idcasa_fkey FOREIGN KEY (idcasa) REFERENCES public.casa(idcasa);
 K   ALTER TABLE ONLY public.aportacion DROP CONSTRAINT aportacion_idcasa_fkey;
       public          postgres    false    202    206    3117            �           2606    16747 -   aportacion aportacion_idestadoaportacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.aportacion
    ADD CONSTRAINT aportacion_idestadoaportacion_fkey FOREIGN KEY (idestadoaportacion) REFERENCES public.estadoaportacion(idestadoaportacion);
 W   ALTER TABLE ONLY public.aportacion DROP CONSTRAINT aportacion_idestadoaportacion_fkey;
       public          postgres    false    202    222    3141            �           2606    16752 $   aportacion aportacion_idmespago_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.aportacion
    ADD CONSTRAINT aportacion_idmespago_fkey FOREIGN KEY (idmespago) REFERENCES public.mespago(idmespago);
 N   ALTER TABLE ONLY public.aportacion DROP CONSTRAINT aportacion_idmespago_fkey;
       public          postgres    false    202    248    3167            �           2606    16757     bitacora bitacora_idusuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.bitacora
    ADD CONSTRAINT bitacora_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);
 J   ALTER TABLE ONLY public.bitacora DROP CONSTRAINT bitacora_idusuario_fkey;
       public          postgres    false    204    266    3195            �           2606    16762    casa casa_idestadocasa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.casa
    ADD CONSTRAINT casa_idestadocasa_fkey FOREIGN KEY (idestadocasa) REFERENCES public.estadocasa(idestadocasa);
 E   ALTER TABLE ONLY public.casa DROP CONSTRAINT casa_idestadocasa_fkey;
       public          postgres    false    206    224    3143            �           2606    16767 !   denuncia denuncia_idempleado_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.denuncia
    ADD CONSTRAINT denuncia_idempleado_fkey FOREIGN KEY (idempleado) REFERENCES public.empleado(idempleado);
 K   ALTER TABLE ONLY public.denuncia DROP CONSTRAINT denuncia_idempleado_fkey;
       public          postgres    false    216    210    3127            �           2606    16772 '   denuncia denuncia_idestadodenuncia_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.denuncia
    ADD CONSTRAINT denuncia_idestadodenuncia_fkey FOREIGN KEY (idestadodenuncia) REFERENCES public.estadodenuncia(idestadodenuncia);
 Q   ALTER TABLE ONLY public.denuncia DROP CONSTRAINT denuncia_idestadodenuncia_fkey;
       public          postgres    false    210    226    3145            �           2606    16777 "   denuncia denuncia_idresidente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.denuncia
    ADD CONSTRAINT denuncia_idresidente_fkey FOREIGN KEY (idresidente) REFERENCES public.residente(idresidente);
 L   ALTER TABLE ONLY public.denuncia DROP CONSTRAINT denuncia_idresidente_fkey;
       public          postgres    false    3171    252    210            �           2606    16782 %   denuncia denuncia_idtipodenuncia_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.denuncia
    ADD CONSTRAINT denuncia_idtipodenuncia_fkey FOREIGN KEY (idtipodenuncia) REFERENCES public.tipodenuncia(idtipodenuncia);
 O   ALTER TABLE ONLY public.denuncia DROP CONSTRAINT denuncia_idtipodenuncia_fkey;
       public          postgres    false    210    3175    256            �           2606    16787 /   detallematerial detallematerial_idmaterial_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.detallematerial
    ADD CONSTRAINT detallematerial_idmaterial_fkey FOREIGN KEY (idmaterial) REFERENCES public.material(idmaterial);
 Y   ALTER TABLE ONLY public.detallematerial DROP CONSTRAINT detallematerial_idmaterial_fkey;
       public          postgres    false    212    3165    246            �           2606    16792 -   detallematerial detallematerial_idpedido_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.detallematerial
    ADD CONSTRAINT detallematerial_idpedido_fkey FOREIGN KEY (idpedido) REFERENCES public.pedido(idpedido);
 W   ALTER TABLE ONLY public.detallematerial DROP CONSTRAINT detallematerial_idpedido_fkey;
       public          postgres    false    3169    212    250            �           2606    16797 )   detallevisita detallevisita_idvisita_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.detallevisita
    ADD CONSTRAINT detallevisita_idvisita_fkey FOREIGN KEY (idvisita) REFERENCES public.visita(idvisita);
 S   ALTER TABLE ONLY public.detallevisita DROP CONSTRAINT detallevisita_idvisita_fkey;
       public          postgres    false    3197    268    214            �           2606    16802 ,   detallevisita detallevisita_idvisitante_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.detallevisita
    ADD CONSTRAINT detallevisita_idvisitante_fkey FOREIGN KEY (idvisitante) REFERENCES public.visitante(idvisitante);
 V   ALTER TABLE ONLY public.detallevisita DROP CONSTRAINT detallevisita_idvisitante_fkey;
       public          postgres    false    214    3203    270            �           2606    16807 '   empleado empleado_idestadoempleado_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_idestadoempleado_fkey FOREIGN KEY (idestadoempleado) REFERENCES public.estadoempleado(idestadoempleado);
 Q   ALTER TABLE ONLY public.empleado DROP CONSTRAINT empleado_idestadoempleado_fkey;
       public          postgres    false    216    228    3147            �           2606    16812 %   empleado empleado_idtipoempleado_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_idtipoempleado_fkey FOREIGN KEY (idtipoempleado) REFERENCES public.tipoempleado(idtipoempleado);
 O   ALTER TABLE ONLY public.empleado DROP CONSTRAINT empleado_idtipoempleado_fkey;
       public          postgres    false    3177    216    258            �           2606    16817 $   espacio espacio_idestadoespacio_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.espacio
    ADD CONSTRAINT espacio_idestadoespacio_fkey FOREIGN KEY (idestadoespacio) REFERENCES public.estadoespacio(idestadoespacio);
 N   ALTER TABLE ONLY public.espacio DROP CONSTRAINT espacio_idestadoespacio_fkey;
       public          postgres    false    218    3149    230            �           2606    16822 7   historialinventario historialinventario_idmaterial_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.historialinventario
    ADD CONSTRAINT historialinventario_idmaterial_fkey FOREIGN KEY (idmaterial) REFERENCES public.material(idmaterial);
 a   ALTER TABLE ONLY public.historialinventario DROP CONSTRAINT historialinventario_idmaterial_fkey;
       public          postgres    false    240    246    3165            �           2606    16827 .   imagenesespacio imagenesespacio_idespacio_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.imagenesespacio
    ADD CONSTRAINT imagenesespacio_idespacio_fkey FOREIGN KEY (idespacio) REFERENCES public.espacio(idespacio);
 X   ALTER TABLE ONLY public.imagenesespacio DROP CONSTRAINT imagenesespacio_idespacio_fkey;
       public          postgres    false    242    3135    218            �           2606    16832 "   material material_idcategoria_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.material
    ADD CONSTRAINT material_idcategoria_fkey FOREIGN KEY (idcategoria) REFERENCES public.categoria(idcategoria);
 L   ALTER TABLE ONLY public.material DROP CONSTRAINT material_idcategoria_fkey;
       public          postgres    false    3119    208    246            �           2606    16837    material material_idmarca_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.material
    ADD CONSTRAINT material_idmarca_fkey FOREIGN KEY (idmarca) REFERENCES public.marca(idmarca);
 H   ALTER TABLE ONLY public.material DROP CONSTRAINT material_idmarca_fkey;
       public          postgres    false    244    246    3163            �           2606    16842 %   material material_idunidadmedida_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.material
    ADD CONSTRAINT material_idunidadmedida_fkey FOREIGN KEY (idunidadmedida) REFERENCES public.unidadmedida(idunidadmedida);
 O   ALTER TABLE ONLY public.material DROP CONSTRAINT material_idunidadmedida_fkey;
       public          postgres    false    246    3183    264            �           2606    16847    pedido pedido_idempleado_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_idempleado_fkey FOREIGN KEY (idempleado) REFERENCES public.empleado(idempleado);
 G   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_idempleado_fkey;
       public          postgres    false    250    3127    216            �           2606    16852 !   pedido pedido_idestadopedido_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_idestadopedido_fkey FOREIGN KEY (idestadopedido) REFERENCES public.estadopedido(idestadopedido);
 K   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_idestadopedido_fkey;
       public          postgres    false    232    250    3151            �           2606    16857    pedido pedido_idusuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);
 F   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_idusuario_fkey;
       public          postgres    false    266    3195    250            �           2606    16862 *   residente residente_idestadoresidente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.residente
    ADD CONSTRAINT residente_idestadoresidente_fkey FOREIGN KEY (idestadoresidente) REFERENCES public.estadoresidente(idestadoresidente);
 T   ALTER TABLE ONLY public.residente DROP CONSTRAINT residente_idestadoresidente_fkey;
       public          postgres    false    252    234    3153            �           2606    16867 '   residentecasa residentecasa_idcasa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.residentecasa
    ADD CONSTRAINT residentecasa_idcasa_fkey FOREIGN KEY (idcasa) REFERENCES public.casa(idcasa);
 Q   ALTER TABLE ONLY public.residentecasa DROP CONSTRAINT residentecasa_idcasa_fkey;
       public          postgres    false    254    206    3117            �           2606    16872 ,   residentecasa residentecasa_idresidente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.residentecasa
    ADD CONSTRAINT residentecasa_idresidente_fkey FOREIGN KEY (idresidente) REFERENCES public.residente(idresidente);
 V   ALTER TABLE ONLY public.residentecasa DROP CONSTRAINT residentecasa_idresidente_fkey;
       public          postgres    false    3171    252    254            �           2606    16877 +   unidadmedida unidadmedida_idtipounidad_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.unidadmedida
    ADD CONSTRAINT unidadmedida_idtipounidad_fkey FOREIGN KEY (idtipounidad) REFERENCES public.tipounidad(idtipounidad);
 U   ALTER TABLE ONLY public.unidadmedida DROP CONSTRAINT unidadmedida_idtipounidad_fkey;
       public          postgres    false    264    3179    260            �           2606    16882 $   usuario usuario_idestadousuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_idestadousuario_fkey FOREIGN KEY (idestadousuario) REFERENCES public.estadousuario(idestadousuario);
 N   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_idestadousuario_fkey;
       public          postgres    false    266    236    3155            �           2606    16887 "   usuario usuario_idtipousuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_idtipousuario_fkey FOREIGN KEY (idtipousuario) REFERENCES public.tipousuario(idtipousuario);
 L   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_idtipousuario_fkey;
       public          postgres    false    266    3181    262            �           2606    16892 !   visita visita_idestadovisita_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.visita
    ADD CONSTRAINT visita_idestadovisita_fkey FOREIGN KEY (idestadovisita) REFERENCES public.estadovisita(idestadovisita);
 K   ALTER TABLE ONLY public.visita DROP CONSTRAINT visita_idestadovisita_fkey;
       public          postgres    false    3157    268    238            �           2606    16897    visita visita_idresidente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.visita
    ADD CONSTRAINT visita_idresidente_fkey FOREIGN KEY (idresidente) REFERENCES public.residente(idresidente);
 H   ALTER TABLE ONLY public.visita DROP CONSTRAINT visita_idresidente_fkey;
       public          postgres    false    268    3171    252            +   O   x�]��	 1г��aT�����9��0<TR�h@�A
�3���Գ7G� �8�7���~�?�UX�
����<1      -      x����� ��]$b�]�.R@.(F�%?�<�Or\��|�$��"]���	>���IBw)��}^e�ݣ<�[���ۼ�u{�n�n)�Y_�T��\�>�`"�$&Q��Q�	`�b"�L1	�@1
f�#�rrs�rڎ����f��cQ�!��z0ԡT�P�k CE��&0T�`����P�kCE�C��3�vlm�d��SC���	��(�30T��P=� ���F0Tٷ��z�ǍSW��c��p=�}����      /   x  x���]n�8ǟ�S�!8�$�V,z���j��k�}�;���ۡŨr��V�����!g��aX�
�"��:��>��#�y�ø���}iv�a�q�9u����7]h�v�C��v��~��6�zs�?��f�<}�6�þsk��@9�1�����Z_�|t�y��}�P�w�)���������%����_f<�����ۗ���� \|�Jĥ��8���z���ʍ�i���+�1���m��Om}�[޴O�c�sk��T1VLN��������W(��K	%��W�z8a���1,ǎ����r��:�j�t	4�/����ئ�R߷9g��li�T1z��>�98�������u��������*�5`!����܈�f����TA�|�<�<��W���ߧv��n�L]$8B�a� ���:� ����"�c��m���.���6�Z�Ga!���+z~�[��>bVxe ��ڏ�}6�S����:�~If�P@Q_؟������L��[㲅~@cr���1,*���h�AyZ��R��( ��_�x�����+o:�������#�ۧ"V�0��B�U���I��@���T���k۵��>jQ
Y�	�������lm8R���?
����bKދ�yg-����I���:}�PIq�,����idM%��
Y�ǉ�|%����	��`��cJK���=6)�Y+	q?����ɣ�\�I
"fE����jGZ(�<+-��S�N0�}?Şn�%g�����7|�̚
#e鱡�{���7*�3���<�������~�6��5����d��+Qb�8��3d��Z�>��� e�`�OV ��4�]�E8�r<ڼw]�n�*�������7#�@BpA�R�ߒZ�P:�,Ā�k^��`�%E2�"��-�e��9��%��ǃwxK<�s��^�c�0�l�}k�!~�O��a�����7y S� �\y'R� �f��W�F���	��=�	Ix�����w��q�Ǭ1�������т&
X�^v�l�rp1~D����4[I�,�)��d}�P�����:Gg������4Эt����[��V�=ݚk�cJ	�t�6SkJC���ͅ����+t&�w��$���	M�÷5��t���'�tN      1   g   x�5�1� �W�@_`l�Llm.p1$�
�O����X�``����H��a�L�Q!l�Z�y���T����2��9�@;�i����P������O�>."�p4#Q      3   D   x�3�t,*9�6�4'�X!%U!'3� 3�*��M"9?����499���<.KN�����Լ�D�@� �w�      5   J   x�34�4�4�4a#C]s]S����Ĕ�b�?.CN\*���@�d�!��Ĝ��b����L�91z\\\ ��       7   L   x�=���@�7��r/鿎8�x�BC�AQ�3�5T�%�n�D�N�=��N3ԧ���6]��W�t�"y��      9   "   x�3�4�4�2�B.cNcN.N�H� 4u      ;   �   x�m�MN�0����@";�=ΎJ�,P7t�f�-cp��i"�;���� ����v�{�H�G:���+��fG�0���[�=Őh��N�lZ�4V�A��*��*[�=�h�w>|�{
�>=4Bl*��F�
著\,��D��#O�/*w�O�f4�V6?�FSɕu-�A������>��r�o���.�8	��?f.��3e�,ܸ��h���BKi^�S�T}L�;��7ͼ�!��vv����uQ���k      =   �   x�}��N�0�s�}Җ��Im�	�綗Rf��`��L��qcbb2�I��}�C�n�.2R��Qդ�Z]�ʭ�͆����y3��d�� ��!Aё�H(����?b��l�}Wܕ����6���?"�;�(K!����Y!����U�#if��o�[;fE/��G~�@�֪Z��ݽ&r���B�����}/L�������ì~�T�ے�<��Kd�!b[�M/���}v�0Ɵ��jP      ?   8   x�3�J-�,�<�9�ˈ�1�$�,�˘�-3/1'�*1%�˄�%5/5Č���� �&�      A   %   x�3�H�K�L�+I�2�tN�KN�ILI����� ��:      C       x�3�tL.�,K�2�tI-N�S�b���� x��      E   I   x�3�H�K�L�+I�2�JM�H�JLI�2��2�3o��2�t�S((�ON-��2���)M���)����� ��      G   /   x�3�t�,.���L�I�2��O.-HL��2�.-.H�K�rb���� �j      I   9   x�3�t�,.���L�I�2��O.-HL��2�.-.H�K�rL8�R�S��@1z\\\ �;\      K   8   x�3�t�S(�ON-��2�JM�ɬJL��2��3�2�LN�ļ���p� ���      M   &   x�3�tL.�,��2�tI-�HL���,IL������ �|�      O   '   x�3�t�,.���L�I�2�.-.H�K�L������ ��	Y      Q   0   x�3�t��K�ɬJLI�2��/R��IMO,�2�tL.�,K����� ���      S   P   x�e���0�7�
Ғ]��u~�~�F1qsˁP'��ڪ�]:KK6�ϕ5z����M6%�pM�D¡Y�T�+� �      U   C   x�3�43H5174H34O1J��*H�4�2�&[������s�r�DS�L�R��jM�b���� m�      W   6   x�3�tv�u��2����MJ-ʩ�u�I,��2����q���2���vu����� !`      Y     x�M�An�0E��)|��6x�Z��� l�nZ*(p��D��zo�:�ໞ�k���5RX�o�	oӰ�.�D�~\۵7�<
�aP�NӜ�K�n)o
��	wLu�H��Xŀ���� |'�Bg�T�(sR�u�(� ;08L�`��݂�+�*��]��J�A,�:�6]���
�t��xEbp4�H��]oz�c��&�Z�����4<x|fm�a�x��=،
��+ɶ����"�6"�;���]�d|�v����j�      [     x�]�MK�@���̇����cA=���[�j#����@cf6��3����4���B��~^3�����D��~��H��,�L�ӸDA����}�:/��e�<���p]��������i��^ݎ�n	
�ъ�Iɨ�fTYш�jTS��8�F��X8:�p,��cI
,���EᨪpT[၃S8�+%�8�h���ñ���(<r��n
���Q��&Q�SP8*82m�����K�R{8�����Y8�+%
G���
G%����#���Z8�������į7��l�K      ]   =   x�3�4�4b##C]s]3.cNc��!��)X�Y��I�%�9X �.fh����� �      _   ~  x�e��r�0��^��-���w�ShH��If��t#�E���Q�C�V�>B^,2�E';it��;�"���`O�N��A�v��B��G#���"WH�p��gH�R�m�EQhH�� ����q��M�#$�Db&�Q�q!U��������?���5�����#��¡��C�m����Y�q�bH	Ʊ�gP��[ų��O��(� ���Ap��_�G�eD�(���,״��n��i�.��w��=S�Y:��U�7a��)U΢R�:����ۧ��^���}��7�l?�K%8R�8��R4�[��{��!�^�����X���\��s�>��a��d��IO<Y� ���/җ�e?�ӛ�����}U�f���u���(��rƘl      a      x�3�4�4����� 	_      c   4   x�3��M�+I����L�+��2����-�L�J�2�t�,.)-J������� I?�      e   ,   x�3�t�IJ<�13�ˈ�'3� 3�*�˘�)?%5=�+F��� ��
�      g   '   x�3���)�M��2�H-��2�t�))-J����� ��^      i   &   x�3�tL����,.)JL�/�2�tN,N-I����� ��      k   )   x�3�4���,)�/�2�42�����9�9}S��1z\\\ ��	}      m   R  x�e�Kn�0 ���Y�M�c�]!P���R76�HHZr��G�bMJwՌFi>z` �ӱ��Q.c��.�Nu	��p�FP����\�VZz��q�^���ٻ�� !�A�A��ƅ�osUri`�(�)z��q?\ϡ�ߦ�?�I�>�.�j��e*�,���Re2SU�����PG_�2U��/�)7z���f,L�SY;��b�o�pF=`��ODmD~�)\�r��Y�C(�kmՖ6Ts�z�������fr>����xf�2x!�i�	�e���I��n�����l�������ib���%���栓����Kf7�kY���{�      o   �   x�}�A� �5�b.Pӡ���uc��ZL0J{/��ńذh�������p�j�U�U�䢉��P)\I��t��(Pf�|�-j���ggC��x�-Y$HX��B��΂�~bo�����������+��3�B��W��gE��l�KĶ�'�tL�w���폆ck
���W@Q�.0�v���@)�g��      q   m   x�3�)*��.�LI�Qp+-)-��4426153�е��� �LL���8�R�SK9}�R�8�� ��A������˄�#�()����9�(/5d��!�a�f&\1z\\\ ��@     