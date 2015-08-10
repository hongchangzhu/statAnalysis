DROP TABLE IF EXISTS `t_region`;
CREATE TABLE `t_region` (
  `ID` varchar(45) NOT NULL,
  `PARENT_ID` varchar(45) default NULL,
  `NODE_NAME` varchar(120) NOT NULL,
  `V_NO` int(10) unsigned default NULL,
  `NODE_TYPE` varchar(8) default NULL,
  `SEQ_NO` int(10) unsigned default NULL,
  `NATIONAL_CODE` varchar(45) default NULL,
  `CODE_PATH` varchar(8) default NULL,
  `CODE_LEVEL` int(10) unsigned default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;


DROP TABLE IF EXISTS `t_term`;
CREATE TABLE `t_term` (
  `TERM_ID` varchar(45) NOT NULL,
  `TERM_NAME` varchar(120) default NULL,
  `REGOIN_ID` varchar(45) default NULL,
  `PROVINCE_ID` varchar(45) default NULL,
  `CITY_ID` varchar(45) default NULL,
  `SCHOOL_TYPE` varchar(20) default NULL,
  `VERSION_NO` int(10) unsigned default NULL,
  `XXJGBXLXM3` varchar(20) default NULL,
  PRIMARY KEY  (`TERM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;


DROP TABLE IF EXISTS `t_un_boot_strap_term`;
CREATE TABLE `t_un_boot_strap_term` (
  `TERM_ID` varchar(45) NOT NULL,
  `TERM_NAME` varchar(120) default NULL,
  `CHECK_DATE` datetime default NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;


DROP TABLE IF EXISTS `t_term_resource_relation_11`;
CREATE TABLE `t_term_resource_relation_11` (
  `RESOURCE_ID` varchar(45) default NULL COMMENT '资源id',
  `RESOURCE_NAME` varchar(120) default NULL COMMENT '资源名称',
  `TERM_ID` varchar(45) default NULL COMMENT '终端id',
  `TERM_NAME` varchar(120) default NULL COMMENT '终端名称--',
  `SUBJECT_ID` varchar(45) default NULL COMMENT '学科id',
  `CLASS_ID` varchar(45) default NULL COMMENT '年级id',
  `OPT_TYPE` varchar(8) default NULL COMMENT '操作类型，已接收、下载、点击、未开机',
  `REGOIN_ID` varchar(45) default NULL COMMENT '区划id--',
  `REGOIN_NAME` varchar(45) default NULL COMMENT '区划名称--',
  `OPT_TIME` datetime default NULL COMMENT '操作时间--以写入数据库时间为准',
  `OPT_COUNT` int(10) unsigned default NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

DROP TABLE IF EXISTS `t_term_resource_relation_12`;
CREATE TABLE `t_term_resource_relation_12` (
  `RESOURCE_ID` varchar(45) default NULL COMMENT '资源id',
  `RESOURCE_NAME` varchar(120) default NULL COMMENT '资源名称',
  `TERM_ID` varchar(45) default NULL COMMENT '终端id',
  `TERM_NAME` varchar(120) default NULL COMMENT '终端名称--',
  `SUBJECT_ID` varchar(45) default NULL COMMENT '学科id',
  `CLASS_ID` varchar(45) default NULL COMMENT '年级id',
  `OPT_TYPE` varchar(8) default NULL COMMENT '操作类型，已接收、下载、点击、未开机',
  `REGOIN_ID` varchar(45) default NULL COMMENT '区划id--',
  `REGOIN_NAME` varchar(45) default NULL COMMENT '区划名称--',
  `OPT_TIME` datetime default NULL COMMENT '操作时间--以写入数据库时间为准',
  `OPT_COUNT` int(10) unsigned default NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

DROP TABLE IF EXISTS `t_term_resource_relation_13`;
CREATE TABLE `t_term_resource_relation_13` (
  `RESOURCE_ID` varchar(45) default NULL COMMENT '资源id',
  `RESOURCE_NAME` varchar(120) default NULL COMMENT '资源名称',
  `TERM_ID` varchar(45) default NULL COMMENT '终端id',
  `TERM_NAME` varchar(120) default NULL COMMENT '终端名称--',
  `SUBJECT_ID` varchar(45) default NULL COMMENT '学科id',
  `CLASS_ID` varchar(45) default NULL COMMENT '年级id',
  `OPT_TYPE` varchar(8) default NULL COMMENT '操作类型，已接收、下载、点击、未开机',
  `REGOIN_ID` varchar(45) default NULL COMMENT '区划id--',
  `REGOIN_NAME` varchar(45) default NULL COMMENT '区划名称--',
  `OPT_TIME` datetime default NULL COMMENT '操作时间--以写入数据库时间为准',
  `OPT_COUNT` int(10) unsigned default NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;


DROP TABLE IF EXISTS `t_term_resource_relation_14`;
CREATE TABLE `t_term_resource_relation_14` (
  `RESOURCE_ID` varchar(45) default NULL COMMENT '资源id',
  `RESOURCE_NAME` varchar(120) default NULL COMMENT '资源名称',
  `TERM_ID` varchar(45) default NULL COMMENT '终端id',
  `TERM_NAME` varchar(120) default NULL COMMENT '终端名称--',
  `SUBJECT_ID` varchar(45) default NULL COMMENT '学科id',
  `CLASS_ID` varchar(45) default NULL COMMENT '年级id',
  `OPT_TYPE` varchar(8) default NULL COMMENT '操作类型，已接收、下载、点击、未开机',
  `REGOIN_ID` varchar(45) default NULL COMMENT '区划id--',
  `REGOIN_NAME` varchar(45) default NULL COMMENT '区划名称--',
  `OPT_TIME` datetime default NULL COMMENT '操作时间--以写入数据库时间为准',
  `OPT_COUNT` int(10) unsigned default NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;


DROP TABLE IF EXISTS `t_term_resource_relation_15`;
CREATE TABLE `t_term_resource_relation_15` (
  `RESOURCE_ID` varchar(45) default NULL COMMENT '资源id',
  `RESOURCE_NAME` varchar(120) default NULL COMMENT '资源名称',
  `TERM_ID` varchar(45) default NULL COMMENT '终端id',
  `TERM_NAME` varchar(120) default NULL COMMENT '终端名称--',
  `SUBJECT_ID` varchar(45) default NULL COMMENT '学科id',
  `CLASS_ID` varchar(45) default NULL COMMENT '年级id',
  `OPT_TYPE` varchar(8) default NULL COMMENT '操作类型，已接收、下载、点击、未开机',
  `REGOIN_ID` varchar(45) default NULL COMMENT '区划id--',
  `REGOIN_NAME` varchar(45) default NULL COMMENT '区划名称--',
  `OPT_TIME` datetime default NULL COMMENT '操作时间--以写入数据库时间为准',
  `OPT_COUNT` int(10) unsigned default NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;


DROP TABLE IF EXISTS `t_term_resource_relation_21`;
CREATE TABLE `t_term_resource_relation_21` (
  `RESOURCE_ID` varchar(45) default NULL COMMENT '资源id',
  `RESOURCE_NAME` varchar(120) default NULL COMMENT '资源名称',
  `TERM_ID` varchar(45) default NULL COMMENT '终端id',
  `TERM_NAME` varchar(120) default NULL COMMENT '终端名称--',
  `SUBJECT_ID` varchar(45) default NULL COMMENT '学科id',
  `CLASS_ID` varchar(45) default NULL COMMENT '年级id',
  `OPT_TYPE` varchar(8) default NULL COMMENT '操作类型，已接收、下载、点击、未开机',
  `REGOIN_ID` varchar(45) default NULL COMMENT '区划id--',
  `REGOIN_NAME` varchar(45) default NULL COMMENT '区划名称--',
  `OPT_TIME` datetime default NULL COMMENT '操作时间--以写入数据库时间为准',
  `OPT_COUNT` int(10) unsigned default NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;


DROP TABLE IF EXISTS `t_term_resource_relation_22`;
CREATE TABLE `t_term_resource_relation_22` (
  `RESOURCE_ID` varchar(45) default NULL COMMENT '资源id',
  `RESOURCE_NAME` varchar(120) default NULL COMMENT '资源名称',
  `TERM_ID` varchar(45) default NULL COMMENT '终端id',
  `TERM_NAME` varchar(120) default NULL COMMENT '终端名称--',
  `SUBJECT_ID` varchar(45) default NULL COMMENT '学科id',
  `CLASS_ID` varchar(45) default NULL COMMENT '年级id',
  `OPT_TYPE` varchar(8) default NULL COMMENT '操作类型，已接收、下载、点击、未开机',
  `REGOIN_ID` varchar(45) default NULL COMMENT '区划id--',
  `REGOIN_NAME` varchar(45) default NULL COMMENT '区划名称--',
  `OPT_TIME` datetime default NULL COMMENT '操作时间--以写入数据库时间为准',
  `OPT_COUNT` int(10) unsigned default NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;


DROP TABLE IF EXISTS `t_term_resource_relation_23`;
CREATE TABLE `t_term_resource_relation_23` (
  `RESOURCE_ID` varchar(45) default NULL COMMENT '资源id',
  `RESOURCE_NAME` varchar(120) default NULL COMMENT '资源名称',
  `TERM_ID` varchar(45) default NULL COMMENT '终端id',
  `TERM_NAME` varchar(120) default NULL COMMENT '终端名称--',
  `SUBJECT_ID` varchar(45) default NULL COMMENT '学科id',
  `CLASS_ID` varchar(45) default NULL COMMENT '年级id',
  `OPT_TYPE` varchar(8) default NULL COMMENT '操作类型，已接收、下载、点击、未开机',
  `REGOIN_ID` varchar(45) default NULL COMMENT '区划id--',
  `REGOIN_NAME` varchar(45) default NULL COMMENT '区划名称--',
  `OPT_TIME` datetime default NULL COMMENT '操作时间--以写入数据库时间为准',
  `OPT_COUNT` int(10) unsigned default NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;


DROP TABLE IF EXISTS `t_term_resource_relation_31`;
CREATE TABLE `t_term_resource_relation_31` (
  `RESOURCE_ID` varchar(45) default NULL COMMENT '资源id',
  `RESOURCE_NAME` varchar(120) default NULL COMMENT '资源名称',
  `TERM_ID` varchar(45) default NULL COMMENT '终端id',
  `TERM_NAME` varchar(120) default NULL COMMENT '终端名称--',
  `SUBJECT_ID` varchar(45) default NULL COMMENT '学科id',
  `CLASS_ID` varchar(45) default NULL COMMENT '年级id',
  `OPT_TYPE` varchar(8) default NULL COMMENT '操作类型，已接收、下载、点击、未开机',
  `REGOIN_ID` varchar(45) default NULL COMMENT '区划id--',
  `REGOIN_NAME` varchar(45) default NULL COMMENT '区划名称--',
  `OPT_TIME` datetime default NULL COMMENT '操作时间--以写入数据库时间为准',
  `OPT_COUNT` int(10) unsigned default NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;


DROP TABLE IF EXISTS `t_term_resource_relation_32`;
CREATE TABLE `t_term_resource_relation_32` (
  `RESOURCE_ID` varchar(45) default NULL COMMENT '资源id',
  `RESOURCE_NAME` varchar(120) default NULL COMMENT '资源名称',
  `TERM_ID` varchar(45) default NULL COMMENT '终端id',
  `TERM_NAME` varchar(120) default NULL COMMENT '终端名称--',
  `SUBJECT_ID` varchar(45) default NULL COMMENT '学科id',
  `CLASS_ID` varchar(45) default NULL COMMENT '年级id',
  `OPT_TYPE` varchar(8) default NULL COMMENT '操作类型，已接收、下载、点击、未开机',
  `REGOIN_ID` varchar(45) default NULL COMMENT '区划id--',
  `REGOIN_NAME` varchar(45) default NULL COMMENT '区划名称--',
  `OPT_TIME` datetime default NULL COMMENT '操作时间--以写入数据库时间为准',
  `OPT_COUNT` int(10) unsigned default NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;


DROP TABLE IF EXISTS `t_term_resource_relation_33`;
CREATE TABLE `t_term_resource_relation_33` (
  `RESOURCE_ID` varchar(45) default NULL COMMENT '资源id',
  `RESOURCE_NAME` varchar(120) default NULL COMMENT '资源名称',
  `TERM_ID` varchar(45) default NULL COMMENT '终端id',
  `TERM_NAME` varchar(120) default NULL COMMENT '终端名称--',
  `SUBJECT_ID` varchar(45) default NULL COMMENT '学科id',
  `CLASS_ID` varchar(45) default NULL COMMENT '年级id',
  `OPT_TYPE` varchar(8) default NULL COMMENT '操作类型，已接收、下载、点击、未开机',
  `REGOIN_ID` varchar(45) default NULL COMMENT '区划id--',
  `REGOIN_NAME` varchar(45) default NULL COMMENT '区划名称--',
  `OPT_TIME` datetime default NULL COMMENT '操作时间--以写入数据库时间为准',
  `OPT_COUNT` int(10) unsigned default NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;


DROP TABLE IF EXISTS `t_term_resource_relation_34`;
CREATE TABLE `t_term_resource_relation_34` (
  `RESOURCE_ID` varchar(45) default NULL COMMENT '资源id',
  `RESOURCE_NAME` varchar(120) default NULL COMMENT '资源名称',
  `TERM_ID` varchar(45) default NULL COMMENT '终端id',
  `TERM_NAME` varchar(120) default NULL COMMENT '终端名称--',
  `SUBJECT_ID` varchar(45) default NULL COMMENT '学科id',
  `CLASS_ID` varchar(45) default NULL COMMENT '年级id',
  `OPT_TYPE` varchar(8) default NULL COMMENT '操作类型，已接收、下载、点击、未开机',
  `REGOIN_ID` varchar(45) default NULL COMMENT '区划id--',
  `REGOIN_NAME` varchar(45) default NULL COMMENT '区划名称--',
  `OPT_TIME` datetime default NULL COMMENT '操作时间--以写入数据库时间为准',
  `OPT_COUNT` int(10) unsigned default NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;


DROP TABLE IF EXISTS `t_term_resource_relation_35`;
CREATE TABLE `t_term_resource_relation_35` (
  `RESOURCE_ID` varchar(45) default NULL COMMENT '资源id',
  `RESOURCE_NAME` varchar(120) default NULL COMMENT '资源名称',
  `TERM_ID` varchar(45) default NULL COMMENT '终端id',
  `TERM_NAME` varchar(120) default NULL COMMENT '终端名称--',
  `SUBJECT_ID` varchar(45) default NULL COMMENT '学科id',
  `CLASS_ID` varchar(45) default NULL COMMENT '年级id',
  `OPT_TYPE` varchar(8) default NULL COMMENT '操作类型，已接收、下载、点击、未开机',
  `REGOIN_ID` varchar(45) default NULL COMMENT '区划id--',
  `REGOIN_NAME` varchar(45) default NULL COMMENT '区划名称--',
  `OPT_TIME` datetime default NULL COMMENT '操作时间--以写入数据库时间为准',
  `OPT_COUNT` int(10) unsigned default NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;


DROP TABLE IF EXISTS `t_term_resource_relation_36`;
CREATE TABLE `t_term_resource_relation_36` (
  `RESOURCE_ID` varchar(45) default NULL COMMENT '资源id',
  `RESOURCE_NAME` varchar(120) default NULL COMMENT '资源名称',
  `TERM_ID` varchar(45) default NULL COMMENT '终端id',
  `TERM_NAME` varchar(120) default NULL COMMENT '终端名称--',
  `SUBJECT_ID` varchar(45) default NULL COMMENT '学科id',
  `CLASS_ID` varchar(45) default NULL COMMENT '年级id',
  `OPT_TYPE` varchar(8) default NULL COMMENT '操作类型，已接收、下载、点击、未开机',
  `REGOIN_ID` varchar(45) default NULL COMMENT '区划id--',
  `REGOIN_NAME` varchar(45) default NULL COMMENT '区划名称--',
  `OPT_TIME` datetime default NULL COMMENT '操作时间--以写入数据库时间为准',
  `OPT_COUNT` int(10) unsigned default NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;


DROP TABLE IF EXISTS `t_term_resource_relation_37`;
CREATE TABLE `t_term_resource_relation_37` (
  `RESOURCE_ID` varchar(45) default NULL COMMENT '资源id',
  `RESOURCE_NAME` varchar(120) default NULL COMMENT '资源名称',
  `TERM_ID` varchar(45) default NULL COMMENT '终端id',
  `TERM_NAME` varchar(120) default NULL COMMENT '终端名称--',
  `SUBJECT_ID` varchar(45) default NULL COMMENT '学科id',
  `CLASS_ID` varchar(45) default NULL COMMENT '年级id',
  `OPT_TYPE` varchar(8) default NULL COMMENT '操作类型，已接收、下载、点击、未开机',
  `REGOIN_ID` varchar(45) default NULL COMMENT '区划id--',
  `REGOIN_NAME` varchar(45) default NULL COMMENT '区划名称--',
  `OPT_TIME` datetime default NULL COMMENT '操作时间--以写入数据库时间为准',
  `OPT_COUNT` int(10) unsigned default NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;


DROP TABLE IF EXISTS `t_term_resource_relation_41`;
CREATE TABLE `t_term_resource_relation_41` (
  `RESOURCE_ID` varchar(45) default NULL COMMENT '资源id',
  `RESOURCE_NAME` varchar(120) default NULL COMMENT '资源名称',
  `TERM_ID` varchar(45) default NULL COMMENT '终端id',
  `TERM_NAME` varchar(120) default NULL COMMENT '终端名称--',
  `SUBJECT_ID` varchar(45) default NULL COMMENT '学科id',
  `CLASS_ID` varchar(45) default NULL COMMENT '年级id',
  `OPT_TYPE` varchar(8) default NULL COMMENT '操作类型，已接收、下载、点击、未开机',
  `REGOIN_ID` varchar(45) default NULL COMMENT '区划id--',
  `REGOIN_NAME` varchar(45) default NULL COMMENT '区划名称--',
  `OPT_TIME` datetime default NULL COMMENT '操作时间--以写入数据库时间为准',
  `OPT_COUNT` int(10) unsigned default NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;


DROP TABLE IF EXISTS `t_term_resource_relation_42`;
CREATE TABLE `t_term_resource_relation_42` (
  `RESOURCE_ID` varchar(45) default NULL COMMENT '资源id',
  `RESOURCE_NAME` varchar(120) default NULL COMMENT '资源名称',
  `TERM_ID` varchar(45) default NULL COMMENT '终端id',
  `TERM_NAME` varchar(120) default NULL COMMENT '终端名称--',
  `SUBJECT_ID` varchar(45) default NULL COMMENT '学科id',
  `CLASS_ID` varchar(45) default NULL COMMENT '年级id',
  `OPT_TYPE` varchar(8) default NULL COMMENT '操作类型，已接收、下载、点击、未开机',
  `REGOIN_ID` varchar(45) default NULL COMMENT '区划id--',
  `REGOIN_NAME` varchar(45) default NULL COMMENT '区划名称--',
  `OPT_TIME` datetime default NULL COMMENT '操作时间--以写入数据库时间为准',
  `OPT_COUNT` int(10) unsigned default NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;


DROP TABLE IF EXISTS `t_term_resource_relation_43`;
CREATE TABLE `t_term_resource_relation_43` (
  `RESOURCE_ID` varchar(45) default NULL COMMENT '资源id',
  `RESOURCE_NAME` varchar(120) default NULL COMMENT '资源名称',
  `TERM_ID` varchar(45) default NULL COMMENT '终端id',
  `TERM_NAME` varchar(120) default NULL COMMENT '终端名称--',
  `SUBJECT_ID` varchar(45) default NULL COMMENT '学科id',
  `CLASS_ID` varchar(45) default NULL COMMENT '年级id',
  `OPT_TYPE` varchar(8) default NULL COMMENT '操作类型，已接收、下载、点击、未开机',
  `REGOIN_ID` varchar(45) default NULL COMMENT '区划id--',
  `REGOIN_NAME` varchar(45) default NULL COMMENT '区划名称--',
  `OPT_TIME` datetime default NULL COMMENT '操作时间--以写入数据库时间为准',
  `OPT_COUNT` int(10) unsigned default NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;


DROP TABLE IF EXISTS `t_term_resource_relation_44`;
CREATE TABLE `t_term_resource_relation_44` (
  `RESOURCE_ID` varchar(45) default NULL COMMENT '资源id',
  `RESOURCE_NAME` varchar(120) default NULL COMMENT '资源名称',
  `TERM_ID` varchar(45) default NULL COMMENT '终端id',
  `TERM_NAME` varchar(120) default NULL COMMENT '终端名称--',
  `SUBJECT_ID` varchar(45) default NULL COMMENT '学科id',
  `CLASS_ID` varchar(45) default NULL COMMENT '年级id',
  `OPT_TYPE` varchar(8) default NULL COMMENT '操作类型，已接收、下载、点击、未开机',
  `REGOIN_ID` varchar(45) default NULL COMMENT '区划id--',
  `REGOIN_NAME` varchar(45) default NULL COMMENT '区划名称--',
  `OPT_TIME` datetime default NULL COMMENT '操作时间--以写入数据库时间为准',
  `OPT_COUNT` int(10) unsigned default NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;


DROP TABLE IF EXISTS `t_term_resource_relation_45`;
CREATE TABLE `t_term_resource_relation_45` (
  `RESOURCE_ID` varchar(45) default NULL COMMENT '资源id',
  `RESOURCE_NAME` varchar(120) default NULL COMMENT '资源名称',
  `TERM_ID` varchar(45) default NULL COMMENT '终端id',
  `TERM_NAME` varchar(120) default NULL COMMENT '终端名称--',
  `SUBJECT_ID` varchar(45) default NULL COMMENT '学科id',
  `CLASS_ID` varchar(45) default NULL COMMENT '年级id',
  `OPT_TYPE` varchar(8) default NULL COMMENT '操作类型，已接收、下载、点击、未开机',
  `REGOIN_ID` varchar(45) default NULL COMMENT '区划id--',
  `REGOIN_NAME` varchar(45) default NULL COMMENT '区划名称--',
  `OPT_TIME` datetime default NULL COMMENT '操作时间--以写入数据库时间为准',
  `OPT_COUNT` int(10) unsigned default NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;


DROP TABLE IF EXISTS `t_term_resource_relation_46`;
CREATE TABLE `t_term_resource_relation_46` (
  `RESOURCE_ID` varchar(45) default NULL COMMENT '资源id',
  `RESOURCE_NAME` varchar(120) default NULL COMMENT '资源名称',
  `TERM_ID` varchar(45) default NULL COMMENT '终端id',
  `TERM_NAME` varchar(120) default NULL COMMENT '终端名称--',
  `SUBJECT_ID` varchar(45) default NULL COMMENT '学科id',
  `CLASS_ID` varchar(45) default NULL COMMENT '年级id',
  `OPT_TYPE` varchar(8) default NULL COMMENT '操作类型，已接收、下载、点击、未开机',
  `REGOIN_ID` varchar(45) default NULL COMMENT '区划id--',
  `REGOIN_NAME` varchar(45) default NULL COMMENT '区划名称--',
  `OPT_TIME` datetime default NULL COMMENT '操作时间--以写入数据库时间为准',
  `OPT_COUNT` int(10) unsigned default NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;


DROP TABLE IF EXISTS `t_term_resource_relation_50`;
CREATE TABLE `t_term_resource_relation_50` (
  `RESOURCE_ID` varchar(45) default NULL COMMENT '资源id',
  `RESOURCE_NAME` varchar(120) default NULL COMMENT '资源名称',
  `TERM_ID` varchar(45) default NULL COMMENT '终端id',
  `TERM_NAME` varchar(120) default NULL COMMENT '终端名称--',
  `SUBJECT_ID` varchar(45) default NULL COMMENT '学科id',
  `CLASS_ID` varchar(45) default NULL COMMENT '年级id',
  `OPT_TYPE` varchar(8) default NULL COMMENT '操作类型，已接收、下载、点击、未开机',
  `REGOIN_ID` varchar(45) default NULL COMMENT '区划id--',
  `REGOIN_NAME` varchar(45) default NULL COMMENT '区划名称--',
  `OPT_TIME` datetime default NULL COMMENT '操作时间--以写入数据库时间为准',
  `OPT_COUNT` int(10) unsigned default NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;


DROP TABLE IF EXISTS `t_term_resource_relation_51`;
CREATE TABLE `t_term_resource_relation_51` (
  `RESOURCE_ID` varchar(45) default NULL COMMENT '资源id',
  `RESOURCE_NAME` varchar(120) default NULL COMMENT '资源名称',
  `TERM_ID` varchar(45) default NULL COMMENT '终端id',
  `TERM_NAME` varchar(120) default NULL COMMENT '终端名称--',
  `SUBJECT_ID` varchar(45) default NULL COMMENT '学科id',
  `CLASS_ID` varchar(45) default NULL COMMENT '年级id',
  `OPT_TYPE` varchar(8) default NULL COMMENT '操作类型，已接收、下载、点击、未开机',
  `REGOIN_ID` varchar(45) default NULL COMMENT '区划id--',
  `REGOIN_NAME` varchar(45) default NULL COMMENT '区划名称--',
  `OPT_TIME` datetime default NULL COMMENT '操作时间--以写入数据库时间为准',
  `OPT_COUNT` int(10) unsigned default NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;


DROP TABLE IF EXISTS `t_term_resource_relation_52`;
CREATE TABLE `t_term_resource_relation_52` (
  `RESOURCE_ID` varchar(45) default NULL COMMENT '资源id',
  `RESOURCE_NAME` varchar(120) default NULL COMMENT '资源名称',
  `TERM_ID` varchar(45) default NULL COMMENT '终端id',
  `TERM_NAME` varchar(120) default NULL COMMENT '终端名称--',
  `SUBJECT_ID` varchar(45) default NULL COMMENT '学科id',
  `CLASS_ID` varchar(45) default NULL COMMENT '年级id',
  `OPT_TYPE` varchar(8) default NULL COMMENT '操作类型，已接收、下载、点击、未开机',
  `REGOIN_ID` varchar(45) default NULL COMMENT '区划id--',
  `REGOIN_NAME` varchar(45) default NULL COMMENT '区划名称--',
  `OPT_TIME` datetime default NULL COMMENT '操作时间--以写入数据库时间为准',
  `OPT_COUNT` int(10) unsigned default NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;


DROP TABLE IF EXISTS `t_term_resource_relation_53`;
CREATE TABLE `t_term_resource_relation_53` (
  `RESOURCE_ID` varchar(45) default NULL COMMENT '资源id',
  `RESOURCE_NAME` varchar(120) default NULL COMMENT '资源名称',
  `TERM_ID` varchar(45) default NULL COMMENT '终端id',
  `TERM_NAME` varchar(120) default NULL COMMENT '终端名称--',
  `SUBJECT_ID` varchar(45) default NULL COMMENT '学科id',
  `CLASS_ID` varchar(45) default NULL COMMENT '年级id',
  `OPT_TYPE` varchar(8) default NULL COMMENT '操作类型，已接收、下载、点击、未开机',
  `REGOIN_ID` varchar(45) default NULL COMMENT '区划id--',
  `REGOIN_NAME` varchar(45) default NULL COMMENT '区划名称--',
  `OPT_TIME` datetime default NULL COMMENT '操作时间--以写入数据库时间为准',
  `OPT_COUNT` int(10) unsigned default NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;


DROP TABLE IF EXISTS `t_term_resource_relation_54`;
CREATE TABLE `t_term_resource_relation_54` (
  `RESOURCE_ID` varchar(45) default NULL COMMENT '资源id',
  `RESOURCE_NAME` varchar(120) default NULL COMMENT '资源名称',
  `TERM_ID` varchar(45) default NULL COMMENT '终端id',
  `TERM_NAME` varchar(120) default NULL COMMENT '终端名称--',
  `SUBJECT_ID` varchar(45) default NULL COMMENT '学科id',
  `CLASS_ID` varchar(45) default NULL COMMENT '年级id',
  `OPT_TYPE` varchar(8) default NULL COMMENT '操作类型，已接收、下载、点击、未开机',
  `REGOIN_ID` varchar(45) default NULL COMMENT '区划id--',
  `REGOIN_NAME` varchar(45) default NULL COMMENT '区划名称--',
  `OPT_TIME` datetime default NULL COMMENT '操作时间--以写入数据库时间为准',
  `OPT_COUNT` int(10) unsigned default NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;


DROP TABLE IF EXISTS `t_term_resource_relation_61`;
CREATE TABLE `t_term_resource_relation_61` (
  `RESOURCE_ID` varchar(45) default NULL COMMENT '资源id',
  `RESOURCE_NAME` varchar(120) default NULL COMMENT '资源名称',
  `TERM_ID` varchar(45) default NULL COMMENT '终端id',
  `TERM_NAME` varchar(120) default NULL COMMENT '终端名称--',
  `SUBJECT_ID` varchar(45) default NULL COMMENT '学科id',
  `CLASS_ID` varchar(45) default NULL COMMENT '年级id',
  `OPT_TYPE` varchar(8) default NULL COMMENT '操作类型，已接收、下载、点击、未开机',
  `REGOIN_ID` varchar(45) default NULL COMMENT '区划id--',
  `REGOIN_NAME` varchar(45) default NULL COMMENT '区划名称--',
  `OPT_TIME` datetime default NULL COMMENT '操作时间--以写入数据库时间为准',
  `OPT_COUNT` int(10) unsigned default NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

DROP TABLE IF EXISTS `t_term_resource_relation_62`;
CREATE TABLE `t_term_resource_relation_62` (
  `RESOURCE_ID` varchar(45) default NULL COMMENT '资源id',
  `RESOURCE_NAME` varchar(120) default NULL COMMENT '资源名称',
  `TERM_ID` varchar(45) default NULL COMMENT '终端id',
  `TERM_NAME` varchar(120) default NULL COMMENT '终端名称--',
  `SUBJECT_ID` varchar(45) default NULL COMMENT '学科id',
  `CLASS_ID` varchar(45) default NULL COMMENT '年级id',
  `OPT_TYPE` varchar(8) default NULL COMMENT '操作类型，已接收、下载、点击、未开机',
  `REGOIN_ID` varchar(45) default NULL COMMENT '区划id--',
  `REGOIN_NAME` varchar(45) default NULL COMMENT '区划名称--',
  `OPT_TIME` datetime default NULL COMMENT '操作时间--以写入数据库时间为准',
  `OPT_COUNT` int(10) unsigned default NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;


DROP TABLE IF EXISTS `t_term_resource_relation_63`;
CREATE TABLE `t_term_resource_relation_63` (
  `RESOURCE_ID` varchar(45) default NULL COMMENT '资源id',
  `RESOURCE_NAME` varchar(120) default NULL COMMENT '资源名称',
  `TERM_ID` varchar(45) default NULL COMMENT '终端id',
  `TERM_NAME` varchar(120) default NULL COMMENT '终端名称--',
  `SUBJECT_ID` varchar(45) default NULL COMMENT '学科id',
  `CLASS_ID` varchar(45) default NULL COMMENT '年级id',
  `OPT_TYPE` varchar(8) default NULL COMMENT '操作类型，已接收、下载、点击、未开机',
  `REGOIN_ID` varchar(45) default NULL COMMENT '区划id--',
  `REGOIN_NAME` varchar(45) default NULL COMMENT '区划名称--',
  `OPT_TIME` datetime default NULL COMMENT '操作时间--以写入数据库时间为准',
  `OPT_COUNT` int(10) unsigned default NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;


DROP TABLE IF EXISTS `t_term_resource_relation_64`;
CREATE TABLE `t_term_resource_relation_64` (
  `RESOURCE_ID` varchar(45) default NULL COMMENT '资源id',
  `RESOURCE_NAME` varchar(120) default NULL COMMENT '资源名称',
  `TERM_ID` varchar(45) default NULL COMMENT '终端id',
  `TERM_NAME` varchar(120) default NULL COMMENT '终端名称--',
  `SUBJECT_ID` varchar(45) default NULL COMMENT '学科id',
  `CLASS_ID` varchar(45) default NULL COMMENT '年级id',
  `OPT_TYPE` varchar(8) default NULL COMMENT '操作类型，已接收、下载、点击、未开机',
  `REGOIN_ID` varchar(45) default NULL COMMENT '区划id--',
  `REGOIN_NAME` varchar(45) default NULL COMMENT '区划名称--',
  `OPT_TIME` datetime default NULL COMMENT '操作时间--以写入数据库时间为准',
  `OPT_COUNT` int(10) unsigned default NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;


DROP TABLE IF EXISTS `t_term_resource_relation_65`;
CREATE TABLE `t_term_resource_relation_65` (
  `RESOURCE_ID` varchar(45) default NULL COMMENT '资源id',
  `RESOURCE_NAME` varchar(120) default NULL COMMENT '资源名称',
  `TERM_ID` varchar(45) default NULL COMMENT '终端id',
  `TERM_NAME` varchar(120) default NULL COMMENT '终端名称--',
  `SUBJECT_ID` varchar(45) default NULL COMMENT '学科id',
  `CLASS_ID` varchar(45) default NULL COMMENT '年级id',
  `OPT_TYPE` varchar(8) default NULL COMMENT '操作类型，已接收、下载、点击、未开机',
  `REGOIN_ID` varchar(45) default NULL COMMENT '区划id--',
  `REGOIN_NAME` varchar(45) default NULL COMMENT '区划名称--',
  `OPT_TIME` datetime default NULL COMMENT '操作时间--以写入数据库时间为准',
  `OPT_COUNT` int(10) unsigned default NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;


DROP TABLE IF EXISTS `t_term_resource_relation_66`;
CREATE TABLE `t_term_resource_relation_66` (
  `RESOURCE_ID` varchar(45) default NULL COMMENT '资源id',
  `RESOURCE_NAME` varchar(120) default NULL COMMENT '资源名称',
  `TERM_ID` varchar(45) default NULL COMMENT '终端id',
  `TERM_NAME` varchar(120) default NULL COMMENT '终端名称--',
  `SUBJECT_ID` varchar(45) default NULL COMMENT '学科id',
  `CLASS_ID` varchar(45) default NULL COMMENT '年级id',
  `OPT_TYPE` varchar(8) default NULL COMMENT '操作类型，已接收、下载、点击、未开机',
  `REGOIN_ID` varchar(45) default NULL COMMENT '区划id--',
  `REGOIN_NAME` varchar(45) default NULL COMMENT '区划名称--',
  `OPT_TIME` datetime default NULL COMMENT '操作时间--以写入数据库时间为准',
  `OPT_COUNT` int(10) unsigned default NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;