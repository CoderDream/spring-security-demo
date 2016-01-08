create table T_USERS
(
  d_username VARCHAR2(50) not null,
  d_password VARCHAR2(60),
  d_enabled  NUMBER(1)
);
alter table T_USERS
  add constraint PK_USERS_USERNAME primary key (D_USERNAME) ;
  
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

  
insert into T_USERS (D_USERNAME, D_PASSWORD, D_ENABLED)
values ('YJMYZZ', '123456', 1);

insert into T_USERS (D_USERNAME, D_PASSWORD, D_ENABLED)
values ('MIKE', 'MIKE123', 1); 

insert into T_USER_ROLES (D_USER_ROLE_ID, D_USERNAME, D_ROLE)
values (1, 'MIKE', 'POWER');

insert into T_USER_ROLES (D_USER_ROLE_ID, D_USERNAME, D_ROLE)
values (2, 'YJMYZZ', 'ADMIN');

insert into T_USER_ROLES (D_USER_ROLE_ID, D_USERNAME, D_ROLE)
values (3, 'YJMYZZ', 'POWER');