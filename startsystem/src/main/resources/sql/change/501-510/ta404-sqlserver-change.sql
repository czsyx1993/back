-- 2019-09-29
/*==============================================================*/
/* 通知管理-表                                                  */
/*==============================================================*/
create table TAMSGNOTICE
(
    MID             VARCHAR(36)    not null,
    SENDERID        VARCHAR(36)    not null,
    SENDERNAME      VARCHAR(450)   not null,
    SENDDATE  		datetime       not null,
    TITLE           VARCHAR(200)   not null,
    CONTENT         NTEXT          not null,
    TYPE            VARCHAR(10)     not null,
    MENUUURL        VARCHAR(200)       null,
    OTHERDATA       VARCHAR(500)       null,
    constraint PK_NOTICE primary key nonclustered (MID)
);

create table TAMSGNOTICESTATE
(
    MID             VARCHAR(36)    not null,
    RECEIVERID      VARCHAR(36)    not null,
    READSIGN        VARCHAR(1)     not null
);

create table TAMSGNOTICEANNEX
(
    MID             VARCHAR(36)    	   null,
	ANNEXID         VARCHAR(36)    not null,
    ANNEXNAME       VARCHAR(100)   not null,
    ANNEX           varbinary(max)     null,
	constraint PK_ANNEX primary key nonclustered (ANNEXID)
);

create table TAMSGCHAT
(
	CHATID			VARCHAR(36)    not null,
	OWNER 			ARCHAR(36)     not null,
	TWOUSERID       VARCHAR(36)    not null,
    TWONAME         VARCHAR(100)   not null,
	constraint PK_CHAT primary key nonclustered (CHATID,OWNER)
);

create table TAMSGLETTER
(
	MID             VARCHAR(36)    not null,
	CHATID			VARCHAR(36)    not null,
	SENDERID        VARCHAR(36)    not null,
    SENDERNAME      VARCHAR(100)   not null,
    SENDDATE  		datetime       not null,
	RECEIVERID      VARCHAR(36)    not null,
    CONTENT         VARCHAR(450)   not null,
    TYPE            VARCHAR(2)     not null,
	READSIGN        VARCHAR(1)     not null,
	constraint PK_LETTER primary key nonclustered (MID)
);

