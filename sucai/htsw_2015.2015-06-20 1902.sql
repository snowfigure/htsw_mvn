/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50018
Source Host           : localhost:3306
Source Database       : htsw_2015

Target Server Type    : MYSQL
Target Server Version : 50018
File Encoding         : 65001

Date: 2015-06-20 19:02:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `apply`
-- ----------------------------
DROP TABLE IF EXISTS `apply`;
CREATE TABLE `apply` (
  `id` int(11) NOT NULL auto_increment,
  `_apply_id_` varchar(256) default NULL,
  `uid` int(11) default NULL COMMENT '用户编号（外键）',
  `product_id` int(11) default '1' COMMENT 'product编号（外键）',
  `money` double default NULL COMMENT '贷款额度',
  `use_time_id` int(11) default '1' COMMENT '申请带款期限id（外键）',
  `month_payment` double default NULL COMMENT '每月还款额',
  `use_for_id` int(11) default '1' COMMENT '借款用途ID（外键）',
  `use_for_other` varchar(255) default NULL COMMENT '借款用途',
  `pay_way_id` int(11) default '1' COMMENT '还款方式（外键）',
  `pay_source` varchar(255) default NULL COMMENT '还款来源',
  `apply_time` datetime default NULL COMMENT '申请时间',
  `status` int(11) default '2',
  `deal_status` int(11) default '1' COMMENT '1：等待处理；2：业务员处理中；3：管理员处理中；4：处理完毕',
  `deal_uid` int(11) default '9' COMMENT '处理人员编号',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apply
-- ----------------------------
INSERT INTO `apply` VALUES ('1', 'YXh1czhpNlVaKzA9', '22', '3', '33000', '3', '3300', '3', '无', '2', '工资', '2015-05-21 12:23:30', '2', '1', '9');
INSERT INTO `apply` VALUES ('2', 'MU5ia215RmJTQjA9', '23', '2', '23000', '3', '2344', '4', null, '2', '工资', '2015-06-20 13:40:44', '2', '1', '9');
INSERT INTO `apply` VALUES ('3', 'dGNDb2xUMTJZKzg9', '25', '4', '234566', '4', '2323', '5', '算法色', '3', '生日蛋糕', '2015-06-20 13:41:33', '2', '1', '9');
INSERT INTO `apply` VALUES ('4', 'OGRkZU5RTjdKZUk9', '26', '4', '3456232', '3', '23455', '11', '岁的法国', '3', '文人同', '2015-06-20 13:42:02', '2', '1', '9');

-- ----------------------------
-- Table structure for `apply_car_buy_type`
-- ----------------------------
DROP TABLE IF EXISTS `apply_car_buy_type`;
CREATE TABLE `apply_car_buy_type` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(32) default NULL,
  `intro` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apply_car_buy_type
-- ----------------------------
INSERT INTO `apply_car_buy_type` VALUES ('1', '无', '■无&nbsp;□有（全款购买，金额<u>&nbsp;&nbsp;</u>万元）&nbsp;□有（按揭购买，月供<u>&nbsp;&nbsp;</u>万元）');
INSERT INTO `apply_car_buy_type` VALUES ('2', '全款购买', '□无&nbsp;■有（全款购买，金额<u>&nbsp;%s&nbsp;</u>万元）&nbsp;□有（按揭购买，月供<u>&nbsp;&nbsp;</u>万元）');
INSERT INTO `apply_car_buy_type` VALUES ('3', '按揭购买', '□无&nbsp;□有（全款购买，金额<u>&nbsp;&nbsp;</u>万元）&nbsp;■有（按揭购买，月供<u>&nbsp;%s&nbsp;</u>万元）');

-- ----------------------------
-- Table structure for `apply_company_belong_type`
-- ----------------------------
DROP TABLE IF EXISTS `apply_company_belong_type`;
CREATE TABLE `apply_company_belong_type` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(32) default NULL,
  `intro` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apply_company_belong_type
-- ----------------------------
INSERT INTO `apply_company_belong_type` VALUES ('1', '-', '□政府机关&nbsp;□军事机关&nbsp;□教育、科研、设计机构&nbsp;□传媒、文化体育&nbsp;□高新技术制造业&nbsp;□建筑业&nbsp;□传统制造业<br/>□金融业&nbsp;&nbsp;□服务业&nbsp;&nbsp;□零售、商贸、企业&nbsp;&nbsp;&nbsp;□专业服务机构&nbsp;&nbsp;□公共事业&nbsp;&nbsp;&nbsp;&nbsp;□医院');
INSERT INTO `apply_company_belong_type` VALUES ('2', '政府机关', '■政府机关&nbsp;□军事机关&nbsp;□教育、科研、设计机构&nbsp;□传媒、文化体育&nbsp;□高新技术制造业&nbsp;□建筑业&nbsp;□传统制造业<br/>□金融业&nbsp;&nbsp;□服务业&nbsp;&nbsp;□零售、商贸、企业&nbsp;&nbsp;&nbsp;□专业服务机构&nbsp;&nbsp;□公共事业&nbsp;&nbsp;&nbsp;&nbsp;□医院');
INSERT INTO `apply_company_belong_type` VALUES ('3', '军事机关', '□政府机关&nbsp;■军事机关&nbsp;□教育、科研、设计机构&nbsp;□传媒、文化体育&nbsp;□高新技术制造业&nbsp;□建筑业&nbsp;□传统制造业<br/>□金融业&nbsp;&nbsp;□服务业&nbsp;&nbsp;□零售、商贸、企业&nbsp;&nbsp;&nbsp;□专业服务机构&nbsp;&nbsp;□公共事业&nbsp;&nbsp;&nbsp;&nbsp;□医院');
INSERT INTO `apply_company_belong_type` VALUES ('4', '教育、科研、设计机构', '□政府机关&nbsp;□军事机关&nbsp;■教育、科研、设计机构&nbsp;□传媒、文化体育&nbsp;□高新技术制造业&nbsp;□建筑业&nbsp;□传统制造业<br/>□金融业&nbsp;&nbsp;□服务业&nbsp;&nbsp;□零售、商贸、企业&nbsp;&nbsp;&nbsp;□专业服务机构&nbsp;&nbsp;□公共事业&nbsp;&nbsp;&nbsp;&nbsp;□医院');
INSERT INTO `apply_company_belong_type` VALUES ('5', '传媒、文化体育', '□政府机关&nbsp;□军事机关&nbsp;□教育、科研、设计机构&nbsp;■传媒、文化体育&nbsp;□高新技术制造业&nbsp;□建筑业&nbsp;□传统制造业<br/>□金融业&nbsp;&nbsp;□服务业&nbsp;&nbsp;□零售、商贸、企业&nbsp;&nbsp;&nbsp;□专业服务机构&nbsp;&nbsp;□公共事业&nbsp;&nbsp;&nbsp;&nbsp;□医院');
INSERT INTO `apply_company_belong_type` VALUES ('6', '高新技术制造业', '□政府机关&nbsp;□军事机关&nbsp;□教育、科研、设计机构&nbsp;□传媒、文化体育&nbsp;■高新技术制造业&nbsp;□建筑业&nbsp;□传统制造业<br/>□金融业&nbsp;&nbsp;□服务业&nbsp;&nbsp;□零售、商贸、企业&nbsp;&nbsp;&nbsp;□专业服务机构&nbsp;&nbsp;□公共事业&nbsp;&nbsp;&nbsp;&nbsp;□医院');
INSERT INTO `apply_company_belong_type` VALUES ('7', '建筑业', '□政府机关&nbsp;□军事机关&nbsp;□教育、科研、设计机构&nbsp;□传媒、文化体育&nbsp;□高新技术制造业&nbsp;■建筑业&nbsp;□传统制造业<br/>□金融业&nbsp;&nbsp;□服务业&nbsp;&nbsp;□零售、商贸、企业&nbsp;&nbsp;&nbsp;□专业服务机构&nbsp;&nbsp;□公共事业&nbsp;&nbsp;&nbsp;&nbsp;□医院');
INSERT INTO `apply_company_belong_type` VALUES ('8', '传统制造业', '□政府机关&nbsp;□军事机关&nbsp;□教育、科研、设计机构&nbsp;□传媒、文化体育&nbsp;□高新技术制造业&nbsp;□建筑业&nbsp;■传统制造业<br/>□金融业&nbsp;&nbsp;□服务业&nbsp;&nbsp;□零售、商贸、企业&nbsp;&nbsp;&nbsp;□专业服务机构&nbsp;&nbsp;□公共事业&nbsp;&nbsp;&nbsp;&nbsp;□医院');
INSERT INTO `apply_company_belong_type` VALUES ('9', '金融业', '□政府机关&nbsp;□军事机关&nbsp;□教育、科研、设计机构&nbsp;□传媒、文化体育&nbsp;□高新技术制造业&nbsp;□建筑业&nbsp;□传统制造业<br/>■金融业&nbsp;&nbsp;□服务业&nbsp;&nbsp;□零售、商贸、企业&nbsp;&nbsp;&nbsp;□专业服务机构&nbsp;&nbsp;□公共事业&nbsp;&nbsp;&nbsp;&nbsp;□医院');
INSERT INTO `apply_company_belong_type` VALUES ('10', '服务业', '□政府机关&nbsp;□军事机关&nbsp;□教育、科研、设计机构&nbsp;□传媒、文化体育&nbsp;□高新技术制造业&nbsp;□建筑业&nbsp;□传统制造业<br/>□金融业&nbsp;&nbsp;■服务业&nbsp;&nbsp;□零售、商贸、企业&nbsp;&nbsp;&nbsp;□专业服务机构&nbsp;&nbsp;□公共事业&nbsp;&nbsp;&nbsp;&nbsp;□医院');
INSERT INTO `apply_company_belong_type` VALUES ('11', '零售、商贸、企业', '□政府机关&nbsp;□军事机关&nbsp;□教育、科研、设计机构&nbsp;□传媒、文化体育&nbsp;□高新技术制造业&nbsp;□建筑业&nbsp;□传统制造业<br/>□金融业&nbsp;&nbsp;□服务业&nbsp;&nbsp;■零售、商贸、企业&nbsp;&nbsp;&nbsp;□专业服务机构&nbsp;&nbsp;□公共事业&nbsp;&nbsp;&nbsp;&nbsp;□医院');
INSERT INTO `apply_company_belong_type` VALUES ('12', '专业服务机构', '□政府机关&nbsp;□军事机关&nbsp;□教育、科研、设计机构&nbsp;□传媒、文化体育&nbsp;□高新技术制造业&nbsp;□建筑业&nbsp;□传统制造业<br/>□金融业&nbsp;&nbsp;□服务业&nbsp;&nbsp;□零售、商贸、企业&nbsp;&nbsp;&nbsp;■专业服务机构&nbsp;&nbsp;□公共事业&nbsp;&nbsp;&nbsp;&nbsp;□医院');
INSERT INTO `apply_company_belong_type` VALUES ('13', '公共事业', '□政府机关&nbsp;□军事机关&nbsp;□教育、科研、设计机构&nbsp;□传媒、文化体育&nbsp;□高新技术制造业&nbsp;□建筑业&nbsp;□传统制造业<br/>□金融业&nbsp;&nbsp;□服务业&nbsp;&nbsp;□零售、商贸、企业&nbsp;&nbsp;&nbsp;□专业服务机构&nbsp;&nbsp;■公共事业&nbsp;&nbsp;&nbsp;&nbsp;□医院');
INSERT INTO `apply_company_belong_type` VALUES ('14', '医院', '□政府机关&nbsp;□军事机关&nbsp;□教育、科研、设计机构&nbsp;□传媒、文化体育&nbsp;□高新技术制造业&nbsp;□建筑业&nbsp;□传统制造业<br/>□金融业&nbsp;&nbsp;□服务业&nbsp;&nbsp;□零售、商贸、企业&nbsp;&nbsp;&nbsp;□专业服务机构&nbsp;&nbsp;□公共事业&nbsp;&nbsp;&nbsp;&nbsp;■医院');

-- ----------------------------
-- Table structure for `apply_company_type`
-- ----------------------------
DROP TABLE IF EXISTS `apply_company_type`;
CREATE TABLE `apply_company_type` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(32) default NULL,
  `intro` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apply_company_type
-- ----------------------------
INSERT INTO `apply_company_type` VALUES ('1', '-', '□政府机关&nbsp;□事业单位&nbsp;□国企&nbsp;&nbsp;□外企&nbsp;&nbsp;□合资&nbsp;&nbsp;□民营&nbsp;&nbsp;□私企&nbsp;&nbsp;□个体');
INSERT INTO `apply_company_type` VALUES ('2', '政府机关', '■政府机关&nbsp;□事业单位&nbsp;□国企&nbsp;&nbsp;□外企&nbsp;&nbsp;□合资&nbsp;&nbsp;□民营&nbsp;&nbsp;□私企&nbsp;&nbsp;□个体');
INSERT INTO `apply_company_type` VALUES ('3', '事业单位', '□政府机关&nbsp;■事业单位&nbsp;□国企&nbsp;&nbsp;□外企&nbsp;&nbsp;□合资&nbsp;&nbsp;□民营&nbsp;&nbsp;□私企&nbsp;&nbsp;□个体');
INSERT INTO `apply_company_type` VALUES ('4', '国企', '□政府机关&nbsp;□事业单位&nbsp;■国企&nbsp;&nbsp;□外企&nbsp;&nbsp;□合资&nbsp;&nbsp;□民营&nbsp;&nbsp;□私企&nbsp;&nbsp;□个体');
INSERT INTO `apply_company_type` VALUES ('5', '外企', '□政府机关&nbsp;□事业单位&nbsp;□国企&nbsp;&nbsp;■外企&nbsp;&nbsp;□合资&nbsp;&nbsp;□民营&nbsp;&nbsp;□私企&nbsp;&nbsp;□个体');
INSERT INTO `apply_company_type` VALUES ('6', '合资', '□政府机关&nbsp;□事业单位&nbsp;□国企&nbsp;&nbsp;□外企&nbsp;&nbsp;■合资&nbsp;&nbsp;□民营&nbsp;&nbsp;□私企&nbsp;&nbsp;□个体');
INSERT INTO `apply_company_type` VALUES ('7', '民营', '□政府机关&nbsp;□事业单位&nbsp;□国企&nbsp;&nbsp;□外企&nbsp;&nbsp;□合资&nbsp;&nbsp;■民营&nbsp;&nbsp;□私企&nbsp;&nbsp;□个体');
INSERT INTO `apply_company_type` VALUES ('8', '私企', '□政府机关&nbsp;□事业单位&nbsp;□国企&nbsp;&nbsp;□外企&nbsp;&nbsp;□合资&nbsp;&nbsp;□民营&nbsp;&nbsp;■私企&nbsp;&nbsp;□个体');
INSERT INTO `apply_company_type` VALUES ('9', '个体', '□政府机关&nbsp;□事业单位&nbsp;□国企&nbsp;&nbsp;□外企&nbsp;&nbsp;□合资&nbsp;&nbsp;□民营&nbsp;&nbsp;□私企&nbsp;&nbsp;■个体');

-- ----------------------------
-- Table structure for `apply_degree_type`
-- ----------------------------
DROP TABLE IF EXISTS `apply_degree_type`;
CREATE TABLE `apply_degree_type` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(32) default NULL,
  `intro` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apply_degree_type
-- ----------------------------
INSERT INTO `apply_degree_type` VALUES ('1', '-', '□ 硕士及以上 &nbsp;&nbsp;&nbsp;□ 本科 &nbsp;&nbsp;&nbsp;□ 大专 &nbsp;&nbsp;&nbsp;□ 中专 &nbsp;&nbsp;&nbsp;□ 高中 &nbsp;&nbsp;&nbsp;□ 初中及以下');
INSERT INTO `apply_degree_type` VALUES ('2', '硕士及以上', '■ 硕士及以上 &nbsp;&nbsp;&nbsp;□ 本科 &nbsp;&nbsp;&nbsp;□ 大专 &nbsp;&nbsp;&nbsp;□ 中专 &nbsp;&nbsp;&nbsp;□ 高中 &nbsp;&nbsp;&nbsp;□ 初中及以下');
INSERT INTO `apply_degree_type` VALUES ('3', '本科', '□ 硕士及以上 &nbsp;&nbsp;&nbsp;■ 本科 &nbsp;&nbsp;&nbsp;□ 大专 &nbsp;&nbsp;&nbsp;□ 中专 &nbsp;&nbsp;&nbsp;□ 高中 &nbsp;&nbsp;&nbsp;□ 初中及以下');
INSERT INTO `apply_degree_type` VALUES ('4', '大专', '□ 硕士及以上 &nbsp;&nbsp;&nbsp;□ 本科 &nbsp;&nbsp;&nbsp;■ 大专 &nbsp;&nbsp;&nbsp;□ 中专 &nbsp;&nbsp;&nbsp;□ 高中 &nbsp;&nbsp;&nbsp;□ 初中及以下');
INSERT INTO `apply_degree_type` VALUES ('5', '中专', '□ 硕士及以上 &nbsp;&nbsp;&nbsp;□ 本科 &nbsp;&nbsp;&nbsp;□ 大专 &nbsp;&nbsp;&nbsp;■ 中专 &nbsp;&nbsp;&nbsp;□ 高中 &nbsp;&nbsp;&nbsp;□ 初中及以下');
INSERT INTO `apply_degree_type` VALUES ('6', '高中', '□ 硕士及以上 &nbsp;&nbsp;&nbsp;□ 本科 &nbsp;&nbsp;&nbsp;□ 大专 &nbsp;&nbsp;&nbsp;□ 中专 &nbsp;&nbsp;&nbsp;■ 高中 &nbsp;&nbsp;&nbsp;□ 初中及以下');
INSERT INTO `apply_degree_type` VALUES ('7', '初中及以下', '□ 硕士及以上 &nbsp;&nbsp;&nbsp;□ 本科 &nbsp;&nbsp;&nbsp;□ 大专 &nbsp;&nbsp;&nbsp;□ 中专 &nbsp;&nbsp;&nbsp;□ 高中 &nbsp;&nbsp;&nbsp;■ 初中及以下');

-- ----------------------------
-- Table structure for `apply_enterprise_place_type`
-- ----------------------------
DROP TABLE IF EXISTS `apply_enterprise_place_type`;
CREATE TABLE `apply_enterprise_place_type` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(32) default NULL,
  `intro` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apply_enterprise_place_type
-- ----------------------------
INSERT INTO `apply_enterprise_place_type` VALUES ('1', '-', '□自有房产&nbsp;□租用');
INSERT INTO `apply_enterprise_place_type` VALUES ('2', '自有房产', '■自有房产&nbsp;□租用');
INSERT INTO `apply_enterprise_place_type` VALUES ('3', '租用（请填写租金等）', '□自有房产&nbsp;■租用');

-- ----------------------------
-- Table structure for `apply_enterprise_type`
-- ----------------------------
DROP TABLE IF EXISTS `apply_enterprise_type`;
CREATE TABLE `apply_enterprise_type` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(32) default NULL,
  `intro` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apply_enterprise_type
-- ----------------------------
INSERT INTO `apply_enterprise_type` VALUES ('1', '-', '□私营股份有限公司&nbsp;□私营有限责任公司&nbsp;□私营合作&nbsp;&nbsp;□私营独资&nbsp;&nbsp;□个体&nbsp;&nbsp;□其它（请说明）');
INSERT INTO `apply_enterprise_type` VALUES ('2', '私营股份有限公司', '■私营股份有限公司&nbsp;□私营有限责任公司&nbsp;□私营合作&nbsp;&nbsp;□私营独资&nbsp;&nbsp;□个体&nbsp;&nbsp;□其它（请说明）');
INSERT INTO `apply_enterprise_type` VALUES ('3', '私营有限责任公司', '□私营股份有限公司&nbsp;■私营有限责任公司&nbsp;□私营合作&nbsp;&nbsp;□私营独资&nbsp;&nbsp;□个体&nbsp;&nbsp;□其它（请说明）');
INSERT INTO `apply_enterprise_type` VALUES ('4', '私营合作', '□私营股份有限公司&nbsp;□私营有限责任公司&nbsp;■私营合作&nbsp;&nbsp;□私营独资&nbsp;&nbsp;□个体&nbsp;&nbsp;□其它（请说明）');
INSERT INTO `apply_enterprise_type` VALUES ('5', '私营独资', '□私营股份有限公司&nbsp;□私营有限责任公司&nbsp;□私营合作&nbsp;&nbsp;■私营独资&nbsp;&nbsp;□个体&nbsp;&nbsp;□其它（请说明）');
INSERT INTO `apply_enterprise_type` VALUES ('6', '个体', '□私营股份有限公司&nbsp;□私营有限责任公司&nbsp;□私营合作&nbsp;&nbsp;□私营独资&nbsp;&nbsp;■个体&nbsp;&nbsp;□其它（请说明）');
INSERT INTO `apply_enterprise_type` VALUES ('7', '其它（请说明）', '□私营股份有限公司&nbsp;□私营有限责任公司&nbsp;□私营合作&nbsp;&nbsp;□私营独资&nbsp;&nbsp;□个体&nbsp;&nbsp;■其它（请说明）');

-- ----------------------------
-- Table structure for `apply_gender_type`
-- ----------------------------
DROP TABLE IF EXISTS `apply_gender_type`;
CREATE TABLE `apply_gender_type` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(32) default NULL,
  `intro` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apply_gender_type
-- ----------------------------
INSERT INTO `apply_gender_type` VALUES ('1', '-', '□ 男 &nbsp;&nbsp;□ 女');
INSERT INTO `apply_gender_type` VALUES ('2', '男', '■ 男 &nbsp;&nbsp;□ 女');
INSERT INTO `apply_gender_type` VALUES ('3', '女', '□ 男 &nbsp;&nbsp;■ 女');

-- ----------------------------
-- Table structure for `apply_house_type`
-- ----------------------------
DROP TABLE IF EXISTS `apply_house_type`;
CREATE TABLE `apply_house_type` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(32) default NULL,
  `intro` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apply_house_type
-- ----------------------------
INSERT INTO `apply_house_type` VALUES ('1', '-', '□商业按揭购房&nbsp; □公积金按揭购房&nbsp; □商业/公积金按揭购房&nbsp;&nbsp;&nbsp; □无按揭购房 &nbsp;□自建房<br/>□与父母同住&nbsp;&nbsp;&nbsp; □亲属住房&nbsp;&nbsp;&nbsp; □ 临时居住 &nbsp;&nbsp;&nbsp;&nbsp; □租房');
INSERT INTO `apply_house_type` VALUES ('2', '商业按揭购房', '■商业按揭购房&nbsp; □公积金按揭购房&nbsp; □商业/公积金按揭购房&nbsp;&nbsp;&nbsp; □无按揭购房 &nbsp;□自建房<br/>□与父母同住&nbsp;&nbsp;&nbsp; □亲属住房&nbsp;&nbsp;&nbsp; □ 临时居住 &nbsp;&nbsp;&nbsp;&nbsp; □租房');
INSERT INTO `apply_house_type` VALUES ('3', '公积金按揭购房', '□商业按揭购房&nbsp; ■公积金按揭购房&nbsp; □商业/公积金按揭购房&nbsp;&nbsp;&nbsp; □无按揭购房 &nbsp;□自建房<br/>□与父母同住&nbsp;&nbsp;&nbsp; □亲属住房&nbsp;&nbsp;&nbsp; □ 临时居住 &nbsp;&nbsp;&nbsp;&nbsp; □租房');
INSERT INTO `apply_house_type` VALUES ('4', '商业/公积金组合按揭购房', '□商业按揭购房&nbsp; □公积金按揭购房&nbsp; ■商业/公积金按揭购房&nbsp;&nbsp;&nbsp; □无按揭购房 &nbsp;□自建房<br/>□与父母同住&nbsp;&nbsp;&nbsp; □亲属住房&nbsp;&nbsp;&nbsp; □ 临时居住 &nbsp;&nbsp;&nbsp;&nbsp; □租房');
INSERT INTO `apply_house_type` VALUES ('5', '无按揭购房', '□商业按揭购房&nbsp; □公积金按揭购房&nbsp; □商业/公积金按揭购房&nbsp;&nbsp;&nbsp; ■无按揭购房 &nbsp;□自建房<br/>□与父母同住&nbsp;&nbsp;&nbsp; □亲属住房&nbsp;&nbsp;&nbsp; □ 临时居住 &nbsp;&nbsp;&nbsp;&nbsp; □租房');
INSERT INTO `apply_house_type` VALUES ('6', '自建房', '□商业按揭购房&nbsp; □公积金按揭购房&nbsp; □商业/公积金按揭购房&nbsp;&nbsp;&nbsp; □无按揭购房 &nbsp;■自建房<br/>□与父母同住&nbsp;&nbsp;&nbsp; □亲属住房&nbsp;&nbsp;&nbsp; □ 临时居住 &nbsp;&nbsp;&nbsp;&nbsp; □租房');
INSERT INTO `apply_house_type` VALUES ('7', '与父母同住', '□商业按揭购房&nbsp; □公积金按揭购房&nbsp; □商业/公积金按揭购房&nbsp;&nbsp;&nbsp; □无按揭购房 &nbsp;□自建房<br/>■与父母同住&nbsp;&nbsp;&nbsp; □亲属住房&nbsp;&nbsp;&nbsp; □ 临时居住 &nbsp;&nbsp;&nbsp;&nbsp; □租房');
INSERT INTO `apply_house_type` VALUES ('8', '亲属住房', '□商业按揭购房&nbsp; □公积金按揭购房&nbsp; □商业/公积金按揭购房&nbsp;&nbsp;&nbsp; □无按揭购房 &nbsp;□自建房<br/>□与父母同住&nbsp;&nbsp;&nbsp; ■亲属住房&nbsp;&nbsp;&nbsp; □ 临时居住 &nbsp;&nbsp;&nbsp;&nbsp; □租房');
INSERT INTO `apply_house_type` VALUES ('9', '临时居住', '□商业按揭购房&nbsp; □公积金按揭购房&nbsp; □商业/公积金按揭购房&nbsp;&nbsp;&nbsp; □无按揭购房 &nbsp;□自建房<br/>□与父母同住&nbsp;&nbsp;&nbsp; □亲属住房&nbsp;&nbsp;&nbsp; ■ 临时居住 &nbsp;&nbsp;&nbsp;&nbsp; □租房');
INSERT INTO `apply_house_type` VALUES ('10', '租房', '□商业按揭购房&nbsp; □公积金按揭购房&nbsp; □商业/公积金按揭购房&nbsp;&nbsp;&nbsp; □无按揭购房 &nbsp;□自建房<br/>□与父母同住&nbsp;&nbsp;&nbsp; □亲属住房&nbsp;&nbsp;&nbsp; □ 临时居住 &nbsp;&nbsp;&nbsp;&nbsp; ■租房');

-- ----------------------------
-- Table structure for `apply_job_type`
-- ----------------------------
DROP TABLE IF EXISTS `apply_job_type`;
CREATE TABLE `apply_job_type` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(32) default NULL,
  `intro` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apply_job_type
-- ----------------------------
INSERT INTO `apply_job_type` VALUES ('1', '-', '公务员类&nbsp;&nbsp;□厅级及以上&nbsp;&nbsp;□局级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□处级&nbsp;&nbsp;&nbsp;&nbsp;□科级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□一般干部&nbsp;<br/>\r\n非公务员类&nbsp;□法人&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□股东&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□企业负责人&nbsp;□高层管理人员&nbsp;□中层管理人员<br/>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□一般管理人员&nbsp;□一般正式员工&nbsp;□派遣员工&nbsp;&nbsp;□其它（请说明）');
INSERT INTO `apply_job_type` VALUES ('2', '厅级及以上', '公务员类&nbsp;&nbsp;■厅级及以上&nbsp;&nbsp;□局级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□处级&nbsp;&nbsp;&nbsp;&nbsp;□科级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□一般干部&nbsp;<br/>\r\n非公务员类&nbsp;□法人&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□股东&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□企业负责人&nbsp;□高层管理人员&nbsp;□中层管理人员<br/>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□一般管理人员&nbsp;□一般正式员工&nbsp;□派遣员工&nbsp;&nbsp;□其它（请说明）');
INSERT INTO `apply_job_type` VALUES ('3', '局级', '公务员类&nbsp;&nbsp;□厅级及以上&nbsp;&nbsp;■局级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□处级&nbsp;&nbsp;&nbsp;&nbsp;□科级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□一般干部&nbsp;<br/>\r\n非公务员类&nbsp;□法人&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□股东&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□企业负责人&nbsp;□高层管理人员&nbsp;□中层管理人员<br/>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□一般管理人员&nbsp;□一般正式员工&nbsp;□派遣员工&nbsp;&nbsp;□其它（请说明）');
INSERT INTO `apply_job_type` VALUES ('4', '处级', '公务员类&nbsp;&nbsp;□厅级及以上&nbsp;&nbsp;□局级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;■处级&nbsp;&nbsp;&nbsp;&nbsp;□科级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□一般干部&nbsp;<br/>\r\n非公务员类&nbsp;□法人&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□股东&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□企业负责人&nbsp;□高层管理人员&nbsp;□中层管理人员<br/>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□一般管理人员&nbsp;□一般正式员工&nbsp;□派遣员工&nbsp;&nbsp;□其它（请说明）');
INSERT INTO `apply_job_type` VALUES ('5', '科级', '公务员类&nbsp;&nbsp;□厅级及以上&nbsp;&nbsp;□局级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□处级&nbsp;&nbsp;&nbsp;&nbsp;■科级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□一般干部&nbsp;<br/>\r\n非公务员类&nbsp;□法人&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□股东&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□企业负责人&nbsp;□高层管理人员&nbsp;□中层管理人员<br/>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□一般管理人员&nbsp;□一般正式员工&nbsp;□派遣员工&nbsp;&nbsp;□其它（请说明）');
INSERT INTO `apply_job_type` VALUES ('6', '一般干部', '公务员类&nbsp;&nbsp;□厅级及以上&nbsp;&nbsp;□局级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□处级&nbsp;&nbsp;&nbsp;&nbsp;□科级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;■一般干部&nbsp;<br/>\r\n非公务员类&nbsp;□法人&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□股东&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□企业负责人&nbsp;□高层管理人员&nbsp;□中层管理人员<br/>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□一般管理人员&nbsp;□一般正式员工&nbsp;□派遣员工&nbsp;&nbsp;□其它（请说明）');
INSERT INTO `apply_job_type` VALUES ('11', '法人', '公务员类&nbsp;&nbsp;□厅级及以上&nbsp;&nbsp;□局级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□处级&nbsp;&nbsp;&nbsp;&nbsp;□科级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□一般干部&nbsp;<br/>\r\n非公务员类&nbsp;■法人&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□股东&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□企业负责人&nbsp;□高层管理人员&nbsp;□中层管理人员<br/>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□一般管理人员&nbsp;□一般正式员工&nbsp;□派遣员工&nbsp;&nbsp;□其它（请说明）');
INSERT INTO `apply_job_type` VALUES ('12', '股东', '公务员类&nbsp;&nbsp;□厅级及以上&nbsp;&nbsp;□局级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□处级&nbsp;&nbsp;&nbsp;&nbsp;□科级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□一般干部&nbsp;<br/>\r\n非公务员类&nbsp;□法人&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;■股东&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□企业负责人&nbsp;□高层管理人员&nbsp;□中层管理人员<br/>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□一般管理人员&nbsp;□一般正式员工&nbsp;□派遣员工&nbsp;&nbsp;□其它（请说明）');
INSERT INTO `apply_job_type` VALUES ('13', '企业负责人', '公务员类&nbsp;&nbsp;□厅级及以上&nbsp;&nbsp;□局级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□处级&nbsp;&nbsp;&nbsp;&nbsp;□科级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□一般干部&nbsp;<br/>\r\n非公务员类&nbsp;□法人&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□股东&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;■企业负责人&nbsp;□高层管理人员&nbsp;□中层管理人员<br/>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□一般管理人员&nbsp;□一般正式员工&nbsp;□派遣员工&nbsp;&nbsp;□其它（请说明）');
INSERT INTO `apply_job_type` VALUES ('14', '高层管理人员', '公务员类&nbsp;&nbsp;□厅级及以上&nbsp;&nbsp;□局级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□处级&nbsp;&nbsp;&nbsp;&nbsp;□科级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□一般干部&nbsp;<br/>\r\n非公务员类&nbsp;□法人&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□股东&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□企业负责人&nbsp;■高层管理人员&nbsp;□中层管理人员<br/>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□一般管理人员&nbsp;□一般正式员工&nbsp;□派遣员工&nbsp;&nbsp;□其它（请说明）');
INSERT INTO `apply_job_type` VALUES ('15', '中层管理人员', '公务员类&nbsp;&nbsp;□厅级及以上&nbsp;&nbsp;□局级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□处级&nbsp;&nbsp;&nbsp;&nbsp;□科级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□一般干部&nbsp;<br/>\r\n非公务员类&nbsp;□法人&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□股东&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□企业负责人&nbsp;□高层管理人员&nbsp;■中层管理人员<br/>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□一般管理人员&nbsp;□一般正式员工&nbsp;□派遣员工&nbsp;&nbsp;□其它（请说明）');
INSERT INTO `apply_job_type` VALUES ('16', '一般管理人员', '公务员类&nbsp;&nbsp;□厅级及以上&nbsp;&nbsp;□局级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□处级&nbsp;&nbsp;&nbsp;&nbsp;□科级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□一般干部&nbsp;<br/>\r\n非公务员类&nbsp;□法人&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□股东&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□企业负责人&nbsp;□高层管理人员&nbsp;□中层管理人员<br/>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;■一般管理人员&nbsp;□一般正式员工&nbsp;□派遣员工&nbsp;&nbsp;□其它（请说明）');
INSERT INTO `apply_job_type` VALUES ('17', '一般正式员工', '公务员类&nbsp;&nbsp;□厅级及以上&nbsp;&nbsp;□局级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□处级&nbsp;&nbsp;&nbsp;&nbsp;□科级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□一般干部&nbsp;<br/>\r\n非公务员类&nbsp;□法人&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□股东&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□企业负责人&nbsp;□高层管理人员&nbsp;□中层管理人员<br/>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□一般管理人员&nbsp;■一般正式员工&nbsp;□派遣员工&nbsp;&nbsp;□其它（请说明）');
INSERT INTO `apply_job_type` VALUES ('18', '派遣员工', '公务员类&nbsp;&nbsp;□厅级及以上&nbsp;&nbsp;□局级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□处级&nbsp;&nbsp;&nbsp;&nbsp;□科级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□一般干部&nbsp;<br/>\r\n非公务员类&nbsp;□法人&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□股东&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□企业负责人&nbsp;□高层管理人员&nbsp;□中层管理人员<br/>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□一般管理人员&nbsp;□一般正式员工&nbsp;■派遣员工&nbsp;&nbsp;□其它（请说明）');
INSERT INTO `apply_job_type` VALUES ('19', '其它', '公务员类&nbsp;&nbsp;□厅级及以上&nbsp;&nbsp;□局级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□处级&nbsp;&nbsp;&nbsp;&nbsp;□科级&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□一般干部&nbsp;<br/>\r\n非公务员类&nbsp;□法人&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□股东&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□企业负责人&nbsp;□高层管理人员&nbsp;□中层管理人员<br/>\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;□一般管理人员&nbsp;□一般正式员工&nbsp;□派遣员工&nbsp;&nbsp;■其它（请说明）');

-- ----------------------------
-- Table structure for `apply_log`
-- ----------------------------
DROP TABLE IF EXISTS `apply_log`;
CREATE TABLE `apply_log` (
  `id` int(11) NOT NULL auto_increment,
  `apply_id` int(11) default NULL,
  `deal_uid` int(11) default '1',
  `deal_time` varchar(32) default NULL,
  `deal_log` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apply_log
-- ----------------------------
INSERT INTO `apply_log` VALUES ('1', '23', '1', '2015-05-16 12:54:15', '用户贷款申请。');
INSERT INTO `apply_log` VALUES ('2', '23', '3', '2015-05-16 12:56:25', '资料审核通过。');
INSERT INTO `apply_log` VALUES ('3', '1', '1', '2015-05-21 12:23:30', '用户贷款申请。');
INSERT INTO `apply_log` VALUES ('4', '2', '1', '2015-06-20 13:40:44', '用户贷款申请。');
INSERT INTO `apply_log` VALUES ('5', '3', '1', '2015-06-20 13:41:33', '用户贷款申请。');
INSERT INTO `apply_log` VALUES ('6', '4', '1', '2015-06-20 13:42:02', '用户贷款申请。');

-- ----------------------------
-- Table structure for `apply_marry_status_type`
-- ----------------------------
DROP TABLE IF EXISTS `apply_marry_status_type`;
CREATE TABLE `apply_marry_status_type` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(32) default NULL,
  `intro` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apply_marry_status_type
-- ----------------------------
INSERT INTO `apply_marry_status_type` VALUES ('1', '-', '□ 未婚 &nbsp;□ 已婚 &nbsp; □ 离异');
INSERT INTO `apply_marry_status_type` VALUES ('2', '未婚', '■ 未婚 &nbsp;□ 已婚 &nbsp; □ 离异');
INSERT INTO `apply_marry_status_type` VALUES ('3', '已婚', '□ 未婚 &nbsp;■ 已婚 &nbsp; □ 离异');
INSERT INTO `apply_marry_status_type` VALUES ('4', '离异', '□ 未婚 &nbsp;□ 已婚 &nbsp; ■ 离异');

-- ----------------------------
-- Table structure for `apply_pay_way`
-- ----------------------------
DROP TABLE IF EXISTS `apply_pay_way`;
CREATE TABLE `apply_pay_way` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(32) default NULL,
  `intro` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apply_pay_way
-- ----------------------------
INSERT INTO `apply_pay_way` VALUES ('1', '-', '□ 独立还款 &nbsp;&nbsp;□ 家人协助还款 &nbsp;&nbsp;□ 其它还款方式');
INSERT INTO `apply_pay_way` VALUES ('2', '独立还款', '■ 独立还款 &nbsp;&nbsp;□ 家人协助还款 &nbsp;&nbsp;□ 其它还款方式');
INSERT INTO `apply_pay_way` VALUES ('3', '家人协助还款', '□ 独立还款 &nbsp;&nbsp;■ 家人协助还款 &nbsp;&nbsp;□ 其它还款方式');
INSERT INTO `apply_pay_way` VALUES ('4', '其它还款方式', '□ 独立还款 &nbsp;&nbsp;□ 家人协助还款 &nbsp;&nbsp;■ 其它还款方式');

-- ----------------------------
-- Table structure for `apply_product_type`
-- ----------------------------
DROP TABLE IF EXISTS `apply_product_type`;
CREATE TABLE `apply_product_type` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(32) default NULL,
  `intro` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apply_product_type
-- ----------------------------
INSERT INTO `apply_product_type` VALUES ('1', '-', '□ 精英贷 &nbsp; □ 工薪贷 &nbsp;&nbsp;□ 恒楼贷 &nbsp;&nbsp;□ 商户贷 &nbsp; □ 企业贷');
INSERT INTO `apply_product_type` VALUES ('2', '精英贷', '■ 精英贷 &nbsp; □ 工薪贷 &nbsp;&nbsp;□ 恒楼贷 &nbsp;&nbsp;□ 商户贷 &nbsp; □ 企业贷');
INSERT INTO `apply_product_type` VALUES ('3', '工薪贷', '□ 精英贷 &nbsp; ■ 工薪贷 &nbsp;&nbsp;□ 恒楼贷 &nbsp;&nbsp;□ 商户贷 &nbsp; □ 企业贷');
INSERT INTO `apply_product_type` VALUES ('4', '恒楼贷', '□ 精英贷 &nbsp; □ 工薪贷 &nbsp;&nbsp;■ 恒楼贷 &nbsp;&nbsp;□ 商户贷 &nbsp; □ 企业贷');
INSERT INTO `apply_product_type` VALUES ('5', '商户贷', '□ 精英贷 &nbsp; □ 工薪贷 &nbsp;&nbsp;□ 恒楼贷 &nbsp;&nbsp;■ 商户贷 &nbsp; □ 企业贷');
INSERT INTO `apply_product_type` VALUES ('6', '企业贷', '□ 精英贷 &nbsp; □ 工薪贷 &nbsp;&nbsp;□ 恒楼贷 &nbsp;&nbsp;□ 商户贷 &nbsp; ■ 企业贷');

-- ----------------------------
-- Table structure for `apply_salary_give_type`
-- ----------------------------
DROP TABLE IF EXISTS `apply_salary_give_type`;
CREATE TABLE `apply_salary_give_type` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(32) default NULL,
  `intro` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apply_salary_give_type
-- ----------------------------
INSERT INTO `apply_salary_give_type` VALUES ('1', '-', null);
INSERT INTO `apply_salary_give_type` VALUES ('2', '网银', null);
INSERT INTO `apply_salary_give_type` VALUES ('3', '现金', null);
INSERT INTO `apply_salary_give_type` VALUES ('4', '网银+现金', null);

-- ----------------------------
-- Table structure for `apply_use_for_type`
-- ----------------------------
DROP TABLE IF EXISTS `apply_use_for_type`;
CREATE TABLE `apply_use_for_type` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(32) default NULL,
  `intro` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apply_use_for_type
-- ----------------------------
INSERT INTO `apply_use_for_type` VALUES ('1', '-', '□ 日常生活消费 &nbsp;&nbsp; □ 装修 &nbsp;&nbsp;□ 教育支出&nbsp;&nbsp; □ 医疗 &nbsp; □ 支付员工工资 &nbsp; □ 扩大生产/经营<br/>□ 购买货物/原材料/设备 &nbsp;&nbsp;&nbsp;&nbsp; □ 资金周转 &nbsp;&nbsp;□ 购物 &nbsp; □ 其它（请说明） &nbsp;');
INSERT INTO `apply_use_for_type` VALUES ('2', '日常生活消费', '■ 日常生活消费 &nbsp;&nbsp; □ 装修 &nbsp;&nbsp;□ 教育支出&nbsp;&nbsp; □ 医疗 &nbsp; □ 支付员工工资 &nbsp; □ 扩大生产/经营<br/>□ 购买货物/原材料/设备 &nbsp;&nbsp;&nbsp;&nbsp; □ 资金周转 &nbsp;&nbsp;□ 购物 &nbsp; □ 其它（请说明） &nbsp;');
INSERT INTO `apply_use_for_type` VALUES ('3', '装修', '□ 日常生活消费 &nbsp;&nbsp; ■ 装修 &nbsp;&nbsp;□ 教育支出&nbsp;&nbsp; □ 医疗 &nbsp; □ 支付员工工资 &nbsp; □ 扩大生产/经营<br/>□ 购买货物/原材料/设备 &nbsp;&nbsp;&nbsp;&nbsp; □ 资金周转 &nbsp;&nbsp;□ 购物 &nbsp; □ 其它（请说明） &nbsp;');
INSERT INTO `apply_use_for_type` VALUES ('4', '教育支出', '□ 日常生活消费 &nbsp;&nbsp; □ 装修 &nbsp;&nbsp;■ 教育支出&nbsp;&nbsp; □ 医疗 &nbsp; □ 支付员工工资 &nbsp; □ 扩大生产/经营<br/>□ 购买货物/原材料/设备 &nbsp;&nbsp;&nbsp;&nbsp; □ 资金周转 &nbsp;&nbsp;□ 购物 &nbsp; □ 其它（请说明） &nbsp;');
INSERT INTO `apply_use_for_type` VALUES ('5', '医疗', '□ 日常生活消费 &nbsp;&nbsp; □ 装修 &nbsp;&nbsp;□ 教育支出&nbsp;&nbsp; ■ 医疗 &nbsp; □ 支付员工工资 &nbsp; □ 扩大生产/经营<br/>□ 购买货物/原材料/设备 &nbsp;&nbsp;&nbsp;&nbsp; □ 资金周转 &nbsp;&nbsp;□ 购物 &nbsp; □ 其它（请说明） &nbsp;');
INSERT INTO `apply_use_for_type` VALUES ('6', '支付员工工资', '□ 日常生活消费 &nbsp;&nbsp; □ 装修 &nbsp;&nbsp;□ 教育支出&nbsp;&nbsp; □ 医疗 &nbsp; ■ 支付员工工资 &nbsp; □ 扩大生产/经营<br/>□ 购买货物/原材料/设备 &nbsp;&nbsp;&nbsp;&nbsp; □ 资金周转 &nbsp;&nbsp;□ 购物 &nbsp; □ 其它（请说明） &nbsp;');
INSERT INTO `apply_use_for_type` VALUES ('7', '扩大生产/经营', '□ 日常生活消费 &nbsp;&nbsp; □ 装修 &nbsp;&nbsp;□ 教育支出&nbsp;&nbsp; □ 医疗 &nbsp; □ 支付员工工资 &nbsp; ■ 扩大生产/经营<br/>□ 购买货物/原材料/设备 &nbsp;&nbsp;&nbsp;&nbsp; □ 资金周转 &nbsp;&nbsp;□ 购物 &nbsp; □ 其它（请说明） &nbsp;');
INSERT INTO `apply_use_for_type` VALUES ('8', '购买货物/原材料/设备', '□ 日常生活消费 &nbsp;&nbsp; □ 装修 &nbsp;&nbsp;□ 教育支出&nbsp;&nbsp; □ 医疗 &nbsp; □ 支付员工工资 &nbsp; □ 扩大生产/经营<br/>■ 购买货物/原材料/设备 &nbsp;&nbsp;&nbsp;&nbsp; □ 资金周转 &nbsp;&nbsp;□ 购物 &nbsp; □ 其它（请说明） &nbsp;');
INSERT INTO `apply_use_for_type` VALUES ('9', '资金周转', '□ 日常生活消费 &nbsp;&nbsp; □ 装修 &nbsp;&nbsp;□ 教育支出&nbsp;&nbsp; □ 医疗 &nbsp; □ 支付员工工资 &nbsp; □ 扩大生产/经营<br/>□ 购买货物/原材料/设备 &nbsp;&nbsp;&nbsp;&nbsp; ■ 资金周转 &nbsp;&nbsp;□ 购物 &nbsp; □ 其它（请说明） &nbsp;');
INSERT INTO `apply_use_for_type` VALUES ('10', '购车', '□ 日常生活消费 &nbsp;&nbsp; □ 装修 &nbsp;&nbsp;□ 教育支出&nbsp;&nbsp; □ 医疗 &nbsp; □ 支付员工工资 &nbsp; □ 扩大生产/经营<br/>□ 购买货物/原材料/设备 &nbsp;&nbsp;&nbsp;&nbsp; □ 资金周转 &nbsp;&nbsp;■ 购物 &nbsp; □ 其它（请说明） &nbsp;');
INSERT INTO `apply_use_for_type` VALUES ('11', '其它(请说明)', '□ 日常生活消费 &nbsp;&nbsp; □ 装修 &nbsp;&nbsp;□ 教育支出&nbsp;&nbsp; □ 医疗 &nbsp; □ 支付员工工资 &nbsp; □ 扩大生产/经营<br/>□ 购买货物/原材料/设备 &nbsp;&nbsp;&nbsp;&nbsp; □ 资金周转 &nbsp;&nbsp;□ 购物 &nbsp; ■ 其它（请说明） &nbsp;');

-- ----------------------------
-- Table structure for `apply_use_time_type`
-- ----------------------------
DROP TABLE IF EXISTS `apply_use_time_type`;
CREATE TABLE `apply_use_time_type` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(32) default NULL,
  `intro` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apply_use_time_type
-- ----------------------------
INSERT INTO `apply_use_time_type` VALUES ('1', '-', '□12个月（精英贷） &nbsp; □18个月 &nbsp;&nbsp; □24个月&nbsp;&nbsp; □36个月（限精英贷）');
INSERT INTO `apply_use_time_type` VALUES ('2', '12个月(除精英贷)', '■12个月（精英贷） &nbsp; □18个月 &nbsp;&nbsp; □24个月&nbsp;&nbsp; □36个月（限精英贷）');
INSERT INTO `apply_use_time_type` VALUES ('3', '18个月', '□12个月（精英贷） &nbsp; ■18个月 &nbsp;&nbsp; □24个月&nbsp;&nbsp; □36个月（限精英贷）');
INSERT INTO `apply_use_time_type` VALUES ('4', '24个月', '□12个月（精英贷） &nbsp; □18个月 &nbsp;&nbsp; ■24个月&nbsp;&nbsp; □36个月（限精英贷）');
INSERT INTO `apply_use_time_type` VALUES ('5', '36个月(限精英贷)', '□12个月（精英贷） &nbsp; □18个月 &nbsp;&nbsp; □24个月&nbsp;&nbsp; ■36个月（限精英贷）');

-- ----------------------------
-- Table structure for `apply_valid_status_type`
-- ----------------------------
DROP TABLE IF EXISTS `apply_valid_status_type`;
CREATE TABLE `apply_valid_status_type` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(32) default NULL,
  `intro` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apply_valid_status_type
-- ----------------------------
INSERT INTO `apply_valid_status_type` VALUES ('1', '审核未通过', 'danger');
INSERT INTO `apply_valid_status_type` VALUES ('2', '申请已提交，等待资料审核', 'info');
INSERT INTO `apply_valid_status_type` VALUES ('3', '资料已审核，等待面签', 'info');
INSERT INTO `apply_valid_status_type` VALUES ('4', '面签已通过，等待资金发放', 'info');
INSERT INTO `apply_valid_status_type` VALUES ('5', '资金已发放，请按时还款', 'primary');
INSERT INTO `apply_valid_status_type` VALUES ('6', '还款结束', 'success');
INSERT INTO `apply_valid_status_type` VALUES ('7', '还款出现问题，请联系工作人员', 'warning');

-- ----------------------------
-- Table structure for `article`
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL auto_increment COMMENT 'id',
  `title` varchar(255) default NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `deleable` varchar(32) default NULL,
  `user_id` int(11) default NULL COMMENT 'user id',
  `support` int(11) default NULL COMMENT '赞',
  `click_count` int(11) default NULL COMMENT '点击数',
  `type` char(1) default '0' COMMENT ' 博客类型 默认：0（原创） 收藏：1',
  `share_url` varchar(255) default NULL COMMENT '收藏 url',
  `create_time` datetime default NULL COMMENT '创建时间',
  `update_time` datetime default NULL COMMENT '更新时间',
  `delete_status` char(1) default '0' COMMENT '是否删除 默认：0 删除：1',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', '公司简介', '<p style=\"text-align: left;\"><span style=\"font-family: 微软雅黑, sans-serif; font-size: 15px; line-height: 1.5em; text-align: left;\">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><span style=\"line-height: 1.5em; text-align: left; font-family: 微软雅黑, &#39;Microsoft YaHei&#39;;\">连云港恒通商务信息咨询有限公司位于连云港市赣榆区青口镇黄海西路，是一家专业做无担保，无抵押，小额信用贷款的平台机构。拥有一流的运作团队，专业的操作流程，完整的信贷体系，以及完善的后期维护。公司致力于为征信良好的个人或企业提供优质、便捷的金融服务，为客户解决短期或长期周转的难题。</span><br/></p><p><span style=\"font-size:15px;font-family:&#39;微软雅黑&#39;,&#39;sans-serif&#39;\"></span></p><p style=\"line-height:15px\"><span style=\"font-family:&#39;微软雅黑&#39;,&#39;sans-serif&#39;\">公司平台：信息咨询服务平台</span></p><p style=\"line-height:15px\"><span style=\"font-family:&#39;微软雅黑&#39;,&#39;sans-serif&#39;\">优&nbsp;&nbsp; 点： 利息低&nbsp; 下款快&nbsp; 无抵押&nbsp; 无担保&nbsp;&nbsp; 手续简单</span></p><p style=\"line-height:15px\"><span style=\"font-family:&#39;微软雅黑&#39;,&#39;sans-serif&#39;\">职&nbsp;&nbsp; 责： 1.为企业和个人提供借款咨询和信用担保</span></p><p style=\"line-height:15px\"><span style=\"font-family:&#39;微软雅黑&#39;,&#39;sans-serif&#39;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.</span><span style=\"font-family:&#39;微软雅黑&#39;,&#39;sans-serif&#39;\">为银行和金融机构提供优质客户、把握风控</span></p><p><span style=\"font-size:15px;font-family:&#39;微软雅黑&#39;,&#39;sans-serif&#39;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;3.</span><span style=\"font-size:15px;font-family:&#39;微软雅黑&#39;,&#39;sans-serif&#39;\">为客户制定合适的信贷方案</span></p><p><br/></p><p style=\"text-align: center;\"><span style=\"font-size:15px;font-family:&#39;微软雅黑&#39;,&#39;sans-serif&#39;\"><strong><span style=\"font-size:24px;font-family:DFKai-SB\">恒通商务 ：信者的选择&nbsp;&nbsp; 智者的伙伴</span></strong></span></p><p><span style=\"font-size:15px;font-family:&#39;微软雅黑&#39;,&#39;sans-serif&#39;\"><br/></span><br/></p>', '不可删除', null, null, null, '0', null, null, null, '0');
INSERT INTO `article` VALUES ('2', '隐私声明', '隐私声明信息', '不可删除', null, null, null, '0', null, null, null, '0');
INSERT INTO `article` VALUES ('3', '人才招聘', '<p>人才招聘信息</p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><hr/><p style=\"line-height:15px\"><span style=\"font-family:&#39;微软雅黑&#39;,&#39;sans-serif&#39;\">【企业目标】&nbsp; 打造学习型企业，立志成为最专业的信贷理财团队</span></p><p style=\"line-height:15px\"><span style=\"font-family: 微软雅黑, sans-serif;\">【企业宗旨】&nbsp; 将员工培养成优秀的信贷经理，让每一位员工都能成为服务客户的专家，用心将优质服务传递到客户处，与客户互利双赢</span></p><p style=\"line-height:15px\"><span style=\"font-family:&#39;微软雅黑&#39;,&#39;sans-serif&#39;\">【企业理念】</span></p><p style=\"line-height:15px\"><span style=\"font-family:&#39;微软雅黑&#39;,&#39;sans-serif&#39;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span><span style=\"font-family: 微软雅黑, sans-serif;\">能者为师： &nbsp;1.领导视培养人才为己任</span></p><p style=\"line-height:15px\"><span style=\"font-family:&#39;微软雅黑&#39;,&#39;sans-serif&#39;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.</span><span style=\"font-family:&#39;微软雅黑&#39;,&#39;sans-serif&#39;\">向强者学习，向竞争对手学习</span></p><p style=\"line-height:15px\"><span style=\"font-family:&#39;微软雅黑&#39;,&#39;sans-serif&#39;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.</span><span style=\"font-family:&#39;微软雅黑&#39;,&#39;sans-serif&#39;\">敞开心怀，帮助同事，共同进步</span></p><p style=\"line-height:15px\"><span style=\"font-family:&#39;微软雅黑&#39;,&#39;sans-serif&#39;\">&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;</span><span style=\"font-family:&#39;微软雅黑&#39;,&#39;sans-serif&#39;\">活力团队： &nbsp;</span></p><p style=\"line-height:15px\"><span style=\"font-family:&#39;微软雅黑&#39;,&#39;sans-serif&#39;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;打造活力、激情进取的团队，让环境感染每一位员工</span></p><p style=\"line-height:15px\"><span style=\"font-family:&#39;微软雅黑&#39;,&#39;sans-serif&#39;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p><p style=\"line-height:15px\"><span style=\"font-family:&#39;微软雅黑&#39;,&#39;sans-serif&#39;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;认真 专业 负责：</span></p><p style=\"line-height:15px\"><span style=\"font-family:&#39;微软雅黑&#39;,&#39;sans-serif&#39;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.管好自己就管好了一半别人</span></p><p style=\"line-height:15px\"><span style=\"font-family: 微软雅黑, sans-serif;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.</span><span style=\"font-family: 微软雅黑, sans-serif;\">专业不光表现在对业务的认知上，也体现在穿着、言谈举止和态度上</span></p><p style=\"line-height:15px\"><span style=\"font-family: 微软雅黑, sans-serif;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.</span><span style=\"font-family: 微软雅黑, sans-serif;\">用主人翁的精神认真履行自己的职责</span></p><p style=\"line-height:15px\"><span style=\"font-family: 微软雅黑, sans-serif;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.</span><span style=\"font-family: 微软雅黑, sans-serif;\">杜绝推诿责任</span></p><p style=\"line-height:15px\"><span style=\"font-family: 微软雅黑, sans-serif;\"></span></p><hr/><p style=\"line-height:15px\"><span style=\"font-family: 微软雅黑, sans-serif;\"></span><br/></p><p><br/></p>', '不可删除', null, null, null, '0', null, null, null, '0');
INSERT INTO `article` VALUES ('4', '联系我们', '<p>联系我们</p><p><br/></p>', '不可删除', null, null, null, '0', null, null, null, '0');
INSERT INTO `article` VALUES ('5', '产品介绍', '<p><span style=\"font-family: 微软雅黑, sans-serif; font-size: 15px;\">工薪贷</span></p><p><span style=\"font-family: 微软雅黑, sans-serif; font-size: 15px;\"><br/></span></p><p><span style=\"font-family: 微软雅黑, sans-serif; font-size: 15px;\"><br/></span></p><p><span style=\"font-size:15px;font-family:&#39;微软雅黑&#39;,&#39;sans-serif&#39;\">商户贷</span></p><p><span style=\"font-size:15px;font-family:&#39;微软雅黑&#39;,&#39;sans-serif&#39;\"><br/></span></p><p><span style=\"font-size:15px;font-family:&#39;微软雅黑&#39;,&#39;sans-serif&#39;\"><br/></span></p><p><span style=\"font-size:15px;font-family:&#39;微软雅黑&#39;,&#39;sans-serif&#39;\">二次房贷</span></p><p><span style=\"font-size:15px;font-family:&#39;微软雅黑&#39;,&#39;sans-serif&#39;\"><br/></span></p><p><span style=\"font-size:15px;font-family:&#39;微软雅黑&#39;,&#39;sans-serif&#39;\"><br/></span></p><p><span style=\"font-size: 15px;font-family:&#39;微软雅黑&#39;,&#39;sans-serif&#39;\">精英贷</span></p><p><span style=\"font-size: 15px;font-family:&#39;微软雅黑&#39;,&#39;sans-serif&#39;\"><br/></span></p><p><span style=\"font-size: 15px;font-family:&#39;微软雅黑&#39;,&#39;sans-serif&#39;\"><br/></span></p><p><span style=\"font-size: 15px;font-family:&#39;微软雅黑&#39;,&#39;sans-serif&#39;\">公积金贷</span></p><p><span style=\"font-size: 15px;font-family:&#39;微软雅黑&#39;,&#39;sans-serif&#39;\"><br/></span></p><p><span style=\"font-size: 15px;font-family:&#39;微软雅黑&#39;,&#39;sans-serif&#39;\"><br/></span></p><p><span style=\"font-size: 15px;font-family:&#39;微软雅黑&#39;,&#39;sans-serif&#39;\">个人消费贷</span></p><p><span style=\"font-size: 15px;font-family:&#39;微软雅黑&#39;,&#39;sans-serif&#39;\"><br/></span></p><p><span style=\"font-size: 15px;font-family:&#39;微软雅黑&#39;,&#39;sans-serif&#39;\"><br/></span></p>', '不可删除', null, null, null, '0', null, null, null, '0');
INSERT INTO `article` VALUES ('6', '新手入门', '<p style=\"margin-top: 10px; margin-bottom: 0px; padding: 0px; color: rgb(148, 148, 147); font-family: Arial, &#39;Microsoft YaHei&#39; font-size: 14px; white-space: normal; text-indent: 0em; background-color: rgb(255, 255, 255);\"><span style=\"font-size: 16px;\"><strong style=\"font-family: 微软雅黑, &#39;Microsoft YaHei&#39;; line-height: 24px;\"></strong></span></p><hr/><p style=\"margin-top: 10px; margin-bottom: 0px; padding: 0px; color: rgb(148, 148, 147); font-family: Arial, &#39;Microsoft YaHei&#39; font-size: 14px; white-space: normal; text-indent: 0em; background-color: rgb(255, 255, 255);\"><span style=\"font-size: 18px; font-family: 宋体, SimSun;\"><strong style=\"text-indent: 0em; font-family: 微软雅黑, &#39;Microsoft YaHei&#39;; line-height: 24px;\">问：进件的基本条件是什么？</strong></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(148, 148, 147); font-family: Arial, &#39;Microsoft YaHei&#39; font-size: 14px; white-space: normal; line-height: 21px; text-indent: 0em; background-color: rgb(255, 255, 255);\"><span style=\"font-size: 18px; font-family: 宋体, SimSun; line-height: 24px; text-indent: 2em;\">答：&nbsp;①连云港市本地户口；</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(148, 148, 147); font-family: Arial, &#39;Microsoft YaHei&#39; font-size: 14px; white-space: normal; line-height: 21px; text-indent: 0em; background-color: rgb(255, 255, 255);\"><span style=\"font-size: 18px; line-height: 24px; text-indent: 2em; font-family: 宋体, SimSun;\">&nbsp; &nbsp; ②年龄22--60周岁；</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(148, 148, 147); font-family: Arial, &#39;Microsoft YaHei&#39; font-size: 14px; white-space: normal; line-height: 21px; text-indent: 0em; background-color: rgb(255, 255, 255);\"><span style=\"font-family: 宋体, SimSun; line-height: 24px; text-indent: 2em; font-size: 18px;\">&nbsp; &nbsp; ③征信逾期不超90天；</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(148, 148, 147); white-space: normal; line-height: 21px; text-indent: 0em; background-color: rgb(255, 255, 255);\"><span style=\"font-family: 宋体, SimSun; line-height: 24px; text-indent: 2em; font-size: 18px;\">&nbsp; &nbsp; ④申请人无法院执行记录。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(148, 148, 147); white-space: normal; line-height: 21px; text-indent: 0em; background-color: rgb(255, 255, 255);\"><span style=\"font-family: 宋体, SimSun; line-height: 24px; text-indent: 2em; font-size: 18px;\"></span></p><hr/><p style=\"margin-top: 10px; margin-bottom: 0px; text-indent: 0em; white-space: normal; padding: 0px; color: rgb(148, 148, 147); background-color: rgb(255, 255, 255);\"><span style=\"font-size: 18px; font-family: 宋体, SimSun;\"><strong style=\"font-family: 微软雅黑, &#39;Microsoft YaHei&#39;; line-height: 24px;\">问：如何申请？</strong></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-indent: 0em; white-space: normal; padding: 0px; color: rgb(148, 148, 147); line-height: 21px; background-color: rgb(255, 255, 255);\"><span style=\"font-family: 宋体, SimSun; line-height: 24px; text-indent: 2em; font-size: 18px;\">答：&nbsp;①通过本网站，注册账户，填写完整个人信息，进行相关申请（本功能测试使用中）；</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-indent: 0em; white-space: normal; padding: 0px; color: rgb(148, 148, 147); line-height: 21px; background-color: rgb(255, 255, 255);\"><span style=\"line-height: 24px; text-indent: 2em; font-family: 宋体, SimSun; font-size: 18px;\">&nbsp; &nbsp; ②直接下载本网站提供的材料，填写完毕后送交至本公司；</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-indent: 0em; white-space: normal; padding: 0px; color: rgb(148, 148, 147); line-height: 21px; background-color: rgb(255, 255, 255);\"><span style=\"font-family: 宋体, SimSun; line-height: 24px; text-indent: 2em; font-size: 18px;\">&nbsp; &nbsp; ③直接联系本公司相关业务人员，进行详细的指导与填写。</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-indent: 0em; white-space: normal; padding: 0px; color: rgb(148, 148, 147); line-height: 21px; background-color: rgb(255, 255, 255);\"><span style=\"font-family: 宋体, SimSun; line-height: 24px; text-indent: 2em; font-size: 18px;\"></span></p><hr/><p style=\"margin-top: 10px; margin-bottom: 0px; text-indent: 0em; white-space: normal; padding: 0px; color: rgb(148, 148, 147); background-color: rgb(255, 255, 255);\"><span style=\"font-size: 18px; font-family: 宋体, SimSun;\"><strong style=\"font-family: 微软雅黑, &#39;Microsoft YaHei&#39;; line-height: 24px;\">问：申请需要哪些材料？</strong></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-indent: 0em; white-space: normal; padding: 0px; color: rgb(148, 148, 147); line-height: 21px; background-color: rgb(255, 255, 255);\"><span style=\"font-family: 宋体, SimSun; line-height: 24px; text-indent: 2em; font-size: 18px;\">答：&nbsp;①个人身份证及复印件；</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-indent: 0em; white-space: normal; padding: 0px; color: rgb(148, 148, 147); line-height: 21px; background-color: rgb(255, 255, 255);\"><span style=\"line-height: 24px; text-indent: 2em; font-family: 宋体, SimSun; font-size: 18px;\">&nbsp; &nbsp; ②<span style=\"color: rgb(148, 148, 147); font-family: 宋体, SimSun; font-size: 18px; line-height: 24px; text-indent: 36px; background-color: rgb(255, 255, 255);\">户口本及复印件</span>；</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-indent: 0em; white-space: normal; padding: 0px; color: rgb(148, 148, 147); line-height: 21px; background-color: rgb(255, 255, 255);\"><span style=\"font-family: 宋体, SimSun; line-height: 24px; text-indent: 2em; font-size: 18px;\">&nbsp; &nbsp; ③房产证及复印件、持有车辆行驶证及复印件；</span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-indent: 0em; white-space: normal; padding: 0px; color: rgb(148, 148, 147); line-height: 21px; background-color: rgb(255, 255, 255);\"><span style=\"font-family: 宋体, SimSun; line-height: 24px; text-indent: 2em; font-size: 18px;\">&nbsp; &nbsp; ④其它材料。<br/></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; text-indent: 0em; white-space: normal; padding: 0px; color: rgb(148, 148, 147); line-height: 21px; background-color: rgb(255, 255, 255);\"><span style=\"font-family: 宋体, SimSun; line-height: 24px; text-indent: 2em; font-size: 18px;\"></span><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(148, 148, 147); white-space: normal; line-height: 21px; text-indent: 0em; background-color: rgb(255, 255, 255);\"><span style=\"font-family: 微软雅黑, &#39;Microsoft YaHei&#39;; line-height: 24px; text-indent: 2em; font-size: 16px;\"></span><br/></p>', '不可删除', null, null, null, '0', null, null, null, '0');
INSERT INTO `article` VALUES ('7', '资费说明', '资费说明', '不可删除', null, null, null, '0', null, null, null, '0');
INSERT INTO `article` VALUES ('8', '常见问题', '<p>常见问题</p>', '不可删除', null, null, null, '0', null, null, null, '0');

-- ----------------------------
-- Table structure for `china_areas`
-- ----------------------------
DROP TABLE IF EXISTS `china_areas`;
CREATE TABLE `china_areas` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `parent_id` int(11) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `zipcode` varchar(6) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='地区信息';

-- ----------------------------
-- Records of china_areas
-- ----------------------------
INSERT INTO `china_areas` VALUES ('2', '0', '北京', '0');
INSERT INTO `china_areas` VALUES ('3', '0', '天津', '0');
INSERT INTO `china_areas` VALUES ('4', '0', '河北', '0');
INSERT INTO `china_areas` VALUES ('5', '0', '山西', '0');
INSERT INTO `china_areas` VALUES ('6', '0', '内蒙古', '0');
INSERT INTO `china_areas` VALUES ('7', '0', '辽宁', '0');
INSERT INTO `china_areas` VALUES ('8', '0', '吉林', '0');
INSERT INTO `china_areas` VALUES ('9', '0', '黑龙江', '0');
INSERT INTO `china_areas` VALUES ('10', '0', '上海', '0');
INSERT INTO `china_areas` VALUES ('11', '0', '江苏', '0');
INSERT INTO `china_areas` VALUES ('12', '0', '浙江', '0');
INSERT INTO `china_areas` VALUES ('13', '0', '安徽', '0');
INSERT INTO `china_areas` VALUES ('14', '0', '福建', '0');
INSERT INTO `china_areas` VALUES ('15', '0', '江西', '0');
INSERT INTO `china_areas` VALUES ('16', '0', '山东', '0');
INSERT INTO `china_areas` VALUES ('17', '0', '河南', '0');
INSERT INTO `china_areas` VALUES ('18', '0', '湖北', '0');
INSERT INTO `china_areas` VALUES ('19', '0', '湖南', '0');
INSERT INTO `china_areas` VALUES ('20', '0', '广东', '0');
INSERT INTO `china_areas` VALUES ('21', '0', '广西', '0');
INSERT INTO `china_areas` VALUES ('22', '0', '海南', '0');
INSERT INTO `china_areas` VALUES ('23', '0', '重庆', '0');
INSERT INTO `china_areas` VALUES ('24', '0', '四川', '0');
INSERT INTO `china_areas` VALUES ('25', '0', '贵州', '0');
INSERT INTO `china_areas` VALUES ('26', '0', '云南', '0');
INSERT INTO `china_areas` VALUES ('27', '0', '西藏', '0');
INSERT INTO `china_areas` VALUES ('28', '0', '陕西', '0');
INSERT INTO `china_areas` VALUES ('29', '0', '甘肃', '0');
INSERT INTO `china_areas` VALUES ('30', '0', '青海', '0');
INSERT INTO `china_areas` VALUES ('31', '0', '宁夏', '0');
INSERT INTO `china_areas` VALUES ('32', '0', '新疆', '0');
INSERT INTO `china_areas` VALUES ('36', '2', '北京市', '0');
INSERT INTO `china_areas` VALUES ('37', '3', '天津市', '0');
INSERT INTO `china_areas` VALUES ('38', '4', '石家庄市', '0');
INSERT INTO `china_areas` VALUES ('39', '4', '唐山市', '0');
INSERT INTO `china_areas` VALUES ('40', '4', '秦皇岛市', '0');
INSERT INTO `china_areas` VALUES ('41', '4', '邯郸市', '0');
INSERT INTO `china_areas` VALUES ('42', '4', '邢台市', '0');
INSERT INTO `china_areas` VALUES ('43', '4', '保定市', '0');
INSERT INTO `china_areas` VALUES ('44', '4', '张家口市', '0');
INSERT INTO `china_areas` VALUES ('45', '4', '承德市', '0');
INSERT INTO `china_areas` VALUES ('46', '4', '沧州市', '0');
INSERT INTO `china_areas` VALUES ('47', '4', '廊坊市', '0');
INSERT INTO `china_areas` VALUES ('48', '4', '衡水市', '0');
INSERT INTO `china_areas` VALUES ('49', '5', '太原市', '0');
INSERT INTO `china_areas` VALUES ('50', '5', '大同市', '0');
INSERT INTO `china_areas` VALUES ('51', '5', '阳泉市', '0');
INSERT INTO `china_areas` VALUES ('52', '5', '长治市', '0');
INSERT INTO `china_areas` VALUES ('53', '5', '晋城市', '0');
INSERT INTO `china_areas` VALUES ('54', '5', '朔州市', '0');
INSERT INTO `china_areas` VALUES ('55', '5', '晋中市', '0');
INSERT INTO `china_areas` VALUES ('56', '5', '运城市', '0');
INSERT INTO `china_areas` VALUES ('57', '5', '忻州市', '0');
INSERT INTO `china_areas` VALUES ('58', '5', '临汾市', '0');
INSERT INTO `china_areas` VALUES ('59', '5', '吕梁市', '0');
INSERT INTO `china_areas` VALUES ('60', '6', '呼和浩特市', '0');
INSERT INTO `china_areas` VALUES ('61', '6', '包头市', '0');
INSERT INTO `china_areas` VALUES ('62', '6', '乌海市', '0');
INSERT INTO `china_areas` VALUES ('63', '6', '赤峰市', '0');
INSERT INTO `china_areas` VALUES ('64', '6', '通辽市', '0');
INSERT INTO `china_areas` VALUES ('65', '6', '鄂尔多斯市', '0');
INSERT INTO `china_areas` VALUES ('66', '6', '呼伦贝尔市', '0');
INSERT INTO `china_areas` VALUES ('67', '6', '巴彦淖尔市', '0');
INSERT INTO `china_areas` VALUES ('68', '6', '乌兰察布市', '0');
INSERT INTO `china_areas` VALUES ('69', '6', '兴安盟', '0');
INSERT INTO `china_areas` VALUES ('70', '6', '锡林郭勒盟', '0');
INSERT INTO `china_areas` VALUES ('71', '6', '阿拉善盟', '0');
INSERT INTO `china_areas` VALUES ('72', '7', '沈阳市', '0');
INSERT INTO `china_areas` VALUES ('73', '7', '大连市', '0');
INSERT INTO `china_areas` VALUES ('74', '7', '鞍山市', '0');
INSERT INTO `china_areas` VALUES ('75', '7', '抚顺市', '0');
INSERT INTO `china_areas` VALUES ('76', '7', '本溪市', '0');
INSERT INTO `china_areas` VALUES ('77', '7', '丹东市', '0');
INSERT INTO `china_areas` VALUES ('78', '7', '锦州市', '0');
INSERT INTO `china_areas` VALUES ('79', '7', '营口市', '0');
INSERT INTO `china_areas` VALUES ('80', '7', '阜新市', '0');
INSERT INTO `china_areas` VALUES ('81', '7', '辽阳市', '0');
INSERT INTO `china_areas` VALUES ('82', '7', '盘锦市', '0');
INSERT INTO `china_areas` VALUES ('83', '7', '铁岭市', '0');
INSERT INTO `china_areas` VALUES ('84', '7', '朝阳市', '0');
INSERT INTO `china_areas` VALUES ('85', '7', '葫芦岛市', '0');
INSERT INTO `china_areas` VALUES ('86', '8', '长春市', '0');
INSERT INTO `china_areas` VALUES ('87', '8', '吉林市', '0');
INSERT INTO `china_areas` VALUES ('88', '8', '四平市', '0');
INSERT INTO `china_areas` VALUES ('89', '8', '辽源市', '0');
INSERT INTO `china_areas` VALUES ('90', '8', '通化市', '0');
INSERT INTO `china_areas` VALUES ('91', '8', '白山市', '0');
INSERT INTO `china_areas` VALUES ('92', '8', '松原市', '0');
INSERT INTO `china_areas` VALUES ('93', '8', '白城市', '0');
INSERT INTO `china_areas` VALUES ('94', '8', '延边朝鲜族自治州', '0');
INSERT INTO `china_areas` VALUES ('95', '9', '哈尔滨市', '0');
INSERT INTO `china_areas` VALUES ('96', '9', '齐齐哈尔市', '0');
INSERT INTO `china_areas` VALUES ('97', '9', '鸡西市', '0');
INSERT INTO `china_areas` VALUES ('98', '9', '鹤岗市', '0');
INSERT INTO `china_areas` VALUES ('99', '9', '双鸭山市', '0');
INSERT INTO `china_areas` VALUES ('100', '9', '大庆市', '0');
INSERT INTO `china_areas` VALUES ('101', '9', '伊春市', '0');
INSERT INTO `china_areas` VALUES ('102', '9', '佳木斯市', '0');
INSERT INTO `china_areas` VALUES ('103', '9', '七台河市', '0');
INSERT INTO `china_areas` VALUES ('104', '9', '牡丹江市', '0');
INSERT INTO `china_areas` VALUES ('105', '9', '黑河市', '0');
INSERT INTO `china_areas` VALUES ('106', '9', '绥化市', '0');
INSERT INTO `china_areas` VALUES ('107', '9', '大兴安岭地区', '0');
INSERT INTO `china_areas` VALUES ('108', '10', '上海市', '0');
INSERT INTO `china_areas` VALUES ('109', '11', '南京市', '0');
INSERT INTO `china_areas` VALUES ('110', '11', '无锡市', '0');
INSERT INTO `china_areas` VALUES ('111', '11', '徐州市', '0');
INSERT INTO `china_areas` VALUES ('112', '11', '常州市', '0');
INSERT INTO `china_areas` VALUES ('113', '11', '苏州市', '0');
INSERT INTO `china_areas` VALUES ('114', '11', '南通市', '0');
INSERT INTO `china_areas` VALUES ('115', '11', '连云港市', '0');
INSERT INTO `china_areas` VALUES ('116', '11', '淮安市', '0');
INSERT INTO `china_areas` VALUES ('117', '11', '盐城市', '0');
INSERT INTO `china_areas` VALUES ('118', '11', '扬州市', '0');
INSERT INTO `china_areas` VALUES ('119', '11', '镇江市', '0');
INSERT INTO `china_areas` VALUES ('120', '11', '泰州市', '0');
INSERT INTO `china_areas` VALUES ('121', '11', '宿迁市', '0');
INSERT INTO `china_areas` VALUES ('122', '12', '杭州市', '0');
INSERT INTO `china_areas` VALUES ('123', '12', '宁波市', '0');
INSERT INTO `china_areas` VALUES ('124', '12', '温州市', '0');
INSERT INTO `china_areas` VALUES ('125', '12', '嘉兴市', '0');
INSERT INTO `china_areas` VALUES ('126', '12', '湖州市', '0');
INSERT INTO `china_areas` VALUES ('127', '12', '绍兴市', '0');
INSERT INTO `china_areas` VALUES ('128', '12', '金华市', '0');
INSERT INTO `china_areas` VALUES ('129', '12', '衢州市', '0');
INSERT INTO `china_areas` VALUES ('130', '12', '舟山市', '0');
INSERT INTO `china_areas` VALUES ('131', '12', '台州市', '0');
INSERT INTO `china_areas` VALUES ('132', '12', '丽水市', '0');
INSERT INTO `china_areas` VALUES ('133', '13', '合肥市', '0');
INSERT INTO `china_areas` VALUES ('134', '13', '芜湖市', '0');
INSERT INTO `china_areas` VALUES ('135', '13', '蚌埠市', '0');
INSERT INTO `china_areas` VALUES ('136', '13', '淮南市', '0');
INSERT INTO `china_areas` VALUES ('137', '13', '马鞍山市', '0');
INSERT INTO `china_areas` VALUES ('138', '13', '淮北市', '0');
INSERT INTO `china_areas` VALUES ('139', '13', '铜陵市', '0');
INSERT INTO `china_areas` VALUES ('140', '13', '安庆市', '0');
INSERT INTO `china_areas` VALUES ('141', '13', '黄山市', '0');
INSERT INTO `china_areas` VALUES ('142', '13', '滁州市', '0');
INSERT INTO `china_areas` VALUES ('143', '13', '阜阳市', '0');
INSERT INTO `china_areas` VALUES ('144', '13', '宿州市', '0');
INSERT INTO `china_areas` VALUES ('145', '13', '巢湖市', '0');
INSERT INTO `china_areas` VALUES ('146', '13', '六安市', '0');
INSERT INTO `china_areas` VALUES ('147', '13', '亳州市', '0');
INSERT INTO `china_areas` VALUES ('148', '13', '池州市', '0');
INSERT INTO `china_areas` VALUES ('149', '13', '宣城市', '0');
INSERT INTO `china_areas` VALUES ('150', '14', '福州市', '0');
INSERT INTO `china_areas` VALUES ('151', '14', '厦门市', '0');
INSERT INTO `china_areas` VALUES ('152', '14', '莆田市', '0');
INSERT INTO `china_areas` VALUES ('153', '14', '三明市', '0');
INSERT INTO `china_areas` VALUES ('154', '14', '泉州市', '0');
INSERT INTO `china_areas` VALUES ('155', '14', '漳州市', '0');
INSERT INTO `china_areas` VALUES ('156', '14', '南平市', '0');
INSERT INTO `china_areas` VALUES ('157', '14', '龙岩市', '0');
INSERT INTO `china_areas` VALUES ('158', '14', '宁德市', '0');
INSERT INTO `china_areas` VALUES ('159', '15', '南昌市', '0');
INSERT INTO `china_areas` VALUES ('160', '15', '景德镇市', '0');
INSERT INTO `china_areas` VALUES ('161', '15', '萍乡市', '0');
INSERT INTO `china_areas` VALUES ('162', '15', '九江市', '0');
INSERT INTO `china_areas` VALUES ('163', '15', '新余市', '0');
INSERT INTO `china_areas` VALUES ('164', '15', '鹰潭市', '0');
INSERT INTO `china_areas` VALUES ('165', '15', '赣州市', '0');
INSERT INTO `china_areas` VALUES ('166', '15', '吉安市', '0');
INSERT INTO `china_areas` VALUES ('167', '15', '宜春市', '0');
INSERT INTO `china_areas` VALUES ('168', '15', '抚州市', '0');
INSERT INTO `china_areas` VALUES ('169', '15', '上饶市', '0');
INSERT INTO `china_areas` VALUES ('170', '16', '济南市', '0');
INSERT INTO `china_areas` VALUES ('171', '16', '青岛市', '0');
INSERT INTO `china_areas` VALUES ('172', '16', '淄博市', '0');
INSERT INTO `china_areas` VALUES ('173', '16', '枣庄市', '0');
INSERT INTO `china_areas` VALUES ('174', '16', '东营市', '0');
INSERT INTO `china_areas` VALUES ('175', '16', '烟台市', '0');
INSERT INTO `china_areas` VALUES ('176', '16', '潍坊市', '0');
INSERT INTO `china_areas` VALUES ('177', '16', '济宁市', '0');
INSERT INTO `china_areas` VALUES ('178', '16', '泰安市', '0');
INSERT INTO `china_areas` VALUES ('179', '16', '威海市', '0');
INSERT INTO `china_areas` VALUES ('180', '16', '日照市', '0');
INSERT INTO `china_areas` VALUES ('181', '16', '莱芜市', '0');
INSERT INTO `china_areas` VALUES ('182', '16', '临沂市', '0');
INSERT INTO `china_areas` VALUES ('183', '16', '德州市', '0');
INSERT INTO `china_areas` VALUES ('184', '16', '聊城市', '0');
INSERT INTO `china_areas` VALUES ('185', '16', '滨州市', '0');
INSERT INTO `china_areas` VALUES ('186', '16', '菏泽市', '0');
INSERT INTO `china_areas` VALUES ('187', '17', '郑州市', '0');
INSERT INTO `china_areas` VALUES ('188', '17', '开封市', '0');
INSERT INTO `china_areas` VALUES ('189', '17', '洛阳市', '0');
INSERT INTO `china_areas` VALUES ('190', '17', '平顶山市', '0');
INSERT INTO `china_areas` VALUES ('191', '17', '安阳市', '0');
INSERT INTO `china_areas` VALUES ('192', '17', '鹤壁市', '0');
INSERT INTO `china_areas` VALUES ('193', '17', '新乡市', '0');
INSERT INTO `china_areas` VALUES ('194', '17', '焦作市', '0');
INSERT INTO `china_areas` VALUES ('195', '17', '济源市', '0');
INSERT INTO `china_areas` VALUES ('196', '17', '濮阳市', '0');
INSERT INTO `china_areas` VALUES ('197', '17', '许昌市', '0');
INSERT INTO `china_areas` VALUES ('198', '17', '漯河市', '0');
INSERT INTO `china_areas` VALUES ('199', '17', '三门峡市', '0');
INSERT INTO `china_areas` VALUES ('200', '17', '南阳市', '0');
INSERT INTO `china_areas` VALUES ('201', '17', '商丘市', '0');
INSERT INTO `china_areas` VALUES ('202', '17', '信阳市', '0');
INSERT INTO `china_areas` VALUES ('203', '17', '周口市', '0');
INSERT INTO `china_areas` VALUES ('204', '17', '驻马店市', '0');
INSERT INTO `china_areas` VALUES ('205', '18', '武汉市', '0');
INSERT INTO `china_areas` VALUES ('206', '18', '黄石市', '0');
INSERT INTO `china_areas` VALUES ('207', '18', '十堰市', '0');
INSERT INTO `china_areas` VALUES ('208', '18', '宜昌市', '0');
INSERT INTO `china_areas` VALUES ('209', '18', '襄阳市', '0');
INSERT INTO `china_areas` VALUES ('210', '18', '鄂州市', '0');
INSERT INTO `china_areas` VALUES ('211', '18', '荆门市', '0');
INSERT INTO `china_areas` VALUES ('212', '18', '孝感市', '0');
INSERT INTO `china_areas` VALUES ('213', '18', '荆州市', '0');
INSERT INTO `china_areas` VALUES ('214', '18', '黄冈市', '0');
INSERT INTO `china_areas` VALUES ('215', '18', '咸宁市', '0');
INSERT INTO `china_areas` VALUES ('216', '18', '随州市', '0');
INSERT INTO `china_areas` VALUES ('217', '18', '恩施土家族苗族自治州', '0');
INSERT INTO `china_areas` VALUES ('218', '18', '省直辖县级行政单位', '0');
INSERT INTO `china_areas` VALUES ('219', '19', '长沙市', '0');
INSERT INTO `china_areas` VALUES ('220', '19', '株洲市', '0');
INSERT INTO `china_areas` VALUES ('221', '19', '湘潭市', '0');
INSERT INTO `china_areas` VALUES ('222', '19', '衡阳市', '0');
INSERT INTO `china_areas` VALUES ('223', '19', '邵阳市', '0');
INSERT INTO `china_areas` VALUES ('224', '19', '岳阳市', '0');
INSERT INTO `china_areas` VALUES ('225', '19', '常德市', '0');
INSERT INTO `china_areas` VALUES ('226', '19', '张家界市', '0');
INSERT INTO `china_areas` VALUES ('227', '19', '益阳市', '0');
INSERT INTO `china_areas` VALUES ('228', '19', '郴州市', '0');
INSERT INTO `china_areas` VALUES ('229', '19', '永州市', '0');
INSERT INTO `china_areas` VALUES ('230', '19', '怀化市', '0');
INSERT INTO `china_areas` VALUES ('231', '19', '娄底市', '0');
INSERT INTO `china_areas` VALUES ('232', '19', '湘西土家族苗族自治州', '0');
INSERT INTO `china_areas` VALUES ('233', '20', '广州市', '0');
INSERT INTO `china_areas` VALUES ('234', '20', '韶关市', '0');
INSERT INTO `china_areas` VALUES ('235', '20', '深圳市', '0');
INSERT INTO `china_areas` VALUES ('236', '20', '珠海市', '0');
INSERT INTO `china_areas` VALUES ('237', '20', '汕头市', '0');
INSERT INTO `china_areas` VALUES ('238', '20', '佛山市', '0');
INSERT INTO `china_areas` VALUES ('239', '20', '江门市', '0');
INSERT INTO `china_areas` VALUES ('240', '20', '湛江市', '0');
INSERT INTO `china_areas` VALUES ('241', '20', '茂名市', '0');
INSERT INTO `china_areas` VALUES ('242', '20', '肇庆市', '0');
INSERT INTO `china_areas` VALUES ('243', '20', '惠州市', '0');
INSERT INTO `china_areas` VALUES ('244', '20', '梅州市', '0');
INSERT INTO `china_areas` VALUES ('245', '20', '汕尾市', '0');
INSERT INTO `china_areas` VALUES ('246', '20', '河源市', '0');
INSERT INTO `china_areas` VALUES ('247', '20', '阳江市', '0');
INSERT INTO `china_areas` VALUES ('248', '20', '清远市', '0');
INSERT INTO `china_areas` VALUES ('249', '20', '潮州市', '0');
INSERT INTO `china_areas` VALUES ('250', '20', '揭阳市', '0');
INSERT INTO `china_areas` VALUES ('251', '20', '云浮市', '0');
INSERT INTO `china_areas` VALUES ('252', '20', '东莞市', '0');
INSERT INTO `china_areas` VALUES ('253', '20', '中山市', '0');
INSERT INTO `china_areas` VALUES ('254', '21', '南宁市', '0');
INSERT INTO `china_areas` VALUES ('255', '21', '柳州市', '0');
INSERT INTO `china_areas` VALUES ('256', '21', '桂林市', '0');
INSERT INTO `china_areas` VALUES ('257', '21', '梧州市', '0');
INSERT INTO `china_areas` VALUES ('258', '21', '北海市', '0');
INSERT INTO `china_areas` VALUES ('259', '21', '防城港市', '0');
INSERT INTO `china_areas` VALUES ('260', '21', '钦州市', '0');
INSERT INTO `china_areas` VALUES ('261', '21', '贵港市', '0');
INSERT INTO `china_areas` VALUES ('262', '21', '玉林市', '0');
INSERT INTO `china_areas` VALUES ('263', '21', '百色市', '0');
INSERT INTO `china_areas` VALUES ('264', '21', '贺州市', '0');
INSERT INTO `china_areas` VALUES ('265', '21', '河池市', '0');
INSERT INTO `china_areas` VALUES ('266', '21', '来宾市', '0');
INSERT INTO `china_areas` VALUES ('267', '21', '崇左市', '0');
INSERT INTO `china_areas` VALUES ('268', '22', '海口市', '0');
INSERT INTO `china_areas` VALUES ('269', '22', '省直辖县级行政单位', '0');
INSERT INTO `china_areas` VALUES ('270', '22', '三亚市', '0');
INSERT INTO `china_areas` VALUES ('271', '23', '重庆市', '0');
INSERT INTO `china_areas` VALUES ('272', '24', '成都市', '0');
INSERT INTO `china_areas` VALUES ('273', '24', '自贡市', '0');
INSERT INTO `china_areas` VALUES ('274', '24', '攀枝花市', '0');
INSERT INTO `china_areas` VALUES ('275', '24', '泸州市', '0');
INSERT INTO `china_areas` VALUES ('276', '24', '德阳市', '0');
INSERT INTO `china_areas` VALUES ('277', '24', '绵阳市', '0');
INSERT INTO `china_areas` VALUES ('278', '24', '广元市', '0');
INSERT INTO `china_areas` VALUES ('279', '24', '遂宁市', '0');
INSERT INTO `china_areas` VALUES ('280', '24', '内江市', '0');
INSERT INTO `china_areas` VALUES ('281', '24', '乐山市', '0');
INSERT INTO `china_areas` VALUES ('282', '24', '南充市', '0');
INSERT INTO `china_areas` VALUES ('283', '24', '眉山市', '0');
INSERT INTO `china_areas` VALUES ('284', '24', '宜宾市', '0');
INSERT INTO `china_areas` VALUES ('285', '24', '广安市', '0');
INSERT INTO `china_areas` VALUES ('286', '24', '达州市', '0');
INSERT INTO `china_areas` VALUES ('287', '24', '雅安市', '0');
INSERT INTO `china_areas` VALUES ('288', '24', '巴中市', '0');
INSERT INTO `china_areas` VALUES ('289', '24', '资阳市', '0');
INSERT INTO `china_areas` VALUES ('290', '24', '阿坝藏族羌族自治州', '0');
INSERT INTO `china_areas` VALUES ('291', '24', '甘孜藏族自治州', '0');
INSERT INTO `china_areas` VALUES ('292', '24', '凉山彝族自治州', '0');
INSERT INTO `china_areas` VALUES ('293', '25', '贵阳市', '0');
INSERT INTO `china_areas` VALUES ('294', '25', '六盘水市', '0');
INSERT INTO `china_areas` VALUES ('295', '25', '遵义市', '0');
INSERT INTO `china_areas` VALUES ('296', '25', '安顺市', '0');
INSERT INTO `china_areas` VALUES ('297', '25', '铜仁地区', '0');
INSERT INTO `china_areas` VALUES ('298', '25', '黔西南布依族苗族自治州', '0');
INSERT INTO `china_areas` VALUES ('299', '25', '毕节地区', '0');
INSERT INTO `china_areas` VALUES ('300', '25', '黔东南苗族侗族自治州', '0');
INSERT INTO `china_areas` VALUES ('301', '25', '黔南布依族苗族自治州', '0');
INSERT INTO `china_areas` VALUES ('302', '26', '昆明市', '0');
INSERT INTO `china_areas` VALUES ('303', '26', '曲靖市', '0');
INSERT INTO `china_areas` VALUES ('304', '26', '玉溪市', '0');
INSERT INTO `china_areas` VALUES ('305', '26', '保山市', '0');
INSERT INTO `china_areas` VALUES ('306', '26', '昭通市', '0');
INSERT INTO `china_areas` VALUES ('307', '26', '丽江市', '0');
INSERT INTO `china_areas` VALUES ('308', '26', '普洱市', '0');
INSERT INTO `china_areas` VALUES ('309', '26', '临沧市', '0');
INSERT INTO `china_areas` VALUES ('310', '26', '楚雄彝族自治州', '0');
INSERT INTO `china_areas` VALUES ('311', '26', '红河哈尼族彝族自治州', '0');
INSERT INTO `china_areas` VALUES ('312', '26', '文山壮族苗族自治州', '0');
INSERT INTO `china_areas` VALUES ('313', '26', '西双版纳傣族自治州', '0');
INSERT INTO `china_areas` VALUES ('314', '26', '大理白族自治州', '0');
INSERT INTO `china_areas` VALUES ('315', '26', '德宏傣族景颇族自治州', '0');
INSERT INTO `china_areas` VALUES ('316', '26', '怒江傈僳族自治州', '0');
INSERT INTO `china_areas` VALUES ('317', '26', '迪庆藏族自治州', '0');
INSERT INTO `china_areas` VALUES ('318', '27', '拉萨市', '0');
INSERT INTO `china_areas` VALUES ('319', '27', '昌都地区', '0');
INSERT INTO `china_areas` VALUES ('320', '27', '山南地区', '0');
INSERT INTO `china_areas` VALUES ('321', '27', '日喀则地区', '0');
INSERT INTO `china_areas` VALUES ('322', '27', '那曲地区', '0');
INSERT INTO `china_areas` VALUES ('323', '27', '阿里地区', '0');
INSERT INTO `china_areas` VALUES ('324', '27', '林芝地区', '0');
INSERT INTO `china_areas` VALUES ('325', '28', '西安市', '0');
INSERT INTO `china_areas` VALUES ('326', '28', '铜川市', '0');
INSERT INTO `china_areas` VALUES ('327', '28', '宝鸡市', '0');
INSERT INTO `china_areas` VALUES ('328', '28', '咸阳市', '0');
INSERT INTO `china_areas` VALUES ('329', '28', '渭南市', '0');
INSERT INTO `china_areas` VALUES ('330', '28', '延安市', '0');
INSERT INTO `china_areas` VALUES ('331', '28', '汉中市', '0');
INSERT INTO `china_areas` VALUES ('332', '28', '榆林市', '0');
INSERT INTO `china_areas` VALUES ('333', '28', '安康市', '0');
INSERT INTO `china_areas` VALUES ('334', '28', '商洛市', '0');
INSERT INTO `china_areas` VALUES ('335', '29', '兰州市', '0');
INSERT INTO `china_areas` VALUES ('336', '29', '嘉峪关市', '0');
INSERT INTO `china_areas` VALUES ('337', '29', '金昌市', '0');
INSERT INTO `china_areas` VALUES ('338', '29', '白银市', '0');
INSERT INTO `china_areas` VALUES ('339', '29', '天水市', '0');
INSERT INTO `china_areas` VALUES ('340', '29', '武威市', '0');
INSERT INTO `china_areas` VALUES ('341', '29', '张掖市', '0');
INSERT INTO `china_areas` VALUES ('342', '29', '平凉市', '0');
INSERT INTO `china_areas` VALUES ('343', '29', '酒泉市', '0');
INSERT INTO `china_areas` VALUES ('344', '29', '庆阳市', '0');
INSERT INTO `china_areas` VALUES ('345', '29', '定西市', '0');
INSERT INTO `china_areas` VALUES ('346', '29', '陇南市', '0');
INSERT INTO `china_areas` VALUES ('347', '29', '临夏回族自治州', '0');
INSERT INTO `china_areas` VALUES ('348', '29', '甘南藏族自治州', '0');
INSERT INTO `china_areas` VALUES ('349', '30', '西宁市', '0');
INSERT INTO `china_areas` VALUES ('350', '30', '海东地区', '0');
INSERT INTO `china_areas` VALUES ('351', '30', '海北藏族自治州', '0');
INSERT INTO `china_areas` VALUES ('352', '30', '黄南藏族自治州', '0');
INSERT INTO `china_areas` VALUES ('353', '30', '海南藏族自治州', '0');
INSERT INTO `china_areas` VALUES ('354', '30', '果洛藏族自治州', '0');
INSERT INTO `china_areas` VALUES ('355', '30', '玉树藏族自治州', '0');
INSERT INTO `china_areas` VALUES ('356', '30', '海西蒙古族藏族自治州', '0');
INSERT INTO `china_areas` VALUES ('357', '31', '银川市', '0');
INSERT INTO `china_areas` VALUES ('358', '31', '石嘴山市', '0');
INSERT INTO `china_areas` VALUES ('359', '31', '吴忠市', '0');
INSERT INTO `china_areas` VALUES ('360', '31', '固原市', '0');
INSERT INTO `china_areas` VALUES ('361', '31', '中卫市', '0');
INSERT INTO `china_areas` VALUES ('362', '32', '乌鲁木齐市', '0');
INSERT INTO `china_areas` VALUES ('363', '32', '克拉玛依市', '0');
INSERT INTO `china_areas` VALUES ('364', '32', '吐鲁番地区', '0');
INSERT INTO `china_areas` VALUES ('365', '32', '哈密地区', '0');
INSERT INTO `china_areas` VALUES ('366', '32', '昌吉回族自治州', '0');
INSERT INTO `china_areas` VALUES ('367', '32', '博尔塔拉蒙古自治州', '0');
INSERT INTO `china_areas` VALUES ('368', '32', '巴音郭楞蒙古自治州', '0');
INSERT INTO `china_areas` VALUES ('369', '32', '阿克苏地区', '0');
INSERT INTO `china_areas` VALUES ('370', '32', '克孜勒苏柯尔克孜自治州', '0');
INSERT INTO `china_areas` VALUES ('371', '32', '喀什地区', '0');
INSERT INTO `china_areas` VALUES ('372', '32', '和田地区', '0');
INSERT INTO `china_areas` VALUES ('373', '32', '伊犁哈萨克自治州', '0');
INSERT INTO `china_areas` VALUES ('374', '32', '塔城地区', '0');
INSERT INTO `china_areas` VALUES ('375', '32', '阿勒泰地区', '0');
INSERT INTO `china_areas` VALUES ('376', '32', '省直辖县级行政单位', '0');
INSERT INTO `china_areas` VALUES ('377', '36', '东城区', '100011');
INSERT INTO `china_areas` VALUES ('378', '36', '西城区', '100032');
INSERT INTO `china_areas` VALUES ('379', '36', '崇文区', '100061');
INSERT INTO `china_areas` VALUES ('380', '36', '宣武区', '100054');
INSERT INTO `china_areas` VALUES ('381', '36', '朝阳区', '100020');
INSERT INTO `china_areas` VALUES ('382', '36', '丰台区', '100071');
INSERT INTO `china_areas` VALUES ('383', '36', '石景山区', '100043');
INSERT INTO `china_areas` VALUES ('384', '36', '海淀区', '100089');
INSERT INTO `china_areas` VALUES ('385', '36', '门头沟区', '102300');
INSERT INTO `china_areas` VALUES ('386', '36', '房山区', '102488');
INSERT INTO `china_areas` VALUES ('387', '36', '通州区', '101100');
INSERT INTO `china_areas` VALUES ('388', '36', '顺义区', '101300');
INSERT INTO `china_areas` VALUES ('389', '36', '昌平区', '102200');
INSERT INTO `china_areas` VALUES ('390', '36', '大兴区', '102600');
INSERT INTO `china_areas` VALUES ('391', '36', '怀柔区', '101400');
INSERT INTO `china_areas` VALUES ('392', '36', '平谷区', '101200');
INSERT INTO `china_areas` VALUES ('393', '36', '密云县', '101500');
INSERT INTO `china_areas` VALUES ('394', '36', '延庆县', '102100');
INSERT INTO `china_areas` VALUES ('395', '37', '和平区', '300041');
INSERT INTO `china_areas` VALUES ('396', '37', '河东区', '300171');
INSERT INTO `china_areas` VALUES ('397', '37', '河西区', '300202');
INSERT INTO `china_areas` VALUES ('398', '37', '南开区', '300100');
INSERT INTO `china_areas` VALUES ('399', '37', '河北区', '300143');
INSERT INTO `china_areas` VALUES ('400', '37', '红桥区', '300131');
INSERT INTO `china_areas` VALUES ('401', '37', '塘沽区', '300450');
INSERT INTO `china_areas` VALUES ('402', '37', '汉沽区', '300480');
INSERT INTO `china_areas` VALUES ('403', '37', '大港区', '300270');
INSERT INTO `china_areas` VALUES ('404', '37', '东丽区', '300300');
INSERT INTO `china_areas` VALUES ('405', '37', '西青区', '300380');
INSERT INTO `china_areas` VALUES ('406', '37', '津南区', '300350');
INSERT INTO `china_areas` VALUES ('407', '37', '北辰区', '300400');
INSERT INTO `china_areas` VALUES ('408', '37', '武清区', '301700');
INSERT INTO `china_areas` VALUES ('409', '37', '宝坻区', '301800');
INSERT INTO `china_areas` VALUES ('410', '37', '宁河县', '301500');
INSERT INTO `china_areas` VALUES ('411', '37', '静海县', '301600');
INSERT INTO `china_areas` VALUES ('412', '37', '蓟县', '301900');
INSERT INTO `china_areas` VALUES ('413', '37', '保税区', '300308');
INSERT INTO `china_areas` VALUES ('414', '37', '经济技术开发区', '300457');
INSERT INTO `china_areas` VALUES ('415', '37', '高新区', '300384');
INSERT INTO `china_areas` VALUES ('416', '37', '滨海新区', '300457');
INSERT INTO `china_areas` VALUES ('417', '38', '长安区', '050011');
INSERT INTO `china_areas` VALUES ('418', '38', '桥东区', '050011');
INSERT INTO `china_areas` VALUES ('419', '38', '桥西区', '050051');
INSERT INTO `china_areas` VALUES ('420', '38', '新华区', '050051');
INSERT INTO `china_areas` VALUES ('421', '38', '井陉矿区', '050100');
INSERT INTO `china_areas` VALUES ('422', '38', '裕华区', '050081');
INSERT INTO `china_areas` VALUES ('423', '38', '井陉县', '050300');
INSERT INTO `china_areas` VALUES ('424', '38', '正定县', '050800');
INSERT INTO `china_areas` VALUES ('425', '38', '栾城县', '051430');
INSERT INTO `china_areas` VALUES ('426', '38', '行唐县', '050600');
INSERT INTO `china_areas` VALUES ('427', '38', '灵寿县', '050500');
INSERT INTO `china_areas` VALUES ('428', '38', '高邑县', '051330');
INSERT INTO `china_areas` VALUES ('429', '38', '深泽县', '052560');
INSERT INTO `china_areas` VALUES ('430', '38', '赞皇县', '051230');
INSERT INTO `china_areas` VALUES ('431', '38', '无极县', '052400');
INSERT INTO `china_areas` VALUES ('432', '38', '平山县', '050400');
INSERT INTO `china_areas` VALUES ('433', '38', '元氏县', '051130');
INSERT INTO `china_areas` VALUES ('434', '38', '赵县', '051530');
INSERT INTO `china_areas` VALUES ('435', '38', '辛集市', '052300');
INSERT INTO `china_areas` VALUES ('436', '38', '藁城市', '052160');
INSERT INTO `china_areas` VALUES ('437', '38', '晋州市', '052200');
INSERT INTO `china_areas` VALUES ('438', '38', '新乐市', '050700');
INSERT INTO `china_areas` VALUES ('439', '38', '鹿泉市', '050200');
INSERT INTO `china_areas` VALUES ('440', '38', '高新技术开发区', '050035');
INSERT INTO `china_areas` VALUES ('441', '39', '路南区', '063017');
INSERT INTO `china_areas` VALUES ('442', '39', '路北区', '063015');
INSERT INTO `china_areas` VALUES ('443', '39', '古冶区', '063104');
INSERT INTO `china_areas` VALUES ('444', '39', '开平区', '063021');
INSERT INTO `china_areas` VALUES ('445', '39', '丰南区', '063300');
INSERT INTO `china_areas` VALUES ('446', '39', '丰润区', '064000');
INSERT INTO `china_areas` VALUES ('447', '39', '滦县', '063700');
INSERT INTO `china_areas` VALUES ('448', '39', '滦南县', '063500');
INSERT INTO `china_areas` VALUES ('449', '39', '乐亭县', '063600');
INSERT INTO `china_areas` VALUES ('450', '39', '迁西县', '064300');
INSERT INTO `china_areas` VALUES ('451', '39', '玉田县', '064100');
INSERT INTO `china_areas` VALUES ('452', '39', '唐海县', '063200');
INSERT INTO `china_areas` VALUES ('453', '39', '遵化市', '064200');
INSERT INTO `china_areas` VALUES ('454', '39', '迁安市', '064400');
INSERT INTO `china_areas` VALUES ('455', '39', '高新区', '063020');
INSERT INTO `china_areas` VALUES ('456', '39', '汉沽管理区', '301501');
INSERT INTO `china_areas` VALUES ('457', '39', '海港开发区', '063600');
INSERT INTO `china_areas` VALUES ('458', '39', '芦台开发区', '301501');
INSERT INTO `china_areas` VALUES ('459', '39', '南堡开发区', '063305');
INSERT INTO `china_areas` VALUES ('460', '39', '曹妃甸工业区', '063200');
INSERT INTO `china_areas` VALUES ('461', '40', '海港区', '066000');
INSERT INTO `china_areas` VALUES ('462', '40', '山海关区', '066200');
INSERT INTO `china_areas` VALUES ('463', '40', '北戴河区', '066100');
INSERT INTO `china_areas` VALUES ('464', '40', '青龙满族自治县', '066500');
INSERT INTO `china_areas` VALUES ('465', '40', '昌黎县', '066600');
INSERT INTO `china_areas` VALUES ('466', '40', '抚宁县', '066300');
INSERT INTO `china_areas` VALUES ('467', '40', '卢龙县', '066400');
INSERT INTO `china_areas` VALUES ('468', '40', '经济技术开发区', '066004');
INSERT INTO `china_areas` VALUES ('469', '41', '邯山区', '056001');
INSERT INTO `china_areas` VALUES ('470', '41', '丛台区', '056004');
INSERT INTO `china_areas` VALUES ('471', '41', '复兴区', '056003');
INSERT INTO `china_areas` VALUES ('472', '41', '峰峰矿区', '056200');
INSERT INTO `china_areas` VALUES ('473', '41', '邯郸县', '056100');
INSERT INTO `china_areas` VALUES ('474', '41', '临漳县', '056600');
INSERT INTO `china_areas` VALUES ('475', '41', '成安县', '056700');
INSERT INTO `china_areas` VALUES ('476', '41', '大名县', '056900');
INSERT INTO `china_areas` VALUES ('477', '41', '涉县', '056400');
INSERT INTO `china_areas` VALUES ('478', '41', '磁县', '056500');
INSERT INTO `china_areas` VALUES ('479', '41', '肥乡县', '057550');
INSERT INTO `china_areas` VALUES ('480', '41', '永年县', '057150');
INSERT INTO `china_areas` VALUES ('481', '41', '邱县', '057450');
INSERT INTO `china_areas` VALUES ('482', '41', '鸡泽县', '057350');
INSERT INTO `china_areas` VALUES ('483', '41', '广平县', '057650');
INSERT INTO `china_areas` VALUES ('484', '41', '馆陶县', '057750');
INSERT INTO `china_areas` VALUES ('485', '41', '魏县', '056800');
INSERT INTO `china_areas` VALUES ('486', '41', '曲周县', '057250');
INSERT INTO `china_areas` VALUES ('487', '41', '武安市', '056300');
INSERT INTO `china_areas` VALUES ('488', '41', '经济开发区', '056002');
INSERT INTO `china_areas` VALUES ('489', '42', '桥东区', '054001');
INSERT INTO `china_areas` VALUES ('490', '42', '桥西区', '054000');
INSERT INTO `china_areas` VALUES ('491', '42', '邢台县', '054001');
INSERT INTO `china_areas` VALUES ('492', '42', '临城县', '054300');
INSERT INTO `china_areas` VALUES ('493', '42', '内丘县', '054200');
INSERT INTO `china_areas` VALUES ('494', '42', '柏乡县', '055450');
INSERT INTO `china_areas` VALUES ('495', '42', '隆尧县', '055350');
INSERT INTO `china_areas` VALUES ('496', '42', '任县', '055150');
INSERT INTO `china_areas` VALUES ('497', '42', '南和县', '054400');
INSERT INTO `china_areas` VALUES ('498', '42', '宁晋县', '055550');
INSERT INTO `china_areas` VALUES ('499', '42', '巨鹿县', '055250');
INSERT INTO `china_areas` VALUES ('500', '42', '新河县', '051730');
INSERT INTO `china_areas` VALUES ('501', '42', '广宗县', '054600');
INSERT INTO `china_areas` VALUES ('502', '42', '平乡县', '054500');
INSERT INTO `china_areas` VALUES ('503', '42', '威县', '054700');
INSERT INTO `china_areas` VALUES ('504', '42', '清河县', '054800');
INSERT INTO `china_areas` VALUES ('505', '42', '临西县', '054900');
INSERT INTO `china_areas` VALUES ('506', '42', '南宫市', '055750');
INSERT INTO `china_areas` VALUES ('507', '42', '沙河市', '054100');
INSERT INTO `china_areas` VALUES ('508', '43', '新市区', '071052');
INSERT INTO `china_areas` VALUES ('509', '43', '南市区', '071000');
INSERT INTO `china_areas` VALUES ('510', '43', '北市区', '071000');
INSERT INTO `china_areas` VALUES ('511', '43', '满城县', '072150');
INSERT INTO `china_areas` VALUES ('512', '43', '清苑县', '071100');
INSERT INTO `china_areas` VALUES ('513', '43', '涞水县', '074100');
INSERT INTO `china_areas` VALUES ('514', '43', '阜平县', '073200');
INSERT INTO `china_areas` VALUES ('515', '43', '徐水县', '072550');
INSERT INTO `china_areas` VALUES ('516', '43', '定兴县', '072650');
INSERT INTO `china_areas` VALUES ('517', '43', '唐县', '072350');
INSERT INTO `china_areas` VALUES ('518', '43', '高阳县', '071500');
INSERT INTO `china_areas` VALUES ('519', '43', '容城县', '071700');
INSERT INTO `china_areas` VALUES ('520', '43', '涞源县', '074300');
INSERT INTO `china_areas` VALUES ('521', '43', '望都县', '072450');
INSERT INTO `china_areas` VALUES ('522', '43', '安新县', '071600');
INSERT INTO `china_areas` VALUES ('523', '43', '易县', '074200');
INSERT INTO `china_areas` VALUES ('524', '43', '曲阳县', '073100');
INSERT INTO `china_areas` VALUES ('525', '43', '蠡县', '071400');
INSERT INTO `china_areas` VALUES ('526', '43', '顺平县', '072250');
INSERT INTO `china_areas` VALUES ('527', '43', '博野县', '071300');
INSERT INTO `china_areas` VALUES ('528', '43', '雄县', '071800');
INSERT INTO `china_areas` VALUES ('529', '43', '涿州市', '072750');
INSERT INTO `china_areas` VALUES ('530', '43', '定州市', '073000');
INSERT INTO `china_areas` VALUES ('531', '43', '安国市', '071200');
INSERT INTO `china_areas` VALUES ('532', '43', '高碑店市', '074000');
INSERT INTO `china_areas` VALUES ('533', '44', '桥东区', '075000');
INSERT INTO `china_areas` VALUES ('534', '44', '桥西区', '075061');
INSERT INTO `china_areas` VALUES ('535', '44', '宣化区', '075100');
INSERT INTO `china_areas` VALUES ('536', '44', '下花园区', '075300');
INSERT INTO `china_areas` VALUES ('537', '44', '宣化县', '075100');
INSERT INTO `china_areas` VALUES ('538', '44', '张北县', '076450');
INSERT INTO `china_areas` VALUES ('539', '44', '康保县', '076650');
INSERT INTO `china_areas` VALUES ('540', '44', '沽源县', '076550');
INSERT INTO `china_areas` VALUES ('541', '44', '尚义县', '076750');
INSERT INTO `china_areas` VALUES ('542', '44', '蔚县', '075700');
INSERT INTO `china_areas` VALUES ('543', '44', '阳原县', '075800');
INSERT INTO `china_areas` VALUES ('544', '44', '怀安县', '076150');
INSERT INTO `china_areas` VALUES ('545', '44', '万全县', '076250');
INSERT INTO `china_areas` VALUES ('546', '44', '怀来县', '075400');
INSERT INTO `china_areas` VALUES ('547', '44', '涿鹿县', '075600');
INSERT INTO `china_areas` VALUES ('548', '44', '赤城县', '075500');
INSERT INTO `china_areas` VALUES ('549', '44', '崇礼县', '076350');
INSERT INTO `china_areas` VALUES ('550', '45', '双桥区', '067000');
INSERT INTO `china_areas` VALUES ('551', '45', '双滦区', '067000');
INSERT INTO `china_areas` VALUES ('552', '45', '鹰手营子矿区', '067200');
INSERT INTO `china_areas` VALUES ('553', '45', '承德县', '067400');
INSERT INTO `china_areas` VALUES ('554', '45', '兴隆县', '067300');
INSERT INTO `china_areas` VALUES ('555', '45', '平泉县', '067500');
INSERT INTO `china_areas` VALUES ('556', '45', '滦平县', '068250');
INSERT INTO `china_areas` VALUES ('557', '45', '隆化县', '068150');
INSERT INTO `china_areas` VALUES ('558', '45', '丰宁满族自治县', '068350');
INSERT INTO `china_areas` VALUES ('559', '45', '宽城满族自治县', '067600');
INSERT INTO `china_areas` VALUES ('560', '45', '围场满族蒙古族自治县', '068450');
INSERT INTO `china_areas` VALUES ('561', '46', '新华区', '061000');
INSERT INTO `china_areas` VALUES ('562', '46', '运河区', '061000');
INSERT INTO `china_areas` VALUES ('563', '46', '沧县', '061000');
INSERT INTO `china_areas` VALUES ('564', '46', '青县', '062650');
INSERT INTO `china_areas` VALUES ('565', '46', '东光县', '061600');
INSERT INTO `china_areas` VALUES ('566', '46', '海兴县', '061200');
INSERT INTO `china_areas` VALUES ('567', '46', '盐山县', '061300');
INSERT INTO `china_areas` VALUES ('568', '46', '肃宁县', '062350');
INSERT INTO `china_areas` VALUES ('569', '46', '南皮县', '061500');
INSERT INTO `china_areas` VALUES ('570', '46', '吴桥县', '061800');
INSERT INTO `china_areas` VALUES ('571', '46', '献县', '062250');
INSERT INTO `china_areas` VALUES ('572', '46', '孟村回族自治县', '061400');
INSERT INTO `china_areas` VALUES ('573', '46', '泊头市', '062150');
INSERT INTO `china_areas` VALUES ('574', '46', '任丘市', '062550');
INSERT INTO `china_areas` VALUES ('575', '46', '黄骅市', '061100');
INSERT INTO `china_areas` VALUES ('576', '46', '河间市', '062450');
INSERT INTO `china_areas` VALUES ('577', '47', '安次区', '065000');
INSERT INTO `china_areas` VALUES ('578', '47', '广阳区', '065000');
INSERT INTO `china_areas` VALUES ('579', '47', '固安县', '065500');
INSERT INTO `china_areas` VALUES ('580', '47', '永清县', '065600');
INSERT INTO `china_areas` VALUES ('581', '47', '香河县', '065400');
INSERT INTO `china_areas` VALUES ('582', '47', '大城县', '065900');
INSERT INTO `china_areas` VALUES ('583', '47', '文安县', '065800');
INSERT INTO `china_areas` VALUES ('584', '47', '大厂回族自治县', '065300');
INSERT INTO `china_areas` VALUES ('585', '47', '霸州市', '065700');
INSERT INTO `china_areas` VALUES ('586', '47', '三河市', '065200');
INSERT INTO `china_areas` VALUES ('587', '47', '开发区', '065001');
INSERT INTO `china_areas` VALUES ('588', '48', '桃城区', '053000');
INSERT INTO `china_areas` VALUES ('589', '48', '枣强县', '053100');
INSERT INTO `china_areas` VALUES ('590', '48', '武邑县', '053400');
INSERT INTO `china_areas` VALUES ('591', '48', '武强县', '053300');
INSERT INTO `china_areas` VALUES ('592', '48', '饶阳县', '053900');
INSERT INTO `china_areas` VALUES ('593', '48', '安平县', '053600');
INSERT INTO `china_areas` VALUES ('594', '48', '故城县', '253800');
INSERT INTO `china_areas` VALUES ('595', '48', '景县', '053500');
INSERT INTO `china_areas` VALUES ('596', '48', '阜城县', '053700');
INSERT INTO `china_areas` VALUES ('597', '48', '冀州市', '053200');
INSERT INTO `china_areas` VALUES ('598', '48', '深州市', '053800');
INSERT INTO `china_areas` VALUES ('599', '49', '小店区', '030032');
INSERT INTO `china_areas` VALUES ('600', '49', '迎泽区', '030024');
INSERT INTO `china_areas` VALUES ('601', '49', '杏花岭区', '030001');
INSERT INTO `china_areas` VALUES ('602', '49', '尖草坪区', '030003');
INSERT INTO `china_areas` VALUES ('603', '49', '万柏林区', '030027');
INSERT INTO `china_areas` VALUES ('604', '49', '晋源区', '030025');
INSERT INTO `china_areas` VALUES ('605', '49', '清徐县', '030400');
INSERT INTO `china_areas` VALUES ('606', '49', '阳曲县', '030100');
INSERT INTO `china_areas` VALUES ('607', '49', '娄烦县', '030300');
INSERT INTO `china_areas` VALUES ('608', '49', '古交市', '030200');
INSERT INTO `china_areas` VALUES ('609', '50', '城区', '037008');
INSERT INTO `china_areas` VALUES ('610', '50', '矿区', '037001');
INSERT INTO `china_areas` VALUES ('611', '50', '南郊区', '037001');
INSERT INTO `china_areas` VALUES ('612', '50', '新荣区', '037002');
INSERT INTO `china_areas` VALUES ('613', '50', '阳高县', '038100');
INSERT INTO `china_areas` VALUES ('614', '50', '天镇县', '038200');
INSERT INTO `china_areas` VALUES ('615', '50', '广灵县', '037500');
INSERT INTO `china_areas` VALUES ('616', '50', '灵丘县', '034400');
INSERT INTO `china_areas` VALUES ('617', '50', '浑源县', '037400');
INSERT INTO `china_areas` VALUES ('618', '50', '左云县', '037100');
INSERT INTO `china_areas` VALUES ('619', '50', '大同县', '037300');
INSERT INTO `china_areas` VALUES ('620', '51', '城区', '045000');
INSERT INTO `china_areas` VALUES ('621', '51', '矿区', '045000');
INSERT INTO `china_areas` VALUES ('622', '51', '郊区', '045011');
INSERT INTO `china_areas` VALUES ('623', '51', '平定县', '045200');
INSERT INTO `china_areas` VALUES ('624', '51', '盂县', '045100');
INSERT INTO `china_areas` VALUES ('625', '52', '城区', '046011');
INSERT INTO `china_areas` VALUES ('626', '52', '郊区', '046011');
INSERT INTO `china_areas` VALUES ('627', '52', '长治县', '047100');
INSERT INTO `china_areas` VALUES ('628', '52', '襄垣县', '046200');
INSERT INTO `china_areas` VALUES ('629', '52', '屯留县', '046100');
INSERT INTO `china_areas` VALUES ('630', '52', '平顺县', '047400');
INSERT INTO `china_areas` VALUES ('631', '52', '黎城县', '047600');
INSERT INTO `china_areas` VALUES ('632', '52', '壶关县', '047300');
INSERT INTO `china_areas` VALUES ('633', '52', '长子县', '046600');
INSERT INTO `china_areas` VALUES ('634', '52', '武乡县', '046300');
INSERT INTO `china_areas` VALUES ('635', '52', '沁县', '046400');
INSERT INTO `china_areas` VALUES ('636', '52', '沁源县', '046500');
INSERT INTO `china_areas` VALUES ('637', '52', '潞城市', '047500');
INSERT INTO `china_areas` VALUES ('638', '53', '城区', '048000');
INSERT INTO `china_areas` VALUES ('639', '53', '沁水县', '048200');
INSERT INTO `china_areas` VALUES ('640', '53', '阳城县', '048100');
INSERT INTO `china_areas` VALUES ('641', '53', '陵川县', '048300');
INSERT INTO `china_areas` VALUES ('642', '53', '泽州县', '048012');
INSERT INTO `china_areas` VALUES ('643', '53', '高平市', '048400');
INSERT INTO `china_areas` VALUES ('644', '54', '朔城区', '038500');
INSERT INTO `china_areas` VALUES ('645', '54', '平鲁区', '038600');
INSERT INTO `china_areas` VALUES ('646', '54', '山阴县', '036900');
INSERT INTO `china_areas` VALUES ('647', '54', '应县', '037600');
INSERT INTO `china_areas` VALUES ('648', '54', '右玉县', '037200');
INSERT INTO `china_areas` VALUES ('649', '54', '怀仁县', '038300');
INSERT INTO `china_areas` VALUES ('650', '55', '榆次区', '030600');
INSERT INTO `china_areas` VALUES ('651', '55', '榆社县', '031800');
INSERT INTO `china_areas` VALUES ('652', '55', '左权县', '032600');
INSERT INTO `china_areas` VALUES ('653', '55', '和顺县', '032700');
INSERT INTO `china_areas` VALUES ('654', '55', '昔阳县', '045300');
INSERT INTO `china_areas` VALUES ('655', '55', '寿阳县', '045400');
INSERT INTO `china_areas` VALUES ('656', '55', '太谷县', '030800');
INSERT INTO `china_areas` VALUES ('657', '55', '祁县', '030900');
INSERT INTO `china_areas` VALUES ('658', '55', '平遥县', '031100');
INSERT INTO `china_areas` VALUES ('659', '55', '灵石县', '031300');
INSERT INTO `china_areas` VALUES ('660', '55', '介休市', '031200');
INSERT INTO `china_areas` VALUES ('661', '56', '盐湖区', '044000');
INSERT INTO `china_areas` VALUES ('662', '56', '临猗县', '044100');
INSERT INTO `china_areas` VALUES ('663', '56', '万荣县', '044200');
INSERT INTO `china_areas` VALUES ('664', '56', '闻喜县', '043800');
INSERT INTO `china_areas` VALUES ('665', '56', '稷山县', '043200');
INSERT INTO `china_areas` VALUES ('666', '56', '新绛县', '043100');
INSERT INTO `china_areas` VALUES ('667', '56', '绛县', '043600');
INSERT INTO `china_areas` VALUES ('668', '56', '垣曲县', '043700');
INSERT INTO `china_areas` VALUES ('669', '56', '夏县', '044400');
INSERT INTO `china_areas` VALUES ('670', '56', '平陆县', '044300');
INSERT INTO `china_areas` VALUES ('671', '56', '芮城县', '044600');
INSERT INTO `china_areas` VALUES ('672', '56', '永济市', '044500');
INSERT INTO `china_areas` VALUES ('673', '56', '河津市', '043300');
INSERT INTO `china_areas` VALUES ('674', '57', '忻府区', '034000');
INSERT INTO `china_areas` VALUES ('675', '57', '定襄县', '035400');
INSERT INTO `china_areas` VALUES ('676', '57', '五台县', '035500');
INSERT INTO `china_areas` VALUES ('677', '57', '代县', '034200');
INSERT INTO `china_areas` VALUES ('678', '57', '繁峙县', '034300');
INSERT INTO `china_areas` VALUES ('679', '57', '宁武县', '036700');
INSERT INTO `china_areas` VALUES ('680', '57', '静乐县', '035100');
INSERT INTO `china_areas` VALUES ('681', '57', '神池县', '036100');
INSERT INTO `china_areas` VALUES ('682', '57', '五寨县', '036200');
INSERT INTO `china_areas` VALUES ('683', '57', '岢岚县', '036300');
INSERT INTO `china_areas` VALUES ('684', '57', '河曲县', '036500');
INSERT INTO `china_areas` VALUES ('685', '57', '保德县', '036600');
INSERT INTO `china_areas` VALUES ('686', '57', '偏关县', '036400');
INSERT INTO `china_areas` VALUES ('687', '57', '原平市', '034100');
INSERT INTO `china_areas` VALUES ('688', '58', '尧都区', '041000');
INSERT INTO `china_areas` VALUES ('689', '58', '曲沃县', '043400');
INSERT INTO `china_areas` VALUES ('690', '58', '翼城县', '043500');
INSERT INTO `china_areas` VALUES ('691', '58', '襄汾县', '041500');
INSERT INTO `china_areas` VALUES ('692', '58', '洪洞县', '031600');
INSERT INTO `china_areas` VALUES ('693', '58', '古县', '042400');
INSERT INTO `china_areas` VALUES ('694', '58', '安泽县', '042500');
INSERT INTO `china_areas` VALUES ('695', '58', '浮山县', '042600');
INSERT INTO `china_areas` VALUES ('696', '58', '吉县', '042200');
INSERT INTO `china_areas` VALUES ('697', '58', '乡宁县', '042100');
INSERT INTO `china_areas` VALUES ('698', '58', '大宁县', '042300');
INSERT INTO `china_areas` VALUES ('699', '58', '隰县', '041300');
INSERT INTO `china_areas` VALUES ('700', '58', '永和县', '041400');
INSERT INTO `china_areas` VALUES ('701', '58', '蒲县', '041200');
INSERT INTO `china_areas` VALUES ('702', '58', '汾西县', '031500');
INSERT INTO `china_areas` VALUES ('703', '58', '侯马市', '043007');
INSERT INTO `china_areas` VALUES ('704', '58', '霍州市', '031400');
INSERT INTO `china_areas` VALUES ('705', '59', '离石区', '033000');
INSERT INTO `china_areas` VALUES ('706', '59', '文水县', '032100');
INSERT INTO `china_areas` VALUES ('707', '59', '交城县', '030500');
INSERT INTO `china_areas` VALUES ('708', '59', '兴县', '033600');
INSERT INTO `china_areas` VALUES ('709', '59', '临县', '033200');
INSERT INTO `china_areas` VALUES ('710', '59', '柳林县', '033300');
INSERT INTO `china_areas` VALUES ('711', '59', '石楼县', '032500');
INSERT INTO `china_areas` VALUES ('712', '59', '岚县', '033500');
INSERT INTO `china_areas` VALUES ('713', '59', '方山县', '033100');
INSERT INTO `china_areas` VALUES ('714', '59', '中阳县', '033400');
INSERT INTO `china_areas` VALUES ('715', '59', '交口县', '032400');
INSERT INTO `china_areas` VALUES ('716', '59', '孝义市', '032300');
INSERT INTO `china_areas` VALUES ('717', '59', '汾阳市', '032200');
INSERT INTO `china_areas` VALUES ('718', '60', '回民区', '010030');
INSERT INTO `china_areas` VALUES ('719', '60', '玉泉区', '010020');
INSERT INTO `china_areas` VALUES ('720', '60', '新城区', '010030');
INSERT INTO `china_areas` VALUES ('721', '60', '赛罕区', '010020');
INSERT INTO `china_areas` VALUES ('722', '60', '土默特左旗', '010100');
INSERT INTO `china_areas` VALUES ('723', '60', '托克托县', '010200');
INSERT INTO `china_areas` VALUES ('724', '60', '和林格尔县', '011500');
INSERT INTO `china_areas` VALUES ('725', '60', '清水河县', '011600');
INSERT INTO `china_areas` VALUES ('726', '60', '武川县', '011700');
INSERT INTO `china_areas` VALUES ('727', '61', '东河区', '014040');
INSERT INTO `china_areas` VALUES ('728', '61', '昆都仑区', '014010');
INSERT INTO `china_areas` VALUES ('729', '61', '青山区', '014030');
INSERT INTO `china_areas` VALUES ('730', '61', '石拐区', '014070');
INSERT INTO `china_areas` VALUES ('731', '61', '白云矿区', '014080');
INSERT INTO `china_areas` VALUES ('732', '61', '九原区', '014060');
INSERT INTO `china_areas` VALUES ('733', '61', '土默特右旗', '014100');
INSERT INTO `china_areas` VALUES ('734', '61', '固阳县', '014200');
INSERT INTO `china_areas` VALUES ('735', '61', '达尔罕茂明安联合旗', '014500');
INSERT INTO `china_areas` VALUES ('736', '62', '海勃湾区', '016000');
INSERT INTO `china_areas` VALUES ('737', '62', '海南区', '016030');
INSERT INTO `china_areas` VALUES ('738', '62', '乌达区', '016040');
INSERT INTO `china_areas` VALUES ('739', '63', '红山区', '024020');
INSERT INTO `china_areas` VALUES ('740', '63', '元宝山区', '024076');
INSERT INTO `china_areas` VALUES ('741', '63', '松山区', '024005');
INSERT INTO `china_areas` VALUES ('742', '63', '阿鲁科尔沁旗', '025550');
INSERT INTO `china_areas` VALUES ('743', '63', '巴林左旗', '025450');
INSERT INTO `china_areas` VALUES ('744', '63', '巴林右旗', '025150');
INSERT INTO `china_areas` VALUES ('745', '63', '林西县', '025250');
INSERT INTO `china_areas` VALUES ('746', '63', '克什克腾旗', '025350');
INSERT INTO `china_areas` VALUES ('747', '63', '翁牛特旗', '024500');
INSERT INTO `china_areas` VALUES ('748', '63', '喀喇沁旗', '024400');
INSERT INTO `china_areas` VALUES ('749', '63', '宁城县', '024200');
INSERT INTO `china_areas` VALUES ('750', '63', '敖汉旗', '024300');
INSERT INTO `china_areas` VALUES ('751', '63', '新城区', '025350');
INSERT INTO `china_areas` VALUES ('752', '64', '科尔沁区', '028000');
INSERT INTO `china_areas` VALUES ('753', '64', '科尔沁左翼中旗', '029300');
INSERT INTO `china_areas` VALUES ('754', '64', '科尔沁左翼后旗', '028100');
INSERT INTO `china_areas` VALUES ('755', '64', '开鲁县', '028400');
INSERT INTO `china_areas` VALUES ('756', '64', '库伦旗', '028200');
INSERT INTO `china_areas` VALUES ('757', '64', '奈曼旗', '028300');
INSERT INTO `china_areas` VALUES ('758', '64', '扎鲁特旗', '029100');
INSERT INTO `china_areas` VALUES ('759', '64', '霍林郭勒市', '029200');
INSERT INTO `china_areas` VALUES ('760', '65', '东胜区', '017000');
INSERT INTO `china_areas` VALUES ('761', '65', '达拉特旗', '014300');
INSERT INTO `china_areas` VALUES ('762', '65', '准格尔旗', '017100');
INSERT INTO `china_areas` VALUES ('763', '65', '鄂托克前旗', '016200');
INSERT INTO `china_areas` VALUES ('764', '65', '鄂托克旗', '016100');
INSERT INTO `china_areas` VALUES ('765', '65', '杭锦旗', '017400');
INSERT INTO `china_areas` VALUES ('766', '65', '乌审旗', '017300');
INSERT INTO `china_areas` VALUES ('767', '65', '伊金霍洛旗', '017200');
INSERT INTO `china_areas` VALUES ('768', '66', '海拉尔区', '021000');
INSERT INTO `china_areas` VALUES ('769', '66', '阿荣旗', '162750');
INSERT INTO `china_areas` VALUES ('770', '66', '莫力达瓦达斡尔族自治旗', '162850');
INSERT INTO `china_areas` VALUES ('771', '66', '鄂伦春自治旗', '165450');
INSERT INTO `china_areas` VALUES ('772', '66', '鄂温克族自治旗', '021100');
INSERT INTO `china_areas` VALUES ('773', '66', '陈巴尔虎旗', '021500');
INSERT INTO `china_areas` VALUES ('774', '66', '新巴尔虎左旗', '021200');
INSERT INTO `china_areas` VALUES ('775', '66', '新巴尔虎右旗', '021300');
INSERT INTO `china_areas` VALUES ('776', '66', '满洲里市', '021400');
INSERT INTO `china_areas` VALUES ('777', '66', '牙克石市', '022150');
INSERT INTO `china_areas` VALUES ('778', '66', '扎兰屯市', '162650');
INSERT INTO `china_areas` VALUES ('779', '66', '额尔古纳市', '022250');
INSERT INTO `china_areas` VALUES ('780', '66', '根河市', '022350');
INSERT INTO `china_areas` VALUES ('781', '67', '临河区', '015001');
INSERT INTO `china_areas` VALUES ('782', '67', '五原县', '015100');
INSERT INTO `china_areas` VALUES ('783', '67', '磴口县', '015200');
INSERT INTO `china_areas` VALUES ('784', '67', '乌拉特前旗', '014400');
INSERT INTO `china_areas` VALUES ('785', '67', '乌拉特中旗', '015300');
INSERT INTO `china_areas` VALUES ('786', '67', '乌拉特后旗', '015500');
INSERT INTO `china_areas` VALUES ('787', '67', '杭锦后旗', '015400');
INSERT INTO `china_areas` VALUES ('788', '68', '集宁区', '012000');
INSERT INTO `china_areas` VALUES ('789', '68', '卓资县', '012300');
INSERT INTO `china_areas` VALUES ('790', '68', '化德县', '013350');
INSERT INTO `china_areas` VALUES ('791', '68', '商都县', '013450');
INSERT INTO `china_areas` VALUES ('792', '68', '兴和县', '013650');
INSERT INTO `china_areas` VALUES ('793', '68', '凉城县', '013750');
INSERT INTO `china_areas` VALUES ('794', '68', '察哈尔右翼前旗', '012200');
INSERT INTO `china_areas` VALUES ('795', '68', '察哈尔右翼中旗', '013550');
INSERT INTO `china_areas` VALUES ('796', '68', '察哈尔右翼后旗', '012400');
INSERT INTO `china_areas` VALUES ('797', '68', '四子王旗', '011800');
INSERT INTO `china_areas` VALUES ('798', '68', '丰镇市', '012100');
INSERT INTO `china_areas` VALUES ('799', '69', '乌兰浩特市', '137401');
INSERT INTO `china_areas` VALUES ('800', '69', '阿尔山市', '137800');
INSERT INTO `china_areas` VALUES ('801', '69', '科尔沁右翼前旗', '137423');
INSERT INTO `china_areas` VALUES ('802', '69', '科尔沁右翼中旗', '029400');
INSERT INTO `china_areas` VALUES ('803', '69', '扎赉特旗', '137600');
INSERT INTO `china_areas` VALUES ('804', '69', '突泉县', '137500');
INSERT INTO `china_areas` VALUES ('805', '70', '二连浩特市', '011100');
INSERT INTO `china_areas` VALUES ('806', '70', '锡林浩特市', '026000');
INSERT INTO `china_areas` VALUES ('807', '70', '阿巴嘎旗', '011400');
INSERT INTO `china_areas` VALUES ('808', '70', '苏尼特左旗', '011300');
INSERT INTO `china_areas` VALUES ('809', '70', '苏尼特右旗', '011200');
INSERT INTO `china_areas` VALUES ('810', '70', '东乌珠穆沁旗', '026300');
INSERT INTO `china_areas` VALUES ('811', '70', '西乌珠穆沁旗', '026200');
INSERT INTO `china_areas` VALUES ('812', '70', '太仆寺旗', '027000');
INSERT INTO `china_areas` VALUES ('813', '70', '镶黄旗', '013250');
INSERT INTO `china_areas` VALUES ('814', '70', '正镶白旗', '013800');
INSERT INTO `china_areas` VALUES ('815', '70', '正蓝旗', '027200');
INSERT INTO `china_areas` VALUES ('816', '70', '多伦县', '027300');
INSERT INTO `china_areas` VALUES ('817', '71', '阿拉善左旗', '750306');
INSERT INTO `china_areas` VALUES ('818', '71', '阿拉善右旗', '737300');
INSERT INTO `china_areas` VALUES ('819', '71', '额济纳旗', '735400');
INSERT INTO `china_areas` VALUES ('820', '72', '和平区', '110001');
INSERT INTO `china_areas` VALUES ('821', '72', '沈河区', '110013');
INSERT INTO `china_areas` VALUES ('822', '72', '大东区', '110041');
INSERT INTO `china_areas` VALUES ('823', '72', '皇姑区', '110031');
INSERT INTO `china_areas` VALUES ('824', '72', '铁西区', '110021');
INSERT INTO `china_areas` VALUES ('825', '72', '苏家屯区', '110101');
INSERT INTO `china_areas` VALUES ('826', '72', '东陵区', '110015');
INSERT INTO `china_areas` VALUES ('827', '72', '沈北新区', '110121');
INSERT INTO `china_areas` VALUES ('828', '72', '于洪区', '110141');
INSERT INTO `china_areas` VALUES ('829', '72', '辽中县', '110200');
INSERT INTO `china_areas` VALUES ('830', '72', '康平县', '110500');
INSERT INTO `china_areas` VALUES ('831', '72', '法库县', '110400');
INSERT INTO `china_areas` VALUES ('832', '72', '新民市', '110300');
INSERT INTO `china_areas` VALUES ('833', '72', '经济技术开发区', '110141');
INSERT INTO `china_areas` VALUES ('834', '72', '浑南新区', '110179');
INSERT INTO `china_areas` VALUES ('835', '72', '新城子经济技术开发区', '110121');
INSERT INTO `china_areas` VALUES ('836', '73', '中山区', '116001');
INSERT INTO `china_areas` VALUES ('837', '73', '西岗区', '116011');
INSERT INTO `china_areas` VALUES ('838', '73', '沙河口区', '116021');
INSERT INTO `china_areas` VALUES ('839', '73', '甘井子区', '116033');
INSERT INTO `china_areas` VALUES ('840', '73', '旅顺口区', '116041');
INSERT INTO `china_areas` VALUES ('841', '73', '金州区', '116100');
INSERT INTO `china_areas` VALUES ('842', '73', '长海县', '116500');
INSERT INTO `china_areas` VALUES ('843', '73', '瓦房店市', '116300');
INSERT INTO `china_areas` VALUES ('844', '73', '普兰店市', '116200');
INSERT INTO `china_areas` VALUES ('845', '73', '庄河市', '116400');
INSERT INTO `china_areas` VALUES ('846', '73', '开发区', '116600');
INSERT INTO `china_areas` VALUES ('847', '73', '保税区', '116600');
INSERT INTO `china_areas` VALUES ('848', '74', '铁东区', '114001');
INSERT INTO `china_areas` VALUES ('849', '74', '铁西区', '114013');
INSERT INTO `china_areas` VALUES ('850', '74', '立山区', '114031');
INSERT INTO `china_areas` VALUES ('851', '74', '千山区', '114041');
INSERT INTO `china_areas` VALUES ('852', '74', '台安县', '114100');
INSERT INTO `china_areas` VALUES ('853', '74', '岫岩满族自治县', '114300');
INSERT INTO `china_areas` VALUES ('854', '74', '海城市', '114200');
INSERT INTO `china_areas` VALUES ('855', '75', '新抚区', '113008');
INSERT INTO `china_areas` VALUES ('856', '75', '东洲区', '113003');
INSERT INTO `china_areas` VALUES ('857', '75', '望花区', '113001');
INSERT INTO `china_areas` VALUES ('858', '75', '顺城区', '113006');
INSERT INTO `china_areas` VALUES ('859', '75', '抚顺县', '113006');
INSERT INTO `china_areas` VALUES ('860', '75', '新宾满族自治县', '113200');
INSERT INTO `china_areas` VALUES ('861', '75', '清原满族自治县', '113300');
INSERT INTO `china_areas` VALUES ('862', '76', '平山区', '117000');
INSERT INTO `china_areas` VALUES ('863', '76', '明山区', '117021');
INSERT INTO `china_areas` VALUES ('864', '76', '溪湖区', '117002');
INSERT INTO `china_areas` VALUES ('865', '76', '南芬区', '117014');
INSERT INTO `china_areas` VALUES ('866', '76', '本溪满族自治县', '117100');
INSERT INTO `china_areas` VALUES ('867', '76', '桓仁满族自治县', '117200');
INSERT INTO `china_areas` VALUES ('868', '77', '元宝区', '118000');
INSERT INTO `china_areas` VALUES ('869', '77', '振兴区', '118002');
INSERT INTO `china_areas` VALUES ('870', '77', '振安区', '118001');
INSERT INTO `china_areas` VALUES ('871', '77', '宽甸满族自治县', '118200');
INSERT INTO `china_areas` VALUES ('872', '77', '东港市', '118300');
INSERT INTO `china_areas` VALUES ('873', '77', '凤城市', '118100');
INSERT INTO `china_areas` VALUES ('874', '78', '古塔区', '121001');
INSERT INTO `china_areas` VALUES ('875', '78', '凌河区', '121000');
INSERT INTO `china_areas` VALUES ('876', '78', '太和区', '121011');
INSERT INTO `china_areas` VALUES ('877', '78', '黑山县', '121400');
INSERT INTO `china_areas` VALUES ('878', '78', '义县', '121100');
INSERT INTO `china_areas` VALUES ('879', '78', '凌海市', '121200');
INSERT INTO `china_areas` VALUES ('880', '78', '北宁市', '121300');
INSERT INTO `china_areas` VALUES ('881', '78', '松山新区', '121219');
INSERT INTO `china_areas` VALUES ('882', '78', '经济技术开发区', '121007');
INSERT INTO `china_areas` VALUES ('883', '79', '站前区', '115002');
INSERT INTO `china_areas` VALUES ('884', '79', '西市区', '115004');
INSERT INTO `china_areas` VALUES ('885', '79', '鲅鱼圈区', '115007');
INSERT INTO `china_areas` VALUES ('886', '79', '老边区', '115005');
INSERT INTO `china_areas` VALUES ('887', '79', '盖州市', '115200');
INSERT INTO `china_areas` VALUES ('888', '79', '大石桥市', '115100');
INSERT INTO `china_areas` VALUES ('889', '80', '海州区', '123000');
INSERT INTO `china_areas` VALUES ('890', '80', '新邱区', '123005');
INSERT INTO `china_areas` VALUES ('891', '80', '太平区', '123003');
INSERT INTO `china_areas` VALUES ('892', '80', '清河门区', '123006');
INSERT INTO `china_areas` VALUES ('893', '80', '细河区', '123000');
INSERT INTO `china_areas` VALUES ('894', '80', '阜新蒙古族自治县', '123100');
INSERT INTO `china_areas` VALUES ('895', '80', '彰武县', '123200');
INSERT INTO `china_areas` VALUES ('896', '81', '白塔区', '111000');
INSERT INTO `china_areas` VALUES ('897', '81', '文圣区', '111000');
INSERT INTO `china_areas` VALUES ('898', '81', '宏伟区', '111003');
INSERT INTO `china_areas` VALUES ('899', '81', '弓长岭区', '111008');
INSERT INTO `china_areas` VALUES ('900', '81', '太子河区', '111000');
INSERT INTO `china_areas` VALUES ('901', '81', '辽阳县', '111200');
INSERT INTO `china_areas` VALUES ('902', '81', '灯塔市', '111300');
INSERT INTO `china_areas` VALUES ('903', '82', '双台子区', '124000');
INSERT INTO `china_areas` VALUES ('904', '82', '兴隆台区', '124010');
INSERT INTO `china_areas` VALUES ('905', '82', '大洼县', '124200');
INSERT INTO `china_areas` VALUES ('906', '82', '盘山县', '124000');
INSERT INTO `china_areas` VALUES ('907', '83', '银州区', '112000');
INSERT INTO `china_areas` VALUES ('908', '83', '清河区', '112003');
INSERT INTO `china_areas` VALUES ('909', '83', '铁岭县', '112000');
INSERT INTO `china_areas` VALUES ('910', '83', '西丰县', '112400');
INSERT INTO `china_areas` VALUES ('911', '83', '昌图县', '112500');
INSERT INTO `china_areas` VALUES ('912', '83', '调兵山市', '112700');
INSERT INTO `china_areas` VALUES ('913', '83', '开原市', '112300');
INSERT INTO `china_areas` VALUES ('914', '84', '双塔区', '122000');
INSERT INTO `china_areas` VALUES ('915', '84', '龙城区', '122000');
INSERT INTO `china_areas` VALUES ('916', '84', '朝阳县', '122000');
INSERT INTO `china_areas` VALUES ('917', '84', '建平县', '122400');
INSERT INTO `china_areas` VALUES ('918', '84', '喀喇沁左翼蒙古族自治县', '122300');
INSERT INTO `china_areas` VALUES ('919', '84', '北票市', '122100');
INSERT INTO `china_areas` VALUES ('920', '84', '凌源市', '122500');
INSERT INTO `china_areas` VALUES ('921', '85', '连山区', '125001');
INSERT INTO `china_areas` VALUES ('922', '85', '龙港区', '125003');
INSERT INTO `china_areas` VALUES ('923', '85', '南票区', '125027');
INSERT INTO `china_areas` VALUES ('924', '85', '绥中县', '125200');
INSERT INTO `china_areas` VALUES ('925', '85', '建昌县', '125300');
INSERT INTO `china_areas` VALUES ('926', '85', '兴城市', '125100');
INSERT INTO `china_areas` VALUES ('927', '86', '南关区', '130022');
INSERT INTO `china_areas` VALUES ('928', '86', '宽城区', '130051');
INSERT INTO `china_areas` VALUES ('929', '86', '朝阳区', '130012');
INSERT INTO `china_areas` VALUES ('930', '86', '二道区', '130031');
INSERT INTO `china_areas` VALUES ('931', '86', '绿园区', '130062');
INSERT INTO `china_areas` VALUES ('932', '86', '双阳区', '130600');
INSERT INTO `china_areas` VALUES ('933', '86', '农安县', '130200');
INSERT INTO `china_areas` VALUES ('934', '86', '九台市', '130500');
INSERT INTO `china_areas` VALUES ('935', '86', '榆树市', '130400');
INSERT INTO `china_areas` VALUES ('936', '86', '德惠市', '130300');
INSERT INTO `china_areas` VALUES ('937', '86', '净月经济开发区', '130117');
INSERT INTO `china_areas` VALUES ('938', '86', '高新技术产业开发区', '130015');
INSERT INTO `china_areas` VALUES ('939', '87', '昌邑区', '132002');
INSERT INTO `china_areas` VALUES ('940', '87', '龙潭区', '132021');
INSERT INTO `china_areas` VALUES ('941', '87', '船营区', '132011');
INSERT INTO `china_areas` VALUES ('942', '87', '丰满区', '132013');
INSERT INTO `china_areas` VALUES ('943', '87', '永吉县', '132200');
INSERT INTO `china_areas` VALUES ('944', '87', '蛟河市', '132500');
INSERT INTO `china_areas` VALUES ('945', '87', '桦甸市', '132400');
INSERT INTO `china_areas` VALUES ('946', '87', '舒兰市', '132600');
INSERT INTO `china_areas` VALUES ('947', '87', '磐石市', '132300');
INSERT INTO `china_areas` VALUES ('948', '88', '铁西区', '136000');
INSERT INTO `china_areas` VALUES ('949', '88', '铁东区', '136001');
INSERT INTO `china_areas` VALUES ('950', '88', '梨树县', '136500');
INSERT INTO `china_areas` VALUES ('951', '88', '伊通满族自治县', '130700');
INSERT INTO `china_areas` VALUES ('952', '88', '公主岭市', '136100');
INSERT INTO `china_areas` VALUES ('953', '88', '双辽市', '136400');
INSERT INTO `china_areas` VALUES ('954', '89', '龙山区', '136200');
INSERT INTO `china_areas` VALUES ('955', '89', '西安区', '136201');
INSERT INTO `china_areas` VALUES ('956', '89', '东丰县', '136300');
INSERT INTO `china_areas` VALUES ('957', '89', '东辽县', '136600');
INSERT INTO `china_areas` VALUES ('958', '90', '东昌区', '134001');
INSERT INTO `china_areas` VALUES ('959', '90', '二道江区', '134003');
INSERT INTO `china_areas` VALUES ('960', '90', '通化县', '134100');
INSERT INTO `china_areas` VALUES ('961', '90', '辉南县', '135100');
INSERT INTO `china_areas` VALUES ('962', '90', '柳河县', '135300');
INSERT INTO `china_areas` VALUES ('963', '90', '梅河口市', '135000');
INSERT INTO `china_areas` VALUES ('964', '90', '集安市', '134200');
INSERT INTO `china_areas` VALUES ('965', '91', '八道江区', '134300');
INSERT INTO `china_areas` VALUES ('966', '91', '抚松县', '134500');
INSERT INTO `china_areas` VALUES ('967', '91', '靖宇县', '135200');
INSERT INTO `china_areas` VALUES ('968', '91', '长白朝鲜族自治县', '134400');
INSERT INTO `china_areas` VALUES ('969', '91', '江源县', '134700');
INSERT INTO `china_areas` VALUES ('970', '91', '临江市', '134600');
INSERT INTO `china_areas` VALUES ('971', '92', '宁江区', '138000');
INSERT INTO `china_areas` VALUES ('972', '92', '前郭尔罗斯蒙古族自治县', '138000');
INSERT INTO `china_areas` VALUES ('973', '92', '长岭县', '131500');
INSERT INTO `china_areas` VALUES ('974', '92', '乾安县', '131400');
INSERT INTO `china_areas` VALUES ('975', '92', '扶余县', '131200');
INSERT INTO `china_areas` VALUES ('976', '93', '洮北区', '137000');
INSERT INTO `china_areas` VALUES ('977', '93', '镇赉县', '137300');
INSERT INTO `china_areas` VALUES ('978', '93', '通榆县', '137200');
INSERT INTO `china_areas` VALUES ('979', '93', '洮南市', '137100');
INSERT INTO `china_areas` VALUES ('980', '93', '大安市', '131300');
INSERT INTO `china_areas` VALUES ('981', '94', '延吉市', '133000');
INSERT INTO `china_areas` VALUES ('982', '94', '图们市', '133100');
INSERT INTO `china_areas` VALUES ('983', '94', '敦化市', '133700');
INSERT INTO `china_areas` VALUES ('984', '94', '珲春市', '133300');
INSERT INTO `china_areas` VALUES ('985', '94', '龙井市', '133400');
INSERT INTO `china_areas` VALUES ('986', '94', '和龙市', '133500');
INSERT INTO `china_areas` VALUES ('987', '94', '汪清县', '133200');
INSERT INTO `china_areas` VALUES ('988', '94', '安图县', '133600');
INSERT INTO `china_areas` VALUES ('989', '95', '道里区', '150010');
INSERT INTO `china_areas` VALUES ('990', '95', '南岗区', '150006');
INSERT INTO `china_areas` VALUES ('991', '95', '道外区', '150020');
INSERT INTO `china_areas` VALUES ('992', '95', '香坊区', '150036');
INSERT INTO `china_areas` VALUES ('993', '95', '动力区', '150040');
INSERT INTO `china_areas` VALUES ('994', '95', '平房区', '150060');
INSERT INTO `china_areas` VALUES ('995', '95', '松北区', '150028');
INSERT INTO `china_areas` VALUES ('996', '95', '呼兰区', '150500');
INSERT INTO `china_areas` VALUES ('997', '95', '依兰县', '154800');
INSERT INTO `china_areas` VALUES ('998', '95', '方正县', '150800');
INSERT INTO `china_areas` VALUES ('999', '95', '宾县', '150400');
INSERT INTO `china_areas` VALUES ('1000', '95', '巴彦县', '151800');
INSERT INTO `china_areas` VALUES ('1001', '95', '木兰县', '151900');
INSERT INTO `china_areas` VALUES ('1002', '95', '通河县', '150900');
INSERT INTO `china_areas` VALUES ('1003', '95', '延寿县', '150700');
INSERT INTO `china_areas` VALUES ('1004', '95', '阿城区', '150300');
INSERT INTO `china_areas` VALUES ('1005', '95', '双城市', '150100');
INSERT INTO `china_areas` VALUES ('1006', '95', '尚志市', '150600');
INSERT INTO `china_areas` VALUES ('1007', '95', '五常市', '150200');
INSERT INTO `china_areas` VALUES ('1008', '96', '龙沙区', '161000');
INSERT INTO `china_areas` VALUES ('1009', '96', '建华区', '161006');
INSERT INTO `china_areas` VALUES ('1010', '96', '铁锋区', '161000');
INSERT INTO `china_areas` VALUES ('1011', '96', '昂昂溪区', '161031');
INSERT INTO `china_areas` VALUES ('1012', '96', '富拉尔基区', '161041');
INSERT INTO `china_areas` VALUES ('1013', '96', '碾子山区', '161046');
INSERT INTO `china_areas` VALUES ('1014', '96', '梅里斯达斡尔族区', '161021');
INSERT INTO `china_areas` VALUES ('1015', '96', '龙江县', '161100');
INSERT INTO `china_areas` VALUES ('1016', '96', '依安县', '161500');
INSERT INTO `china_areas` VALUES ('1017', '96', '泰来县', '162400');
INSERT INTO `china_areas` VALUES ('1018', '96', '甘南县', '162100');
INSERT INTO `china_areas` VALUES ('1019', '96', '富裕县', '161200');
INSERT INTO `china_areas` VALUES ('1020', '96', '克山县', '161600');
INSERT INTO `china_areas` VALUES ('1021', '96', '克东县', '164800');
INSERT INTO `china_areas` VALUES ('1022', '96', '拜泉县', '164700');
INSERT INTO `china_areas` VALUES ('1023', '96', '讷河市', '161300');
INSERT INTO `china_areas` VALUES ('1024', '97', '鸡冠区', '158100');
INSERT INTO `china_areas` VALUES ('1025', '97', '恒山区', '158130');
INSERT INTO `china_areas` VALUES ('1026', '97', '滴道区', '158150');
INSERT INTO `china_areas` VALUES ('1027', '97', '梨树区', '158160');
INSERT INTO `china_areas` VALUES ('1028', '97', '城子河区', '158170');
INSERT INTO `china_areas` VALUES ('1029', '97', '麻山区', '158180');
INSERT INTO `china_areas` VALUES ('1030', '97', '鸡东县', '158200');
INSERT INTO `china_areas` VALUES ('1031', '97', '虎林市', '158400');
INSERT INTO `china_areas` VALUES ('1032', '97', '密山市', '158300');
INSERT INTO `china_areas` VALUES ('1033', '98', '向阳区', '154100');
INSERT INTO `china_areas` VALUES ('1034', '98', '工农区', '154101');
INSERT INTO `china_areas` VALUES ('1035', '98', '南山区', '154104');
INSERT INTO `china_areas` VALUES ('1036', '98', '兴安区', '154102');
INSERT INTO `china_areas` VALUES ('1037', '98', '东山区', '154106');
INSERT INTO `china_areas` VALUES ('1038', '98', '兴山区', '154105');
INSERT INTO `china_areas` VALUES ('1039', '98', '萝北县', '154200');
INSERT INTO `china_areas` VALUES ('1040', '98', '绥滨县', '156200');
INSERT INTO `china_areas` VALUES ('1041', '99', '尖山区', '155100');
INSERT INTO `china_areas` VALUES ('1042', '99', '岭东区', '155120');
INSERT INTO `china_areas` VALUES ('1043', '99', '四方台区', '155130');
INSERT INTO `china_areas` VALUES ('1044', '99', '宝山区', '155131');
INSERT INTO `china_areas` VALUES ('1045', '99', '集贤县', '155900');
INSERT INTO `china_areas` VALUES ('1046', '99', '友谊县', '155800');
INSERT INTO `china_areas` VALUES ('1047', '99', '宝清县', '155600');
INSERT INTO `china_areas` VALUES ('1048', '99', '饶河县', '155700');
INSERT INTO `china_areas` VALUES ('1049', '100', '萨尔图区', '163001');
INSERT INTO `china_areas` VALUES ('1050', '100', '龙凤区', '163711');
INSERT INTO `china_areas` VALUES ('1051', '100', '让胡路区', '163712');
INSERT INTO `china_areas` VALUES ('1052', '100', '红岗区', '163511');
INSERT INTO `china_areas` VALUES ('1053', '100', '大同区', '163515');
INSERT INTO `china_areas` VALUES ('1054', '100', '肇州县', '166400');
INSERT INTO `china_areas` VALUES ('1055', '100', '肇源县', '166500');
INSERT INTO `china_areas` VALUES ('1056', '100', '林甸县', '166300');
INSERT INTO `china_areas` VALUES ('1057', '100', '杜尔伯特蒙古族自治县', '166200');
INSERT INTO `china_areas` VALUES ('1058', '101', '伊春区', '153000');
INSERT INTO `china_areas` VALUES ('1059', '101', '南岔区', '153100');
INSERT INTO `china_areas` VALUES ('1060', '101', '友好区', '153031');
INSERT INTO `china_areas` VALUES ('1061', '101', '西林区', '153025');
INSERT INTO `china_areas` VALUES ('1062', '101', '翠峦区', '153013');
INSERT INTO `china_areas` VALUES ('1063', '101', '新青区', '153036');
INSERT INTO `china_areas` VALUES ('1064', '101', '美溪区', '153021');
INSERT INTO `china_areas` VALUES ('1065', '101', '金山屯区', '153026');
INSERT INTO `china_areas` VALUES ('1066', '101', '五营区', '153033');
INSERT INTO `china_areas` VALUES ('1067', '101', '乌马河区', '153011');
INSERT INTO `china_areas` VALUES ('1068', '101', '汤旺河区', '153037');
INSERT INTO `china_areas` VALUES ('1069', '101', '带岭区', '153106');
INSERT INTO `china_areas` VALUES ('1070', '101', '乌伊岭区', '153038');
INSERT INTO `china_areas` VALUES ('1071', '101', '红星区', '153035');
INSERT INTO `china_areas` VALUES ('1072', '101', '上甘岭区', '153032');
INSERT INTO `china_areas` VALUES ('1073', '101', '嘉荫县', '153200');
INSERT INTO `china_areas` VALUES ('1074', '101', '铁力市', '152500');
INSERT INTO `china_areas` VALUES ('1075', '102', '向阳区', '154002');
INSERT INTO `china_areas` VALUES ('1076', '102', '前进区', '154002');
INSERT INTO `china_areas` VALUES ('1077', '102', '东风区', '154005');
INSERT INTO `china_areas` VALUES ('1078', '102', '郊区', '154004');
INSERT INTO `china_areas` VALUES ('1079', '102', '桦南县', '154400');
INSERT INTO `china_areas` VALUES ('1080', '102', '桦川县', '154300');
INSERT INTO `china_areas` VALUES ('1081', '102', '汤原县', '154700');
INSERT INTO `china_areas` VALUES ('1082', '102', '抚远县', '156500');
INSERT INTO `china_areas` VALUES ('1083', '102', '同江市', '156400');
INSERT INTO `china_areas` VALUES ('1084', '102', '富锦市', '156100');
INSERT INTO `china_areas` VALUES ('1085', '103', '新兴区', '154604');
INSERT INTO `china_areas` VALUES ('1086', '103', '桃山区', '154600');
INSERT INTO `china_areas` VALUES ('1087', '103', '茄子河区', '154622');
INSERT INTO `china_areas` VALUES ('1088', '103', '勃利县', '154500');
INSERT INTO `china_areas` VALUES ('1089', '104', '东安区', '157000');
INSERT INTO `china_areas` VALUES ('1090', '104', '爱民区', '157009');
INSERT INTO `china_areas` VALUES ('1091', '104', '阳明区', '157013');
INSERT INTO `china_areas` VALUES ('1092', '104', '西安区', '157000');
INSERT INTO `china_areas` VALUES ('1093', '104', '东宁县', '157200');
INSERT INTO `china_areas` VALUES ('1094', '104', '林口县', '157600');
INSERT INTO `china_areas` VALUES ('1095', '104', '绥芬河市', '157300');
INSERT INTO `china_areas` VALUES ('1096', '104', '海林市', '157100');
INSERT INTO `china_areas` VALUES ('1097', '104', '宁安市', '157400');
INSERT INTO `china_areas` VALUES ('1098', '104', '穆棱市', '157500');
INSERT INTO `china_areas` VALUES ('1099', '105', '爱辉区', '164300');
INSERT INTO `china_areas` VALUES ('1100', '105', '嫩江县', '161400');
INSERT INTO `china_areas` VALUES ('1101', '105', '逊克县', '164400');
INSERT INTO `china_areas` VALUES ('1102', '105', '孙吴县', '164200');
INSERT INTO `china_areas` VALUES ('1103', '105', '北安市', '164000');
INSERT INTO `china_areas` VALUES ('1104', '105', '五大连池市', '164100');
INSERT INTO `china_areas` VALUES ('1105', '106', '北林区', '152000');
INSERT INTO `china_areas` VALUES ('1106', '106', '望奎县', '152100');
INSERT INTO `china_areas` VALUES ('1107', '106', '兰西县', '151500');
INSERT INTO `china_areas` VALUES ('1108', '106', '青冈县', '151600');
INSERT INTO `china_areas` VALUES ('1109', '106', '庆安县', '152400');
INSERT INTO `china_areas` VALUES ('1110', '106', '明水县', '151700');
INSERT INTO `china_areas` VALUES ('1111', '106', '绥棱县', '152200');
INSERT INTO `china_areas` VALUES ('1112', '106', '安达市', '151400');
INSERT INTO `china_areas` VALUES ('1113', '106', '肇东市', '151100');
INSERT INTO `china_areas` VALUES ('1114', '106', '海伦市', '152300');
INSERT INTO `china_areas` VALUES ('1115', '107', '呼玛县', '165100');
INSERT INTO `china_areas` VALUES ('1116', '107', '塔河县', '165200');
INSERT INTO `china_areas` VALUES ('1117', '107', '漠河县', '165300');
INSERT INTO `china_areas` VALUES ('1118', '107', '加格达奇区', '165000');
INSERT INTO `china_areas` VALUES ('1119', '107', '松岭区', '165012');
INSERT INTO `china_areas` VALUES ('1120', '107', '新林区', '165023');
INSERT INTO `china_areas` VALUES ('1121', '107', '呼中区', '165036');
INSERT INTO `china_areas` VALUES ('1122', '108', '黄浦区', '200001');
INSERT INTO `china_areas` VALUES ('1123', '108', '卢湾区', '200020');
INSERT INTO `china_areas` VALUES ('1124', '108', '徐汇区', '200030');
INSERT INTO `china_areas` VALUES ('1125', '108', '长宁区', '200050');
INSERT INTO `china_areas` VALUES ('1126', '108', '静安区', '200040');
INSERT INTO `china_areas` VALUES ('1127', '108', '普陀区', '200333');
INSERT INTO `china_areas` VALUES ('1128', '108', '闸北区', '200070');
INSERT INTO `china_areas` VALUES ('1129', '108', '虹口区', '200080');
INSERT INTO `china_areas` VALUES ('1130', '108', '杨浦区', '200082');
INSERT INTO `china_areas` VALUES ('1131', '108', '闵行区', '201100');
INSERT INTO `china_areas` VALUES ('1132', '108', '宝山区', '201900');
INSERT INTO `china_areas` VALUES ('1133', '108', '嘉定区', '201800');
INSERT INTO `china_areas` VALUES ('1134', '108', '浦东新区', '200135');
INSERT INTO `china_areas` VALUES ('1135', '108', '金山区', '200540');
INSERT INTO `china_areas` VALUES ('1136', '108', '松江区', '201600');
INSERT INTO `china_areas` VALUES ('1137', '108', '青浦区', '201700');
INSERT INTO `china_areas` VALUES ('1138', '108', '南汇区', '201300');
INSERT INTO `china_areas` VALUES ('1139', '108', '奉贤区', '201400');
INSERT INTO `china_areas` VALUES ('1140', '108', '崇明县', '202150');
INSERT INTO `china_areas` VALUES ('1141', '109', '玄武区', '210018');
INSERT INTO `china_areas` VALUES ('1142', '109', '白下区', '210002');
INSERT INTO `china_areas` VALUES ('1143', '109', '秦淮区', '210001');
INSERT INTO `china_areas` VALUES ('1144', '109', '建邺区', '210004');
INSERT INTO `china_areas` VALUES ('1145', '109', '鼓楼区', '210009');
INSERT INTO `china_areas` VALUES ('1146', '109', '下关区', '210011');
INSERT INTO `china_areas` VALUES ('1147', '109', '浦口区', '211800');
INSERT INTO `china_areas` VALUES ('1148', '109', '栖霞区', '210046');
INSERT INTO `china_areas` VALUES ('1149', '109', '雨花台区', '210012');
INSERT INTO `china_areas` VALUES ('1150', '109', '江宁区', '211100');
INSERT INTO `china_areas` VALUES ('1151', '109', '六合区', '211500');
INSERT INTO `china_areas` VALUES ('1152', '109', '溧水县', '211200');
INSERT INTO `china_areas` VALUES ('1153', '109', '高淳县', '211300');
INSERT INTO `china_areas` VALUES ('1154', '110', '崇安区', '214002');
INSERT INTO `china_areas` VALUES ('1155', '110', '南长区', '214021');
INSERT INTO `china_areas` VALUES ('1156', '110', '北塘区', '214044');
INSERT INTO `china_areas` VALUES ('1157', '110', '锡山区', '214101');
INSERT INTO `china_areas` VALUES ('1158', '110', '惠山区', '214174');
INSERT INTO `china_areas` VALUES ('1159', '110', '滨湖区', '214062');
INSERT INTO `china_areas` VALUES ('1160', '110', '江阴市', '214400');
INSERT INTO `china_areas` VALUES ('1161', '110', '宜兴市', '214200');
INSERT INTO `china_areas` VALUES ('1162', '110', '新区', '214028');
INSERT INTO `china_areas` VALUES ('1163', '111', '云龙区', '221009');
INSERT INTO `china_areas` VALUES ('1164', '111', '鼓楼区', '221005');
INSERT INTO `china_areas` VALUES ('1165', '111', '九里区', '221140');
INSERT INTO `china_areas` VALUES ('1166', '111', '泉山区', '221006');
INSERT INTO `china_areas` VALUES ('1167', '111', '铜山县', '221116');
INSERT INTO `china_areas` VALUES ('1168', '111', '贾汪区', '221011');
INSERT INTO `china_areas` VALUES ('1169', '111', '丰县', '221700');
INSERT INTO `china_areas` VALUES ('1170', '111', '沛县', '221600');
INSERT INTO `china_areas` VALUES ('1171', '111', '睢宁县', '221200');
INSERT INTO `china_areas` VALUES ('1172', '111', '新沂市', '221400');
INSERT INTO `china_areas` VALUES ('1173', '111', '邳州市', '221300');
INSERT INTO `china_areas` VALUES ('1174', '112', '天宁区', '213003');
INSERT INTO `china_areas` VALUES ('1175', '112', '钟楼区', '213002');
INSERT INTO `china_areas` VALUES ('1176', '112', '戚墅堰区', '213011');
INSERT INTO `china_areas` VALUES ('1177', '112', '新北区', '213001');
INSERT INTO `china_areas` VALUES ('1178', '112', '武进区', '213161');
INSERT INTO `china_areas` VALUES ('1179', '112', '溧阳市', '213300');
INSERT INTO `china_areas` VALUES ('1180', '112', '金坛市', '213200');
INSERT INTO `china_areas` VALUES ('1181', '113', '沧浪区', '215006');
INSERT INTO `china_areas` VALUES ('1182', '113', '平江区', '215005');
INSERT INTO `china_areas` VALUES ('1183', '113', '金阊区', '215008');
INSERT INTO `china_areas` VALUES ('1184', '113', '虎丘区', '215004');
INSERT INTO `china_areas` VALUES ('1185', '113', '吴中区', '215128');
INSERT INTO `china_areas` VALUES ('1186', '113', '相城区', '215131');
INSERT INTO `china_areas` VALUES ('1187', '113', '常熟市', '215500');
INSERT INTO `china_areas` VALUES ('1188', '113', '张家港市', '215600');
INSERT INTO `china_areas` VALUES ('1189', '113', '昆山市', '215300');
INSERT INTO `china_areas` VALUES ('1190', '113', '吴江市', '215200');
INSERT INTO `china_areas` VALUES ('1191', '113', '太仓市', '215400');
INSERT INTO `china_areas` VALUES ('1192', '113', '工业园区', '215028');
INSERT INTO `china_areas` VALUES ('1193', '113', '高新区', '215011');
INSERT INTO `china_areas` VALUES ('1194', '114', '崇川区', '226001');
INSERT INTO `china_areas` VALUES ('1195', '114', '港闸区', '226001');
INSERT INTO `china_areas` VALUES ('1196', '114', '海安县', '226600');
INSERT INTO `china_areas` VALUES ('1197', '114', '如东县', '226400');
INSERT INTO `china_areas` VALUES ('1198', '114', '启东市', '226200');
INSERT INTO `china_areas` VALUES ('1199', '114', '如皋市', '226500');
INSERT INTO `china_areas` VALUES ('1200', '114', '通州市', '226300');
INSERT INTO `china_areas` VALUES ('1201', '114', '海门市', '226100');
INSERT INTO `china_areas` VALUES ('1202', '114', '经济技术开发区', '226009');
INSERT INTO `china_areas` VALUES ('1203', '115', '连云区', '222042');
INSERT INTO `china_areas` VALUES ('1204', '115', '新浦区', '222003');
INSERT INTO `china_areas` VALUES ('1205', '115', '海州区', '222023');
INSERT INTO `china_areas` VALUES ('1206', '115', '赣榆县', '222100');
INSERT INTO `china_areas` VALUES ('1207', '115', '东海县', '222300');
INSERT INTO `china_areas` VALUES ('1208', '115', '灌云县', '222200');
INSERT INTO `china_areas` VALUES ('1209', '115', '灌南县', '223500');
INSERT INTO `china_areas` VALUES ('1210', '116', '清河区', '223001');
INSERT INTO `china_areas` VALUES ('1211', '116', '楚州区', '223200');
INSERT INTO `china_areas` VALUES ('1212', '116', '淮阴区', '223300');
INSERT INTO `china_areas` VALUES ('1213', '116', '清浦区', '223002');
INSERT INTO `china_areas` VALUES ('1214', '116', '涟水县', '223400');
INSERT INTO `china_areas` VALUES ('1215', '116', '洪泽县', '223100');
INSERT INTO `china_areas` VALUES ('1216', '116', '盱眙县', '211700');
INSERT INTO `china_areas` VALUES ('1217', '116', '金湖县', '211600');
INSERT INTO `china_areas` VALUES ('1218', '117', '亭湖区', '224005');
INSERT INTO `china_areas` VALUES ('1219', '117', '盐都区', '224055');
INSERT INTO `china_areas` VALUES ('1220', '117', '响水县', '224600');
INSERT INTO `china_areas` VALUES ('1221', '117', '滨海县', '224500');
INSERT INTO `china_areas` VALUES ('1222', '117', '阜宁县', '224400');
INSERT INTO `china_areas` VALUES ('1223', '117', '射阳县', '224300');
INSERT INTO `china_areas` VALUES ('1224', '117', '建湖县', '224700');
INSERT INTO `china_areas` VALUES ('1225', '117', '东台市', '224200');
INSERT INTO `china_areas` VALUES ('1226', '117', '大丰市', '224100');
INSERT INTO `china_areas` VALUES ('1227', '118', '广陵区', '225002');
INSERT INTO `china_areas` VALUES ('1228', '118', '邗江区', '225002');
INSERT INTO `china_areas` VALUES ('1229', '118', '宝应县', '225800');
INSERT INTO `china_areas` VALUES ('1230', '118', '仪征市', '211400');
INSERT INTO `china_areas` VALUES ('1231', '118', '高邮市', '225600');
INSERT INTO `china_areas` VALUES ('1232', '118', '江都市', '225200');
INSERT INTO `china_areas` VALUES ('1233', '118', '维扬区', '225002');
INSERT INTO `china_areas` VALUES ('1234', '118', '经济开发区', '225101');
INSERT INTO `china_areas` VALUES ('1235', '119', '京口区', '212001');
INSERT INTO `china_areas` VALUES ('1236', '119', '润州区', '212004');
INSERT INTO `china_areas` VALUES ('1237', '119', '丹徒区', '212001');
INSERT INTO `china_areas` VALUES ('1238', '119', '丹阳市', '212300');
INSERT INTO `china_areas` VALUES ('1239', '119', '扬中市', '212200');
INSERT INTO `china_areas` VALUES ('1240', '119', '句容市', '212400');
INSERT INTO `china_areas` VALUES ('1241', '119', '新区', '212132');
INSERT INTO `china_areas` VALUES ('1242', '120', '海陵区', '225300');
INSERT INTO `china_areas` VALUES ('1243', '120', '高港区', '225321');
INSERT INTO `china_areas` VALUES ('1244', '120', '兴化市', '225700');
INSERT INTO `china_areas` VALUES ('1245', '120', '靖江市', '214500');
INSERT INTO `china_areas` VALUES ('1246', '120', '泰兴市', '225400');
INSERT INTO `china_areas` VALUES ('1247', '120', '姜堰市', '225500');
INSERT INTO `china_areas` VALUES ('1248', '121', '宿城区', '223800');
INSERT INTO `china_areas` VALUES ('1249', '121', '宿豫区', '223800');
INSERT INTO `china_areas` VALUES ('1250', '121', '沭阳县', '223600');
INSERT INTO `china_areas` VALUES ('1251', '121', '泗阳县', '223700');
INSERT INTO `china_areas` VALUES ('1252', '121', '泗洪县', '223900');
INSERT INTO `china_areas` VALUES ('1253', '122', '上城区', '310002');
INSERT INTO `china_areas` VALUES ('1254', '122', '下城区', '310006');
INSERT INTO `china_areas` VALUES ('1255', '122', '江干区', '310016');
INSERT INTO `china_areas` VALUES ('1256', '122', '拱墅区', '310011');
INSERT INTO `china_areas` VALUES ('1257', '122', '西湖区', '310013');
INSERT INTO `china_areas` VALUES ('1258', '122', '滨江区', '310051');
INSERT INTO `china_areas` VALUES ('1259', '122', '萧山区', '311200');
INSERT INTO `china_areas` VALUES ('1260', '122', '余杭区', '311100');
INSERT INTO `china_areas` VALUES ('1261', '122', '桐庐县', '311500');
INSERT INTO `china_areas` VALUES ('1262', '122', '淳安县', '311700');
INSERT INTO `china_areas` VALUES ('1263', '122', '建德市', '311600');
INSERT INTO `china_areas` VALUES ('1264', '122', '富阳市', '311400');
INSERT INTO `china_areas` VALUES ('1265', '122', '临安市', '311300');
INSERT INTO `china_areas` VALUES ('1266', '123', '海曙区', '315000');
INSERT INTO `china_areas` VALUES ('1267', '123', '江东区', '315040');
INSERT INTO `china_areas` VALUES ('1268', '123', '江北区', '315040');
INSERT INTO `china_areas` VALUES ('1269', '123', '北仑区', '315800');
INSERT INTO `china_areas` VALUES ('1270', '123', '镇海区', '315200');
INSERT INTO `china_areas` VALUES ('1271', '123', '鄞州区', '315100');
INSERT INTO `china_areas` VALUES ('1272', '123', '象山县', '315700');
INSERT INTO `china_areas` VALUES ('1273', '123', '宁海县', '315600');
INSERT INTO `china_areas` VALUES ('1274', '123', '余姚市', '315400');
INSERT INTO `china_areas` VALUES ('1275', '123', '慈溪市', '315300');
INSERT INTO `china_areas` VALUES ('1276', '123', '奉化市', '315500');
INSERT INTO `china_areas` VALUES ('1277', '123', '国家高新区', '315040');
INSERT INTO `china_areas` VALUES ('1278', '124', '鹿城区', '325000');
INSERT INTO `china_areas` VALUES ('1279', '124', '龙湾区', '325013');
INSERT INTO `china_areas` VALUES ('1280', '124', '瓯海区', '325005');
INSERT INTO `china_areas` VALUES ('1281', '124', '洞头县', '325700');
INSERT INTO `china_areas` VALUES ('1282', '124', '永嘉县', '315100');
INSERT INTO `china_areas` VALUES ('1283', '124', '平阳县', '325400');
INSERT INTO `china_areas` VALUES ('1284', '124', '苍南县', '325800');
INSERT INTO `china_areas` VALUES ('1285', '124', '文成县', '325300');
INSERT INTO `china_areas` VALUES ('1286', '124', '泰顺县', '325500');
INSERT INTO `china_areas` VALUES ('1287', '124', '瑞安市', '325200');
INSERT INTO `china_areas` VALUES ('1288', '124', '乐清市', '325600');
INSERT INTO `china_areas` VALUES ('1289', '125', '秀洲区', '314001');
INSERT INTO `china_areas` VALUES ('1290', '125', '嘉善县', '314100');
INSERT INTO `china_areas` VALUES ('1291', '125', '海盐县', '314300');
INSERT INTO `china_areas` VALUES ('1292', '125', '海宁市', '314400');
INSERT INTO `china_areas` VALUES ('1293', '125', '平湖市', '314200');
INSERT INTO `china_areas` VALUES ('1294', '125', '桐乡市', '314500');
INSERT INTO `china_areas` VALUES ('1295', '125', '南湖区', '314001');
INSERT INTO `china_areas` VALUES ('1296', '126', '吴兴区', '313000');
INSERT INTO `china_areas` VALUES ('1297', '126', '南浔区', '313009');
INSERT INTO `china_areas` VALUES ('1298', '126', '德清县', '313200');
INSERT INTO `china_areas` VALUES ('1299', '126', '长兴县', '313100');
INSERT INTO `china_areas` VALUES ('1300', '126', '安吉县', '313300');
INSERT INTO `china_areas` VALUES ('1301', '127', '越城区', '312000');
INSERT INTO `china_areas` VALUES ('1302', '127', '绍兴县', '312000');
INSERT INTO `china_areas` VALUES ('1303', '127', '新昌县', '312500');
INSERT INTO `china_areas` VALUES ('1304', '127', '诸暨市', '311800');
INSERT INTO `china_areas` VALUES ('1305', '127', '上虞市', '312300');
INSERT INTO `china_areas` VALUES ('1306', '127', '嵊州市', '312400');
INSERT INTO `china_areas` VALUES ('1307', '128', '婺城区', '321000');
INSERT INTO `china_areas` VALUES ('1308', '128', '金东区', '321000');
INSERT INTO `china_areas` VALUES ('1309', '128', '武义县', '321200');
INSERT INTO `china_areas` VALUES ('1310', '128', '浦江县', '322200');
INSERT INTO `china_areas` VALUES ('1311', '128', '磐安县', '322300');
INSERT INTO `china_areas` VALUES ('1312', '128', '兰溪市', '321100');
INSERT INTO `china_areas` VALUES ('1313', '128', '义乌市', '322000');
INSERT INTO `china_areas` VALUES ('1314', '128', '东阳市', '322100');
INSERT INTO `china_areas` VALUES ('1315', '128', '永康市', '321300');
INSERT INTO `china_areas` VALUES ('1316', '129', '柯城区', '324100');
INSERT INTO `china_areas` VALUES ('1317', '129', '衢江区', '324022');
INSERT INTO `china_areas` VALUES ('1318', '129', '常山县', '324200');
INSERT INTO `china_areas` VALUES ('1319', '129', '开化县', '324300');
INSERT INTO `china_areas` VALUES ('1320', '129', '龙游县', '324400');
INSERT INTO `china_areas` VALUES ('1321', '129', '江山市', '324100');
INSERT INTO `china_areas` VALUES ('1322', '130', '定海区', '316000');
INSERT INTO `china_areas` VALUES ('1323', '130', '普陀区', '316100');
INSERT INTO `china_areas` VALUES ('1324', '130', '岱山县', '316200');
INSERT INTO `china_areas` VALUES ('1325', '130', '嵊泗县', '202450');
INSERT INTO `china_areas` VALUES ('1326', '131', '椒江区', '318000');
INSERT INTO `china_areas` VALUES ('1327', '131', '路桥区', '318050');
INSERT INTO `china_areas` VALUES ('1328', '131', '黄岩区', '318020');
INSERT INTO `china_areas` VALUES ('1329', '131', '玉环县', '317600');
INSERT INTO `china_areas` VALUES ('1330', '131', '三门县', '317100');
INSERT INTO `china_areas` VALUES ('1331', '131', '天台县', '317200');
INSERT INTO `china_areas` VALUES ('1332', '131', '仙居县', '317300');
INSERT INTO `china_areas` VALUES ('1333', '131', '温岭市', '317500');
INSERT INTO `china_areas` VALUES ('1334', '131', '临海市', '317000');
INSERT INTO `china_areas` VALUES ('1335', '132', '莲都区', '323000');
INSERT INTO `china_areas` VALUES ('1336', '132', '青田县', '323900');
INSERT INTO `china_areas` VALUES ('1337', '132', '缙云县', '321400');
INSERT INTO `china_areas` VALUES ('1338', '132', '遂昌县', '323300');
INSERT INTO `china_areas` VALUES ('1339', '132', '松阳县', '323400');
INSERT INTO `china_areas` VALUES ('1340', '132', '云和县', '323600');
INSERT INTO `china_areas` VALUES ('1341', '132', '庆元县', '323800');
INSERT INTO `china_areas` VALUES ('1342', '132', '景宁畲族自治县', '323500');
INSERT INTO `china_areas` VALUES ('1343', '132', '龙泉市', '323700');
INSERT INTO `china_areas` VALUES ('1344', '133', '瑶海区', '230011');
INSERT INTO `china_areas` VALUES ('1345', '133', '庐阳区', '230001');
INSERT INTO `china_areas` VALUES ('1346', '133', '蜀山区', '230031');
INSERT INTO `china_areas` VALUES ('1347', '133', '包河区', '230041');
INSERT INTO `china_areas` VALUES ('1348', '133', '长丰县', '231100');
INSERT INTO `china_areas` VALUES ('1349', '133', '肥东县', '231600');
INSERT INTO `china_areas` VALUES ('1350', '133', '肥西县', '231200');
INSERT INTO `china_areas` VALUES ('1351', '133', '经济技术开发区', '230601');
INSERT INTO `china_areas` VALUES ('1352', '133', '新站试验区', '230011');
INSERT INTO `china_areas` VALUES ('1353', '133', '政务文化新区', '230066');
INSERT INTO `china_areas` VALUES ('1354', '133', '高新技术产业开发区', '230088');
INSERT INTO `china_areas` VALUES ('1355', '134', '镜湖区', '241000');
INSERT INTO `china_areas` VALUES ('1356', '134', '鸠江区', '241000');
INSERT INTO `china_areas` VALUES ('1357', '134', '芜湖县', '241100');
INSERT INTO `china_areas` VALUES ('1358', '134', '繁昌县', '241200');
INSERT INTO `china_areas` VALUES ('1359', '134', '南陵县', '242400');
INSERT INTO `china_areas` VALUES ('1360', '134', '弋江区', '241000');
INSERT INTO `china_areas` VALUES ('1361', '134', '三山区', '241000');
INSERT INTO `china_areas` VALUES ('1362', '135', '龙子湖区', '233000');
INSERT INTO `china_areas` VALUES ('1363', '135', '蚌山区', '233000');
INSERT INTO `china_areas` VALUES ('1364', '135', '禹会区', '233000');
INSERT INTO `china_areas` VALUES ('1365', '135', '淮上区', '233000');
INSERT INTO `china_areas` VALUES ('1366', '135', '怀远县', '233400');
INSERT INTO `china_areas` VALUES ('1367', '135', '五河县', '233300');
INSERT INTO `china_areas` VALUES ('1368', '135', '固镇县', '233700');
INSERT INTO `china_areas` VALUES ('1369', '136', '大通区', '232033');
INSERT INTO `china_areas` VALUES ('1370', '136', '田家庵区', '232000');
INSERT INTO `china_areas` VALUES ('1371', '136', '谢家集区', '232052');
INSERT INTO `china_areas` VALUES ('1372', '136', '八公山区', '232072');
INSERT INTO `china_areas` VALUES ('1373', '136', '潘集区', '232082');
INSERT INTO `china_areas` VALUES ('1374', '136', '凤台县', '232100');
INSERT INTO `china_areas` VALUES ('1375', '137', '雨山区', '243071');
INSERT INTO `china_areas` VALUES ('1376', '137', '花山区', '243000');
INSERT INTO `china_areas` VALUES ('1377', '137', '金家庄区', '243021');
INSERT INTO `china_areas` VALUES ('1378', '137', '当涂县', '243100');
INSERT INTO `china_areas` VALUES ('1379', '137', '经济技术开发区', '243041');
INSERT INTO `china_areas` VALUES ('1380', '138', '杜集区', '235000');
INSERT INTO `china_areas` VALUES ('1381', '138', '相山区', '235000');
INSERT INTO `china_areas` VALUES ('1382', '138', '烈山区', '235000');
INSERT INTO `china_areas` VALUES ('1383', '138', '濉溪县', '235100');
INSERT INTO `china_areas` VALUES ('1384', '139', '铜官山区', '244000');
INSERT INTO `china_areas` VALUES ('1385', '139', '狮子山区', '244000');
INSERT INTO `china_areas` VALUES ('1386', '139', '郊区', '244000');
INSERT INTO `china_areas` VALUES ('1387', '139', '铜陵县', '244100');
INSERT INTO `china_areas` VALUES ('1388', '140', '迎江区', '246001');
INSERT INTO `china_areas` VALUES ('1389', '140', '大观区', '246002');
INSERT INTO `china_areas` VALUES ('1390', '140', '怀宁县', '246100');
INSERT INTO `china_areas` VALUES ('1391', '140', '枞阳县', '246700');
INSERT INTO `china_areas` VALUES ('1392', '140', '潜山县', '246300');
INSERT INTO `china_areas` VALUES ('1393', '140', '太湖县', '246400');
INSERT INTO `china_areas` VALUES ('1394', '140', '宿松县', '246500');
INSERT INTO `china_areas` VALUES ('1395', '140', '望江县', '246200');
INSERT INTO `china_areas` VALUES ('1396', '140', '岳西县', '246600');
INSERT INTO `china_areas` VALUES ('1397', '140', '桐城市', '231400');
INSERT INTO `china_areas` VALUES ('1398', '140', '宜秀区', '246003');
INSERT INTO `china_areas` VALUES ('1399', '141', '屯溪区', '245000');
INSERT INTO `china_areas` VALUES ('1400', '141', '黄山区', '242700');
INSERT INTO `china_areas` VALUES ('1401', '141', '徽州区', '245061');
INSERT INTO `china_areas` VALUES ('1402', '141', '歙县', '245200');
INSERT INTO `china_areas` VALUES ('1403', '141', '休宁县', '245400');
INSERT INTO `china_areas` VALUES ('1404', '141', '黟县', '245500');
INSERT INTO `china_areas` VALUES ('1405', '141', '祁门县', '245600');
INSERT INTO `china_areas` VALUES ('1406', '142', '琅琊区', '239000');
INSERT INTO `china_areas` VALUES ('1407', '142', '南谯区', '239000');
INSERT INTO `china_areas` VALUES ('1408', '142', '来安县', '239200');
INSERT INTO `china_areas` VALUES ('1409', '142', '全椒县', '239500');
INSERT INTO `china_areas` VALUES ('1410', '142', '定远县', '233200');
INSERT INTO `china_areas` VALUES ('1411', '142', '凤阳县', '233100');
INSERT INTO `china_areas` VALUES ('1412', '142', '天长市', '239300');
INSERT INTO `china_areas` VALUES ('1413', '142', '明光市', '239400');
INSERT INTO `china_areas` VALUES ('1414', '143', '颍州区', '236001');
INSERT INTO `china_areas` VALUES ('1415', '143', '颍东区', '236058');
INSERT INTO `china_areas` VALUES ('1416', '143', '颍泉区', '236045');
INSERT INTO `china_areas` VALUES ('1417', '143', '临泉县', '236400');
INSERT INTO `china_areas` VALUES ('1418', '143', '太和县', '236600');
INSERT INTO `china_areas` VALUES ('1419', '143', '阜南县', '236300');
INSERT INTO `china_areas` VALUES ('1420', '143', '颍上县', '236200');
INSERT INTO `china_areas` VALUES ('1421', '143', '界首市', '236500');
INSERT INTO `china_areas` VALUES ('1422', '143', '经济开发区', '236112');
INSERT INTO `china_areas` VALUES ('1423', '144', '埇桥区', '234000');
INSERT INTO `china_areas` VALUES ('1424', '144', '砀山县', '235300');
INSERT INTO `china_areas` VALUES ('1425', '144', '萧县', '235200');
INSERT INTO `china_areas` VALUES ('1426', '144', '灵璧县', '234200');
INSERT INTO `china_areas` VALUES ('1427', '144', '泗县', '234300');
INSERT INTO `china_areas` VALUES ('1428', '145', '居巢区', '238000');
INSERT INTO `china_areas` VALUES ('1429', '145', '庐江县', '231500');
INSERT INTO `china_areas` VALUES ('1430', '145', '无为县', '238300');
INSERT INTO `china_areas` VALUES ('1431', '145', '含山县', '238100');
INSERT INTO `china_areas` VALUES ('1432', '145', '和县', '238200');
INSERT INTO `china_areas` VALUES ('1433', '146', '金安区', '237000');
INSERT INTO `china_areas` VALUES ('1434', '146', '裕安区', '237010');
INSERT INTO `china_areas` VALUES ('1435', '146', '寿县', '232200');
INSERT INTO `china_areas` VALUES ('1436', '146', '霍邱县', '237400');
INSERT INTO `china_areas` VALUES ('1437', '146', '舒城县', '231300');
INSERT INTO `china_areas` VALUES ('1438', '146', '金寨县', '237300');
INSERT INTO `china_areas` VALUES ('1439', '146', '霍山县', '237200');
INSERT INTO `china_areas` VALUES ('1440', '147', '谯城区', '236800');
INSERT INTO `china_areas` VALUES ('1441', '147', '涡阳县', '233600');
INSERT INTO `china_areas` VALUES ('1442', '147', '蒙城县', '233500');
INSERT INTO `china_areas` VALUES ('1443', '147', '利辛县', '236700');
INSERT INTO `china_areas` VALUES ('1444', '148', '贵池区', '247100');
INSERT INTO `china_areas` VALUES ('1445', '148', '东至县', '247200');
INSERT INTO `china_areas` VALUES ('1446', '148', '石台县', '245100');
INSERT INTO `china_areas` VALUES ('1447', '148', '青阳县', '242800');
INSERT INTO `china_areas` VALUES ('1448', '149', '宣州区', '242000');
INSERT INTO `china_areas` VALUES ('1449', '149', '郎溪县', '242100');
INSERT INTO `china_areas` VALUES ('1450', '149', '广德县', '242200');
INSERT INTO `china_areas` VALUES ('1451', '149', '泾县', '242500');
INSERT INTO `china_areas` VALUES ('1452', '149', '绩溪县', '245300');
INSERT INTO `china_areas` VALUES ('1453', '149', '旌德县', '242600');
INSERT INTO `china_areas` VALUES ('1454', '149', '宁国市', '242300');
INSERT INTO `china_areas` VALUES ('1455', '150', '鼓楼区', '350001');
INSERT INTO `china_areas` VALUES ('1456', '150', '台江区', '350004');
INSERT INTO `china_areas` VALUES ('1457', '150', '仓山区', '350007');
INSERT INTO `china_areas` VALUES ('1458', '150', '马尾区', '350015');
INSERT INTO `china_areas` VALUES ('1459', '150', '晋安区', '350011');
INSERT INTO `china_areas` VALUES ('1460', '150', '闽侯县', '350100');
INSERT INTO `china_areas` VALUES ('1461', '150', '连江县', '350500');
INSERT INTO `china_areas` VALUES ('1462', '150', '罗源县', '350600');
INSERT INTO `china_areas` VALUES ('1463', '150', '闽清县', '350800');
INSERT INTO `china_areas` VALUES ('1464', '150', '永泰县', '350700');
INSERT INTO `china_areas` VALUES ('1465', '150', '平潭县', '350400');
INSERT INTO `china_areas` VALUES ('1466', '150', '福清市', '350300');
INSERT INTO `china_areas` VALUES ('1467', '150', '长乐市', '350200');
INSERT INTO `china_areas` VALUES ('1468', '151', '思明区', '361001');
INSERT INTO `china_areas` VALUES ('1469', '151', '海沧区', '361026');
INSERT INTO `china_areas` VALUES ('1470', '151', '湖里区', '361006');
INSERT INTO `china_areas` VALUES ('1471', '151', '集美区', '361021');
INSERT INTO `china_areas` VALUES ('1472', '151', '同安区', '361100');
INSERT INTO `china_areas` VALUES ('1473', '151', '翔安区', '361101');
INSERT INTO `china_areas` VALUES ('1474', '151', '鼓浪屿区', '361002');
INSERT INTO `china_areas` VALUES ('1475', '151', '象屿保税区', '361006');
INSERT INTO `china_areas` VALUES ('1476', '151', '火炬高新区', '361006');
INSERT INTO `china_areas` VALUES ('1477', '152', '城厢区', '351100');
INSERT INTO `china_areas` VALUES ('1478', '152', '涵江区', '351111');
INSERT INTO `china_areas` VALUES ('1479', '152', '荔城区', '351100');
INSERT INTO `china_areas` VALUES ('1480', '152', '秀屿区', '351152');
INSERT INTO `china_areas` VALUES ('1481', '152', '仙游县', '351200');
INSERT INTO `china_areas` VALUES ('1482', '153', '梅列区', '365000');
INSERT INTO `china_areas` VALUES ('1483', '153', '三元区', '365001');
INSERT INTO `china_areas` VALUES ('1484', '153', '明溪县', '365200');
INSERT INTO `china_areas` VALUES ('1485', '153', '清流县', '365300');
INSERT INTO `china_areas` VALUES ('1486', '153', '宁化县', '365400');
INSERT INTO `china_areas` VALUES ('1487', '153', '大田县', '366100');
INSERT INTO `china_areas` VALUES ('1488', '153', '尤溪县', '365100');
INSERT INTO `china_areas` VALUES ('1489', '153', '沙县', '365500');
INSERT INTO `china_areas` VALUES ('1490', '153', '将乐县', '353300');
INSERT INTO `china_areas` VALUES ('1491', '153', '泰宁县', '354400');
INSERT INTO `china_areas` VALUES ('1492', '153', '建宁县', '354500');
INSERT INTO `china_areas` VALUES ('1493', '153', '永安市', '366000');
INSERT INTO `china_areas` VALUES ('1494', '154', '鲤城区', '362000');
INSERT INTO `china_areas` VALUES ('1495', '154', '丰泽区', '362000');
INSERT INTO `china_areas` VALUES ('1496', '154', '洛江区', '362011');
INSERT INTO `china_areas` VALUES ('1497', '154', '泉港区', '362114');
INSERT INTO `china_areas` VALUES ('1498', '154', '惠安县', '362100');
INSERT INTO `china_areas` VALUES ('1499', '154', '安溪县', '362400');
INSERT INTO `china_areas` VALUES ('1500', '154', '永春县', '362600');
INSERT INTO `china_areas` VALUES ('1501', '154', '德化县', '362500');
INSERT INTO `china_areas` VALUES ('1502', '154', '金门县', '362000');
INSERT INTO `china_areas` VALUES ('1503', '154', '石狮市', '362700');
INSERT INTO `china_areas` VALUES ('1504', '154', '晋江市', '362200');
INSERT INTO `china_areas` VALUES ('1505', '154', '南安市', '362300');
INSERT INTO `china_areas` VALUES ('1506', '154', '经济技术开发区', '362005');
INSERT INTO `china_areas` VALUES ('1507', '155', '芗城区', '363000');
INSERT INTO `china_areas` VALUES ('1508', '155', '龙文区', '363005');
INSERT INTO `china_areas` VALUES ('1509', '155', '云霄县', '363300');
INSERT INTO `china_areas` VALUES ('1510', '155', '漳浦县', '363200');
INSERT INTO `china_areas` VALUES ('1511', '155', '诏安县', '363500');
INSERT INTO `china_areas` VALUES ('1512', '155', '长泰县', '363900');
INSERT INTO `china_areas` VALUES ('1513', '155', '东山县', '363400');
INSERT INTO `china_areas` VALUES ('1514', '155', '南靖县', '363600');
INSERT INTO `china_areas` VALUES ('1515', '155', '平和县', '363700');
INSERT INTO `china_areas` VALUES ('1516', '155', '华安县', '363800');
INSERT INTO `china_areas` VALUES ('1517', '155', '龙海市', '363100');
INSERT INTO `china_areas` VALUES ('1518', '156', '延平区', '353000');
INSERT INTO `china_areas` VALUES ('1519', '156', '顺昌县', '353200');
INSERT INTO `china_areas` VALUES ('1520', '156', '浦城县', '353400');
INSERT INTO `china_areas` VALUES ('1521', '156', '光泽县', '354100');
INSERT INTO `china_areas` VALUES ('1522', '156', '松溪县', '353500');
INSERT INTO `china_areas` VALUES ('1523', '156', '政和县', '353600');
INSERT INTO `china_areas` VALUES ('1524', '156', '邵武市', '354000');
INSERT INTO `china_areas` VALUES ('1525', '156', '武夷山市', '354300');
INSERT INTO `china_areas` VALUES ('1526', '156', '建瓯市', '353100');
INSERT INTO `china_areas` VALUES ('1527', '156', '建阳市', '354200');
INSERT INTO `china_areas` VALUES ('1528', '157', '新罗区', '364000');
INSERT INTO `china_areas` VALUES ('1529', '157', '长汀县', '366300');
INSERT INTO `china_areas` VALUES ('1530', '157', '永定县', '364100');
INSERT INTO `china_areas` VALUES ('1531', '157', '上杭县', '364200');
INSERT INTO `china_areas` VALUES ('1532', '157', '武平县', '364300');
INSERT INTO `china_areas` VALUES ('1533', '157', '连城县', '366200');
INSERT INTO `china_areas` VALUES ('1534', '157', '漳平市', '364400');
INSERT INTO `china_areas` VALUES ('1535', '158', '蕉城区', '352100');
INSERT INTO `china_areas` VALUES ('1536', '158', '霞浦县', '355100');
INSERT INTO `china_areas` VALUES ('1537', '158', '古田县', '352200');
INSERT INTO `china_areas` VALUES ('1538', '158', '屏南县', '352300');
INSERT INTO `china_areas` VALUES ('1539', '158', '寿宁县', '355500');
INSERT INTO `china_areas` VALUES ('1540', '158', '周宁县', '355400');
INSERT INTO `china_areas` VALUES ('1541', '158', '柘荣县', '355300');
INSERT INTO `china_areas` VALUES ('1542', '158', '福安市', '355000');
INSERT INTO `china_areas` VALUES ('1543', '158', '福鼎市', '355200');
INSERT INTO `china_areas` VALUES ('1544', '159', '东湖区', '330006');
INSERT INTO `china_areas` VALUES ('1545', '159', '西湖区', '330009');
INSERT INTO `china_areas` VALUES ('1', '0', '-', '0');

-- ----------------------------
-- Table structure for `c_webconfig`
-- ----------------------------
DROP TABLE IF EXISTS `c_webconfig`;
CREATE TABLE `c_webconfig` (
  `id` int(11) NOT NULL auto_increment COMMENT 'id',
  `k` varchar(100) default NULL COMMENT 'key 键',
  `val` varchar(150) default NULL COMMENT 'value 值',
  `des` varchar(255) default NULL COMMENT 'description 描述',
  `create_time` datetime default NULL COMMENT '创建时间',
  `update_time` datetime default NULL COMMENT '更新时间',
  `is_system` char(1) default '0' COMMENT '是否系统配置 否：0 是：1',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_webconfig
-- ----------------------------
INSERT INTO `c_webconfig` VALUES ('1', 'webName', '恒通商务信息咨询有限公司', '网站名称', '2014-12-02 09:55:13', null, '1');
INSERT INTO `c_webconfig` VALUES ('2', 'webCopyright', '版权所有&copy; 2015 www.htsw.org', '网站底部copyright', '2014-12-02 09:55:13', null, '1');
INSERT INTO `c_webconfig` VALUES ('3', 'ICP', '苏ICP备14019371号-2', '网站ICP', '2014-12-02 09:55:13', null, '1');
INSERT INTO `c_webconfig` VALUES ('4', 'webVersion', '1.0.1', '网站版本', '2014-12-02 09:55:13', '2015-05-13 17:59:46', '1');
INSERT INTO `c_webconfig` VALUES ('5', 'keywords', '关键词123', '关键词', '2014-12-02 09:55:13', '2015-05-13 17:59:36', '1');
INSERT INTO `c_webconfig` VALUES ('6', 'description', '描述信息', '描述信息', '2014-12-02 09:55:13', null, '1');
INSERT INTO `c_webconfig` VALUES ('7', 'hotline', '0518-88888888', '客服热线', '2014-12-02 09:55:13', null, '1');
INSERT INTO `c_webconfig` VALUES ('8', 'email', 'help@htsw.org', '客服邮箱', '2014-12-02 09:55:13', null, '1');
INSERT INTO `c_webconfig` VALUES ('9', 'companyname', '恒通商务信息咨询有限公司', '公司名称', '2014-12-02 09:55:13', null, '1');
INSERT INTO `c_webconfig` VALUES ('10', 'weburl', 'http://www.htsw.org', '公司网址', '2014-12-02 09:55:13', null, '1');
INSERT INTO `c_webconfig` VALUES ('101', 'email_from', 'fdqlbf@126.com', '发邮件地址', '2014-12-02 09:55:13', null, '1');
INSERT INTO `c_webconfig` VALUES ('102', 'email_host', 'smtp.126.com', '邮件服务器', '2014-12-02 09:55:13', null, '1');
INSERT INTO `c_webconfig` VALUES ('103', 'email_user', 'fdqlbf', '邮件的用户名', '2014-12-02 09:55:13', null, '1');
INSERT INTO `c_webconfig` VALUES ('104', 'email_upsd', 'FdqLbf791211', '邮件的密码', '2014-12-02 09:55:13', null, '1');
INSERT INTO `c_webconfig` VALUES ('201', 'home_ms_1_article', '贷款额度高、范围大', '首页描述1 标题', '2014-12-02 09:55:13', null, '1');
INSERT INTO `c_webconfig` VALUES ('202', 'home_ms_1_line1', '贷款额度最低x万元，最高xx万元，', '首页描述1 第一行', '2014-12-02 09:55:13', null, '1');
INSERT INTO `c_webconfig` VALUES ('203', 'home_ms_1_line2', '精英贷、工薪贷、恒楼贷、商户贷、企业贷，总有一款适合你。', '首页描述1 第二行', '2014-12-02 09:55:13', null, '1');
INSERT INTO `c_webconfig` VALUES ('204', 'home_ms_2_article', '手续简单，下款快', '首页描述2 标题', '2014-12-02 09:55:13', null, '1');
INSERT INTO `c_webconfig` VALUES ('205', 'home_ms_2_line1', '最快x天到账，手续超简单，速度超快。', '首页描述2 第一行', '2014-12-02 09:55:13', null, '1');
INSERT INTO `c_webconfig` VALUES ('206', 'home_ms_2_line2', ' ', '首页描述2 第二行', '2014-12-02 09:55:13', null, '1');
INSERT INTO `c_webconfig` VALUES ('207', 'home_ms_3_article', '利息低、零手续费', '首页描述3 标题', '2014-12-02 09:55:13', null, '1');
INSERT INTO `c_webconfig` VALUES ('208', 'home_ms_3_line1', '最低0.xx%月利，年利率低至x.xx%的信用贷，', '首页描述3 第一行', '2014-12-02 09:55:13', null, '1');
INSERT INTO `c_webconfig` VALUES ('209', 'home_ms_3_line2', '0手续费，打破行规，完全免费。', '首页描述3 第二行', '2014-12-02 09:55:13', null, '1');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL auto_increment COMMENT 'id',
  `username` varchar(80) default NULL COMMENT '登录账号',
  `password` varchar(64) default NULL COMMENT '登录密码',
  `nickname` varchar(50) default NULL COMMENT '昵称',
  `name` varchar(30) default NULL COMMENT '姓名',
  `sex` char(1) default '0' COMMENT '性别 默认：0（男） 女：1',
  `birthday` date default NULL COMMENT '生日',
  `head_photo_path` varchar(150) default NULL COMMENT '头像路径',
  `signature` varchar(255) default NULL COMMENT '个性签名',
  `email` varchar(150) default NULL COMMENT '个人网站',
  `type` char(1) default '0' COMMENT '用户类型 默认：0（普通用户） 管理员：1',
  `login_status` char(1) default '0' COMMENT '是否登录状态 默认：0 在线：1',
  `create_time` datetime default NULL COMMENT '创建时间',
  `update_time` datetime default NULL COMMENT '更新时间',
  `last_login_time` datetime default NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(15) default NULL COMMENT '最后登录IP',
  `delete_status` char(1) default '0' COMMENT '删除状态 默认：0 删除：1',
  `enable` char(1) default '0' COMMENT '是否停用 默认：0 停用：1',
  `reg_valid` varchar(256) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '无', '21232f297a57a5aab269fa0e4a801fc3', '客户', '客户', '0', null, null, null, null, '1', '1', null, null, '2015-05-16 12:57:37', '', '0', '0', null);
INSERT INTO `user` VALUES ('2', 'hengtong8', 'cfceb6027a2cf04ab269fc4e4dda53d8', '恒通商务', '恒通商务', '0', null, null, null, 'hengtong8@htsw.org', '1', '1', null, null, '2015-06-20 17:53:35', '127.0.0.1', '0', '0', null);
INSERT INTO `user` VALUES ('9', '无处理人员', 'asdfasfqwefSDfawdfhtf tsdfg', '无处理人员', '无处理人员', '0', null, null, null, '无处理人员', '0', '0', '2015-05-21 12:13:18', null, '2015-05-21 12:13:18', '127.0.0.1', '0', '0', null);
INSERT INTO `user` VALUES ('21', 'employee', 'cb081f2d4b733821a865f5d306a7c8f2', null, '业务员', '0', null, null, null, 'employee@htsw.org', '0', '0', '2015-05-21 12:13:18', null, '2015-05-21 12:17:54', null, '0', '0', null);
INSERT INTO `user` VALUES ('22', 'member1', 'c07a9d9db49ed8cb44c835f7104ddab6', null, '用户0001', '0', null, null, null, 'member1@qq.com', '0', '0', '2015-05-21 12:18:44', null, '2015-06-20 13:40:10', null, '0', '0', 'checked');
INSERT INTO `user` VALUES ('23', 'member2', '30eaeba7dd9028fde058874ada890121', null, '用户2', '0', null, null, null, 'member2@qq.com', '0', '0', '2015-05-21 12:22:00', null, '2015-06-20 13:40:20', null, '0', '0', 'checked');
INSERT INTO `user` VALUES ('24', 'snowfigure1', '6c6d18ba639f0f70c98b9ef30c44418a', null, null, '0', null, null, null, 'fengduqing@126.com', '0', '0', '2015-05-24 10:37:31', null, '2015-05-24 10:37:38', null, '0', '0', 'checked');
INSERT INTO `user` VALUES ('25', 'member3', 'e6b46d9625c11962b29a423aecf98dcd', null, null, '0', null, null, null, 'member3@126.com', '0', '0', '2015-06-20 13:38:19', null, '2015-06-20 13:41:14', null, '0', '0', 'checked');
INSERT INTO `user` VALUES ('26', 'member4', '968dd92d435d4c859321b06d28357ce1', null, null, '0', null, null, null, 'member4@126.com', '0', '0', '2015-06-20 13:38:35', null, '2015-06-20 13:41:42', null, '0', '0', 'checked');
INSERT INTO `user` VALUES ('27', 'member5', 'ac4c49a2d9cb9979bb4cdb5c8522ca07', null, null, '0', null, null, null, 'member5@126.com', '0', '0', '2015-06-20 13:38:47', null, null, null, '0', '0', 'checked');
INSERT INTO `user` VALUES ('28', 'member6', 'e37b17480b1005520aac42fb967c93d5', null, null, '0', null, null, null, 'member6@126.com', '0', '0', '2015-06-20 13:39:02', null, null, null, '0', '0', 'checked');

-- ----------------------------
-- Table structure for `user_bank`
-- ----------------------------
DROP TABLE IF EXISTS `user_bank`;
CREATE TABLE `user_bank` (
  `id` int(11) NOT NULL auto_increment,
  `uid` int(11) default NULL,
  `apply_id` int(11) default NULL,
  `bank_card_no` varchar(32) default NULL COMMENT '下款银行卡账号',
  `back_name` varchar(256) default NULL COMMENT '开户行',
  `credit_card_number` int(11) default NULL COMMENT '信用卡数量',
  `credit_card_limit` double default NULL COMMENT '信用卡额度',
  `other_debt` double default NULL COMMENT '其它负债',
  `month_payment` double default NULL COMMENT '月还款',
  `credit_score_username` varchar(128) default NULL COMMENT '征信登录名',
  `credit_score_password` varchar(128) default NULL COMMENT '征信密码',
  `credit_score_search_code` varchar(128) default NULL COMMENT '查询码',
  `credit_score_active_code` varchar(128) default NULL COMMENT '激活码',
  `electricity_bill_no` varchar(128) default NULL COMMENT '电费单编号',
  `electricity_bill_house_name` varchar(128) default NULL COMMENT '电费单户名',
  `electricity_bill_record` varchar(256) default NULL COMMENT '被执行记录',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_bank
-- ----------------------------
INSERT INTO `user_bank` VALUES ('16', '22', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user_bank` VALUES ('17', '23', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user_bank` VALUES ('18', '24', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user_bank` VALUES ('19', '25', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user_bank` VALUES ('20', '26', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user_bank` VALUES ('21', '27', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user_bank` VALUES ('22', '28', null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `user_car`
-- ----------------------------
DROP TABLE IF EXISTS `user_car`;
CREATE TABLE `user_car` (
  `id` int(11) NOT NULL auto_increment,
  `uid` int(11) default NULL,
  `apply_id` int(11) default NULL,
  `have_car_type` int(11) default '1',
  `buy_time` varchar(32) default NULL COMMENT '购买时间',
  `buy_total_loan` double default '0' COMMENT '全款购买，金额',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_car
-- ----------------------------
INSERT INTO `user_car` VALUES ('16', '22', null, '1', null, '0');
INSERT INTO `user_car` VALUES ('17', '23', null, '1', null, '0');
INSERT INTO `user_car` VALUES ('18', '24', null, '1', null, '0');
INSERT INTO `user_car` VALUES ('19', '25', null, '1', null, '0');
INSERT INTO `user_car` VALUES ('20', '26', null, '1', null, '0');
INSERT INTO `user_car` VALUES ('21', '27', null, '1', null, '0');
INSERT INTO `user_car` VALUES ('22', '28', null, '1', null, '0');

-- ----------------------------
-- Table structure for `user_company`
-- ----------------------------
DROP TABLE IF EXISTS `user_company`;
CREATE TABLE `user_company` (
  `id` int(11) NOT NULL auto_increment,
  `uid` int(11) default NULL,
  `apply_id` int(11) default NULL,
  `name` varchar(256) default NULL COMMENT '单位名称',
  `company_type_id` int(11) default '1',
  `job_type_id` int(11) default '1',
  `job_type_other` varchar(64) default NULL COMMENT '职位级别（其它）',
  `company_belong_id` int(11) default '1',
  `department` varchar(128) default NULL COMMENT '部门',
  `job_title` varchar(128) default NULL COMMENT '职务名称',
  `pre_company` varchar(256) default NULL COMMENT '前工作单位',
  `join_time` varchar(32) default NULL COMMENT '入职时间',
  `company_telephone` varchar(128) default '####-########-####' COMMENT '单位电话（区号-总机-分机）',
  `company_address_province` int(11) default '1',
  `company_address_city` int(11) default '1',
  `company_address_town` int(11) default '1',
  `company_address_detail` varchar(256) default NULL COMMENT '前工作单位',
  `salary_give_type_id` int(11) default '1' COMMENT '工资发放形式1：网银，2：现金，3：网银+现金',
  `salary_base` double default NULL COMMENT '每月基本工资',
  `other_input` double default NULL COMMENT '其它月收入',
  `salary_give_day` int(11) default NULL COMMENT '每月发薪日',
  `gjj_company` double default NULL COMMENT '公司缴纳公积金',
  `gjj_personal` double default NULL COMMENT '个人缴纳公积金',
  `ssc_id` varchar(128) default NULL COMMENT '社会保障卡号',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_company
-- ----------------------------
INSERT INTO `user_company` VALUES ('16', '22', null, null, '1', '1', null, '1', null, null, null, null, '####-########-####', '1', '1', '1', null, '1', null, null, null, null, null, null);
INSERT INTO `user_company` VALUES ('17', '23', null, null, '1', '1', null, '1', null, null, null, null, '####-########-####', '1', '1', '1', null, '1', null, null, null, null, null, null);
INSERT INTO `user_company` VALUES ('18', '24', null, null, '1', '1', null, '1', null, null, null, null, '####-########-####', '1', '1', '1', null, '1', null, null, null, null, null, null);
INSERT INTO `user_company` VALUES ('19', '25', null, null, '1', '1', null, '1', null, null, null, null, '####-########-####', '1', '1', '1', null, '1', null, null, null, null, null, null);
INSERT INTO `user_company` VALUES ('20', '26', null, null, '1', '1', null, '1', null, null, null, null, '####-########-####', '1', '1', '1', null, '1', null, null, null, null, null, null);
INSERT INTO `user_company` VALUES ('21', '27', null, null, '1', '1', null, '1', null, null, null, null, '####-########-####', '1', '1', '1', null, '1', null, null, null, null, null, null);
INSERT INTO `user_company` VALUES ('22', '28', null, null, '1', '1', null, '1', null, null, null, null, '####-########-####', '1', '1', '1', null, '1', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `user_contact`
-- ----------------------------
DROP TABLE IF EXISTS `user_contact`;
CREATE TABLE `user_contact` (
  `id` int(11) NOT NULL auto_increment,
  `uid` int(11) default NULL,
  `apply_id` int(11) default NULL,
  `spouse_name` varchar(64) default NULL COMMENT '配偶',
  `spouse_telephone` varchar(128) default NULL COMMENT '配偶移动电话',
  `spouse_company` varchar(128) default NULL COMMENT '配偶单位名称',
  `spouse_company_telephone` varchar(128) default '####-########-####' COMMENT '配偶点位电话',
  `spouse_company_address` varchar(256) default NULL COMMENT '配偶单位地址',
  `spouse_know` int(11) default NULL,
  `relative_name` varchar(64) default NULL COMMENT '直系亲属',
  `relative_telephone` varchar(128) default NULL COMMENT '直系亲属移动电话',
  `relative_relation` varchar(128) default NULL COMMENT '直系亲属关系',
  `relative_house_telephone` varchar(128) default '####-########-####' COMMENT '直系亲属住宅电话',
  `relative_house_address` varchar(256) default NULL COMMENT '直系亲属住宅地址',
  `relative_know` int(11) default NULL,
  `workmate_name` varchar(64) default NULL COMMENT '同事',
  `workmate_telephone` varchar(128) default NULL COMMENT '同事移动电话',
  `workmate_company_telephone` varchar(128) default '####-########-####' COMMENT '同事单位电话',
  `workmate_company_department` varchar(256) default NULL COMMENT '同事工作部门',
  `workmate_jobs` varchar(128) default NULL COMMENT '同事工作职务',
  `workmate_know` int(11) default NULL,
  `other_name` varchar(64) default NULL COMMENT '其它联系人',
  `other_telephone` varchar(128) default NULL COMMENT '其它联系人移动电话',
  `other_relation` varchar(128) default NULL COMMENT '其它联系人关系',
  `other_house_telephone` varchar(128) default '####-########-####' COMMENT '其它联系人住宅电话',
  `other_know` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_contact
-- ----------------------------
INSERT INTO `user_contact` VALUES ('16', '22', null, null, null, null, '####-########-####', null, null, null, null, null, '####-########-####', null, null, null, null, '####-########-####', null, null, null, null, null, null, '####-########-####', null);
INSERT INTO `user_contact` VALUES ('17', '23', null, null, null, null, '####-########-####', null, null, null, null, null, '####-########-####', null, null, null, null, '####-########-####', null, null, null, null, null, null, '####-########-####', null);
INSERT INTO `user_contact` VALUES ('18', '24', null, null, null, null, '####-########-####', null, null, null, null, null, '####-########-####', null, null, null, null, '####-########-####', null, null, null, null, null, null, '####-########-####', null);
INSERT INTO `user_contact` VALUES ('19', '25', null, null, null, null, '####-########-####', null, null, null, null, null, '####-########-####', null, null, null, null, '####-########-####', null, null, null, null, null, null, '####-########-####', null);
INSERT INTO `user_contact` VALUES ('20', '26', null, null, null, null, '####-########-####', null, null, null, null, null, '####-########-####', null, null, null, null, '####-########-####', null, null, null, null, null, null, '####-########-####', null);
INSERT INTO `user_contact` VALUES ('21', '27', null, null, null, null, '####-########-####', null, null, null, null, null, '####-########-####', null, null, null, null, '####-########-####', null, null, null, null, null, null, '####-########-####', null);
INSERT INTO `user_contact` VALUES ('22', '28', null, null, null, null, '####-########-####', null, null, null, null, null, '####-########-####', null, null, null, null, '####-########-####', null, null, null, null, null, null, '####-########-####', null);

-- ----------------------------
-- Table structure for `user_enable_type`
-- ----------------------------
DROP TABLE IF EXISTS `user_enable_type`;
CREATE TABLE `user_enable_type` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(32) default NULL,
  `intro` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_enable_type
-- ----------------------------
INSERT INTO `user_enable_type` VALUES ('0', '可用', null);
INSERT INTO `user_enable_type` VALUES ('1', '已禁用', null);

-- ----------------------------
-- Table structure for `user_enterprise`
-- ----------------------------
DROP TABLE IF EXISTS `user_enterprise`;
CREATE TABLE `user_enterprise` (
  `id` int(11) NOT NULL auto_increment COMMENT 'enterprise',
  `uid` int(11) default NULL,
  `apply_id` int(11) default NULL,
  `type_id` int(11) default '1',
  `type_other` varchar(256) default NULL,
  `establish_time` varchar(32) default NULL COMMENT '成立时间',
  `percent` double default NULL COMMENT '股份占有比',
  `employee` int(11) default NULL COMMENT '员工人数',
  `place_type_id` int(11) default '1' COMMENT '经营场所',
  `place_rent` double default NULL COMMENT '租用租金',
  `month_profit` varchar(32) default NULL COMMENT '月净利润',
  `place_rent_endtime` varchar(32) default NULL COMMENT '租用到期日',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_enterprise
-- ----------------------------
INSERT INTO `user_enterprise` VALUES ('16', '22', null, '1', null, null, null, null, '1', null, null, null);
INSERT INTO `user_enterprise` VALUES ('17', '23', null, '1', null, null, null, null, '1', null, null, null);
INSERT INTO `user_enterprise` VALUES ('18', '24', null, '1', null, null, null, null, '1', null, null, null);
INSERT INTO `user_enterprise` VALUES ('19', '25', null, '1', null, null, null, null, '1', null, null, null);
INSERT INTO `user_enterprise` VALUES ('20', '26', null, '1', null, null, null, null, '1', null, null, null);
INSERT INTO `user_enterprise` VALUES ('21', '27', null, '1', null, null, null, null, '1', null, null, null);
INSERT INTO `user_enterprise` VALUES ('22', '28', null, '1', null, null, null, null, '1', null, null, null);

-- ----------------------------
-- Table structure for `user_house`
-- ----------------------------
DROP TABLE IF EXISTS `user_house`;
CREATE TABLE `user_house` (
  `id` int(11) NOT NULL auto_increment,
  `uid` int(11) default NULL,
  `apply_id` int(11) default NULL,
  `type_id` int(11) default '1' COMMENT '房产类型',
  `house_rent` double default NULL COMMENT '租金',
  `buy_time` varchar(32) default NULL COMMENT '购买时间',
  `buy_price` double default NULL COMMENT '购买时间',
  `size` double default NULL COMMENT '建筑面积',
  `percent` double default NULL COMMENT '产权比例',
  `address_province` int(11) default '1' COMMENT '房产地址编号',
  `address_city` int(11) default '1' COMMENT '房产地址编号',
  `address_town` int(11) default '1' COMMENT '房产地址编号',
  `address_detail` varchar(256) default NULL,
  `loan_year` double default NULL COMMENT '贷款年限',
  `month_payment` double default NULL COMMENT '月供',
  `load_left` double default NULL COMMENT '贷款余额',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_house
-- ----------------------------
INSERT INTO `user_house` VALUES ('16', '22', null, '1', null, null, null, null, null, '1', '1', '1', null, null, null, null);
INSERT INTO `user_house` VALUES ('17', '23', null, '1', null, null, null, null, null, '1', '1', '1', null, null, null, null);
INSERT INTO `user_house` VALUES ('18', '24', null, '1', null, null, null, null, null, '1', '1', '1', null, null, null, null);
INSERT INTO `user_house` VALUES ('19', '25', null, '1', null, null, null, null, null, '1', '1', '1', null, null, null, null);
INSERT INTO `user_house` VALUES ('20', '26', null, '1', null, null, null, null, null, '1', '1', '1', null, null, null, null);
INSERT INTO `user_house` VALUES ('21', '27', null, '1', null, null, null, null, null, '1', '1', '1', null, null, null, null);
INSERT INTO `user_house` VALUES ('22', '28', null, '1', null, null, null, null, null, '1', '1', '1', null, null, null, null);

-- ----------------------------
-- Table structure for `user_info`
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `id` int(11) NOT NULL auto_increment,
  `uid` int(11) default NULL,
  `apply_id` int(11) default NULL,
  `realname` varchar(32) default NULL COMMENT '真实姓名',
  `gender` int(11) default '1' COMMENT '性别',
  `telephone` varchar(32) default NULL COMMENT '手机号',
  `telephone_psd` varchar(16) default NULL COMMENT '手机服务密码',
  `marry_status_id` int(16) default '1' COMMENT '婚姻状态',
  `idcard` varchar(32) default NULL COMMENT '身份证编号',
  `idcard_endtime` varchar(32) default NULL COMMENT '身份证有效期',
  `children` int(11) default NULL COMMENT '子女数量',
  `provide_num` int(11) default NULL COMMENT '供养人数',
  `family_month_use` double default NULL COMMENT '家庭月支出',
  `degree_id` int(16) default '1' COMMENT '学历',
  `huji_province` int(11) default '1' COMMENT '户口所在地a-b-c',
  `huji_town` int(11) default '1' COMMENT '户口所在地a-b-c',
  `huji_city` int(11) default '1' COMMENT '户口所在地a-b-c',
  `hukou_area_detail` varchar(256) default NULL,
  `address_province` int(11) default '1' COMMENT '现住址所在地a-b-c',
  `address_city` int(11) default '1' COMMENT '现住址所在地a-b-c',
  `address_town` int(11) default '1' COMMENT '现住址所在地a-b-c',
  `address_area_detail` varchar(256) default NULL,
  `address_telephone` varchar(32) default NULL COMMENT '现住宅地电话',
  `address_arrive_time` varchar(32) default NULL COMMENT '现住宅地居住时间',
  `city_arrive_time` varchar(255) default NULL COMMENT '来本市的时间',
  `qq_number` varchar(255) default NULL COMMENT 'qq账号',
  `wechat_number` varchar(255) default NULL COMMENT '微信账号',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('16', '22', null, '用户0001', '1', null, null, '1', null, null, null, null, null, '1', '1', null, null, null, '1', null, null, null, null, null, null, null, null);
INSERT INTO `user_info` VALUES ('17', '23', null, '用户2', '1', null, null, '1', null, null, null, null, null, '1', '1', null, null, null, '1', null, null, null, null, null, null, null, null);
INSERT INTO `user_info` VALUES ('18', '24', null, null, '1', null, null, '1', null, null, null, null, null, '1', '1', '1', '1', null, '1', '1', '1', null, null, null, null, null, null);
INSERT INTO `user_info` VALUES ('19', '25', null, null, '1', null, null, '1', null, null, null, null, null, '1', '1', '1', '1', null, '1', '1', '1', null, null, null, null, null, null);
INSERT INTO `user_info` VALUES ('20', '26', null, null, '1', null, null, '1', null, null, null, null, null, '1', '1', '1', '1', null, '1', '1', '1', null, null, null, null, null, null);
INSERT INTO `user_info` VALUES ('21', '27', null, null, '1', null, null, '1', null, null, null, null, null, '1', '1', '1', '1', null, '1', '1', '1', null, null, null, null, null, null);
INSERT INTO `user_info` VALUES ('22', '28', null, null, '1', null, null, '1', null, null, null, null, null, '1', '1', '1', '1', null, '1', '1', '1', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `u_resc`
-- ----------------------------
DROP TABLE IF EXISTS `u_resc`;
CREATE TABLE `u_resc` (
  `id` int(11) NOT NULL auto_increment COMMENT 'id',
  `pid` int(11) default NULL COMMENT '父id',
  `name` varchar(50) default NULL COMMENT '名称',
  `iconCls` varchar(32) default NULL,
  `level` int(1) default NULL COMMENT '层级(不超过10层)',
  `sort` int(2) default NULL COMMENT '排序(不超过100)',
  `remark` varchar(100) default NULL COMMENT '备注',
  `type` char(1) default '0' COMMENT '权限类型 默认：0 后台权限：1',
  `function_type` int(11) default NULL COMMENT '功能类型 从数据字典获得',
  `url` varchar(150) default '#' COMMENT 'URL',
  `rel` varchar(50) default '#' COMMENT 'DWZ定制',
  `target` varchar(10) default '#',
  `width` varchar(4) default NULL,
  `height` varchar(4) default NULL,
  `create_time` datetime default NULL COMMENT '创建时间',
  `enable` char(1) default '0' COMMENT '是否停用 默认：0 停用：1',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_resc
-- ----------------------------
INSERT INTO `u_resc` VALUES ('1', '-1', '系统操作菜单', 'icon-man', '0', '1', null, '1', '2', '#', '#', '#', null, null, '2014-12-02 12:40:02', '0');
INSERT INTO `u_resc` VALUES ('2', '1', '用户管理', 'icon-user2', '1', '1', null, '1', '0', '#', '#', null, null, null, null, '0');
INSERT INTO `u_resc` VALUES ('3', '1', '系统管理', 'icon-setting', '1', '2', null, '1', '0', '#', null, null, null, null, null, '0');
INSERT INTO `u_resc` VALUES ('4', '1', '项目管理', 'icon-setting2', '1', '3', null, '1', '0', '#', null, null, null, null, null, '0');
INSERT INTO `u_resc` VALUES ('20', '2', '管理员信息管理', 'icon-man', '2', '1', null, '0', '0', null, null, null, null, null, null, '0');
INSERT INTO `u_resc` VALUES ('21', '2', '业务员信息管理', 'icon-man', '2', '2', null, '0', '0', '#', '#', '#', null, null, null, '0');
INSERT INTO `u_resc` VALUES ('22', '2', '客户信息管理', 'icon-man', '2', '3', null, '0', '0', '#', '#', '#', null, null, null, '0');
INSERT INTO `u_resc` VALUES ('30', '3', '系统配置', 'icon-setting1', '2', '1', null, '0', null, '#', '#', '#', null, null, null, '0');
INSERT INTO `u_resc` VALUES ('31', '3', '公司简介', 'icon-company', '2', '2', null, '0', null, '/admin/article/index?aid=1', '#', '#', null, null, null, '0');
INSERT INTO `u_resc` VALUES ('32', '3', '隐私声明', 'icon-privacy', '2', '3', null, '0', null, '/admin/article/index?aid=2', '#', '#', null, null, null, '0');
INSERT INTO `u_resc` VALUES ('33', '3', '加入我们', 'icon-jobs', '2', '4', null, '0', null, '/admin/article/index?aid=3', '#', '#', null, null, null, '0');

-- ----------------------------
-- Table structure for `u_role`
-- ----------------------------
DROP TABLE IF EXISTS `u_role`;
CREATE TABLE `u_role` (
  `id` int(11) NOT NULL auto_increment COMMENT 'id',
  `name` varchar(50) default NULL COMMENT '名称',
  `type` char(1) default '0' COMMENT ' 角色类型 默认：0 后台角色：1',
  `remark` varchar(100) default NULL COMMENT '备注',
  `sort` int(2) default NULL COMMENT '排序(不超过100)',
  `create_time` datetime default NULL COMMENT '创建时间',
  `enable` char(1) default '0' COMMENT '是否停用 默认：0 停用：1',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_role
-- ----------------------------
INSERT INTO `u_role` VALUES ('1', '超级管理员', '1', '系统管理员', '1', '2014-12-02 12:37:48', '1');
INSERT INTO `u_role` VALUES ('2', '管理员', '1', '普通管理员', '2', '2014-12-04 21:45:31', '1');
INSERT INTO `u_role` VALUES ('3', '业务员', '1', '业务员', '3', '2014-12-04 21:45:31', '1');
INSERT INTO `u_role` VALUES ('4', '客户', '1', '客户', '4', '2014-12-04 21:45:31', '1');

-- ----------------------------
-- Table structure for `u_role_resc`
-- ----------------------------
DROP TABLE IF EXISTS `u_role_resc`;
CREATE TABLE `u_role_resc` (
  `id` int(11) NOT NULL auto_increment COMMENT 'id',
  `role_id` int(11) default NULL COMMENT 'role id',
  `resc_id` int(11) default NULL COMMENT 'resc_id',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_role_resc
-- ----------------------------
INSERT INTO `u_role_resc` VALUES ('33', '2', '2');
INSERT INTO `u_role_resc` VALUES ('34', '2', '3');
INSERT INTO `u_role_resc` VALUES ('35', '2', '4');
INSERT INTO `u_role_resc` VALUES ('36', '2', '20');
INSERT INTO `u_role_resc` VALUES ('37', '2', '21');
INSERT INTO `u_role_resc` VALUES ('38', '2', '22');
INSERT INTO `u_role_resc` VALUES ('39', '2', '30');
INSERT INTO `u_role_resc` VALUES ('40', '2', '31');
INSERT INTO `u_role_resc` VALUES ('41', '2', '32');
INSERT INTO `u_role_resc` VALUES ('42', '2', '33');

-- ----------------------------
-- Table structure for `u_role_user`
-- ----------------------------
DROP TABLE IF EXISTS `u_role_user`;
CREATE TABLE `u_role_user` (
  `id` int(11) NOT NULL auto_increment COMMENT 'id',
  `role_id` int(11) default NULL COMMENT 'role id',
  `user_id` int(11) default NULL COMMENT 'user id',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_role_user
-- ----------------------------
INSERT INTO `u_role_user` VALUES ('1', '2', '2');
INSERT INTO `u_role_user` VALUES ('26', '3', '21');
INSERT INTO `u_role_user` VALUES ('27', '4', '22');
INSERT INTO `u_role_user` VALUES ('28', '4', '23');
INSERT INTO `u_role_user` VALUES ('29', '4', '24');
INSERT INTO `u_role_user` VALUES ('30', '4', '25');
INSERT INTO `u_role_user` VALUES ('31', '4', '26');
INSERT INTO `u_role_user` VALUES ('32', '4', '27');
INSERT INTO `u_role_user` VALUES ('33', '4', '28');

-- ----------------------------
-- View structure for `v_apply`
-- ----------------------------
DROP VIEW IF EXISTS `v_apply`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_apply` AS select `apply`.`id` AS `id`,`apply`.`uid` AS `uid`,`apply`.`money` AS `money`,`apply`.`month_payment` AS `month_payment`,`apply`.`use_for_other` AS `use_for_other`,`apply`.`pay_source` AS `pay_source`,`apply`.`apply_time` AS `apply_time`,`user`.`username` AS `username`,`user_info`.`realname` AS `realname`,`apply`.`product_id` AS `product_id`,`apply_product_type`.`name` AS `product`,`apply`.`use_time_id` AS `use_time_id`,`apply_use_time_type`.`name` AS `use_time`,`apply`.`use_for_id` AS `use_for_id`,`apply_use_for_type`.`name` AS `use_for`,`apply`.`pay_way_id` AS `pay_way_id`,`apply_pay_way`.`name` AS `pay_way`,`apply`.`status` AS `status`,`apply_valid_status_type`.`name` AS `valid_status`,`apply_valid_status_type`.`intro` AS `valid_intro`,`apply_product_type`.`intro` AS `product_html`,`apply_use_time_type`.`intro` AS `use_time_html`,`apply_pay_way`.`intro` AS `pay_way_html`,`apply_use_for_type`.`intro` AS `use_for_html`,`apply`.`_apply_id_` AS `_apply_id_`,`apply`.`deal_status` AS `deal_status`,`apply`.`deal_uid` AS `deal_uid` from (((((((`apply` join `user`) join `user_info`) join `apply_product_type`) join `apply_use_time_type`) join `apply_use_for_type`) join `apply_pay_way`) join `apply_valid_status_type`) where ((`user_info`.`uid` = `user`.`id`) and (`apply`.`uid` = `user`.`id`) and (`apply`.`product_id` = `apply_product_type`.`id`) and (`apply`.`use_time_id` = `apply_use_time_type`.`id`) and (`apply`.`use_for_id` = `apply_use_for_type`.`id`) and (`apply`.`pay_way_id` = `apply_pay_way`.`id`) and (`apply`.`status` = `apply_valid_status_type`.`id`)) order by `apply`.`apply_time` desc ;

-- ----------------------------
-- View structure for `v_apply_detail`
-- ----------------------------
DROP VIEW IF EXISTS `v_apply_detail`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_apply_detail` AS select `apply`.`id` AS `id`,`apply_user`.`id` AS `apply_user_id`,`apply_user`.`username` AS `apply_user_uname`,`apply_user`.`name` AS `apply_user_name`,`deal_user`.`id` AS `deal_user_id`,`deal_user`.`username` AS `deal_user_uname`,`deal_user`.`name` AS `deal_user_name`,`apply`.`_apply_id_` AS `_apply_id_`,`apply`.`money` AS `money`,`apply`.`month_payment` AS `month_payment`,`apply`.`use_for_other` AS `use_for_other`,`apply`.`pay_source` AS `pay_source`,`apply`.`apply_time` AS `apply_time`,`apply`.`status` AS `status`,`apply`.`pay_way_id` AS `pay_way_id`,`apply`.`use_for_id` AS `use_for_id`,`apply`.`use_time_id` AS `use_time_id`,`apply`.`deal_status` AS `deal_status`,`apply`.`product_id` AS `product_id`,`apply_product_type`.`name` AS `apply_product_type_name`,`apply_use_time_type`.`name` AS `apply_use_time_type_name`,`apply_use_for_type`.`name` AS `apply_use_for_type_name`,`apply_pay_way`.`name` AS `apply_pay_way_type_name`,`apply_valid_status_type`.`name` AS `apply_valid_status_type_name` from (((((((`apply` join `user` `apply_user`) join `user` `deal_user`) join `apply_product_type`) join `apply_use_time_type`) join `apply_use_for_type`) join `apply_pay_way`) join `apply_valid_status_type`) where ((`apply`.`uid` = `apply_user`.`id`) and (`apply`.`deal_uid` = `deal_user`.`id`) and (`apply`.`product_id` = `apply_product_type`.`id`) and (`apply`.`use_time_id` = `apply_use_time_type`.`id`) and (`apply`.`use_for_id` = `apply_use_for_type`.`id`) and (`apply`.`pay_way_id` = `apply_pay_way`.`id`) and (`apply`.`status` = `apply_valid_status_type`.`id`)) ;

-- ----------------------------
-- View structure for `v_apply_log`
-- ----------------------------
DROP VIEW IF EXISTS `v_apply_log`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_apply_log` AS select `apply_log`.`apply_id` AS `apply_id`,`user`.`username` AS `username`,`user`.`nickname` AS `nickname`,`user`.`name` AS `name`,`apply_log`.`deal_time` AS `deal_time`,`apply_log`.`deal_log` AS `deal_log` from (`apply_log` join `user`) where (`apply_log`.`deal_uid` = `user`.`id`) ;

-- ----------------------------
-- View structure for `v_user`
-- ----------------------------
DROP VIEW IF EXISTS `v_user`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_user` AS select `user`.`id` AS `id`,`user`.`username` AS `username`,`user`.`password` AS `password`,`user`.`nickname` AS `nickname`,`user`.`name` AS `name`,`user`.`sex` AS `sex`,`user`.`birthday` AS `birthday`,`user`.`head_photo_path` AS `head_photo_path`,`user`.`signature` AS `signature`,`user`.`email` AS `email`,`user`.`type` AS `type`,`user`.`login_status` AS `login_status`,`user`.`create_time` AS `create_time`,`user`.`update_time` AS `update_time`,`user`.`last_login_time` AS `last_login_time`,`user`.`last_login_ip` AS `last_login_ip`,`user`.`delete_status` AS `delete_status`,`user`.`enable` AS `enable`,`u_role_user`.`role_id` AS `role_id` from (`user` join `u_role_user`) where (`user`.`id` = `u_role_user`.`user_id`) ;

-- ----------------------------
-- View structure for `v_userinfo_admin`
-- ----------------------------
DROP VIEW IF EXISTS `v_userinfo_admin`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_userinfo_admin` AS select `user`.`id` AS `id`,`user`.`username` AS `username`,`user`.`nickname` AS `nickname`,`u_role`.`name` AS `role_name`,`user`.`email` AS `email`,`user`.`create_time` AS `create_time`,`user`.`update_time` AS `update_time`,`user`.`last_login_time` AS `last_login_time`,`user`.`enable` AS `enable`,`user`.`delete_status` AS `delete_status`,`user`.`name` AS `realname`,`user_enable_type`.`name` AS `enable_text` from (((`u_role_user` join `u_role`) join `user_enable_type`) join `user`) where ((`u_role`.`id` = 2) and (`u_role_user`.`role_id` = `u_role`.`id`) and (`u_role_user`.`user_id` = `user`.`id`) and (`user_enable_type`.`id` = `user`.`enable`)) ;

-- ----------------------------
-- View structure for `v_userinfo_employee`
-- ----------------------------
DROP VIEW IF EXISTS `v_userinfo_employee`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_userinfo_employee` AS select `user`.`id` AS `id`,`user`.`username` AS `username`,`user`.`nickname` AS `nickname`,`u_role`.`name` AS `role_name`,`user`.`email` AS `email`,`user`.`create_time` AS `create_time`,`user`.`update_time` AS `update_time`,`user`.`last_login_time` AS `last_login_time`,`user`.`enable` AS `enable`,`user`.`delete_status` AS `delete_status`,`user`.`name` AS `realname`,`user_enable_type`.`name` AS `enable_text` from (((`u_role_user` join `u_role`) join `user_enable_type`) join `user`) where ((`u_role`.`id` = 3) and (`u_role_user`.`role_id` = `u_role`.`id`) and (`u_role_user`.`user_id` = `user`.`id`) and (`user_enable_type`.`id` = `user`.`enable`)) ;

-- ----------------------------
-- View structure for `v_userinfo_member`
-- ----------------------------
DROP VIEW IF EXISTS `v_userinfo_member`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_userinfo_member` AS select `user`.`id` AS `id`,`user`.`username` AS `username`,`user`.`nickname` AS `nickname`,`u_role`.`name` AS `role_name`,`user`.`email` AS `email`,`user`.`create_time` AS `create_time`,`user`.`update_time` AS `update_time`,`user`.`last_login_time` AS `last_login_time`,`user`.`enable` AS `enable`,`user`.`delete_status` AS `delete_status`,`user`.`name` AS `realname`,`user_enable_type`.`name` AS `enable_text`,`user`.`reg_valid` AS `reg_valid` from (((`u_role_user` join `u_role`) join `user_enable_type`) join `user`) where ((`u_role`.`id` = 4) and (`u_role_user`.`role_id` = `u_role`.`id`) and (`u_role_user`.`user_id` = `user`.`id`) and (`user_enable_type`.`id` = `user`.`enable`)) ;

-- ----------------------------
-- View structure for `v_user_bank`
-- ----------------------------
DROP VIEW IF EXISTS `v_user_bank`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_user_bank` AS select `user_bank`.`id` AS `id`,`user`.`id` AS `uid`,`user`.`username` AS `username`,`user_bank`.`apply_id` AS `apply_id`,`user_bank`.`bank_card_no` AS `bank_card_no`,`user_bank`.`back_name` AS `back_name`,`user_bank`.`credit_card_number` AS `credit_card_number`,`user_bank`.`credit_card_limit` AS `credit_card_limit`,`user_bank`.`other_debt` AS `other_debt`,`user_bank`.`month_payment` AS `month_payment`,`user_bank`.`credit_score_username` AS `credit_score_username`,`user_bank`.`credit_score_password` AS `credit_score_password`,`user_bank`.`credit_score_search_code` AS `credit_score_search_code`,`user_bank`.`credit_score_active_code` AS `credit_score_active_code`,`user_bank`.`electricity_bill_no` AS `electricity_bill_no`,`user_bank`.`electricity_bill_house_name` AS `electricity_bill_house_name`,`user_bank`.`electricity_bill_record` AS `electricity_bill_record` from (`user_bank` join `user`) where (`user_bank`.`uid` = `user`.`id`) ;

-- ----------------------------
-- View structure for `v_user_car`
-- ----------------------------
DROP VIEW IF EXISTS `v_user_car`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_user_car` AS select `user_car`.`id` AS `id`,`user_car`.`uid` AS `uid`,`user_car`.`apply_id` AS `apply_id`,`user_car`.`buy_total_loan` AS `buy_total_loan`,`user_car`.`buy_time` AS `buy_time`,`apply_car_buy_type`.`intro` AS `intro`,`user_car`.`have_car_type` AS `have_car_type` from (`user_car` join `apply_car_buy_type`) where (`user_car`.`have_car_type` = `apply_car_buy_type`.`id`) ;

-- ----------------------------
-- View structure for `v_user_company`
-- ----------------------------
DROP VIEW IF EXISTS `v_user_company`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_user_company` AS select `user_company`.`id` AS `id`,`user_company`.`uid` AS `uid`,`user_company`.`name` AS `name`,`user_company`.`job_type_other` AS `job_type_other`,`user_company`.`department` AS `department`,`user_company`.`job_title` AS `job_title`,`user_company`.`pre_company` AS `pre_company`,`user_company`.`join_time` AS `join_time`,`user_company`.`company_telephone` AS `company_telephone`,`user_company`.`company_address_detail` AS `company_address_detail`,`user_company`.`salary_base` AS `salary_base`,`user_company`.`other_input` AS `other_input`,`user_company`.`salary_give_day` AS `salary_give_day`,`user_company`.`gjj_company` AS `gjj_company`,`user_company`.`gjj_personal` AS `gjj_personal`,`user_company`.`ssc_id` AS `ssc_id`,`apply_company_type`.`intro` AS `company_type_html`,`apply_job_type`.`intro` AS `job_type_html`,`apply_company_belong_type`.`intro` AS `company_belong_html`,`apply_salary_give_type`.`intro` AS `salary_give_html`,`p`.`name` AS `address_p`,`c`.`name` AS `address_c`,`t`.`name` AS `address_t` from (((((((`user_company` join `apply_company_type`) join `apply_job_type`) join `apply_company_belong_type`) join `apply_salary_give_type`) join `china_areas` `p`) join `china_areas` `c`) join `china_areas` `t`) where ((`user_company`.`company_type_id` = `apply_company_type`.`id`) and (`user_company`.`job_type_id` = `apply_job_type`.`id`) and (`user_company`.`company_belong_id` = `apply_company_belong_type`.`id`) and (`user_company`.`salary_give_type_id` = `apply_salary_give_type`.`id`) and (`user_company`.`company_address_province` = `p`.`id`) and (`user_company`.`company_address_city` = `c`.`id`) and (`user_company`.`company_address_town` = `t`.`id`)) ;

-- ----------------------------
-- View structure for `v_user_enterprise`
-- ----------------------------
DROP VIEW IF EXISTS `v_user_enterprise`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_user_enterprise` AS select `user_enterprise`.`id` AS `id`,`user_enterprise`.`uid` AS `uid`,`user_enterprise`.`type_other` AS `type_other`,`user_enterprise`.`establish_time` AS `establish_time`,`user_enterprise`.`percent` AS `percent`,`user_enterprise`.`employee` AS `employee`,`user_enterprise`.`place_rent` AS `place_rent`,`user_enterprise`.`month_profit` AS `month_profit`,`user_enterprise`.`place_rent_endtime` AS `place_rent_endtime`,`apply_enterprise_place_type`.`name` AS `place_type`,`apply_enterprise_type`.`name` AS `enterprise_type`,`apply_enterprise_place_type`.`intro` AS `place_type_html`,`apply_enterprise_type`.`intro` AS `enterprise_type_html` from ((`user_enterprise` join `apply_enterprise_place_type`) join `apply_enterprise_type`) where ((`user_enterprise`.`type_id` = `apply_enterprise_type`.`id`) and (`user_enterprise`.`place_type_id` = `apply_enterprise_place_type`.`id`)) ;

-- ----------------------------
-- View structure for `v_user_house`
-- ----------------------------
DROP VIEW IF EXISTS `v_user_house`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_user_house` AS select `user_house`.`id` AS `id`,`user_house`.`uid` AS `uid`,`user_house`.`house_rent` AS `house_rent`,`user_house`.`buy_time` AS `buy_time`,`user_house`.`buy_price` AS `buy_price`,`user_house`.`size` AS `size`,`user_house`.`percent` AS `percent`,`user_house`.`address_detail` AS `address_detail`,`user_house`.`loan_year` AS `loan_year`,`user_house`.`month_payment` AS `month_payment`,`user_house`.`load_left` AS `load_left`,`address_p`.`name` AS `address_province`,`address_c`.`name` AS `address_city`,`address_t`.`name` AS `address_town`,`apply_house_type`.`intro` AS `house_type_html` from ((((`user_house` join `apply_house_type`) join `china_areas` `address_p`) join `china_areas` `address_c`) join `china_areas` `address_t`) where ((`user_house`.`type_id` = `apply_house_type`.`id`) and (`user_house`.`address_province` = `address_p`.`id`) and (`user_house`.`address_city` = `address_c`.`id`) and (`user_house`.`address_town` = `address_t`.`id`)) ;

-- ----------------------------
-- View structure for `v_user_info`
-- ----------------------------
DROP VIEW IF EXISTS `v_user_info`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_user_info` AS select `user_info`.`id` AS `id`,`user_info`.`uid` AS `uid`,`user_info`.`apply_id` AS `apply_id`,`user_info`.`realname` AS `realname`,`user_info`.`telephone` AS `telephone`,`user_info`.`telephone_psd` AS `telephone_psd`,`user_info`.`idcard` AS `idcard`,`user_info`.`idcard_endtime` AS `idcard_endtime`,`user_info`.`children` AS `children`,`user_info`.`provide_num` AS `provide_num`,`user_info`.`family_month_use` AS `family_month_use`,`user_info`.`hukou_area_detail` AS `hukou_area_detail`,`user_info`.`address_area_detail` AS `address_area_detail`,`user_info`.`address_telephone` AS `address_telephone`,`user_info`.`address_arrive_time` AS `address_arrive_time`,`user_info`.`city_arrive_time` AS `city_arrive_time`,`user_info`.`qq_number` AS `qq_number`,`user_info`.`wechat_number` AS `wechat_number`,`apply_marry_status_type`.`name` AS `marry_status`,`apply_gender_type`.`name` AS `gender`,`apply_degree_type`.`name` AS `degree`,`huji_p`.`name` AS `huji_province`,`huji_c`.`name` AS `huji_city`,`huji_t`.`name` AS `huji_town`,`address_t`.`name` AS `address_town`,`address_c`.`name` AS `address_city`,`address_p`.`name` AS `address_province`,`apply_gender_type`.`intro` AS `gender_html`,`apply_degree_type`.`intro` AS `degree_html`,`apply_marry_status_type`.`intro` AS `marry_status_html` from (((((((((`user_info` join `apply_gender_type`) join `apply_degree_type`) join `china_areas` `huji_p`) join `china_areas` `huji_c`) join `china_areas` `huji_t`) join `china_areas` `address_p`) join `china_areas` `address_c`) join `china_areas` `address_t`) join `apply_marry_status_type`) where ((`user_info`.`marry_status_id` = `apply_marry_status_type`.`id`) and (`user_info`.`degree_id` = `apply_degree_type`.`id`) and (`user_info`.`gender` = `apply_gender_type`.`id`) and (`user_info`.`huji_province` = `huji_p`.`id`) and (`user_info`.`huji_town` = `huji_c`.`id`) and (`user_info`.`huji_city` = `huji_t`.`id`) and (`user_info`.`address_province` = `address_p`.`id`) and (`user_info`.`address_city` = `address_c`.`id`) and (`user_info`.`address_town` = `address_t`.`id`)) ;
