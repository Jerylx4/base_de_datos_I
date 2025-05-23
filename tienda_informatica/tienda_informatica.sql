PGDMP      $                }            tienda_informatica    17.4    17.4     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    24735    tienda_informatica    DATABASE     x   CREATE DATABASE tienda_informatica WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'es-MX';
 "   DROP DATABASE tienda_informatica;
                     postgres    false                        2615    24736    tienda_informatica    SCHEMA     "   CREATE SCHEMA tienda_informatica;
     DROP SCHEMA tienda_informatica;
                     postgres    false            �            1259    24818 
   fabricante    TABLE     t   CREATE TABLE tienda_informatica.fabricante (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL
);
 *   DROP TABLE tienda_informatica.fabricante;
       tienda_informatica         heap r       postgres    false    5            �            1259    24817    fabricante_id_seq    SEQUENCE     �   CREATE SEQUENCE tienda_informatica.fabricante_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE tienda_informatica.fabricante_id_seq;
       tienda_informatica               postgres    false    5    218            �           0    0    fabricante_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE tienda_informatica.fabricante_id_seq OWNED BY tienda_informatica.fabricante.id;
          tienda_informatica               postgres    false    217            �            1259    24825    producto    TABLE     �   CREATE TABLE tienda_informatica.producto (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    precio double precision NOT NULL,
    id_fabricante integer NOT NULL
);
 (   DROP TABLE tienda_informatica.producto;
       tienda_informatica         heap r       postgres    false    5            �            1259    24824    producto_id_seq    SEQUENCE     �   CREATE SEQUENCE tienda_informatica.producto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE tienda_informatica.producto_id_seq;
       tienda_informatica               postgres    false    220    5            �           0    0    producto_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE tienda_informatica.producto_id_seq OWNED BY tienda_informatica.producto.id;
          tienda_informatica               postgres    false    219            \           2604    24821    fabricante id    DEFAULT     �   ALTER TABLE ONLY tienda_informatica.fabricante ALTER COLUMN id SET DEFAULT nextval('tienda_informatica.fabricante_id_seq'::regclass);
 H   ALTER TABLE tienda_informatica.fabricante ALTER COLUMN id DROP DEFAULT;
       tienda_informatica               postgres    false    218    217    218            ]           2604    24828    producto id    DEFAULT     �   ALTER TABLE ONLY tienda_informatica.producto ALTER COLUMN id SET DEFAULT nextval('tienda_informatica.producto_id_seq'::regclass);
 F   ALTER TABLE tienda_informatica.producto ALTER COLUMN id DROP DEFAULT;
       tienda_informatica               postgres    false    219    220    220            �          0    24818 
   fabricante 
   TABLE DATA                 tienda_informatica               postgres    false    218   �       �          0    24825    producto 
   TABLE DATA                 tienda_informatica               postgres    false    220   I                   0    0    fabricante_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('tienda_informatica.fabricante_id_seq', 1, false);
          tienda_informatica               postgres    false    217                       0    0    producto_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('tienda_informatica.producto_id_seq', 1, false);
          tienda_informatica               postgres    false    219            _           2606    24823    fabricante fabricante_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY tienda_informatica.fabricante
    ADD CONSTRAINT fabricante_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY tienda_informatica.fabricante DROP CONSTRAINT fabricante_pkey;
       tienda_informatica                 postgres    false    218            a           2606    24830    producto producto_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY tienda_informatica.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY tienda_informatica.producto DROP CONSTRAINT producto_pkey;
       tienda_informatica                 postgres    false    220            b           2606    24831 $   producto producto_id_fabricante_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY tienda_informatica.producto
    ADD CONSTRAINT producto_id_fabricante_fkey FOREIGN KEY (id_fabricante) REFERENCES tienda_informatica.fabricante(id);
 Z   ALTER TABLE ONLY tienda_informatica.producto DROP CONSTRAINT producto_id_fabricante_fkey;
       tienda_informatica               postgres    false    4703    218    220            �   �   x����
�@��W1;,�h%!%�EZ������8�t���B��v�q�Eל�i~f��W�$^ف��5�,W�<��EWH��=LnQƼY�ܰ׽���?jn��x��`'ZTjr�����.��A�k�X�V��ЀB��h�K�ւ�1ڑ(>V�m�$��`��0����      �   Y  x����j�@�{��%)��j��b�I�-�)ltS��nX7�y�,}��J���>�o��l�O��u�-xS��h�R�L��ݝ��.����A#��Ί�B:����6���,��9F��0m)Q]�D��R<���d‎���3��R	�m�B�n��N&�� ���?��<A��P�XB���L��c^�@\���c� ���j�b����#J�M9�+���`9M1��NX�F�\�|bI�~�ѭ�~϶�����ק'��W��Ԩ�%u�G�*�������K̙��T�R1,6Hy���5��z�O۷�[�Z��6晭����o̽�0|���     