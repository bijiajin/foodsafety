/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50612
Source Host           : localhost:3306
Source Database       : food_page

Target Server Type    : MYSQL
Target Server Version : 50612
File Encoding         : 65001

Date: 2017-01-06 16:32:13
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `food_pagetable`
-- ----------------------------
DROP TABLE IF EXISTS `food_pagetable`;
CREATE TABLE `food_pagetable` (
  `infoid` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keywords` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `summary` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `inerttime` datetime DEFAULT NULL,
  `pubtime` datetime DEFAULT NULL,
  `author` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_dongguan` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_guangdong` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`infoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of food_pagetable
-- ----------------------------
INSERT INTO food_pagetable VALUES ('831b4c1ed3e311e6930154ee755dfea7', '总局通告7批次食品不合格', '近期，国家食品药品监督管理总局组织抽检炒货食品及坚果制品、酒类、食糖、调味品、饮料、速冻食品等6类食品500批次样品，抽样检验项目合格样品493批次，不合格样品7批次。根据食品安全国家标准，个别项目不合格，其产品即判定为不合格产品。\n\n总体情况：炒货食品及坚果制品54批次，不合格样品1批次；酒类93批次，不合格样品1批次；食糖53批次，不合格样品5批次。调味品146批次，饮料96批次，速冻食品58批次。\n\n不合格产品情况如下：\n\n京东（网站）自营在其网站销售的标称安徽省憨豆熊电子商务有限公司生产的巴旦木（烘炒类），二氧化硫检出值为0.12g/kg。标准规定为不得使用。检验机构为安徽省食品药品检验研究院。\n\n忠来食品旗舰店在天猫（网站）商城销售的标称香港忠来食品集团有限公司监制、南京忠来果品食杂有限公司分装的单晶冰糖（单晶体冰糖），蔗糖分检出值为99.3 %。比标准规定（不低于99.6%）低0.3%；还原糖分检出值为0.32 %。比标准规定（不超过0.12 %）高1.7倍。检验机构为广州甘蔗糖业研究所（国家糖业质量监督检验中心）。\n\n天猫（网站）超市在其网站销售的标称上海裕田农业科技有限公司生产的黄冰糖，蔗糖分检出值为96.3 %。比标准规定（不低于97.5 %）低1.2%。检验机构为广州甘蔗糖业研究所（国家糖业质量监督检验中心）。\n\n声耀食品官方旗舰店在京东（网站）销售的标称南昌市正味贸易有限公司生产的白糖，色值检出值为193IU。比标准规定（不超过150IU）高出28.7%。检验机构为广州甘蔗糖业研究所（国家糖业质量监督检验中心）。\n\n广西百色甘化股份有限公司销售的标称广西百色甘化股份有限公司生产的2批次白砂糖，色值检出值分别为193IU和169IU。比标准规定（不超过150IU）分别高出28.7%和12.7%。检验机构为贵州省产品质量监督检验院。\n\n北京世纪卓越信息技术有限公司在亚马逊（网站）销售的标称亳州市皖品酒厂生产的“龍韵貢酒（3年）”，酒精度检出值为48.1%vol。比标准规定（49.8%vol—51.8%vol）下限值低3.4%。检验机构为国家食品质量监督检验中心。\n\n对上述抽检中发现的不合格产品，生产企业所在地上海、江苏、安徽、江西、广西等省（区、市）食品药品监管部门已责令企业查清产品流向，召回不合格产品，并分析原因进行整改；经营单位所在地北京、浙江、广西等省（区、市）食品药品监管部门已要求有关单位立即采取下架等措施，控制风险，并依法予以查处。查处情况于2017年3月31日前报国家食品药品监督管理总局并向社会公布。\n\n小贴士：关于部分检验项目的说明\n\n一、二氧化硫残留量\n\n二氧化硫是食品加工中常用的漂白剂和防腐剂，使用后产生二氧化硫残留。《食品安全国家标准 食品添加剂使用标准》（GB 2760—2014）中规定坚果与籽类食品不得使用,二氧化硫进入人体后最终转化为硫酸盐并随尿液排出体外。少量二氧化硫进入人体不会对身体带来健康危害，但若过量食用可能引起如恶心、呕吐等胃肠道反应。\n\n二、酒精度\n\n酒精度又叫酒度，反映了酒中乙醇（酒精）的含量，是酒类的品质指标之一。酒精度不合格可能是个别企业生产工艺控制不严格或检验器具不准确等因素造成。\n\n三、蔗糖分\n\n食糖的品质指标之一，反映了食糖中蔗糖的含量，是食糖质量等级划分的主要依据之一。蔗糖是食糖的主要成分，蔗糖分高低与生产工艺水平密切相关。行业标准《单晶体冰糖》（QB/T 1173—2002）中规定合格级单晶体冰糖的蔗糖分要≥99.6%，行业标准《多晶体冰糖》（QB/T 1174—2002）中规定优级黄冰糖的蔗糖分要≥97.5%。\n\n四、还原糖分\n\n食糖的品质指标之一，反映了食糖中还原糖的含量，还原糖含量会影响食糖的口感、外观等。行业标准《单晶体冰糖》（QB/T1173—2002）中规定合格级单晶体冰糖的还原糖分要≤0.12%。还原糖分超标与生产工艺、运输储存环境等有关。\n\n五、色值\n\n食糖的品质指标之一，是白砂糖、绵白糖、冰糖等质量等级划分的主要依据之一，它主要影响糖品的外观，是杂质多寡的一种反映，也是生产工艺水平的一种体现。国家标准《白砂糖》（GB317—2006）中规定一级白砂糖的色值要≤150IU。', '批次,检验,冰糖,合格,食糖', '、调味品、饮料、速冻食品等6类食品500批次样品，抽样检验项目合格样品493批次', '国家食药局', 'http://www.sda.gov.cn/WS01/CL0051/168249.html', '2017-01-06 15:41:19', '2017-01-03 00:00:00', '', '0', '1', '1');