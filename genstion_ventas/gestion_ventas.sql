PGDMP      +                }            gestion_ventas    17.4    17.4                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false                       1262    24864    gestion_ventas    DATABASE     t   CREATE DATABASE gestion_ventas WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'es-MX';
    DROP DATABASE gestion_ventas;
                     postgres    false                        2615    24896    gestion_ventas    SCHEMA        CREATE SCHEMA gestion_ventas;
    DROP SCHEMA gestion_ventas;
                     postgres    false            �            1259    24898    cliente    TABLE     �   CREATE TABLE gestion_ventas.cliente (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    apellido1 character varying(100) NOT NULL,
    apellido2 character varying(100),
    ciudad character varying(100),
    categoria integer
);
 #   DROP TABLE gestion_ventas.cliente;
       gestion_ventas         heap r       postgres    false    5            �            1259    24897    cliente_id_seq    SEQUENCE     �   CREATE SEQUENCE gestion_ventas.cliente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE gestion_ventas.cliente_id_seq;
       gestion_ventas               postgres    false    5    218            	           0    0    cliente_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE gestion_ventas.cliente_id_seq OWNED BY gestion_ventas.cliente.id;
          gestion_ventas               postgres    false    217            �            1259    24905 	   comercial    TABLE     �   CREATE TABLE gestion_ventas.comercial (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    apellido1 character varying(100) NOT NULL,
    apellido2 character varying(100),
    comision double precision
);
 %   DROP TABLE gestion_ventas.comercial;
       gestion_ventas         heap r       postgres    false    5            �            1259    24904    comercial_id_seq    SEQUENCE     �   CREATE SEQUENCE gestion_ventas.comercial_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE gestion_ventas.comercial_id_seq;
       gestion_ventas               postgres    false    5    220            
           0    0    comercial_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE gestion_ventas.comercial_id_seq OWNED BY gestion_ventas.comercial.id;
          gestion_ventas               postgres    false    219            �            1259    24912    pedido    TABLE     �   CREATE TABLE gestion_ventas.pedido (
    id integer NOT NULL,
    total double precision NOT NULL,
    fecha date,
    id_cliente integer NOT NULL,
    id_comercial integer NOT NULL
);
 "   DROP TABLE gestion_ventas.pedido;
       gestion_ventas         heap r       postgres    false    5            �            1259    24911    pedido_id_seq    SEQUENCE     �   CREATE SEQUENCE gestion_ventas.pedido_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE gestion_ventas.pedido_id_seq;
       gestion_ventas               postgres    false    5    222                       0    0    pedido_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE gestion_ventas.pedido_id_seq OWNED BY gestion_ventas.pedido.id;
          gestion_ventas               postgres    false    221            a           2604    24901 
   cliente id    DEFAULT     x   ALTER TABLE ONLY gestion_ventas.cliente ALTER COLUMN id SET DEFAULT nextval('gestion_ventas.cliente_id_seq'::regclass);
 A   ALTER TABLE gestion_ventas.cliente ALTER COLUMN id DROP DEFAULT;
       gestion_ventas               postgres    false    217    218    218            b           2604    24908    comercial id    DEFAULT     |   ALTER TABLE ONLY gestion_ventas.comercial ALTER COLUMN id SET DEFAULT nextval('gestion_ventas.comercial_id_seq'::regclass);
 C   ALTER TABLE gestion_ventas.comercial ALTER COLUMN id DROP DEFAULT;
       gestion_ventas               postgres    false    220    219    220            c           2604    24915 	   pedido id    DEFAULT     v   ALTER TABLE ONLY gestion_ventas.pedido ALTER COLUMN id SET DEFAULT nextval('gestion_ventas.pedido_id_seq'::regclass);
 @   ALTER TABLE gestion_ventas.pedido ALTER COLUMN id DROP DEFAULT;
       gestion_ventas               postgres    false    221    222    222            �          0    24898    cliente 
   TABLE DATA                 gestion_ventas               postgres    false    218   �                  0    24905 	   comercial 
   TABLE DATA                 gestion_ventas               postgres    false    220   +!                 0    24912    pedido 
   TABLE DATA                 gestion_ventas               postgres    false    222   W"                  0    0    cliente_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('gestion_ventas.cliente_id_seq', 10, true);
          gestion_ventas               postgres    false    217                       0    0    comercial_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('gestion_ventas.comercial_id_seq', 8, true);
          gestion_ventas               postgres    false    219                       0    0    pedido_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('gestion_ventas.pedido_id_seq', 16, true);
          gestion_ventas               postgres    false    221            e           2606    24903    cliente cliente_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY gestion_ventas.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY gestion_ventas.cliente DROP CONSTRAINT cliente_pkey;
       gestion_ventas                 postgres    false    218            g           2606    24910    comercial comercial_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY gestion_ventas.comercial
    ADD CONSTRAINT comercial_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY gestion_ventas.comercial DROP CONSTRAINT comercial_pkey;
       gestion_ventas                 postgres    false    220            i           2606    24917    pedido pedido_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY gestion_ventas.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY gestion_ventas.pedido DROP CONSTRAINT pedido_pkey;
       gestion_ventas                 postgres    false    222            j           2606    24918    pedido pedido_id_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY gestion_ventas.pedido
    ADD CONSTRAINT pedido_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES gestion_ventas.cliente(id);
 O   ALTER TABLE ONLY gestion_ventas.pedido DROP CONSTRAINT pedido_id_cliente_fkey;
       gestion_ventas               postgres    false    218    4709    222            k           2606    24923    pedido pedido_id_comercial_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY gestion_ventas.pedido
    ADD CONSTRAINT pedido_id_comercial_fkey FOREIGN KEY (id_comercial) REFERENCES gestion_ventas.comercial(id);
 Q   ALTER TABLE ONLY gestion_ventas.pedido DROP CONSTRAINT pedido_id_comercial_fkey;
       gestion_ventas               postgres    false    222    220    4711            �   `  x����n�0�w�� ����uB-�T�V	t�.�-��c#C"��a�ЉG���v�D�\oG����cϗ�4]��r�¶�?�����/rAV �0�����
A\E��,���=���J���$YO3ֳ���,�V�T�VN�̹��SQ�6�`u4��:��f��T��f `�ăe�@3�ی���<�ޙ�ܐ�Bi�hV$<�r�$!�.=�&s�e�9i���`���(�Cc;r:WގD}�:����j(����i{d��5��M��͉�1\����W��"Q+��C�2�q,��Jۤ�E0�[��Kk��g���N���~<A���P��)y�\�:��k��            x���Mn�0��9�w)�~�J�P�4�P��%��%�9N܆t�r�>;���]y��o<g�|�ٲl�]�j#�?�リ@��'�����5D�AJQ��W"F�EM��l7]��s֣�p�Q�I��NV��4&q:�O���×��e.�K�ї����^�C�|���'�4�..y��S���^�66�����B�?�j�F�p<r2`@��Z�����s!`�up���˦�e�������m�_�Ǆ�N<X�CC�Llq�ig'�S�7q#Oc         N  x���?k�0��|
mI@z�o:u�()4i�`l�5�qiL?�u�@��1���N��v�����Q�5������ؗ'���m݉E[K�w}y�⵩�K)�z_Z�Ռ��G�U��a)^��W[� )(��[CI�Q&̥�����y��'���)@�	|X'E��[���Q=V��bh͊�Y
�G�����a�`a���Nb�����j1V)�&���"?*������_.�|�b�8�/_��E�ע*|�l�c��u���pj����#��zj��o�� l:�\(C#7�r��7�I���υN�� _�:E�~�PU.ں����{3d     