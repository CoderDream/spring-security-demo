--用户表
create table T_USERS
(
  d_username              VARCHAR2(50) not null,
  d_password              VARCHAR2(60) not null,
  d_enabled               NUMBER(1) default 1 not null,
  d_accountnonexpired     NUMBER(1) default 1 not null,
  d_accountnonlocked      NUMBER(1) default 1 not null,
  d_credentialsnonexpired NUMBER(1) default 1 not null
);
alter table T_USERS
  add constraint PK_USERS_USERNAME primary key (D_USERNAME) ;
  
  
--错误登录尝试次数
create table T_USER_ATTEMPTS
(
  d_username     VARCHAR2(50) not null,
  d_attempts     NUMBER(10),
  d_lastmodified DATE
);

alter table T_USER_ATTEMPTS
  add constraint PK_T_USER_ATTEMPTS primary key (D_USERNAME);
  
--用户角色权限 
create table T_USER_ROLES
(
  d_user_role_id NUMBER(10) not null,
  d_username     VARCHAR2(50),
  d_role         VARCHAR2(50)
);

alter table T_USER_ROLES
  add constraint PK_USER_ROLES primary key (D_USER_ROLE_ID);
alter table T_USER_ROLES
  add constraint IDX_UNI_ROLE_USERNAME unique (D_USERNAME, D_ROLE);  

--Remember Me持久化保存记录
create table PERSISTENT_LOGINS
(
  username  VARCHAR2(64) not null,
  series   VARCHAR2(64) not null,
  token     VARCHAR2(64) not null,
  last_used DATE not null
);

alter table PERSISTENT_LOGINS
  add constraint PK_PERSISTENT_LOGIN primary key (series);
  
--初始化数据
insert into T_USERS (D_USERNAME, D_PASSWORD, D_ENABLED, D_ACCOUNTNONEXPIRED, D_ACCOUNTNONLOCKED, D_CREDENTIALSNONEXPIRED)
values ('YJMYZZ', '$2a$10$OCOuRV0Wy7ncCND4LcKfMunVEWOzMOyyU95u5TkTRmJqYbsJNecEK', 1, 1, 1, 1);--密码：123456

insert into T_USERS (D_USERNAME, D_PASSWORD, D_ENABLED, D_ACCOUNTNONEXPIRED, D_ACCOUNTNONLOCKED, D_CREDENTIALSNONEXPIRED)
values ('MIKE', '$2a$10$kTmT6BQQE5LyRZ00Qas77.F5kxK0GxsW402ExosQswxmG.eBdgIZW', 1, 1, 1, 1);--密码MIKE123

insert into T_USER_ROLES (D_USER_ROLE_ID, D_USERNAME, D_ROLE)
values (1, 'MIKE', 'POWER');

insert into T_USER_ROLES (D_USER_ROLE_ID, D_USERNAME, D_ROLE)
values (2, 'YJMYZZ', 'ADMIN');

insert into T_USER_ROLES (D_USER_ROLE_ID, D_USERNAME, D_ROLE)
values (3, 'YJMYZZ', 'POWER');

