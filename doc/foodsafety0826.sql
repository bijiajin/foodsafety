/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : foodsafety

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-08-26 15:51:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for food_column
-- ----------------------------
DROP TABLE IF EXISTS `food_column`;
CREATE TABLE `food_column` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) DEFAULT NULL,
  `state` int(255) DEFAULT NULL COMMENT '状态(1:使用，2:禁用)',
  `alias` varchar(255) DEFAULT NULL COMMENT '别名',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标样式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of food_column
-- ----------------------------
INSERT INTO `food_column` VALUES ('1', '今日关注', '1', 'jr', 'icon-recommandchannel');
INSERT INTO `food_column` VALUES ('2', '一周要闻', '1', 'yz', 'icon-hotchannel');
INSERT INTO `food_column` VALUES ('3', '东莞信息', '1', 'dg', 'icon-videochannel');
INSERT INTO `food_column` VALUES ('4', '广东信息', '1', 'gd', 'icon-imagechannel');
INSERT INTO `food_column` VALUES ('5', '信息检索', '1', 'js', 'icon-militarychannel');
INSERT INTO `food_column` VALUES ('6', '关于我们', '1', 'gy', 'icon-foodchannel');

-- ----------------------------
-- Table structure for food_pagetable
-- ----------------------------
DROP TABLE IF EXISTS `food_pagetable`;
CREATE TABLE `food_pagetable` (
  `infoid` char(32) COLLATE utf8_unicode_ci NOT NULL COMMENT '主键',
  `title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '标题',
  `content` varchar(10000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '内容',
  `keywords` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关键字',
  `summary` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '摘要',
  `source` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '来源',
  `link` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '链接',
  `inerttime` datetime DEFAULT NULL COMMENT '添加时间',
  `pubtime` datetime DEFAULT NULL COMMENT '发布日期',
  `author` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_dongguan` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否是东莞',
  `is_guangdong` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否是广东',
  `state` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`infoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of food_pagetable
-- ----------------------------
INSERT INTO `food_pagetable` VALUES ('831b4c1ed3e311e6930154ee755dfe10', '广东省食品药品监督管理局关于2016年第58期食品监督抽检信息的通告', '根据2016年国家和广东省食品安全监督抽检计划，广东省食品药品监督管理局组织对全省范围内生产经营的15大类食品进行监督抽检，具体包括粮食加工品，食用油、油脂及其制品，调味品，肉制品，乳制品，饮料，罐头，茶叶及相关制品，酒类，蔬菜制品，水产制品，糕点，蜂产品，特殊膳食食品，餐饮食品共531批次，其中24批次内在质量不合格。\r\n　　（一）调味品不合格1批次：标示为汕尾市海丰皇斋食品有限公司2016年5月21日生产的规格为220g/瓶的金桔油，甜蜜素超标。\r\n　　（二）饮料不合格10批次：1.标示为中山市富田食品有限公司2016年8月31日生产的规格为365ml/瓶的富田饮用天然矿泉水，溴酸盐超标；2.标示为中山市富田食品有限公司2016年8月2日生产的规格为365ml/瓶的富田饮用天然矿泉水，溴酸盐超标；3.标示为鹤山市清之臣矿泉饮料有限公司2016年9月21日生产的规格为18.9L/桶的清の臣饮用天然矿泉水，溴酸盐超标；4.标示为开平澳泉饮料食品有限公司2016年10月13日生产的规格为18.9L/桶的饮用纯净水，检出铜绿假单胞菌；5.标示为深圳市清泉饮品有限公司2016年11月2日生产的规格为18.9升/桶的灵鸣饮用纯净水，检出铜绿假单胞菌；6.标示为深圳市昕之田科技有限公司2016年10月30日生产的规格为18L/桶的碧景包装饮用水，检出铜绿假单胞菌；7.标示为深圳市五指山泉食品饮料有限公司2016年10月25日生产的规格为16.8升/桶的精品山泉饮用纯净水，检出铜绿假单胞菌；8.标示为深圳市昕之田科技有限公司2016年10月31日生产的规格为18L/桶的碧景包装饮用水，检出铜绿假单胞菌；9.标示为惠东县吉隆仙滴山泉水厂2016年10月26日生产的规格为16.8升/桶的其他饮用水，检出铜绿假单胞菌；10.标示为惠东县中尔美饮用水有限公司2016年10月25日生产的规格为16.8升/桶的包装饮用水，耗氧量超标。\r\n　　（三）茶叶及相关制品不合格1批次：标示为清远市何公桥茶叶有限公司2016年6月22日生产的规格为150克/罐的英红九号，检出氰戊菊酯。\r\n　　（四）酒类不合格3批次：1.标示为鹤山市雅瑶南靖酒厂出品2016年6月30日生产的规格为5L/瓶；30%vol的红米酒，酒精度不达标；2.标示为江门市江海区鸿利酒厂2016年1月8日生产的规格为600mL/瓶，7%vol的广东米酒，酒精度超标；3.标示为江门市江海区鸿利酒厂2016年1月26日生产的规格为600mL/瓶，7%vol的广东米酒，酒精度不达标。\r\n　　（五）蔬菜制品不合格1批次：标示为江门市蓬江区荷塘荷兴食品加工厂2016年7月8日生产的规格为400g（14安士）/袋的和味正菜，防腐剂各自用量占其最大使用量的比例之和、苯甲酸及其钠盐(以苯甲酸计)超标。（六）水产制品不合格1批次：标示为江门市蓬江区荷塘荷兴食品加工厂2016年7月8日生产的规格为400g（14安士）/袋的和味正菜，防腐剂各自用量占其最大使用量的比例之和、苯甲酸及其钠盐(以苯甲酸计)超标。（七）糕点不合格4批次：1.标示为东莞市麻涌丰润谷食品有限公司2016年10月11日生产的规格为90克/袋的面包兄弟（椰奶味），酸价超标；2.标示为丰顺县麦品坊食品厂2016年3月18日生产的规格为500克/盒的麦品坊糕点—绿豆饼，酸价超标；3.标示为梅州市雅太郎食品有限公司2016年7月27日生产的规格为320克/罐的油条，铝的残留量超标；4.标示为江门市新会区古井正月十五饼家2016年7月12日生产的规格为380克/盒的妈阁芝麻杏仁饼(绿豆粉饼) （烘烤类糕点），菌落总数超标。（八）餐饮食品不合格3批次：1.标示为揭阳市揭东区埔田镇聚香园餐厅2016年10月10日销售的麦包，检出铝；2.标示为梅县柏丽酒店2016年11月3日销售的香芋刺猬包，检出苋菜红；3.标示为梅州市梅江区东海酒楼2016年11月1日销售的酸萝卜，糖精钠超标。广东省食品药品监督管理局要求相关市（区）食品药品监管部门及时对不合格食品及其生产经营者进行调查处理，依法查处违法生产经营行为，督促企业履行法定义务，并将相关情况记入食品生产经营者食品安全信用档案，查处情况由企业所在地负责案件查办的市、县食品药品监督管理部门按规定公开，有关信息可在我省相关市、县食品药品监督管理局网站上查询。', '食品安全,抽检,批次,合格,糕点,蔬菜,酒水', '根据2016年国家和广东省食品安全监督抽检计划，广东省食品药品监督管理局组织对全省范围内生产经营的15大类食品进行监督抽检，具体包括粮食加工品，食用油、油脂及其制品，调味品，肉制品，乳制品，饮料，罐头，茶叶及相关制品，酒类，蔬菜制品，水产制品，糕点，蜂产品，特殊膳食食品，餐饮食品共531批次，其中24批次内在质量不合格。', '国家食药局', 'http://www.sda.gov.cn/WS01/CL1688/168490.html', '2017-01-22 09:30:28', '2017-01-11 09:30:49', null, '1', '0', '1');
INSERT INTO `food_pagetable` VALUES ('831b4c1ed3e311e6930154ee755dfea7', '总局通告7批次食品不合格', '近期，国家食品药品监督管理总局组织抽检炒货食品及坚果制品、酒类、食糖、调味品、饮料、速冻食品等6类食品500批次样品，抽样检验项目合格样品493批次，不合格样品7批次。根据食品安全国家标准，个别项目不合格，其产品即判定为不合格产品。\n\n总体情况：炒货食品及坚果制品54批次，不合格样品1批次；酒类93批次，不合格样品1批次；食糖53批次，不合格样品5批次。调味品146批次，饮料96批次，速冻食品58批次。\n\n不合格产品情况如下：\n\n京东（网站）自营在其网站销售的标称安徽省憨豆熊电子商务有限公司生产的巴旦木（烘炒类），二氧化硫检出值为0.12g/kg。标准规定为不得使用。检验机构为安徽省食品药品检验研究院。\n\n忠来食品旗舰店在天猫（网站）商城销售的标称香港忠来食品集团有限公司监制、南京忠来果品食杂有限公司分装的单晶冰糖（单晶体冰糖），蔗糖分检出值为99.3 %。比标准规定（不低于99.6%）低0.3%；还原糖分检出值为0.32 %。比标准规定（不超过0.12 %）高1.7倍。检验机构为广州甘蔗糖业研究所（国家糖业质量监督检验中心）。\n\n天猫（网站）超市在其网站销售的标称上海裕田农业科技有限公司生产的黄冰糖，蔗糖分检出值为96.3 %。比标准规定（不低于97.5 %）低1.2%。检验机构为广州甘蔗糖业研究所（国家糖业质量监督检验中心）。\n\n声耀食品官方旗舰店在京东（网站）销售的标称南昌市正味贸易有限公司生产的白糖，色值检出值为193IU。比标准规定（不超过150IU）高出28.7%。检验机构为广州甘蔗糖业研究所（国家糖业质量监督检验中心）。\n\n广西百色甘化股份有限公司销售的标称广西百色甘化股份有限公司生产的2批次白砂糖，色值检出值分别为193IU和169IU。比标准规定（不超过150IU）分别高出28.7%和12.7%。检验机构为贵州省产品质量监督检验院。\n\n北京世纪卓越信息技术有限公司在亚马逊（网站）销售的标称亳州市皖品酒厂生产的“龍韵貢酒（3年）”，酒精度检出值为48.1%vol。比标准规定（49.8%vol—51.8%vol）下限值低3.4%。检验机构为国家食品质量监督检验中心。\n\n对上述抽检中发现的不合格产品，生产企业所在地上海、江苏、安徽、江西、广西等省（区、市）食品药品监管部门已责令企业查清产品流向，召回不合格产品，并分析原因进行整改；经营单位所在地北京、浙江、广西等省（区、市）食品药品监管部门已要求有关单位立即采取下架等措施，控制风险，并依法予以查处。查处情况于2017年3月31日前报国家食品药品监督管理总局并向社会公布。\n\n小贴士：关于部分检验项目的说明\n\n一、二氧化硫残留量\n\n二氧化硫是食品加工中常用的漂白剂和防腐剂，使用后产生二氧化硫残留。《食品安全国家标准 食品添加剂使用标准》（GB 2760—2014）中规定坚果与籽类食品不得使用,二氧化硫进入人体后最终转化为硫酸盐并随尿液排出体外。少量二氧化硫进入人体不会对身体带来健康危害，但若过量食用可能引起如恶心、呕吐等胃肠道反应。\n\n二、酒精度\n\n酒精度又叫酒度，反映了酒中乙醇（酒精）的含量，是酒类的品质指标之一。酒精度不合格可能是个别企业生产工艺控制不严格或检验器具不准确等因素造成。\n\n三、蔗糖分\n\n食糖的品质指标之一，反映了食糖中蔗糖的含量，是食糖质量等级划分的主要依据之一。蔗糖是食糖的主要成分，蔗糖分高低与生产工艺水平密切相关。行业标准《单晶体冰糖》（QB/T 1173—2002）中规定合格级单晶体冰糖的蔗糖分要≥99.6%，行业标准《多晶体冰糖》（QB/T 1174—2002）中规定优级黄冰糖的蔗糖分要≥97.5%。\n\n四、还原糖分\n\n食糖的品质指标之一，反映了食糖中还原糖的含量，还原糖含量会影响食糖的口感、外观等。行业标准《单晶体冰糖》（QB/T1173—2002）中规定合格级单晶体冰糖的还原糖分要≤0.12%。还原糖分超标与生产工艺、运输储存环境等有关。\n\n五、色值\n\n食糖的品质指标之一，是白砂糖、绵白糖、冰糖等质量等级划分的主要依据之一，它主要影响糖品的外观，是杂质多寡的一种反映，也是生产工艺水平的一种体现。国家标准《白砂糖》（GB317—2006）中规定一级白砂糖的色值要≤150IU。', '批次,检验,冰糖,合格,食糖', '调味品、饮料、速冻食品等6类食品500批次样品，抽样检验项目合格样品493批次', '国家食药局', 'http://www.sda.gov.cn/WS01/CL0051/168249.html', '2017-01-06 15:41:19', '2017-01-03 00:00:00', '', '0', '1', '1');
INSERT INTO `food_pagetable` VALUES ('831b4c1ed3e311e6930154ee755dfea8', '总局关于2016年第四季度食品安全监督抽检情况分析的通告（2017年第12号）', '2016年第四季度，全国共完成并公布738972批次食品（含保健食品和食品添加剂）样品监督抽检结果，检验项目合格的样品722483批次，不合格样品16489批次，样品总体合格率为97.8%，与2016年前三季度基本持平。其中，粮、油、肉、蛋、乳等大宗日常消费品的样品合格率均接近或高于平均水平。各类食品监督抽检结果见附件。\r\n\r\n　　抽检发现的主要问题有：一是食品中超范围、超限量使用食品添加剂问题占不合格总数的32.5%，比三季度高2.4个百分点；二是食品中微生物污染问题占不合格总数的27.4%，比三季度低8.2个百分点；三是食品中农药兽药残留不符合标准问题占不合格总数的14.7%，比三季度高5.4个百分点；四是食品中质量指标不符合标准问题占不合格总数的11.7%，比三季度低0.9个百分点；五是食品中重金属等元素污染问题占不合格总数的3.7%，比三季度低0.2个百分点；六是食品中检出非食用物质问题占不合格总数的2.1%，比三季度高0.6个百分点；七是食品中真菌毒素污染问题占不合格总数的1.0%，比三季度高0.3个百分点。\r\n\r\n　　各级食品药品监管部门公布的具体抽检信息可在其政府网站或通过其他有效途径查询。其中，国家食品药品监督管理总局本级和各省级食品药品监管部门公布的抽检信息可在国家食品药品监督管理总局政府网站“食品抽检信息”专栏（http://www.cfda.gov.cn/WS01/CL1689/）查询。\r\n\r\n　　特此通告。', '食品安全,抽检,批次,合格', '2016年第四季度，全国共完成并公布738972批次食品（含保健食品和食品添加剂）样品监督抽检结果，检验项目合格的样品722483批次，不合格样品16489批次，样品总体合格率为97.8%，与2016年前三季度基本持平。其中，粮、油、肉、蛋、乳等大宗日常消费品的样品合格率均接近或高于平均水平', '国家食药局', 'http://www.sda.gov.cn/WS01/CL1687/168745.html', '2017-01-22 09:25:18', '2017-01-20 09:25:20', null, '1', '0', '1');
INSERT INTO `food_pagetable` VALUES ('831b4c1ed3e311e6930154ee755dfea9', '广东省食品药品监督管理局2017年春节节前食品监督抽检信息', '近期，广东省食品药品监督管理局组织了2017年春节节前食品专项监督抽检，对全省范围内生产经营的15大类食品进行监督抽检，具体包括食用油、油脂及其制品，调味品，肉制品，乳制品，饮料，饼干，薯类及膨化食品，糖果制品，酒类，炒货及坚果制品，蛋制品，糕点，特殊膳食食品，餐饮食品，食品添加剂共506批次，其中10批次内在质量不合格。\r\n（一）肉制品不合格3批次：1.标示为潮州市湘桥区金日腊味食品厂2016年10月10日生产的规格为160克/袋的广式腊肠，检出山梨酸；2.标示为潮州市湘桥区金日腊味食品厂2016年10月1日生产的规格为160克/袋的广式腊肠，检出山梨酸；3.标示为潮州市湘桥区金日腊味食品厂2016年10月24日生产的规格为160克/袋的广式腊肠，检出山梨酸。\r\n（二）饮料不合格1批次：1.标示为佛山市南海区西樵天天一泉饮用水有限公司2016年10月16日生产的规格为18L/桶的天天一泉包装饮用水，检出铜绿假单胞菌。\r\n（三）酒类不合格2批次：1.标示为吴川市江南酒厂2016年1月10日生产的规格为600ml/瓶，56%vol的56°台湾高粱酒，氰化物超标；2.标示为江门市新会区三江镇潮兴酒厂2016年8月21日生产的规格为610ml/瓶；28%vol的红米酒，酒精度不达标。\r\n（四）糕点不合格4批次：1.标示为广州市耿兴食品有限公司2016年10月11日生产的规格为90克(g)/袋的红豆沙司面包，防腐剂各自用量占其最大使用量比例之和超标；2.标示为闽峰食品厂2016年10月23日生产的规格为散装称重的豆蓉饼，酸价超标；3.标示为汕头市苏南糖果厂有限公司2016年10月26日生产的规格为300克/盒的麻薄酥（烘烤类糕点），大肠菌群超标；4.标示为东莞市麻涌丰润谷食品有限公司2016年10月26日生产的规格为90克/袋的尚谷食代（椰奶味），酸价超标。\r\n广东省食品药品监督管理局要求相关市（区）食品药品监管部门及时对不合格食品及其生产经营者进行调查处理，依法查处违法生产经营行为，督促企业履行法定义务，并将相关情况记入食品生产经营者食品安全信用档案，查处情况由企业所在地负责案件查办的市、县食品药品监督管理部门按规定公开，有关信息可在我省相关市、县食品药品监督管理局网站上查询。\r\n食品安全消费提示：广东省食品药品监管管理局提醒您应当在正规可靠渠道购买所需食品并保存相应购物凭证，要看清外包装上的相关标识，如生产日期、保质期、生产者名称和地址、成分或配料表、食品生产许可证编号等标识是否齐全；不要购买无厂名、厂址、生产日期和保质期的产品，不要购买超过保质期的产品；不要购买公布的不合格产品。欢迎广大消费者积极参与食品安全监督工作，关注每周食品抽检信息公布，如发现危害社会公众的食品及其违法行为，请及时拨打当地食品药品监管部门举报投诉电话12331。', '食品安全,抽检,批次,合格', '近期，广东省食品药品监督管理局组织了2017年春节节前食品专项监督抽检，对全省范围内生产经营的15大类食品进行监督抽检，具体包括食用油、油脂及其制品，调味品，肉制品，乳制品，饮料，饼干，薯类及膨化食品，糖果制品，酒类，炒货及坚果制品，蛋制品，糕点，特殊膳食食品，餐饮食品，食品添加剂共506批次，其中10批次内在质量不合格。', '国家食药局', 'http://www.sda.gov.cn/WS01/CL1688/168650.html', '2017-01-22 09:27:35', '2017-01-17 09:27:37', null, '0', '1', '1');

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `job_name` varchar(255) DEFAULT NULL,
  `job_group` varchar(255) DEFAULT NULL,
  `job_status` varchar(255) DEFAULT NULL COMMENT '0 停止 1启动',
  `cron_expression` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `bean_class` varchar(255) DEFAULT NULL,
  `is_concurrent` varchar(255) DEFAULT NULL COMMENT '1',
  `spring_id` varchar(255) DEFAULT NULL,
  `method_name` varchar(255) NOT NULL,
  PRIMARY KEY (`job_id`),
  UNIQUE KEY `name_group` (`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
INSERT INTO `schedule_job` VALUES ('2', '2017-07-09 11:32:17', '2017-07-10 01:17:49', '测试', 'test', '1', '0 5 0 * * ?', '这是一个测试任务', 'com.zedata.foodsafety.task.JobTask', '1', '', 'run');

-- ----------------------------
-- Table structure for sys_app_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_app_user`;
CREATE TABLE `sys_app_user` (
  `USER_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `LAST_LOGIN` varchar(255) DEFAULT NULL,
  `IP` varchar(100) DEFAULT NULL,
  `STATUS` varchar(32) DEFAULT NULL,
  `BZ` varchar(255) DEFAULT NULL,
  `PHONE` varchar(100) DEFAULT NULL,
  `SFID` varchar(100) DEFAULT NULL,
  `START_TIME` varchar(100) DEFAULT NULL,
  `END_TIME` varchar(100) DEFAULT NULL,
  `YEARS` int(10) DEFAULT NULL,
  `NUMBER` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_app_user
-- ----------------------------
INSERT INTO `sys_app_user` VALUES ('04762c0b28b643939455c7800c2e2412', 'dsfsd', 'f1290186a5d0b1ceab27f4e77c0c5d68', 'w', '', '55896f5ce3c0494fa6850775a4e29ff6', '', '', '0', '', '18766666666', '', '', '', '0', '001', '18766666666@qq.com');
INSERT INTO `sys_app_user` VALUES ('3faac8fe5c0241e593e0f9ea6f2d5870', 'dsfsdf', 'f1290186a5d0b1ceab27f4e77c0c5d68', 'wewe', '', '68f23fc0caee475bae8d52244dea8444', '', '', '1', '', '18767676767', '', '', '', '0', 'wqwe', 'qweqwe@qq.com');

-- ----------------------------
-- Table structure for sys_dictionaries
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionaries`;
CREATE TABLE `sys_dictionaries` (
  `ZD_ID` varchar(100) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `BIANMA` varchar(100) DEFAULT NULL,
  `ORDY_BY` int(10) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `JB` int(10) DEFAULT NULL,
  `P_BM` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`ZD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dictionaries
-- ----------------------------
INSERT INTO `sys_dictionaries` VALUES ('212a6765fddc4430941469e1ec8c8e6c', '人事部', '001', '1', 'c067fdaf51a141aeaa56ed26b70de863', '2', 'BM_001');
INSERT INTO `sys_dictionaries` VALUES ('3cec73a7cc8a4cb79e3f6ccc7fc8858c', '行政部', '002', '2', 'c067fdaf51a141aeaa56ed26b70de863', '2', 'BM_002');
INSERT INTO `sys_dictionaries` VALUES ('48724375640341deb5ef01ac51a89c34', '北京', 'dq001', '1', 'cdba0b5ef20e4fc0a5231fa3e9ae246a', '2', 'DQ_dq001');
INSERT INTO `sys_dictionaries` VALUES ('5a1547632cca449db378fbb9a042b336', '研发部', '004', '4', 'c067fdaf51a141aeaa56ed26b70de863', '2', 'BM_004');
INSERT INTO `sys_dictionaries` VALUES ('7f9cd74e60a140b0aea5095faa95cda3', '财务部', '003', '3', 'c067fdaf51a141aeaa56ed26b70de863', '2', 'BM_003');
INSERT INTO `sys_dictionaries` VALUES ('b861bd1c3aba4934acdb5054dd0d0c6e', '科技不', 'kj', '7', 'c067fdaf51a141aeaa56ed26b70de863', '2', 'BM_kj');
INSERT INTO `sys_dictionaries` VALUES ('c067fdaf51a141aeaa56ed26b70de863', '部门', 'BM', '1', '0', '1', 'BM');
INSERT INTO `sys_dictionaries` VALUES ('cdba0b5ef20e4fc0a5231fa3e9ae246a', '地区', 'DQ', '2', '0', '1', 'DQ');
INSERT INTO `sys_dictionaries` VALUES ('f184bff5081d452489271a1bd57599ed', '上海', 'SH', '2', 'cdba0b5ef20e4fc0a5231fa3e9ae246a', '2', 'DQ_SH');
INSERT INTO `sys_dictionaries` VALUES ('f30bf95e216d4ebb8169ff0c86330b8f', '客服部', '006', '6', 'c067fdaf51a141aeaa56ed26b70de863', '2', 'BM_006');

-- ----------------------------
-- Table structure for sys_gl_qx
-- ----------------------------
DROP TABLE IF EXISTS `sys_gl_qx`;
CREATE TABLE `sys_gl_qx` (
  `GL_ID` varchar(100) NOT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `FX_QX` int(10) DEFAULT NULL,
  `FW_QX` int(10) DEFAULT NULL,
  `QX1` int(10) DEFAULT NULL,
  `QX2` int(10) DEFAULT NULL,
  `QX3` int(10) DEFAULT NULL,
  `QX4` int(10) DEFAULT NULL,
  PRIMARY KEY (`GL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_gl_qx
-- ----------------------------
INSERT INTO `sys_gl_qx` VALUES ('1', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `sys_gl_qx` VALUES ('2', '1', '0', '0', '1', '1', '1', '1');
INSERT INTO `sys_gl_qx` VALUES ('55896f5ce3c0494fa6850775a4e29ff6', '7', '0', '0', '1', '0', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('65d40a652b3248538434a4cc2253a8b6', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('68f23fc0caee475bae8d52244dea8444', '7', '0', '0', '1', '0', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('7dfd8d1f7b6245d283217b7e63eec9b2', '1', '1', '1', '0', '0', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('ac66961adaa2426da4470c72ffeec117', '1', '1', '0', '0', '1', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('b0c77c29dfa140dc9b14a29c056f824f', '7', '1', '0', '1', '0', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('b6f04b8efe404131a3b22e7eccf1838d', '65d40a652b3248538434a4cc2253a8b6', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('e74f713314154c35bd7fc98897859fe3', '6', '1', '1', '1', '1', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('f944a9df72634249bbcb8cb73b0c9b86', '7', '1', '1', '1', '0', '0', '0');

-- ----------------------------
-- Table structure for sys_mail
-- ----------------------------
DROP TABLE IF EXISTS `sys_mail`;
CREATE TABLE `sys_mail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `send_to_mail` varchar(255) NOT NULL COMMENT '收件人邮箱地址,多个使用";"隔开',
  `subject` varchar(255) NOT NULL COMMENT '邮件主题',
  `key_word` varchar(255) NOT NULL COMMENT '报警关键字，多个使用逗号隔开',
  `threshold` int(4) NOT NULL COMMENT '阈值，到大该值，触发警报',
  `last_update_time` datetime DEFAULT NULL COMMENT '最后更新时间,也就是最近一次执行时间',
  `content` varchar(1000) NOT NULL COMMENT '邮件中心内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_mail
-- ----------------------------
INSERT INTO `sys_mail` VALUES ('1', 'bi_jiajin@163.com ', '邮件发送测试', '广东,东莞', '2', null, '');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `MENU_ID` int(11) NOT NULL,
  `MENU_NAME` varchar(255) DEFAULT NULL,
  `MENU_URL` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `MENU_ORDER` varchar(100) DEFAULT NULL,
  `MENU_ICON` varchar(30) DEFAULT NULL,
  `MENU_TYPE` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '#', '0', '1', 'icon-desktop', '2');
INSERT INTO `sys_menu` VALUES ('2', '角色管理', 'role.do', '1', '2', null, '2');
INSERT INTO `sys_menu` VALUES ('5', '系统用户', 'user/listUsers.do', '1', '3', null, '2');
INSERT INTO `sys_menu` VALUES ('22', '栏目管理', '#', '0', '5', 'icon-list', '2');
INSERT INTO `sys_menu` VALUES ('23', '栏目管理', 'Column/coluList.do', '22', '1', null, '2');
INSERT INTO `sys_menu` VALUES ('24', '任务管理', '#', '0', '3', 'icon-calendar', '2');
INSERT INTO `sys_menu` VALUES ('25', '任务管理', 'task/taskList.do', '24', '1', null, '2');
INSERT INTO `sys_menu` VALUES ('26', '预警管理', '#', '0', '4', 'icon-envelope-alt', '2');
INSERT INTO `sys_menu` VALUES ('27', '预警设置', 'msg/msgList.do', '26', '1', null, '2');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `ROLE_ID` varchar(100) NOT NULL,
  `ROLE_NAME` varchar(100) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `ADD_QX` varchar(255) DEFAULT NULL,
  `DEL_QX` varchar(255) DEFAULT NULL,
  `EDIT_QX` varchar(255) DEFAULT NULL,
  `CHA_QX` varchar(255) DEFAULT NULL,
  `QX_ID` varchar(100) DEFAULT NULL,
  `RH_COLUMNS` varchar(255) DEFAULT NULL COMMENT '栏目',
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '系统管理员', '264241190', '0', '1', '1', '1', '1', '1', '6');
INSERT INTO `sys_role` VALUES ('2', '超级管理员', '264241190', '1', '1048822', '12582950', '34', '54', '2', null);
INSERT INTO `sys_role` VALUES ('4', '用户组', '118', '0', '0', '0', '0', '0', null, null);
INSERT INTO `sys_role` VALUES ('55896f5ce3c0494fa6850775a4e29ff6', '特级会员', '498', '7', '1048630', '0', '0', '0', '55896f5ce3c0494fa6850775a4e29ff6', null);
INSERT INTO `sys_role` VALUES ('6', '客户组', '18', '0', '1', '1', '1', '1', null, null);
INSERT INTO `sys_role` VALUES ('65d40a652b3248538434a4cc2253a8b6', 'APP用户', '', '0', '0', '0', '0', '0', '65d40a652b3248538434a4cc2253a8b6', '126');
INSERT INTO `sys_role` VALUES ('68f23fc0caee475bae8d52244dea8444', '中级会员', '498', '7', '0', '0', '0', '0', '68f23fc0caee475bae8d52244dea8444', null);
INSERT INTO `sys_role` VALUES ('7', '会员组', '498', '0', '0', '0', '0', '1', null, '94');
INSERT INTO `sys_role` VALUES ('7dfd8d1f7b6245d283217b7e63eec9b2', '管理员B', '264241190', '1', '246', '0', '0', '0', '7dfd8d1f7b6245d283217b7e63eec9b2', null);
INSERT INTO `sys_role` VALUES ('ac66961adaa2426da4470c72ffeec117', '管理员A', '264241190', '1', '54', '54', '0', '246', 'ac66961adaa2426da4470c72ffeec117', null);
INSERT INTO `sys_role` VALUES ('b0c77c29dfa140dc9b14a29c056f824f', '高级会员', '498', '7', '0', '0', '0', '0', 'b0c77c29dfa140dc9b14a29c056f824f', null);
INSERT INTO `sys_role` VALUES ('b6f04b8efe404131a3b22e7eccf1838d', 'APP用户', '12582912', '65d40a652b3248538434a4cc2253a8b6', '0', '0', '0', '0', 'b6f04b8efe404131a3b22e7eccf1838d', '126');
INSERT INTO `sys_role` VALUES ('e74f713314154c35bd7fc98897859fe3', '黄金客户', '18', '6', '1', '1', '1', '1', 'e74f713314154c35bd7fc98897859fe3', null);
INSERT INTO `sys_role` VALUES ('f944a9df72634249bbcb8cb73b0c9b86', '初级会员', '498', '7', '1', '1', '1', '1', 'f944a9df72634249bbcb8cb73b0c9b86', null);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `USER_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `LAST_LOGIN` varchar(255) DEFAULT NULL,
  `IP` varchar(100) DEFAULT NULL,
  `STATUS` varchar(32) DEFAULT NULL,
  `BZ` varchar(255) DEFAULT NULL,
  `SKIN` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(32) DEFAULT NULL,
  `NUMBER` varchar(100) DEFAULT NULL,
  `PHONE` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('089d664844f8441499955b3701696fc0', 'fushide', 'de41b7fb99201d8334c23c014db35ecd92df81bc', '富师德', '', '2', '', '', '0', '18629359', 'default', 'asdadf@qq.com', '1231', '18766666666');
INSERT INTO `sys_user` VALUES ('0b3f2ab1896b47c097a81d322697446a', 'zhangsan', 'de41b7fb99201d8334c23c014db35ecd92df81bc', '张三', '', '2', '2015-06-03 22:09:13', '127.0.0.1', '0', '小张', 'default', 'wwwwq@qq.com', '1101', '18788888888');
INSERT INTO `sys_user` VALUES ('0e2da7c372e147a0b67afdf4cdd444a3', 'dfsdf', 'de41b7fb99201d8334c23c014db35ecd92df81bc', 'wqeqw', '', 'e74f713314154c35bd7fc98897859fe3', '', '', '0', 'ff', 'default', 'q324@qq.com', 'dsfsdddd', '18767676767');
INSERT INTO `sys_user` VALUES ('1', 'admin', 'de41b7fb99201d8334c23c014db35ecd92df81bc', '系统管理员', '1133671055321055258374707980945218933803269864762743594642571294', '1', '2017-08-26 15:45:26', '0:0:0:0:0:0:0:1', '0', '最高统治者', 'default', 'admin@main.com', '001', '18788888888');
INSERT INTO `sys_user` VALUES ('3d3bacf7535444cda51f23711e32c0b2', 'sss', 'de41b7fb99201d8334c23c014db35ecd92df81bc', '中丧生', '', 'ac66961adaa2426da4470c72ffeec117', '', '', '0', 'cess', 'default', '12312315@qq.com', '223', '18777777878');
INSERT INTO `sys_user` VALUES ('6262d0f311524325a2d5d67d996576fc', 'bijiajin', '1731e25249fc58e70cfbc14d4637196a2cbbd2b8', '毕家金', '', 'b6f04b8efe404131a3b22e7eccf1838d', '2017-07-09 12:11:14', '', '0', 'App用户', 'default', 'bi_jiajin@163.com', '10010', '15301306288');
INSERT INTO `sys_user` VALUES ('79d9e8d227d14902871e162950d17356', 'xinyonghu', 'de41b7fb99201d8334c23c014db35ecd92df81bc', '新用户22', '', '2', '', '', '0', '新用户22', 'default', 'zhangsassn@www.com', '121121', '18765656556');
INSERT INTO `sys_user` VALUES ('8009132b158748a5a84510f91a291119', 'asdasd', 'de41b7fb99201d8334c23c014db35ecd92df81bc', 'sdsdf', '', '7dfd8d1f7b6245d283217b7e63eec9b2', '', '', '0', '', 'default', '12312312@qq.com', '2312', '18765810587');
INSERT INTO `sys_user` VALUES ('b825f152368549069be79e1d34184afa', 'san', 'de41b7fb99201d8334c23c014db35ecd92df81bc', '三', '', 'b6f04b8efe404131a3b22e7eccf1838d', '2015-08-03 14:18:14', '127.0.0.1', '0', 'sdfsdgf', 'default', 'sdfsdf@qq.com', 'sdsaw22', '18765656565');
INSERT INTO `sys_user` VALUES ('be025a79502e433e820fac37ddb1cfc2', 'zhangsan570256', 'de41b7fb99201d8334c23c014db35ecd92df81bc', '张三', '', '2', '', '', '0', '小张', 'default', 'zhangsan@www.com', '21101', '2147483647');

-- ----------------------------
-- Table structure for sys_user_qx
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_qx`;
CREATE TABLE `sys_user_qx` (
  `U_ID` varchar(100) NOT NULL,
  `C1` int(10) DEFAULT NULL,
  `C2` int(10) DEFAULT NULL,
  `C3` int(10) DEFAULT NULL,
  `C4` int(10) DEFAULT NULL,
  `Q1` int(10) DEFAULT NULL,
  `Q2` int(10) DEFAULT NULL,
  `Q3` int(10) DEFAULT NULL,
  `Q4` int(10) DEFAULT NULL,
  PRIMARY KEY (`U_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_qx
-- ----------------------------
INSERT INTO `sys_user_qx` VALUES ('1', '1', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('2', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `sys_user_qx` VALUES ('55896f5ce3c0494fa6850775a4e29ff6', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('65d40a652b3248538434a4cc2253a8b6', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('68f23fc0caee475bae8d52244dea8444', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('7dfd8d1f7b6245d283217b7e63eec9b2', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('ac66961adaa2426da4470c72ffeec117', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('b0c77c29dfa140dc9b14a29c056f824f', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('b6f04b8efe404131a3b22e7eccf1838d', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('e74f713314154c35bd7fc98897859fe3', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('f944a9df72634249bbcb8cb73b0c9b86', '0', '0', '0', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for tb_pictures
-- ----------------------------
DROP TABLE IF EXISTS `tb_pictures`;
CREATE TABLE `tb_pictures` (
  `PICTURES_ID` varchar(100) NOT NULL,
  `TITLE` varchar(255) DEFAULT NULL COMMENT '标题',
  `NAME` varchar(255) DEFAULT NULL COMMENT '文件名',
  `PATH` varchar(255) DEFAULT NULL COMMENT '路径',
  `CREATETIME` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `MASTER_ID` varchar(255) DEFAULT NULL COMMENT '属于',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`PICTURES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_pictures
-- ----------------------------
INSERT INTO `tb_pictures` VALUES ('1d16c4e6ac2d46fda5802462819b3162', '图片', 'ef09a150ba8f4f36864fbfa6540ffda8.jpg', '20150803/ef09a150ba8f4f36864fbfa6540ffda8.jpg', '2015-08-03 14:31:32', '1', '图片管理处上传');
INSERT INTO `tb_pictures` VALUES ('aa07d74f97fe4171be10067f6e738820', '图片', 'c238f8ac2343484daee37c70855c217a.jpg', '20150803/c238f8ac2343484daee37c70855c217a.jpg', '2015-08-03 14:33:08', '1', '图片管理处上传');
INSERT INTO `tb_pictures` VALUES ('bd0f0dbf926b41c986e14d7e3008e65a', '图片', 'f91e764e253f4de384bec4c7e6342af3.jpg', '20150803/f91e764e253f4de384bec4c7e6342af3.jpg', '2015-08-03 14:31:32', '1', '图片管理处上传');
INSERT INTO `tb_pictures` VALUES ('ccde8af6778f42e7924ede153d9c1465', '图片', '25dba768c6a04904b2cfce26730ee50d.jpg', '20150803/25dba768c6a04904b2cfce26730ee50d.jpg', '2015-08-03 14:31:33', '1', '图片管理处上传');

-- ----------------------------
-- Table structure for weixin_command
-- ----------------------------
DROP TABLE IF EXISTS `weixin_command`;
CREATE TABLE `weixin_command` (
  `COMMAND_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT '关键词',
  `COMMANDCODE` varchar(255) DEFAULT NULL COMMENT '应用路径',
  `CREATETIME` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(1) NOT NULL COMMENT '状态',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`COMMAND_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_command
-- ----------------------------
INSERT INTO `weixin_command` VALUES ('2636750f6978451b8330874c9be042c2', '锁定服务器', 'rundll32.exe user32.dll,LockWorkStation', '2015-05-10 21:25:06', '1', '锁定计算机');
INSERT INTO `weixin_command` VALUES ('46217c6d44354010823241ef484f7214', '打开浏览器', 'C:/Program Files/Internet Explorer/iexplore.exe', '2015-05-09 02:43:02', '1', '打开浏览器操作');
INSERT INTO `weixin_command` VALUES ('576adcecce504bf3bb34c6b4da79a177', '关闭浏览器', 'taskkill /f /im iexplore.exe', '2015-05-09 02:36:48', '1', '关闭浏览器操作');
INSERT INTO `weixin_command` VALUES ('854a157c6d99499493f4cc303674c01f', '关闭QQ', 'taskkill /f /im qq.exe', '2015-05-10 21:25:46', '1', '关闭QQ');
INSERT INTO `weixin_command` VALUES ('ab3a8c6310ca4dc8b803ecc547e55ae7', '打开QQ', 'D:/SOFT/QQ/QQ/Bin/qq.exe', '2015-05-10 21:25:25', '1', '打开QQ');

-- ----------------------------
-- Table structure for weixin_imgmsg
-- ----------------------------
DROP TABLE IF EXISTS `weixin_imgmsg`;
CREATE TABLE `weixin_imgmsg` (
  `IMGMSG_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT '关键词',
  `CREATETIME` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(11) NOT NULL COMMENT '状态',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  `TITLE1` varchar(255) DEFAULT NULL COMMENT '标题1',
  `DESCRIPTION1` varchar(255) DEFAULT NULL COMMENT '描述1',
  `IMGURL1` varchar(255) DEFAULT NULL COMMENT '图片地址1',
  `TOURL1` varchar(255) DEFAULT NULL COMMENT '超链接1',
  `TITLE2` varchar(255) DEFAULT NULL COMMENT '标题2',
  `DESCRIPTION2` varchar(255) DEFAULT NULL COMMENT '描述2',
  `IMGURL2` varchar(255) DEFAULT NULL COMMENT '图片地址2',
  `TOURL2` varchar(255) DEFAULT NULL COMMENT '超链接2',
  `TITLE3` varchar(255) DEFAULT NULL COMMENT '标题3',
  `DESCRIPTION3` varchar(255) DEFAULT NULL COMMENT '描述3',
  `IMGURL3` varchar(255) DEFAULT NULL COMMENT '图片地址3',
  `TOURL3` varchar(255) DEFAULT NULL COMMENT '超链接3',
  `TITLE4` varchar(255) DEFAULT NULL COMMENT '标题4',
  `DESCRIPTION4` varchar(255) DEFAULT NULL COMMENT '描述4',
  `IMGURL4` varchar(255) DEFAULT NULL COMMENT '图片地址4',
  `TOURL4` varchar(255) DEFAULT NULL COMMENT '超链接4',
  `TITLE5` varchar(255) DEFAULT NULL COMMENT '标题5',
  `DESCRIPTION5` varchar(255) DEFAULT NULL COMMENT '描述5',
  `IMGURL5` varchar(255) DEFAULT NULL COMMENT '图片地址5',
  `TOURL5` varchar(255) DEFAULT NULL COMMENT '超链接5',
  `TITLE6` varchar(255) DEFAULT NULL COMMENT '标题6',
  `DESCRIPTION6` varchar(255) DEFAULT NULL COMMENT '描述6',
  `IMGURL6` varchar(255) DEFAULT NULL COMMENT '图片地址6',
  `TOURL6` varchar(255) DEFAULT NULL COMMENT '超链接6',
  `TITLE7` varchar(255) DEFAULT NULL COMMENT '标题7',
  `DESCRIPTION7` varchar(255) DEFAULT NULL COMMENT '描述7',
  `IMGURL7` varchar(255) DEFAULT NULL COMMENT '图片地址7',
  `TOURL7` varchar(255) DEFAULT NULL COMMENT '超链接7',
  `TITLE8` varchar(255) DEFAULT NULL COMMENT '标题8',
  `DESCRIPTION8` varchar(255) DEFAULT NULL COMMENT '描述8',
  `IMGURL8` varchar(255) DEFAULT NULL COMMENT '图片地址8',
  `TOURL8` varchar(255) DEFAULT NULL COMMENT '超链接8',
  PRIMARY KEY (`IMGMSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_imgmsg
-- ----------------------------
INSERT INTO `weixin_imgmsg` VALUES ('380b2cb1f4954315b0e20618f7b5bd8f', '首页', '2015-05-10 20:51:09', '1', '图文回复', '图文回复标题', '图文回复描述', 'http://a.hiphotos.baidu.com/image/h%3D360/sign=c6c7e73ebc389b5027ffe654b535e5f1/a686c9177f3e6709392bb8df3ec79f3df8dc55e3.jpg', 'www.baidu.com', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for weixin_textmsg
-- ----------------------------
DROP TABLE IF EXISTS `weixin_textmsg`;
CREATE TABLE `weixin_textmsg` (
  `TEXTMSG_ID` varchar(100) NOT NULL,
  `KEYWORD` varchar(255) DEFAULT NULL COMMENT '关键词',
  `CONTENT` varchar(255) DEFAULT NULL COMMENT '内容',
  `CREATETIME` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `STATUS` int(11) DEFAULT NULL COMMENT '状态',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`TEXTMSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of weixin_textmsg
-- ----------------------------
INSERT INTO `weixin_textmsg` VALUES ('303c190498a045bdbba4c940c2f0d9f9', '1ss', '1ssddd', '2015-05-18 20:17:02', '1', '1ssdddsd');
INSERT INTO `weixin_textmsg` VALUES ('63681adbe7144f10b66d6863e07f23c2', '你好', '你也好', '2015-05-09 02:39:23', '1', '文本回复');
INSERT INTO `weixin_textmsg` VALUES ('695cd74779734231928a253107ab0eeb', '吃饭', '吃了噢噢噢噢', '2015-05-10 22:52:27', '1', '文本回复');
INSERT INTO `weixin_textmsg` VALUES ('d4738af7aea74a6ca1a5fb25a98f9acb', '关注', '关注', '2015-05-11 02:12:36', '1', '关注回复');
