PGDMP  ;                    }            gestion_empleados    17.4    17.4     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false                        1262    24612    gestion_empleados    DATABASE     w   CREATE DATABASE gestion_empleados WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'es-MX';
 !   DROP DATABASE gestion_empleados;
                     postgres    false                        2615    24613    gestion_empleados    SCHEMA     !   CREATE SCHEMA gestion_empleados;
    DROP SCHEMA gestion_empleados;
                     postgres    false            �            1259    24614    departamento    TABLE     �   CREATE TABLE gestion_empleados.departamento (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    presupuesto double precision NOT NULL,
    gastos double precision NOT NULL
);
 +   DROP TABLE gestion_empleados.departamento;
       gestion_empleados         heap r       postgres    false    6            �            1259    24617    departamento_id_seq    SEQUENCE     �   CREATE SEQUENCE gestion_empleados.departamento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE gestion_empleados.departamento_id_seq;
       gestion_empleados               postgres    false    218    6                       0    0    departamento_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE gestion_empleados.departamento_id_seq OWNED BY gestion_empleados.departamento.id;
          gestion_empleados               postgres    false    219            �            1259    24618    empleado    TABLE     
  CREATE TABLE gestion_empleados.empleado (
    id integer NOT NULL,
    nif character varying(9) NOT NULL,
    nombre character varying(100) NOT NULL,
    apellido1 character varying(100) NOT NULL,
    apellido2 character varying(100),
    id_departamento integer
);
 '   DROP TABLE gestion_empleados.empleado;
       gestion_empleados         heap r       postgres    false    6            �            1259    24621    empleado_id_seq    SEQUENCE     �   CREATE SEQUENCE gestion_empleados.empleado_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE gestion_empleados.empleado_id_seq;
       gestion_empleados               postgres    false    6    220                       0    0    empleado_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE gestion_empleados.empleado_id_seq OWNED BY gestion_empleados.empleado.id;
          gestion_empleados               postgres    false    221            ]           2604    24622    departamento id    DEFAULT     �   ALTER TABLE ONLY gestion_empleados.departamento ALTER COLUMN id SET DEFAULT nextval('gestion_empleados.departamento_id_seq'::regclass);
 I   ALTER TABLE gestion_empleados.departamento ALTER COLUMN id DROP DEFAULT;
       gestion_empleados               postgres    false    219    218            ^           2604    24623    empleado id    DEFAULT     �   ALTER TABLE ONLY gestion_empleados.empleado ALTER COLUMN id SET DEFAULT nextval('gestion_empleados.empleado_id_seq'::regclass);
 E   ALTER TABLE gestion_empleados.empleado ALTER COLUMN id DROP DEFAULT;
       gestion_empleados               postgres    false    221    220            �          0    24614    departamento 
   TABLE DATA                 gestion_empleados               postgres    false    218   v       �          0    24618    empleado 
   TABLE DATA                 gestion_empleados               postgres    false    220   g                  0    0    departamento_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('gestion_empleados.departamento_id_seq', 7, true);
          gestion_empleados               postgres    false    219                       0    0    empleado_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('gestion_empleados.empleado_id_seq', 13, true);
          gestion_empleados               postgres    false    221            `           2606    24625    departamento departamento_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY gestion_empleados.departamento
    ADD CONSTRAINT departamento_pkey PRIMARY KEY (id);
 S   ALTER TABLE ONLY gestion_empleados.departamento DROP CONSTRAINT departamento_pkey;
       gestion_empleados                 postgres    false    218            b           2606    24627    empleado empleado_nif_key 
   CONSTRAINT     ^   ALTER TABLE ONLY gestion_empleados.empleado
    ADD CONSTRAINT empleado_nif_key UNIQUE (nif);
 N   ALTER TABLE ONLY gestion_empleados.empleado DROP CONSTRAINT empleado_nif_key;
       gestion_empleados                 postgres    false    220            d           2606    24629    empleado empleado_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY gestion_empleados.empleado
    ADD CONSTRAINT empleado_pkey PRIMARY KEY (id);
 K   ALTER TABLE ONLY gestion_empleados.empleado DROP CONSTRAINT empleado_pkey;
       gestion_empleados                 postgres    false    220            e           2606    24630 &   empleado empleado_id_departamento_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY gestion_empleados.empleado
    ADD CONSTRAINT empleado_id_departamento_fkey FOREIGN KEY (id_departamento) REFERENCES gestion_empleados.departamento(id);
 [   ALTER TABLE ONLY gestion_empleados.empleado DROP CONSTRAINT empleado_id_departamento_fkey;
       gestion_empleados               postgres    false    4704    218    220            �   �   x����j�0�{�B��̌%Y�AOe-,0�Ѵ�'�`[�����&�`����?j���r��|��;�����JE�Y�(}�]$Xk%���=
=�4&� w�#l���y;u�.����d�����-�;hs������dUf4k6/8$(�G���dWo��d�_�~'e��VRM7��[gdfۧ#k����ǵ��-{ߞ�p��l�f�&+�FK��-�S���3      �   �  x���Kn�0E�^gN #�:r�q!���m'S1�h�@�3��K��ʏ��D�������bU��w`����ն��<�M�*�����.t3F?���<:5�Sm�OM�n�I�ˍ2��ߦ�����1FD@Z����J7LHk�[9�|8lԋO���h����6�A)���H֨V�P�VnC��ʀ�2b�V��1a��)�i�{�1ܴ֩@�3�?�s^PJ�,�9=��)�ݰw���� ��������
0K�~�x��������4�fDcA~�*E�<�y��c��&��c��~���r�X�=P|խt�2}:dN�E2
	�?#���;�w;��}�'��(K(p��;i�Zk\�N�.
X�ɄaA�`����z>*�i=��8%xzԾ���*甋q�������"Lf����<u��o���d�/��T��20������O��wq��9�Чv�     