-- 2019-09-25
update taresource set workbench='0' where resourceid='5b658a734b39420c965f1bc68832c4fa';
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('d81d6ee5ec684fd8a32935ceb03d1cf7', '5b658a734b39420c965f1bc68832c4fa', '用户', NULL, 'sysmg', 'user', 0, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/7b7f9cd1675a4b54b05c7c7cf0a7ac63/5b658a734b39420c965f1bc68832c4fa/d81d6ee5ec684fd8a32935ceb03d1cf7', '银海软件/管理系统/工作台模块/工作台组件/用户', '4', '', '', '1', 0, '0', '1', NULL, NULL, GETDATE(), '1', '0', NULL, null, null, null, null, null, null, null, null, null, '1', null);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('86d9f05789894b8fae5fb431c6e14168', '5b658a734b39420c965f1bc68832c4fa', '分析', NULL, 'sysmg', 'analysis', 10, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/7b7f9cd1675a4b54b05c7c7cf0a7ac63/5b658a734b39420c965f1bc68832c4fa/86d9f05789894b8fae5fb431c6e14168', '银海软件/管理系统/工作台模块/工作台组件/分析', '4', '', '', '1', 0, '0', '1', NULL, NULL, GETDATE(), '1', '0', NULL, null, null, null, null, null, null, null, null, null, '1', null);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('ccbf8db88cc548eba4dfbb920c74feec', '5b658a734b39420c965f1bc68832c4fa', '监控', NULL, 'sysmg', 'monitor', 20, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/7b7f9cd1675a4b54b05c7c7cf0a7ac63/5b658a734b39420c965f1bc68832c4fa/ccbf8db88cc548eba4dfbb920c74feec', '银海软件/管理系统/工作台模块/工作台组件/监控', '4', '', '', '1', 0, '0', '1', NULL, NULL, GETDATE(), '1', '0', NULL, null, null, null, null, null, null, null, null, null, '1', null);

-- 2019-09-23
alter table taloginhistorylog add hashverity varchar(200);
comment on column taloginhistorylog.hashverity is 'hash 校验';
alter table taonlinelog add hashverity varchar(200);
comment on column taonlinelog.hashverity is 'hash 校验';
alter table taorgoplog add sessionid varchar(200);
comment on column taorgoplog.sessionid is 'sessionid';
alter table taorgoplog add hashverity varchar(200);
comment on column taorgoplog.hashverity is 'hash 校验';
alter table taserverexceptionlog add userid varchar(36);
comment on column taserverexceptionlog.userid is '用户id';
alter table taserverexceptionlog add hashverity varchar(200);
comment on column taserverexceptionlog.hashverity is 'hash 校验';
alter table taaccessdenylog add menuid varchar(36);
comment on column taaccessdenylog.menuid is '菜单id';
alter table taloginstatlog add hashverity varchar(200);
comment on column taloginstatlog.hashverity is 'hash 校验';
alter table taonlinestatlog add hashverity varchar(200);
comment on column taonlinestatlog.hashverity is 'hash 校验';


alter table TAEXTENDSETTING add PROTECTPRIVACYRULE varchar(20);
comment on column TAEXTENDSETTING.PROTECTPRIVACYRULE is '隐私保护规则';

-- 2019-09-18
/*==============================================================*/
/* Table: taloginfaillog 登录失败日志表                           */
/*==============================================================*/

create table taloginfaillog
(
  logid            varchar(36) not null,
  loginid          varchar(36),
  failpassword     varchar(50),
  failreason       varchar(200),
  logintime        datetime,
  clientip         varchar(200),
  serverip         varchar(200),
  clientsystem     varchar(50),
  clientbrowser    varchar(50),
  clientscreensize varchar(50),
  hashverity       varchar(200),
  syspath          varchar(50),
  constraint pk_taloginfaillog primary key nonclustered (logid)
);

    go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '登录失败日志表', 'user', @CurrentUser, 'TABLE', 'taloginfaillog'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '日志ID', 'user', @CurrentUser, 'TABLE', 'taloginfaillog', 'COLUMN', 'logid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '登录id', 'user', @CurrentUser, 'TABLE', 'taloginfaillog', 'COLUMN', 'loginid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '密码', 'user', @CurrentUser, 'TABLE', 'taloginfaillog', 'COLUMN', 'failpassword'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '登录失败原因', 'user', @CurrentUser, 'TABLE', 'taloginfaillog', 'COLUMN', 'failreason'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '登录时间', 'user', @CurrentUser, 'TABLE', 'taloginfaillog', 'COLUMN', 'logintime'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '客户端IP', 'user', @CurrentUser, 'TABLE', 'taloginfaillog', 'COLUMN', 'clientip'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '服务端IP', 'user', @CurrentUser, 'TABLE', 'taloginfaillog', 'COLUMN', 'serverip'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '客户端系统', 'user', @CurrentUser, 'TABLE', 'taloginfaillog', 'COLUMN', 'clientsystem'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '客户端浏览器', 'user', @CurrentUser, 'TABLE', 'taloginfaillog', 'COLUMN', 'clientbrowser'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '客户端分辨率', 'user', @CurrentUser, 'TABLE', 'taloginfaillog', 'COLUMN', 'clientscreensize'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 'hash验证', 'user', @CurrentUser, 'TABLE', 'taloginfaillog', 'COLUMN', 'hashverity'
go


declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '系统路径', 'user', @CurrentUser, 'TABLE', 'taloginfaillog', 'COLUMN', 'syspath'
go

/*==============================================================*/
/* Table: taaccessdenylog 访问限制日志表                          */
/*==============================================================*/
create table taaccessdenylog
(
  logid            varchar(36) not null,
  url              varchar(200),
  userid           varchar(36),
  accesstime       datetime,
  clientip         varchar(200),
  serverip         varchar(50),
  clientsystem     varchar(50),
  clientbrowser    varchar(50),
  accessdenytype   varchar(2),
  clientscreensize varchar(50),
  hashverity       varchar(200),
  constraint pk_taaccessdenylog primary key nonclustered (logid)
);

    go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '访问限制日志表', 'user', @CurrentUser, 'TABLE', 'taaccessdenylog'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '日志ID', 'user', @CurrentUser, 'TABLE', 'taaccessdenylog', 'COLUMN', 'logid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '访问URL', 'user', @CurrentUser, 'TABLE', 'taaccessdenylog', 'COLUMN', 'url'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '用户ID', 'user', @CurrentUser, 'TABLE', 'taaccessdenylog', 'COLUMN', 'userid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '访问时间', 'user', @CurrentUser, 'TABLE', 'taaccessdenylog', 'COLUMN', 'accesstime'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '客户端IP', 'user', @CurrentUser, 'TABLE', 'taaccessdenylog', 'COLUMN', 'clientip'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '服务端IP', 'user', @CurrentUser, 'TABLE', 'taaccessdenylog', 'COLUMN', 'serverip'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '客户端系统', 'user', @CurrentUser, 'TABLE', 'taaccessdenylog', 'COLUMN', 'clientsystem'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '客户端浏览器', 'user', @CurrentUser, 'TABLE', 'taaccessdenylog', 'COLUMN', 'clientbrowser'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '限制类型 01: 未登录(TOKEN 失效) 02：无权限 03：跨域', 'user', @CurrentUser, 'TABLE', 'taaccessdenylog', 'COLUMN', 'accessdenytype'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '客户端分辨率', 'user', @CurrentUser, 'TABLE', 'taaccessdenylog', 'COLUMN', 'clientscreensize'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 'hash 验证', 'user', @CurrentUser, 'TABLE', 'taaccessdenylog', 'COLUMN', 'hashverity'
go


-- 2019-09-17
/*==============================================================*/
/* Table: taaudit 审计记录表                                     */
/*==============================================================*/
create table taaudit
(
    auditid        varchar(36) not null,
    userid         varchar(36) not null,
    auditcontent   varchar(1024),
    auditdate      datetime,
    excelname      varchar(64),
    aliasexcelname varchar(64),
    audittype      varchar(1),
    storetype      varchar(1),
    hashverity      varchar(200),
    constraint pk_taaudit primary key nonclustered (auditid)
);

go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '审计记录表', 'user', @CurrentUser, 'TABLE', 'taaudit'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '审计ID', 'user', @CurrentUser, 'TABLE', 'taaudit', 'COLUMN', 'auditid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '用户ID', 'user', @CurrentUser, 'TABLE', 'taaudit', 'COLUMN', 'userid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '审计内容', 'user', @CurrentUser, 'TABLE', 'taaudit', 'COLUMN', 'auditcontent'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '审计时间', 'user', @CurrentUser, 'TABLE', 'taaudit', 'COLUMN', 'auditdate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '文件名', 'user', @CurrentUser, 'TABLE', 'taaudit', 'COLUMN', 'excelname'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '文件别名', 'user', @CurrentUser, 'TABLE', 'taaudit', 'COLUMN', 'aliasexcelname'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '1：登录日志 2：在线日志 3：异常日志 4：操作日志 5：审核日志', 'user', @CurrentUser, 'TABLE', 'taaudit', 'COLUMN', 'audittype'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '存储类型(1:服务器 2:本地 3:文件服务器）', 'user', @CurrentUser, 'TABLE', 'taaudit', 'COLUMN', 'storetype'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 'hash 验证', 'user', @CurrentUser, 'TABLE', 'taaudit', 'COLUMN', 'hashverity'
go

-- 2019-09-16 调整自定义资源 和组织
ALTER TABLE taorg
    MODIFY orgname varchar(200);

ALTER TABLE TARESOURCECATEGORY
    MODIFY CATEGORYCONTENT varchar(255);

ALTER TABLE TACUSTOMRESOURCE
    MODIFY RESOURCECONTENT varchar(255);

-- 2019-09-10
-- 由于字段类型不能直接转换成CLOB类型，所以需要先DROP字段然后ADD字段
-- 为了change文件统一，则均先DROP字段然后ADD字段
ALTER TABLE TAROLEWORKBENCH DROP COLUMN WORKBENCHJSON NTEXT;
ALTER TABLE TAROLEWORKBENCH ADD WORKBENCHJSON NTEXT;
ALTER TABLE TAUSERWORKBENCH DROP COLUMN WORKBENCHJSON NTEXT;
ALTER TABLE TAUSERWORKBENCH ADD WORKBENCHJSON NTEXT;
ALTER TABLE TAUSERWORKBENCH ADD LASTCHOOSEWORKBENCH NTEXT;

UPDATE taresource SET workbench = '0';

DELETE FROM taresource WHERE resourceid = '84e388e319d44de585b94b039eec0092';
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('7b7f9cd1675a4b54b05c7c7cf0a7ac63', '0415d44401b24605a21b589b6aaa349e', '工作台模块', NULL, 'sysmg', NULL, 51, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/7b7f9cd1675a4b54b05c7c7cf0a7ac63', '银海软件/管理系统/工作台模块', '2', '', '', '2', 0, '0', '1', NULL, NULL, GETDATE(), '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('b93e89515da24041b9f1459f77de38fe', '7b7f9cd1675a4b54b05c7c7cf0a7ac63', '工作台', NULL, 'sysmg', 'workTablePage.html#/page', 0, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/7b7f9cd1675a4b54b05c7c7cf0a7ac63/b93e89515da24041b9f1459f77de38fe', '银海软件/管理系统/工作台模块/工作台', '3', '', '', '2', 0, '0', '1', '1', NULL, GETDATE(), '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('60554e93387146bb9c7357907ba093fa', '7b7f9cd1675a4b54b05c7c7cf0a7ac63', '工作台组件管理', NULL, 'sysmg', 'workTablePage.html#/componentsMg', 10, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/7b7f9cd1675a4b54b05c7c7cf0a7ac63/60554e93387146bb9c7357907ba093fa', '银海软件/管理系统/工作台模块/工作台组件管理', '3', '', '', '2', 0, '1', '1', NULL, NULL, GETDATE(), '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('0aac95c1e73947bea41be639cc4e9036', '7b7f9cd1675a4b54b05c7c7cf0a7ac63', '工作台角色模板管理', NULL, 'sysmg', 'workTablePage.html#/roleTemplateMg', 20, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/7b7f9cd1675a4b54b05c7c7cf0a7ac63/0aac95c1e73947bea41be639cc4e9036', '银海软件/管理系统/工作台模块/工作台角色模板管理', '3', '', '', '2', 0, '1', '1', NULL, NULL, GETDATE(), '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('5b658a734b39420c965f1bc68832c4fa', '7b7f9cd1675a4b54b05c7c7cf0a7ac63', '工作台组件', NULL, 'sysmg', NULL, 30, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/7b7f9cd1675a4b54b05c7c7cf0a7ac63/5b658a734b39420c965f1bc68832c4fa', '银海软件/管理系统/工作台模块/工作台组件', '3', '', '', '2', 0, '0', '1', NULL, NULL, GETDATE(), '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL);

DELETE FROM taresourceurl where urlid = '2107bfbf62254633887b7a8d8a59addf';
INSERT INTO taresourceurl(resourceid, resturl, urlname, authoritypolicy, urlid) VALUES ('60554e93387146bb9c7357907ba093fa', 'org/sysmg/WorkbenchManageRestService/**', '所有', '0', 'fc810d0f2c9745da8ea370175ab3947a');

-- 2019-09-09
ALTER TABLE tasysconfig ADD configcomment varchar(2000);
declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '备注', 'user', @CurrentUser, 'TABLE', 'tasysconfig', 'COLUMN', 'configcomment'
go
ALTER TABLE tasysconfig ADD createtime datetime;
declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '创建时间', 'user', @CurrentUser, 'TABLE', 'tasysconfig', 'COLUMN', 'createtime'
go
ALTER TABLE tasysconfig ADD updatetime datetime;
declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '更新时间', 'user', @CurrentUser, 'TABLE', 'tasysconfig', 'COLUMN', 'updatetime'
go
ALTER TABLE tasysconfig ADD opuserid varchar(36);
declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '操作者人员id', 'user', @CurrentUser, 'TABLE', 'tasysconfig', 'COLUMN', 'opuserid'
go
ALTER TABLE tasysconfig ADD opusername varchar(36);
declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '操作人人员姓名', 'user', @CurrentUser, 'TABLE', 'tasysconfig', 'COLUMN', 'opusername'
go

-- 修改字段长度
ALTER TABLE tasysconfig ALTER COLUMN defaultvalue TYPE varchar(800) USING defaultvalue::varchar(800);

ALTER TABLE tadict ALTER COLUMN value TYPE varchar(50) USING value::varchar(50);
ALTER TABLE tadict ALTER COLUMN parentvalue TYPE varchar(50) USING value::varchar(50);


/*==============================================================*/
/* Table: taexamine 审核表                                       */
/*==============================================================*/

create table taexamine
(
  id             varchar(36) not null,
  opuserid       varchar(50),
  checkstatus    varchar(1)  not null,
  checkmsg       varchar(200),
  createtime     datetime   not null,
  updatetime     datetime,
  opname         varchar(50),
  opusername     varchar(50),
  checkerid      varchar(36),
  checkername    varchar(36),
  checkeropinion varchar(200),
  opobjecttype   varchar(36),
  constraint pk_taexamine primary key nonclustered (ID)
);

    go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '审核表', 'user', @CurrentUser, 'TABLE', 'taexamine'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '主键id', 'user', @CurrentUser, 'TABLE', 'taexamine', 'COLUMN', 'id'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '操作人id', 'user', @CurrentUser, 'TABLE', 'taexamine', 'COLUMN', 'opuserid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '是否审核（0：未审核，1：已审核, 2: 拒审核)', 'user', @CurrentUser, 'TABLE', 'taexamine', 'COLUMN', 'defaultvalue'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '审核信息', 'user', @CurrentUser, 'TABLE', 'taexamine', 'COLUMN', 'checkmsg'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '创建时间', 'user', @CurrentUser, 'TABLE', 'taexamine', 'COLUMN', 'createtime'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '更新时间', 'user', @CurrentUser, 'TABLE', 'taexamine', 'COLUMN', 'updatetime'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '操作类型', 'user', @CurrentUser, 'TABLE', 'taexamine', 'COLUMN', 'opname'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '操作人姓名', 'user', @CurrentUser, 'TABLE', 'taexamine', 'COLUMN', 'opusername'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '审核人', 'user', @CurrentUser, 'TABLE', 'taexamine', 'COLUMN', 'checkerid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '审核人姓名', 'user', @CurrentUser, 'TABLE', 'taexamine', 'COLUMN', 'checkername'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '审核意见', 'user', @CurrentUser, 'TABLE', 'taexamine', 'COLUMN', 'checkeropinion'
go


declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '操作对象类型', 'user', @CurrentUser, 'TABLE', 'taexamine', 'COLUMN', 'opobjecttype'
go

/*==============================================================*/
/* Table: taexaminelocked 审核锁定表                              */
/*==============================================================*/
create table taexaminelocked
(
  id           varchar(36) not null,
  examineid    varchar(36),
  lockedtype   varchar(1),
  lockedkey    varchar(100),
  createtime   datetime,
  opobjecttype varchar(36),
  lockedmode   varchar(1),
    constraint pk_taexaminelocked primary key nonclustered (ID)
);

    go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '审核锁定表', 'user', @CurrentUser, 'TABLE', 'taexaminelocked'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '主键id', 'user', @CurrentUser, 'TABLE', 'taexaminelocked', 'COLUMN', 'id'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '主表id', 'user', @CurrentUser, 'TABLE', 'taexaminelocked', 'COLUMN', 'examineid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '0:主键锁定 1：自定义锁定', 'user', @CurrentUser, 'TABLE', 'taexaminelocked', 'COLUMN', 'lockedtype'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '被锁定key', 'user', @CurrentUser, 'TABLE', 'taexaminelocked', 'COLUMN', 'lockedkey'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '创建时间', 'user', @CurrentUser, 'TABLE', 'taexaminelocked', 'COLUMN', 'createtime'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '操作类型', 'user', @CurrentUser, 'TABLE', 'taexaminelocked', 'COLUMN', 'opobjecttype'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '锁定方式', 'user', @CurrentUser, 'TABLE', 'taexaminelocked', 'COLUMN', 'lockedmode'
go

/*==============================================================*/
/* Table: taexamine 审核表子表                                   */
/*==============================================================*/
  create table taexaminechild
(
  id         varchar(36) not null,
  examineid  varchar(36),
  beforedata varbinary(max),
  afterdata  varbinary(max),
  dataclass  varchar(200),
  classname  varchar(200),
  methodname varchar(200),
  param      varbinary(max),
  constraint pk_taexaminechild primary key nonclustered (ID)
);

    go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '审核子表', 'user', @CurrentUser, 'TABLE', 'taexaminechild'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '主键id', 'user', @CurrentUser, 'TABLE', 'taexaminechild', 'COLUMN', 'id'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '主表id', 'user', @CurrentUser, 'TABLE', 'taexaminechild', 'COLUMN', 'examineid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '操作前数据（序列化存储）', 'user', @CurrentUser, 'TABLE', 'taexaminechild', 'COLUMN', 'beforedata'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '操作后数据（序列化存储）', 'user', @CurrentUser, 'TABLE', 'taexaminechild', 'COLUMN', 'afterdata'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '数据模板全限定类名(预留)', 'user', @CurrentUser, 'TABLE', 'taexaminechild', 'COLUMN', 'dataclass'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '全限定类名', 'user', @CurrentUser, 'TABLE', 'taexaminechild', 'COLUMN', 'classname'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '方法名', 'user', @CurrentUser, 'TABLE', 'taexaminechild', 'COLUMN', 'methodname'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '方法参数（序列化存储）', 'user', @CurrentUser, 'TABLE', 'taexaminechild', 'COLUMN', 'param'
go

-- 2019.09.09
CREATE VIEW V_RESOURCECATEGORY(CATEGORYID, CATEGORYNAME, EFFECTIVE, CODE, CATEGORYCONTENT) AS
    SELECT '1' AS CATEGORYID, '组织机构', '1' AS EFFECTIVE, 'org_code' AS CODE, '' AS CATEGORYCONTENT FROM TAORG WHERE DESTORY = '0'
    UNION SELECT CATEGORYID, CATEGORYNAME, EFFECTIVE, CODE, CATEGORYCONTENT FROM TARESOURCECATEGORY;

CREATE VIEW V_CUSTOMRESOURCE(CUSTOMRESOURCEID, RESOURCENAME, PARENTID, CODE, RESOURCECONTENT, RESOURCECATEGORY, EFFECTIVE, ADDTIME, MODIFYTIME, SYSTEM) AS
    SELECT CUSTOMRESOURCEID, RESOURCENAME, PARENTID, CODE, RESOURCECONTENT, RESOURCECATEGORY, EFFECTIVE, ADDTIME, MODIFYTIME, SYSTEM FROM TACUSTOMRESOURCE
    UNION
    SELECT ORGID AS CUSTOMERESOURCEID, ORGNAME AS RESOURCENAME, PARENTID, CUSTOMNO AS CODE, AREA AS RESOURCECONTENT, '1' AS RESOURCECATEGORY , EFFECTIVE, CREATETIME AS ADDTIME, NULL AS MODIFYTIME, 'E55B9B7046434D66BC11B94D553FADA2' AS SYSTEM FROM TAORG
    WHERE DESTORY = '0' AND PARENTID != '0'
    UNION
    SELECT ORGID AS CUSTOMERESOURCEID, ORGNAME AS RESOURCENAME, '1' AS PARENTID, CUSTOMNO AS CODE, AREA AS RESOURCECONTENT, '1' AS RESOURCECATEGORY , EFFECTIVE, CREATETIME AS ADDTIME, NULL AS MODIFYTIME, 'E55B9B7046434D66BC11B94D553FADA2' AS SYSTEM FROM TAORG
    WHERE DESTORY = '0' AND PARENTID = '0';

-- 2019-05-28
create table tadynamicrest
(
    id VARCHAR(36) not null
        constraint tadynamicrest_pk
            primary key nonclustered,
    sql VARCHAR(2048) not null,
    dsname VARCHAR(128) not null,
    restid VARCHAR(255) not null,
    restname VARCHAR(128) not null,
    effective VARCHAR(1) not null,
    createtime datetime not null,
    createuser VARCHAR(36) not null
)
    go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '动态服务表', 'user', @CurrentUser, 'TABLE', 'tadynamicrest'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '唯一标识', 'user', @CurrentUser, 'TABLE', 'tadynamicrest', 'COLUMN', 'id'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 'sql', 'user', @CurrentUser, 'TABLE', 'tadynamicrest', 'COLUMN', 'sql'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '数据源名称', 'user', @CurrentUser, 'TABLE', 'tadynamicrest', 'COLUMN', 'dsname'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '服务ID', 'user', @CurrentUser, 'TABLE', 'tadynamicrest', 'COLUMN', 'restid'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '服务名称', 'user', @CurrentUser, 'TABLE', 'tadynamicrest', 'COLUMN', 'restname'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '有效标识', 'user', @CurrentUser, 'TABLE', 'tadynamicrest', 'COLUMN', 'effective'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '创建时间', 'user', @CurrentUser, 'TABLE', 'tadynamicrest', 'COLUMN', 'createtime'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '创建账户', 'user', @CurrentUser, 'TABLE', 'tadynamicrest', 'COLUMN', 'createuser'
go


-- 2019-05-06
alter table taresource
    add image varbinary;
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', '功能资源图片（端应用）', 'user', @CurrentUser, 'TABLE', 'TARESOURCE', 'COLUMN', 'image'
go
