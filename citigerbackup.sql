PGDMP     9    '            	    y            citiger    13.3    13.3 `   �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    27965    citiger    DATABASE     c   CREATE DATABASE citiger WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE citiger;
                postgres    false                       1255    27966    sp_historialinventario()    FUNCTION     �   CREATE FUNCTION public.sp_historialinventario() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
INSERT INTO historialInventario(idMaterial, cantidad, fecha) VALUES(old.idMaterial, old.cantidad, current_date);
RETURN NEW;
END
$$;
 /   DROP FUNCTION public.sp_historialinventario();
       public          postgres    false            �            1259    27967    alquiler    TABLE     ^  CREATE TABLE public.alquiler (
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
       public         heap    postgres    false            �            1259    27973    alquiler_idalquiler_seq    SEQUENCE     �   CREATE SEQUENCE public.alquiler_idalquiler_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.alquiler_idalquiler_seq;
       public          postgres    false    200            �           0    0    alquiler_idalquiler_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.alquiler_idalquiler_seq OWNED BY public.alquiler.idalquiler;
          public          postgres    false    201            �            1259    27975 
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
       public         heap    postgres    false            �            1259    27981    aportacion_idaportacion_seq    SEQUENCE     �   CREATE SEQUENCE public.aportacion_idaportacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.aportacion_idaportacion_seq;
       public          postgres    false    202            �           0    0    aportacion_idaportacion_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.aportacion_idaportacion_seq OWNED BY public.aportacion.idaportacion;
          public          postgres    false    203            �            1259    27983    bitacora    TABLE       CREATE TABLE public.bitacora (
    idbitacora integer NOT NULL,
    idusuario integer NOT NULL,
    hora time without time zone NOT NULL,
    fecha date NOT NULL,
    accion character varying(20) NOT NULL,
    descripcion character varying(200) NOT NULL
);
    DROP TABLE public.bitacora;
       public         heap    postgres    false            �            1259    27986    bitacora_idbitacora_seq    SEQUENCE     �   CREATE SEQUENCE public.bitacora_idbitacora_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.bitacora_idbitacora_seq;
       public          postgres    false    204            �           0    0    bitacora_idbitacora_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.bitacora_idbitacora_seq OWNED BY public.bitacora.idbitacora;
          public          postgres    false    205            �            1259    27988    bitacoraresidente    TABLE       CREATE TABLE public.bitacoraresidente (
    idbitacora integer NOT NULL,
    idresidente integer NOT NULL,
    hora time without time zone NOT NULL,
    fecha date NOT NULL,
    accion character varying(20) NOT NULL,
    descripcion character varying(200) NOT NULL
);
 %   DROP TABLE public.bitacoraresidente;
       public         heap    postgres    false            �            1259    27991     bitacoraresidente_idbitacora_seq    SEQUENCE     �   CREATE SEQUENCE public.bitacoraresidente_idbitacora_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.bitacoraresidente_idbitacora_seq;
       public          postgres    false    206            �           0    0     bitacoraresidente_idbitacora_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.bitacoraresidente_idbitacora_seq OWNED BY public.bitacoraresidente.idbitacora;
          public          postgres    false    207            �            1259    27993    casa    TABLE     �   CREATE TABLE public.casa (
    idcasa integer NOT NULL,
    idestadocasa integer NOT NULL,
    numerocasa numeric NOT NULL,
    direccion character varying(200) NOT NULL
);
    DROP TABLE public.casa;
       public         heap    postgres    false            �            1259    27999    casa_idcasa_seq    SEQUENCE     �   CREATE SEQUENCE public.casa_idcasa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.casa_idcasa_seq;
       public          postgres    false    208            �           0    0    casa_idcasa_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.casa_idcasa_seq OWNED BY public.casa.idcasa;
          public          postgres    false    209            �            1259    28001 	   categoria    TABLE     r   CREATE TABLE public.categoria (
    idcategoria integer NOT NULL,
    categoria character varying(40) NOT NULL
);
    DROP TABLE public.categoria;
       public         heap    postgres    false            �            1259    28004    categoria_idcategoria_seq    SEQUENCE     �   CREATE SEQUENCE public.categoria_idcategoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.categoria_idcategoria_seq;
       public          postgres    false    210            �           0    0    categoria_idcategoria_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.categoria_idcategoria_seq OWNED BY public.categoria.idcategoria;
          public          postgres    false    211            �            1259    28006    denuncia    TABLE     8  CREATE TABLE public.denuncia (
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
       public         heap    postgres    false            �            1259    28009    denuncia_iddenuncia_seq    SEQUENCE     �   CREATE SEQUENCE public.denuncia_iddenuncia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.denuncia_iddenuncia_seq;
       public          postgres    false    212            �           0    0    denuncia_iddenuncia_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.denuncia_iddenuncia_seq OWNED BY public.denuncia.iddenuncia;
          public          postgres    false    213            �            1259    28011    detallematerial    TABLE     �   CREATE TABLE public.detallematerial (
    iddetallematerial integer NOT NULL,
    idpedido integer NOT NULL,
    idmaterial integer NOT NULL,
    preciomaterial numeric NOT NULL,
    cantidadmaterial numeric NOT NULL
);
 #   DROP TABLE public.detallematerial;
       public         heap    postgres    false            �            1259    28017 %   detallematerial_iddetallematerial_seq    SEQUENCE     �   CREATE SEQUENCE public.detallematerial_iddetallematerial_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.detallematerial_iddetallematerial_seq;
       public          postgres    false    214            �           0    0 %   detallematerial_iddetallematerial_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.detallematerial_iddetallematerial_seq OWNED BY public.detallematerial.iddetallematerial;
          public          postgres    false    215            �            1259    28019    detallevisita    TABLE     �   CREATE TABLE public.detallevisita (
    iddetallevisita integer NOT NULL,
    idvisita integer NOT NULL,
    idvisitante integer NOT NULL
);
 !   DROP TABLE public.detallevisita;
       public         heap    postgres    false            �            1259    28022 !   detallevisita_iddetallevisita_seq    SEQUENCE     �   CREATE SEQUENCE public.detallevisita_iddetallevisita_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.detallevisita_iddetallevisita_seq;
       public          postgres    false    216            �           0    0 !   detallevisita_iddetallevisita_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.detallevisita_iddetallevisita_seq OWNED BY public.detallevisita.iddetallevisita;
          public          postgres    false    217            �            1259    28024    empleado    TABLE     �  CREATE TABLE public.empleado (
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
       public         heap    postgres    false            �            1259    28027    empleado_idempleado_seq    SEQUENCE     �   CREATE SEQUENCE public.empleado_idempleado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.empleado_idempleado_seq;
       public          postgres    false    218            �           0    0    empleado_idempleado_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.empleado_idempleado_seq OWNED BY public.empleado.idempleado;
          public          postgres    false    219            �            1259    28029    espacio    TABLE       CREATE TABLE public.espacio (
    idespacio integer NOT NULL,
    idestadoespacio integer NOT NULL,
    nombre character varying(30) NOT NULL,
    descripcion character varying(200) NOT NULL,
    capacidad numeric NOT NULL,
    imagenprincipal character varying(50)
);
    DROP TABLE public.espacio;
       public         heap    postgres    false            �            1259    28035    espacio_idespacio_seq    SEQUENCE     �   CREATE SEQUENCE public.espacio_idespacio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.espacio_idespacio_seq;
       public          postgres    false    220            �           0    0    espacio_idespacio_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.espacio_idespacio_seq OWNED BY public.espacio.idespacio;
          public          postgres    false    221            �            1259    28037    estadoalquiler    TABLE     �   CREATE TABLE public.estadoalquiler (
    idestadoalquiler integer NOT NULL,
    estadoalquiler character varying(15) NOT NULL
);
 "   DROP TABLE public.estadoalquiler;
       public         heap    postgres    false            �            1259    28040 #   estadoalquiler_idestadoalquiler_seq    SEQUENCE     �   CREATE SEQUENCE public.estadoalquiler_idestadoalquiler_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.estadoalquiler_idestadoalquiler_seq;
       public          postgres    false    222            �           0    0 #   estadoalquiler_idestadoalquiler_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.estadoalquiler_idestadoalquiler_seq OWNED BY public.estadoalquiler.idestadoalquiler;
          public          postgres    false    223            �            1259    28042    estadoaportacion    TABLE     �   CREATE TABLE public.estadoaportacion (
    idestadoaportacion integer NOT NULL,
    estadoaportacion character varying(15) NOT NULL
);
 $   DROP TABLE public.estadoaportacion;
       public         heap    postgres    false            �            1259    28045 '   estadoaportacion_idestadoaportacion_seq    SEQUENCE     �   CREATE SEQUENCE public.estadoaportacion_idestadoaportacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.estadoaportacion_idestadoaportacion_seq;
       public          postgres    false    224            �           0    0 '   estadoaportacion_idestadoaportacion_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public.estadoaportacion_idestadoaportacion_seq OWNED BY public.estadoaportacion.idestadoaportacion;
          public          postgres    false    225            �            1259    28047 
   estadocasa    TABLE     u   CREATE TABLE public.estadocasa (
    idestadocasa integer NOT NULL,
    estadocasa character varying(15) NOT NULL
);
    DROP TABLE public.estadocasa;
       public         heap    postgres    false            �            1259    28050    estadocasa_idestadocasa_seq    SEQUENCE     �   CREATE SEQUENCE public.estadocasa_idestadocasa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.estadocasa_idestadocasa_seq;
       public          postgres    false    226            �           0    0    estadocasa_idestadocasa_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.estadocasa_idestadocasa_seq OWNED BY public.estadocasa.idestadocasa;
          public          postgres    false    227            �            1259    28052    estadodenuncia    TABLE     �   CREATE TABLE public.estadodenuncia (
    idestadodenuncia integer NOT NULL,
    estadodenuncia character varying(15) NOT NULL
);
 "   DROP TABLE public.estadodenuncia;
       public         heap    postgres    false            �            1259    28055 #   estadodenuncia_idestadodenuncia_seq    SEQUENCE     �   CREATE SEQUENCE public.estadodenuncia_idestadodenuncia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.estadodenuncia_idestadodenuncia_seq;
       public          postgres    false    228            �           0    0 #   estadodenuncia_idestadodenuncia_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.estadodenuncia_idestadodenuncia_seq OWNED BY public.estadodenuncia.idestadodenuncia;
          public          postgres    false    229            �            1259    28057    estadoempleado    TABLE     �   CREATE TABLE public.estadoempleado (
    idestadoempleado integer NOT NULL,
    estadoempleado character varying(20) NOT NULL
);
 "   DROP TABLE public.estadoempleado;
       public         heap    postgres    false            �            1259    28060 #   estadoempleado_idestadoempleado_seq    SEQUENCE     �   CREATE SEQUENCE public.estadoempleado_idestadoempleado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.estadoempleado_idestadoempleado_seq;
       public          postgres    false    230            �           0    0 #   estadoempleado_idestadoempleado_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.estadoempleado_idestadoempleado_seq OWNED BY public.estadoempleado.idestadoempleado;
          public          postgres    false    231            �            1259    28062    estadoespacio    TABLE     ~   CREATE TABLE public.estadoespacio (
    idestadoespacio integer NOT NULL,
    estadoespacio character varying(15) NOT NULL
);
 !   DROP TABLE public.estadoespacio;
       public         heap    postgres    false            �            1259    28065 !   estadoespacio_idestadoespacio_seq    SEQUENCE     �   CREATE SEQUENCE public.estadoespacio_idestadoespacio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.estadoespacio_idestadoespacio_seq;
       public          postgres    false    232            �           0    0 !   estadoespacio_idestadoespacio_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.estadoespacio_idestadoespacio_seq OWNED BY public.estadoespacio.idestadoespacio;
          public          postgres    false    233            �            1259    28067    estadopedido    TABLE     {   CREATE TABLE public.estadopedido (
    idestadopedido integer NOT NULL,
    estadopedido character varying(15) NOT NULL
);
     DROP TABLE public.estadopedido;
       public         heap    postgres    false            �            1259    28070    estadopedido_idestadopedido_seq    SEQUENCE     �   CREATE SEQUENCE public.estadopedido_idestadopedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.estadopedido_idestadopedido_seq;
       public          postgres    false    234            �           0    0    estadopedido_idestadopedido_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.estadopedido_idestadopedido_seq OWNED BY public.estadopedido.idestadopedido;
          public          postgres    false    235            �            1259    28072    estadoresidente    TABLE     �   CREATE TABLE public.estadoresidente (
    idestadoresidente integer NOT NULL,
    estadoresidente character varying(15) NOT NULL
);
 #   DROP TABLE public.estadoresidente;
       public         heap    postgres    false            �            1259    28075 %   estadoresidente_idestadoresidente_seq    SEQUENCE     �   CREATE SEQUENCE public.estadoresidente_idestadoresidente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.estadoresidente_idestadoresidente_seq;
       public          postgres    false    236            �           0    0 %   estadoresidente_idestadoresidente_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.estadoresidente_idestadoresidente_seq OWNED BY public.estadoresidente.idestadoresidente;
          public          postgres    false    237            �            1259    28077    estadousuario    TABLE     ~   CREATE TABLE public.estadousuario (
    idestadousuario integer NOT NULL,
    estadousuario character varying(20) NOT NULL
);
 !   DROP TABLE public.estadousuario;
       public         heap    postgres    false            �            1259    28080 !   estadousuario_idestadousuario_seq    SEQUENCE     �   CREATE SEQUENCE public.estadousuario_idestadousuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.estadousuario_idestadousuario_seq;
       public          postgres    false    238            �           0    0 !   estadousuario_idestadousuario_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.estadousuario_idestadousuario_seq OWNED BY public.estadousuario.idestadousuario;
          public          postgres    false    239            �            1259    28082    estadovisita    TABLE     {   CREATE TABLE public.estadovisita (
    idestadovisita integer NOT NULL,
    estadovisita character varying(15) NOT NULL
);
     DROP TABLE public.estadovisita;
       public         heap    postgres    false            �            1259    28085    estadovisita_idestadovisita_seq    SEQUENCE     �   CREATE SEQUENCE public.estadovisita_idestadovisita_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.estadovisita_idestadovisita_seq;
       public          postgres    false    240            �           0    0    estadovisita_idestadovisita_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.estadovisita_idestadovisita_seq OWNED BY public.estadovisita.idestadovisita;
          public          postgres    false    241            �            1259    28087    historialinventario    TABLE     �   CREATE TABLE public.historialinventario (
    idhistorialinventario integer NOT NULL,
    idmaterial integer NOT NULL,
    cantidad numeric NOT NULL,
    fecha date NOT NULL
);
 '   DROP TABLE public.historialinventario;
       public         heap    postgres    false            �            1259    28093 -   historialinventario_idhistorialinventario_seq    SEQUENCE     �   CREATE SEQUENCE public.historialinventario_idhistorialinventario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 D   DROP SEQUENCE public.historialinventario_idhistorialinventario_seq;
       public          postgres    false    242            �           0    0 -   historialinventario_idhistorialinventario_seq    SEQUENCE OWNED BY        ALTER SEQUENCE public.historialinventario_idhistorialinventario_seq OWNED BY public.historialinventario.idhistorialinventario;
          public          postgres    false    243            �            1259    28095    historialresidente    TABLE     �  CREATE TABLE public.historialresidente (
    idhistorial integer NOT NULL,
    idresidente integer,
    ip character varying(40) DEFAULT 'No disponible'::character varying,
    region character varying(40) DEFAULT 'No disponible'::character varying,
    sistema character varying(40) DEFAULT 'No disponible'::character varying,
    fecha timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 &   DROP TABLE public.historialresidente;
       public         heap    postgres    false            �            1259    28099 "   historialresidente_idhistorial_seq    SEQUENCE     �   CREATE SEQUENCE public.historialresidente_idhistorial_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.historialresidente_idhistorial_seq;
       public          postgres    false    244            �           0    0 "   historialresidente_idhistorial_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.historialresidente_idhistorial_seq OWNED BY public.historialresidente.idhistorial;
          public          postgres    false    245            �            1259    28101    historialusuario    TABLE     �  CREATE TABLE public.historialusuario (
    idhistorial integer NOT NULL,
    idusuario integer,
    ip character varying(40) DEFAULT 'No disponible'::character varying,
    region character varying(40) DEFAULT 'No disponible'::character varying,
    sistema character varying(40) DEFAULT 'No disponible'::character varying,
    fecha timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 $   DROP TABLE public.historialusuario;
       public         heap    postgres    false            �            1259    28105     historialusuario_idhistorial_seq    SEQUENCE     �   CREATE SEQUENCE public.historialusuario_idhistorial_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.historialusuario_idhistorial_seq;
       public          postgres    false    246            �           0    0     historialusuario_idhistorial_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.historialusuario_idhistorial_seq OWNED BY public.historialusuario.idhistorial;
          public          postgres    false    247            �            1259    28107    imagenesespacio    TABLE     �   CREATE TABLE public.imagenesespacio (
    idimagenesespacio integer NOT NULL,
    imagen character varying(50),
    idespacio integer
);
 #   DROP TABLE public.imagenesespacio;
       public         heap    postgres    false            �            1259    28110 %   imagenesespacio_idimagenesespacio_seq    SEQUENCE     �   CREATE SEQUENCE public.imagenesespacio_idimagenesespacio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.imagenesespacio_idimagenesespacio_seq;
       public          postgres    false    248            �           0    0 %   imagenesespacio_idimagenesespacio_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.imagenesespacio_idimagenesespacio_seq OWNED BY public.imagenesespacio.idimagenesespacio;
          public          postgres    false    249            �            1259    28112    marca    TABLE     f   CREATE TABLE public.marca (
    idmarca integer NOT NULL,
    marca character varying(15) NOT NULL
);
    DROP TABLE public.marca;
       public         heap    postgres    false            �            1259    28115    marca_idmarca_seq    SEQUENCE     �   CREATE SEQUENCE public.marca_idmarca_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.marca_idmarca_seq;
       public          postgres    false    250            �           0    0    marca_idmarca_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.marca_idmarca_seq OWNED BY public.marca.idmarca;
          public          postgres    false    251            �            1259    28117    material    TABLE     �  CREATE TABLE public.material (
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
       public         heap    postgres    false            �            1259    28123    material_idmaterial_seq    SEQUENCE     �   CREATE SEQUENCE public.material_idmaterial_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.material_idmaterial_seq;
       public          postgres    false    252            �           0    0    material_idmaterial_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.material_idmaterial_seq OWNED BY public.material.idmaterial;
          public          postgres    false    253            �            1259    28125    mespago    TABLE     �   CREATE TABLE public.mespago (
    idmespago integer NOT NULL,
    mes character varying(10) NOT NULL,
    ano numeric NOT NULL
);
    DROP TABLE public.mespago;
       public         heap    postgres    false            �            1259    28131    mespago_idmespago_seq    SEQUENCE     �   CREATE SEQUENCE public.mespago_idmespago_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.mespago_idmespago_seq;
       public          postgres    false    254            �           0    0    mespago_idmespago_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.mespago_idmespago_seq OWNED BY public.mespago.idmespago;
          public          postgres    false    255                        1259    28133    pedido    TABLE     �   CREATE TABLE public.pedido (
    idpedido integer NOT NULL,
    idestadopedido integer NOT NULL,
    idusuario integer NOT NULL,
    idempleado integer,
    fechapedido date NOT NULL
);
    DROP TABLE public.pedido;
       public         heap    postgres    false                       1259    28136    pedido_idpedido_seq    SEQUENCE     �   CREATE SEQUENCE public.pedido_idpedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.pedido_idpedido_seq;
       public          postgres    false    256            �           0    0    pedido_idpedido_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.pedido_idpedido_seq OWNED BY public.pedido.idpedido;
          public          postgres    false    257                       1259    28138    permiso    TABLE     l   CREATE TABLE public.permiso (
    idpermiso integer NOT NULL,
    permiso character varying(30) NOT NULL
);
    DROP TABLE public.permiso;
       public         heap    postgres    false                       1259    28141    permiso_idpermiso_seq    SEQUENCE     �   CREATE SEQUENCE public.permiso_idpermiso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.permiso_idpermiso_seq;
       public          postgres    false    258            �           0    0    permiso_idpermiso_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.permiso_idpermiso_seq OWNED BY public.permiso.idpermiso;
          public          postgres    false    259                       1259    28143    permisousuario    TABLE     �   CREATE TABLE public.permisousuario (
    idpermisousuario integer NOT NULL,
    idtipousuario integer NOT NULL,
    idpermiso integer NOT NULL,
    permitido character(1) NOT NULL
);
 "   DROP TABLE public.permisousuario;
       public         heap    postgres    false                       1259    28146 #   permisousuario_idpermisousuario_seq    SEQUENCE     �   CREATE SEQUENCE public.permisousuario_idpermisousuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.permisousuario_idpermisousuario_seq;
       public          postgres    false    260            �           0    0 #   permisousuario_idpermisousuario_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.permisousuario_idpermisousuario_seq OWNED BY public.permisousuario.idpermisousuario;
          public          postgres    false    261                       1259    28148 	   residente    TABLE     �  CREATE TABLE public.residente (
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
    autenticacion character(2),
    verificado character(1) DEFAULT '0'::bpchar
);
    DROP TABLE public.residente;
       public         heap    postgres    false                       1259    28152    residente_idresidente_seq    SEQUENCE     �   CREATE SEQUENCE public.residente_idresidente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.residente_idresidente_seq;
       public          postgres    false    262            �           0    0    residente_idresidente_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.residente_idresidente_seq OWNED BY public.residente.idresidente;
          public          postgres    false    263                       1259    28154    residentecasa    TABLE     �   CREATE TABLE public.residentecasa (
    idresidentecasa integer NOT NULL,
    idresidente integer NOT NULL,
    idcasa integer NOT NULL
);
 !   DROP TABLE public.residentecasa;
       public         heap    postgres    false            	           1259    28157 !   residentecasa_idresidentecasa_seq    SEQUENCE     �   CREATE SEQUENCE public.residentecasa_idresidentecasa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.residentecasa_idresidentecasa_seq;
       public          postgres    false    264            �           0    0 !   residentecasa_idresidentecasa_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.residentecasa_idresidentecasa_seq OWNED BY public.residentecasa.idresidentecasa;
          public          postgres    false    265            
           1259    28159    tipodenuncia    TABLE     {   CREATE TABLE public.tipodenuncia (
    idtipodenuncia integer NOT NULL,
    tipodenuncia character varying(15) NOT NULL
);
     DROP TABLE public.tipodenuncia;
       public         heap    postgres    false                       1259    28162    tipodenuncia_idtipodenuncia_seq    SEQUENCE     �   CREATE SEQUENCE public.tipodenuncia_idtipodenuncia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.tipodenuncia_idtipodenuncia_seq;
       public          postgres    false    266            �           0    0    tipodenuncia_idtipodenuncia_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.tipodenuncia_idtipodenuncia_seq OWNED BY public.tipodenuncia.idtipodenuncia;
          public          postgres    false    267                       1259    28164    tipoempleado    TABLE     {   CREATE TABLE public.tipoempleado (
    idtipoempleado integer NOT NULL,
    tipoempleado character varying(15) NOT NULL
);
     DROP TABLE public.tipoempleado;
       public         heap    postgres    false                       1259    28167    tipoempleado_idtipoempleado_seq    SEQUENCE     �   CREATE SEQUENCE public.tipoempleado_idtipoempleado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.tipoempleado_idtipoempleado_seq;
       public          postgres    false    268            �           0    0    tipoempleado_idtipoempleado_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.tipoempleado_idtipoempleado_seq OWNED BY public.tipoempleado.idtipoempleado;
          public          postgres    false    269                       1259    28169 
   tipounidad    TABLE     u   CREATE TABLE public.tipounidad (
    idtipounidad integer NOT NULL,
    tipounidad character varying(20) NOT NULL
);
    DROP TABLE public.tipounidad;
       public         heap    postgres    false                       1259    28172    tipounidad_idtipounidad_seq    SEQUENCE     �   CREATE SEQUENCE public.tipounidad_idtipounidad_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.tipounidad_idtipounidad_seq;
       public          postgres    false    270            �           0    0    tipounidad_idtipounidad_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.tipounidad_idtipounidad_seq OWNED BY public.tipounidad.idtipounidad;
          public          postgres    false    271                       1259    28174    tipousuario    TABLE     x   CREATE TABLE public.tipousuario (
    idtipousuario integer NOT NULL,
    tipousuario character varying(15) NOT NULL
);
    DROP TABLE public.tipousuario;
       public         heap    postgres    false                       1259    28177    tipousuario_idtipousuario_seq    SEQUENCE     �   CREATE SEQUENCE public.tipousuario_idtipousuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.tipousuario_idtipousuario_seq;
       public          postgres    false    272            �           0    0    tipousuario_idtipousuario_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.tipousuario_idtipousuario_seq OWNED BY public.tipousuario.idtipousuario;
          public          postgres    false    273                       1259    28179    unidadmedida    TABLE     �   CREATE TABLE public.unidadmedida (
    idunidadmedida integer NOT NULL,
    idtipounidad integer NOT NULL,
    unidadmedida character varying(15) NOT NULL
);
     DROP TABLE public.unidadmedida;
       public         heap    postgres    false                       1259    28182    unidadmedida_idunidadmedida_seq    SEQUENCE     �   CREATE SEQUENCE public.unidadmedida_idunidadmedida_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.unidadmedida_idunidadmedida_seq;
       public          postgres    false    274            �           0    0    unidadmedida_idunidadmedida_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.unidadmedida_idunidadmedida_seq OWNED BY public.unidadmedida.idunidadmedida;
          public          postgres    false    275                       1259    28184    usuario    TABLE       CREATE TABLE public.usuario (
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
    autenticacion character(2) NOT NULL,
    verificado character(1) DEFAULT '0'::bpchar
);
    DROP TABLE public.usuario;
       public         heap    postgres    false                       1259    28191    usuario_idusuario_seq    SEQUENCE     �   CREATE SEQUENCE public.usuario_idusuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.usuario_idusuario_seq;
       public          postgres    false    276            �           0    0    usuario_idusuario_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.usuario_idusuario_seq OWNED BY public.usuario.idusuario;
          public          postgres    false    277                       1259    28193    visita    TABLE     �   CREATE TABLE public.visita (
    idvisita integer NOT NULL,
    idresidente integer NOT NULL,
    fecha date NOT NULL,
    visitarecurrente character(2) NOT NULL,
    observacion character varying(200) NOT NULL,
    idestadovisita integer NOT NULL
);
    DROP TABLE public.visita;
       public         heap    postgres    false                       1259    28196    visita_idvisita_seq    SEQUENCE     �   CREATE SEQUENCE public.visita_idvisita_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.visita_idvisita_seq;
       public          postgres    false    278            �           0    0    visita_idvisita_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.visita_idvisita_seq OWNED BY public.visita.idvisita;
          public          postgres    false    279                       1259    28198 	   visitante    TABLE       CREATE TABLE public.visitante (
    idvisitante integer NOT NULL,
    nombre character varying(30) NOT NULL,
    apellido character varying(30) NOT NULL,
    dui character(10) NOT NULL,
    genero character(1) NOT NULL,
    placa character varying(10) NOT NULL
);
    DROP TABLE public.visitante;
       public         heap    postgres    false                       1259    28201    visitante_idvisitante_seq    SEQUENCE     �   CREATE SEQUENCE public.visitante_idvisitante_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.visitante_idvisitante_seq;
       public          postgres    false    280            �           0    0    visitante_idvisitante_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.visitante_idvisitante_seq OWNED BY public.visitante.idvisitante;
          public          postgres    false    281                       2604    28203    alquiler idalquiler    DEFAULT     z   ALTER TABLE ONLY public.alquiler ALTER COLUMN idalquiler SET DEFAULT nextval('public.alquiler_idalquiler_seq'::regclass);
 B   ALTER TABLE public.alquiler ALTER COLUMN idalquiler DROP DEFAULT;
       public          postgres    false    201    200                       2604    28204    aportacion idaportacion    DEFAULT     �   ALTER TABLE ONLY public.aportacion ALTER COLUMN idaportacion SET DEFAULT nextval('public.aportacion_idaportacion_seq'::regclass);
 F   ALTER TABLE public.aportacion ALTER COLUMN idaportacion DROP DEFAULT;
       public          postgres    false    203    202                       2604    28205    bitacora idbitacora    DEFAULT     z   ALTER TABLE ONLY public.bitacora ALTER COLUMN idbitacora SET DEFAULT nextval('public.bitacora_idbitacora_seq'::regclass);
 B   ALTER TABLE public.bitacora ALTER COLUMN idbitacora DROP DEFAULT;
       public          postgres    false    205    204                       2604    28206    bitacoraresidente idbitacora    DEFAULT     �   ALTER TABLE ONLY public.bitacoraresidente ALTER COLUMN idbitacora SET DEFAULT nextval('public.bitacoraresidente_idbitacora_seq'::regclass);
 K   ALTER TABLE public.bitacoraresidente ALTER COLUMN idbitacora DROP DEFAULT;
       public          postgres    false    207    206                        2604    28207    casa idcasa    DEFAULT     j   ALTER TABLE ONLY public.casa ALTER COLUMN idcasa SET DEFAULT nextval('public.casa_idcasa_seq'::regclass);
 :   ALTER TABLE public.casa ALTER COLUMN idcasa DROP DEFAULT;
       public          postgres    false    209    208            !           2604    28208    categoria idcategoria    DEFAULT     ~   ALTER TABLE ONLY public.categoria ALTER COLUMN idcategoria SET DEFAULT nextval('public.categoria_idcategoria_seq'::regclass);
 D   ALTER TABLE public.categoria ALTER COLUMN idcategoria DROP DEFAULT;
       public          postgres    false    211    210            "           2604    28209    denuncia iddenuncia    DEFAULT     z   ALTER TABLE ONLY public.denuncia ALTER COLUMN iddenuncia SET DEFAULT nextval('public.denuncia_iddenuncia_seq'::regclass);
 B   ALTER TABLE public.denuncia ALTER COLUMN iddenuncia DROP DEFAULT;
       public          postgres    false    213    212            #           2604    28210 !   detallematerial iddetallematerial    DEFAULT     �   ALTER TABLE ONLY public.detallematerial ALTER COLUMN iddetallematerial SET DEFAULT nextval('public.detallematerial_iddetallematerial_seq'::regclass);
 P   ALTER TABLE public.detallematerial ALTER COLUMN iddetallematerial DROP DEFAULT;
       public          postgres    false    215    214            $           2604    28211    detallevisita iddetallevisita    DEFAULT     �   ALTER TABLE ONLY public.detallevisita ALTER COLUMN iddetallevisita SET DEFAULT nextval('public.detallevisita_iddetallevisita_seq'::regclass);
 L   ALTER TABLE public.detallevisita ALTER COLUMN iddetallevisita DROP DEFAULT;
       public          postgres    false    217    216            %           2604    28212    empleado idempleado    DEFAULT     z   ALTER TABLE ONLY public.empleado ALTER COLUMN idempleado SET DEFAULT nextval('public.empleado_idempleado_seq'::regclass);
 B   ALTER TABLE public.empleado ALTER COLUMN idempleado DROP DEFAULT;
       public          postgres    false    219    218            &           2604    28213    espacio idespacio    DEFAULT     v   ALTER TABLE ONLY public.espacio ALTER COLUMN idespacio SET DEFAULT nextval('public.espacio_idespacio_seq'::regclass);
 @   ALTER TABLE public.espacio ALTER COLUMN idespacio DROP DEFAULT;
       public          postgres    false    221    220            '           2604    28214    estadoalquiler idestadoalquiler    DEFAULT     �   ALTER TABLE ONLY public.estadoalquiler ALTER COLUMN idestadoalquiler SET DEFAULT nextval('public.estadoalquiler_idestadoalquiler_seq'::regclass);
 N   ALTER TABLE public.estadoalquiler ALTER COLUMN idestadoalquiler DROP DEFAULT;
       public          postgres    false    223    222            (           2604    28215 #   estadoaportacion idestadoaportacion    DEFAULT     �   ALTER TABLE ONLY public.estadoaportacion ALTER COLUMN idestadoaportacion SET DEFAULT nextval('public.estadoaportacion_idestadoaportacion_seq'::regclass);
 R   ALTER TABLE public.estadoaportacion ALTER COLUMN idestadoaportacion DROP DEFAULT;
       public          postgres    false    225    224            )           2604    28216    estadocasa idestadocasa    DEFAULT     �   ALTER TABLE ONLY public.estadocasa ALTER COLUMN idestadocasa SET DEFAULT nextval('public.estadocasa_idestadocasa_seq'::regclass);
 F   ALTER TABLE public.estadocasa ALTER COLUMN idestadocasa DROP DEFAULT;
       public          postgres    false    227    226            *           2604    28217    estadodenuncia idestadodenuncia    DEFAULT     �   ALTER TABLE ONLY public.estadodenuncia ALTER COLUMN idestadodenuncia SET DEFAULT nextval('public.estadodenuncia_idestadodenuncia_seq'::regclass);
 N   ALTER TABLE public.estadodenuncia ALTER COLUMN idestadodenuncia DROP DEFAULT;
       public          postgres    false    229    228            +           2604    28218    estadoempleado idestadoempleado    DEFAULT     �   ALTER TABLE ONLY public.estadoempleado ALTER COLUMN idestadoempleado SET DEFAULT nextval('public.estadoempleado_idestadoempleado_seq'::regclass);
 N   ALTER TABLE public.estadoempleado ALTER COLUMN idestadoempleado DROP DEFAULT;
       public          postgres    false    231    230            ,           2604    28219    estadoespacio idestadoespacio    DEFAULT     �   ALTER TABLE ONLY public.estadoespacio ALTER COLUMN idestadoespacio SET DEFAULT nextval('public.estadoespacio_idestadoespacio_seq'::regclass);
 L   ALTER TABLE public.estadoespacio ALTER COLUMN idestadoespacio DROP DEFAULT;
       public          postgres    false    233    232            -           2604    28220    estadopedido idestadopedido    DEFAULT     �   ALTER TABLE ONLY public.estadopedido ALTER COLUMN idestadopedido SET DEFAULT nextval('public.estadopedido_idestadopedido_seq'::regclass);
 J   ALTER TABLE public.estadopedido ALTER COLUMN idestadopedido DROP DEFAULT;
       public          postgres    false    235    234            .           2604    28221 !   estadoresidente idestadoresidente    DEFAULT     �   ALTER TABLE ONLY public.estadoresidente ALTER COLUMN idestadoresidente SET DEFAULT nextval('public.estadoresidente_idestadoresidente_seq'::regclass);
 P   ALTER TABLE public.estadoresidente ALTER COLUMN idestadoresidente DROP DEFAULT;
       public          postgres    false    237    236            /           2604    28222    estadousuario idestadousuario    DEFAULT     �   ALTER TABLE ONLY public.estadousuario ALTER COLUMN idestadousuario SET DEFAULT nextval('public.estadousuario_idestadousuario_seq'::regclass);
 L   ALTER TABLE public.estadousuario ALTER COLUMN idestadousuario DROP DEFAULT;
       public          postgres    false    239    238            0           2604    28223    estadovisita idestadovisita    DEFAULT     �   ALTER TABLE ONLY public.estadovisita ALTER COLUMN idestadovisita SET DEFAULT nextval('public.estadovisita_idestadovisita_seq'::regclass);
 J   ALTER TABLE public.estadovisita ALTER COLUMN idestadovisita DROP DEFAULT;
       public          postgres    false    241    240            1           2604    28224 )   historialinventario idhistorialinventario    DEFAULT     �   ALTER TABLE ONLY public.historialinventario ALTER COLUMN idhistorialinventario SET DEFAULT nextval('public.historialinventario_idhistorialinventario_seq'::regclass);
 X   ALTER TABLE public.historialinventario ALTER COLUMN idhistorialinventario DROP DEFAULT;
       public          postgres    false    243    242            3           2604    28225    historialresidente idhistorial    DEFAULT     �   ALTER TABLE ONLY public.historialresidente ALTER COLUMN idhistorial SET DEFAULT nextval('public.historialresidente_idhistorial_seq'::regclass);
 M   ALTER TABLE public.historialresidente ALTER COLUMN idhistorial DROP DEFAULT;
       public          postgres    false    245    244            8           2604    28226    historialusuario idhistorial    DEFAULT     �   ALTER TABLE ONLY public.historialusuario ALTER COLUMN idhistorial SET DEFAULT nextval('public.historialusuario_idhistorial_seq'::regclass);
 K   ALTER TABLE public.historialusuario ALTER COLUMN idhistorial DROP DEFAULT;
       public          postgres    false    247    246            <           2604    28227 !   imagenesespacio idimagenesespacio    DEFAULT     �   ALTER TABLE ONLY public.imagenesespacio ALTER COLUMN idimagenesespacio SET DEFAULT nextval('public.imagenesespacio_idimagenesespacio_seq'::regclass);
 P   ALTER TABLE public.imagenesespacio ALTER COLUMN idimagenesespacio DROP DEFAULT;
       public          postgres    false    249    248            =           2604    28228    marca idmarca    DEFAULT     n   ALTER TABLE ONLY public.marca ALTER COLUMN idmarca SET DEFAULT nextval('public.marca_idmarca_seq'::regclass);
 <   ALTER TABLE public.marca ALTER COLUMN idmarca DROP DEFAULT;
       public          postgres    false    251    250            >           2604    28229    material idmaterial    DEFAULT     z   ALTER TABLE ONLY public.material ALTER COLUMN idmaterial SET DEFAULT nextval('public.material_idmaterial_seq'::regclass);
 B   ALTER TABLE public.material ALTER COLUMN idmaterial DROP DEFAULT;
       public          postgres    false    253    252            ?           2604    28230    mespago idmespago    DEFAULT     v   ALTER TABLE ONLY public.mespago ALTER COLUMN idmespago SET DEFAULT nextval('public.mespago_idmespago_seq'::regclass);
 @   ALTER TABLE public.mespago ALTER COLUMN idmespago DROP DEFAULT;
       public          postgres    false    255    254            @           2604    28231    pedido idpedido    DEFAULT     r   ALTER TABLE ONLY public.pedido ALTER COLUMN idpedido SET DEFAULT nextval('public.pedido_idpedido_seq'::regclass);
 >   ALTER TABLE public.pedido ALTER COLUMN idpedido DROP DEFAULT;
       public          postgres    false    257    256            A           2604    28232    permiso idpermiso    DEFAULT     v   ALTER TABLE ONLY public.permiso ALTER COLUMN idpermiso SET DEFAULT nextval('public.permiso_idpermiso_seq'::regclass);
 @   ALTER TABLE public.permiso ALTER COLUMN idpermiso DROP DEFAULT;
       public          postgres    false    259    258            B           2604    28233    permisousuario idpermisousuario    DEFAULT     �   ALTER TABLE ONLY public.permisousuario ALTER COLUMN idpermisousuario SET DEFAULT nextval('public.permisousuario_idpermisousuario_seq'::regclass);
 N   ALTER TABLE public.permisousuario ALTER COLUMN idpermisousuario DROP DEFAULT;
       public          postgres    false    261    260            C           2604    28234    residente idresidente    DEFAULT     ~   ALTER TABLE ONLY public.residente ALTER COLUMN idresidente SET DEFAULT nextval('public.residente_idresidente_seq'::regclass);
 D   ALTER TABLE public.residente ALTER COLUMN idresidente DROP DEFAULT;
       public          postgres    false    263    262            E           2604    28235    residentecasa idresidentecasa    DEFAULT     �   ALTER TABLE ONLY public.residentecasa ALTER COLUMN idresidentecasa SET DEFAULT nextval('public.residentecasa_idresidentecasa_seq'::regclass);
 L   ALTER TABLE public.residentecasa ALTER COLUMN idresidentecasa DROP DEFAULT;
       public          postgres    false    265    264            F           2604    28236    tipodenuncia idtipodenuncia    DEFAULT     �   ALTER TABLE ONLY public.tipodenuncia ALTER COLUMN idtipodenuncia SET DEFAULT nextval('public.tipodenuncia_idtipodenuncia_seq'::regclass);
 J   ALTER TABLE public.tipodenuncia ALTER COLUMN idtipodenuncia DROP DEFAULT;
       public          postgres    false    267    266            G           2604    28237    tipoempleado idtipoempleado    DEFAULT     �   ALTER TABLE ONLY public.tipoempleado ALTER COLUMN idtipoempleado SET DEFAULT nextval('public.tipoempleado_idtipoempleado_seq'::regclass);
 J   ALTER TABLE public.tipoempleado ALTER COLUMN idtipoempleado DROP DEFAULT;
       public          postgres    false    269    268            H           2604    28238    tipounidad idtipounidad    DEFAULT     �   ALTER TABLE ONLY public.tipounidad ALTER COLUMN idtipounidad SET DEFAULT nextval('public.tipounidad_idtipounidad_seq'::regclass);
 F   ALTER TABLE public.tipounidad ALTER COLUMN idtipounidad DROP DEFAULT;
       public          postgres    false    271    270            I           2604    28239    tipousuario idtipousuario    DEFAULT     �   ALTER TABLE ONLY public.tipousuario ALTER COLUMN idtipousuario SET DEFAULT nextval('public.tipousuario_idtipousuario_seq'::regclass);
 H   ALTER TABLE public.tipousuario ALTER COLUMN idtipousuario DROP DEFAULT;
       public          postgres    false    273    272            J           2604    28240    unidadmedida idunidadmedida    DEFAULT     �   ALTER TABLE ONLY public.unidadmedida ALTER COLUMN idunidadmedida SET DEFAULT nextval('public.unidadmedida_idunidadmedida_seq'::regclass);
 J   ALTER TABLE public.unidadmedida ALTER COLUMN idunidadmedida DROP DEFAULT;
       public          postgres    false    275    274            K           2604    28241    usuario idusuario    DEFAULT     v   ALTER TABLE ONLY public.usuario ALTER COLUMN idusuario SET DEFAULT nextval('public.usuario_idusuario_seq'::regclass);
 @   ALTER TABLE public.usuario ALTER COLUMN idusuario DROP DEFAULT;
       public          postgres    false    277    276            M           2604    28242    visita idvisita    DEFAULT     r   ALTER TABLE ONLY public.visita ALTER COLUMN idvisita SET DEFAULT nextval('public.visita_idvisita_seq'::regclass);
 >   ALTER TABLE public.visita ALTER COLUMN idvisita DROP DEFAULT;
       public          postgres    false    279    278            N           2604    28243    visitante idvisitante    DEFAULT     ~   ALTER TABLE ONLY public.visitante ALTER COLUMN idvisitante SET DEFAULT nextval('public.visitante_idvisitante_seq'::regclass);
 D   ALTER TABLE public.visitante ALTER COLUMN idvisitante DROP DEFAULT;
       public          postgres    false    281    280            q          0    27967    alquiler 
   TABLE DATA           �   COPY public.alquiler (idalquiler, idestadoalquiler, idespacio, precio, idusuario, idresidente, fecha, horainicio, horafin) FROM stdin;
    public          postgres    false    200   \�      s          0    27975 
   aportacion 
   TABLE DATA           x   COPY public.aportacion (idaportacion, idcasa, idestadoaportacion, monto, idmespago, fechapago, descripcion) FROM stdin;
    public          postgres    false    202   T�      u          0    27983    bitacora 
   TABLE DATA           [   COPY public.bitacora (idbitacora, idusuario, hora, fecha, accion, descripcion) FROM stdin;
    public          postgres    false    204   ~�      w          0    27988    bitacoraresidente 
   TABLE DATA           f   COPY public.bitacoraresidente (idbitacora, idresidente, hora, fecha, accion, descripcion) FROM stdin;
    public          postgres    false    206   ��      y          0    27993    casa 
   TABLE DATA           K   COPY public.casa (idcasa, idestadocasa, numerocasa, direccion) FROM stdin;
    public          postgres    false    208   ��      {          0    28001 	   categoria 
   TABLE DATA           ;   COPY public.categoria (idcategoria, categoria) FROM stdin;
    public          postgres    false    210   ��      }          0    28006    denuncia 
   TABLE DATA           �   COPY public.denuncia (iddenuncia, idempleado, idresidente, idtipodenuncia, idestadodenuncia, fecha, descripcion, respuesta) FROM stdin;
    public          postgres    false    212   �                0    28011    detallematerial 
   TABLE DATA           t   COPY public.detallematerial (iddetallematerial, idpedido, idmaterial, preciomaterial, cantidadmaterial) FROM stdin;
    public          postgres    false    214   H�      �          0    28019    detallevisita 
   TABLE DATA           O   COPY public.detallevisita (iddetallevisita, idvisita, idvisitante) FROM stdin;
    public          postgres    false    216   ��      �          0    28024    empleado 
   TABLE DATA           �   COPY public.empleado (idempleado, idestadoempleado, idtipoempleado, nombre, apellido, telefono, dui, genero, foto, direccion, correo, fechanacimiento) FROM stdin;
    public          postgres    false    218   ��      �          0    28029    espacio 
   TABLE DATA           n   COPY public.espacio (idespacio, idestadoespacio, nombre, descripcion, capacidad, imagenprincipal) FROM stdin;
    public          postgres    false    220   �      �          0    28037    estadoalquiler 
   TABLE DATA           J   COPY public.estadoalquiler (idestadoalquiler, estadoalquiler) FROM stdin;
    public          postgres    false    222   �      �          0    28042    estadoaportacion 
   TABLE DATA           P   COPY public.estadoaportacion (idestadoaportacion, estadoaportacion) FROM stdin;
    public          postgres    false    224   ^�      �          0    28047 
   estadocasa 
   TABLE DATA           >   COPY public.estadocasa (idestadocasa, estadocasa) FROM stdin;
    public          postgres    false    226   ��      �          0    28052    estadodenuncia 
   TABLE DATA           J   COPY public.estadodenuncia (idestadodenuncia, estadodenuncia) FROM stdin;
    public          postgres    false    228   ��      �          0    28057    estadoempleado 
   TABLE DATA           J   COPY public.estadoempleado (idestadoempleado, estadoempleado) FROM stdin;
    public          postgres    false    230   �      �          0    28062    estadoespacio 
   TABLE DATA           G   COPY public.estadoespacio (idestadoespacio, estadoespacio) FROM stdin;
    public          postgres    false    232   [�      �          0    28067    estadopedido 
   TABLE DATA           D   COPY public.estadopedido (idestadopedido, estadopedido) FROM stdin;
    public          postgres    false    234   ��      �          0    28072    estadoresidente 
   TABLE DATA           M   COPY public.estadoresidente (idestadoresidente, estadoresidente) FROM stdin;
    public          postgres    false    236   ��      �          0    28077    estadousuario 
   TABLE DATA           G   COPY public.estadousuario (idestadousuario, estadousuario) FROM stdin;
    public          postgres    false    238   "�      �          0    28082    estadovisita 
   TABLE DATA           D   COPY public.estadovisita (idestadovisita, estadovisita) FROM stdin;
    public          postgres    false    240   Y�      �          0    28087    historialinventario 
   TABLE DATA           a   COPY public.historialinventario (idhistorialinventario, idmaterial, cantidad, fecha) FROM stdin;
    public          postgres    false    242   ��      �          0    28095    historialresidente 
   TABLE DATA           b   COPY public.historialresidente (idhistorial, idresidente, ip, region, sistema, fecha) FROM stdin;
    public          postgres    false    244   �      �          0    28101    historialusuario 
   TABLE DATA           ^   COPY public.historialusuario (idhistorial, idusuario, ip, region, sistema, fecha) FROM stdin;
    public          postgres    false    246   ��      �          0    28107    imagenesespacio 
   TABLE DATA           O   COPY public.imagenesespacio (idimagenesespacio, imagen, idespacio) FROM stdin;
    public          postgres    false    248   h�      �          0    28112    marca 
   TABLE DATA           /   COPY public.marca (idmarca, marca) FROM stdin;
    public          postgres    false    250   �      �          0    28117    material 
   TABLE DATA           �   COPY public.material (idmaterial, nombreproducto, costo, imagen, idcategoria, "tamaño", descripcion, cantidad, idmarca, idunidadmedida) FROM stdin;
    public          postgres    false    252   d�      �          0    28125    mespago 
   TABLE DATA           6   COPY public.mespago (idmespago, mes, ano) FROM stdin;
    public          postgres    false    254   ��      �          0    28133    pedido 
   TABLE DATA           ^   COPY public.pedido (idpedido, idestadopedido, idusuario, idempleado, fechapedido) FROM stdin;
    public          postgres    false    256   ��      �          0    28138    permiso 
   TABLE DATA           5   COPY public.permiso (idpermiso, permiso) FROM stdin;
    public          postgres    false    258   ��      �          0    28143    permisousuario 
   TABLE DATA           _   COPY public.permisousuario (idpermisousuario, idtipousuario, idpermiso, permitido) FROM stdin;
    public          postgres    false    260   \�      �          0    28148 	   residente 
   TABLE DATA           �   COPY public.residente (idresidente, idestadoresidente, nombre, apellido, telefonofijo, telefonocelular, foto, correo, fechanacimiento, genero, dui, username, contrasena, modo, intentos, codigo, autenticacion, verificado) FROM stdin;
    public          postgres    false    262   ��      �          0    28154    residentecasa 
   TABLE DATA           M   COPY public.residentecasa (idresidentecasa, idresidente, idcasa) FROM stdin;
    public          postgres    false    264   �      �          0    28159    tipodenuncia 
   TABLE DATA           D   COPY public.tipodenuncia (idtipodenuncia, tipodenuncia) FROM stdin;
    public          postgres    false    266   S�      �          0    28164    tipoempleado 
   TABLE DATA           D   COPY public.tipoempleado (idtipoempleado, tipoempleado) FROM stdin;
    public          postgres    false    268   ��      �          0    28169 
   tipounidad 
   TABLE DATA           >   COPY public.tipounidad (idtipounidad, tipounidad) FROM stdin;
    public          postgres    false    270   ��      �          0    28174    tipousuario 
   TABLE DATA           A   COPY public.tipousuario (idtipousuario, tipousuario) FROM stdin;
    public          postgres    false    272   
�      �          0    28179    unidadmedida 
   TABLE DATA           R   COPY public.unidadmedida (idunidadmedida, idtipounidad, unidadmedida) FROM stdin;
    public          postgres    false    274   J�      �          0    28184    usuario 
   TABLE DATA           �   COPY public.usuario (idusuario, idestadousuario, idtipousuario, nombre, apellido, telefonofijo, telefonocelular, foto, correo, fechanacimiento, genero, dui, username, contrasena, direccion, modo, intentos, codigo, autenticacion, verificado) FROM stdin;
    public          postgres    false    276   ��      �          0    28193    visita 
   TABLE DATA           m   COPY public.visita (idvisita, idresidente, fecha, visitarecurrente, observacion, idestadovisita) FROM stdin;
    public          postgres    false    278   6�      �          0    28198 	   visitante 
   TABLE DATA           V   COPY public.visitante (idvisitante, nombre, apellido, dui, genero, placa) FROM stdin;
    public          postgres    false    280   A�      �           0    0    alquiler_idalquiler_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.alquiler_idalquiler_seq', 90, true);
          public          postgres    false    201            �           0    0    aportacion_idaportacion_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.aportacion_idaportacion_seq', 228, true);
          public          postgres    false    203            �           0    0    bitacora_idbitacora_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.bitacora_idbitacora_seq', 215, true);
          public          postgres    false    205            �           0    0     bitacoraresidente_idbitacora_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.bitacoraresidente_idbitacora_seq', 14, true);
          public          postgres    false    207            �           0    0    casa_idcasa_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.casa_idcasa_seq', 14, true);
          public          postgres    false    209            �           0    0    categoria_idcategoria_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.categoria_idcategoria_seq', 9, true);
          public          postgres    false    211            �           0    0    denuncia_iddenuncia_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.denuncia_iddenuncia_seq', 21, true);
          public          postgres    false    213            �           0    0 %   detallematerial_iddetallematerial_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.detallematerial_iddetallematerial_seq', 31, true);
          public          postgres    false    215            �           0    0 !   detallevisita_iddetallevisita_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.detallevisita_iddetallevisita_seq', 7, true);
          public          postgres    false    217            �           0    0    empleado_idempleado_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.empleado_idempleado_seq', 12, true);
          public          postgres    false    219            �           0    0    espacio_idespacio_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.espacio_idespacio_seq', 5, true);
          public          postgres    false    221            �           0    0 #   estadoalquiler_idestadoalquiler_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.estadoalquiler_idestadoalquiler_seq', 4, true);
          public          postgres    false    223            �           0    0 '   estadoaportacion_idestadoaportacion_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.estadoaportacion_idestadoaportacion_seq', 2, true);
          public          postgres    false    225            �           0    0    estadocasa_idestadocasa_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.estadocasa_idestadocasa_seq', 2, true);
          public          postgres    false    227                        0    0 #   estadodenuncia_idestadodenuncia_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.estadodenuncia_idestadodenuncia_seq', 5, true);
          public          postgres    false    229                       0    0 #   estadoempleado_idestadoempleado_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.estadoempleado_idestadoempleado_seq', 3, true);
          public          postgres    false    231                       0    0 !   estadoespacio_idestadoespacio_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.estadoespacio_idestadoespacio_seq', 4, true);
          public          postgres    false    233                       0    0    estadopedido_idestadopedido_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.estadopedido_idestadopedido_seq', 4, true);
          public          postgres    false    235                       0    0 %   estadoresidente_idestadoresidente_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.estadoresidente_idestadoresidente_seq', 2, true);
          public          postgres    false    237                       0    0 !   estadousuario_idestadousuario_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.estadousuario_idestadousuario_seq', 2, true);
          public          postgres    false    239                       0    0    estadovisita_idestadovisita_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.estadovisita_idestadovisita_seq', 3, true);
          public          postgres    false    241                       0    0 -   historialinventario_idhistorialinventario_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('public.historialinventario_idhistorialinventario_seq', 17, true);
          public          postgres    false    243                       0    0 "   historialresidente_idhistorial_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.historialresidente_idhistorial_seq', 4, true);
          public          postgres    false    245            	           0    0     historialusuario_idhistorial_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.historialusuario_idhistorial_seq', 12, true);
          public          postgres    false    247            
           0    0 %   imagenesespacio_idimagenesespacio_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.imagenesespacio_idimagenesespacio_seq', 16, true);
          public          postgres    false    249                       0    0    marca_idmarca_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.marca_idmarca_seq', 5, true);
          public          postgres    false    251                       0    0    material_idmaterial_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.material_idmaterial_seq', 6, true);
          public          postgres    false    253                       0    0    mespago_idmespago_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.mespago_idmespago_seq', 60, true);
          public          postgres    false    255                       0    0    pedido_idpedido_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.pedido_idpedido_seq', 7, true);
          public          postgres    false    257                       0    0    permiso_idpermiso_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.permiso_idpermiso_seq', 6, true);
          public          postgres    false    259                       0    0 #   permisousuario_idpermisousuario_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.permisousuario_idpermisousuario_seq', 127, true);
          public          postgres    false    261                       0    0    residente_idresidente_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.residente_idresidente_seq', 22, true);
          public          postgres    false    263                       0    0 !   residentecasa_idresidentecasa_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.residentecasa_idresidentecasa_seq', 11, true);
          public          postgres    false    265                       0    0    tipodenuncia_idtipodenuncia_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.tipodenuncia_idtipodenuncia_seq', 3, true);
          public          postgres    false    267                       0    0    tipoempleado_idtipoempleado_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.tipoempleado_idtipoempleado_seq', 3, true);
          public          postgres    false    269                       0    0    tipounidad_idtipounidad_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.tipounidad_idtipounidad_seq', 3, true);
          public          postgres    false    271                       0    0    tipousuario_idtipousuario_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.tipousuario_idtipousuario_seq', 23, true);
          public          postgres    false    273                       0    0    unidadmedida_idunidadmedida_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.unidadmedida_idunidadmedida_seq', 3, true);
          public          postgres    false    275                       0    0    usuario_idusuario_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.usuario_idusuario_seq', 9, true);
          public          postgres    false    277                       0    0    visita_idvisita_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.visita_idvisita_seq', 27, true);
          public          postgres    false    279                       0    0    visitante_idvisitante_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.visitante_idvisitante_seq', 7, true);
          public          postgres    false    281            P           2606    28245    alquiler alquiler_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.alquiler
    ADD CONSTRAINT alquiler_pkey PRIMARY KEY (idalquiler);
 @   ALTER TABLE ONLY public.alquiler DROP CONSTRAINT alquiler_pkey;
       public            postgres    false    200            R           2606    28247    aportacion aportacion_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.aportacion
    ADD CONSTRAINT aportacion_pkey PRIMARY KEY (idaportacion);
 D   ALTER TABLE ONLY public.aportacion DROP CONSTRAINT aportacion_pkey;
       public            postgres    false    202            T           2606    28249    bitacora bitacora_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.bitacora
    ADD CONSTRAINT bitacora_pkey PRIMARY KEY (idbitacora);
 @   ALTER TABLE ONLY public.bitacora DROP CONSTRAINT bitacora_pkey;
       public            postgres    false    204            V           2606    28251 (   bitacoraresidente bitacoraresidente_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.bitacoraresidente
    ADD CONSTRAINT bitacoraresidente_pkey PRIMARY KEY (idbitacora);
 R   ALTER TABLE ONLY public.bitacoraresidente DROP CONSTRAINT bitacoraresidente_pkey;
       public            postgres    false    206            X           2606    28253    casa casa_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.casa
    ADD CONSTRAINT casa_pkey PRIMARY KEY (idcasa);
 8   ALTER TABLE ONLY public.casa DROP CONSTRAINT casa_pkey;
       public            postgres    false    208            \           2606    28255    categoria categoria_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (idcategoria);
 B   ALTER TABLE ONLY public.categoria DROP CONSTRAINT categoria_pkey;
       public            postgres    false    210            ^           2606    28257    denuncia denuncia_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.denuncia
    ADD CONSTRAINT denuncia_pkey PRIMARY KEY (iddenuncia);
 @   ALTER TABLE ONLY public.denuncia DROP CONSTRAINT denuncia_pkey;
       public            postgres    false    212            `           2606    28259 $   detallematerial detallematerial_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.detallematerial
    ADD CONSTRAINT detallematerial_pkey PRIMARY KEY (iddetallematerial);
 N   ALTER TABLE ONLY public.detallematerial DROP CONSTRAINT detallematerial_pkey;
       public            postgres    false    214            b           2606    28261     detallevisita detallevisita_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.detallevisita
    ADD CONSTRAINT detallevisita_pkey PRIMARY KEY (iddetallevisita);
 J   ALTER TABLE ONLY public.detallevisita DROP CONSTRAINT detallevisita_pkey;
       public            postgres    false    216            d           2606    28263    empleado empleado_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_pkey PRIMARY KEY (idempleado);
 @   ALTER TABLE ONLY public.empleado DROP CONSTRAINT empleado_pkey;
       public            postgres    false    218            l           2606    28265    espacio espacio_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.espacio
    ADD CONSTRAINT espacio_pkey PRIMARY KEY (idespacio);
 >   ALTER TABLE ONLY public.espacio DROP CONSTRAINT espacio_pkey;
       public            postgres    false    220            p           2606    28267 "   estadoalquiler estadoalquiler_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.estadoalquiler
    ADD CONSTRAINT estadoalquiler_pkey PRIMARY KEY (idestadoalquiler);
 L   ALTER TABLE ONLY public.estadoalquiler DROP CONSTRAINT estadoalquiler_pkey;
       public            postgres    false    222            r           2606    28269 &   estadoaportacion estadoaportacion_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.estadoaportacion
    ADD CONSTRAINT estadoaportacion_pkey PRIMARY KEY (idestadoaportacion);
 P   ALTER TABLE ONLY public.estadoaportacion DROP CONSTRAINT estadoaportacion_pkey;
       public            postgres    false    224            t           2606    28271    estadocasa estadocasa_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.estadocasa
    ADD CONSTRAINT estadocasa_pkey PRIMARY KEY (idestadocasa);
 D   ALTER TABLE ONLY public.estadocasa DROP CONSTRAINT estadocasa_pkey;
       public            postgres    false    226            v           2606    28273 "   estadodenuncia estadodenuncia_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.estadodenuncia
    ADD CONSTRAINT estadodenuncia_pkey PRIMARY KEY (idestadodenuncia);
 L   ALTER TABLE ONLY public.estadodenuncia DROP CONSTRAINT estadodenuncia_pkey;
       public            postgres    false    228            x           2606    28275 "   estadoempleado estadoempleado_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.estadoempleado
    ADD CONSTRAINT estadoempleado_pkey PRIMARY KEY (idestadoempleado);
 L   ALTER TABLE ONLY public.estadoempleado DROP CONSTRAINT estadoempleado_pkey;
       public            postgres    false    230            z           2606    28277     estadoespacio estadoespacio_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.estadoespacio
    ADD CONSTRAINT estadoespacio_pkey PRIMARY KEY (idestadoespacio);
 J   ALTER TABLE ONLY public.estadoespacio DROP CONSTRAINT estadoespacio_pkey;
       public            postgres    false    232            |           2606    28279    estadopedido estadopedido_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.estadopedido
    ADD CONSTRAINT estadopedido_pkey PRIMARY KEY (idestadopedido);
 H   ALTER TABLE ONLY public.estadopedido DROP CONSTRAINT estadopedido_pkey;
       public            postgres    false    234            ~           2606    28281 $   estadoresidente estadoresidente_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.estadoresidente
    ADD CONSTRAINT estadoresidente_pkey PRIMARY KEY (idestadoresidente);
 N   ALTER TABLE ONLY public.estadoresidente DROP CONSTRAINT estadoresidente_pkey;
       public            postgres    false    236            �           2606    28283     estadousuario estadousuario_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.estadousuario
    ADD CONSTRAINT estadousuario_pkey PRIMARY KEY (idestadousuario);
 J   ALTER TABLE ONLY public.estadousuario DROP CONSTRAINT estadousuario_pkey;
       public            postgres    false    238            �           2606    28285    estadovisita estadovisita_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.estadovisita
    ADD CONSTRAINT estadovisita_pkey PRIMARY KEY (idestadovisita);
 H   ALTER TABLE ONLY public.estadovisita DROP CONSTRAINT estadovisita_pkey;
       public            postgres    false    240            �           2606    28287 ,   historialinventario historialinventario_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public.historialinventario
    ADD CONSTRAINT historialinventario_pkey PRIMARY KEY (idhistorialinventario);
 V   ALTER TABLE ONLY public.historialinventario DROP CONSTRAINT historialinventario_pkey;
       public            postgres    false    242            �           2606    28289 *   historialresidente historialresidente_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.historialresidente
    ADD CONSTRAINT historialresidente_pkey PRIMARY KEY (idhistorial);
 T   ALTER TABLE ONLY public.historialresidente DROP CONSTRAINT historialresidente_pkey;
       public            postgres    false    244            �           2606    28291 &   historialusuario historialusuario_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.historialusuario
    ADD CONSTRAINT historialusuario_pkey PRIMARY KEY (idhistorial);
 P   ALTER TABLE ONLY public.historialusuario DROP CONSTRAINT historialusuario_pkey;
       public            postgres    false    246            �           2606    28293 $   imagenesespacio imagenesespacio_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.imagenesespacio
    ADD CONSTRAINT imagenesespacio_pkey PRIMARY KEY (idimagenesespacio);
 N   ALTER TABLE ONLY public.imagenesespacio DROP CONSTRAINT imagenesespacio_pkey;
       public            postgres    false    248            �           2606    28295    marca marca_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.marca
    ADD CONSTRAINT marca_pkey PRIMARY KEY (idmarca);
 :   ALTER TABLE ONLY public.marca DROP CONSTRAINT marca_pkey;
       public            postgres    false    250            �           2606    28297    material material_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.material
    ADD CONSTRAINT material_pkey PRIMARY KEY (idmaterial);
 @   ALTER TABLE ONLY public.material DROP CONSTRAINT material_pkey;
       public            postgres    false    252            �           2606    28299    mespago mespago_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.mespago
    ADD CONSTRAINT mespago_pkey PRIMARY KEY (idmespago);
 >   ALTER TABLE ONLY public.mespago DROP CONSTRAINT mespago_pkey;
       public            postgres    false    254            �           2606    28301    pedido pedido_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (idpedido);
 <   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_pkey;
       public            postgres    false    256            �           2606    28303    permiso permiso_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.permiso
    ADD CONSTRAINT permiso_pkey PRIMARY KEY (idpermiso);
 >   ALTER TABLE ONLY public.permiso DROP CONSTRAINT permiso_pkey;
       public            postgres    false    258            �           2606    28305 "   permisousuario permisousuario_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.permisousuario
    ADD CONSTRAINT permisousuario_pkey PRIMARY KEY (idpermisousuario);
 L   ALTER TABLE ONLY public.permisousuario DROP CONSTRAINT permisousuario_pkey;
       public            postgres    false    260            �           2606    28307    residente residente_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.residente
    ADD CONSTRAINT residente_pkey PRIMARY KEY (idresidente);
 B   ALTER TABLE ONLY public.residente DROP CONSTRAINT residente_pkey;
       public            postgres    false    262            �           2606    28309     residentecasa residentecasa_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.residentecasa
    ADD CONSTRAINT residentecasa_pkey PRIMARY KEY (idresidentecasa);
 J   ALTER TABLE ONLY public.residentecasa DROP CONSTRAINT residentecasa_pkey;
       public            postgres    false    264            �           2606    28311    tipodenuncia tipodenuncia_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.tipodenuncia
    ADD CONSTRAINT tipodenuncia_pkey PRIMARY KEY (idtipodenuncia);
 H   ALTER TABLE ONLY public.tipodenuncia DROP CONSTRAINT tipodenuncia_pkey;
       public            postgres    false    266            �           2606    28313    tipoempleado tipoempleado_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.tipoempleado
    ADD CONSTRAINT tipoempleado_pkey PRIMARY KEY (idtipoempleado);
 H   ALTER TABLE ONLY public.tipoempleado DROP CONSTRAINT tipoempleado_pkey;
       public            postgres    false    268            �           2606    28315    tipounidad tipounidad_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.tipounidad
    ADD CONSTRAINT tipounidad_pkey PRIMARY KEY (idtipounidad);
 D   ALTER TABLE ONLY public.tipounidad DROP CONSTRAINT tipounidad_pkey;
       public            postgres    false    270            �           2606    28317    tipousuario tipousuario_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.tipousuario
    ADD CONSTRAINT tipousuario_pkey PRIMARY KEY (idtipousuario);
 F   ALTER TABLE ONLY public.tipousuario DROP CONSTRAINT tipousuario_pkey;
       public            postgres    false    272            �           2606    28319    unidadmedida unidadmedida_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.unidadmedida
    ADD CONSTRAINT unidadmedida_pkey PRIMARY KEY (idunidadmedida);
 H   ALTER TABLE ONLY public.unidadmedida DROP CONSTRAINT unidadmedida_pkey;
       public            postgres    false    274            Z           2606    28321    casa uq_casa_numero 
   CONSTRAINT     T   ALTER TABLE ONLY public.casa
    ADD CONSTRAINT uq_casa_numero UNIQUE (numerocasa);
 =   ALTER TABLE ONLY public.casa DROP CONSTRAINT uq_casa_numero;
       public            postgres    false    208            f           2606    28323    empleado uq_empleado_correo 
   CONSTRAINT     X   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT uq_empleado_correo UNIQUE (correo);
 E   ALTER TABLE ONLY public.empleado DROP CONSTRAINT uq_empleado_correo;
       public            postgres    false    218            h           2606    28325    empleado uq_empleado_dui 
   CONSTRAINT     R   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT uq_empleado_dui UNIQUE (dui);
 B   ALTER TABLE ONLY public.empleado DROP CONSTRAINT uq_empleado_dui;
       public            postgres    false    218            j           2606    28327    empleado uq_empleado_telefono 
   CONSTRAINT     \   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT uq_empleado_telefono UNIQUE (telefono);
 G   ALTER TABLE ONLY public.empleado DROP CONSTRAINT uq_empleado_telefono;
       public            postgres    false    218            n           2606    28329    espacio uq_espacio_nombre 
   CONSTRAINT     V   ALTER TABLE ONLY public.espacio
    ADD CONSTRAINT uq_espacio_nombre UNIQUE (nombre);
 C   ALTER TABLE ONLY public.espacio DROP CONSTRAINT uq_espacio_nombre;
       public            postgres    false    220            �           2606    28331    residente uq_residente_correo 
   CONSTRAINT     Z   ALTER TABLE ONLY public.residente
    ADD CONSTRAINT uq_residente_correo UNIQUE (correo);
 G   ALTER TABLE ONLY public.residente DROP CONSTRAINT uq_residente_correo;
       public            postgres    false    262            �           2606    28333    residente uq_residente_dui 
   CONSTRAINT     T   ALTER TABLE ONLY public.residente
    ADD CONSTRAINT uq_residente_dui UNIQUE (dui);
 D   ALTER TABLE ONLY public.residente DROP CONSTRAINT uq_residente_dui;
       public            postgres    false    262            �           2606    28335 '   residente uq_residente_telefono_celular 
   CONSTRAINT     m   ALTER TABLE ONLY public.residente
    ADD CONSTRAINT uq_residente_telefono_celular UNIQUE (telefonocelular);
 Q   ALTER TABLE ONLY public.residente DROP CONSTRAINT uq_residente_telefono_celular;
       public            postgres    false    262            �           2606    28337 $   residente uq_residente_telefono_fijo 
   CONSTRAINT     g   ALTER TABLE ONLY public.residente
    ADD CONSTRAINT uq_residente_telefono_fijo UNIQUE (telefonofijo);
 N   ALTER TABLE ONLY public.residente DROP CONSTRAINT uq_residente_telefono_fijo;
       public            postgres    false    262            �           2606    28339    residente uq_residente_username 
   CONSTRAINT     ^   ALTER TABLE ONLY public.residente
    ADD CONSTRAINT uq_residente_username UNIQUE (username);
 I   ALTER TABLE ONLY public.residente DROP CONSTRAINT uq_residente_username;
       public            postgres    false    262            �           2606    28341    tipousuario uq_tipousuario 
   CONSTRAINT     \   ALTER TABLE ONLY public.tipousuario
    ADD CONSTRAINT uq_tipousuario UNIQUE (tipousuario);
 D   ALTER TABLE ONLY public.tipousuario DROP CONSTRAINT uq_tipousuario;
       public            postgres    false    272            �           2606    28343    usuario uq_usuario_correo 
   CONSTRAINT     V   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT uq_usuario_correo UNIQUE (correo);
 C   ALTER TABLE ONLY public.usuario DROP CONSTRAINT uq_usuario_correo;
       public            postgres    false    276            �           2606    28345    usuario uq_usuario_dui 
   CONSTRAINT     P   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT uq_usuario_dui UNIQUE (dui);
 @   ALTER TABLE ONLY public.usuario DROP CONSTRAINT uq_usuario_dui;
       public            postgres    false    276            �           2606    28347 #   usuario uq_usuario_telefono_celular 
   CONSTRAINT     i   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT uq_usuario_telefono_celular UNIQUE (telefonocelular);
 M   ALTER TABLE ONLY public.usuario DROP CONSTRAINT uq_usuario_telefono_celular;
       public            postgres    false    276            �           2606    28349     usuario uq_usuario_telefono_fijo 
   CONSTRAINT     c   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT uq_usuario_telefono_fijo UNIQUE (telefonofijo);
 J   ALTER TABLE ONLY public.usuario DROP CONSTRAINT uq_usuario_telefono_fijo;
       public            postgres    false    276            �           2606    28351    usuario uq_usuario_username 
   CONSTRAINT     Z   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT uq_usuario_username UNIQUE (username);
 E   ALTER TABLE ONLY public.usuario DROP CONSTRAINT uq_usuario_username;
       public            postgres    false    276            �           2606    28353    visitante uq_visitante_dui 
   CONSTRAINT     T   ALTER TABLE ONLY public.visitante
    ADD CONSTRAINT uq_visitante_dui UNIQUE (dui);
 D   ALTER TABLE ONLY public.visitante DROP CONSTRAINT uq_visitante_dui;
       public            postgres    false    280            �           2606    28355    visitante uq_visitante_placa 
   CONSTRAINT     X   ALTER TABLE ONLY public.visitante
    ADD CONSTRAINT uq_visitante_placa UNIQUE (placa);
 F   ALTER TABLE ONLY public.visitante DROP CONSTRAINT uq_visitante_placa;
       public            postgres    false    280            �           2606    28357    usuario usuario_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (idusuario);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public            postgres    false    276            �           2606    28359    visita visita_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.visita
    ADD CONSTRAINT visita_pkey PRIMARY KEY (idvisita);
 <   ALTER TABLE ONLY public.visita DROP CONSTRAINT visita_pkey;
       public            postgres    false    278            �           2606    28361    visitante visitante_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.visitante
    ADD CONSTRAINT visitante_pkey PRIMARY KEY (idvisitante);
 B   ALTER TABLE ONLY public.visitante DROP CONSTRAINT visitante_pkey;
       public            postgres    false    280            �           2620    28362    material tr_historialinventario    TRIGGER     �   CREATE TRIGGER tr_historialinventario BEFORE UPDATE ON public.material FOR EACH ROW EXECUTE FUNCTION public.sp_historialinventario();
 8   DROP TRIGGER tr_historialinventario ON public.material;
       public          postgres    false    282    252            �           2606    28363     alquiler alquiler_idespacio_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.alquiler
    ADD CONSTRAINT alquiler_idespacio_fkey FOREIGN KEY (idespacio) REFERENCES public.espacio(idespacio);
 J   ALTER TABLE ONLY public.alquiler DROP CONSTRAINT alquiler_idespacio_fkey;
       public          postgres    false    3180    220    200            �           2606    28368 '   alquiler alquiler_idestadoalquiler_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.alquiler
    ADD CONSTRAINT alquiler_idestadoalquiler_fkey FOREIGN KEY (idestadoalquiler) REFERENCES public.estadoalquiler(idestadoalquiler);
 Q   ALTER TABLE ONLY public.alquiler DROP CONSTRAINT alquiler_idestadoalquiler_fkey;
       public          postgres    false    3184    200    222            �           2606    28373 "   alquiler alquiler_idresidente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.alquiler
    ADD CONSTRAINT alquiler_idresidente_fkey FOREIGN KEY (idresidente) REFERENCES public.residente(idresidente);
 L   ALTER TABLE ONLY public.alquiler DROP CONSTRAINT alquiler_idresidente_fkey;
       public          postgres    false    262    200    3224            �           2606    28378     alquiler alquiler_idusuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.alquiler
    ADD CONSTRAINT alquiler_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);
 J   ALTER TABLE ONLY public.alquiler DROP CONSTRAINT alquiler_idusuario_fkey;
       public          postgres    false    200    3260    276            �           2606    28383 !   aportacion aportacion_idcasa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.aportacion
    ADD CONSTRAINT aportacion_idcasa_fkey FOREIGN KEY (idcasa) REFERENCES public.casa(idcasa);
 K   ALTER TABLE ONLY public.aportacion DROP CONSTRAINT aportacion_idcasa_fkey;
       public          postgres    false    3160    202    208            �           2606    28388 -   aportacion aportacion_idestadoaportacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.aportacion
    ADD CONSTRAINT aportacion_idestadoaportacion_fkey FOREIGN KEY (idestadoaportacion) REFERENCES public.estadoaportacion(idestadoaportacion);
 W   ALTER TABLE ONLY public.aportacion DROP CONSTRAINT aportacion_idestadoaportacion_fkey;
       public          postgres    false    224    3186    202            �           2606    28393 $   aportacion aportacion_idmespago_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.aportacion
    ADD CONSTRAINT aportacion_idmespago_fkey FOREIGN KEY (idmespago) REFERENCES public.mespago(idmespago);
 N   ALTER TABLE ONLY public.aportacion DROP CONSTRAINT aportacion_idmespago_fkey;
       public          postgres    false    254    202    3216            �           2606    28398     bitacora bitacora_idusuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.bitacora
    ADD CONSTRAINT bitacora_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);
 J   ALTER TABLE ONLY public.bitacora DROP CONSTRAINT bitacora_idusuario_fkey;
       public          postgres    false    204    3260    276            �           2606    28403 4   bitacoraresidente bitacoraresidente_idresidente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.bitacoraresidente
    ADD CONSTRAINT bitacoraresidente_idresidente_fkey FOREIGN KEY (idresidente) REFERENCES public.residente(idresidente);
 ^   ALTER TABLE ONLY public.bitacoraresidente DROP CONSTRAINT bitacoraresidente_idresidente_fkey;
       public          postgres    false    3224    206    262            �           2606    28408    casa casa_idestadocasa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.casa
    ADD CONSTRAINT casa_idestadocasa_fkey FOREIGN KEY (idestadocasa) REFERENCES public.estadocasa(idestadocasa);
 E   ALTER TABLE ONLY public.casa DROP CONSTRAINT casa_idestadocasa_fkey;
       public          postgres    false    208    3188    226            �           2606    28413 !   denuncia denuncia_idempleado_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.denuncia
    ADD CONSTRAINT denuncia_idempleado_fkey FOREIGN KEY (idempleado) REFERENCES public.empleado(idempleado);
 K   ALTER TABLE ONLY public.denuncia DROP CONSTRAINT denuncia_idempleado_fkey;
       public          postgres    false    218    212    3172            �           2606    28418 '   denuncia denuncia_idestadodenuncia_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.denuncia
    ADD CONSTRAINT denuncia_idestadodenuncia_fkey FOREIGN KEY (idestadodenuncia) REFERENCES public.estadodenuncia(idestadodenuncia);
 Q   ALTER TABLE ONLY public.denuncia DROP CONSTRAINT denuncia_idestadodenuncia_fkey;
       public          postgres    false    212    228    3190            �           2606    28423 "   denuncia denuncia_idresidente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.denuncia
    ADD CONSTRAINT denuncia_idresidente_fkey FOREIGN KEY (idresidente) REFERENCES public.residente(idresidente);
 L   ALTER TABLE ONLY public.denuncia DROP CONSTRAINT denuncia_idresidente_fkey;
       public          postgres    false    262    3224    212            �           2606    28428 %   denuncia denuncia_idtipodenuncia_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.denuncia
    ADD CONSTRAINT denuncia_idtipodenuncia_fkey FOREIGN KEY (idtipodenuncia) REFERENCES public.tipodenuncia(idtipodenuncia);
 O   ALTER TABLE ONLY public.denuncia DROP CONSTRAINT denuncia_idtipodenuncia_fkey;
       public          postgres    false    266    3238    212            �           2606    28433 /   detallematerial detallematerial_idmaterial_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.detallematerial
    ADD CONSTRAINT detallematerial_idmaterial_fkey FOREIGN KEY (idmaterial) REFERENCES public.material(idmaterial);
 Y   ALTER TABLE ONLY public.detallematerial DROP CONSTRAINT detallematerial_idmaterial_fkey;
       public          postgres    false    3214    252    214            �           2606    28438 -   detallematerial detallematerial_idpedido_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.detallematerial
    ADD CONSTRAINT detallematerial_idpedido_fkey FOREIGN KEY (idpedido) REFERENCES public.pedido(idpedido);
 W   ALTER TABLE ONLY public.detallematerial DROP CONSTRAINT detallematerial_idpedido_fkey;
       public          postgres    false    214    3218    256            �           2606    28443 )   detallevisita detallevisita_idvisita_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.detallevisita
    ADD CONSTRAINT detallevisita_idvisita_fkey FOREIGN KEY (idvisita) REFERENCES public.visita(idvisita);
 S   ALTER TABLE ONLY public.detallevisita DROP CONSTRAINT detallevisita_idvisita_fkey;
       public          postgres    false    3262    216    278            �           2606    28448 ,   detallevisita detallevisita_idvisitante_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.detallevisita
    ADD CONSTRAINT detallevisita_idvisitante_fkey FOREIGN KEY (idvisitante) REFERENCES public.visitante(idvisitante);
 V   ALTER TABLE ONLY public.detallevisita DROP CONSTRAINT detallevisita_idvisitante_fkey;
       public          postgres    false    280    3268    216            �           2606    28453 '   empleado empleado_idestadoempleado_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_idestadoempleado_fkey FOREIGN KEY (idestadoempleado) REFERENCES public.estadoempleado(idestadoempleado);
 Q   ALTER TABLE ONLY public.empleado DROP CONSTRAINT empleado_idestadoempleado_fkey;
       public          postgres    false    3192    230    218            �           2606    28458 %   empleado empleado_idtipoempleado_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_idtipoempleado_fkey FOREIGN KEY (idtipoempleado) REFERENCES public.tipoempleado(idtipoempleado);
 O   ALTER TABLE ONLY public.empleado DROP CONSTRAINT empleado_idtipoempleado_fkey;
       public          postgres    false    218    268    3240            �           2606    28463 $   espacio espacio_idestadoespacio_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.espacio
    ADD CONSTRAINT espacio_idestadoespacio_fkey FOREIGN KEY (idestadoespacio) REFERENCES public.estadoespacio(idestadoespacio);
 N   ALTER TABLE ONLY public.espacio DROP CONSTRAINT espacio_idestadoespacio_fkey;
       public          postgres    false    232    3194    220            �           2606    28468 7   historialinventario historialinventario_idmaterial_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.historialinventario
    ADD CONSTRAINT historialinventario_idmaterial_fkey FOREIGN KEY (idmaterial) REFERENCES public.material(idmaterial);
 a   ALTER TABLE ONLY public.historialinventario DROP CONSTRAINT historialinventario_idmaterial_fkey;
       public          postgres    false    242    252    3214            �           2606    28473 6   historialresidente historialresidente_idresidente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.historialresidente
    ADD CONSTRAINT historialresidente_idresidente_fkey FOREIGN KEY (idresidente) REFERENCES public.residente(idresidente);
 `   ALTER TABLE ONLY public.historialresidente DROP CONSTRAINT historialresidente_idresidente_fkey;
       public          postgres    false    244    3224    262            �           2606    28478 0   historialusuario historialusuario_idusuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.historialusuario
    ADD CONSTRAINT historialusuario_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);
 Z   ALTER TABLE ONLY public.historialusuario DROP CONSTRAINT historialusuario_idusuario_fkey;
       public          postgres    false    276    3260    246            �           2606    28483 .   imagenesespacio imagenesespacio_idespacio_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.imagenesespacio
    ADD CONSTRAINT imagenesespacio_idespacio_fkey FOREIGN KEY (idespacio) REFERENCES public.espacio(idespacio);
 X   ALTER TABLE ONLY public.imagenesespacio DROP CONSTRAINT imagenesespacio_idespacio_fkey;
       public          postgres    false    248    3180    220            �           2606    28488 "   material material_idcategoria_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.material
    ADD CONSTRAINT material_idcategoria_fkey FOREIGN KEY (idcategoria) REFERENCES public.categoria(idcategoria);
 L   ALTER TABLE ONLY public.material DROP CONSTRAINT material_idcategoria_fkey;
       public          postgres    false    3164    210    252            �           2606    28493    material material_idmarca_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.material
    ADD CONSTRAINT material_idmarca_fkey FOREIGN KEY (idmarca) REFERENCES public.marca(idmarca);
 H   ALTER TABLE ONLY public.material DROP CONSTRAINT material_idmarca_fkey;
       public          postgres    false    3212    250    252            �           2606    28498 %   material material_idunidadmedida_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.material
    ADD CONSTRAINT material_idunidadmedida_fkey FOREIGN KEY (idunidadmedida) REFERENCES public.unidadmedida(idunidadmedida);
 O   ALTER TABLE ONLY public.material DROP CONSTRAINT material_idunidadmedida_fkey;
       public          postgres    false    252    3248    274            �           2606    28503    pedido pedido_idempleado_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_idempleado_fkey FOREIGN KEY (idempleado) REFERENCES public.empleado(idempleado);
 G   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_idempleado_fkey;
       public          postgres    false    256    3172    218            �           2606    28508 !   pedido pedido_idestadopedido_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_idestadopedido_fkey FOREIGN KEY (idestadopedido) REFERENCES public.estadopedido(idestadopedido);
 K   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_idestadopedido_fkey;
       public          postgres    false    3196    256    234            �           2606    28513    pedido pedido_idusuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_idusuario_fkey FOREIGN KEY (idusuario) REFERENCES public.usuario(idusuario);
 F   ALTER TABLE ONLY public.pedido DROP CONSTRAINT pedido_idusuario_fkey;
       public          postgres    false    256    276    3260            �           2606    28518 ,   permisousuario permisousuario_idpermiso_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.permisousuario
    ADD CONSTRAINT permisousuario_idpermiso_fkey FOREIGN KEY (idpermiso) REFERENCES public.permiso(idpermiso);
 V   ALTER TABLE ONLY public.permisousuario DROP CONSTRAINT permisousuario_idpermiso_fkey;
       public          postgres    false    3220    258    260            �           2606    28523 0   permisousuario permisousuario_idtipousuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.permisousuario
    ADD CONSTRAINT permisousuario_idtipousuario_fkey FOREIGN KEY (idtipousuario) REFERENCES public.tipousuario(idtipousuario);
 Z   ALTER TABLE ONLY public.permisousuario DROP CONSTRAINT permisousuario_idtipousuario_fkey;
       public          postgres    false    260    3244    272            �           2606    28528 *   residente residente_idestadoresidente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.residente
    ADD CONSTRAINT residente_idestadoresidente_fkey FOREIGN KEY (idestadoresidente) REFERENCES public.estadoresidente(idestadoresidente);
 T   ALTER TABLE ONLY public.residente DROP CONSTRAINT residente_idestadoresidente_fkey;
       public          postgres    false    262    236    3198            �           2606    28533 '   residentecasa residentecasa_idcasa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.residentecasa
    ADD CONSTRAINT residentecasa_idcasa_fkey FOREIGN KEY (idcasa) REFERENCES public.casa(idcasa);
 Q   ALTER TABLE ONLY public.residentecasa DROP CONSTRAINT residentecasa_idcasa_fkey;
       public          postgres    false    264    3160    208            �           2606    28538 ,   residentecasa residentecasa_idresidente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.residentecasa
    ADD CONSTRAINT residentecasa_idresidente_fkey FOREIGN KEY (idresidente) REFERENCES public.residente(idresidente);
 V   ALTER TABLE ONLY public.residentecasa DROP CONSTRAINT residentecasa_idresidente_fkey;
       public          postgres    false    264    3224    262            �           2606    28543 +   unidadmedida unidadmedida_idtipounidad_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.unidadmedida
    ADD CONSTRAINT unidadmedida_idtipounidad_fkey FOREIGN KEY (idtipounidad) REFERENCES public.tipounidad(idtipounidad);
 U   ALTER TABLE ONLY public.unidadmedida DROP CONSTRAINT unidadmedida_idtipounidad_fkey;
       public          postgres    false    3242    270    274            �           2606    28548 $   usuario usuario_idestadousuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_idestadousuario_fkey FOREIGN KEY (idestadousuario) REFERENCES public.estadousuario(idestadousuario);
 N   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_idestadousuario_fkey;
       public          postgres    false    276    3200    238            �           2606    28553 "   usuario usuario_idtipousuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_idtipousuario_fkey FOREIGN KEY (idtipousuario) REFERENCES public.tipousuario(idtipousuario);
 L   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_idtipousuario_fkey;
       public          postgres    false    272    3244    276            �           2606    28558 !   visita visita_idestadovisita_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.visita
    ADD CONSTRAINT visita_idestadovisita_fkey FOREIGN KEY (idestadovisita) REFERENCES public.estadovisita(idestadovisita);
 K   ALTER TABLE ONLY public.visita DROP CONSTRAINT visita_idestadovisita_fkey;
       public          postgres    false    278    3202    240            �           2606    28563    visita visita_idresidente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.visita
    ADD CONSTRAINT visita_idresidente_fkey FOREIGN KEY (idresidente) REFERENCES public.residente(idresidente);
 H   ALTER TABLE ONLY public.visita DROP CONSTRAINT visita_idresidente_fkey;
       public          postgres    false    3224    278    262            q   �   x���[��0�og/Tc�尖��u�`(�U��M�h�BLB�q&���X$��?�?�:R�M39F]Pm��5�j�id�3;��.���y��G���~l��f��Ʌ�tN���?�6�.�a��j��,L��d[4��#{3f�lw�7�>h}�?d�hW�NS:���֦_���ڞj�}n\n�+�>��ָg�����xW�t�,���:����S��bh�)��B�ƺ��      s     x���Kn�@��t
^@Awϣ{n�dCD�!��۹Ș5�z�+��aD�
�\Ovғ��abz�X�~�/����|}N��yz������~{|>��mz������z{��ϯg�'mN�$pNޜ|I2�48es��y����S��S�o�������Ę���ic�+�Q��T�T:��c'��m�jc'�u������s@b�����K�*.�jp��j��%V3.�Z�p��
�L�z���j_4���< W8\np�4<�����K�.�p�4��pix�!���!.��&�]��O�08\b��p�E��%�XT8\b�p��"�p�E��%֤�K���k}�db--���Z��%�
.�V�p�5��%��Xkp��L���¡[��wH%f��J̤/�K̤,טO̤¡3q8Tb&�J̤��38Tb��&�Hl�M��&8\b����t4���E�O���u=�5E^_��������5:�E��C\�_w���M;�uo�!.|K�ʷ�!.}+�ڷ���߾M����ms���q>����v      u   
  x����n����Sp�,��uWq�'@6Y� � -�]|D�,�N�r^,�3͞����$`!�7}����{Wp�$Z��
F��!��W?�l��n�OW?�-^�/����b;~��zyX<��l��O�����n�x^}�o׋��׻���q��10�Ħs�n�7�����ѱ橘�K�%� �vC��\�u���f�oaܯ��O���k���C����"�4��cxY�m���0�OG���2a����fu�i�z�Y^l�W_��Z
ܖ�K� 5�����1.Q���Egӛ��#�p%䈚/��������V��S&ۇqӯ��c�ۯ��M���>�[��P#u��>� �b��5�rUg�5b�t��Ge]VR^��M�u$T����*�4��������_^6w���xxt�!�n��f�]�1HE���oe�9⧻���a�>;�|��ՃpP�,tp�v�p��<�G,>1hW��쳇��;��f=�~uf��4���
�<�x�X���[󴅱��� ���(�yI��9�i�sLj�P��`����(.�ǙQ�q.�j��D����kx Y�"=z�VC��u��<��Qk$�\b������Y�>�.; �PJ'.���m��2���%��	�&Y�f�R@J9u�N�����Ζ%��%�q�k��,�@�7?G<ёlA�>,2"&4�5UsLub�et�㕂v�$�c-˟ L�s.'�-=
g>�lO�v�*ņ�8�U?�Fg�Ɨ���#��Y�B����>�f�ʰz��:푑aGy=��f�<�>���U��6�'�
@�rM8$È���@|��p�ʀ�H�\�w�~3Hm1�@��	R%[���j�@*�A��Á騩򰷹]?<��=�8I	!dI���=��*5�o1�~u�7�0J��|P�r�D��\���Yl���x^x����yp}�5&�3����{U��f����f������ȣt��C9�v��S:�tT�>1�I�eV���{|\�Zb��g� ]Fz�2��Q���#�P�A��3��Γj+)��]+��\w�u:��qk���]<�qg�[�{�9�;f���r�.\����^���5u2k�plp�9�.{�Fg
�������`	i	�DYϰ#bI�o�R�*/q���ۉ�%�w��[Z�ٔ[�K? ���L�����&���~��y10�p�j_G�.|u"q$:h�MR7�D��7�sRO�ce��YHb�U�F�SۙHXITڷ�T�\c�JJ��󐤳-��\A	�BM<�4>��R~3�$A�S#C$lo���X�yz	�Vnf�z���q!�K� p|>����!���D�;#t�(.Q|���)�bJ����k��l�툘�g"�b<�3~ �l�	5f��H؎5��n������s
Ql/����!RC���DU�x_��}�I(\�7%�F"��2�H6�Rp�
��!Yl$���鈽�6L �e�Q�4y���]�%��q��юM糾�K�����a�н%���~i���(p��vx���Ņ#�8�HA\D�XN�[�;���ʱ�2^�n��QR]��n���"<Ɔwm�������2��z���z��~x����m������>��,�NΘ�e���ǧ������8��5��VHmIF��7O��#��ǧ����7�Onl�l�9�E(@H�n��j�R`:R�8!\����s±]��=�� ��s�|)��M�"������O��;���?/���,����,�fE	�i��}-�����h�'�z�@�4�K��;��pP�hx����z��E(M,��=0O{�}�w��������*���b���ou�>��2v�u�i��<�� �Q���^��Q]v	��N��!۞��[����y����hyp�6|z@�YK�[Z̜ϗ�K��_��Ed߯pp�N�!8���c��$Ipx�MH�#`d<��08p*�� �k)�y��3\Ŭf\���S����J����%�N&3]�4���v?�r?�b��؎��X��8\��W;���f޽2���^�y�ڹ��w�`昺3�1\��K�R�R���ԝ�&F
��<�##W�p�I��_m�8�\n���PG�M+�} ���(
��0wg`cx:WwI��D�#'Mw�;2xb���h��8�1C���?#M)oנ�_�<1tPg���ٵrw?���㕋.��<����a��.O���=6��m�Ș�\|�Y)v_s��y�M$ɱ��e�9h9�ϐ�(��e'�;2��HAK��z��@py���3�1(������!8{:��*Qvn��ne&��=P`BXH��=�6hy�E���XR�?��� ���"���<v߹�&F����'AɍQ.�z	��Ů��J`wi��\lb��r]�tg��.����w��F��C����ʳv�#��b����hO<18���ܟ!C˝sJ��Uj��D�_U?�T��b�����k=i#����,>�J\iG8רr�}�����l����0IӹP�P.�4��=Q5 �J��68�ƅ� 4'�t�	��*wB)�U����M�J��$�XA��l�����r0��������3�~���5X0Wi�$��7kh�,�7(F>͛�ʩ!%J݅���p�����Tn�r�̨?�F�r6�Ia�������1��ҽW��1\�*S�z_�1��4��3�1|�"���-N/7�rwm��2�`�_'�N.P*32����hb��MW�_�7�K&Ex��0db�Wf	�����@��S����Ǒ��i���������`�I�7G0Ɖ�k����3"�=� l$}S�۪��'wqν�k��������u�� ɺ�q���:ޚe���b�F J������� �#�o��6�������k>�=O�L�_��+C�814�����MPT�m�����L6i�,��;-!�-���rTΆ�ℛ<��'�����Û"�Ŗ�1�c>q�~�����������z�!      w   V  x���;N1��>�K(byƯ�DB��At4���H�lȃsqN�8	I�ڤ\��<�TT@%���F̔�B�0r<¨�v���}�u�����y��2�� Zr��buP��T	\�Y��L'%�q3��z�ښi�|��5��F��ٯj)$V%bqٲ���r%)�;%։�����X�@(�r 9yD�����mۛ��v��A����xk���f%�Lv;���Wf�ߴ6o���:K�
�c@����ri`�B�J���$���I�J:vP����<]����\��RW0x��kpѧx)���JN�ҟb��[_��5`a"0�7ry�"7�n��x�uH�3/Vk�W(�      y   �   x�M��!���)x<�NGc\�.qu��(A�|{��~�Oځ�5�J��"�I��{r"e(n�vp�[	VP!+�r�%��r0�<�a�G��T8̌���A=][W_����bF8�X�S�pµ@���ʰ�P/�Z|�����M�@�RF�ɸ�'C�/J�ªC]����]G�_�"]Qi��� xL�      {   D   x�3�t,*9�6�4'�X!%U!'3� 3�*��M"9?����499���<.KN�����Լ�D�@� �w�      }     x�mQMN!^3�x�f`fl�6&��� �<�ii��0=�G�b�`�D����ό���r��a�3�N����F ��-��j�qÎ��;�ƬP��^L��!9����k����S>+孖�h_U&6�"M�{�$�˜!i�_ѻ��[�;��v(��+1�L��#IQ�.�.*��h�n�2���?c,��C+M��Ji��	�cʾ(�M՟�N�CM0�����K��D����jW����r��ṭa�^���%���Ň���s_��M�u_�         S   x�=���@��v��;���������T��c�a����IeS���:���dFU�7���OI���X��35�:���'�A�1�      �   0   x��� 0��x�Jqs,���h�A�̢�%��µj܌��;�>��<      �     x�u�Kn�0���)t$� ����A�5�m6#�V�J�A�F�;uQ��X��]�q����F~���\�Yik��Y� ����t����rDT��j*$a</�JȬ&_H���j-�X�ֶ#�`�G�k�y��n�Ֆ�� ���n ��<�UƋ�@t�7����tp����X�'BV"+��h�TBP�RPb�����xȀC,���5p�����*��oƍ[9�F�ԁ�Ծ��f)&0痚�n۪n�fD��H3��)3�'h���&�ۂEP����g$Ve�q����qWIY�uI��$���]���F�½����c�"F���	VRc,oN� ��5H�0)a~z�&�w���E��^M�"���D�g��۲UJ�L�鏣ށ�ރ�:��-���=�70�1��e-%:��e~	lrUA��.��_��x����h��v��+�w[Ӄǚ{ؙcO���P�_�WҚ6�hX{QP��]N�o�y���Vy���=�h*���bO!�����d\
%�*e)T��,��|}%�fI��1P#�      �   �   x�}�MN�0���)|��Mۥe,j)$!?;6�=��%� ���a���@H�z��͛�EJ� qU�B�J�H�ѽZ<�ata����gX��(�	�2bK�8
��t�D��Z]+]�J����<���O���vFw�zF�T��OXT+�(SH��Ǯx(������Xaqa��b�P���7�@Y?w�1m�uq���Kd���v'����=�6�+Gl���Lu=�O;�B	ذ��&I��yi�      �   8   x�3�J-�,�<�9�ˈ�1�$�,�˘�-3/1'�*1%�˄�%5/5Č���� �&�      �   %   x�3�H�K�L�+I�2�tN�KN�ILI����� ��:      �       x�3�tL.�,K�2�tI-N�S�b���� x��      �   I   x�3�H�K�L�+I�2�JM�H�JLI�2��2�3o��2�t�S((�ON-��2���)M���)����� ��      �   /   x�3�t�,.���L�I�2��O.-HL��2�.-.H�K�rb���� �j      �   9   x�3�t�,.���L�I�2��O.-HL��2�.-.H�K�rL8�R�S��@1z\\\ �;\      �   8   x�3�t�S(�ON-��2�JM�ɬJL��2��3�2�LN�ļ���p� ���      �   &   x�3�tL.�,��2�tI-�HL���,IL������ �|�      �   '   x�3�t�,.���L�I�2�.-.H�K�L������ ��	Y      �   #   x�3�tL.�,K�2�t��K�ɬJL������ o��      �   o   x�e���0�o�� �.����*򩿏���$,|�� '�V�$d�R�e���2��&�ɂ$	�p%�o��BR�_�T�	pV�T ����=�R�Gkx��R�/N>3t      �   �   x���1�0��9>E/P�ω�8����R�j%���xBo��=$KpaX��!-�>-���n�-�.�v<�IE1���&�@���Ui4ҷG�Q��5����zkZ��4��P�������@f��6K:g��Bg&�߻:      �   �   x���;�@C��S����'3g@444A���D����!��pa�~v���i���6�6������m���n�cb4����$&%
'��ua8����3V,kdd!�%��B?̧i��Ç��j�q��("	p�����wW�Rk�X�H��oTD���j��Hm)�0�.z�/�K      �   �   x�5б�0�9|L�c��S�C����&x}:�;��2����X_����=��b���~.J2u�z�]Y��4h���Kr��N��#���i:|O�[7DA���6�m[jO��c����#"���{������%R
:G��5�7G��%�G�ɏ�����S       �   6   x�3�tv�u��2����MJ-ʩ�u�I,��2����q���2���vu����� !`      �     x�M�Kn�0D��)|��6x�$rD ��D�4"h��
����z��T�(tV7�"E��"m*��� ���B�@���]�!�7��p��e@�:
U�9Qe�_�E���y1�o���	�
����xEbp6?H��hF���`��&�Z=�xQixp�,{?M�=��=89.�G��90��
ٵ"����K��$��e�4=�|6)�9v&�yh2E�L�*�3 � 8º8������V���{ڎw�`��G�����/�q�?)�j�      �     x�]�MK�@���̇����cA=���[�j#����@cf6��3����4���B��~^3�����D��~��H��,�L�ӸDA����}�:/��e�<���p]��������i��^ݎ�n	
�ъ�Iɨ�fTYш�jTS��8�F��X8:�p,��cI
,���EᨪpT[၃S8�+%�8�h���ñ���(<r��n
���Q��&Q�SP8*82m�����K�R{8�����Y8�+%
G���
G%����#���Z8�������į7��l�K      �   <   x�3�4�4b##C]s]3.cNc��!��)X�Y��I�%�9X�\�Ј+F��� ��&      �   S   x�3�t�),��I-J-�2�t,�/*IL���r�9]R�J�3��L8}KR�2s����ť�E���\f�a�ř%@1z\\\ j.      �   J   x�˱� C��a�K��#�΅_��f���5�VS�:TZ�*�Z8�ܢk��%�G�����������      �   N  x�u�ɒ�H���S��[�H`�ZN�<�r�ޤ� ʠ�S/:���Ԯ�VGh�Cr����IMBR�NylG�f&��'|��럃�*S�,b.alPYc:�tSYg�HQFmb�&���R�a�H����+VHXU��RSi !L(�bȦ$����?��R�c����54Ҹ]�ժ�O����R��ј�1ɼc8�yڮF��Q�L�y��T���a,#I}��Ǔ���PTj�.��0�>@͸��T��T��L�U�Ё
���3�ؘ)��+��P2&RK��I��:~t�CL{g����zǮ�L�>{�V�S�p����8�6�Qӭ^����y���B�=w� ԟ��PC�ީ��8h"�*}�s}�&3]�%	��I�Z\�>v~��.�(rm0
T�}A�^j�qMk�BW�,>ً}P�xr�:dw���8�����c��` B�;���J#��Bz��!�e D�?/����h�1�!TXE�|��D(��P.½��;��to-����6�e�G�Q�Ysy�k�N4��,�xhM���؟��U��tSV�iy�d���3b�B����Oi� �Z�07�����?�Q��)c1��D5�e�,7�v�]_�Zk;?��vP���o�v�k�kv&�}vu:gt�g��&��{3�W�����0�WjiA
�<��Xb:�b��z�uKE�s�)�x���(&���4���tМ��W�ظ�Q�N�2�G�S}�J�a��E�dc�F��i����2y�<N��d�t�$1UH7��(%	l5�o�Y,����%��f�����xb��^[��ij�p�Oۧє+�>�>�z��#���n�sW��xM���@E<BW��Z���JCq��R&�Q�����e���oU-S����Z�{�r@ċ��O�븪Yeq�;��=G���Fs什iX������G�v6-��0�x��#"�*�;�ʀ������`��p~��6��irQ�*���U&c@�u�� e�I\%�K<W���(C��0�z��0�$o�������$ء�>X�Da�Zg���1�1a��	�,��7���G5P���Y�r��wO��i��a�R>^��)k�������hYxTp�����k��!��;�W��:¨a�Ŕ�U�Y�<2�E����(L��Z��X�Qd��}�㴊Q \��W0�xrh-?V��X�W�F�H�us�D����v}�R�!dy6�H���7�1�sN)ϓ�����Z
R9�r�e��:'8���wً�reA'�PI�2+�~�d���C�;-����B���W��w;?{m2��G2 ��m���ް�ѓ
i5���������- �'      �   /   x����0İ�4L�CR��%��Q��M�>�C��%�	9d{����      �   4   x�3��M�+I����L�+��2����-�L�J�2�t�,.)-J������� I?�      �   ,   x�3�t�IJ<�13�ˈ�'3� 3�*�˘�)?%5=�+F��� ��
�      �   '   x�3���)�M��2�H-��2�t�))-J����� ��^      �   0   x�3�tL����,.)JL�/�2�tN,N-I�22�t�OIMO����� h�      �   )   x�3�4���,)�/�2�42�����9�9}S��1z\\\ ��	}      �   �  x����r�0�u|
݂I $�T�Vl���N7"�|(��՝�}���۩�l�������|�"��(�NU����[qT�q-���R��,@�U���� �Y�Б���6���a��D��`uY�b8����1U��(�:��7��AT���`�4�d��;S�K;��ḯ7%�$��ި=��:��$q�oc0�l�҅����RV<��1=�B�"5��&��B� ��еm��)��P6c�2��}��8���{�k����^�X=ZC��q�vu�S<��F���י���xP�2�x��&1O�^P�"ȕ�Q�X$WC"��Ԍ�Q)2L�d>�&�!q���B�6��WsB��S�.Ĺ%�}�6/���B�)�NV��^ؔ?���q�'���Yx��C��Nͽ�H�5
��(f�2�	(��JMCoP+Թ����Q*6���d5$C6,��_P��~{��s�:�k����\�8��dB��^�'4���7�2�-`�����E�/re^x�0/�2�S�g��?��j��w��J$ʅ\6���8;��.3c��iR*��.���uH��~��D�K��MT90W��I,��-O}���|��a����k�o�S1�iT9�]o��
��b]�Cw��ͳd�hn?�V�s�@�z�Z��A�>�      �   �   x�}�An�0E��s"�`�.ʦRWl�ম�-9��z�^�〜
�%��c{f*&/8�E�#�W�Խ��0C�+�tz3�j�&��~w��>�q���*� \�(��5(�F�@���l�Wk�fs7����k�ʓ��W���ce�WnQߢ&�f�ڈĮ1Ed��a��+�J0q��	V7�k�Χ��Z����ۧ�&��0�C��o��'��,��D�n��c)���aP�;eY�pܭ�      �   �   x�U��
�0Dϛ��T�4��**
"��KJ�J"�ƃ_oK�a�7�p��-��Ы�%��&���Y6�=���3�����y��'�s3B� ��,�Y*��(�o��_��*M���(}%,Qo*/��yD��'U��N^����=6%;'����T��R��%5      