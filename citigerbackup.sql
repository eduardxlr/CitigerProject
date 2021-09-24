PGDMP                         y            CitigerProject    13.4    13.4 O   �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16565    CitigerProject    DATABASE     r   CREATE DATABASE "CitigerProject" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_El Salvador.1252';
     DROP DATABASE "CitigerProject";
                postgres    false                       1255    16566    sp_historialinventario()    FUNCTION     �   CREATE FUNCTION public.sp_historialinventario() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO historialInventario(idMaterial, cantidad, fecha) VALUES(old.idMaterial, old.cantidad, current_date);
RETURN NEW;
END
$$;
 /   DROP FUNCTION public.sp_historialinventario();
       public          postgres    false            �            1259    16567    alquiler    TABLE     ^  CREATE TABLE public.alquiler (
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
       public         heap    postgres    false            �            1259    16573    alquiler_idalquiler_seq    SEQUENCE     �   CREATE SEQUENCE public.alquiler_idalquiler_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.alquiler_idalquiler_seq;
       public          postgres    false    200            �           0    0    alquiler_idalquiler_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.alquiler_idalquiler_seq OWNED BY public.alquiler.idalquiler;
          public          postgres    false    201            �            1259    16575 
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
       public         heap    postgres    false            �            1259    16581    aportacion_idaportacion_seq    SEQUENCE     �   CREATE SEQUENCE public.aportacion_idaportacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.aportacion_idaportacion_seq;
       public          postgres    false    202            �           0    0    aportacion_idaportacion_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.aportacion_idaportacion_seq OWNED BY public.aportacion.idaportacion;
          public          postgres    false    203            �            1259    16583    bitacora    TABLE       CREATE TABLE public.bitacora (
    idbitacora integer NOT NULL,
    idusuario integer NOT NULL,
    hora time without time zone NOT NULL,
    fecha date NOT NULL,
    accion character varying(20) NOT NULL,
    descripcion character varying(200) NOT NULL
);
    DROP TABLE public.bitacora;
       public         heap    postgres    false            �            1259    16586    bitacora_idbitacora_seq    SEQUENCE     �   CREATE SEQUENCE public.bitacora_idbitacora_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.bitacora_idbitacora_seq;
       public          postgres    false    204            �           0    0    bitacora_idbitacora_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.bitacora_idbitacora_seq OWNED BY public.bitacora.idbitacora;
          public          postgres    false    205                       1259    17445    bitacoraresidente    TABLE       CREATE TABLE public.bitacoraresidente (
    idbitacora integer NOT NULL,
    idresidente integer NOT NULL,
    hora time without time zone NOT NULL,
    fecha date NOT NULL,
    accion character varying(20) NOT NULL,
    descripcion character varying(200) NOT NULL
);
 %   DROP TABLE public.bitacoraresidente;
       public         heap    postgres    false                       1259    17443     bitacoraresidente_idbitacora_seq    SEQUENCE     �   CREATE SEQUENCE public.bitacoraresidente_idbitacora_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.bitacoraresidente_idbitacora_seq;
       public          postgres    false    273            �           0    0     bitacoraresidente_idbitacora_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.bitacoraresidente_idbitacora_seq OWNED BY public.bitacoraresidente.idbitacora;
          public          postgres    false    272            �            1259    16588    casa    TABLE     �   CREATE TABLE public.casa (
    idcasa integer NOT NULL,
    idestadocasa integer NOT NULL,
    numerocasa numeric NOT NULL,
    direccion character varying(200) NOT NULL
);
    DROP TABLE public.casa;
       public         heap    postgres    false            �            1259    16594    casa_idcasa_seq    SEQUENCE     �   CREATE SEQUENCE public.casa_idcasa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.casa_idcasa_seq;
       public          postgres    false    206            �           0    0    casa_idcasa_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.casa_idcasa_seq OWNED BY public.casa.idcasa;
          public          postgres    false    207            �            1259    16596 	   categoria    TABLE     r   CREATE TABLE public.categoria (
    idcategoria integer NOT NULL,
    categoria character varying(40) NOT NULL
);
    DROP TABLE public.categoria;
       public         heap    postgres    false            �            1259    16599    categoria_idcategoria_seq    SEQUENCE     �   CREATE SEQUENCE public.categoria_idcategoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.categoria_idcategoria_seq;
       public          postgres    false    208            �           0    0    categoria_idcategoria_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.categoria_idcategoria_seq OWNED BY public.categoria.idcategoria;
          public          postgres    false    209            �            1259    16601    denuncia    TABLE     8  CREATE TABLE public.denuncia (
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
       public         heap    postgres    false            �            1259    16604    denuncia_iddenuncia_seq    SEQUENCE     �   CREATE SEQUENCE public.denuncia_iddenuncia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.denuncia_iddenuncia_seq;
       public          postgres    false    210            �           0    0    denuncia_iddenuncia_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.denuncia_iddenuncia_seq OWNED BY public.denuncia.iddenuncia;
          public          postgres    false    211            �            1259    16606    detallematerial    TABLE     �   CREATE TABLE public.detallematerial (
    iddetallematerial integer NOT NULL,
    idpedido integer NOT NULL,
    idmaterial integer NOT NULL,
    preciomaterial numeric NOT NULL,
    cantidadmaterial numeric NOT NULL
);
 #   DROP TABLE public.detallematerial;
       public         heap    postgres    false            �            1259    16612 %   detallematerial_iddetallematerial_seq    SEQUENCE     �   CREATE SEQUENCE public.detallematerial_iddetallematerial_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.detallematerial_iddetallematerial_seq;
       public          postgres    false    212            �           0    0 %   detallematerial_iddetallematerial_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.detallematerial_iddetallematerial_seq OWNED BY public.detallematerial.iddetallematerial;
          public          postgres    false    213            �            1259    16614    detallevisita    TABLE     �   CREATE TABLE public.detallevisita (
    iddetallevisita integer NOT NULL,
    idvisita integer NOT NULL,
    idvisitante integer NOT NULL
);
 !   DROP TABLE public.detallevisita;
       public         heap    postgres    false            �            1259    16617 !   detallevisita_iddetallevisita_seq    SEQUENCE     �   CREATE SEQUENCE public.detallevisita_iddetallevisita_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.detallevisita_iddetallevisita_seq;
       public          postgres    false    214            �           0    0 !   detallevisita_iddetallevisita_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.detallevisita_iddetallevisita_seq OWNED BY public.detallevisita.iddetallevisita;
          public          postgres    false    215            �            1259    16619    empleado    TABLE     �  CREATE TABLE public.empleado (
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
       public         heap    postgres    false            �            1259    16622    empleado_idempleado_seq    SEQUENCE     �   CREATE SEQUENCE public.empleado_idempleado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.empleado_idempleado_seq;
       public          postgres    false    216            �           0    0    empleado_idempleado_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.empleado_idempleado_seq OWNED BY public.empleado.idempleado;
          public          postgres    false    217            �            1259    16624    espacio    TABLE       CREATE TABLE public.espacio (
    idespacio integer NOT NULL,
    idestadoespacio integer NOT NULL,
    nombre character varying(30) NOT NULL,
    descripcion character varying(200) NOT NULL,
    capacidad numeric NOT NULL,
    imagenprincipal character varying(50)
);
    DROP TABLE public.espacio;
       public         heap    postgres    false            �            1259    16630    espacio_idespacio_seq    SEQUENCE     �   CREATE SEQUENCE public.espacio_idespacio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.espacio_idespacio_seq;
       public          postgres    false    218            �           0    0    espacio_idespacio_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.espacio_idespacio_seq OWNED BY public.espacio.idespacio;
          public          postgres    false    219            �            1259    16632    estadoalquiler    TABLE     �   CREATE TABLE public.estadoalquiler (
    idestadoalquiler integer NOT NULL,
    estadoalquiler character varying(15) NOT NULL
);
 "   DROP TABLE public.estadoalquiler;
       public         heap    postgres    false            �            1259    16635 #   estadoalquiler_idestadoalquiler_seq    SEQUENCE     �   CREATE SEQUENCE public.estadoalquiler_idestadoalquiler_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.estadoalquiler_idestadoalquiler_seq;
       public          postgres    false    220            �           0    0 #   estadoalquiler_idestadoalquiler_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.estadoalquiler_idestadoalquiler_seq OWNED BY public.estadoalquiler.idestadoalquiler;
          public          postgres    false    221            �            1259    16637    estadoaportacion    TABLE     �   CREATE TABLE public.estadoaportacion (
    idestadoaportacion integer NOT NULL,
    estadoaportacion character varying(15) NOT NULL
);
 $   DROP TABLE public.estadoaportacion;
       public         heap    postgres    false            �            1259    16640 '   estadoaportacion_idestadoaportacion_seq    SEQUENCE     �   CREATE SEQUENCE public.estadoaportacion_idestadoaportacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.estadoaportacion_idestadoaportacion_seq;
       public          postgres    false    222            �           0    0 '   estadoaportacion_idestadoaportacion_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public.estadoaportacion_idestadoaportacion_seq OWNED BY public.estadoaportacion.idestadoaportacion;
          public          postgres    false    223            �            1259    16642 
   estadocasa    TABLE     u   CREATE TABLE public.estadocasa (
    idestadocasa integer NOT NULL,
    estadocasa character varying(15) NOT NULL
);
    DROP TABLE public.estadocasa;
       public         heap    postgres    false            �            1259    16645    estadocasa_idestadocasa_seq    SEQUENCE     �   CREATE SEQUENCE public.estadocasa_idestadocasa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.estadocasa_idestadocasa_seq;
       public          postgres    false    224            �           0    0    estadocasa_idestadocasa_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.estadocasa_idestadocasa_seq OWNED BY public.estadocasa.idestadocasa;
          public          postgres    false    225            �            1259    16647    estadodenuncia    TABLE     �   CREATE TABLE public.estadodenuncia (
    idestadodenuncia integer NOT NULL,
    estadodenuncia character varying(15) NOT NULL
);
 "   DROP TABLE public.estadodenuncia;
       public         heap    postgres    false            �            1259    16650 #   estadodenuncia_idestadodenuncia_seq    SEQUENCE     �   CREATE SEQUENCE public.estadodenuncia_idestadodenuncia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.estadodenuncia_idestadodenuncia_seq;
       public          postgres    false    226            �           0    0 #   estadodenuncia_idestadodenuncia_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.estadodenuncia_idestadodenuncia_seq OWNED BY public.estadodenuncia.idestadodenuncia;
          public          postgres    false    227            �            1259    16652    estadoempleado    TABLE     �   CREATE TABLE public.estadoempleado (
    idestadoempleado integer NOT NULL,
    estadoempleado character varying(20) NOT NULL
);
 "   DROP TABLE public.estadoempleado;
       public         heap    postgres    false            �            1259    16655 #   estadoempleado_idestadoempleado_seq    SEQUENCE     �   CREATE SEQUENCE public.estadoempleado_idestadoempleado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.estadoempleado_idestadoempleado_seq;
       public          postgres    false    228            �           0    0 #   estadoempleado_idestadoempleado_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.estadoempleado_idestadoempleado_seq OWNED BY public.estadoempleado.idestadoempleado;
          public          postgres    false    229            �            1259    16657    estadoespacio    TABLE     ~   CREATE TABLE public.estadoespacio (
    idestadoespacio integer NOT NULL,
    estadoespacio character varying(15) NOT NULL
);
 !   DROP TABLE public.estadoespacio;
       public         heap    postgres    false            �            1259    16660 !   estadoespacio_idestadoespacio_seq    SEQUENCE     �   CREATE SEQUENCE public.estadoespacio_idestadoespacio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.estadoespacio_idestadoespacio_seq;
       public          postgres    false    230            �           0    0 !   estadoespacio_idestadoespacio_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.estadoespacio_idestadoespacio_seq OWNED BY public.estadoespacio.idestadoespacio;
          public          postgres    false    231            �            1259    16662    estadopedido    TABLE     {   CREATE TABLE public.estadopedido (
    idestadopedido integer NOT NULL,
    estadopedido character varying(15) NOT NULL
);
     DROP TABLE public.estadopedido;
       public         heap    postgres    false            �            1259    16665    estadopedido_idestadopedido_seq    SEQUENCE     �   CREATE SEQUENCE public.estadopedido_idestadopedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.estadopedido_idestadopedido_seq;
       public          postgres    false    232            �           0    0    estadopedido_idestadopedido_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.estadopedido_idestadopedido_seq OWNED BY public.estadopedido.idestadopedido;
          public          postgres    false    233            �            1259    16667    estadoresidente    TABLE     �   CREATE TABLE public.estadoresidente (
    idestadoresidente integer NOT NULL,
    estadoresidente character varying(15) NOT NULL
);
 #   DROP TABLE public.estadoresidente;
       public         heap    postgres    false            �            1259    16670 %   estadoresidente_idestadoresidente_seq    SEQUENCE     �   CREATE SEQUENCE public.estadoresidente_idestadoresidente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.estadoresidente_idestadoresidente_seq;
       public          postgres    false    234            �           0    0 %   estadoresidente_idestadoresidente_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.estadoresidente_idestadoresidente_seq OWNED BY public.estadoresidente.idestadoresidente;
          public          postgres    false    235            �            1259    16672    estadousuario    TABLE     ~   CREATE TABLE public.estadousuario (
    idestadousuario integer NOT NULL,
    estadousuario character varying(20) NOT NULL
);
 !   DROP TABLE public.estadousuario;
       public         heap    postgres    false            �            1259    16675 !   estadousuario_idestadousuario_seq    SEQUENCE     �   CREATE SEQUENCE public.estadousuario_idestadousuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.estadousuario_idestadousuario_seq;
       public          postgres    false    236            �           0    0 !   estadousuario_idestadousuario_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.estadousuario_idestadousuario_seq OWNED BY public.estadousuario.idestadousuario;
          public          postgres    false    237            �            1259    16677    estadovisita    TABLE     {   CREATE TABLE public.estadovisita (
    idestadovisita integer NOT NULL,
    estadovisita character varying(15) NOT NULL
);
     DROP TABLE public.estadovisita;
       public         heap    postgres    false            �            1259    16680    estadovisita_idestadovisita_seq    SEQUENCE     �   CREATE SEQUENCE public.estadovisita_idestadovisita_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.estadovisita_idestadovisita_seq;
       public          postgres    false    238            �           0    0    estadovisita_idestadovisita_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.estadovisita_idestadovisita_seq OWNED BY public.estadovisita.idestadovisita;
          public          postgres    false    239            �            1259    16682    historialinventario    TABLE     �   CREATE TABLE public.historialinventario (
    idhistorialinventario integer NOT NULL,
    idmaterial integer NOT NULL,
    cantidad numeric NOT NULL,
    fecha date NOT NULL
);
 '   DROP TABLE public.historialinventario;
       public         heap    postgres    false            �            1259    16688 -   historialinventario_idhistorialinventario_seq    SEQUENCE     �   CREATE SEQUENCE public.historialinventario_idhistorialinventario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 D   DROP SEQUENCE public.historialinventario_idhistorialinventario_seq;
       public          postgres    false    240            �           0    0 -   historialinventario_idhistorialinventario_seq    SEQUENCE OWNED BY        ALTER SEQUENCE public.historialinventario_idhistorialinventario_seq OWNED BY public.historialinventario.idhistorialinventario;
          public          postgres    false    241            �            1259    16690    imagenesespacio    TABLE     �   CREATE TABLE public.imagenesespacio (
    idimagenesespacio integer NOT NULL,
    imagen character varying(50),
    idespacio integer
);
 #   DROP TABLE public.imagenesespacio;
       public         heap    postgres    false            �            1259    16693 %   imagenesespacio_idimagenesespacio_seq    SEQUENCE     �   CREATE SEQUENCE public.imagenesespacio_idimagenesespacio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.imagenesespacio_idimagenesespacio_seq;
       public          postgres    false    242            �           0    0 %   imagenesespacio_idimagenesespacio_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.imagenesespacio_idimagenesespacio_seq OWNED BY public.imagenesespacio.idimagenesespacio;
          public          postgres    false    243            �            1259    16695    marca    TABLE     f   CREATE TABLE public.marca (
    idmarca integer NOT NULL,
    marca character varying(15) NOT NULL
);
    DROP TABLE public.marca;
       public         heap    postgres    false            �            1259    16698    marca_idmarca_seq    SEQUENCE     �   CREATE SEQUENCE public.marca_idmarca_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.marca_idmarca_seq;
       public          postgres    false    244            �           0    0    marca_idmarca_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.marca_idmarca_seq OWNED BY public.marca.idmarca;
          public          postgres    false    245            �            1259    16700    material    TABLE     �  CREATE TABLE public.material (
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
       public         heap    postgres    false            �            1259    16706    material_idmaterial_seq    SEQUENCE     �   CREATE SEQUENCE public.material_idmaterial_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.material_idmaterial_seq;
       public          postgres    false    246            �           0    0    material_idmaterial_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.material_idmaterial_seq OWNED BY public.material.idmaterial;
          public          postgres    false    247            �            1259    16708    mespago    TABLE     �   CREATE TABLE public.mespago (
    idmespago integer NOT NULL,
    mes character varying(10) NOT NULL,
    ano numeric NOT NULL
);
    DROP TABLE public.mespago;
       public         heap    postgres    false            �            1259    16714    mespago_idmespago_seq    SEQUENCE     �   CREATE SEQUENCE public.mespago_idmespago_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.mespago_idmespago_seq;
       public          postgres    false    248            �           0    0    mespago_idmespago_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.mespago_idmespago_seq OWNED BY public.mespago.idmespago;
          public          postgres    false    249            �            1259    16716    pedido    TABLE     �   CREATE TABLE public.pedido (
    idpedido integer NOT NULL,
    idestadopedido integer NOT NULL,
    idusuario integer NOT NULL,
    idempleado integer,
    fechapedido date NOT NULL
);
    DROP TABLE public.pedido;
       public         heap    postgres    false            �            1259    16719    pedido_idpedido_seq    SEQUENCE     �   CREATE SEQUENCE public.pedido_idpedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.pedido_idpedido_seq;
       public          postgres    false    250            �           0    0    pedido_idpedido_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.pedido_idpedido_seq OWNED BY public.pedido.idpedido;
          public          postgres    false    251                       1259    17458    permiso    TABLE     l   CREATE TABLE public.permiso (
    idpermiso integer NOT NULL,
    permiso character varying(30) NOT NULL
);
    DROP TABLE public.permiso;
       public         heap    postgres    false                       1259    17456    permiso_idpermiso_seq    SEQUENCE     �   CREATE SEQUENCE public.permiso_idpermiso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.permiso_idpermiso_seq;
       public          postgres    false    275            �           0    0    permiso_idpermiso_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.permiso_idpermiso_seq OWNED BY public.permiso.idpermiso;
          public          postgres    false    274                       1259    17466    permisousuario    TABLE     �   CREATE TABLE public.permisousuario (
    idpermisousuario integer NOT NULL,
    idtipousuario integer NOT NULL,
    idpermiso integer NOT NULL,
    permitido character(1) NOT NULL
);
 "   DROP TABLE public.permisousuario;
       public         heap    postgres    false                       1259    17464 #   permisousuario_idpermisousuario_seq    SEQUENCE     �   CREATE SEQUENCE public.permisousuario_idpermisousuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.permisousuario_idpermisousuario_seq;
       public          postgres    false    277            �           0    0 #   permisousuario_idpermisousuario_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.permisousuario_idpermisousuario_seq OWNED BY public.permisousuario.idpermisousuario;
          public          postgres    false    276            �            1259    16721 	   residente    TABLE     l  CREATE TABLE public.residente (
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
    modo character varying(6),
    intentos integer NOT NULL,
    codigo integer
);
    DROP TABLE public.residente;
       public         heap    postgres    false            �            1259    16724    residente_idresidente_seq    SEQUENCE     �   CREATE SEQUENCE public.residente_idresidente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.residente_idresidente_seq;
       public          postgres    false    252            �           0    0    residente_idresidente_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.residente_idresidente_seq OWNED BY public.residente.idresidente;
          public          postgres    false    253            �            1259    16726    residentecasa    TABLE     �   CREATE TABLE public.residentecasa (
    idresidentecasa integer NOT NULL,
    idresidente integer NOT NULL,
    idcasa integer NOT NULL
);
 !   DROP TABLE public.residentecasa;
       public         heap    postgres    false            �            1259    16729 !   residentecasa_idresidentecasa_seq    SEQUENCE     �   CREATE SEQUENCE public.residentecasa_idresidentecasa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.residentecasa_idresidentecasa_seq;
       public          postgres    false    254            �           0    0 !   residentecasa_idresidentecasa_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.residentecasa_idresidentecasa_seq OWNED BY public.residentecasa.idresidentecasa;
          public          postgres    false    255                        1259    16731    tipodenuncia    TABLE     {   CREATE TABLE public.tipodenuncia (
    idtipodenuncia integer NOT NULL,
    tipodenuncia character varying(15) NOT NULL
);
     DROP TABLE public.tipodenuncia;
       public         heap    postgres    false                       1259    16734    tipodenuncia_idtipodenuncia_seq    SEQUENCE     �   CREATE SEQUENCE public.tipodenuncia_idtipodenuncia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.tipodenuncia_idtipodenuncia_seq;
       public          postgres    false    256            �           0    0    tipodenuncia_idtipodenuncia_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.tipodenuncia_idtipodenuncia_seq OWNED BY public.tipodenuncia.idtipodenuncia;
          public          postgres    false    257                       1259    16736    tipoempleado    TABLE     {   CREATE TABLE public.tipoempleado (
    idtipoempleado integer NOT NULL,
    tipoempleado character varying(15) NOT NULL
);
     DROP TABLE public.tipoempleado;
       public         heap    postgres    false                       1259    16739    tipoempleado_idtipoempleado_seq    SEQUENCE     �   CREATE SEQUENCE public.tipoempleado_idtipoempleado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.tipoempleado_idtipoempleado_seq;
       public          postgres    false    258            �           0    0    tipoempleado_idtipoempleado_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.tipoempleado_idtipoempleado_seq OWNED BY public.tipoempleado.idtipoempleado;
          public          postgres    false    259                       1259    16741 
   tipounidad    TABLE     u   CREATE TABLE public.tipounidad (
    idtipounidad integer NOT NULL,
    tipounidad character varying(20) NOT NULL
);
    DROP TABLE public.tipounidad;
       public         heap    postgres    false                       1259    16744    tipounidad_idtipounidad_seq    SEQUENCE     �   CREATE SEQUENCE public.tipounidad_idtipounidad_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.tipounidad_idtipounidad_seq;
       public          postgres    false    260            �           0    0    tipounidad_idtipounidad_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.tipounidad_idtipounidad_seq OWNED BY public.tipounidad.idtipounidad;
          public          postgres    false    261                       1259    16746    tipousuario    TABLE     x   CREATE TABLE public.tipousuario (
    idtipousuario integer NOT NULL,
    tipousuario character varying(15) NOT NULL
);
    DROP TABLE public.tipousuario;
       public         heap    postgres    false                       1259    16749    tipousuario_idtipousuario_seq    SEQUENCE     �   CREATE SEQUENCE public.tipousuario_idtipousuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.tipousuario_idtipousuario_seq;
       public          postgres    false    262            �           0    0    tipousuario_idtipousuario_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.tipousuario_idtipousuario_seq OWNED BY public.tipousuario.idtipousuario;
          public          postgres    false    263                       1259    16751    unidadmedida    TABLE     �   CREATE TABLE public.unidadmedida (
    idunidadmedida integer NOT NULL,
    idtipounidad integer NOT NULL,
    unidadmedida character varying(15) NOT NULL
);
     DROP TABLE public.unidadmedida;
       public         heap    postgres    false            	           1259    16754    unidadmedida_idunidadmedida_seq    SEQUENCE     �   CREATE SEQUENCE public.unidadmedida_idunidadmedida_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.unidadmedida_idunidadmedida_seq;
       public          postgres    false    264            �           0    0    unidadmedida_idunidadmedida_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.unidadmedida_idunidadmedida_seq OWNED BY public.unidadmedida.idunidadmedida;
          public          postgres    false    265            
           1259    16756    usuario    TABLE     �  CREATE TABLE public.usuario (
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
    modo character varying(6),
    intentos integer NOT NULL,
    codigo integer
);
    DROP TABLE public.usuario;
       public         heap    postgres    false                       1259    16759    usuario_idusuario_seq    SEQUENCE     �   CREATE SEQUENCE public.usuario_idusuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.usuario_idusuario_seq;
       public          postgres    false    266            �           0    0    usuario_idusuario_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.usuario_idusuario_seq OWNED BY public.usuario.idusuario;
          public          postgres    false    267                       1259    16761    visita    TABLE     �   CREATE TABLE public.visita (
    idvisita integer NOT NULL,
    idresidente integer NOT NULL,
    fecha date NOT NULL,
    visitarecurrente character(2) NOT NULL,
    observacion character varying(200) NOT NULL,
    idestadovisita integer NOT NULL
);
    DROP TABLE public.visita;
       public         heap    postgres    false                       1259    16764    visita_idvisita_seq    SEQUENCE     �   CREATE SEQUENCE public.visita_idvisita_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.visita_idvisita_seq;
       public          postgres    false    268            �           0    0    visita_idvisita_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.visita_idvisita_seq OWNED BY public.visita.idvisita;
          public          postgres    false    269                       1259    16766 	   visitante    TABLE       CREATE TABLE public.visitante (
    idvisitante integer NOT NULL,
    nombre character varying(30) NOT NULL,
    apellido character varying(30) NOT NULL,
    dui character(10) NOT NULL,
    genero character(1) NOT NULL,
    placa character varying(10) NOT NULL
);
    DROP TABLE public.visitante;
       public         heap    postgres    false                       1259    16769    visitante_idvisitante_seq    SEQUENCE     �   CREATE SEQUENCE public.visitante_idvisitante_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.visitante_idvisitante_seq;
       public          postgres    false    270            �           0    0    visitante_idvisitante_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.visitante_idvisitante_seq OWNED BY public.visitante.idvisitante;
          public          postgres    false    271                       2604    16771    alquiler idalquiler    DEFAULT     z   ALTER TABLE ONLY public.alquiler ALTER COLUMN idalquiler SET DEFAULT nextval('public.alquiler_idalquiler_seq'::regclass);
 B   ALTER TABLE public.alquiler ALTER COLUMN idalquiler DROP DEFAULT;
       public          postgres    false    201    200                       2604    16772    aportacion idaportacion    DEFAULT     �   ALTER TABLE ONLY public.aportacion ALTER COLUMN idaportacion SET DEFAULT nextval('public.aportacion_idaportacion_seq'::regclass);
 F   ALTER TABLE public.aportacion ALTER COLUMN idaportacion DROP DEFAULT;
       public          postgres    false    203    202                       2604    16773    bitacora idbitacora    DEFAULT     z   ALTER TABLE ONLY public.bitacora ALTER COLUMN idbitacora SET DEFAULT nextval('public.bitacora_idbitacora_seq'::regclass);
 B   ALTER TABLE public.bitacora ALTER COLUMN idbitacora DROP DEFAULT;
       public          postgres    false    205    204            3           2604    17448    bitacoraresidente idbitacora    DEFAULT     �   ALTER TABLE ONLY public.bitacoraresidente ALTER COLUMN idbitacora SET DEFAULT nextval('public.bitacoraresidente_idbitacora_seq'::regclass);
 K   ALTER TABLE public.bitacoraresidente ALTER COLUMN idbitacora DROP DEFAULT;
       public          postgres    false    272    273    273                       2604    16774    casa idcasa    DEFAULT     j   ALTER TABLE ONLY public.casa ALTER COLUMN idcasa SET DEFAULT nextval('public.casa_idcasa_seq'::regclass);
 :   ALTER TABLE public.casa ALTER COLUMN idcasa DROP DEFAULT;
       public          postgres    false    207    206                       2604    16775    categoria idcategoria    DEFAULT     ~   ALTER TABLE ONLY public.categoria ALTER COLUMN idcategoria SET DEFAULT nextval('public.categoria_idcategoria_seq'::regclass);
 D   ALTER TABLE public.categoria ALTER COLUMN idcategoria DROP DEFAULT;
       public          postgres    false    209    208                       2604    16776    denuncia iddenuncia    DEFAULT     z   ALTER TABLE ONLY public.denuncia ALTER COLUMN iddenuncia SET DEFAULT nextval('public.denuncia_iddenuncia_seq'::regclass);
 B   ALTER TABLE public.denuncia ALTER COLUMN iddenuncia DROP DEFAULT;
       public          postgres    false    211    210                       2604    16777 !   detallematerial iddetallematerial    DEFAULT     �   ALTER TABLE ONLY public.detallematerial ALTER COLUMN iddetallematerial SET DEFAULT nextval('public.detallematerial_iddetallematerial_seq'::regclass);
 P   ALTER TABLE public.detallematerial ALTER COLUMN iddetallematerial DROP DEFAULT;
       public          postgres    false    213    212                       2604    16778    detallevisita iddetallevisita    DEFAULT     �   ALTER TABLE ONLY public.detallevisita ALTER COLUMN iddetallevisita SET DEFAULT nextval('public.detallevisita_iddetallevisita_seq'::regclass);
 L   ALTER TABLE public.detallevisita ALTER COLUMN iddetallevisita DROP DEFAULT;
       public          postgres    false    215    214                       2604    16779    empleado idempleado    DEFAULT     z   ALTER TABLE ONLY public.empleado ALTER COLUMN idempleado SET DEFAULT nextval('public.empleado_idempleado_seq'::regclass);
 B   ALTER TABLE public.empleado ALTER COLUMN idempleado DROP DEFAULT;
       public          postgres    false    217    216                       2604    16780    espacio idespacio    DEFAULT     v   ALTER TABLE ONLY public.espacio ALTER COLUMN idespacio SET DEFAULT nextval('public.espacio_idespacio_seq'::regclass);
 @   ALTER TABLE public.espacio ALTER COLUMN idespacio DROP DEFAULT;
       public          postgres    false    219    218                       2604    16781    estadoalquiler idestadoalquiler    DEFAULT     �   ALTER TABLE ONLY public.estadoalquiler ALTER COLUMN idestadoalquiler SET DEFAULT nextval('public.estadoalquiler_idestadoalquiler_seq'::regclass);
 N   ALTER TABLE public.estadoalquiler ALTER COLUMN idestadoalquiler DROP DEFAULT;
       public          postgres    false    221    220                       2604    16782 #   estadoaportacion idestadoaportacion    DEFAULT     �   ALTER TABLE ONLY public.estadoaportacion ALTER COLUMN idestadoaportacion SET DEFAULT nextval('public.estadoaportacion_idestadoaportacion_seq'::regclass);
 R   ALTER TABLE public.estadoaportacion ALTER COLUMN idestadoaportacion DROP DEFAULT;
       public          postgres    false    223    222                       2604    16783    estadocasa idestadocasa    DEFAULT     �   ALTER TABLE ONLY public.estadocasa ALTER COLUMN idestadocasa SET DEFAULT nextval('public.estadocasa_idestadocasa_seq'::regclass);
 F   ALTER TABLE public.estadocasa ALTER COLUMN idestadocasa DROP DEFAULT;
       public          postgres    false    225    224                       2604    16784    estadodenuncia idestadodenuncia    DEFAULT     �   ALTER TABLE ONLY public.estadodenuncia ALTER COLUMN idestadodenuncia SET DEFAULT nextval('public.estadodenuncia_idestadodenuncia_seq'::regclass);
 N   ALTER TABLE public.estadodenuncia ALTER COLUMN idestadodenuncia DROP DEFAULT;
       public          postgres    false    227    226                       2604    16785    estadoempleado idestadoempleado    DEFAULT     �   ALTER TABLE ONLY public.estadoempleado ALTER COLUMN idestadoempleado SET DEFAULT nextval('public.estadoempleado_idestadoempleado_seq'::regclass);
 N   ALTER TABLE public.estadoempleado ALTER COLUMN idestadoempleado DROP DEFAULT;
       public          postgres    false    229    228                       2604    16786    estadoespacio idestadoespacio    DEFAULT     �   ALTER TABLE ONLY public.estadoespacio ALTER COLUMN idestadoespacio SET DEFAULT nextval('public.estadoespacio_idestadoespacio_seq'::regclass);
 L   ALTER TABLE public.estadoespacio ALTER COLUMN idestadoespacio DROP DEFAULT;
       public          postgres    false    231    230                       2604    16787    estadopedido idestadopedido    DEFAULT     �   ALTER TABLE ONLY public.estadopedido ALTER COLUMN idestadopedido SET DEFAULT nextval('public.estadopedido_idestadopedido_seq'::regclass);
 J   ALTER TABLE public.estadopedido ALTER COLUMN idestadopedido DROP DEFAULT;
       public          postgres    false    233    232                        2604    16788 !   estadoresidente idestadoresidente    DEFAULT     �   ALTER TABLE ONLY public.estadoresidente ALTER COLUMN idestadoresidente SET DEFAULT nextval('public.estadoresidente_idestadoresidente_seq'::regclass);
 P   ALTER TABLE public.estadoresidente ALTER COLUMN idestadoresidente DROP DEFAULT;
       public          postgres    false    235    234            !           2604    16789    estadousuario idestadousuario    DEFAULT     �   ALTER TABLE ONLY public.estadousuario ALTER COLUMN idestadousuario SET DEFAULT nextval('public.estadousuario_idestadousuario_seq'::regclass);
 L   ALTER TABLE public.estadousuario ALTER COLUMN idestadousuario DROP DEFAULT;
       public          postgres    false    237    236            "           2604    16790    estadovisita idestadovisita    DEFAULT     �   ALTER TABLE ONLY public.estadovisita ALTER COLUMN idestadovisita SET DEFAULT nextval('public.estadovisita_idestadovisita_seq'::regclass);
 J   ALTER TABLE public.estadovisita ALTER COLUMN idestadovisita DROP DEFAULT;
       public          postgres    false    239    238            #           2604    16791 )   historialinventario idhistorialinventario    DEFAULT     �   ALTER TABLE ONLY public.historialinventario ALTER COLUMN idhistorialinventario SET DEFAULT nextval('public.historialinventario_idhistorialinventario_seq'::regclass);
 X   ALTER TABLE public.historialinventario ALTER COLUMN idhistorialinventario DROP DEFAULT;
       public          postgres    false    241    240            $           2604    16792 !   imagenesespacio idimagenesespacio    DEFAULT     �   ALTER TABLE ONLY public.imagenesespacio ALTER COLUMN idimagenesespacio SET DEFAULT nextval('public.imagenesespacio_idimagenesespacio_seq'::regclass);
 P   ALTER TABLE public.imagenesespacio ALTER COLUMN idimagenesespacio DROP DEFAULT;
       public          postgres    false    243    242            %           2604    16793    marca idmarca    DEFAULT     n   ALTER TABLE ONLY public.marca ALTER COLUMN idmarca SET DEFAULT nextval('public.marca_idmarca_seq'::regclass);
 <   ALTER TABLE public.marca ALTER COLUMN idmarca DROP DEFAULT;
       public          postgres    false    245    244            &           2604    16794    material idmaterial    DEFAULT     z   ALTER TABLE ONLY public.material ALTER COLUMN idmaterial SET DEFAULT nextval('public.material_idmaterial_seq'::regclass);
 B   ALTER TABLE public.material ALTER COLUMN idmaterial DROP DEFAULT;
       public          postgres    false    247    246            '           2604    16795    mespago idmespago    DEFAULT     v   ALTER TABLE ONLY public.mespago ALTER COLUMN idmespago SET DEFAULT nextval('public.mespago_idmespago_seq'::regclass);
 @   ALTER TABLE public.mespago ALTER COLUMN idmespago DROP DEFAULT;
       public          postgres    false    249    248            (           2604    16796    pedido idpedido    DEFAULT     r   ALTER TABLE ONLY public.pedido ALTER COLUMN idpedido SET DEFAULT nextval('public.pedido_idpedido_seq'::regclass);
 >   ALTER TABLE public.pedido ALTER COLUMN idpedido DROP DEFAULT;
       public          postgres    false    251    250            4           2604    17461    permiso idpermiso    DEFAULT     v   ALTER TABLE ONLY public.permiso ALTER COLUMN idpermiso SET DEFAULT nextval('public.permiso_idpermiso_seq'::regclass);
 @   ALTER TABLE public.permiso ALTER COLUMN idpermiso DROP DEFAULT;
       public          postgres    false    275    274    275            5           2604    17469    permisousuario idpermisousuario    DEFAULT     �   ALTER TABLE ONLY public.permisousuario ALTER COLUMN idpermisousuario SET DEFAULT nextval('public.permisousuario_idpermisousuario_seq'::regclass);
 N   ALTER TABLE public.permisousuario ALTER COLUMN idpermisousuario DROP DEFAULT;
       public          postgres    false    277    276    277            )           2604    16797    residente idresidente    DEFAULT     ~   ALTER TABLE ONLY public.residente ALTER COLUMN idresidente SET DEFAULT nextval('public.residente_idresidente_seq'::regclass);
 D   ALTER TABLE public.residente ALTER COLUMN idresidente DROP DEFAULT;
       public          postgres    false    253    252            *           2604    16798    residentecasa idresidentecasa    DEFAULT     �   ALTER TABLE ONLY public.residentecasa ALTER COLUMN idresidentecasa SET DEFAULT nextval('public.residentecasa_idresidentecasa_seq'::regclass);
 L   ALTER TABLE public.residentecasa ALTER COLUMN idresidentecasa DROP DEFAULT;
       public          postgres    false    255    254            +           2604    16799    tipodenuncia idtipodenuncia    DEFAULT     �   ALTER TABLE ONLY public.tipodenuncia ALTER COLUMN idtipodenuncia SET DEFAULT nextval('public.tipodenuncia_idtipodenuncia_seq'::regclass);
 J   ALTER TABLE public.tipodenuncia ALTER COLUMN idtipodenuncia DROP DEFAULT;
       public          postgres    false    257    256            ,           2604    16800    tipoempleado idtipoempleado    DEFAULT     �   ALTER TABLE ONLY public.tipoempleado ALTER COLUMN idtipoempleado SET DEFAULT nextval('public.tipoempleado_idtipoempleado_seq'::regclass);
 J   ALTER TABLE public.tipoempleado ALTER COLUMN idtipoempleado DROP DEFAULT;
       public          postgres    false    259    258            -           2604    16801    tipounidad idtipounidad    DEFAULT     �   ALTER TABLE ONLY public.tipounidad ALTER COLUMN idtipounidad SET DEFAULT nextval('public.tipounidad_idtipounidad_seq'::regclass);
 F   ALTER TABLE public.tipounidad ALTER COLUMN idtipounidad DROP DEFAULT;
       public          postgres    false    261    260            .           2604    16802    tipousuario idtipousuario    DEFAULT     �   ALTER TABLE ONLY public.tipousuario ALTER COLUMN idtipousuario SET DEFAULT nextval('public.tipousuario_idtipousuario_seq'::regclass);
 H   ALTER TABLE public.tipousuario ALTER COLUMN idtipousuario DROP DEFAULT;
       public          postgres    false    263    262            /           2604    16803    unidadmedida idunidadmedida    DEFAULT     �   ALTER TABLE ONLY public.unidadmedida ALTER COLUMN idunidadmedida SET DEFAULT nextval('public.unidadmedida_idunidadmedida_seq'::regclass);
 J   ALTER TABLE public.unidadmedida ALTER COLUMN idunidadmedida DROP DEFAULT;
       public          postgres    false    265    264            0           2604    16804    usuario idusuario    DEFAULT     v   ALTER TABLE ONLY public.usuario ALTER COLUMN idusuario SET DEFAULT nextval('public.usuario_idusuario_seq'::regclass);
 @   ALTER TABLE public.usuario ALTER COLUMN idusuario DROP DEFAULT;
       public          postgres    false    267    266            1           2604    16805    visita idvisita    DEFAULT     r   ALTER TABLE ONLY public.visita ALTER COLUMN idvisita SET DEFAULT nextval('public.visita_idvisita_seq'::regclass);
 >   ALTER TABLE public.visita ALTER COLUMN idvisita DROP DEFAULT;
       public          postgres    false    269    268            2           2604    16806    visitante idvisitante    DEFAULT     ~   ALTER TABLE ONLY public.visitante ALTER COLUMN idvisitante SET DEFAULT nextval('public.visitante_idvisitante_seq'::regclass);
 D   ALTER TABLE public.visitante ALTER COLUMN idvisitante DROP DEFAULT;
       public          postgres    false    271    270            P          0    16567    alquiler 
   TABLE DATA           �   COPY public.alquiler (idalquiler, idestadoalquiler, idespacio, precio, idusuario, idresidente, fecha, horainicio, horafin) FROM stdin;
    public          postgres    false    200   ��      R          0    16575 
   aportacion 
   TABLE DATA           x   COPY public.aportacion (idaportacion, idcasa, idestadoaportacion, monto, idmespago, fechapago, descripcion) FROM stdin;
    public          postgres    false    202   G�      T          0    16583    bitacora 
   TABLE DATA           [   COPY public.bitacora (idbitacora, idusuario, hora, fecha, accion, descripcion) FROM stdin;
    public          postgres    false    204   6�      �          0    17445    bitacoraresidente 
   TABLE DATA           f   COPY public.bitacoraresidente (idbitacora, idresidente, hora, fecha, accion, descripcion) FROM stdin;
    public          postgres    false    273   ��      V          0    16588    casa 
   TABLE DATA           K   COPY public.casa (idcasa, idestadocasa, numerocasa, direccion) FROM stdin;
    public          postgres    false    206   �      X          0    16596 	   categoria 
   TABLE DATA           ;   COPY public.categoria (idcategoria, categoria) FROM stdin;
    public          postgres    false    208   ��      Z          0    16601    denuncia 
   TABLE DATA           �   COPY public.denuncia (iddenuncia, idempleado, idresidente, idtipodenuncia, idestadodenuncia, fecha, descripcion, respuesta) FROM stdin;
    public          postgres    false    210   �      \          0    16606    detallematerial 
   TABLE DATA           t   COPY public.detallematerial (iddetallematerial, idpedido, idmaterial, preciomaterial, cantidadmaterial) FROM stdin;
    public          postgres    false    212   )�      ^          0    16614    detallevisita 
   TABLE DATA           O   COPY public.detallevisita (iddetallevisita, idvisita, idvisitante) FROM stdin;
    public          postgres    false    214   ��      `          0    16619    empleado 
   TABLE DATA           �   COPY public.empleado (idempleado, idestadoempleado, idtipoempleado, nombre, apellido, telefono, dui, genero, foto, direccion, correo, fechanacimiento) FROM stdin;
    public          postgres    false    216   ĳ      b          0    16624    espacio 
   TABLE DATA           n   COPY public.espacio (idespacio, idestadoespacio, nombre, descripcion, capacidad, imagenprincipal) FROM stdin;
    public          postgres    false    218   �      d          0    16632    estadoalquiler 
   TABLE DATA           J   COPY public.estadoalquiler (idestadoalquiler, estadoalquiler) FROM stdin;
    public          postgres    false    220   �      f          0    16637    estadoaportacion 
   TABLE DATA           P   COPY public.estadoaportacion (idestadoaportacion, estadoaportacion) FROM stdin;
    public          postgres    false    222   4�      h          0    16642 
   estadocasa 
   TABLE DATA           >   COPY public.estadocasa (idestadocasa, estadocasa) FROM stdin;
    public          postgres    false    224   i�      j          0    16647    estadodenuncia 
   TABLE DATA           J   COPY public.estadodenuncia (idestadodenuncia, estadodenuncia) FROM stdin;
    public          postgres    false    226   ��      l          0    16652    estadoempleado 
   TABLE DATA           J   COPY public.estadoempleado (idestadoempleado, estadoempleado) FROM stdin;
    public          postgres    false    228   �      n          0    16657    estadoespacio 
   TABLE DATA           G   COPY public.estadoespacio (idestadoespacio, estadoespacio) FROM stdin;
    public          postgres    false    230   1�      p          0    16662    estadopedido 
   TABLE DATA           D   COPY public.estadopedido (idestadopedido, estadopedido) FROM stdin;
    public          postgres    false    232   z�      r          0    16667    estadoresidente 
   TABLE DATA           M   COPY public.estadoresidente (idestadoresidente, estadoresidente) FROM stdin;
    public          postgres    false    234   ¸      t          0    16672    estadousuario 
   TABLE DATA           G   COPY public.estadousuario (idestadousuario, estadousuario) FROM stdin;
    public          postgres    false    236   ��      v          0    16677    estadovisita 
   TABLE DATA           D   COPY public.estadovisita (idestadovisita, estadovisita) FROM stdin;
    public          postgres    false    238   /�      x          0    16682    historialinventario 
   TABLE DATA           a   COPY public.historialinventario (idhistorialinventario, idmaterial, cantidad, fecha) FROM stdin;
    public          postgres    false    240   b�      z          0    16690    imagenesespacio 
   TABLE DATA           O   COPY public.imagenesespacio (idimagenesespacio, imagen, idespacio) FROM stdin;
    public          postgres    false    242   �      |          0    16695    marca 
   TABLE DATA           /   COPY public.marca (idmarca, marca) FROM stdin;
    public          postgres    false    244   4�      ~          0    16700    material 
   TABLE DATA           �   COPY public.material (idmaterial, nombreproducto, costo, imagen, idcategoria, "tamaño", descripcion, cantidad, idmarca, idunidadmedida) FROM stdin;
    public          postgres    false    246   z�      �          0    16708    mespago 
   TABLE DATA           6   COPY public.mespago (idmespago, mes, ano) FROM stdin;
    public          postgres    false    248   ��      �          0    16716    pedido 
   TABLE DATA           ^   COPY public.pedido (idpedido, idestadopedido, idusuario, idempleado, fechapedido) FROM stdin;
    public          postgres    false    250   ü      �          0    17458    permiso 
   TABLE DATA           5   COPY public.permiso (idpermiso, permiso) FROM stdin;
    public          postgres    false    275   �      �          0    17466    permisousuario 
   TABLE DATA           _   COPY public.permisousuario (idpermisousuario, idtipousuario, idpermiso, permitido) FROM stdin;
    public          postgres    false    277   r�      �          0    16721 	   residente 
   TABLE DATA           �   COPY public.residente (idresidente, idestadoresidente, nombre, apellido, telefonofijo, telefonocelular, foto, correo, fechanacimiento, genero, dui, username, contrasena, modo, intentos, codigo) FROM stdin;
    public          postgres    false    252   ˽      �          0    16726    residentecasa 
   TABLE DATA           M   COPY public.residentecasa (idresidentecasa, idresidente, idcasa) FROM stdin;
    public          postgres    false    254   9�      �          0    16731    tipodenuncia 
   TABLE DATA           D   COPY public.tipodenuncia (idtipodenuncia, tipodenuncia) FROM stdin;
    public          postgres    false    256   s�      �          0    16736    tipoempleado 
   TABLE DATA           D   COPY public.tipoempleado (idtipoempleado, tipoempleado) FROM stdin;
    public          postgres    false    258   ��      �          0    16741 
   tipounidad 
   TABLE DATA           >   COPY public.tipounidad (idtipounidad, tipounidad) FROM stdin;
    public          postgres    false    260   ��      �          0    16746    tipousuario 
   TABLE DATA           A   COPY public.tipousuario (idtipousuario, tipousuario) FROM stdin;
    public          postgres    false    262   *�      �          0    16751    unidadmedida 
   TABLE DATA           R   COPY public.unidadmedida (idunidadmedida, idtipounidad, unidadmedida) FROM stdin;
    public          postgres    false    264   j�      �          0    16756    usuario 
   TABLE DATA           �   COPY public.usuario (idusuario, idestadousuario, idtipousuario, nombre, apellido, telefonofijo, telefonocelular, foto, correo, fechanacimiento, genero, dui, username, contrasena, direccion, modo, intentos, codigo) FROM stdin;
    public          postgres    false    266   ��      �          0    16761    visita 
   TABLE DATA           m   COPY public.visita (idvisita, idresidente, fecha, visitarecurrente, observacion, idestadovisita) FROM stdin;
    public          postgres    false    268   g�      �          0    16766 	   visitante 
   TABLE DATA           V   COPY public.visitante (idvisitante, nombre, apellido, dui, genero, placa) FROM stdin;
    public          postgres    false    270   K�      �           0    0    alquiler_idalquiler_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.alquiler_idalquiler_seq', 82, true);
          public          postgres    false    201            �           0    0    aportacion_idaportacion_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.aportacion_idaportacion_seq', 216, true);
          public          postgres    false    203            �           0    0    bitacora_idbitacora_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.bitacora_idbitacora_seq', 105, true);
          public          postgres    false    205            �           0    0     bitacoraresidente_idbitacora_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.bitacoraresidente_idbitacora_seq', 1, false);
          public          postgres    false    272            �           0    0    casa_idcasa_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.casa_idcasa_seq', 8, true);
          public          postgres    false    207            �           0    0    categoria_idcategoria_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.categoria_idcategoria_seq', 9, true);
          public          postgres    false    209            �           0    0    denuncia_iddenuncia_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.denuncia_iddenuncia_seq', 20, true);
          public          postgres    false    211            �           0    0 %   detallematerial_iddetallematerial_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.detallematerial_iddetallematerial_seq', 31, true);
          public          postgres    false    213            �           0    0 !   detallevisita_iddetallevisita_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.detallevisita_iddetallevisita_seq', 5, true);
          public          postgres    false    215            �           0    0    empleado_idempleado_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.empleado_idempleado_seq', 12, true);
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
          public          postgres    false    239            �           0    0 -   historialinventario_idhistorialinventario_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('public.historialinventario_idhistorialinventario_seq', 17, true);
          public          postgres    false    241            �           0    0 %   imagenesespacio_idimagenesespacio_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.imagenesespacio_idimagenesespacio_seq', 3, true);
          public          postgres    false    243            �           0    0    marca_idmarca_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.marca_idmarca_seq', 5, true);
          public          postgres    false    245            �           0    0    material_idmaterial_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.material_idmaterial_seq', 6, true);
          public          postgres    false    247            �           0    0    mespago_idmespago_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.mespago_idmespago_seq', 60, true);
          public          postgres    false    249            �           0    0    pedido_idpedido_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.pedido_idpedido_seq', 7, true);
          public          postgres    false    251            �           0    0    permiso_idpermiso_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.permiso_idpermiso_seq', 6, true);
          public          postgres    false    274            �           0    0 #   permisousuario_idpermisousuario_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.permisousuario_idpermisousuario_seq', 127, true);
          public          postgres    false    276            �           0    0    residente_idresidente_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.residente_idresidente_seq', 8, true);
          public          postgres    false    253            �           0    0 !   residentecasa_idresidentecasa_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.residentecasa_idresidentecasa_seq', 10, true);
          public          postgres    false    255            �           0    0    tipodenuncia_idtipodenuncia_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.tipodenuncia_idtipodenuncia_seq', 3, true);
          public          postgres    false    257            �           0    0    tipoempleado_idtipoempleado_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.tipoempleado_idtipoempleado_seq', 3, true);
          public          postgres    false    259            �           0    0    tipounidad_idtipounidad_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.tipounidad_idtipounidad_seq', 3, true);
          public          postgres    false    261            �           0    0    tipousuario_idtipousuario_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.tipousuario_idtipousuario_seq', 23, true);
          public          postgres    false    263            �           0    0    unidadmedida_idunidadmedida_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.unidadmedida_idunidadmedida_seq', 3, true);
          public          postgres    false    265            �           0    0    usuario_idusuario_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.usuario_idusuario_seq', 6, true);
          public          postgres    false    267            �           0    0    visita_idvisita_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.visita_idvisita_seq', 25, true);
          public          postgres    false    269            �           0    0    visitante_idvisitante_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.visitante_idvisitante_seq', 5, true);
          public          postgres    false    271            7           2606    16808    alquiler alquiler_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.alquiler
    ADD CONSTRAINT alquiler_pkey PRIMARY KEY (idalquiler);
 @   ALTER TABLE ONLY public.alquiler DROP CONSTRAINT alquiler_pkey;
       public            postgres    false    200            9           2606    16810    aportacion aportacion_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.aportacion
    ADD CONSTRAINT aportacion_pkey PRIMARY KEY (idaportacion);
 D   ALTER TABLE ONLY public.aportacion DROP CONSTRAINT aportacion_pkey;
       public            postgres    false    202            ;           2606    16812    bitacora bitacora_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.bitacora
    ADD CONSTRAINT bitacora_pkey PRIMARY KEY (idbitacora);
 @   ALTER TABLE ONLY public.bitacora DROP CONSTRAINT bitacora_pkey;
       public            postgres    false    204            �           2606    17450 (   bitacoraresidente bitacoraresidente_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.bitacoraresidente
    ADD CONSTRAINT bitacoraresidente_pkey PRIMARY KEY (idbitacora);
 R   ALTER TABLE ONLY public.bitacoraresidente DROP CONSTRAINT bitacoraresidente_pkey;
       public            postgres    false    273            =           2606    16814    casa casa_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.casa
    ADD CONSTRAINT casa_pkey PRIMARY KEY (idcasa);
 8   ALTER TABLE ONLY public.casa DROP CONSTRAINT casa_pkey;
       public            postgres    false    206            ?           2606    16816    categoria categoria_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (idcategoria);
 B   ALTER TABLE ONLY public.categoria DROP CONSTRAINT categoria_pkey;
       public            postgres    false    208            A           2606    16818    denuncia denuncia_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.denuncia
    ADD CONSTRAINT denuncia_pkey PRIMARY KEY (iddenuncia);
 @   ALTER TABLE ONLY public.denuncia DROP CONSTRAINT denuncia_pkey;
       public            postgres    false    210            C           2606    16820 $   detallematerial detallematerial_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.detallematerial
    ADD CONSTRAINT detallematerial_pkey PRIMARY KEY (iddetallematerial);
 N   ALTER TABLE ONLY public.detallematerial DROP CONSTRAINT detallematerial_pkey;
       public            postgres    false    212            E           2606    16822     detallevisita detallevisita_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.detallevisita
    ADD CONSTRAINT detallevisita_pkey PRIMARY KEY (iddetallevisita);
 J   ALTER TABLE ONLY public.detallevisita DROP CONSTRAINT detallevisita_pkey;
       public            postgres    false    214            G           2606    16824    empleado empleado_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_pkey PRIMARY KEY (idempleado);
 @   ALTER TABLE ONLY public.empleado DROP CONSTRAINT empleado_pkey;
       public            postgres    false    216            O           2606    16826    espacio espacio_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.espacio
    ADD CONSTRAINT espacio_pkey PRIMARY KEY (idespacio);
 >   ALTER TABLE ONLY public.espacio DROP CONSTRAINT espacio_pkey;
       public            postgres    false    218            S           2606    16828 "   estadoalquiler estadoalquiler_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.estadoalquiler
    ADD CONSTRAINT estadoalquiler_pkey PRIMARY KEY (idestadoalquiler);
 L   ALTER TABLE ONLY public.estadoalquiler DROP CONSTRAINT estadoalquiler_pkey;
       public            postgres    false    220            U           2606    16830 &   estadoaportacion estadoaportacion_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.estadoaportacion
    ADD CONSTRAINT estadoaportacion_pkey PRIMARY KEY (idestadoaportacion);
 P   ALTER TABLE ONLY public.estadoaportacion DROP CONSTRAINT estadoaportacion_pkey;
       public            postgres    false    222            W           2606    16832    estadocasa estadocasa_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.estadocasa
    ADD CONSTRAINT estadocasa_pkey PRIMARY KEY (idestadocasa);
 D   ALTER TABLE ONLY public.estadocasa DROP CONSTRAINT estadocasa_pkey;
       public            postgres    false    224            Y           2606    16834 "   estadodenuncia estadodenuncia_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.estadodenuncia
    ADD CONSTRAINT estadodenuncia_pkey PRIMARY KEY (idestadodenuncia);
 L   ALTER TABLE ONLY public.estadodenuncia DROP CONSTRAINT estadodenuncia_pkey;
       public            postgres    false    226            [           2606    16836 "   estadoempleado estadoempleado_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.estadoempleado
    ADD CONSTRAINT estadoempleado_pkey PRIMARY KEY (idestadoempleado);
 L   ALTER TABLE ONLY public.estadoempleado DROP CONSTRAINT estadoempleado_pkey;
       public            postgres    false    228            ]           2606    16838     estadoespacio estadoespacio_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.estadoespacio
    ADD CONSTRAINT estadoespacio_pkey PRIMARY KEY (idestadoespacio);
 J   ALTER TABLE ONLY public.estadoespacio DROP CONSTRAINT estadoespacio_pkey;
       public            postgres    false    230            _           2606    16840    estadopedido estadopedido_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.estadopedido
    ADD CONSTRAINT estadopedido_pkey PRIMARY KEY (idestadopedido);
 H   ALTER TABLE ONLY public.estadopedido DROP CONSTRAINT estadopedido_pkey;
       public            postgres    false    232            a           2606    16842 $   estadoresidente estadoresidente_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.estadoresidente
    ADD CONSTRAINT estadoresidente_pkey PRIMARY KEY (idestadoresidente);
 N   ALTER TABLE ONLY public.estadoresidente DROP CONSTRAINT estadoresidente_pkey;
       public            postgres    false    234            c           2606    16844     estadousuario estadousuario_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.estadousuario
    ADD CONSTRAINT estadousuario_pkey PRIMARY KEY (idestadousuario);
 J   ALTER TABLE ONLY public.estadousuario DROP CONSTRAINT estadousuario_pkey;
       public            postgres    false    236            e           2606    16846    estadovisita estadovisita_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.estadovisita
    ADD CONSTRAINT estadovisita_pkey PRIMARY KEY (idestadovisita);
 H   ALTER TABLE ONLY public.estadovisita DROP CONSTRAINT estadovisita_pkey;
       public            postgres    false    238            g           2606    16848 ,   historialinventario historialinventario_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public.historialinventario
    ADD CONSTRAINT historialinventario_pkey PRIMARY KEY (idhistorialinventario);
 V   ALTER TABLE ONLY public.historialinventario DROP CONSTRAINT historialinventario_pkey;
       public            postgres    false    240            i           2606    16850 $   imagenesespacio imagenesespacio_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.imagenesespacio
    ADD CONSTRAINT imagenesespacio_pkey PRIMARY KEY (idimagenesespacio);
 N   ALTER TABLE ONLY public.imagenesespacio DROP CONSTRAINT imagenesespacio_pkey;
       public            postgres    false    242            k           2606    16852    marca marca_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.marca
    ADD CONSTRAINT marca_pkey PRIMARY KEY (idmarca);
 :   ALTER TABLE ONLY public.marca DROP CONSTRAINT marca_pkey;
       public            postgres    false    244            m           2606    16854    material material_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.material
    ADD CONSTRAINT material_pkey PRIMARY KEY (idmaterial);
 @   ALTER TABLE ONLY public.material DROP CONSTRAINT material_pkey;
       public            postgres    false    246            o           2606    16856    mespago mespago_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.mespago
    ADD CONSTRAINT mespago_pkey PRIMARY KEY (idmespago);
 >   ALTER TABLE ONLY public.mespago DROP CONSTRAINT mespago_pkey;
       public            postgres    false    248            q           2606    16858    pedido pedido_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (idpedido);
 <   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_pkey;
       public            postgres    false    250            �           2606    17463    permiso permiso_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.permiso
    ADD CONSTRAINT permiso_pkey PRIMARY KEY (idpermiso);
 >   ALTER TABLE ONLY public.permiso DROP CONSTRAINT permiso_pkey;
       public            postgres    false    275            �           2606    17471 "   permisousuario permisousuario_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.permisousuario
    ADD CONSTRAINT permisousuario_pkey PRIMARY KEY (idpermisousuario);
 L   ALTER TABLE ONLY public.permisousuario DROP CONSTRAINT permisousuario_pkey;
       public            postgres    false    277            s           2606    16860    residente residente_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.residente
    ADD CONSTRAINT residente_pkey PRIMARY KEY (idresidente);
 B   ALTER TABLE ONLY public.residente DROP CONSTRAINT residente_pkey;
       public            postgres    false    252                       2606    16862     residentecasa residentecasa_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.residentecasa
    ADD CONSTRAINT residentecasa_pkey PRIMARY KEY (idresidentecasa);
 J   ALTER TABLE ONLY public.residentecasa DROP CONSTRAINT residentecasa_pkey;
       public            postgres    false    254            �           2606    16864    tipodenuncia tipodenuncia_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.tipodenuncia
    ADD CONSTRAINT tipodenuncia_pkey PRIMARY KEY (idtipodenuncia);
 H   ALTER TABLE ONLY public.tipodenuncia DROP CONSTRAINT tipodenuncia_pkey;
       public            postgres    false    256            �           2606    16866    tipoempleado tipoempleado_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.tipoempleado
    ADD CONSTRAINT tipoempleado_pkey PRIMARY KEY (idtipoempleado);
 H   ALTER TABLE ONLY public.tipoempleado DROP CONSTRAINT tipoempleado_pkey;
       public            postgres    false    258            �           2606    16868    tipounidad tipounidad_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.tipounidad
    ADD CONSTRAINT tipounidad_pkey PRIMARY KEY (idtipounidad);
 D   ALTER TABLE ONLY public.tipounidad DROP CONSTRAINT tipounidad_pkey;
       public            postgres    false    260            �           2606    16870    tipousuario tipousuario_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.tipousuario
    ADD CONSTRAINT tipousuario_pkey PRIMARY KEY (idtipousuario);
 F   ALTER TABLE ONLY public.tipousuario DROP CONSTRAINT tipousuario_pkey;
       public            postgres    false    262            �           2606    16872    unidadmedida unidadmedida_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.unidadmedida
    ADD CONSTRAINT unidadmedida_pkey PRIMARY KEY (idunidadmedida);
 H   ALTER TABLE ONLY public.unidadmedida DROP CONSTRAINT unidadmedida_pkey;
       public            postgres    false    264            I           2606    16874    empleado uq_empleado_correo 
   CONSTRAINT     X   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT uq_empleado_correo UNIQUE (correo);
 E   ALTER TABLE ONLY public.empleado DROP CONSTRAINT uq_empleado_correo;
       public            postgres    false    216            K           2606    16876    empleado uq_empleado_dui 
   CONSTRAINT     R   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT uq_empleado_dui UNIQUE (dui);
 B   ALTER TABLE ONLY public.empleado DROP CONSTRAINT uq_empleado_dui;
       public            postgres    false    216            M           2606    16878    empleado uq_empleado_telefono 
   CONSTRAINT     \   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT uq_empleado_telefono UNIQUE (telefono);
 G   ALTER TABLE ONLY public.empleado DROP CONSTRAINT uq_empleado_telefono;
       public            postgres    false    216            Q           2606    16880    espacio uq_espacio_nombre 
   CONSTRAINT     V   ALTER TABLE ONLY public.espacio
    ADD CONSTRAINT uq_espacio_nombre UNIQUE (nombre);
 C   ALTER TABLE ONLY public.espacio DROP CONSTRAINT uq_espacio_nombre;
       public            postgres    false    218            u           2606    17491    residente uq_residente_correo 
   CONSTRAINT     Z   ALTER TABLE ONLY public.residente
    ADD CONSTRAINT uq_residente_correo UNIQUE (correo);
 G   ALTER TABLE ONLY public.residente DROP CONSTRAINT uq_residente_correo;
       public            postgres    false    252            w           2606    17485    residente uq_residente_dui 
   CONSTRAINT     T   ALTER TABLE ONLY public.residente
    ADD CONSTRAINT uq_residente_dui UNIQUE (dui);
 D   ALTER TABLE ONLY public.residente DROP CONSTRAINT uq_residente_dui;
       public            postgres    false    252            y           2606    17489 '   residente uq_residente_telefono_celular 
   CONSTRAINT     m   ALTER TABLE ONLY public.residente
    ADD CONSTRAINT uq_residente_telefono_celular UNIQUE (telefonocelular);
 Q   ALTER TABLE ONLY public.residente DROP CONSTRAINT uq_residente_telefono_celular;
       public            postgres    false    252            {           2606    17487 $   residente uq_residente_telefono_fijo 
   CONSTRAINT     g   ALTER TABLE ONLY public.residente
    ADD CONSTRAINT uq_residente_telefono_fijo UNIQUE (telefonofijo);
 N   ALTER TABLE ONLY public.residente DROP CONSTRAINT uq_residente_telefono_fijo;
       public            postgres    false    252            }           2606    17493    residente uq_residente_username 
   CONSTRAINT     ^   ALTER TABLE ONLY public.residente
    ADD CONSTRAINT uq_residente_username UNIQUE (username);
 I   ALTER TABLE ONLY public.residente DROP CONSTRAINT uq_residente_username;
       public            postgres    false    252            �           2606    17495    tipousuario uq_tipousuario 
   CONSTRAINT     \   ALTER TABLE ONLY public.tipousuario
    ADD CONSTRAINT uq_tipousuario UNIQUE (tipousuario);
 D   ALTER TABLE ONLY public.tipousuario DROP CONSTRAINT uq_tipousuario;
       public            postgres    false    262            �           2606    16882    usuario uq_usuario_correo 
   CONSTRAINT     V   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT uq_usuario_correo UNIQUE (correo);
 C   ALTER TABLE ONLY public.usuario DROP CONSTRAINT uq_usuario_correo;
       public            postgres    false    266            �           2606    16884    usuario uq_usuario_dui 
   CONSTRAINT     P   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT uq_usuario_dui UNIQUE (dui);
 @   ALTER TABLE ONLY public.usuario DROP CONSTRAINT uq_usuario_dui;
       public            postgres    false    266            �           2606    16886 #   usuario uq_usuario_telefono_celular 
   CONSTRAINT     i   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT uq_usuario_telefono_celular UNIQUE (telefonocelular);
 M   ALTER TABLE ONLY public.usuario DROP CONSTRAINT uq_usuario_telefono_celular;
       public            postgres    false    266            �           2606    16888     usuario uq_usuario_telefono_fijo 
   CONSTRAINT     c   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT uq_usuario_telefono_fijo UNIQUE (telefonofijo);
 J   ALTER TABLE ONLY public.usuario DROP CONSTRAINT uq_usuario_telefono_fijo;
       public            postgres    false    266            �           2606    16890    usuario uq_usuario_username 
   CONSTRAINT     Z   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT uq_usuario_username UNIQUE (username);
 E   ALTER TABLE ONLY public.usuario DROP CONSTRAINT uq_usuario_username;
       public            postgres    false    266            �           2606    16892    visitante uq_visitante_dui 
   CONSTRAINT     T   ALTER TABLE ONLY public.visitante
    ADD CONSTRAINT uq_visitante_dui UNIQUE (dui);
 D   ALTER TABLE ONLY public.visitante DROP CONSTRAINT uq_visitante_dui;
       public            postgres    false    270            �           2606    16894    visitante uq_visitante_placa 
   CONSTRAINT     X   ALTER TABLE ONLY public.visitante
    ADD CONSTRAINT uq_visitante_placa UNIQUE (placa);
 F   ALTER TABLE ONLY public.visitante DROP CONSTRAINT uq_visitante_placa;
       public            postgres    false    270            �           2606    16896    usuario usuario_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (idusuario);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public            postgres    false    266            �           2606    16898    visita visita_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.visita
    ADD CONSTRAINT visita_pkey PRIMARY KEY (idvisita);
 <   ALTER TABLE ONLY public.visita DROP CONSTRAINT visita_pkey;
       public            postgres    false    268            �           2606    16900    visitante visitante_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.visitante
    ADD CONSTRAINT visitante_pkey PRIMARY KEY (idvisitante);
 B   ALTER TABLE ONLY public.visitante DROP CONSTRAINT visitante_pkey;
       public            postgres    false    270            �           2620    16901    material tr_historialinventario    TRIGGER     �   CREATE TRIGGER tr_historialinventario BEFORE UPDATE ON public.material FOR EACH ROW EXECUTE FUNCTION public.sp_historialinventario();
 8   DROP TRIGGER tr_historialinventario ON public.material;
       public          postgres    false    246    278            �           2606    16902     alquiler alquiler_idespacio_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.alquiler
    ADD CONSTRAINT alquiler_idespacio_fkey FOREIGN KEY (idespacio) REFERENCES public.espacio(idespacio);
 J   ALTER TABLE ONLY public.alquiler DROP CONSTRAINT alquiler_idespacio_fkey;
       public          postgres    false    3151    218    200            �           2606    16907 '   alquiler alquiler_idestadoalquiler_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.alquiler
    ADD CONSTRAINT alquiler_idestadoalquiler_fkey FOREIGN KEY (idestadoalquiler) REFERENCES public.estadoalquiler(idestadoalquiler);
 Q   ALTER TABLE ONLY public.alquiler DROP CONSTRAINT alquiler_idestadoalquiler_fkey;
       public          postgres    false    3155    200    220            �           2606    16912 "   alquiler alquiler_idresidente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.alquiler
    ADD CONSTRAINT alquiler_idresidente_fkey FOREIGN KEY (idresidente) REFERENCES public.residente(idresidente);
 L   ALTER TABLE ONLY public.alquiler DROP CONSTRAINT alquiler_idresidente_fkey;
       public          postgres    false    200    3187    252            �           2606    16917     alquiler alquiler_idusuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.alquiler
    ADD CONSTRAINT alquiler_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);
 J   ALTER TABLE ONLY public.alquiler DROP CONSTRAINT alquiler_idusuario_fkey;
       public          postgres    false    3223    200    266            �           2606    16922 !   aportacion aportacion_idcasa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.aportacion
    ADD CONSTRAINT aportacion_idcasa_fkey FOREIGN KEY (idcasa) REFERENCES public.casa(idcasa);
 K   ALTER TABLE ONLY public.aportacion DROP CONSTRAINT aportacion_idcasa_fkey;
       public          postgres    false    206    3133    202            �           2606    16927 -   aportacion aportacion_idestadoaportacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.aportacion
    ADD CONSTRAINT aportacion_idestadoaportacion_fkey FOREIGN KEY (idestadoaportacion) REFERENCES public.estadoaportacion(idestadoaportacion);
 W   ALTER TABLE ONLY public.aportacion DROP CONSTRAINT aportacion_idestadoaportacion_fkey;
       public          postgres    false    202    222    3157            �           2606    16932 $   aportacion aportacion_idmespago_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.aportacion
    ADD CONSTRAINT aportacion_idmespago_fkey FOREIGN KEY (idmespago) REFERENCES public.mespago(idmespago);
 N   ALTER TABLE ONLY public.aportacion DROP CONSTRAINT aportacion_idmespago_fkey;
       public          postgres    false    3183    202    248            �           2606    16937     bitacora bitacora_idusuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.bitacora
    ADD CONSTRAINT bitacora_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);
 J   ALTER TABLE ONLY public.bitacora DROP CONSTRAINT bitacora_idusuario_fkey;
       public          postgres    false    204    266    3223            �           2606    17451 4   bitacoraresidente bitacoraresidente_idresidente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.bitacoraresidente
    ADD CONSTRAINT bitacoraresidente_idresidente_fkey FOREIGN KEY (idresidente) REFERENCES public.residente(idresidente);
 ^   ALTER TABLE ONLY public.bitacoraresidente DROP CONSTRAINT bitacoraresidente_idresidente_fkey;
       public          postgres    false    252    3187    273            �           2606    16942    casa casa_idestadocasa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.casa
    ADD CONSTRAINT casa_idestadocasa_fkey FOREIGN KEY (idestadocasa) REFERENCES public.estadocasa(idestadocasa);
 E   ALTER TABLE ONLY public.casa DROP CONSTRAINT casa_idestadocasa_fkey;
       public          postgres    false    206    224    3159            �           2606    16947 !   denuncia denuncia_idempleado_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.denuncia
    ADD CONSTRAINT denuncia_idempleado_fkey FOREIGN KEY (idempleado) REFERENCES public.empleado(idempleado);
 K   ALTER TABLE ONLY public.denuncia DROP CONSTRAINT denuncia_idempleado_fkey;
       public          postgres    false    210    216    3143            �           2606    16952 '   denuncia denuncia_idestadodenuncia_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.denuncia
    ADD CONSTRAINT denuncia_idestadodenuncia_fkey FOREIGN KEY (idestadodenuncia) REFERENCES public.estadodenuncia(idestadodenuncia);
 Q   ALTER TABLE ONLY public.denuncia DROP CONSTRAINT denuncia_idestadodenuncia_fkey;
       public          postgres    false    210    226    3161            �           2606    16957 "   denuncia denuncia_idresidente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.denuncia
    ADD CONSTRAINT denuncia_idresidente_fkey FOREIGN KEY (idresidente) REFERENCES public.residente(idresidente);
 L   ALTER TABLE ONLY public.denuncia DROP CONSTRAINT denuncia_idresidente_fkey;
       public          postgres    false    210    252    3187            �           2606    16962 %   denuncia denuncia_idtipodenuncia_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.denuncia
    ADD CONSTRAINT denuncia_idtipodenuncia_fkey FOREIGN KEY (idtipodenuncia) REFERENCES public.tipodenuncia(idtipodenuncia);
 O   ALTER TABLE ONLY public.denuncia DROP CONSTRAINT denuncia_idtipodenuncia_fkey;
       public          postgres    false    256    210    3201            �           2606    16967 /   detallematerial detallematerial_idmaterial_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.detallematerial
    ADD CONSTRAINT detallematerial_idmaterial_fkey FOREIGN KEY (idmaterial) REFERENCES public.material(idmaterial);
 Y   ALTER TABLE ONLY public.detallematerial DROP CONSTRAINT detallematerial_idmaterial_fkey;
       public          postgres    false    3181    246    212            �           2606    16972 -   detallematerial detallematerial_idpedido_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.detallematerial
    ADD CONSTRAINT detallematerial_idpedido_fkey FOREIGN KEY (idpedido) REFERENCES public.pedido(idpedido);
 W   ALTER TABLE ONLY public.detallematerial DROP CONSTRAINT detallematerial_idpedido_fkey;
       public          postgres    false    212    3185    250            �           2606    16977 )   detallevisita detallevisita_idvisita_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.detallevisita
    ADD CONSTRAINT detallevisita_idvisita_fkey FOREIGN KEY (idvisita) REFERENCES public.visita(idvisita);
 S   ALTER TABLE ONLY public.detallevisita DROP CONSTRAINT detallevisita_idvisita_fkey;
       public          postgres    false    3225    268    214            �           2606    16982 ,   detallevisita detallevisita_idvisitante_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.detallevisita
    ADD CONSTRAINT detallevisita_idvisitante_fkey FOREIGN KEY (idvisitante) REFERENCES public.visitante(idvisitante);
 V   ALTER TABLE ONLY public.detallevisita DROP CONSTRAINT detallevisita_idvisitante_fkey;
       public          postgres    false    214    3231    270            �           2606    16987 '   empleado empleado_idestadoempleado_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_idestadoempleado_fkey FOREIGN KEY (idestadoempleado) REFERENCES public.estadoempleado(idestadoempleado);
 Q   ALTER TABLE ONLY public.empleado DROP CONSTRAINT empleado_idestadoempleado_fkey;
       public          postgres    false    228    216    3163            �           2606    16992 %   empleado empleado_idtipoempleado_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_idtipoempleado_fkey FOREIGN KEY (idtipoempleado) REFERENCES public.tipoempleado(idtipoempleado);
 O   ALTER TABLE ONLY public.empleado DROP CONSTRAINT empleado_idtipoempleado_fkey;
       public          postgres    false    3203    216    258            �           2606    16997 $   espacio espacio_idestadoespacio_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.espacio
    ADD CONSTRAINT espacio_idestadoespacio_fkey FOREIGN KEY (idestadoespacio) REFERENCES public.estadoespacio(idestadoespacio);
 N   ALTER TABLE ONLY public.espacio DROP CONSTRAINT espacio_idestadoespacio_fkey;
       public          postgres    false    230    3165    218            �           2606    17002 7   historialinventario historialinventario_idmaterial_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.historialinventario
    ADD CONSTRAINT historialinventario_idmaterial_fkey FOREIGN KEY (idmaterial) REFERENCES public.material(idmaterial);
 a   ALTER TABLE ONLY public.historialinventario DROP CONSTRAINT historialinventario_idmaterial_fkey;
       public          postgres    false    246    240    3181            �           2606    17007 .   imagenesespacio imagenesespacio_idespacio_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.imagenesespacio
    ADD CONSTRAINT imagenesespacio_idespacio_fkey FOREIGN KEY (idespacio) REFERENCES public.espacio(idespacio);
 X   ALTER TABLE ONLY public.imagenesespacio DROP CONSTRAINT imagenesespacio_idespacio_fkey;
       public          postgres    false    218    242    3151            �           2606    17012 "   material material_idcategoria_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.material
    ADD CONSTRAINT material_idcategoria_fkey FOREIGN KEY (idcategoria) REFERENCES public.categoria(idcategoria);
 L   ALTER TABLE ONLY public.material DROP CONSTRAINT material_idcategoria_fkey;
       public          postgres    false    208    3135    246            �           2606    17017    material material_idmarca_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.material
    ADD CONSTRAINT material_idmarca_fkey FOREIGN KEY (idmarca) REFERENCES public.marca(idmarca);
 H   ALTER TABLE ONLY public.material DROP CONSTRAINT material_idmarca_fkey;
       public          postgres    false    246    244    3179            �           2606    17022 %   material material_idunidadmedida_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.material
    ADD CONSTRAINT material_idunidadmedida_fkey FOREIGN KEY (idunidadmedida) REFERENCES public.unidadmedida(idunidadmedida);
 O   ALTER TABLE ONLY public.material DROP CONSTRAINT material_idunidadmedida_fkey;
       public          postgres    false    246    3211    264            �           2606    17027    pedido pedido_idempleado_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_idempleado_fkey FOREIGN KEY (idempleado) REFERENCES public.empleado(idempleado);
 G   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_idempleado_fkey;
       public          postgres    false    3143    250    216            �           2606    17032 !   pedido pedido_idestadopedido_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_idestadopedido_fkey FOREIGN KEY (idestadopedido) REFERENCES public.estadopedido(idestadopedido);
 K   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_idestadopedido_fkey;
       public          postgres    false    250    3167    232            �           2606    17037    pedido pedido_idusuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);
 F   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_idusuario_fkey;
       public          postgres    false    266    250    3223            �           2606    17477 ,   permisousuario permisousuario_idpermiso_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.permisousuario
    ADD CONSTRAINT permisousuario_idpermiso_fkey FOREIGN KEY (idpermiso) REFERENCES public.permiso(idpermiso);
 V   ALTER TABLE ONLY public.permisousuario DROP CONSTRAINT permisousuario_idpermiso_fkey;
       public          postgres    false    277    3235    275            �           2606    17472 0   permisousuario permisousuario_idtipousuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.permisousuario
    ADD CONSTRAINT permisousuario_idtipousuario_fkey FOREIGN KEY (idtipousuario) REFERENCES public.tipousuario(idtipousuario);
 Z   ALTER TABLE ONLY public.permisousuario DROP CONSTRAINT permisousuario_idtipousuario_fkey;
       public          postgres    false    3207    262    277            �           2606    17042 *   residente residente_idestadoresidente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.residente
    ADD CONSTRAINT residente_idestadoresidente_fkey FOREIGN KEY (idestadoresidente) REFERENCES public.estadoresidente(idestadoresidente);
 T   ALTER TABLE ONLY public.residente DROP CONSTRAINT residente_idestadoresidente_fkey;
       public          postgres    false    234    252    3169            �           2606    17047 '   residentecasa residentecasa_idcasa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.residentecasa
    ADD CONSTRAINT residentecasa_idcasa_fkey FOREIGN KEY (idcasa) REFERENCES public.casa(idcasa);
 Q   ALTER TABLE ONLY public.residentecasa DROP CONSTRAINT residentecasa_idcasa_fkey;
       public          postgres    false    3133    206    254            �           2606    17052 ,   residentecasa residentecasa_idresidente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.residentecasa
    ADD CONSTRAINT residentecasa_idresidente_fkey FOREIGN KEY (idresidente) REFERENCES public.residente(idresidente);
 V   ALTER TABLE ONLY public.residentecasa DROP CONSTRAINT residentecasa_idresidente_fkey;
       public          postgres    false    254    252    3187            �           2606    17057 +   unidadmedida unidadmedida_idtipounidad_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.unidadmedida
    ADD CONSTRAINT unidadmedida_idtipounidad_fkey FOREIGN KEY (idtipounidad) REFERENCES public.tipounidad(idtipounidad);
 U   ALTER TABLE ONLY public.unidadmedida DROP CONSTRAINT unidadmedida_idtipounidad_fkey;
       public          postgres    false    3205    264    260            �           2606    17062 $   usuario usuario_idestadousuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_idestadousuario_fkey FOREIGN KEY (idestadousuario) REFERENCES public.estadousuario(idestadousuario);
 N   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_idestadousuario_fkey;
       public          postgres    false    3171    236    266            �           2606    17067 "   usuario usuario_idtipousuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_idtipousuario_fkey FOREIGN KEY (idtipousuario) REFERENCES public.tipousuario(idtipousuario);
 L   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_idtipousuario_fkey;
       public          postgres    false    266    262    3207            �           2606    17072 !   visita visita_idestadovisita_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.visita
    ADD CONSTRAINT visita_idestadovisita_fkey FOREIGN KEY (idestadovisita) REFERENCES public.estadovisita(idestadovisita);
 K   ALTER TABLE ONLY public.visita DROP CONSTRAINT visita_idestadovisita_fkey;
       public          postgres    false    268    238    3173            �           2606    17077    visita visita_idresidente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.visita
    ADD CONSTRAINT visita_idresidente_fkey FOREIGN KEY (idresidente) REFERENCES public.residente(idresidente);
 H   ALTER TABLE ONLY public.visita DROP CONSTRAINT visita_idresidente_fkey;
       public          postgres    false    268    3187    252            P   }  x���Q��0����.-�d[v����c���e:ЇP>B�_6�oe�m���ꛛ�����l���>[{9Il9޸}p_�ƅ��p\���kXY���Ԃ���ƍa�C\1N���b�.P'�.�z�32ݮ��VwI'��WIOE�I�@݉vI�d�x����-��-��-��-��qܒ�(�N�_;�.通=I�t�t����H��TŐ�Tt5I�d�Tܒiܒ���[2�[�}��L�L�� 𭞊n&�"i�tH�BMZ�&�5�����-��i�%;��d?�%٫:n�4n�4n���S��������N�t��CM�;C�j2��$�[��Nܒiܒ�!�-�ܒ�8n��'�sl��?�~�����M���������cmu      R   �  x���M��@��5�� �����[� �X���f ���?&����yŊ���ed��d'=��&����������\������.���k���o���\��m]>���u����og�'u']�N8'w'_�L8N�N�:O8�;u�<E�xw|�<'�sN�Ӻ��~W���R�;P�vH�N4�}�js'���A���s@b�����K�*.�jp��j��%V3.�Z�p��
�L������X4��?7x@�p�4��pix�å���8\^�pi������C��m@\1M���s�>ap��"����K,
.��p����p�E����K���!�X{�K��E����߫k�X+p��Z��%��X8\b���38Tb&
�Jl���!���k�Tb&c�\b&e��|b&���á3	8Tb&������}7qDb�l��4���<v�%��As��X4��Ͽ�����0�����|�D��      T   �  x���]n�8ǟ�S�!8�$��(z���j��8k'}�;���ۡD�r��r"(�F�!9����
���ƫ�(��z��7��x�>u�w������e��n��j;>���<�6ݷ~��Y����}�zn��ϻn�=<�w��z뮱2P�r�S�o��������Gs�S6����O	v.�/W�����2�}�6}{���{���܈���᥽��y���t��̕=f��W��×���*����[��%�S��09�>*_���Ai�]J(q��zfxᄍ<�p9v�lHΛ㪗��O��w���!���~EΏ~���O�m�c|���N��E�C���AH����Aٖ�x��vۿ
���B��YlDM�zB�~j G>aē<Yݵ�o�����ݦ�^� S	�|X�߶�6� ��v�E������C�x�g��k1M�]��BG�h�	s��>bVxe ��ڏ�>�ĩ�����%�MBD}e���]�Xg���۳5M[�+�C�x9â��q�O��9��`�����g� �x�/���8-��@X"�`{
aQ�"$�#������{��[{բ��%0�y���le8R=qSvl��-q/>�ePd\4�b��I�]�t�S���@wNA����������b	��������"�^1�RK5Ŕ ��x+{�S��f����&��p.')���>�lOV;�BIC_�t���B�3:�ė��)�t+g(9k�,n���5F��cM��p4hg*Î�ڿ�f�mگ?�m�5����u bhKԄ'F�Fԁ�..�ጅ���V�/�~H1X��%�(!-�VB�|��;.L���d������'#I%!� z��	�7(�(;b���5oHE0�"�S�ev�tXwp~�gI�����9OE�y}�58&
�j˺ُV�}�<�5f~��[��L�s�L�2A�� {�ziV�>>5�	I�e�xc�g|\�1kL�:�t�y�h�&
� ���
��b2��~���J�pd�M9�'�;k�:�|�߱�9:�]<=qg��J����V�����VX)SJ/H�J��ZS��%�X��2���]�ҙ\��%�\��&4��ۚK����x�����҇�?�j�D�E�2�C�ύG� º��8ڷ�n��=�Q��*C5�I)�t�Ô�du|a����$��x����Z:�t&��*k:�OTH���,G��m���2J�x)Ծ>���.���M9��Z��I�t�g�o�Cؿ�����ˬK�A�X�m[l/ 0_��B��^Z�TxaD�+��vPq�b'%��`��lq��6�ȓp!�N<�e|�BZ�P4c������a@���Y�z�]��������ڢB+B,$���K!^�k,�*`�oI�ݎw%�+�����DJ{��h���<��+���}�q���=�m���gZ���R����ul�k���;�3��)���(&k	���r�2o�8ew�:x�Ӆ�� �E���a1�A�{z�W����T馒ъ4]����o�E�t�������)w�:?N7��K�:d�#��Sw�߭�E��$T3�`�Ӧ;�w��F7�&���}u�[2�X?~�7��i�y�5�C���b�͖�:�	p�톽ٸt+���?4!�����ք}��i /q5������%�¯      �      x������ � �      V   �   x�5���0g�)�HiiˊP�J�,&� (MK~�����g_���EʓZ��9�2��b[��+��c��"'g9G{�up~�{��T8d�ApcP����K�r��I� �?K9._���0��-�]�z���>���(�7|      X   D   x�3�t,*9�6�4'�X!%U!'3� 3�*��M"9?����499���<.KN�����Լ�D�@� �w�      Z     x�m�KN1DמS�&χ�5B�(Ȧ��ȟ`O#8G�b��,���M��겜�����z�v۶��{�+�@�5��	4�3�0�F�y�v���؛���2m���Jm+5��F�_��:SL!�.XJ3z����e�	Ue�"���d���yfD6:��L盛\{>Zv9�2?�~ד�dr���D�����(�?�|(�p�T"1����bei������/*vlQ�+��0���Yr���;�z��Z(5���a�4�/qd�#      \   S   x�=���@��v��;���������T��c�a����IeS���:���dFU�7���OI���X��35�:���'�A�1�      ^   (   x�3�4�4�2�B.cNcN.N��)��)������ P�^      `     x�u�Kn�0���)t$� ����A�5�m6#�V�J�A�F�;uQ��X��]�q����F~���\�Yik��Y� ����t����rDT��j*$a</�JȬ&_H���j-�X�ֶ#�`�G�k�y��n�Ֆ�� ���n ��<�UƋ�@t�7����tp����X�'BV"+��h�TBP�RPb�����xȀC,���5p�����*��oƍ[9�F�ԁ�Ծ��f)&0痚�n۪n�fD��H3��)3�'h���&�ۂEP����g$Ve�q����qWIY�uI��$���]���F�½����c�"F���	VRc,oN� ��5H�0)a~z�&�w���E��^M�"���D�g��۲UJ�L�鏣ށ�ރ�:��-���=�70�1��e-%:��e~	lrUA��.��_��x����h��v��+�w[Ӄǚ{ؙcO���P�_�WҚ6�hX{QP��]N�o�y���Vy���=�h*���bO!�����d\
%�*e)T��,��|}%�fI��1P#�      b   �   x�}�Kj�0��|
���'YU4�v��u�HW���N�3�bU�I��V��Ǐ(��֭�e��F?��y�+T�����y����<�����S$��=���Xz����"[�ؗ�f�0�O.���GDl)���G�P�<��R�:/�4�}�7�^G�8��t��d�]�7ϽjuWaU��Ϗ^2��xfv�ǽ����ЩF޿i�p0�,<���e�r�=S��4I�/��i�      d   8   x�3�J-�,�<�9�ˈ�1�$�,�˘�-3/1'�*1%�˄�%5/5Č���� �&�      f   %   x�3�H�K�L�+I�2�tN�KN�ILI����� ��:      h       x�3�tL.�,K�2�tI-N�S�b���� x��      j   I   x�3�H�K�L�+I�2�JM�H�JLI�2��2�3o��2�t�S((�ON-��2���)M���)����� ��      l   /   x�3�t�,.���L�I�2��O.-HL��2�.-.H�K�rb���� �j      n   9   x�3�t�,.���L�I�2��O.-HL��2�.-.H�K�rL8�R�S��@1z\\\ �;\      p   8   x�3�t�S(�ON-��2�JM�ɬJL��2��3�2�LN�ļ���p� ���      r   &   x�3�tL.�,��2�tI-�HL���,IL������ �|�      t   '   x�3�t�,.���L�I�2�.-.H�K�L������ ��	Y      v   #   x�3�tL.�,K�2�t��K�ɬJL������ o��      x   o   x�e���0�o�� �.����*򩿏���$,|�� '�V�$d�R�e���2��&�ɂ$	�p%�o��BR�_�T�	pV�T ����=�R�Gkx��R�/N>3t      z   C   x�3�43H5174H34O1J��*H�4�2�&[������s�r�DS�L�R��jM�b���� m�      |   6   x�3�tv�u��2����MJ-ʩ�u�I,��2����q���2���vu����� !`      ~     x�M�Kn�0D��)|��6x�$rD ��D�4"h��
����z��T�(tV7�"E��"m*��� ���B�@���]�!�7��p��e@�:
U�9Qe�_�E���y1�o���	�
����xEbp6?H��hF���`��&�Z=�xQixp�,{?M�=��=89.�G��90��
ٵ"����K��$��e�4=�|6)�9v&�yh2E�L�*�3 � 8º8������V���{ڎw�`��G�����/�q�?)�j�      �     x�]�MK�@���̇����cA=���[�j#����@cf6��3����4���B��~^3�����D��~��H��,�L�ӸDA����}�:/��e�<���p]��������i��^ݎ�n	
�ъ�Iɨ�fTYш�jTS��8�F��X8:�p,��cI
,���EᨪpT[၃S8�+%�8�h���ñ���(<r��n
���Q��&Q�SP8*82m�����K�R{8�����Y8�+%
G���
G%����#���Z8�������į7��l�K      �   <   x�3�4�4b##C]s]3.cNc��!��)X�Y��I�%�9X�\�Ј+F��� ��&      �   S   x�3�t�),��I-J-�2�t,�/*IL���r�9]R�J�3��L8}KR�2s����ť�E���\f�a�ř%@1z\\\ j.      �   I   x����0г=L���t��?G���{�m���ȐJ�@%]��*�3[`�!�b���![�!�w��G�      �   ^  x�u�Ir�0���^dkcK�l�3�)@5*aɎ�l0ӭ���X�6��*�;-�����_0��?y!�tVp
�ir��)K�� ��&�l`��TuǶ 1 ڙ��D�g�}~1��1���T�V!= �+թ�~���	x��'C
��q6v��y���I�{	,�,���p����4u���¼�H$,���D"�<|L[D�ty"J��
�#�Hc^�ʘ�� L�X&n �����Gu�eI Xe��Ru"�C(�F�����)�u��nc\��r�p<i_����� �OS'���>\K������L�Yx�t�k�����*!��XDԧ:7!��0��ܴ�_�ՔiU�w�C��mq轇�Ux�.o�@<���}�Z�� �����g�yw���=zٌ���M��e%-X��7��U�㯿�ܡ�8�j���
A`��I
L0C6s�e��8i�������I�Ѭo.,�o�4�a�����s��6���Yg�i���Ɓ=�����7���NK��0Z��!I�4.y�܁��G��7eB���Fq�? �ߑR��X��Mǡ���T'�Q�)9*i!���� OE�������Z��?�_�      �   *   x���  ��w;�'����s�$ͲH��!�eL���U[�      �   4   x�3��M�+I����L�+��2����-�L�J�2�t�,.)-J������� I?�      �   ,   x�3�t�IJ<�13�ˈ�'3� 3�*�˘�)?%5=�+F��� ��
�      �   '   x�3���)�M��2�H-��2�t�))-J����� ��^      �   0   x�3�tL����,.)JL�/�2�tN,N-I�22�t�OIMO����� h�      �   )   x�3�4���,)�/�2�42�����9�9}S��1z\\\ ��	}      �   �  x����r�0���)�`k#_$v�b�CpC/�ld���/���V�>B^���ӖUG3gF3:G��;@�r�JQ���|�b�����^6Zײ�h;:�]��:�r���kd��n��"�U��m�C*��X�) !���)�P4-[����J$H���6%������OU����7��ѯ.����C��͛�;Mšw;6<l��DA$� �4o�J�0�Y\j�Jd0�/�{Y�F9��C�;6�W��Ϝ�]��.�w�Ӊs ^�zN�?�Ƹz�o��C2Y��f��.�S��y�s��\-g3~"e�w� �R	�E���[��L���Δ�Y�L�Ĕ��M(� KG�?�t/�X���:�Cթ'���F���L0�v�O^�y����,��N/�r�~!���'�0�١ȵUjӼ���8�y����(��>�V�'5��      �   �   x�}�K� �5=�\��CKp��ĕ���
	}��3x1����$��(�`<�fU�Ȏ�ɾ��0A���f:ie(��N�.Z��mFg)�Y��8X6I�0)�P���yϵ�o^,��L�׃4�
���JG!g�sH�[�~��*O|M��zM�'�L�m;4��X�"b"|,#V��uĚ����4)m@`�c�������.I�/����      �   �   x�U��
1E뙯�(L6��zET,��&�A|��l�����p8��5={��ˬk���l�<���p�qޢ��ܤ��|�;A�1��6�Q�@�5�c���<;���t�ͮ�]�*��6�0��7�x�#�e�+f     