/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2017/10/12 10:21:59                          */
/*==============================================================*/


drop table if exists ex_client;

drop table if exists ex_client_data;

drop table if exists ex_clinet_list;

drop table if exists ex_config;

drop table if exists ex_list;

/*==============================================================*/
/* Table: ex_client                                             */
/*==============================================================*/
create table ex_client
(
   id                   int not null auto_increment comment '����ID',
   type                 tinyint(1) default 0 comment '��Դ:0�����ע��1�ͻ����Լ�ע��',
   ip                   varchar(50) comment '�ͻ���IP��ַ',
   state                tinyint(1) default 1 comment '�ÿͻ���״̬0��ֹ1����',
   email                varchar(100) comment '֪ͨ����',
   phone                varchar(100) comment '֪ͨ�ֻ���',
   remarks              varchar(225) comment 'ע��',
   create_time          datetime default CURRENT_TIMESTAMP comment '����ʱ��',
   update_time          datetime default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '�޸�ʱ��',
   is_enabled           tinyint(1) default 1 comment '�Ƿ����',
   primary key (id)
);

alter table ex_client comment '�쳣�ͻ���';

/*==============================================================*/
/* Table: ex_client_data                                        */
/*==============================================================*/
create table ex_client_data
(
   id                   bigint not null auto_increment,
   client_id            int comment '�ͻ���ID',
   parameters           text comment '�����������json',
   ex_class             varchar(255) comment '�����쳣��',
   ex_time              timestamp comment '�쳣����ʱ��',
   msg                  text comment '������Ϣ',
   type                 varchar(10) comment '����ʽGET����POST',
   content_type         varchar(25) comment '�����ʽ',
   create_time          datetime default CURRENT_TIMESTAMP comment '����ʱ��',
   update_time          datetime default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '�޸�ʱ��',
   is_enabled           tinyint(1) default 1 comment '�Ƿ����',
   primary key (id)
);

alter table ex_client_data comment '�쳣��������';

/*==============================================================*/
/* Table: ex_clinet_list                                        */
/*==============================================================*/
create table ex_clinet_list
(
   id                   int not null auto_increment,
   client_id            int not null comment '�ͻ���ID',
   list_id              int comment '�쳣ID',
   create_time          datetime default CURRENT_TIMESTAMP comment '����ʱ��',
   update_time          datetime default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '�޸�ʱ��',
   is_enabled           tinyint(1) default 1 comment '�Ƿ����',
   primary key (id)
);

alter table ex_clinet_list comment '������Ӧ���쳣����';

/*==============================================================*/
/* Table: ex_config                                             */
/*==============================================================*/
create table ex_config
(
   id                   int not null auto_increment,
   name                 varchar(50) comment '����',
   value                varchar(500) comment 'ֵ',
   description          text comment '��ע',
   create_time          datetime default CURRENT_TIMESTAMP comment '����ʱ��',
   update_time          datetime default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '�޸�ʱ��',
   is_enabled           tinyint(1) default 1 comment '�Ƿ����',
   primary key (id)
);

alter table ex_config comment '�����ֵ��';

/*==============================================================*/
/* Table: ex_list                                               */
/*==============================================================*/
create table ex_list
(
   id                   int not null auto_increment,
   name                 varchar(60) not null comment '�쳣����',
   nick_name            varchar(50) comment '������',
   type                 tinyint(1) default 0 comment '0��ϵͳĬ���쳣1�Զ����쳣',
   remarks              varchar(255) comment '�쳣˵��',
   create_time          datetime default CURRENT_TIMESTAMP comment '����ʱ��',
   update_time          datetime default CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP comment '�޸�ʱ��',
   is_enabled           tinyint(1) default 1 comment '�Ƿ����',
   primary key (id)
);

alter table ex_list comment '�쳣����';

