/*
Navicat MySQL Data Transfer

Source Server         : db01
Source Server Version : 50158
Source Host           : localhost:6033
Source Database       : transformation-rltm-test

Target Server Type    : MYSQL
Target Server Version : 50158
File Encoding         : 65001

Date: 2014-12-10 19:01:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `app_mapping`
-- ----------------------------
DROP TABLE IF EXISTS `app_mapping`;
CREATE TABLE `app_mapping` (
  `app_name` varchar(50) NOT NULL DEFAULT '',
  `type` varchar(255) DEFAULT NULL,
  `m_key` varchar(255) NOT NULL DEFAULT '',
  `m_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`app_name`,`m_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_mapping
-- ----------------------------
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'f1f1_18', '黑衣森林中央林区');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'f1f2_19', '黑衣森林东部林区');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'f1f3_20', '黑衣森林南部林区');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'f1f4_21', '黑衣森林北部林区');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'land_23', '未知');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 's1h1_22', '海雾村');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'f1f1_2_52', '黑衣森林中央林区');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 's1f1_24', '中拉诺西亚');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 's1f2_25', '拉诺西亚低地');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 's1f3_26', '东拉诺西亚');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 's1f4_27', '西拉诺西亚');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 's1f5_28', '拉诺西亚高地');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 's1f6_29', '拉诺西亚外地');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'f1f1_3_53', '黑衣森林中央林区');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'w1f1_30', '西萨纳兰');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'w1f2_31', '中萨纳兰');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'w1f3_32', '东萨纳兰');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'w1f4_33', '南萨纳兰');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'w1f5_34', '北萨纳兰');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'w1h1_35', '高脚孤丘');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'land_43', '未知');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'land_44', '未知');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'land_45', '未知');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'land_46', '未知');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'land_47', '未知');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'land_50', '未知');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'land_51', '未知');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'f1t1_2', '格里达尼亚新街');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'f1t2_3', '格里达尼亚旧街');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'f1to_1', '格里达尼亚新街');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'inn_4', 'inn');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'land_6', '未知');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'r1f1_5', '库尔札斯中央高地');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 's1f3_2_54', '东拉诺西亚');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'gm_48', 'gm');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'l1f1_10', '摩杜纳');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'land_11', '未知');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 's1t1_8', '利姆萨·罗敏萨上层甲板');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 's1t2_9', '利姆萨·罗敏萨下层甲板');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 's1to_7', '利姆萨·罗敏萨');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'event_15', 'event');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'f1h1_16', '薰衣草苗圃');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'l1f1_2_55', '摩杜纳');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'land_17', '未知');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'w1t1_13', '乌尔达哈现世回廊');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'w1t2_14', '乌尔达哈来生回廊');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'w1to_12', '乌尔达哈现世回廊');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'land_36', '未知');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'land_37', '未知');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'land_38', '未知');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'land_39', '未知');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'land_40', '未知');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'land_41', '未知');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'land_42', '未知');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'r1f1_2_56', '库尔札斯中央高地');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'pgo4_270', '中萨纳兰');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'pqib03_265', '大树之荫下蠢动的黑暗');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'pqib08_266', '烈火中的胜利号');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'pqib13_267', '背叛的代价');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'pqib18_268', '消失在铜铃中的梦');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'pqib23_269', '未知');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'pwd1_271', '铜铃铜山');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'pfd1_278', '塔姆·塔拉墓园');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'pgo5_277', '黑衣森林');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'pqib04_272', '蕾亚的遗物');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'pqib09_273', '斗魂');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'pqib14_274', '雨燕塔殖民地的黑暗');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'pqib19_275', '凶猛火神伊弗利特');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'pqib24_276', '凄惨的临检战术');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'pgo1_284', '中拉诺西亚');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'pqib05_279', '射向黑暗之箭');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'pqib10_280', '豪杰的试练与责任');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'pqib15_281', '大霸王树下');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'pqib20_282', '前行之路（双蛇党）');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'pwd2_285', '日影地修炼所');
INSERT INTO `app_mapping` VALUES ('ff14', 'map', 'pwfa1_283', '炎帝陵');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '128', '利姆萨·罗敏萨上层甲板');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '129', '利姆萨·罗敏萨下层甲板');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '130', '乌尔达哈现世回廊');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '131', '乌尔达哈来生回廊');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '132', '格里达尼亚新街');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '133', '格里达尼亚旧街');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '134', '中拉诺西亚');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '135', '拉诺西亚低地');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '136', '海雾村');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '137', '东拉诺西亚');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '138', '西拉诺西亚');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '139', '拉诺西亚高地');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '140', '西萨纳兰');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '141', '中萨纳兰');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '145', '东萨纳兰');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '146', '南萨纳兰');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '147', '北萨纳兰');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '148', '黑衣森林中央林区');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '152', '黑衣森林东部林区');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '153', '黑衣森林南部林区');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '154', '黑衣森林北部林区');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '155', '库尔札斯中央高地');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '156', '摩杜纳');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '173', '艾欧泽亚地下空间');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '176', '陌迪翁监狱');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '177', '后桅旅店');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '178', '沙钟旅亭');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '179', '栖木旅馆');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '180', '拉诺西亚外地');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '181', '利姆萨·罗敏萨');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '182', '乌尔达哈现世回廊');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '183', '格里达尼亚新街');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '184', '0');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '185', '0');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '186', '0');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '187', '0');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '188', '0');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '189', '0');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '197', '0');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '198', '提督室');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '199', '利姆萨·罗敏萨会议室');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '200', '利姆萨·罗敏萨演讲室');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '201', '0');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '203', '0');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '204', '神勇队司令室');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '205', '芙蓉圆桌');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '209', '0');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '210', '银胄团总长室');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '211', '芳香堂');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '212', '沙之家');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '213', '0');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '218', '黑衣森林北部林区');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '241', '陨石勘查坑表层');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '242', '陨石勘查坑深层');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '243', '诸神黄昏级拘束舰');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '244', '隔离壁');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '245', '中枢区');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '246', '0');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '247', '第一舰桥');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '250', '狼狱停船场');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '276', '次元缝隙迎宾室');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '282', '海雾村私人小屋');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '283', '海雾村私人公馆');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '284', '海雾村私人别墅');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '339', '海雾村');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '340', '薰衣草苗圃');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '341', '高脚孤丘');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '342', '薰衣草苗圃私人小屋');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '343', '薰衣草苗圃私人公馆');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '344', '薰衣草苗圃私人别墅');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '345', '高脚孤丘私人小屋');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '346', '高脚孤丘私人公馆');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '347', '高脚孤丘私人别墅');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '351', '石之家');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '361', '0');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '367', '0');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '371', '0');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '373', '0');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '374', '0');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '375', '0');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '376', '0');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '190', '黑衣森林中央林区');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '191', '黑衣森林东部林区');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '192', '黑衣森林南部林区');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '214', '中拉诺西亚');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '215', '西萨纳兰');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '216', '中萨纳兰');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '219', '黑衣森林中央林区');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '220', '黑衣森林南部林区');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '221', '拉诺西亚高地');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '222', '拉诺西亚低地');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '223', '库尔札斯中央高地');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '298', '库尔札斯中央高地');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '299', '摩杜纳');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '300', '摩杜纳');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '157', '沙斯塔夏溶洞');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '158', '布雷福洛克斯野营地');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '159', '放浪神古神殿');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '160', '天狼星灯塔');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '161', '铜铃铜山');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '162', '日影地修炼所');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '163', '喀恩埋没圣堂');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '164', '塔姆·塔拉墓园');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '166', '静语庄园');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '167', '无限城古堡');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '168', '石卫塔');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '169', '托托·拉克千狱');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '170', '樵鸣洞');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '171', '泽梅尔要塞');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '172', '黄金谷');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '202', '炎帝陵');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '206', '奥·哥摩罗火口神殿');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '207', '荆棘之园');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '208', '呼啸眼石塔群');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '217', '帝国南方堡');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '224', '天幕魔导城');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '292', '炎帝陵');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '293', '奥·哥摩罗火口神殿');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '294', '呼啸眼石塔群');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '295', '炎帝陵');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '296', '奥·哥摩罗火口神殿');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '297', '呼啸眼石塔群');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '174', '古代人迷宫');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '281', '对利维亚桑双体船');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '348', '后营门');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '349', '铜铃铜山');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '350', '静语庄园');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '355', '陨石背阴地');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '356', '拘束舰外围');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '357', '诸神黄昏级三号舰舰体中央');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '358', '诸神黄昏级三号舰作战室');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '359', '对利维亚桑双体船');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '362', '布雷福洛克斯野营地');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '363', '无限城市街古迹');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '364', '荆棘之园');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '365', '石卫塔');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '366', '狮鹫大桥');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '360', '日影地修炼所');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '368', '圣人泪');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '369', '兽斗间');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '372', '古代人迷宫');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '353', '对利维亚桑双体船');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '354', '后营门');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '225', '牢狱之影');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '226', '大树之荫下蠢动的黑暗');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '227', '蕾亚的遗物');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '228', '西尔瓦尔的弓术训练');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '229', '射向黑暗之箭');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '230', '雾中的歧路');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '231', '毫无迷惘的眼瞳');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '232', '浮出水面的犯人');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '233', '追踪可疑者');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '234', '水之试炼');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '235', '领悟自然');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '236', '毫无迷惘的眼瞳');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '237', '实力的证明');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '238', '命运的长枪');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '239', '勇气的证明');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '240', '勇气的证明');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '248', '成功的两面');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '249', '烈火中的胜利号');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '251', '拳圣');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '252', '海词石窟的潜伏者');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '253', '0');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '254', '箭雨中的胜机');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '255', '蠢动的黑暗');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '256', '利剑与铁拳的交锋');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '257', '纳尔札尔双剑');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '258', '斗魂不再');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '259', '点燃斗魂');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '260', '烈火光明星，驰骋奔流星');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '261', '拳圣');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '262', '豪杰的试练与责任');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '263', '移动山脉库加塔');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '264', '突破阻隔');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '265', '斩断宿怨之日');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '266', '狂猛之危');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '267', '围困之危');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '268', '射向深渊的光');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '269', '胆小之人的勇气');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '270', '大霸王树下');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '271', '至宝的暗影');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '272', '背叛的代价');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '273', '铜刃之中的正义');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '274', '消失在铜铃中的梦');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '275', '凶猛火神伊弗利特');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '277', '前行之路（双蛇党）');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '278', '前行之路（恒辉队）');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '279', '前行之路（黑涡团）');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '280', '雨燕塔殖民地的黑暗');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '285', '0');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '286', '凄惨的临检战术');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '287', '固执的夹击战术');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '288', '秘术最高级命题的证明');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '289', '0');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '290', '命运的长枪');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '291', '心为森所惑');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '301', '异端审问');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '302', '对抗巨龙的历史');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '303', '克拉克希奥的决心');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '304', '重振旗鼓');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '305', '逃离中央堡');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '306', '小阿拉米格的大麻烦');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '307', '愤怒的风车看守人');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '308', '夺取魔导装甲');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '309', '魔导兵器所见之梦');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '310', '责任与使命');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '311', '顶级战士');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '312', '各怀异心');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '313', '高举骑士的圣剑');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '314', '亡国的雷鸣');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '315', '废王的回归');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '316', '苍天之龙骑士');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '317', '劝诱的迷雾，阴沉的门扉');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '318', '黑魔的引导，法师的真实');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '319', '伟人的后继者');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '320', '镇抚的仪式');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '321', '罪孽深重的愚者');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '322', '生命的赞歌');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '323', '业火的召唤');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '324', '大地的召唤');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '325', '烈风的召唤');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '326', '邪道与正道');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '327', '被遗忘的学问');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '328', '现实化的怨恨');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '329', '新时代的学者');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '330', '疯狂的歌声');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '331', '呼啸眼外围');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '332', '西萨纳兰');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '333', '0');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '334', '0');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '335', '摩杜纳');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '338', '艾欧泽亚地下空间');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '370', '诸神黄昏级三号舰第一舰桥');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '336', '狼狱水上竞技场');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '337', '狼狱水上竞技场');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '175', '狼狱水上竞技场');
INSERT INTO `app_mapping` VALUES ('ff14', 'territory', '352', '狼狱水上竞技场');

-- ----------------------------
-- Table structure for `meta_rule`
-- ----------------------------
DROP TABLE IF EXISTS `meta_rule`;
CREATE TABLE `meta_rule` (
  `app_name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `log_type` varchar(100) DEFAULT NULL,
  `log_name` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `rule_expression` varchar(250) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `output_strategy` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `rule_content` text CHARACTER SET utf8,
  PRIMARY KEY (`app_name`,`rule_expression`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of meta_rule
-- ----------------------------
INSERT INTO `meta_rule` VALUES ('ff14', 'ff14_comm_log', 'ff14_gm_character_log', 'GMCommand::onInfoProtoDownINFO_GM_GetTerritoryIDResult', 'one2one', '{\r\n    \"app_name\": \"ff14\",\r\n    \"rule_expression\": \"GMCommand::onInfoProtoDownINFO_GM_GetTerritoryIDResult\",\r\n    \"output_strategy\": {\r\n        \"name\": \"one2one\"\r\n    },\r\n    \"fields_desc\": [\r\n        {\r\n            \"fieldName\": \"data_date\",\r\n            \"segmentIndex\": 0,\r\n            \"strategy\": {\r\n                \"name\": \"single_value\",\r\n                \"expression\": \"\"\r\n            },\r\n            \"splitor\": \"\",\r\n            \"extract\": \"\"\r\n        },\r\n        {\r\n            \"fieldName\": \"area_id\",\r\n            \"segmentIndex\": 1,\r\n            \"strategy\": {\r\n                \"name\": \"single_value\",\r\n                \"expression\": \"\"\r\n            },\r\n            \"splitor\": \"\",\r\n            \"extract\": \"\"\r\n        },\r\n        {\r\n            \"fieldName\": \"group_id\",\r\n            \"segmentIndex\": 2,\r\n            \"strategy\": {\r\n                \"name\": \"single_value\",\r\n                \"expression\": \"\"\r\n            },\r\n            \"splitor\": \"\",\r\n            \"extract\": \"\"\r\n        },\r\n        {\r\n            \"fieldName\": \"map_name\",\r\n            \"segmentIndex\": 3,\r\n            \"strategy\": {\r\n                \"name\": \"mapping\",\r\n                \"expression\": \"\"\r\n            },\r\n            \"splitor\": \"\",\r\n            \"extract\": \"\"\r\n        },\r\n        {\r\n            \"fieldName\": \"log_time\",\r\n            \"segmentIndex\": 4,\r\n            \"strategy\": {\r\n                \"name\": \"regex\",\r\n                \"expression\": \"\\\\d{4}-\\\\d{2}-\\\\d{2} \\\\d{2}:\\\\d{2}:\\\\d{2}\"\r\n            },\r\n            \"splitor\": \"\",\r\n            \"extract\": \"\"\r\n        },\r\n        {\r\n            \"fieldName\": \"character_name\",\r\n            \"segmentIndex\": 4,\r\n            \"strategy\": {\r\n                \"name\": \"regex\",\r\n                \"expression\": \"Chara#\\\\d+\"\r\n            },\r\n            \"splitor\": \"#\",\r\n            \"extract\": \"right\"\r\n        },\r\n        {\r\n            \"fieldName\": \"target_character_id\",\r\n            \"segmentIndex\": 4,\r\n            \"strategy\": {\r\n                \"name\": \"regex\",\r\n                \"expression\": \"TargetCharacterIDChara#\\\\d+\"\r\n            },\r\n            \"splitor\": \"#\",\r\n            \"extract\": \"right\"\r\n        },\r\n        {\r\n            \"fieldName\": \"place_id\",\r\n            \"segmentIndex\": 4,\r\n            \"strategy\": {\r\n                \"name\": \"regex\",\r\n                \"expression\": \"PlaceID#\\\\d+\"\r\n            },\r\n            \"splitor\": \"#\",\r\n            \"extract\": \"right\"\r\n        },\r\n        {\r\n            \"fieldName\": \"target_character_name\",\r\n            \"segmentIndex\": 4,\r\n            \"strategy\": {\r\n                \"name\": \"regex\",\r\n                \"expression\": \"TargetCharacterName\\\\[(.*)]\",\r\n                \"group\": 1\r\n            },\r\n            \"splitor\": \"\",\r\n            \"extract\": \"\"\r\n        },\r\n        {\r\n            \"fieldName\": \"territory_id\",\r\n            \"segmentIndex\": 4,\r\n            \"strategy\": {\r\n                \"name\": \"regex\",\r\n                \"expression\": \"Terri#\\\\d+\"\r\n            },\r\n            \"splitor\": \"#\",\r\n            \"extract\": \"right\"\r\n        }\r\n    ]\r\n}');
INSERT INTO `meta_rule` VALUES ('ff14', 'ff14_comm_log', 'ff14_letter_receive_log', 'onZoneProtoUpINFO_LetterMoveAppendItem', 'one2one', '{\r\n    \"app_name\": \"ff14\",\r\n    \"rule_expression\": \"onZoneProtoUpINFO_LetterMoveAppendItem\",\r\n    \"output_strategy\": {\r\n        \"name\": \"one2one\"\r\n    },\r\n    \"fields_desc\": [\r\n        {\r\n            \"fieldName\": \"data_date\",\r\n            \"segmentIndex\": 0,\r\n            \"strategy\": {\r\n                \"name\": \"single_value\",\r\n                \"expression\": \"\"\r\n            },\r\n            \"splitor\": \"\",\r\n            \"extract\": \"\"\r\n        },\r\n        {\r\n            \"fieldName\": \"area_id\",\r\n            \"segmentIndex\": 1,\r\n            \"strategy\": {\r\n                \"name\": \"single_value\",\r\n                \"expression\": \"\"\r\n            },\r\n            \"splitor\": \"\",\r\n            \"extract\": \"\"\r\n        },\r\n        {\r\n            \"fieldName\": \"group_id\",\r\n            \"segmentIndex\": 2,\r\n            \"strategy\": {\r\n                \"name\": \"single_value\",\r\n                \"expression\": \"\"\r\n            },\r\n            \"splitor\": \"\",\r\n            \"extract\": \"\"\r\n        },\r\n        {\r\n            \"fieldName\": \"map_name\",\r\n            \"segmentIndex\": 3,\r\n            \"strategy\": {\r\n                \"name\": \"mapping\",\r\n                \"expression\": \"\"\r\n            },\r\n            \"splitor\": \"\",\r\n            \"extract\": \"\"\r\n        },\r\n        {\r\n            \"fieldName\": \"log_time\",\r\n            \"segmentIndex\": 4,\r\n            \"strategy\": {\r\n                \"name\": \"regex\",\r\n                \"expression\": \"\\\\d{4}-\\\\d{2}-\\\\d{2} \\\\d{2}:\\\\d{2}:\\\\d{2}\"\r\n            },\r\n            \"splitor\": \"\",\r\n            \"extract\": \"\"\r\n        },\r\n        {\r\n            \"fieldName\": \"character_name\",\r\n            \"segmentIndex\": 4,\r\n            \"strategy\": {\r\n                \"name\": \"regex\",\r\n                \"expression\": \"Chara#\\\\d+\"\r\n            },\r\n            \"splitor\": \"#\",\r\n            \"extract\": \"right\"\r\n        },\r\n        {\r\n            \"fieldName\": \"sendCharacterId\",\r\n            \"segmentIndex\": 4,\r\n            \"strategy\": {\r\n                \"name\": \"regex\",\r\n                \"expression\": \"SenderChara#\\\\d+\"\r\n            },\r\n            \"splitor\": \"#\",\r\n            \"extract\": \"right\"\r\n        },\r\n        {\r\n            \"fieldName\": \"send_time\",\r\n            \"segmentIndex\": 4,\r\n            \"strategy\": {\r\n                \"name\": \"regex\",\r\n                \"expression\": \"Date#\\\\d+\"\r\n            },\r\n            \"splitor\": \"#\",\r\n            \"extract\": \"right\"\r\n        },\r\n        {\r\n            \"fieldName\": \"catalog_0\",\r\n            \"segmentIndex\": 4,\r\n            \"strategy\": {\r\n                \"name\": \"regex_multiple\",\r\n                \"expression\": \"Catalog#\\\\d+\",\r\n                \"return_mode\": \"0\"\r\n            },\r\n            \"splitor\": \"#\",\r\n            \"extract\": \"right\"\r\n        },\r\n        {\r\n            \"fieldName\": \"item_0\",\r\n            \"segmentIndex\": 4,\r\n            \"strategy\": {\r\n                \"name\": \"regex_multiple\",\r\n                \"expression\": \"Stack#\\\\d+\",\r\n                \"return_mode\": \"0\"\r\n            },\r\n            \"splitor\": \"#\",\r\n            \"extract\": \"right\"\r\n        },\r\n        {\r\n            \"fieldName\": \"catalog_1\",\r\n            \"segmentIndex\": 4,\r\n            \"strategy\": {\r\n                \"name\": \"regex_multiple\",\r\n                \"expression\": \"Catalog#\\\\d+\",\r\n                \"return_mode\": \"1\"\r\n            },\r\n            \"splitor\": \"#\",\r\n            \"extract\": \"right\"\r\n        },\r\n        {\r\n            \"fieldName\": \"item_1\",\r\n            \"segmentIndex\": 4,\r\n            \"strategy\": {\r\n                \"name\": \"regex_multiple\",\r\n                \"expression\": \"Stack#\\\\d+\",\r\n                \"return_mode\": \"1\"\r\n            },\r\n            \"splitor\": \"#\",\r\n            \"extract\": \"right\"\r\n        },\r\n        {\r\n            \"fieldName\": \"catalog_2\",\r\n            \"segmentIndex\": 4,\r\n            \"strategy\": {\r\n                \"name\": \"regex_multiple\",\r\n                \"expression\": \"Catalog#\\\\d+\",\r\n                \"return_mode\": \"2\"\r\n            },\r\n            \"splitor\": \"#\",\r\n            \"extract\": \"right\"\r\n        },\r\n        {\r\n            \"fieldName\": \"item_2\",\r\n            \"segmentIndex\": 4,\r\n            \"strategy\": {\r\n                \"name\": \"regex_multiple\",\r\n                \"expression\": \"Stack#\\\\d+\",\r\n                \"return_mode\": \"2\"\r\n            },\r\n            \"splitor\": \"#\",\r\n            \"extract\": \"right\"\r\n        },\r\n        {\r\n            \"fieldName\": \"catalog_3\",\r\n            \"segmentIndex\": 4,\r\n            \"strategy\": {\r\n                \"name\": \"regex_multiple\",\r\n                \"expression\": \"Catalog#\\\\d+\",\r\n                \"return_mode\": \"3\"\r\n            },\r\n            \"splitor\": \"#\",\r\n            \"extract\": \"right\"\r\n        },\r\n        {\r\n            \"fieldName\": \"item_3\",\r\n            \"segmentIndex\": 4,\r\n            \"strategy\": {\r\n                \"name\": \"regex_multiple\",\r\n                \"expression\": \"Stack#\\\\d+\",\r\n                \"return_mode\": \"3\"\r\n            },\r\n            \"splitor\": \"#\",\r\n            \"extract\": \"right\"\r\n        },\r\n        {\r\n            \"fieldName\": \"catalog_4\",\r\n            \"segmentIndex\": 4,\r\n            \"strategy\": {\r\n                \"name\": \"regex_multiple\",\r\n                \"expression\": \"Catalog#\\\\d+\",\r\n                \"return_mode\": \"4\"\r\n            },\r\n            \"splitor\": \"#\",\r\n            \"extract\": \"right\"\r\n        },\r\n        {\r\n            \"fieldName\": \"item_4\",\r\n            \"segmentIndex\": 4,\r\n            \"strategy\": {\r\n                \"name\": \"regex_multiple\",\r\n                \"expression\": \"Stack#\\\\d+\",\r\n                \"return_mode\": \"4\"\r\n            },\r\n            \"splitor\": \"#\",\r\n            \"extract\": \"right\"\r\n        },\r\n        {\r\n            \"fieldName\": \"gil_id\",\r\n            \"segmentIndex\": 4,\r\n            \"strategy\": {\r\n                \"name\": \"regex_multiple\",\r\n                \"expression\": \"Catalog#\\\\d+\",\r\n                \"return_mode\": \"5\"\r\n            },\r\n            \"splitor\": \"#\",\r\n            \"extract\": \"right\"\r\n        },\r\n        {\r\n            \"fieldName\": \"gil_num\",\r\n            \"segmentIndex\": 4,\r\n            \"strategy\": {\r\n                \"name\": \"regex_multiple\",\r\n                \"expression\": \"Stack#\\\\d+\",\r\n                \"return_mode\": \"5\"\r\n            },\r\n            \"splitor\": \"#\",\r\n            \"extract\": \"right\"\r\n        },\r\n        {\r\n            \"fieldName\": \"ttype\",\r\n            \"segmentIndex\": 4,\r\n            \"strategy\": {\r\n                \"name\": \"regex\",\r\n                \"expression\": \"Terri#\\\\d+\"\r\n            },\r\n            \"splitor\": \"#\",\r\n            \"extract\": \"right\"\r\n        },\r\n        {\r\n            \"fieldName\": \"x\",\r\n            \"segmentIndex\": 4,\r\n            \"strategy\": {\r\n                \"name\": \"regex_multiple\",\r\n                \"expression\": \"Position\\\\(.*\\\\)~~~~~~[-]?[1-9]\\\\d*(?:\\\\.\\\\d+)?\",\r\n                \"return_mode\": \"0\"\r\n            },\r\n            \"splitor\": \"\",\r\n            \"extract\": \"\"\r\n        },\r\n        {\r\n            \"fieldName\": \"y\",\r\n            \"segmentIndex\": 4,\r\n            \"strategy\": {\r\n                \"name\": \"regex_multiple\",\r\n                \"expression\": \"Position\\\\(.*\\\\)~~~~~~[-]?[1-9]\\\\d*(?:\\\\.\\\\d+)?\",\r\n                \"return_mode\": \"1\"\r\n            },\r\n            \"splitor\": \"\",\r\n            \"extract\": \"\"\r\n        },\r\n        {\r\n            \"fieldName\": \"z\",\r\n            \"segmentIndex\": 4,\r\n            \"strategy\": {\r\n                \"name\": \"regex_multiple\",\r\n                \"expression\": \"Position\\\\(.*\\\\)~~~~~~[-]?[1-9]\\\\d*(?:\\\\.\\\\d+)?\",\r\n                \"return_mode\": \"2\"\r\n            },\r\n            \"splitor\": \"\",\r\n            \"extract\": \"\"\r\n        }\r\n    ]\r\n}');
INSERT INTO `meta_rule` VALUES ('ff14', 'ff14_item_log', 'ff14_craft_leve_npc_log', '[evnt]CraftLeveNpcTrade', 'one2one', '{ \"app_name\" : \"ff14\",\r\n  \"rule_expression\" : \"[evnt]CraftLeveNpcTrade\",\r\n  \"output_strategy\" : {\r\n    \"name\" : \"one2one\"\r\n  },\r\n  \"fields_desc\" : [\r\n	{\r\n	  \"fieldName\":\"data_date\",\r\n	  \"segmentIndex\":0,\r\n	  \"strategy\": {\r\n	   \"name\" : \"single_value\",\r\n	   \"expression\" : \"\"\r\n	  },\r\n	  \"splitor\" : \"\",\r\n	  \"extract\" : \"\"\r\n	},\r\n	{\r\n	  \"fieldName\":\"area_id\",\r\n	  \"segmentIndex\":1,\r\n	  \"strategy\": {\r\n	   \"name\" : \"single_value\",\r\n	   \"expression\" : \"\"\r\n	  },\r\n	  \"splitor\" : \"\",\r\n	  \"extract\" : \"\"\r\n	},\r\n	{\r\n	  \"fieldName\":\"group_id\",\r\n	  \"segmentIndex\":2,\r\n	  \"strategy\": {\r\n	   \"name\" : \"single_value\",\r\n	   \"expression\" : \"\"\r\n	  },\r\n	  \"splitor\" : \"\",\r\n	  \"extract\" : \"\"\r\n	},\r\n	{\r\n	  \"fieldName\":\"map_name\",\r\n	  \"segmentIndex\":3,\r\n	  \"strategy\": {\r\n	   \"name\" : \"mapping\",\r\n	   \"expression\" : \"\"\r\n	  },\r\n	  \"splitor\" : \"\",\r\n	  \"extract\" : \"\"\r\n	},\r\n	{\r\n	  \"fieldName\":\"log_time\",\r\n	  \"segmentIndex\":4,\r\n	  \"strategy\": {\r\n	   \"name\" : \"regex\",\r\n	   \"expression\" : \"\\\\d{4}-\\\\d{2}-\\\\d{2} \\\\d{2}:\\\\d{2}:\\\\d{2}\"\r\n	  },\r\n	  \"splitor\" : \"\",\r\n	  \"extract\" : \"\"\r\n	},\r\n	{\r\n	  \"fieldName\":\"character_name\",\r\n	  \"segmentIndex\":4,\r\n	  \"strategy\": {\r\n	   \"name\" : \"regex\",\r\n	   \"expression\" : \"Chara#\\\\d+\"\r\n	  },\r\n	  \"splitor\" : \"#\",\r\n	  \"extract\" : \"right\"\r\n	},\r\n	{\r\n	  \"fieldName\":\"entity_id\",\r\n	  \"segmentIndex\":4,\r\n	  \"strategy\": {\r\n	   \"name\" : \"regex\",\r\n	   \"expression\" : \"Entity#\\\\d+\"\r\n	  },\r\n	  \"splitor\" : \"#\",\r\n	  \"extract\" : \"right\"\r\n	},\r\n	{\r\n	  \"fieldName\":\"leve_id\",\r\n	  \"segmentIndex\":4,\r\n	  \"strategy\": {\r\n	   \"name\" : \"regex\",\r\n	   \"expression\" : \"leve_id=\\\\d+\"\r\n	  },\r\n	  \"splitor\" : \"=\",\r\n	  \"extract\" : \"right\"\r\n	},\r\n	{\r\n	  \"fieldName\":\"pc_name\",\r\n	  \"segmentIndex\":4,\r\n	  \"strategy\": {\r\n	   \"name\" : \"regex\",\r\n	   \"expression\" : \"pc_name=[\\u4e00-\\u9fa5_a-zA-Z0-9]+\"\r\n	  },\r\n	  \"splitor\" : \"=\",\r\n	  \"extract\" : \"right\"\r\n	}\r\n	]\r\n}');
INSERT INTO `meta_rule` VALUES ('ff14', 'ff14_item_log', 'ff14_item_get_log', '[gsys]ItemGet,', 'one2one', '{ \"app_name\" : \"ff14\",\r\n  \"rule_expression\" : \"[gsys]ItemGet,\",\r\n   \"output_strategy\" : {\r\n    \"name\" : \"one2one\"\r\n  },\r\n  \"fields_desc\" : [\r\n	{\r\n	  \"fieldName\":\"data_date\",\r\n	  \"segmentIndex\":0,\r\n	  \"strategy\": {\r\n	   \"name\" : \"single_value\",\r\n	   \"expression\" : \"\"\r\n	  },\r\n	  \"splitor\" : \"\",\r\n	  \"extract\" : \"\"\r\n	},\r\n	{\r\n	  \"fieldName\":\"area_id\",\r\n	  \"segmentIndex\":1,\r\n	  \"strategy\": {\r\n	   \"name\" : \"single_value\",\r\n	   \"expression\" : \"\"\r\n	  },\r\n	  \"splitor\" : \"\",\r\n	  \"extract\" : \"\"\r\n	},\r\n	{\r\n	  \"fieldName\":\"group_id\",\r\n	  \"segmentIndex\":2,\r\n	  \"strategy\": {\r\n	   \"name\" : \"single_value\",\r\n	   \"expression\" : \"\"\r\n	  },\r\n	  \"splitor\" : \"\",\r\n	  \"extract\" : \"\"\r\n	},\r\n	{\r\n	  \"fieldName\":\"map_name\",\r\n	  \"segmentIndex\":3,\r\n	  \"strategy\": {\r\n	   \"name\" : \"mapping\",\r\n	   \"expression\" : \"\"\r\n	  },\r\n	  \"splitor\" : \"\",\r\n	  \"extract\" : \"\"\r\n	},\r\n	{\r\n	  \"fieldName\":\"log_time\",\r\n	  \"segmentIndex\":4,\r\n	  \"strategy\": {\r\n	   \"name\" : \"regex\",\r\n	   \"expression\" : \"\\\\d{4}-\\\\d{2}-\\\\d{2} \\\\d{2}:\\\\d{2}:\\\\d{2}\"\r\n	  },\r\n	  \"splitor\" : \"\",\r\n	  \"extract\" : \"\"\r\n	},\r\n	{\r\n	  \"fieldName\":\"character_name\",\r\n	  \"segmentIndex\":4,\r\n	  \"strategy\": {\r\n	   \"name\" : \"regex\",\r\n	   \"expression\" : \"Chara#\\\\d+\"\r\n	  },\r\n	  \"splitor\" : \"#\",\r\n	  \"extract\" : \"right\"\r\n	},\r\n	{\r\n	  \"fieldName\":\"entity_id\",\r\n	  \"segmentIndex\":4,\r\n	  \"strategy\": {\r\n	   \"name\" : \"regex\",\r\n	   \"expression\" : \"Entity#\\\\d+\"\r\n	  },\r\n	  \"splitor\" : \"#\",\r\n	  \"extract\" : \"right\"\r\n	},\r\n	{\r\n	  \"fieldName\":\"catalog\",\r\n	  \"segmentIndex\":4,\r\n	  \"strategy\": {\r\n	   \"name\" : \"regex\",\r\n	   \"expression\" : \"catalog=\\\\d+\"\r\n	  },\r\n	  \"splitor\" : \"=\",\r\n	  \"extract\" : \"right\"\r\n	},\r\n	{\r\n	  \"fieldName\":\"stack\",\r\n	  \"segmentIndex\":4,\r\n	  \"strategy\": {\r\n	   \"name\" : \"regex\",\r\n	   \"expression\" : \"stack=\\\\d+\"\r\n	  },\r\n	  \"splitor\" : \"=\",\r\n	  \"extract\" : \"right\"\r\n	}\r\n	]\r\n}');
INSERT INTO `meta_rule` VALUES ('ff14', 'ff14_item_log', 'ff14_c2c_item_log', '[gsys]TradeSubmit', 'one2many', '\r\n{ \"app_name\" : \"ff14\",\r\n  \"rule_expression\" : \"[gsys]TradeSubmit\",\r\n  \"output_strategy\" : {\r\n     \"name\" : \"one2many\",\r\n     \"iterate_fields\" : \"catalogs,stacks\"\r\n   },\r\n  \"fields_desc\" : [\r\n	{\r\n	  \"fieldName\":\"data_date\",\r\n	  \"segmentIndex\":0,\r\n	  \"strategy\": {\r\n	   \"name\" : \"single_value\",\r\n	   \"expression\" : \"\"\r\n	  },\r\n	  \"splitor\" : \"\",\r\n	  \"extract\" : \"\"\r\n	},\r\n	{\r\n	  \"fieldName\":\"area_id\",\r\n	  \"segmentIndex\":1,\r\n	  \"strategy\": {\r\n	   \"name\" : \"single_value\",\r\n	   \"expression\" : \"\"\r\n	  },\r\n	  \"splitor\" : \"\",\r\n	  \"extract\" : \"\"\r\n	},\r\n	{\r\n	  \"fieldName\":\"group_id\",\r\n	  \"segmentIndex\":2,\r\n	  \"strategy\": {\r\n	   \"name\" : \"single_value\",\r\n	   \"expression\" : \"\"\r\n	  },\r\n	  \"splitor\" : \"\",\r\n	  \"extract\" : \"\"\r\n	},\r\n	{\r\n	  \"fieldName\":\"map_name\",\r\n	  \"segmentIndex\":3,\r\n	  \"strategy\": {\r\n	   \"name\" : \"single_value\",\r\n	   \"expression\" : \"\"\r\n	  },\r\n	  \"splitor\" : \"\",\r\n	  \"extract\" : \"\"\r\n	},\r\n	{\r\n	  \"fieldName\":\"log_time\",\r\n	  \"segmentIndex\":4,\r\n	  \"strategy\": {\r\n	   \"name\" : \"regex\",\r\n	   \"expression\" : \"\\\\d{4}-\\\\d{2}-\\\\d{2} \\\\d{2}:\\\\d{2}:\\\\d{2}\"\r\n	  },\r\n	  \"splitor\" : \"\",\r\n	  \"extract\" : \"\"\r\n	},\r\n	{\r\n	  \"fieldName\":\"character_name\",\r\n	  \"segmentIndex\":4,\r\n	  \"strategy\": {\r\n	   \"name\" : \"regex\",\r\n	   \"expression\" : \"Chara#\\\\d+\"\r\n	  },\r\n	  \"splitor\" : \"#\",\r\n	  \"extract\" : \"right\"\r\n	},\r\n	{\r\n	  \"fieldName\":\"entity_id\",\r\n	  \"segmentIndex\":4,\r\n	  \"strategy\": {\r\n	   \"name\" : \"regex\",\r\n	   \"expression\" : \"Entity#\\\\d+\"\r\n	  },\r\n	  \"splitor\" : \"#\",\r\n	  \"extract\" : \"right\"\r\n	},\r\n	{\r\n	  \"fieldName\":\"catalogs\",\r\n	  \"segmentIndex\":4,\r\n	  \"strategy\": {\r\n	   \"name\" : \"regex_multiple\",\r\n	   \"expression\" : \"catalog_\\\\d+=\\\\d+\"\r\n	  },\r\n	  \"splitor\" : \"=\",\r\n	  \"extract\" : \"right\"\r\n	},\r\n	{\r\n	  \"fieldName\":\"stacks\",\r\n	  \"segmentIndex\":4,\r\n	  \"strategy\": {\r\n	   \"name\" : \"regex_multiple\",\r\n	   \"expression\" : \"stack_\\\\d+=\\\\d+\"\r\n	  },\r\n	  \"splitor\" : \"=\",\r\n	  \"extract\" : \"right\"\r\n	}\r\n	\r\n	]\r\n}\r\n');
