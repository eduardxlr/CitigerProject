PGDMP                         y            citigerproject     13.4 (Ubuntu 13.4-1.pgdg18.04+1)     13.4 (Ubuntu 13.4-1.pgdg18.04+1) O   �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16904    citigerproject    DATABASE     c   CREATE DATABASE citigerproject WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'es_SV.UTF-8';
    DROP DATABASE citigerproject;
                eduardo    false                       1255    16905    sp_historialinventario()    FUNCTION     �   CREATE FUNCTION public.sp_historialinventario() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO historialInventario(idMaterial, cantidad, fecha) VALUES(old.idMaterial, old.cantidad, current_date);
RETURN NEW;
END
$$;
 /   DROP FUNCTION public.sp_historialinventario();
       public          postgres    false            �            1259    16906    alquiler    TABLE     ^  CREATE TABLE public.alquiler (
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
       public         heap    postgres    false            �            1259    16912    alquiler_idalquiler_seq    SEQUENCE     �   CREATE SEQUENCE public.alquiler_idalquiler_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.alquiler_idalquiler_seq;
       public          postgres    false    200            �           0    0    alquiler_idalquiler_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.alquiler_idalquiler_seq OWNED BY public.alquiler.idalquiler;
          public          postgres    false    201            �            1259    16914 
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
       public         heap    postgres    false            �            1259    16920    aportacion_idaportacion_seq    SEQUENCE     �   CREATE SEQUENCE public.aportacion_idaportacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.aportacion_idaportacion_seq;
       public          postgres    false    202            �           0    0    aportacion_idaportacion_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.aportacion_idaportacion_seq OWNED BY public.aportacion.idaportacion;
          public          postgres    false    203            �            1259    16922    bitacora    TABLE       CREATE TABLE public.bitacora (
    idbitacora integer NOT NULL,
    idusuario integer NOT NULL,
    hora time without time zone NOT NULL,
    fecha date NOT NULL,
    accion character varying(20) NOT NULL,
    descripcion character varying(200) NOT NULL
);
    DROP TABLE public.bitacora;
       public         heap    postgres    false            �            1259    16925    bitacora_idbitacora_seq    SEQUENCE     �   CREATE SEQUENCE public.bitacora_idbitacora_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.bitacora_idbitacora_seq;
       public          postgres    false    204            �           0    0    bitacora_idbitacora_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.bitacora_idbitacora_seq OWNED BY public.bitacora.idbitacora;
          public          postgres    false    205            �            1259    16927    bitacoraresidente    TABLE       CREATE TABLE public.bitacoraresidente (
    idbitacora integer NOT NULL,
    idresidente integer NOT NULL,
    hora time without time zone NOT NULL,
    fecha date NOT NULL,
    accion character varying(20) NOT NULL,
    descripcion character varying(200) NOT NULL
);
 %   DROP TABLE public.bitacoraresidente;
       public         heap    postgres    false            �            1259    16930     bitacoraresidente_idbitacora_seq    SEQUENCE     �   CREATE SEQUENCE public.bitacoraresidente_idbitacora_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.bitacoraresidente_idbitacora_seq;
       public          postgres    false    206            �           0    0     bitacoraresidente_idbitacora_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.bitacoraresidente_idbitacora_seq OWNED BY public.bitacoraresidente.idbitacora;
          public          postgres    false    207            �            1259    16932    casa    TABLE     �   CREATE TABLE public.casa (
    idcasa integer NOT NULL,
    idestadocasa integer NOT NULL,
    numerocasa numeric NOT NULL,
    direccion character varying(200) NOT NULL
);
    DROP TABLE public.casa;
       public         heap    postgres    false            �            1259    16938    casa_idcasa_seq    SEQUENCE     �   CREATE SEQUENCE public.casa_idcasa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.casa_idcasa_seq;
       public          postgres    false    208            �           0    0    casa_idcasa_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.casa_idcasa_seq OWNED BY public.casa.idcasa;
          public          postgres    false    209            �            1259    16940 	   categoria    TABLE     r   CREATE TABLE public.categoria (
    idcategoria integer NOT NULL,
    categoria character varying(40) NOT NULL
);
    DROP TABLE public.categoria;
       public         heap    postgres    false            �            1259    16943    categoria_idcategoria_seq    SEQUENCE     �   CREATE SEQUENCE public.categoria_idcategoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.categoria_idcategoria_seq;
       public          postgres    false    210            �           0    0    categoria_idcategoria_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.categoria_idcategoria_seq OWNED BY public.categoria.idcategoria;
          public          postgres    false    211            �            1259    16945    denuncia    TABLE     8  CREATE TABLE public.denuncia (
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
       public         heap    postgres    false            �            1259    16948    denuncia_iddenuncia_seq    SEQUENCE     �   CREATE SEQUENCE public.denuncia_iddenuncia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.denuncia_iddenuncia_seq;
       public          postgres    false    212            �           0    0    denuncia_iddenuncia_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.denuncia_iddenuncia_seq OWNED BY public.denuncia.iddenuncia;
          public          postgres    false    213            �            1259    16950    detallematerial    TABLE     �   CREATE TABLE public.detallematerial (
    iddetallematerial integer NOT NULL,
    idpedido integer NOT NULL,
    idmaterial integer NOT NULL,
    preciomaterial numeric NOT NULL,
    cantidadmaterial numeric NOT NULL
);
 #   DROP TABLE public.detallematerial;
       public         heap    postgres    false            �            1259    16956 %   detallematerial_iddetallematerial_seq    SEQUENCE     �   CREATE SEQUENCE public.detallematerial_iddetallematerial_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.detallematerial_iddetallematerial_seq;
       public          postgres    false    214            �           0    0 %   detallematerial_iddetallematerial_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.detallematerial_iddetallematerial_seq OWNED BY public.detallematerial.iddetallematerial;
          public          postgres    false    215            �            1259    16958    detallevisita    TABLE     �   CREATE TABLE public.detallevisita (
    iddetallevisita integer NOT NULL,
    idvisita integer NOT NULL,
    idvisitante integer NOT NULL
);
 !   DROP TABLE public.detallevisita;
       public         heap    postgres    false            �            1259    16961 !   detallevisita_iddetallevisita_seq    SEQUENCE     �   CREATE SEQUENCE public.detallevisita_iddetallevisita_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.detallevisita_iddetallevisita_seq;
       public          postgres    false    216            �           0    0 !   detallevisita_iddetallevisita_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.detallevisita_iddetallevisita_seq OWNED BY public.detallevisita.iddetallevisita;
          public          postgres    false    217            �            1259    16963    empleado    TABLE     �  CREATE TABLE public.empleado (
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
       public         heap    postgres    false            �            1259    16966    empleado_idempleado_seq    SEQUENCE     �   CREATE SEQUENCE public.empleado_idempleado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.empleado_idempleado_seq;
       public          postgres    false    218            �           0    0    empleado_idempleado_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.empleado_idempleado_seq OWNED BY public.empleado.idempleado;
          public          postgres    false    219            �            1259    16968    espacio    TABLE       CREATE TABLE public.espacio (
    idespacio integer NOT NULL,
    idestadoespacio integer NOT NULL,
    nombre character varying(30) NOT NULL,
    descripcion character varying(200) NOT NULL,
    capacidad numeric NOT NULL,
    imagenprincipal character varying(50)
);
    DROP TABLE public.espacio;
       public         heap    postgres    false            �            1259    16974    espacio_idespacio_seq    SEQUENCE     �   CREATE SEQUENCE public.espacio_idespacio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.espacio_idespacio_seq;
       public          postgres    false    220            �           0    0    espacio_idespacio_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.espacio_idespacio_seq OWNED BY public.espacio.idespacio;
          public          postgres    false    221            �            1259    16976    estadoalquiler    TABLE     �   CREATE TABLE public.estadoalquiler (
    idestadoalquiler integer NOT NULL,
    estadoalquiler character varying(15) NOT NULL
);
 "   DROP TABLE public.estadoalquiler;
       public         heap    postgres    false            �            1259    16979 #   estadoalquiler_idestadoalquiler_seq    SEQUENCE     �   CREATE SEQUENCE public.estadoalquiler_idestadoalquiler_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.estadoalquiler_idestadoalquiler_seq;
       public          postgres    false    222            �           0    0 #   estadoalquiler_idestadoalquiler_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.estadoalquiler_idestadoalquiler_seq OWNED BY public.estadoalquiler.idestadoalquiler;
          public          postgres    false    223            �            1259    16981    estadoaportacion    TABLE     �   CREATE TABLE public.estadoaportacion (
    idestadoaportacion integer NOT NULL,
    estadoaportacion character varying(15) NOT NULL
);
 $   DROP TABLE public.estadoaportacion;
       public         heap    postgres    false            �            1259    16984 '   estadoaportacion_idestadoaportacion_seq    SEQUENCE     �   CREATE SEQUENCE public.estadoaportacion_idestadoaportacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.estadoaportacion_idestadoaportacion_seq;
       public          postgres    false    224            �           0    0 '   estadoaportacion_idestadoaportacion_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public.estadoaportacion_idestadoaportacion_seq OWNED BY public.estadoaportacion.idestadoaportacion;
          public          postgres    false    225            �            1259    16986 
   estadocasa    TABLE     u   CREATE TABLE public.estadocasa (
    idestadocasa integer NOT NULL,
    estadocasa character varying(15) NOT NULL
);
    DROP TABLE public.estadocasa;
       public         heap    postgres    false            �            1259    16989    estadocasa_idestadocasa_seq    SEQUENCE     �   CREATE SEQUENCE public.estadocasa_idestadocasa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.estadocasa_idestadocasa_seq;
       public          postgres    false    226            �           0    0    estadocasa_idestadocasa_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.estadocasa_idestadocasa_seq OWNED BY public.estadocasa.idestadocasa;
          public          postgres    false    227            �            1259    16991    estadodenuncia    TABLE     �   CREATE TABLE public.estadodenuncia (
    idestadodenuncia integer NOT NULL,
    estadodenuncia character varying(15) NOT NULL
);
 "   DROP TABLE public.estadodenuncia;
       public         heap    postgres    false            �            1259    16994 #   estadodenuncia_idestadodenuncia_seq    SEQUENCE     �   CREATE SEQUENCE public.estadodenuncia_idestadodenuncia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.estadodenuncia_idestadodenuncia_seq;
       public          postgres    false    228            �           0    0 #   estadodenuncia_idestadodenuncia_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.estadodenuncia_idestadodenuncia_seq OWNED BY public.estadodenuncia.idestadodenuncia;
          public          postgres    false    229            �            1259    16996    estadoempleado    TABLE     �   CREATE TABLE public.estadoempleado (
    idestadoempleado integer NOT NULL,
    estadoempleado character varying(20) NOT NULL
);
 "   DROP TABLE public.estadoempleado;
       public         heap    postgres    false            �            1259    16999 #   estadoempleado_idestadoempleado_seq    SEQUENCE     �   CREATE SEQUENCE public.estadoempleado_idestadoempleado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.estadoempleado_idestadoempleado_seq;
       public          postgres    false    230            �           0    0 #   estadoempleado_idestadoempleado_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.estadoempleado_idestadoempleado_seq OWNED BY public.estadoempleado.idestadoempleado;
          public          postgres    false    231            �            1259    17001    estadoespacio    TABLE     ~   CREATE TABLE public.estadoespacio (
    idestadoespacio integer NOT NULL,
    estadoespacio character varying(15) NOT NULL
);
 !   DROP TABLE public.estadoespacio;
       public         heap    postgres    false            �            1259    17004 !   estadoespacio_idestadoespacio_seq    SEQUENCE     �   CREATE SEQUENCE public.estadoespacio_idestadoespacio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.estadoespacio_idestadoespacio_seq;
       public          postgres    false    232            �           0    0 !   estadoespacio_idestadoespacio_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.estadoespacio_idestadoespacio_seq OWNED BY public.estadoespacio.idestadoespacio;
          public          postgres    false    233            �            1259    17006    estadopedido    TABLE     {   CREATE TABLE public.estadopedido (
    idestadopedido integer NOT NULL,
    estadopedido character varying(15) NOT NULL
);
     DROP TABLE public.estadopedido;
       public         heap    postgres    false            �            1259    17009    estadopedido_idestadopedido_seq    SEQUENCE     �   CREATE SEQUENCE public.estadopedido_idestadopedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.estadopedido_idestadopedido_seq;
       public          postgres    false    234            �           0    0    estadopedido_idestadopedido_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.estadopedido_idestadopedido_seq OWNED BY public.estadopedido.idestadopedido;
          public          postgres    false    235            �            1259    17011    estadoresidente    TABLE     �   CREATE TABLE public.estadoresidente (
    idestadoresidente integer NOT NULL,
    estadoresidente character varying(15) NOT NULL
);
 #   DROP TABLE public.estadoresidente;
       public         heap    postgres    false            �            1259    17014 %   estadoresidente_idestadoresidente_seq    SEQUENCE     �   CREATE SEQUENCE public.estadoresidente_idestadoresidente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.estadoresidente_idestadoresidente_seq;
       public          postgres    false    236            �           0    0 %   estadoresidente_idestadoresidente_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.estadoresidente_idestadoresidente_seq OWNED BY public.estadoresidente.idestadoresidente;
          public          postgres    false    237            �            1259    17016    estadousuario    TABLE     ~   CREATE TABLE public.estadousuario (
    idestadousuario integer NOT NULL,
    estadousuario character varying(20) NOT NULL
);
 !   DROP TABLE public.estadousuario;
       public         heap    postgres    false            �            1259    17019 !   estadousuario_idestadousuario_seq    SEQUENCE     �   CREATE SEQUENCE public.estadousuario_idestadousuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.estadousuario_idestadousuario_seq;
       public          postgres    false    238            �           0    0 !   estadousuario_idestadousuario_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.estadousuario_idestadousuario_seq OWNED BY public.estadousuario.idestadousuario;
          public          postgres    false    239            �            1259    17021    estadovisita    TABLE     {   CREATE TABLE public.estadovisita (
    idestadovisita integer NOT NULL,
    estadovisita character varying(15) NOT NULL
);
     DROP TABLE public.estadovisita;
       public         heap    postgres    false            �            1259    17024    estadovisita_idestadovisita_seq    SEQUENCE     �   CREATE SEQUENCE public.estadovisita_idestadovisita_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.estadovisita_idestadovisita_seq;
       public          postgres    false    240            �           0    0    estadovisita_idestadovisita_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.estadovisita_idestadovisita_seq OWNED BY public.estadovisita.idestadovisita;
          public          postgres    false    241            �            1259    17026    historialinventario    TABLE     �   CREATE TABLE public.historialinventario (
    idhistorialinventario integer NOT NULL,
    idmaterial integer NOT NULL,
    cantidad numeric NOT NULL,
    fecha date NOT NULL
);
 '   DROP TABLE public.historialinventario;
       public         heap    postgres    false            �            1259    17032 -   historialinventario_idhistorialinventario_seq    SEQUENCE     �   CREATE SEQUENCE public.historialinventario_idhistorialinventario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 D   DROP SEQUENCE public.historialinventario_idhistorialinventario_seq;
       public          postgres    false    242            �           0    0 -   historialinventario_idhistorialinventario_seq    SEQUENCE OWNED BY        ALTER SEQUENCE public.historialinventario_idhistorialinventario_seq OWNED BY public.historialinventario.idhistorialinventario;
          public          postgres    false    243            �            1259    17034    imagenesespacio    TABLE     �   CREATE TABLE public.imagenesespacio (
    idimagenesespacio integer NOT NULL,
    imagen character varying(50),
    idespacio integer
);
 #   DROP TABLE public.imagenesespacio;
       public         heap    postgres    false            �            1259    17037 %   imagenesespacio_idimagenesespacio_seq    SEQUENCE     �   CREATE SEQUENCE public.imagenesespacio_idimagenesespacio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.imagenesespacio_idimagenesespacio_seq;
       public          postgres    false    244            �           0    0 %   imagenesespacio_idimagenesespacio_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.imagenesespacio_idimagenesespacio_seq OWNED BY public.imagenesespacio.idimagenesespacio;
          public          postgres    false    245            �            1259    17039    marca    TABLE     f   CREATE TABLE public.marca (
    idmarca integer NOT NULL,
    marca character varying(15) NOT NULL
);
    DROP TABLE public.marca;
       public         heap    postgres    false            �            1259    17042    marca_idmarca_seq    SEQUENCE     �   CREATE SEQUENCE public.marca_idmarca_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.marca_idmarca_seq;
       public          postgres    false    246            �           0    0    marca_idmarca_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.marca_idmarca_seq OWNED BY public.marca.idmarca;
          public          postgres    false    247            �            1259    17044    material    TABLE     �  CREATE TABLE public.material (
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
       public         heap    postgres    false            �            1259    17050    material_idmaterial_seq    SEQUENCE     �   CREATE SEQUENCE public.material_idmaterial_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.material_idmaterial_seq;
       public          postgres    false    248            �           0    0    material_idmaterial_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.material_idmaterial_seq OWNED BY public.material.idmaterial;
          public          postgres    false    249            �            1259    17052    mespago    TABLE     �   CREATE TABLE public.mespago (
    idmespago integer NOT NULL,
    mes character varying(10) NOT NULL,
    ano numeric NOT NULL
);
    DROP TABLE public.mespago;
       public         heap    postgres    false            �            1259    17058    mespago_idmespago_seq    SEQUENCE     �   CREATE SEQUENCE public.mespago_idmespago_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.mespago_idmespago_seq;
       public          postgres    false    250            �           0    0    mespago_idmespago_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.mespago_idmespago_seq OWNED BY public.mespago.idmespago;
          public          postgres    false    251            �            1259    17060    pedido    TABLE     �   CREATE TABLE public.pedido (
    idpedido integer NOT NULL,
    idestadopedido integer NOT NULL,
    idusuario integer NOT NULL,
    idempleado integer,
    fechapedido date NOT NULL
);
    DROP TABLE public.pedido;
       public         heap    postgres    false            �            1259    17063    pedido_idpedido_seq    SEQUENCE     �   CREATE SEQUENCE public.pedido_idpedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.pedido_idpedido_seq;
       public          postgres    false    252            �           0    0    pedido_idpedido_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.pedido_idpedido_seq OWNED BY public.pedido.idpedido;
          public          postgres    false    253            �            1259    17065    permiso    TABLE     l   CREATE TABLE public.permiso (
    idpermiso integer NOT NULL,
    permiso character varying(30) NOT NULL
);
    DROP TABLE public.permiso;
       public         heap    postgres    false            �            1259    17068    permiso_idpermiso_seq    SEQUENCE     �   CREATE SEQUENCE public.permiso_idpermiso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.permiso_idpermiso_seq;
       public          postgres    false    254            �           0    0    permiso_idpermiso_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.permiso_idpermiso_seq OWNED BY public.permiso.idpermiso;
          public          postgres    false    255                        1259    17070    permisousuario    TABLE     �   CREATE TABLE public.permisousuario (
    idpermisousuario integer NOT NULL,
    idtipousuario integer NOT NULL,
    idpermiso integer NOT NULL,
    permitido character(1) NOT NULL
);
 "   DROP TABLE public.permisousuario;
       public         heap    postgres    false                       1259    17073 #   permisousuario_idpermisousuario_seq    SEQUENCE     �   CREATE SEQUENCE public.permisousuario_idpermisousuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.permisousuario_idpermisousuario_seq;
       public          postgres    false    256            �           0    0 #   permisousuario_idpermisousuario_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.permisousuario_idpermisousuario_seq OWNED BY public.permisousuario.idpermisousuario;
          public          postgres    false    257                       1259    17075 	   residente    TABLE     �  CREATE TABLE public.residente (
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
    codigo integer,
    autenticacion character(2)
);
    DROP TABLE public.residente;
       public         heap    postgres    false                       1259    17078    residente_idresidente_seq    SEQUENCE     �   CREATE SEQUENCE public.residente_idresidente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.residente_idresidente_seq;
       public          postgres    false    258            �           0    0    residente_idresidente_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.residente_idresidente_seq OWNED BY public.residente.idresidente;
          public          postgres    false    259                       1259    17080    residentecasa    TABLE     �   CREATE TABLE public.residentecasa (
    idresidentecasa integer NOT NULL,
    idresidente integer NOT NULL,
    idcasa integer NOT NULL
);
 !   DROP TABLE public.residentecasa;
       public         heap    postgres    false                       1259    17083 !   residentecasa_idresidentecasa_seq    SEQUENCE     �   CREATE SEQUENCE public.residentecasa_idresidentecasa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.residentecasa_idresidentecasa_seq;
       public          postgres    false    260            �           0    0 !   residentecasa_idresidentecasa_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.residentecasa_idresidentecasa_seq OWNED BY public.residentecasa.idresidentecasa;
          public          postgres    false    261                       1259    17085    tipodenuncia    TABLE     {   CREATE TABLE public.tipodenuncia (
    idtipodenuncia integer NOT NULL,
    tipodenuncia character varying(15) NOT NULL
);
     DROP TABLE public.tipodenuncia;
       public         heap    postgres    false                       1259    17088    tipodenuncia_idtipodenuncia_seq    SEQUENCE     �   CREATE SEQUENCE public.tipodenuncia_idtipodenuncia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.tipodenuncia_idtipodenuncia_seq;
       public          postgres    false    262            �           0    0    tipodenuncia_idtipodenuncia_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.tipodenuncia_idtipodenuncia_seq OWNED BY public.tipodenuncia.idtipodenuncia;
          public          postgres    false    263                       1259    17090    tipoempleado    TABLE     {   CREATE TABLE public.tipoempleado (
    idtipoempleado integer NOT NULL,
    tipoempleado character varying(15) NOT NULL
);
     DROP TABLE public.tipoempleado;
       public         heap    postgres    false            	           1259    17093    tipoempleado_idtipoempleado_seq    SEQUENCE     �   CREATE SEQUENCE public.tipoempleado_idtipoempleado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.tipoempleado_idtipoempleado_seq;
       public          postgres    false    264            �           0    0    tipoempleado_idtipoempleado_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.tipoempleado_idtipoempleado_seq OWNED BY public.tipoempleado.idtipoempleado;
          public          postgres    false    265            
           1259    17095 
   tipounidad    TABLE     u   CREATE TABLE public.tipounidad (
    idtipounidad integer NOT NULL,
    tipounidad character varying(20) NOT NULL
);
    DROP TABLE public.tipounidad;
       public         heap    postgres    false                       1259    17098    tipounidad_idtipounidad_seq    SEQUENCE     �   CREATE SEQUENCE public.tipounidad_idtipounidad_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.tipounidad_idtipounidad_seq;
       public          postgres    false    266            �           0    0    tipounidad_idtipounidad_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.tipounidad_idtipounidad_seq OWNED BY public.tipounidad.idtipounidad;
          public          postgres    false    267                       1259    17100    tipousuario    TABLE     x   CREATE TABLE public.tipousuario (
    idtipousuario integer NOT NULL,
    tipousuario character varying(15) NOT NULL
);
    DROP TABLE public.tipousuario;
       public         heap    postgres    false                       1259    17103    tipousuario_idtipousuario_seq    SEQUENCE     �   CREATE SEQUENCE public.tipousuario_idtipousuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.tipousuario_idtipousuario_seq;
       public          postgres    false    268            �           0    0    tipousuario_idtipousuario_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.tipousuario_idtipousuario_seq OWNED BY public.tipousuario.idtipousuario;
          public          postgres    false    269                       1259    17105    unidadmedida    TABLE     �   CREATE TABLE public.unidadmedida (
    idunidadmedida integer NOT NULL,
    idtipounidad integer NOT NULL,
    unidadmedida character varying(15) NOT NULL
);
     DROP TABLE public.unidadmedida;
       public         heap    postgres    false                       1259    17108    unidadmedida_idunidadmedida_seq    SEQUENCE     �   CREATE SEQUENCE public.unidadmedida_idunidadmedida_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.unidadmedida_idunidadmedida_seq;
       public          postgres    false    270            �           0    0    unidadmedida_idunidadmedida_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.unidadmedida_idunidadmedida_seq OWNED BY public.unidadmedida.idunidadmedida;
          public          postgres    false    271                       1259    17110    usuario    TABLE     �  CREATE TABLE public.usuario (
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
    codigo integer,
    autenticacion character(2) NOT NULL
);
    DROP TABLE public.usuario;
       public         heap    postgres    false                       1259    17113    usuario_idusuario_seq    SEQUENCE     �   CREATE SEQUENCE public.usuario_idusuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.usuario_idusuario_seq;
       public          postgres    false    272            �           0    0    usuario_idusuario_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.usuario_idusuario_seq OWNED BY public.usuario.idusuario;
          public          postgres    false    273                       1259    17115    visita    TABLE     �   CREATE TABLE public.visita (
    idvisita integer NOT NULL,
    idresidente integer NOT NULL,
    fecha date NOT NULL,
    visitarecurrente character(2) NOT NULL,
    observacion character varying(200) NOT NULL,
    idestadovisita integer NOT NULL
);
    DROP TABLE public.visita;
       public         heap    postgres    false                       1259    17118    visita_idvisita_seq    SEQUENCE     �   CREATE SEQUENCE public.visita_idvisita_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.visita_idvisita_seq;
       public          postgres    false    274            �           0    0    visita_idvisita_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.visita_idvisita_seq OWNED BY public.visita.idvisita;
          public          postgres    false    275                       1259    17120 	   visitante    TABLE       CREATE TABLE public.visitante (
    idvisitante integer NOT NULL,
    nombre character varying(30) NOT NULL,
    apellido character varying(30) NOT NULL,
    dui character(10) NOT NULL,
    genero character(1) NOT NULL,
    placa character varying(10) NOT NULL
);
    DROP TABLE public.visitante;
       public         heap    postgres    false                       1259    17123    visitante_idvisitante_seq    SEQUENCE     �   CREATE SEQUENCE public.visitante_idvisitante_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.visitante_idvisitante_seq;
       public          postgres    false    276            �           0    0    visitante_idvisitante_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.visitante_idvisitante_seq OWNED BY public.visitante.idvisitante;
          public          postgres    false    277            #           2604    17125    alquiler idalquiler    DEFAULT     z   ALTER TABLE ONLY public.alquiler ALTER COLUMN idalquiler SET DEFAULT nextval('public.alquiler_idalquiler_seq'::regclass);
 B   ALTER TABLE public.alquiler ALTER COLUMN idalquiler DROP DEFAULT;
       public          postgres    false    201    200            $           2604    17126    aportacion idaportacion    DEFAULT     �   ALTER TABLE ONLY public.aportacion ALTER COLUMN idaportacion SET DEFAULT nextval('public.aportacion_idaportacion_seq'::regclass);
 F   ALTER TABLE public.aportacion ALTER COLUMN idaportacion DROP DEFAULT;
       public          postgres    false    203    202            %           2604    17127    bitacora idbitacora    DEFAULT     z   ALTER TABLE ONLY public.bitacora ALTER COLUMN idbitacora SET DEFAULT nextval('public.bitacora_idbitacora_seq'::regclass);
 B   ALTER TABLE public.bitacora ALTER COLUMN idbitacora DROP DEFAULT;
       public          postgres    false    205    204            &           2604    17128    bitacoraresidente idbitacora    DEFAULT     �   ALTER TABLE ONLY public.bitacoraresidente ALTER COLUMN idbitacora SET DEFAULT nextval('public.bitacoraresidente_idbitacora_seq'::regclass);
 K   ALTER TABLE public.bitacoraresidente ALTER COLUMN idbitacora DROP DEFAULT;
       public          postgres    false    207    206            '           2604    17129    casa idcasa    DEFAULT     j   ALTER TABLE ONLY public.casa ALTER COLUMN idcasa SET DEFAULT nextval('public.casa_idcasa_seq'::regclass);
 :   ALTER TABLE public.casa ALTER COLUMN idcasa DROP DEFAULT;
       public          postgres    false    209    208            (           2604    17130    categoria idcategoria    DEFAULT     ~   ALTER TABLE ONLY public.categoria ALTER COLUMN idcategoria SET DEFAULT nextval('public.categoria_idcategoria_seq'::regclass);
 D   ALTER TABLE public.categoria ALTER COLUMN idcategoria DROP DEFAULT;
       public          postgres    false    211    210            )           2604    17131    denuncia iddenuncia    DEFAULT     z   ALTER TABLE ONLY public.denuncia ALTER COLUMN iddenuncia SET DEFAULT nextval('public.denuncia_iddenuncia_seq'::regclass);
 B   ALTER TABLE public.denuncia ALTER COLUMN iddenuncia DROP DEFAULT;
       public          postgres    false    213    212            *           2604    17132 !   detallematerial iddetallematerial    DEFAULT     �   ALTER TABLE ONLY public.detallematerial ALTER COLUMN iddetallematerial SET DEFAULT nextval('public.detallematerial_iddetallematerial_seq'::regclass);
 P   ALTER TABLE public.detallematerial ALTER COLUMN iddetallematerial DROP DEFAULT;
       public          postgres    false    215    214            +           2604    17133    detallevisita iddetallevisita    DEFAULT     �   ALTER TABLE ONLY public.detallevisita ALTER COLUMN iddetallevisita SET DEFAULT nextval('public.detallevisita_iddetallevisita_seq'::regclass);
 L   ALTER TABLE public.detallevisita ALTER COLUMN iddetallevisita DROP DEFAULT;
       public          postgres    false    217    216            ,           2604    17134    empleado idempleado    DEFAULT     z   ALTER TABLE ONLY public.empleado ALTER COLUMN idempleado SET DEFAULT nextval('public.empleado_idempleado_seq'::regclass);
 B   ALTER TABLE public.empleado ALTER COLUMN idempleado DROP DEFAULT;
       public          postgres    false    219    218            -           2604    17135    espacio idespacio    DEFAULT     v   ALTER TABLE ONLY public.espacio ALTER COLUMN idespacio SET DEFAULT nextval('public.espacio_idespacio_seq'::regclass);
 @   ALTER TABLE public.espacio ALTER COLUMN idespacio DROP DEFAULT;
       public          postgres    false    221    220            .           2604    17136    estadoalquiler idestadoalquiler    DEFAULT     �   ALTER TABLE ONLY public.estadoalquiler ALTER COLUMN idestadoalquiler SET DEFAULT nextval('public.estadoalquiler_idestadoalquiler_seq'::regclass);
 N   ALTER TABLE public.estadoalquiler ALTER COLUMN idestadoalquiler DROP DEFAULT;
       public          postgres    false    223    222            /           2604    17137 #   estadoaportacion idestadoaportacion    DEFAULT     �   ALTER TABLE ONLY public.estadoaportacion ALTER COLUMN idestadoaportacion SET DEFAULT nextval('public.estadoaportacion_idestadoaportacion_seq'::regclass);
 R   ALTER TABLE public.estadoaportacion ALTER COLUMN idestadoaportacion DROP DEFAULT;
       public          postgres    false    225    224            0           2604    17138    estadocasa idestadocasa    DEFAULT     �   ALTER TABLE ONLY public.estadocasa ALTER COLUMN idestadocasa SET DEFAULT nextval('public.estadocasa_idestadocasa_seq'::regclass);
 F   ALTER TABLE public.estadocasa ALTER COLUMN idestadocasa DROP DEFAULT;
       public          postgres    false    227    226            1           2604    17139    estadodenuncia idestadodenuncia    DEFAULT     �   ALTER TABLE ONLY public.estadodenuncia ALTER COLUMN idestadodenuncia SET DEFAULT nextval('public.estadodenuncia_idestadodenuncia_seq'::regclass);
 N   ALTER TABLE public.estadodenuncia ALTER COLUMN idestadodenuncia DROP DEFAULT;
       public          postgres    false    229    228            2           2604    17140    estadoempleado idestadoempleado    DEFAULT     �   ALTER TABLE ONLY public.estadoempleado ALTER COLUMN idestadoempleado SET DEFAULT nextval('public.estadoempleado_idestadoempleado_seq'::regclass);
 N   ALTER TABLE public.estadoempleado ALTER COLUMN idestadoempleado DROP DEFAULT;
       public          postgres    false    231    230            3           2604    17141    estadoespacio idestadoespacio    DEFAULT     �   ALTER TABLE ONLY public.estadoespacio ALTER COLUMN idestadoespacio SET DEFAULT nextval('public.estadoespacio_idestadoespacio_seq'::regclass);
 L   ALTER TABLE public.estadoespacio ALTER COLUMN idestadoespacio DROP DEFAULT;
       public          postgres    false    233    232            4           2604    17142    estadopedido idestadopedido    DEFAULT     �   ALTER TABLE ONLY public.estadopedido ALTER COLUMN idestadopedido SET DEFAULT nextval('public.estadopedido_idestadopedido_seq'::regclass);
 J   ALTER TABLE public.estadopedido ALTER COLUMN idestadopedido DROP DEFAULT;
       public          postgres    false    235    234            5           2604    17143 !   estadoresidente idestadoresidente    DEFAULT     �   ALTER TABLE ONLY public.estadoresidente ALTER COLUMN idestadoresidente SET DEFAULT nextval('public.estadoresidente_idestadoresidente_seq'::regclass);
 P   ALTER TABLE public.estadoresidente ALTER COLUMN idestadoresidente DROP DEFAULT;
       public          postgres    false    237    236            6           2604    17144    estadousuario idestadousuario    DEFAULT     �   ALTER TABLE ONLY public.estadousuario ALTER COLUMN idestadousuario SET DEFAULT nextval('public.estadousuario_idestadousuario_seq'::regclass);
 L   ALTER TABLE public.estadousuario ALTER COLUMN idestadousuario DROP DEFAULT;
       public          postgres    false    239    238            7           2604    17145    estadovisita idestadovisita    DEFAULT     �   ALTER TABLE ONLY public.estadovisita ALTER COLUMN idestadovisita SET DEFAULT nextval('public.estadovisita_idestadovisita_seq'::regclass);
 J   ALTER TABLE public.estadovisita ALTER COLUMN idestadovisita DROP DEFAULT;
       public          postgres    false    241    240            8           2604    17146 )   historialinventario idhistorialinventario    DEFAULT     �   ALTER TABLE ONLY public.historialinventario ALTER COLUMN idhistorialinventario SET DEFAULT nextval('public.historialinventario_idhistorialinventario_seq'::regclass);
 X   ALTER TABLE public.historialinventario ALTER COLUMN idhistorialinventario DROP DEFAULT;
       public          postgres    false    243    242            9           2604    17147 !   imagenesespacio idimagenesespacio    DEFAULT     �   ALTER TABLE ONLY public.imagenesespacio ALTER COLUMN idimagenesespacio SET DEFAULT nextval('public.imagenesespacio_idimagenesespacio_seq'::regclass);
 P   ALTER TABLE public.imagenesespacio ALTER COLUMN idimagenesespacio DROP DEFAULT;
       public          postgres    false    245    244            :           2604    17148    marca idmarca    DEFAULT     n   ALTER TABLE ONLY public.marca ALTER COLUMN idmarca SET DEFAULT nextval('public.marca_idmarca_seq'::regclass);
 <   ALTER TABLE public.marca ALTER COLUMN idmarca DROP DEFAULT;
       public          postgres    false    247    246            ;           2604    17149    material idmaterial    DEFAULT     z   ALTER TABLE ONLY public.material ALTER COLUMN idmaterial SET DEFAULT nextval('public.material_idmaterial_seq'::regclass);
 B   ALTER TABLE public.material ALTER COLUMN idmaterial DROP DEFAULT;
       public          postgres    false    249    248            <           2604    17150    mespago idmespago    DEFAULT     v   ALTER TABLE ONLY public.mespago ALTER COLUMN idmespago SET DEFAULT nextval('public.mespago_idmespago_seq'::regclass);
 @   ALTER TABLE public.mespago ALTER COLUMN idmespago DROP DEFAULT;
       public          postgres    false    251    250            =           2604    17151    pedido idpedido    DEFAULT     r   ALTER TABLE ONLY public.pedido ALTER COLUMN idpedido SET DEFAULT nextval('public.pedido_idpedido_seq'::regclass);
 >   ALTER TABLE public.pedido ALTER COLUMN idpedido DROP DEFAULT;
       public          postgres    false    253    252            >           2604    17152    permiso idpermiso    DEFAULT     v   ALTER TABLE ONLY public.permiso ALTER COLUMN idpermiso SET DEFAULT nextval('public.permiso_idpermiso_seq'::regclass);
 @   ALTER TABLE public.permiso ALTER COLUMN idpermiso DROP DEFAULT;
       public          postgres    false    255    254            ?           2604    17153    permisousuario idpermisousuario    DEFAULT     �   ALTER TABLE ONLY public.permisousuario ALTER COLUMN idpermisousuario SET DEFAULT nextval('public.permisousuario_idpermisousuario_seq'::regclass);
 N   ALTER TABLE public.permisousuario ALTER COLUMN idpermisousuario DROP DEFAULT;
       public          postgres    false    257    256            @           2604    17154    residente idresidente    DEFAULT     ~   ALTER TABLE ONLY public.residente ALTER COLUMN idresidente SET DEFAULT nextval('public.residente_idresidente_seq'::regclass);
 D   ALTER TABLE public.residente ALTER COLUMN idresidente DROP DEFAULT;
       public          postgres    false    259    258            A           2604    17155    residentecasa idresidentecasa    DEFAULT     �   ALTER TABLE ONLY public.residentecasa ALTER COLUMN idresidentecasa SET DEFAULT nextval('public.residentecasa_idresidentecasa_seq'::regclass);
 L   ALTER TABLE public.residentecasa ALTER COLUMN idresidentecasa DROP DEFAULT;
       public          postgres    false    261    260            B           2604    17156    tipodenuncia idtipodenuncia    DEFAULT     �   ALTER TABLE ONLY public.tipodenuncia ALTER COLUMN idtipodenuncia SET DEFAULT nextval('public.tipodenuncia_idtipodenuncia_seq'::regclass);
 J   ALTER TABLE public.tipodenuncia ALTER COLUMN idtipodenuncia DROP DEFAULT;
       public          postgres    false    263    262            C           2604    17157    tipoempleado idtipoempleado    DEFAULT     �   ALTER TABLE ONLY public.tipoempleado ALTER COLUMN idtipoempleado SET DEFAULT nextval('public.tipoempleado_idtipoempleado_seq'::regclass);
 J   ALTER TABLE public.tipoempleado ALTER COLUMN idtipoempleado DROP DEFAULT;
       public          postgres    false    265    264            D           2604    17158    tipounidad idtipounidad    DEFAULT     �   ALTER TABLE ONLY public.tipounidad ALTER COLUMN idtipounidad SET DEFAULT nextval('public.tipounidad_idtipounidad_seq'::regclass);
 F   ALTER TABLE public.tipounidad ALTER COLUMN idtipounidad DROP DEFAULT;
       public          postgres    false    267    266            E           2604    17159    tipousuario idtipousuario    DEFAULT     �   ALTER TABLE ONLY public.tipousuario ALTER COLUMN idtipousuario SET DEFAULT nextval('public.tipousuario_idtipousuario_seq'::regclass);
 H   ALTER TABLE public.tipousuario ALTER COLUMN idtipousuario DROP DEFAULT;
       public          postgres    false    269    268            F           2604    17160    unidadmedida idunidadmedida    DEFAULT     �   ALTER TABLE ONLY public.unidadmedida ALTER COLUMN idunidadmedida SET DEFAULT nextval('public.unidadmedida_idunidadmedida_seq'::regclass);
 J   ALTER TABLE public.unidadmedida ALTER COLUMN idunidadmedida DROP DEFAULT;
       public          postgres    false    271    270            G           2604    17161    usuario idusuario    DEFAULT     v   ALTER TABLE ONLY public.usuario ALTER COLUMN idusuario SET DEFAULT nextval('public.usuario_idusuario_seq'::regclass);
 @   ALTER TABLE public.usuario ALTER COLUMN idusuario DROP DEFAULT;
       public          postgres    false    273    272            H           2604    17162    visita idvisita    DEFAULT     r   ALTER TABLE ONLY public.visita ALTER COLUMN idvisita SET DEFAULT nextval('public.visita_idvisita_seq'::regclass);
 >   ALTER TABLE public.visita ALTER COLUMN idvisita DROP DEFAULT;
       public          postgres    false    275    274            I           2604    17163    visitante idvisitante    DEFAULT     ~   ALTER TABLE ONLY public.visitante ALTER COLUMN idvisitante SET DEFAULT nextval('public.visitante_idvisitante_seq'::regclass);
 D   ALTER TABLE public.visitante ALTER COLUMN idvisitante DROP DEFAULT;
       public          postgres    false    277    276            d          0    16906    alquiler 
   TABLE DATA           �   COPY public.alquiler (idalquiler, idestadoalquiler, idespacio, precio, idusuario, idresidente, fecha, horainicio, horafin) FROM stdin;
    public          postgres    false    200   /�      f          0    16914 
   aportacion 
   TABLE DATA           x   COPY public.aportacion (idaportacion, idcasa, idestadoaportacion, monto, idmespago, fechapago, descripcion) FROM stdin;
    public          postgres    false    202   ��      h          0    16922    bitacora 
   TABLE DATA           [   COPY public.bitacora (idbitacora, idusuario, hora, fecha, accion, descripcion) FROM stdin;
    public          postgres    false    204   ��      j          0    16927    bitacoraresidente 
   TABLE DATA           f   COPY public.bitacoraresidente (idbitacora, idresidente, hora, fecha, accion, descripcion) FROM stdin;
    public          postgres    false    206   ��      l          0    16932    casa 
   TABLE DATA           K   COPY public.casa (idcasa, idestadocasa, numerocasa, direccion) FROM stdin;
    public          postgres    false    208   ��      n          0    16940 	   categoria 
   TABLE DATA           ;   COPY public.categoria (idcategoria, categoria) FROM stdin;
    public          postgres    false    210   Z�      p          0    16945    denuncia 
   TABLE DATA           �   COPY public.denuncia (iddenuncia, idempleado, idresidente, idtipodenuncia, idestadodenuncia, fecha, descripcion, respuesta) FROM stdin;
    public          postgres    false    212   ��      r          0    16950    detallematerial 
   TABLE DATA           t   COPY public.detallematerial (iddetallematerial, idpedido, idmaterial, preciomaterial, cantidadmaterial) FROM stdin;
    public          postgres    false    214   ˳      t          0    16958    detallevisita 
   TABLE DATA           O   COPY public.detallevisita (iddetallevisita, idvisita, idvisitante) FROM stdin;
    public          postgres    false    216   .�      v          0    16963    empleado 
   TABLE DATA           �   COPY public.empleado (idempleado, idestadoempleado, idtipoempleado, nombre, apellido, telefono, dui, genero, foto, direccion, correo, fechanacimiento) FROM stdin;
    public          postgres    false    218   f�      x          0    16968    espacio 
   TABLE DATA           n   COPY public.espacio (idespacio, idestadoespacio, nombre, descripcion, capacidad, imagenprincipal) FROM stdin;
    public          postgres    false    220   ��      z          0    16976    estadoalquiler 
   TABLE DATA           J   COPY public.estadoalquiler (idestadoalquiler, estadoalquiler) FROM stdin;
    public          postgres    false    222   ��      |          0    16981    estadoaportacion 
   TABLE DATA           P   COPY public.estadoaportacion (idestadoaportacion, estadoaportacion) FROM stdin;
    public          postgres    false    224   ַ      ~          0    16986 
   estadocasa 
   TABLE DATA           >   COPY public.estadocasa (idestadocasa, estadocasa) FROM stdin;
    public          postgres    false    226   �      �          0    16991    estadodenuncia 
   TABLE DATA           J   COPY public.estadodenuncia (idestadodenuncia, estadodenuncia) FROM stdin;
    public          postgres    false    228   ;�      �          0    16996    estadoempleado 
   TABLE DATA           J   COPY public.estadoempleado (idestadoempleado, estadoempleado) FROM stdin;
    public          postgres    false    230   ��      �          0    17001    estadoespacio 
   TABLE DATA           G   COPY public.estadoespacio (idestadoespacio, estadoespacio) FROM stdin;
    public          postgres    false    232   Ӹ      �          0    17006    estadopedido 
   TABLE DATA           D   COPY public.estadopedido (idestadopedido, estadopedido) FROM stdin;
    public          postgres    false    234   �      �          0    17011    estadoresidente 
   TABLE DATA           M   COPY public.estadoresidente (idestadoresidente, estadoresidente) FROM stdin;
    public          postgres    false    236   d�      �          0    17016    estadousuario 
   TABLE DATA           G   COPY public.estadousuario (idestadousuario, estadousuario) FROM stdin;
    public          postgres    false    238   ��      �          0    17021    estadovisita 
   TABLE DATA           D   COPY public.estadovisita (idestadovisita, estadovisita) FROM stdin;
    public          postgres    false    240   ѹ      �          0    17026    historialinventario 
   TABLE DATA           a   COPY public.historialinventario (idhistorialinventario, idmaterial, cantidad, fecha) FROM stdin;
    public          postgres    false    242   �      �          0    17034    imagenesespacio 
   TABLE DATA           O   COPY public.imagenesespacio (idimagenesespacio, imagen, idespacio) FROM stdin;
    public          postgres    false    244   ��      �          0    17039    marca 
   TABLE DATA           /   COPY public.marca (idmarca, marca) FROM stdin;
    public          postgres    false    246   ֺ      �          0    17044    material 
   TABLE DATA           �   COPY public.material (idmaterial, nombreproducto, costo, imagen, idcategoria, "tamaño", descripcion, cantidad, idmarca, idunidadmedida) FROM stdin;
    public          postgres    false    248   �      �          0    17052    mespago 
   TABLE DATA           6   COPY public.mespago (idmespago, mes, ano) FROM stdin;
    public          postgres    false    250   8�      �          0    17060    pedido 
   TABLE DATA           ^   COPY public.pedido (idpedido, idestadopedido, idusuario, idempleado, fechapedido) FROM stdin;
    public          postgres    false    252   e�      �          0    17065    permiso 
   TABLE DATA           5   COPY public.permiso (idpermiso, permiso) FROM stdin;
    public          postgres    false    254   ��      �          0    17070    permisousuario 
   TABLE DATA           _   COPY public.permisousuario (idpermisousuario, idtipousuario, idpermiso, permitido) FROM stdin;
    public          postgres    false    256   �      �          0    17075 	   residente 
   TABLE DATA           �   COPY public.residente (idresidente, idestadoresidente, nombre, apellido, telefonofijo, telefonocelular, foto, correo, fechanacimiento, genero, dui, username, contrasena, modo, intentos, codigo, autenticacion) FROM stdin;
    public          postgres    false    258   n�      �          0    17080    residentecasa 
   TABLE DATA           M   COPY public.residentecasa (idresidentecasa, idresidente, idcasa) FROM stdin;
    public          postgres    false    260   ��      �          0    17085    tipodenuncia 
   TABLE DATA           D   COPY public.tipodenuncia (idtipodenuncia, tipodenuncia) FROM stdin;
    public          postgres    false    262   �      �          0    17090    tipoempleado 
   TABLE DATA           D   COPY public.tipoempleado (idtipoempleado, tipoempleado) FROM stdin;
    public          postgres    false    264   `�      �          0    17095 
   tipounidad 
   TABLE DATA           >   COPY public.tipounidad (idtipounidad, tipounidad) FROM stdin;
    public          postgres    false    266   ��      �          0    17100    tipousuario 
   TABLE DATA           A   COPY public.tipousuario (idtipousuario, tipousuario) FROM stdin;
    public          postgres    false    268   ��      �          0    17105    unidadmedida 
   TABLE DATA           R   COPY public.unidadmedida (idunidadmedida, idtipounidad, unidadmedida) FROM stdin;
    public          postgres    false    270   �      �          0    17110    usuario 
   TABLE DATA           �   COPY public.usuario (idusuario, idestadousuario, idtipousuario, nombre, apellido, telefonofijo, telefonocelular, foto, correo, fechanacimiento, genero, dui, username, contrasena, direccion, modo, intentos, codigo, autenticacion) FROM stdin;
    public          postgres    false    272   L�      �          0    17115    visita 
   TABLE DATA           m   COPY public.visita (idvisita, idresidente, fecha, visitarecurrente, observacion, idestadovisita) FROM stdin;
    public          postgres    false    274   �      �          0    17120 	   visitante 
   TABLE DATA           V   COPY public.visitante (idvisitante, nombre, apellido, dui, genero, placa) FROM stdin;
    public          postgres    false    276   ��      �           0    0    alquiler_idalquiler_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.alquiler_idalquiler_seq', 82, true);
          public          postgres    false    201            �           0    0    aportacion_idaportacion_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.aportacion_idaportacion_seq', 216, true);
          public          postgres    false    203            �           0    0    bitacora_idbitacora_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.bitacora_idbitacora_seq', 106, true);
          public          postgres    false    205            �           0    0     bitacoraresidente_idbitacora_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.bitacoraresidente_idbitacora_seq', 1, false);
          public          postgres    false    207            �           0    0    casa_idcasa_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.casa_idcasa_seq', 8, true);
          public          postgres    false    209            �           0    0    categoria_idcategoria_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.categoria_idcategoria_seq', 9, true);
          public          postgres    false    211            �           0    0    denuncia_iddenuncia_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.denuncia_iddenuncia_seq', 20, true);
          public          postgres    false    213            �           0    0 %   detallematerial_iddetallematerial_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.detallematerial_iddetallematerial_seq', 31, true);
          public          postgres    false    215            �           0    0 !   detallevisita_iddetallevisita_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.detallevisita_iddetallevisita_seq', 5, true);
          public          postgres    false    217            �           0    0    empleado_idempleado_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.empleado_idempleado_seq', 12, true);
          public          postgres    false    219            �           0    0    espacio_idespacio_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.espacio_idespacio_seq', 5, true);
          public          postgres    false    221            �           0    0 #   estadoalquiler_idestadoalquiler_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.estadoalquiler_idestadoalquiler_seq', 4, true);
          public          postgres    false    223            �           0    0 '   estadoaportacion_idestadoaportacion_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.estadoaportacion_idestadoaportacion_seq', 2, true);
          public          postgres    false    225            �           0    0    estadocasa_idestadocasa_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.estadocasa_idestadocasa_seq', 2, true);
          public          postgres    false    227            �           0    0 #   estadodenuncia_idestadodenuncia_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.estadodenuncia_idestadodenuncia_seq', 5, true);
          public          postgres    false    229            �           0    0 #   estadoempleado_idestadoempleado_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.estadoempleado_idestadoempleado_seq', 3, true);
          public          postgres    false    231            �           0    0 !   estadoespacio_idestadoespacio_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.estadoespacio_idestadoespacio_seq', 4, true);
          public          postgres    false    233            �           0    0    estadopedido_idestadopedido_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.estadopedido_idestadopedido_seq', 4, true);
          public          postgres    false    235            �           0    0 %   estadoresidente_idestadoresidente_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.estadoresidente_idestadoresidente_seq', 2, true);
          public          postgres    false    237            �           0    0 !   estadousuario_idestadousuario_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.estadousuario_idestadousuario_seq', 2, true);
          public          postgres    false    239            �           0    0    estadovisita_idestadovisita_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.estadovisita_idestadovisita_seq', 3, true);
          public          postgres    false    241            �           0    0 -   historialinventario_idhistorialinventario_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('public.historialinventario_idhistorialinventario_seq', 17, true);
          public          postgres    false    243            �           0    0 %   imagenesespacio_idimagenesespacio_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.imagenesespacio_idimagenesespacio_seq', 3, true);
          public          postgres    false    245            �           0    0    marca_idmarca_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.marca_idmarca_seq', 5, true);
          public          postgres    false    247            �           0    0    material_idmaterial_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.material_idmaterial_seq', 6, true);
          public          postgres    false    249            �           0    0    mespago_idmespago_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.mespago_idmespago_seq', 60, true);
          public          postgres    false    251            �           0    0    pedido_idpedido_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.pedido_idpedido_seq', 7, true);
          public          postgres    false    253            �           0    0    permiso_idpermiso_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.permiso_idpermiso_seq', 6, true);
          public          postgres    false    255            �           0    0 #   permisousuario_idpermisousuario_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.permisousuario_idpermisousuario_seq', 127, true);
          public          postgres    false    257            �           0    0    residente_idresidente_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.residente_idresidente_seq', 8, true);
          public          postgres    false    259            �           0    0 !   residentecasa_idresidentecasa_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.residentecasa_idresidentecasa_seq', 10, true);
          public          postgres    false    261            �           0    0    tipodenuncia_idtipodenuncia_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.tipodenuncia_idtipodenuncia_seq', 3, true);
          public          postgres    false    263            �           0    0    tipoempleado_idtipoempleado_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.tipoempleado_idtipoempleado_seq', 3, true);
          public          postgres    false    265                        0    0    tipounidad_idtipounidad_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.tipounidad_idtipounidad_seq', 3, true);
          public          postgres    false    267                       0    0    tipousuario_idtipousuario_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.tipousuario_idtipousuario_seq', 23, true);
          public          postgres    false    269                       0    0    unidadmedida_idunidadmedida_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.unidadmedida_idunidadmedida_seq', 3, true);
          public          postgres    false    271                       0    0    usuario_idusuario_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.usuario_idusuario_seq', 6, true);
          public          postgres    false    273                       0    0    visita_idvisita_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.visita_idvisita_seq', 25, true);
          public          postgres    false    275                       0    0    visitante_idvisitante_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.visitante_idvisitante_seq', 5, true);
          public          postgres    false    277            K           2606    17165    alquiler alquiler_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.alquiler
    ADD CONSTRAINT alquiler_pkey PRIMARY KEY (idalquiler);
 @   ALTER TABLE ONLY public.alquiler DROP CONSTRAINT alquiler_pkey;
       public            postgres    false    200            M           2606    17167    aportacion aportacion_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.aportacion
    ADD CONSTRAINT aportacion_pkey PRIMARY KEY (idaportacion);
 D   ALTER TABLE ONLY public.aportacion DROP CONSTRAINT aportacion_pkey;
       public            postgres    false    202            O           2606    17169    bitacora bitacora_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.bitacora
    ADD CONSTRAINT bitacora_pkey PRIMARY KEY (idbitacora);
 @   ALTER TABLE ONLY public.bitacora DROP CONSTRAINT bitacora_pkey;
       public            postgres    false    204            Q           2606    17171 (   bitacoraresidente bitacoraresidente_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.bitacoraresidente
    ADD CONSTRAINT bitacoraresidente_pkey PRIMARY KEY (idbitacora);
 R   ALTER TABLE ONLY public.bitacoraresidente DROP CONSTRAINT bitacoraresidente_pkey;
       public            postgres    false    206            S           2606    17173    casa casa_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.casa
    ADD CONSTRAINT casa_pkey PRIMARY KEY (idcasa);
 8   ALTER TABLE ONLY public.casa DROP CONSTRAINT casa_pkey;
       public            postgres    false    208            U           2606    17175    categoria categoria_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (idcategoria);
 B   ALTER TABLE ONLY public.categoria DROP CONSTRAINT categoria_pkey;
       public            postgres    false    210            W           2606    17177    denuncia denuncia_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.denuncia
    ADD CONSTRAINT denuncia_pkey PRIMARY KEY (iddenuncia);
 @   ALTER TABLE ONLY public.denuncia DROP CONSTRAINT denuncia_pkey;
       public            postgres    false    212            Y           2606    17179 $   detallematerial detallematerial_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.detallematerial
    ADD CONSTRAINT detallematerial_pkey PRIMARY KEY (iddetallematerial);
 N   ALTER TABLE ONLY public.detallematerial DROP CONSTRAINT detallematerial_pkey;
       public            postgres    false    214            [           2606    17181     detallevisita detallevisita_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.detallevisita
    ADD CONSTRAINT detallevisita_pkey PRIMARY KEY (iddetallevisita);
 J   ALTER TABLE ONLY public.detallevisita DROP CONSTRAINT detallevisita_pkey;
       public            postgres    false    216            ]           2606    17183    empleado empleado_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_pkey PRIMARY KEY (idempleado);
 @   ALTER TABLE ONLY public.empleado DROP CONSTRAINT empleado_pkey;
       public            postgres    false    218            e           2606    17185    espacio espacio_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.espacio
    ADD CONSTRAINT espacio_pkey PRIMARY KEY (idespacio);
 >   ALTER TABLE ONLY public.espacio DROP CONSTRAINT espacio_pkey;
       public            postgres    false    220            i           2606    17187 "   estadoalquiler estadoalquiler_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.estadoalquiler
    ADD CONSTRAINT estadoalquiler_pkey PRIMARY KEY (idestadoalquiler);
 L   ALTER TABLE ONLY public.estadoalquiler DROP CONSTRAINT estadoalquiler_pkey;
       public            postgres    false    222            k           2606    17189 &   estadoaportacion estadoaportacion_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.estadoaportacion
    ADD CONSTRAINT estadoaportacion_pkey PRIMARY KEY (idestadoaportacion);
 P   ALTER TABLE ONLY public.estadoaportacion DROP CONSTRAINT estadoaportacion_pkey;
       public            postgres    false    224            m           2606    17191    estadocasa estadocasa_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.estadocasa
    ADD CONSTRAINT estadocasa_pkey PRIMARY KEY (idestadocasa);
 D   ALTER TABLE ONLY public.estadocasa DROP CONSTRAINT estadocasa_pkey;
       public            postgres    false    226            o           2606    17193 "   estadodenuncia estadodenuncia_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.estadodenuncia
    ADD CONSTRAINT estadodenuncia_pkey PRIMARY KEY (idestadodenuncia);
 L   ALTER TABLE ONLY public.estadodenuncia DROP CONSTRAINT estadodenuncia_pkey;
       public            postgres    false    228            q           2606    17195 "   estadoempleado estadoempleado_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.estadoempleado
    ADD CONSTRAINT estadoempleado_pkey PRIMARY KEY (idestadoempleado);
 L   ALTER TABLE ONLY public.estadoempleado DROP CONSTRAINT estadoempleado_pkey;
       public            postgres    false    230            s           2606    17197     estadoespacio estadoespacio_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.estadoespacio
    ADD CONSTRAINT estadoespacio_pkey PRIMARY KEY (idestadoespacio);
 J   ALTER TABLE ONLY public.estadoespacio DROP CONSTRAINT estadoespacio_pkey;
       public            postgres    false    232            u           2606    17199    estadopedido estadopedido_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.estadopedido
    ADD CONSTRAINT estadopedido_pkey PRIMARY KEY (idestadopedido);
 H   ALTER TABLE ONLY public.estadopedido DROP CONSTRAINT estadopedido_pkey;
       public            postgres    false    234            w           2606    17201 $   estadoresidente estadoresidente_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.estadoresidente
    ADD CONSTRAINT estadoresidente_pkey PRIMARY KEY (idestadoresidente);
 N   ALTER TABLE ONLY public.estadoresidente DROP CONSTRAINT estadoresidente_pkey;
       public            postgres    false    236            y           2606    17203     estadousuario estadousuario_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.estadousuario
    ADD CONSTRAINT estadousuario_pkey PRIMARY KEY (idestadousuario);
 J   ALTER TABLE ONLY public.estadousuario DROP CONSTRAINT estadousuario_pkey;
       public            postgres    false    238            {           2606    17205    estadovisita estadovisita_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.estadovisita
    ADD CONSTRAINT estadovisita_pkey PRIMARY KEY (idestadovisita);
 H   ALTER TABLE ONLY public.estadovisita DROP CONSTRAINT estadovisita_pkey;
       public            postgres    false    240            }           2606    17207 ,   historialinventario historialinventario_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public.historialinventario
    ADD CONSTRAINT historialinventario_pkey PRIMARY KEY (idhistorialinventario);
 V   ALTER TABLE ONLY public.historialinventario DROP CONSTRAINT historialinventario_pkey;
       public            postgres    false    242                       2606    17209 $   imagenesespacio imagenesespacio_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.imagenesespacio
    ADD CONSTRAINT imagenesespacio_pkey PRIMARY KEY (idimagenesespacio);
 N   ALTER TABLE ONLY public.imagenesespacio DROP CONSTRAINT imagenesespacio_pkey;
       public            postgres    false    244            �           2606    17211    marca marca_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.marca
    ADD CONSTRAINT marca_pkey PRIMARY KEY (idmarca);
 :   ALTER TABLE ONLY public.marca DROP CONSTRAINT marca_pkey;
       public            postgres    false    246            �           2606    17213    material material_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.material
    ADD CONSTRAINT material_pkey PRIMARY KEY (idmaterial);
 @   ALTER TABLE ONLY public.material DROP CONSTRAINT material_pkey;
       public            postgres    false    248            �           2606    17215    mespago mespago_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.mespago
    ADD CONSTRAINT mespago_pkey PRIMARY KEY (idmespago);
 >   ALTER TABLE ONLY public.mespago DROP CONSTRAINT mespago_pkey;
       public            postgres    false    250            �           2606    17217    pedido pedido_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (idpedido);
 <   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_pkey;
       public            postgres    false    252            �           2606    17219    permiso permiso_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.permiso
    ADD CONSTRAINT permiso_pkey PRIMARY KEY (idpermiso);
 >   ALTER TABLE ONLY public.permiso DROP CONSTRAINT permiso_pkey;
       public            postgres    false    254            �           2606    17221 "   permisousuario permisousuario_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.permisousuario
    ADD CONSTRAINT permisousuario_pkey PRIMARY KEY (idpermisousuario);
 L   ALTER TABLE ONLY public.permisousuario DROP CONSTRAINT permisousuario_pkey;
       public            postgres    false    256            �           2606    17223    residente residente_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.residente
    ADD CONSTRAINT residente_pkey PRIMARY KEY (idresidente);
 B   ALTER TABLE ONLY public.residente DROP CONSTRAINT residente_pkey;
       public            postgres    false    258            �           2606    17225     residentecasa residentecasa_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.residentecasa
    ADD CONSTRAINT residentecasa_pkey PRIMARY KEY (idresidentecasa);
 J   ALTER TABLE ONLY public.residentecasa DROP CONSTRAINT residentecasa_pkey;
       public            postgres    false    260            �           2606    17227    tipodenuncia tipodenuncia_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.tipodenuncia
    ADD CONSTRAINT tipodenuncia_pkey PRIMARY KEY (idtipodenuncia);
 H   ALTER TABLE ONLY public.tipodenuncia DROP CONSTRAINT tipodenuncia_pkey;
       public            postgres    false    262            �           2606    17229    tipoempleado tipoempleado_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.tipoempleado
    ADD CONSTRAINT tipoempleado_pkey PRIMARY KEY (idtipoempleado);
 H   ALTER TABLE ONLY public.tipoempleado DROP CONSTRAINT tipoempleado_pkey;
       public            postgres    false    264            �           2606    17231    tipounidad tipounidad_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.tipounidad
    ADD CONSTRAINT tipounidad_pkey PRIMARY KEY (idtipounidad);
 D   ALTER TABLE ONLY public.tipounidad DROP CONSTRAINT tipounidad_pkey;
       public            postgres    false    266            �           2606    17233    tipousuario tipousuario_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.tipousuario
    ADD CONSTRAINT tipousuario_pkey PRIMARY KEY (idtipousuario);
 F   ALTER TABLE ONLY public.tipousuario DROP CONSTRAINT tipousuario_pkey;
       public            postgres    false    268            �           2606    17235    unidadmedida unidadmedida_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.unidadmedida
    ADD CONSTRAINT unidadmedida_pkey PRIMARY KEY (idunidadmedida);
 H   ALTER TABLE ONLY public.unidadmedida DROP CONSTRAINT unidadmedida_pkey;
       public            postgres    false    270            _           2606    17237    empleado uq_empleado_correo 
   CONSTRAINT     X   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT uq_empleado_correo UNIQUE (correo);
 E   ALTER TABLE ONLY public.empleado DROP CONSTRAINT uq_empleado_correo;
       public            postgres    false    218            a           2606    17239    empleado uq_empleado_dui 
   CONSTRAINT     R   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT uq_empleado_dui UNIQUE (dui);
 B   ALTER TABLE ONLY public.empleado DROP CONSTRAINT uq_empleado_dui;
       public            postgres    false    218            c           2606    17241    empleado uq_empleado_telefono 
   CONSTRAINT     \   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT uq_empleado_telefono UNIQUE (telefono);
 G   ALTER TABLE ONLY public.empleado DROP CONSTRAINT uq_empleado_telefono;
       public            postgres    false    218            g           2606    17243    espacio uq_espacio_nombre 
   CONSTRAINT     V   ALTER TABLE ONLY public.espacio
    ADD CONSTRAINT uq_espacio_nombre UNIQUE (nombre);
 C   ALTER TABLE ONLY public.espacio DROP CONSTRAINT uq_espacio_nombre;
       public            postgres    false    220            �           2606    17245    residente uq_residente_correo 
   CONSTRAINT     Z   ALTER TABLE ONLY public.residente
    ADD CONSTRAINT uq_residente_correo UNIQUE (correo);
 G   ALTER TABLE ONLY public.residente DROP CONSTRAINT uq_residente_correo;
       public            postgres    false    258            �           2606    17247    residente uq_residente_dui 
   CONSTRAINT     T   ALTER TABLE ONLY public.residente
    ADD CONSTRAINT uq_residente_dui UNIQUE (dui);
 D   ALTER TABLE ONLY public.residente DROP CONSTRAINT uq_residente_dui;
       public            postgres    false    258            �           2606    17249 '   residente uq_residente_telefono_celular 
   CONSTRAINT     m   ALTER TABLE ONLY public.residente
    ADD CONSTRAINT uq_residente_telefono_celular UNIQUE (telefonocelular);
 Q   ALTER TABLE ONLY public.residente DROP CONSTRAINT uq_residente_telefono_celular;
       public            postgres    false    258            �           2606    17251 $   residente uq_residente_telefono_fijo 
   CONSTRAINT     g   ALTER TABLE ONLY public.residente
    ADD CONSTRAINT uq_residente_telefono_fijo UNIQUE (telefonofijo);
 N   ALTER TABLE ONLY public.residente DROP CONSTRAINT uq_residente_telefono_fijo;
       public            postgres    false    258            �           2606    17253    residente uq_residente_username 
   CONSTRAINT     ^   ALTER TABLE ONLY public.residente
    ADD CONSTRAINT uq_residente_username UNIQUE (username);
 I   ALTER TABLE ONLY public.residente DROP CONSTRAINT uq_residente_username;
       public            postgres    false    258            �           2606    17255    tipousuario uq_tipousuario 
   CONSTRAINT     \   ALTER TABLE ONLY public.tipousuario
    ADD CONSTRAINT uq_tipousuario UNIQUE (tipousuario);
 D   ALTER TABLE ONLY public.tipousuario DROP CONSTRAINT uq_tipousuario;
       public            postgres    false    268            �           2606    17257    usuario uq_usuario_correo 
   CONSTRAINT     V   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT uq_usuario_correo UNIQUE (correo);
 C   ALTER TABLE ONLY public.usuario DROP CONSTRAINT uq_usuario_correo;
       public            postgres    false    272            �           2606    17259    usuario uq_usuario_dui 
   CONSTRAINT     P   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT uq_usuario_dui UNIQUE (dui);
 @   ALTER TABLE ONLY public.usuario DROP CONSTRAINT uq_usuario_dui;
       public            postgres    false    272            �           2606    17261 #   usuario uq_usuario_telefono_celular 
   CONSTRAINT     i   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT uq_usuario_telefono_celular UNIQUE (telefonocelular);
 M   ALTER TABLE ONLY public.usuario DROP CONSTRAINT uq_usuario_telefono_celular;
       public            postgres    false    272            �           2606    17263     usuario uq_usuario_telefono_fijo 
   CONSTRAINT     c   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT uq_usuario_telefono_fijo UNIQUE (telefonofijo);
 J   ALTER TABLE ONLY public.usuario DROP CONSTRAINT uq_usuario_telefono_fijo;
       public            postgres    false    272            �           2606    17265    usuario uq_usuario_username 
   CONSTRAINT     Z   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT uq_usuario_username UNIQUE (username);
 E   ALTER TABLE ONLY public.usuario DROP CONSTRAINT uq_usuario_username;
       public            postgres    false    272            �           2606    17267    visitante uq_visitante_dui 
   CONSTRAINT     T   ALTER TABLE ONLY public.visitante
    ADD CONSTRAINT uq_visitante_dui UNIQUE (dui);
 D   ALTER TABLE ONLY public.visitante DROP CONSTRAINT uq_visitante_dui;
       public            postgres    false    276            �           2606    17269    visitante uq_visitante_placa 
   CONSTRAINT     X   ALTER TABLE ONLY public.visitante
    ADD CONSTRAINT uq_visitante_placa UNIQUE (placa);
 F   ALTER TABLE ONLY public.visitante DROP CONSTRAINT uq_visitante_placa;
       public            postgres    false    276            �           2606    17271    usuario usuario_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (idusuario);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public            postgres    false    272            �           2606    17273    visita visita_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.visita
    ADD CONSTRAINT visita_pkey PRIMARY KEY (idvisita);
 <   ALTER TABLE ONLY public.visita DROP CONSTRAINT visita_pkey;
       public            postgres    false    274            �           2606    17275    visitante visitante_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.visitante
    ADD CONSTRAINT visitante_pkey PRIMARY KEY (idvisitante);
 B   ALTER TABLE ONLY public.visitante DROP CONSTRAINT visitante_pkey;
       public            postgres    false    276            �           2620    17276    material tr_historialinventario    TRIGGER     �   CREATE TRIGGER tr_historialinventario BEFORE UPDATE ON public.material FOR EACH ROW EXECUTE FUNCTION public.sp_historialinventario();
 8   DROP TRIGGER tr_historialinventario ON public.material;
       public          postgres    false    278    248            �           2606    17277     alquiler alquiler_idespacio_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.alquiler
    ADD CONSTRAINT alquiler_idespacio_fkey FOREIGN KEY (idespacio) REFERENCES public.espacio(idespacio);
 J   ALTER TABLE ONLY public.alquiler DROP CONSTRAINT alquiler_idespacio_fkey;
       public          postgres    false    220    3173    200            �           2606    17282 '   alquiler alquiler_idestadoalquiler_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.alquiler
    ADD CONSTRAINT alquiler_idestadoalquiler_fkey FOREIGN KEY (idestadoalquiler) REFERENCES public.estadoalquiler(idestadoalquiler);
 Q   ALTER TABLE ONLY public.alquiler DROP CONSTRAINT alquiler_idestadoalquiler_fkey;
       public          postgres    false    222    200    3177            �           2606    17287 "   alquiler alquiler_idresidente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.alquiler
    ADD CONSTRAINT alquiler_idresidente_fkey FOREIGN KEY (idresidente) REFERENCES public.residente(idresidente);
 L   ALTER TABLE ONLY public.alquiler DROP CONSTRAINT alquiler_idresidente_fkey;
       public          postgres    false    3213    258    200            �           2606    17292     alquiler alquiler_idusuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.alquiler
    ADD CONSTRAINT alquiler_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);
 J   ALTER TABLE ONLY public.alquiler DROP CONSTRAINT alquiler_idusuario_fkey;
       public          postgres    false    3249    200    272            �           2606    17297 !   aportacion aportacion_idcasa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.aportacion
    ADD CONSTRAINT aportacion_idcasa_fkey FOREIGN KEY (idcasa) REFERENCES public.casa(idcasa);
 K   ALTER TABLE ONLY public.aportacion DROP CONSTRAINT aportacion_idcasa_fkey;
       public          postgres    false    3155    202    208            �           2606    17302 -   aportacion aportacion_idestadoaportacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.aportacion
    ADD CONSTRAINT aportacion_idestadoaportacion_fkey FOREIGN KEY (idestadoaportacion) REFERENCES public.estadoaportacion(idestadoaportacion);
 W   ALTER TABLE ONLY public.aportacion DROP CONSTRAINT aportacion_idestadoaportacion_fkey;
       public          postgres    false    3179    202    224            �           2606    17307 $   aportacion aportacion_idmespago_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.aportacion
    ADD CONSTRAINT aportacion_idmespago_fkey FOREIGN KEY (idmespago) REFERENCES public.mespago(idmespago);
 N   ALTER TABLE ONLY public.aportacion DROP CONSTRAINT aportacion_idmespago_fkey;
       public          postgres    false    3205    202    250            �           2606    17312     bitacora bitacora_idusuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.bitacora
    ADD CONSTRAINT bitacora_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);
 J   ALTER TABLE ONLY public.bitacora DROP CONSTRAINT bitacora_idusuario_fkey;
       public          postgres    false    3249    204    272            �           2606    17317 4   bitacoraresidente bitacoraresidente_idresidente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.bitacoraresidente
    ADD CONSTRAINT bitacoraresidente_idresidente_fkey FOREIGN KEY (idresidente) REFERENCES public.residente(idresidente);
 ^   ALTER TABLE ONLY public.bitacoraresidente DROP CONSTRAINT bitacoraresidente_idresidente_fkey;
       public          postgres    false    3213    206    258            �           2606    17322    casa casa_idestadocasa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.casa
    ADD CONSTRAINT casa_idestadocasa_fkey FOREIGN KEY (idestadocasa) REFERENCES public.estadocasa(idestadocasa);
 E   ALTER TABLE ONLY public.casa DROP CONSTRAINT casa_idestadocasa_fkey;
       public          postgres    false    3181    208    226            �           2606    17327 !   denuncia denuncia_idempleado_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.denuncia
    ADD CONSTRAINT denuncia_idempleado_fkey FOREIGN KEY (idempleado) REFERENCES public.empleado(idempleado);
 K   ALTER TABLE ONLY public.denuncia DROP CONSTRAINT denuncia_idempleado_fkey;
       public          postgres    false    3165    212    218            �           2606    17332 '   denuncia denuncia_idestadodenuncia_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.denuncia
    ADD CONSTRAINT denuncia_idestadodenuncia_fkey FOREIGN KEY (idestadodenuncia) REFERENCES public.estadodenuncia(idestadodenuncia);
 Q   ALTER TABLE ONLY public.denuncia DROP CONSTRAINT denuncia_idestadodenuncia_fkey;
       public          postgres    false    3183    212    228            �           2606    17337 "   denuncia denuncia_idresidente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.denuncia
    ADD CONSTRAINT denuncia_idresidente_fkey FOREIGN KEY (idresidente) REFERENCES public.residente(idresidente);
 L   ALTER TABLE ONLY public.denuncia DROP CONSTRAINT denuncia_idresidente_fkey;
       public          postgres    false    3213    212    258            �           2606    17342 %   denuncia denuncia_idtipodenuncia_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.denuncia
    ADD CONSTRAINT denuncia_idtipodenuncia_fkey FOREIGN KEY (idtipodenuncia) REFERENCES public.tipodenuncia(idtipodenuncia);
 O   ALTER TABLE ONLY public.denuncia DROP CONSTRAINT denuncia_idtipodenuncia_fkey;
       public          postgres    false    3227    212    262            �           2606    17347 /   detallematerial detallematerial_idmaterial_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.detallematerial
    ADD CONSTRAINT detallematerial_idmaterial_fkey FOREIGN KEY (idmaterial) REFERENCES public.material(idmaterial);
 Y   ALTER TABLE ONLY public.detallematerial DROP CONSTRAINT detallematerial_idmaterial_fkey;
       public          postgres    false    214    248    3203            �           2606    17352 -   detallematerial detallematerial_idpedido_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.detallematerial
    ADD CONSTRAINT detallematerial_idpedido_fkey FOREIGN KEY (idpedido) REFERENCES public.pedido(idpedido);
 W   ALTER TABLE ONLY public.detallematerial DROP CONSTRAINT detallematerial_idpedido_fkey;
       public          postgres    false    214    252    3207            �           2606    17357 )   detallevisita detallevisita_idvisita_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.detallevisita
    ADD CONSTRAINT detallevisita_idvisita_fkey FOREIGN KEY (idvisita) REFERENCES public.visita(idvisita);
 S   ALTER TABLE ONLY public.detallevisita DROP CONSTRAINT detallevisita_idvisita_fkey;
       public          postgres    false    274    3251    216            �           2606    17362 ,   detallevisita detallevisita_idvisitante_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.detallevisita
    ADD CONSTRAINT detallevisita_idvisitante_fkey FOREIGN KEY (idvisitante) REFERENCES public.visitante(idvisitante);
 V   ALTER TABLE ONLY public.detallevisita DROP CONSTRAINT detallevisita_idvisitante_fkey;
       public          postgres    false    216    3257    276            �           2606    17367 '   empleado empleado_idestadoempleado_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_idestadoempleado_fkey FOREIGN KEY (idestadoempleado) REFERENCES public.estadoempleado(idestadoempleado);
 Q   ALTER TABLE ONLY public.empleado DROP CONSTRAINT empleado_idestadoempleado_fkey;
       public          postgres    false    218    230    3185            �           2606    17372 %   empleado empleado_idtipoempleado_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_idtipoempleado_fkey FOREIGN KEY (idtipoempleado) REFERENCES public.tipoempleado(idtipoempleado);
 O   ALTER TABLE ONLY public.empleado DROP CONSTRAINT empleado_idtipoempleado_fkey;
       public          postgres    false    3229    264    218            �           2606    17377 $   espacio espacio_idestadoespacio_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.espacio
    ADD CONSTRAINT espacio_idestadoespacio_fkey FOREIGN KEY (idestadoespacio) REFERENCES public.estadoespacio(idestadoespacio);
 N   ALTER TABLE ONLY public.espacio DROP CONSTRAINT espacio_idestadoespacio_fkey;
       public          postgres    false    220    232    3187            �           2606    17382 7   historialinventario historialinventario_idmaterial_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.historialinventario
    ADD CONSTRAINT historialinventario_idmaterial_fkey FOREIGN KEY (idmaterial) REFERENCES public.material(idmaterial);
 a   ALTER TABLE ONLY public.historialinventario DROP CONSTRAINT historialinventario_idmaterial_fkey;
       public          postgres    false    242    248    3203            �           2606    17387 .   imagenesespacio imagenesespacio_idespacio_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.imagenesespacio
    ADD CONSTRAINT imagenesespacio_idespacio_fkey FOREIGN KEY (idespacio) REFERENCES public.espacio(idespacio);
 X   ALTER TABLE ONLY public.imagenesespacio DROP CONSTRAINT imagenesespacio_idespacio_fkey;
       public          postgres    false    220    244    3173            �           2606    17392 "   material material_idcategoria_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.material
    ADD CONSTRAINT material_idcategoria_fkey FOREIGN KEY (idcategoria) REFERENCES public.categoria(idcategoria);
 L   ALTER TABLE ONLY public.material DROP CONSTRAINT material_idcategoria_fkey;
       public          postgres    false    210    3157    248            �           2606    17397    material material_idmarca_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.material
    ADD CONSTRAINT material_idmarca_fkey FOREIGN KEY (idmarca) REFERENCES public.marca(idmarca);
 H   ALTER TABLE ONLY public.material DROP CONSTRAINT material_idmarca_fkey;
       public          postgres    false    248    246    3201            �           2606    17402 %   material material_idunidadmedida_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.material
    ADD CONSTRAINT material_idunidadmedida_fkey FOREIGN KEY (idunidadmedida) REFERENCES public.unidadmedida(idunidadmedida);
 O   ALTER TABLE ONLY public.material DROP CONSTRAINT material_idunidadmedida_fkey;
       public          postgres    false    3237    248    270            �           2606    17407    pedido pedido_idempleado_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_idempleado_fkey FOREIGN KEY (idempleado) REFERENCES public.empleado(idempleado);
 G   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_idempleado_fkey;
       public          postgres    false    3165    218    252            �           2606    17412 !   pedido pedido_idestadopedido_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_idestadopedido_fkey FOREIGN KEY (idestadopedido) REFERENCES public.estadopedido(idestadopedido);
 K   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_idestadopedido_fkey;
       public          postgres    false    252    234    3189            �           2606    17417    pedido pedido_idusuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);
 F   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_idusuario_fkey;
       public          postgres    false    252    3249    272            �           2606    17422 ,   permisousuario permisousuario_idpermiso_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.permisousuario
    ADD CONSTRAINT permisousuario_idpermiso_fkey FOREIGN KEY (idpermiso) REFERENCES public.permiso(idpermiso);
 V   ALTER TABLE ONLY public.permisousuario DROP CONSTRAINT permisousuario_idpermiso_fkey;
       public          postgres    false    3209    256    254            �           2606    17427 0   permisousuario permisousuario_idtipousuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.permisousuario
    ADD CONSTRAINT permisousuario_idtipousuario_fkey FOREIGN KEY (idtipousuario) REFERENCES public.tipousuario(idtipousuario);
 Z   ALTER TABLE ONLY public.permisousuario DROP CONSTRAINT permisousuario_idtipousuario_fkey;
       public          postgres    false    3233    256    268            �           2606    17432 *   residente residente_idestadoresidente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.residente
    ADD CONSTRAINT residente_idestadoresidente_fkey FOREIGN KEY (idestadoresidente) REFERENCES public.estadoresidente(idestadoresidente);
 T   ALTER TABLE ONLY public.residente DROP CONSTRAINT residente_idestadoresidente_fkey;
       public          postgres    false    258    3191    236            �           2606    17437 '   residentecasa residentecasa_idcasa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.residentecasa
    ADD CONSTRAINT residentecasa_idcasa_fkey FOREIGN KEY (idcasa) REFERENCES public.casa(idcasa);
 Q   ALTER TABLE ONLY public.residentecasa DROP CONSTRAINT residentecasa_idcasa_fkey;
       public          postgres    false    260    208    3155            �           2606    17442 ,   residentecasa residentecasa_idresidente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.residentecasa
    ADD CONSTRAINT residentecasa_idresidente_fkey FOREIGN KEY (idresidente) REFERENCES public.residente(idresidente);
 V   ALTER TABLE ONLY public.residentecasa DROP CONSTRAINT residentecasa_idresidente_fkey;
       public          postgres    false    258    3213    260            �           2606    17447 +   unidadmedida unidadmedida_idtipounidad_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.unidadmedida
    ADD CONSTRAINT unidadmedida_idtipounidad_fkey FOREIGN KEY (idtipounidad) REFERENCES public.tipounidad(idtipounidad);
 U   ALTER TABLE ONLY public.unidadmedida DROP CONSTRAINT unidadmedida_idtipounidad_fkey;
       public          postgres    false    3231    270    266            �           2606    17452 $   usuario usuario_idestadousuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_idestadousuario_fkey FOREIGN KEY (idestadousuario) REFERENCES public.estadousuario(idestadousuario);
 N   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_idestadousuario_fkey;
       public          postgres    false    238    3193    272            �           2606    17457 "   usuario usuario_idtipousuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_idtipousuario_fkey FOREIGN KEY (idtipousuario) REFERENCES public.tipousuario(idtipousuario);
 L   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_idtipousuario_fkey;
       public          postgres    false    3233    268    272            �           2606    17462 !   visita visita_idestadovisita_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.visita
    ADD CONSTRAINT visita_idestadovisita_fkey FOREIGN KEY (idestadovisita) REFERENCES public.estadovisita(idestadovisita);
 K   ALTER TABLE ONLY public.visita DROP CONSTRAINT visita_idestadovisita_fkey;
       public          postgres    false    274    240    3195            �           2606    17467    visita visita_idresidente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.visita
    ADD CONSTRAINT visita_idresidente_fkey FOREIGN KEY (idresidente) REFERENCES public.residente(idresidente);
 H   ALTER TABLE ONLY public.visita DROP CONSTRAINT visita_idresidente_fkey;
       public          postgres    false    3213    258    274            d   }  x���Q��0����.-�d[v����c���e:ЇP>B�_6�oe�m���ꛛ�����l���>[{9Il9޸}p_�ƅ��p\���kXY���Ԃ���ƍa�C\1N���b�.P'�.�z�32ݮ��VwI'��WIOE�I�@݉vI�d�x����-��-��-��-��qܒ�(�N�_;�.通=I�t�t����H��TŐ�Tt5I�d�Tܒiܒ���[2�[�}��L�L�� 𭞊n&�"i�tH�BMZ�&�5�����-��i�%;��d?�%٫:n�4n�4n���S��������N�t��CM�;C�j2��$�[��Nܒiܒ�!�-�ܒ�8n��'�sl��?�~�����M���������cmu      f   �  x���M��@��5�� �����[� �X���f ���?&����yŊ���ed��d'=��&����������\������.���k���o���\��m]>���u����og�'u']�N8'w'_�L8N�N�:O8�;u�<E�xw|�<'�sN�Ӻ��~W���R�;P�vH�N4�}�js'���A���s@b�����K�*.�jp��j��%V3.�Z�p��
�L������X4��?7x@�p�4��pix�å���8\^�pi������C��m@\1M���s�>ap��"����K,
.��p����p�E����K���!�X{�K��E����߫k�X+p��Z��%��X8\b���38Tb&
�Jl���!���k�Tb&c�\b&e��|b&���á3	8Tb&������}7qDb�l��4���<v�%��As��X4��Ͽ�����0�����|�D��      h   �  x����n�8���S�B�>I�6�{���u��:Q78v�N����3/6E���ݖ�@#�A�T$�_��PC�xu}�C�p���ݿ^w��������Z��^�m�Y���������^��e�^���K��~>v���yյ���[`e�:�ǌ�^���B�M5Oټo�N<%8����so�P�����xj_�m߮�2�;�p����b>����?����1�s�Y����}�ҷ[[�e��~��n!�Ɔ�I�Q�vp5��J#�RB����+��N�xq�c�c�ʆ�9�z;x���|�(�¿��7�����n��>�9f��la�T1z��>T����ɩ9�mY�����n�[a- )4��F�4�'T�r�F�ȓ�c���~���k���n���Hp���l���ݵ�)�0��,<F�����)��M3��|4v�]��&L�����+A��~���$N��?���/�l
� ����æ��&�nޟ�q�B_ј� �ۉ��P���|Y�LI�X c�/X�D��� �ƛ�(x�x����q�T��CP�*y iXH��M��տ�����W-J@!kY"���Y*1�Vv�C!�7�{Ƕ�q^���s\E�Y�,�j��!i��J�#�J�dq�$���K�i��@K d��=^�g� ����	�Z�1����[�c�B�5��{��9a�(3�r���Yѽp����b�#-�4��J7��)T:�L|˺��n�%g������ܳ��HYz�����De8P����̷m������Z_��: 1��9j�{�Fԁ�.ήጅ���V�Ϥ~#H1X��%�(!ͱV#B�|��;/L���d���/��g#I%!� z��	�w(�(;b���5�HE0�"�S�er�tZwp~�gI������9OE�y}�58&
�j˺��V�}�<5f~��[��L�s�J�2A�� {�ziR��||j�pȬ���+����c֘�u�鲧�)��(���2cd+�����#��΋z+�E7�\���)�r��~�J��,w���]��*�R�
�X����~O���J�R�xC:T��ԚR-0o�
����Uo��J����,nI�J6�	���܂>�\4��X=��u �>���V�� z,���}n<:�Y�ǽ}K�;������2Tӑ��L=�IsV��]�Jb��W*	ة�NW"a!Q��F�k�D����r���6���,���B��p��?���H�Ô�����ޑH'{v��?����}l�̺���ٶ�� �x��!��륕L�gFģ�X�`�A�� R��V��fG`�lC��<* gB�#Z�w�)��	E3��HX����.�ԫ��ũ�99/�$~�-: �"�BR|�<⭾�r���4�<����P҈��Ȋ�@�J�t$����CJ���;ۧ	g�c 8�ض)�x��KX/5��=M�T�f�vIǻS;�y���50���a�&�p\}χ��!�&x�kPW�����l�0��ĹH�4�&|��HO�J32ސ�*�T2Z������t�⭶�����a22ܽa4�P���~x)^��y��|���M��բ�䀁j�,���N�=l��GTM�:��-ٛج��ۧ����پ��)���1c�f�W�ք8�v��l��8^�������`k¾~�4�������O>�IOʅ��-��5�֮V� o_���-a�[,�Z�K      j      x������ � �      l   �   x�5���0g�)�HiiˊP�J�,&� (MK~�����g_���EʓZ��9�2��b[��+��c��"'g9G{�up~�{��T8d�ApcP����K�r��I� �?K9._���0��-�]�z���>���(�7|      n   D   x�3�t,*9�6�4'�X!%U!'3� 3�*��M"9?����499���<.KN�����Լ�D�@� �w�      p     x�m�KN1DמS�&χ�5B�(Ȧ��ȟ`O#8G�b��,���M��겜�����z�v۶��{�+�@�5��	4�3�0�F�y�v���؛���2m���Jm+5��F�_��:SL!�.XJ3z����e�	Ue�"���d���yfD6:��L盛\{>Zv9�2?�~ד�dr���D�����(�?�|(�p�T"1����bei������/*vlQ�+��0���Yr���;�z��Z(5���a�4�/qd�#      r   S   x�=���@��v��;���������T��c�a����IeS���:���dFU�7���OI���X��35�:���'�A�1�      t   (   x�3�4�4�2�B.cNcN.N��)��)������ P�^      v     x�u�Kn�0���)t$� ����A�5�m6#�V�J�A�F�;uQ��X��]�q����F~���\�Yik��Y� ����t����rDT��j*$a</�JȬ&_H���j-�X�ֶ#�`�G�k�y��n�Ֆ�� ���n ��<�UƋ�@t�7����tp����X�'BV"+��h�TBP�RPb�����xȀC,���5p�����*��oƍ[9�F�ԁ�Ծ��f)&0痚�n۪n�fD��H3��)3�'h���&�ۂEP����g$Ve�q����qWIY�uI��$���]���F�½����c�"F���	VRc,oN� ��5H�0)a~z�&�w���E��^M�"���D�g��۲UJ�L�鏣ށ�ރ�:��-���=�70�1��e-%:��e~	lrUA��.��_��x����h��v��+�w[Ӄǚ{ؙcO���P�_�WҚ6�hX{QP��]N�o�y���Vy���=�h*���bO!�����d\
%�*e)T��,��|}%�fI��1P#�      x   �   x�}�Kj�0��|
���'YU4�v��u�HW���N�3�bU�I��V��Ǐ(��֭�e��F?��y�+T�����y����<�����S$��=���Xz����"[�ؗ�f�0�O.���GDl)���G�P�<��R�:/�4�}�7�^G�8��t��d�]�7ϽjuWaU��Ϗ^2��xfv�ǽ����ЩF޿i�p0�,<���e�r�=S��4I�/��i�      z   8   x�3�J-�,�<�9�ˈ�1�$�,�˘�-3/1'�*1%�˄�%5/5Č���� �&�      |   %   x�3�H�K�L�+I�2�tN�KN�ILI����� ��:      ~       x�3�tL.�,K�2�tI-N�S�b���� x��      �   I   x�3�H�K�L�+I�2�JM�H�JLI�2��2�3o��2�t�S((�ON-��2���)M���)����� ��      �   /   x�3�t�,.���L�I�2��O.-HL��2�.-.H�K�rb���� �j      �   9   x�3�t�,.���L�I�2��O.-HL��2�.-.H�K�rL8�R�S��@1z\\\ �;\      �   8   x�3�t�S(�ON-��2�JM�ɬJL��2��3�2�LN�ļ���p� ���      �   &   x�3�tL.�,��2�tI-�HL���,IL������ �|�      �   '   x�3�t�,.���L�I�2�.-.H�K�L������ ��	Y      �   #   x�3�tL.�,K�2�t��K�ɬJL������ o��      �   o   x�e���0�o�� �.����*򩿏���$,|�� '�V�$d�R�e���2��&�ɂ$	�p%�o��BR�_�T�	pV�T ����=�R�Gkx��R�/N>3t      �   C   x�3�43H5174H34O1J��*H�4�2�&[������s�r�DS�L�R��jM�b���� m�      �   6   x�3�tv�u��2����MJ-ʩ�u�I,��2����q���2���vu����� !`      �     x�M�Kn�0D��)|��6x�$rD ��D�4"h��
����z��T�(tV7�"E��"m*��� ���B�@���]�!�7��p��e@�:
U�9Qe�_�E���y1�o���	�
����xEbp6?H��hF���`��&�Z=�xQixp�,{?M�=��=89.�G��90��
ٵ"����K��$��e�4=�|6)�9v&�yh2E�L�*�3 � 8º8������V���{ڎw�`��G�����/�q�?)�j�      �     x�]�MK�@���̇����cA=���[�j#����@cf6��3����4���B��~^3�����D��~��H��,�L�ӸDA����}�:/��e�<���p]��������i��^ݎ�n	
�ъ�Iɨ�fTYш�jTS��8�F��X8:�p,��cI
,���EᨪpT[၃S8�+%�8�h���ñ���(<r��n
���Q��&Q�SP8*82m�����K�R{8�����Y8�+%
G���
G%����#���Z8�������į7��l�K      �   <   x�3�4�4b##C]s]3.cNc��!��)X�Y��I�%�9X�\�Ј+F��� ��&      �   S   x�3�t�),��I-J-�2�t,�/*IL���r�9]R�J�3��L8}KR�2s����ť�E���\f�a�ř%@1z\\\ j.      �   J   x�˱� C��a�K��#�΅_��f���5�VS�:TZ�*�Z8�ܢk��%�G�����������      �   d  x�u�Kr�0���^dkcK�l�����@e#,�~��VSs�\ldC�2I�N����u�0����x)R�tRVr
�Yz�1�(s��� ��&�l`��TuǶ 1 ژ��D��!�>��*b�� u���Bz �ST����(��;x�3��(X�����ݏ�>�i/�U��.�i��27lO�ߎD�R:�� �����^�"R��S�S�tS
�Y��2S�\h�a��2��ah�<� �T�Z�����9X�N����J�Z�I���)�e���fe���r�h<i��N��� m�S$�a-��ϟ�[
t�N�=T��9���&yV� !��XDJ4��'@��:���� u�i�n�����Ƒ���ٛ_4�x����r�:�A6i�}��{��`] �s��Ͽ�N��Ǌ�*Z�Lh����(��_�l�!G�`�Έ��tʛ0%�:��D�
M0u���}+����^��lV�/�)�n<�{�EU'c��;�X3q�eC��C`��rɒ��3d3�Zv��R4�*C��U�%X��k�����:�c�ih�.]u��~�m���O���yӧg�����;X-�~;��F��h��y�Z���{      �   *   x���  ��w;�'����s�$ͲH��!�eL���U[�      �   4   x�3��M�+I����L�+��2����-�L�J�2�t�,.)-J������� I?�      �   ,   x�3�t�IJ<�13�ˈ�'3� 3�*�˘�)?%5=�+F��� ��
�      �   '   x�3���)�M��2�H-��2�t�))-J����� ��^      �   0   x�3�tL����,.)JL�/�2�tN,N-I�22�t�OIMO����� h�      �   )   x�3�4���,)�/�2�42�����9�9}S��1z\\\ ��	}      �   �  x����n�@ ���>p�����[�1`�!���Q.ނ������>B^�vI�*�T+����}
�~nP�,H5�R�E�"���:�J[���$ 
�[6��[�tn3l�k#(Rc�B��

J�lcF�&�	1u�td�E��]��@���ٵ/mJڝr|8�dx:���]��t�=/ZX�;�������)ߺ��S����*9f�����$͕v�*M��|}�92{�3�[��a-[��!P�����������]z��ut*`������;�;7�^�k��N��b�����/�.��?f��|K��;O�{�{>8��d�C��-�!T�ڤ�	L��r�2U5w{��A��ŕb�O�M�P����͸N�+�A�k^���{�ȸ�ƫ��T��3᱘����~o���t*�$�ݥ;��A^#>9�V��ڸ��      �   �   x�}�K� �5=�\��CKp��ĕ���
	}��3x1����$��(�`<�fU�Ȏ�ɾ��0A���f:ie(��N�.Z��mFg)�Y��8X6I�0)�P���yϵ�o^,��L�׃4�
���JG!g�sH�[�~��*O|M��zM�'�L�m;4��X�"b"|,#V��uĚ����4)m@`�c�������.I�/����      �   �   x�U��
1E뙯�(L6��zET,��&�A|��l�����p8��5={��ˬk���l�<���p�qޢ��ܤ��|�;A�1��6�Q�@�5�c���<;���t�ͮ�]�*��6�0��7�x�#�e�+f     