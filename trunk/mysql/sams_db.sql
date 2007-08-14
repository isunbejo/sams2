# SQUIDCTRL DUMP FOR MYSQL DATABASE
 DROP DATABASE IF EXISTS `squidctrl`;
 CREATE DATABASE `squidctrl`;
 USE squidctrl;

 DROP TABLE IF EXISTS `groups`;
 CREATE TABLE `groups` ( `count` int(11), `name` char(25), `nick` char(25), `value` char(10)) TYPE=MyISAM;
 INSERT INTO groups VALUES('0','user','Users','open');
 INSERT INTO groups VALUES('1','admin','Administrators','open');
 DROP TABLE IF EXISTS `ipreplace`;
 CREATE TABLE `ipreplace` ( `ip` char(15), `user` char(25), `domain` char(25)) TYPE=MyISAM;
 DROP TABLE IF EXISTS `log`;
 CREATE TABLE `log` ( `user` char(25), `date` date, `time` time, `value` char(60), `code` char(2)) TYPE=MyISAM;
 DROP TABLE IF EXISTS `passwd`;
 CREATE TABLE `passwd` ( `user` char(25), `pass` char(60), `access` int(11)) TYPE=MyISAM;
 INSERT INTO passwd VALUES('Admin','00YfpO1MXDzqQ','1');
 INSERT INTO passwd VALUES('Auditor','00MTbxknCTtNs','1');
 DROP TABLE IF EXISTS `reconfig`;
 CREATE TABLE `reconfig` ( `number` int(2),`service` varchar (15),`action` varchar(10), `value` varchar(110)) TYPE=MyISAM;
 INSERT INTO reconfig VALUES('1','sams','', '');
 DROP TABLE IF EXISTS `redirect`;
 CREATE TABLE `redirect` ( `name` varchar(25), `filename` varchar(25), `type` varchar(25), `show` int(10) unsigned, `redirect_to` varchar(100)) TYPE=MyISAM;
 INSERT INTO redirect VALUES('Banners','banners','redir','0','');
 INSERT INTO redirect VALUES('Counters','counters','redir','0','');
 INSERT INTO redirect VALUES('Chats','chat','denied','0','');
 INSERT INTO redirect VALUES('Porno','porno','denied','0','');
 INSERT INTO redirect VALUES('Localdomains','localhosts','denied','0','');
 DROP TABLE IF EXISTS `sams`;
 CREATE TABLE `sams` ( `endvalue` bigint(20), `redirect_to` varchar(100), `denied_to` varchar(100), `redirector` varchar(25), `delaypool` char(1), `useraccess` char(1), `auth` varchar(4), `wbinfopath` varchar(100),`urlaccess` char(1),`separator` varchar(15) default '+',`ntlmdomain` char(1),`bigd` char(1),`bigu` char(1),`sleep` int(3),`parser_on` char(1),`parser` varchar(10),`parser_time` int(2),`count_clean` char(1),`nameencode` char(1),`iconset` varchar(25),`days` varchar(14),`shour` tinyint(2),`smin` tinyint(2),`ehour` tinyint(2),`emin` tinyint(2),`autherrorc` tinyint(1), `autherrort` varchar(16), `realsize` varchar(4), `checkdns` varchar(1), `loglevel` tinyint(1) NOT NULL default '0',`defaultdomain` char(25) NOT NULL default 'workgroup', `squidbase` tinyint(2) NOT NULL default '0', udscript char(25) NOT NULL default 'NONE', adminaddr char(25) default '' ) TYPE=MyISAM;
 INSERT INTO sams VALUES('0','http://your.ip.address/sams/icon/classic/blank.gif','http://your.ip.address/sams/messages','sams','Y','Y','ntlm','/usr/bin','Y','+','Y','','','1','','','','Y','N','classic','MTWHFAS','0','0','24','0','0','0','real','N','0','workgroup','0','NONE','');
 DROP TABLE IF EXISTS `sconfig`;
 CREATE TABLE `sconfig` ( `sname` char(25), `set` char(25)) TYPE=MyISAM;
 DROP TABLE IF EXISTS `sguard`;
 CREATE TABLE `sguard` ( `sname` varchar(25), `name` varchar(100), `domain` char(1), `url` char(1), `expr` char(1)) TYPE=MyISAM;
 DROP TABLE IF EXISTS `shablons`;
 CREATE TABLE `shablons` ( `name` varchar(25), `nick` varchar(25), `shablonpool` bigint, `userpool` bigint, `redirect_to` varchar(100),`auth` varchar(4),`traffic` int(25) ,`days` varchar(14),`shour` tinyint(2),`smin` tinyint(2),`ehour` tinyint(2),`emin` tinyint(2), `period` char(3) NOT NULL default 'M', `clrdate` date NOT NULL default '0000-00-00',`alldenied` tinyint(1) NOT NULL default '0' ) TYPE=MyISAM;
 INSERT INTO shablons VALUES('default','Default','64000','64000','','','100','MTWHFAS','0','0','24','0','M','0000-00-00','0');
 DROP TABLE IF EXISTS `squidusers`;
 CREATE TABLE `squidusers` ( `id` char(25), `nick` char(25), `family` char(25), `name` char(25), `soname` char(25), `group` char(25), `domain` char(25), `shablon` char(25), `quotes` bigint(20), `size` bigint(20), `enabled` int(11), `ip` char(15), `ipmask` char(15), `passwd` char(20), `gauditor` int(1),`hit` bigint(20) NOT NULL default '0', `autherrorc` tinyint(1) default '0', `autherrort` varchar(16) default '0' ) TYPE=MyISAM;
 DROP TABLE IF EXISTS `tree`;
 CREATE TABLE `tree` ( `name` char(25), `value` tinyint(4)) TYPE=MyISAM;
 DROP TABLE IF EXISTS `urlreplace`;
 CREATE TABLE `urlreplace` ( `user` char(25), `domain` char(25), `url` char(50), `newurl` char(50)) TYPE=MyISAM;
 DROP TABLE IF EXISTS `urls`;
 CREATE TABLE `urls` ( `url` char(90), `type` char(25)) TYPE=MyISAM;
 DROP TABLE IF EXISTS `globalsettings`;
 CREATE TABLE `globalsettings` (`lang` varchar(15) NOT NULL default 'EN', `iconset`varchar(25) NOT NULL default 'classic', `useraccess` char(1) NOT NULL default 'Y', `urlaccess` char(1) NOT NULL default 'Y', `showutree` char(1) NOT NULL default 'Y' , `showname` varchar(5) NOT NULL default 'nick', `kbsize` char(15) NOT NULL default '1024', `mbsize` char(15) NOT NULL default '1048576', `showgraph` char(1) NOT NULL default 'N', `createpdf` varchar(6) NOT NULL default 'none') TYPE=MyISAM;
 INSERT INTO `globalsettings` VALUES('EN','classic','Y','Y','Y','nick','1024','1048576','N','none');
 UPDATE squidctrl.passwd SET passwd.pass=ENCRYPT("qwerty","00") WHERE passwd.user='Admin';
 ALTER TABLE squidusers ADD INDEX (`nick`);
 ALTER TABLE squidusers ADD INDEX (`group`);
 ALTER TABLE squidusers ADD INDEX (`family`);
 DROP TABLE IF EXISTS `proxyes`;
 CREATE TABLE `proxyes` ( `id` tinyint(3) default '0', `description` varchar(50) default 'Proxy server', `endvalue` int(20) default '0') TYPE=MyISAM;


