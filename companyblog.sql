/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50555
Source Host           : localhost:3306
Source Database       : companyblog

Target Server Type    : MYSQL
Target Server Version : 50555
File Encoding         : 65001

Date: 2020-06-05 19:56:18
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `count` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `department` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO admin VALUES ('1', 'admin1', '123', '研发部');
INSERT INTO admin VALUES ('2', 'admin2', '123', '生产部');
INSERT INTO admin VALUES ('3', 'admin3', '123', '财务部');
INSERT INTO admin VALUES ('4', 'admin4', '123', '销售部');

-- ----------------------------
-- Table structure for `comments`
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `uid` int(20) NOT NULL COMMENT '发表用户id',
  `cid` int(20) NOT NULL COMMENT '评论博客id',
  `uname` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '评论用户昵称',
  `content` varchar(2000) COLLATE utf8_unicode_ci NOT NULL COMMENT '评论内容',
  `reply_count` int(11) NOT NULL DEFAULT '0' COMMENT '该评论回复数',
  `date` date NOT NULL COMMENT '评论时间',
  `star` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  PRIMARY KEY (`id`),
  KEY `fk_uid` (`uid`),
  KEY `fk_cid` (`cid`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`id`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `contents` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO comments VALUES ('31', '4', '53', 'admin1', '华为加油！！！！', '0', '2020-03-14', '1');
INSERT INTO comments VALUES ('32', '4', '53', 'admin1', '华为加油！！！', '0', '2020-03-14', '1');
INSERT INTO comments VALUES ('33', '4', '53', 'admin1', '华为加油！！！', '0', '2020-03-14', '0');
INSERT INTO comments VALUES ('37', '15', '60', '南华', '这是一个评论', '2', '2020-05-22', '1');

-- ----------------------------
-- Table structure for `contact`
-- ----------------------------
DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `uid` int(20) NOT NULL,
  `uname` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '用户昵称',
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of contact
-- ----------------------------
INSERT INTO contact VALUES ('15', '4', 'admin1', '如果我不曾见过太阳', '我本可以忍受黑暗，如果我不曾见过太阳。然而阳光已使我的荒凉，成为更新的荒凉。', '2020-03-27', '1');
INSERT INTO contact VALUES ('16', '4', 'admin1', '精忠报国', '狼烟起，江山北望，龙旗卷，马长嘶，剑气如霜，心似黄河水茫茫，二十年纵横间，谁能相抗，恨欲狂，长刀所向，多少手足忠魂埋骨他乡，何惜百死报家国，忍叹惜，更无语，血泪满眶，马蹄南去，人北望，人北望，草青黄，尘飞扬，我愿守土复开疆，堂堂中国要让四方，来贺。', '2020-03-27', '1');
INSERT INTO contact VALUES ('17', '4', 'admin1', '将进酒', '君不见，黄河之水天上来，奔流到海不复回。\n君不见，高堂明镜悲白发，朝如青丝暮成雪。\n人生得意须尽欢，莫使金樽空对月。\n天生我材必有用，千金散尽还复来。\n烹羊宰牛且为乐，会须一饮三百杯。\n岑夫子，丹丘生，将进酒，杯莫停。\n与君歌一曲，请君为我倾耳听。\n钟鼓馔玉不足贵，但愿长醉不复醒。\n古来圣贤皆寂寞，惟有饮者留其名。\n陈王昔时宴平乐，斗酒十千恣欢谑。\n主人何为言少钱，径须沽取对君酌。\n五花马，千金裘，呼儿将出换美酒，与尔同销万古愁。 ', '2020-03-28', '1');
INSERT INTO contact VALUES ('18', '1', 'ls', '蒹葭', '蒹葭苍苍，白露为霜。所谓伊人，在水一方。溯洄从之，道阻且长。溯游从之，宛在水中央。\n蒹葭萋萋，白露未晞。所谓伊人，在水之湄。溯洄从之，道阻且跻。溯游从之，宛在水中坻。\n蒹葭采采，白露未已。所谓伊人，在水之涘。溯洄从之，道阻且右。溯游从之，宛在水中沚。', '2020-03-28', '1');
INSERT INTO contact VALUES ('19', '1', 'ls', '浣溪沙', '谁念西风独自凉\n萧萧黄叶闭疏窗\n沉思往事立残阳\n\n被酒莫惊春睡重\n赌书消得泼茶香\n当时只道是寻常', '2020-03-28', '1');
INSERT INTO contact VALUES ('20', '1', 'ls', '如梦令', '常记溪亭日暮，沉醉不知归路。兴尽晚回舟，误入藕花深处。争渡，争渡，惊起一滩鸥鹭。', '2020-03-28', '1');
INSERT INTO contact VALUES ('22', '15', '南华', '毕业设计', '毕业设计能过', '2020-05-22', '1');

-- ----------------------------
-- Table structure for `contents`
-- ----------------------------
DROP TABLE IF EXISTS `contents`;
CREATE TABLE `contents` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `aid` int(20) NOT NULL,
  `admin_department` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '管理员部门',
  `title` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `pic` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `star` int(100) NOT NULL DEFAULT '0',
  `comment` int(100) NOT NULL DEFAULT '0',
  `view` int(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_aid` (`aid`),
  CONSTRAINT `contents_ibfk_1` FOREIGN KEY (`aid`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of contents
-- ----------------------------
INSERT INTO contents VALUES ('46', '2', '生产部', '每28.5秒产出一台手机的生产线', '<h2> 你手中的华为手机出生地什么样？ </h2> \n<p> 16日，环环来到位于东莞松山湖高新技术开发园区的华为南方工厂手机生产线。华为南方工厂占地1.4平方公里，是华为公司制造交付服务的大平台。这里也是Mate系列、P系列等高端手机的“籍贯”地之一。 </p> \n<br> 环环了解到，生产手机流程包括表面贴装（SMT）、单板功能测试（FT）、组装（Assembly）、整机测试、包装等环节。由于生产过程要求极高的精密度，在参观前，必须换上防尘、防静电的工作服和鞋帽。从入口向前望去，整个手机装配车间可以用“明晃晃”来形容，另一个直观感觉就是，工作人员很少！“最早的时候，一条生产线需要86个工人，现在由于持续改进，在120米的生产线上仅需要17人。”华为接待专家对环环表示。华为南方工厂手机生产线\n<br> \n<br> \n<p> 在生产线入口处对面的货架上，整齐码放着像电影胶片一样的盘状物，这些就是生产手机的物料。PCB进入生产线时会先镭雕一个二维码，这样，它就拥有了一个“身份证”，在流经整个生产线直至变成一部手机的过程中，每个零部件都会被扫描条码，“每台手机所使用的物料是哪家上游厂商提供的，都可被追溯。”华为接待专家说，“通过这样严谨的流程及严格的测试，才能将手机的品质管控提升到高标准。”环环注意到，除了单板印刷、点胶机、机械手臂等少数设备，华为的生产线大部分设备已采用自主品牌。 </p> \n<p> <img src=\"/upload/生产部/20200313160145_770.jpg\" alt=\"\"> </p> \n<br> 28.5秒，这是华为手机生产线末端产出一部封装完好的手机所需的时间。这样的生产线在南方工厂有30多条，每月的手机生产量200万台左右。在生产车间的墙壁上，最醒目的不是口号标语，而是对生产流程进行创新改善的员工表彰榜，这一细节能看出华为对持续改善的重视。那么，工人们会不会担心自己对生产流程细节的改进把自己的饭碗“改掉”，而对改善失去动力呢？华为认为这种担心是多余的：“如果生产环节通过改善节省出来的工人会投入到扩大生产规模上来，他们会拥有新的岗位。不仅如此，如果员工因改善而提高了生产线的效率，还会得到丰厚的奖励，曾有员工因为持续改善而连升两级。”\n<br> \n<br> \n<strong>5G设备模块在下水道水里泡四年仍光洁如新</strong>\n<br> \n<br> \n<p> 当向导第一次跟环环说要参观“白宫”时，环环并未反应过来，在华为，“白宫”特指一栋位于深圳坂田基地的白色欧式建筑，这里是很多华为尖端实验室的所在地，很多人干脆以编号“E1”称呼它。跟手机生产线一样，由于涉及科研机密，任何摄影摄像工具都不准带入“白宫”。走入“白宫”，你会发现这里更像一处商场，便利店、咖啡厅在明亮的中央通道两侧，冲淡了印象中实验室的严肃气氛。 </p> \n<p> <img src=\"/upload/生产部/20200313160238_860.jpg\" alt=\"\"> </p> \n<br> \n<p> <strong>“玩手机游戏为什么会卡顿？”在先进热技术实验室里，华为实验室专家这样问环环，“因为芯片运行时会发热，如果散热不好，保护机制就会把运算频率降下来，导致卡顿。”</strong> </p> \n<p> 这也许是最容易让记者们理解散热重要性的方式，而拥有100多名研究人员的热技术实验室正是专注于网络产品、企业、云、IT、消费者等ICT业务领域的先进热工程技术的研究与应用的地方。其实，散热并不是一件看上去那么容易的事，手机如此，对5G天线来说更是如此。“以5G天线来说，散热意味着要扩大表面积，而扩大表面积就要增加重量，把很重的天线安装到高塔上将是一件很费事且不安全的工作。”实验室专家带记者看一块5G Massive MIMO 64T64R(64发64收)基站样本，正是华为独特的散热技术，让5G天线变得轻薄，甚至只有不到一扇小窗大小。 </p> \n<br> \n<p> 在高级结构材料实验室的入口处，一台鱼缸被分成两个装着液体的部分，另一名实验室工作人员告诉记者，这些液体来自于欧洲的下水管道，并添加了更多杂质来增加腐蚀性。液体里泡着两台5G设备模块，一台是采用业界通用合金及涂层的模块，另一台则用了华为专利的合金及防腐技术。对比很明显：前者已是锈迹斑斑、千疮百孔，后者却光洁如新。“它们已经在水里泡了4年多了！” </p> \n<br> 据工作人员介绍，在欧洲，一些通讯设备模块只被允许安放在下水道里，所以，耐腐蚀性对设备来说极其重要。他还指出拥有华为防腐技术模块上的一处磕碰痕迹说：“这是我们用锤子砸的，毕竟在安装过程中，磕碰是难免的，即使外表涂层破损了，里边也不会被腐蚀。一位欧洲合作伙伴看到我们的产品，连夸我们研发做事‘太严谨了，太能为客户着想了’！”“以客户为中心”是《下一个倒下的会不会是华为》一书的第一章，书中这样写道，“当今时代流行‘拜资本教’‘拜技术教’，华为则信奉‘拜上帝教’，这个‘上帝’既非耶稣，又非释迦摩尼，而是客户，全球700多家电信企业及全球60亿以上人口的消费者。”在北方冬季不会结冰的天线外壳、被雨水不断冲刷而画面依然清晰的摄像头……一个个打着华为烙印的设备产品，已将全球各国实际生活中的“痛点”都考虑透彻。环环在华为实验室采访时有种强烈的感觉，这个看似最“远离”客户的部门，“以客户为中心”的信条仍存在于每一寸空间。\n<br> \n<br> 在“欧洲小镇”感受“知本主义”“你有没有发现？这些华为科学家谈到自己的工作都很自豪。”走访过程中，一名同行问环环，确实如此，这些专家在讲解时语速都很快，尽力让自己吐字清楚，生怕在有限的参观时间里没法让记者们听懂自己所研究的技术，似乎自己不是科研人员而是一名推销员。华为员工的归属感和荣誉感并不只源于对“黑科技”的酷爱，当我们把视线从晦涩深奥的技术上移开，关注他们的工作环境，也许能找到新的答案。溪流背坡村，这样一个拥有浓郁中国田园风的名字其实是最“全球化”的地方，因为这块作为华为东莞松山湖新办公基地的1900亩区域内散落着欧洲12个城市的经典建筑，因此也被称为“欧洲小镇”。红色的小火车缓缓停在“格拉纳达”车站，天色渐暗，欧式建筑里的华为员工陆陆续续走出来去吃晚餐，再过不久，建筑前的空场地上将摆出放满水果、牛奶的摊位，由员工领取夜宵，目所能及的不远处，就是他们的员工宿舍，工作和生活，在这里界限似乎并不太明显。\n<br> \n<br> 只有“为客户服务”的信条还不够，华为让人刮目相看的本钱在哪？在《华为哲学》一书中，作者周留征关于华为奉行“知本主义”的描述也许可以回答。“知本主义”即以知识为本，重视知识，尊重人才，知识资本化。为外界所艳羡的“全员高薪、全员持股、利益共享”的机制，让这样一家高科技企业与高知识员工结成了利益共同体的关系，进而成为“事业上的共同体”。与市面上各色分析华为成功之道的书籍不同，17日的圆桌会上，任正非以自己特有的“接地气”风格来谈华为的成功与人才的关系：“华为有什么？一无所有！华为既没有背景，也没有资源，除了人的脑袋之外，一无所有。我们就是把一批中国人和一些外国人的脑袋集合起来，达到了今天的成就。”\n<br>', '2020-03-13', '/upload/生产部/20200313160145_770.jpg', '0', '0', '1');
INSERT INTO contents VALUES ('47', '2', '生产部', '任正非：今年华为新招6000名员工 预计生产2.7亿部手机', '7月20日，在雅虎财经专访中，任正非表示，华为今年可能生产2.7亿部手机，会买高通1亿片的芯片，华为有自主芯片，可以不用高通，但依然选择与他们合作。他称，如果美国公司不再供应，生产也不会止，相反还会提高产量。\n<br> \n<br> 任正非表示，如果美国允许大公司向华为销售，华为依旧会向他们购买，尽管在一些华为已经研发出替代品的领域下。\n<br> \n<br> 他表示，去年华为向高通买了5000万的芯片，尽管华为已经有了自主研发的芯片，今年华为可能会生产2.7亿部手机，会向高通买1亿的芯片。\n<br> \n<br> “我们可以没有高通，但依然选择与他们合作，我们会付出加倍努力让产品比之前更好。”\n<br> \n<br> 任正非表示：“如果美国公司不再供应我们，我们的生产将来也不会有停止的一天，相反我们还会提高产量。今年我们新招了6000名员工，现在华为没有威胁了，产品越先进风险就越低。”\n<br> \n<br> 任正非：华为今年最困难，可生产2.4亿部至2.5亿部手机（生产部）华为公司总裁、创始人任正非在深圳与前联合国安全理事会主席、新加坡国立大学李光耀公共政策学院创始院长Kishore Mahbubani、智能工厂工业4.0精神之父、德国生产自动化教授Detlef Zuehlke展开“咖啡对话”，主题为《数字主权从对话到行动》。在“数字主权，从对话到行动”的主题对话中，华为创始人任正非表示，“这个（谷歌系统禁用）肯定是有影响的。我们和谷歌双方是有协议的，共同努力营造世界共赢的生态。我们的Mate 30没有预装谷歌系统，现销量还是不错的。今年（智能手机）生产2.4亿至2.5亿部，明年还有明年的情况，还不能判断明年的状况。最困难就是这个时期了，再慢慢就会好起来了。”\n<br> \n<br> \n<p> 任正非还表示，愿意和美国供应商一起为人类服务，我们永远拥抱全球化。美国对我们停止供应，我们自己也能生存下来我们不支持自力更生，但这是短期措施，不是我们长期政策。因为惯性，今年上半年发展速度很快，明年年底如果仍健康发展，那么我们的生存危机就完全度过了，“我们利润增长太多了，发展速度太快，将来我们会有一些合理的调整。” </p> \n<p> <img src=\"/upload/生产部/20200313161005_759.jpg\" alt=\"\"> </p> \n<br>', '2020-03-13', '/upload/生产部/20200313161005_759.jpg', '0', '0', '1');
INSERT INTO contents VALUES ('48', '2', '生产部', '任正非：华为手机今年要生产2.7亿部 要多个芯片厂才能满足', '10月15日，华为创始人任正非在接受欧洲媒体采访时表示，华为今年的智能手机生产量将达到2.7亿部，这个产量很大，可能要几个芯片厂才够给华为提供供给。\n<br> \n<br> 由于遭遇美国打压，华为今年的智能手机业务遇到了困难，原本冲击世界第一的目标很难实现了，不过最近几个月来华为通过努力保持了智能手机业务高速增长，前两天在深圳发布会上，华为表示10月22日手机发货量已经达到了2亿部，比2018年提前64天。\n<br> \n<br> 根据今年初的消息，华为2019年的智能手机出货量目标是保底2.5亿，冲击2.7亿，有望超越三星成为全球第一大智能手机品牌，不过在5月份被美国打压之后，华为的智能手机在海外市场一度大幅下滑。\n<br> \n<br> 但是从华为这半年来的表现来看，华为智能手机业务受到的影响并没有预期中的严重，今年提前两个月完成了2亿部智能手机出货。\n<br> \n<br> 2019年还剩下2个月多的时间，按照华为的速度来看，平均每个月销量至少是2千万部，但年底的两个月是传统的旺季，出货量是高于平均水平的，所以2.7亿部的目标还是有可能完成的。\n<br> \n<br> 2018年华为智能手机发货量为2.06亿部，今年要是能达到2.7亿部，那就是增长了31%，依然会保持高速增长。\n<br> \n<br> 去年三星的手机出货量约为2.9亿部，今年此消彼长之下，三星依然有可能被华为超越，具体能否实现就看最后两个月的冲刺了。\n<br> \n<br> \n<img src=\"/upload/生产部/20200313161100_631.jpeg\" alt=\"\">', '2020-03-13', '/upload/生产部/20200313161100_631.jpeg', '0', '0', '4');
INSERT INTO contents VALUES ('49', '4', '销售部', '华为去年销量超苹果成全球第二 惟第四季遭苹果反超', '市场研究机构Gartner周二发布的数据显示，以销量计，华为取代苹果成为去年全球智能手机市占率第二大的厂商。但单计去年第四季，苹果由于推出新型号iPhone刺激第四季销量重拾升轨，重新登上全球销量榜的第二位，和首位的三星差距亦大幅收窄。\n<br> \n<br> 数据显示，苹果和小米(01810)为去年第四季销量首五大厂商中，录得销量增长的品牌。三星季内销量虽然下跌，但仍以17.3%的市占率居首位，苹果以17.1%的市占率紧随其后。华为则以14.3%的市占率排行第三。而小米手机销量于去年第四季录得16.5%的按年增长，达3240万部，使其取代OPPO成为全球第四大销量的手机品牌；Gartner的报告提到，红米Redmi型号手机的价格和表现带动整体销售上升，特别是在亚太区市场。\n<br> \n<br> \n<h3> *去年全球智能手机销量收缩1%* </h3> 2019年全球智能手机的销售量按年收缩1%，而去年第四季则跌幅则收窄至0.4%。\n<br> \n<br> 中国仍然为智能手机最大市场，全年销售量达3.9亿部，而印度则取代美国，成为去年全球第二大的智能手机最大市场，总销售量逾1.5亿部。\n<br> \n<br> 尽管去年全球整体智能手机销售量收缩，但三星、华为及小米的销售则逆市录得增长。三星全年销售量轻微增长0.4%至2.962亿部，仍居市场之首；\n<br> \n<p> 华为销售升幅达18.6%，取代苹果成为全球第二。 </p> \n<p> <img src=\"/upload/销售部/20200313161257_431.jpg\" alt=\"\"> </p>', '2020-03-13', '/upload/销售部/20200313161257_431.jpg', '0', '0', '2');
INSERT INTO contents VALUES ('50', '4', '销售部', '截至2月，去美国基站销售量已占华为销售基站的8%', '<p> <span class=\"bjh-p\">被禁止与美国供应商开展业务的中国科技巨头华为技术有限公司（Huawei Technologies Co.）正在寻找一种方法来解决特朗普政府施加的严格限制。</span> </p> \n<p> <img src=\"/upload/销售部/20200313161536_203.jpeg\" alt=\"\"><br> <span class=\"bjh-p\"><span class=\"bjh-br\"></span></span> </p> \n<p> <span class=\"bjh-p\"><br> </span> </p> \n<p> <span class=\"bjh-p\">美国商务部以国家安全为由，在很大程度上禁止美国公司向华为出售其制造与新引入的高速无线网络集成在一起的设备所需的计算机芯片。作为回应，中国最大的科技公司提高了自己制造齿轮的能力，这就是所谓的基站。根据华为负责合作伙伴关系的美国高管蒂姆·丹克斯（Tim Danks）的说法，这表明自力更生正在发挥作用，华为在第四季度售出了超过50,000台不使用美国技术的下一代基站。丹克斯说，截至二月份，这仅占华为售出基站总数的8％，但该公司正迅速扩大其秘密的海思芯片部门，以生产更多这些美国无组件设备。</span> </p> \n<p> <span class=\"bjh-p\"><img src=\"/upload/销售部/20200313161559_110.png\" alt=\"\"><br> </span> </p> \n<p> <span class=\"bjh-p\"> </span></p>\n<p> <span class=\"bjh-p\">他说：“我们仍然打算重新使用美国技术。” Danks补充说，华为无法与美国供应商联系的时间越长，就越不可能恢复使用美国供应商。<span class=\"bjh-br\"></span>基站是典型的手提箱大小的机器，用于帮助将无线电话连接到承载互联网流量的固网，这是下一代或第五代移动网络的重要组成部分。华为的基站在电信提供商中很受欢迎，被广泛认为是价格最可靠的基站。美国官员指责华为窃取了宝贵的知识产权并违反了对伊朗的贸易禁运。特朗普政府去年将该公司列入黑名单，称华为有可能使北京通过使用其设备的电信网络访问敏感数据。华为否认了这一指控。批评人士还表示，美国政府实施了制裁，以削弱中国在5G技术关键方面的领导地位。</span> </p> \n<p> <span class=\"bjh-p\"><img src=\"/upload/销售部/20200313161642_117.jpeg\" alt=\"\"><br> </span> </p> \n<p> <span class=\"bjh-p\"> </span></p>\n<p> <span class=\"bjh-p\">截至2月初，华为已向竞相将网络升级到新标准的移动电话公司运送了约60万个5G基站，旨在将速度更快的数据传输到广泛的无线连接设备-而不仅仅是手机。这些基站大多数是使用禁令前购买的库存芯片制造的。<span class=\"bjh-br\"></span>尽管华为没有透露其供应商，但基站通常依赖一种称为现场可编程门阵列的处理器，该处理器由英特尔公司制造。英特尔公司是一家总部位于加利福尼亚州圣克拉拉的芯片制造商，与赛灵思公司合作。，在邻近的圣何塞。这些芯片提供了灵活性，可以在添加新标准和功能时更轻松地更新机器。华为的芯片是专用的，这意味着它们是为特定功能量身定制的，更换它们需要更多的时间和金钱。在新技术（例如5G）处于起步阶段并且仍可能发生重大变化的时候，这是一个不利条件。</span> </p> \n<p> <span class=\"bjh-p\"><img src=\"/upload/销售部/20200313161718_461.jpeg\" alt=\"\"><br> </span> </p> \n<p> <span class=\"bjh-p\"> </span></p>\n<p> <span class=\"bjh-p\">美国最初遏制了向华为运送的所有美国供应品，华为每年在美国产品上的花费超过100亿美元，但后来开始出现一些例外。赛灵思（Xilinx）以及其他芯片制造商美光科技公司（Micron Technology Inc.）和博通（Broadcom Inc.）都报告说，由于减少或取消了对华为的销售，收益下降了。<span class=\"bjh-br\"></span></span> </p> \n<p> <span class=\"bjh-p\">美国试图说服欧洲和其他盟国禁止使用华为设备的努力未果，亚洲和欧洲的芯片制造商仍在继续提供设备。</span> </p> \n<img src=\"/upload/销售部/20200313161758_354.jpeg\" alt=\"\">\n<br>  \n<p></p> \n<br>  \n<p></p> \n<br>  \n<p></p>', '2020-03-13', '/upload/销售部/20200313161536_203.jpeg', '0', '0', '3');
INSERT INTO contents VALUES ('51', '4', '销售部', '华为官宣：已获91个5G商用合同，再次领跑全球！', '<h2> <span class=\"bjh-p\"><span class=\"bjh-strong\">华为已获91个5G商用合同，47个来自欧洲</span></span> </h2> \n<p> <span class=\"bjh-p\">据中国华为公司20日公布的数据，该公司在全球范围内已获得91个5G商用合同，其中超过一半来自欧洲地区，再次领跑全球。</span> </p> \n<p> <span class=\"bjh-p\"><img src=\"/upload/销售部/20200313161911_412.jpeg\" alt=\"\"><br> </span> </p> \n<p> <span class=\"bjh-p\"><span class=\"bjh-p\">华为当天在伦敦举行发布会，公布了与5G相关的新产品和解决方案，并启动“5G合作伙伴创新计划”。华为常务董事兼运营商业务总裁丁耘说，截至目前，华为已获得91个5G商用合同，其中47个来自欧洲地区，5G Massive MIMO AAU模块发货超过60万个，增速超过500%。这一数字远超诺基亚的67和爱立信的81，位居全球第一。</span></span> </p> \n<h2> <span class=\"bjh-p\"><span class=\"bjh-p\"> <p> <span class=\"bjh-p\"><span class=\"bjh-strong\">华为将投资2000万美元，支持5G创新应用</span><span class=\"bjh-br\"></span></span> </p> </span></span> </h2> \n<p> <span class=\"bjh-p\"><span class=\"bjh-p\"> </span></span></p>\n<p> <span class=\"bjh-p\">丁耘宣布华为启动“5G合作伙伴创新计划”，未来5年内将投资2000万美元（约合人民币1亿4千万元），支持5G创新应用，繁荣5G生态，加速5G商业成功。</span> </p>  \n<p></p> \n<h2> <span class=\"bjh-p\"><span class=\"bjh-p\"> <p> <span class=\"bjh-p\"><span class=\"bjh-strong\">华为提供领先技术的5G解决方案</span></span> </p> </span></span> </h2> \n<p> <span class=\"bjh-p\"><span class=\"bjh-p\"> </span></span></p>\n<p> <span class=\"bjh-p\">华为在发布会上还发布了华为的5G解决方案。作为全球领先的5G供应商，华为致力于开发最佳的5G端到端解决方案，提供业界最高性能的全场景5G基站，业界集成度最高的刀片式AAU，支持所有Sub 6G频段， 可以支持2G、3G、4G和5G四世同堂，不仅解决了天面安装空间受限的问题，且与业界传统方案相比，TCO节省30%以上；同时，华为也是业界第一个为垂直应用领域提供5G工业模组的供应商。</span> </p> \n<p> <span class=\"bjh-p\">华为在发布会现场还展示了近期发布的内置5G模组的直播背包，这一设备能够使直播变得更简单。</span> </p>  \n<p></p> \n<h2> <span class=\"bjh-p\"><span class=\"bjh-p\"> <p> <span class=\"bjh-p\"><span class=\"bjh-strong\">华为5G成绩来之不易</span></span> </p> </span></span> </h2> \n<p> <span class=\"bjh-p\"><span class=\"bjh-p\"> </span></span></p>\n<p> <span class=\"bjh-p\">在美国2019年5月17日宣布将华为列入实体清单后，美国几乎尽全国之力来打压华为：不但禁止美国技术、元器件、系统、原材料、产品供货华为，华为产品销售到美国，而且美国高官还在全球范围内四处采用抹黑、污蔑、威胁的方法来打击华为在海外的销售，增加华为销售的难度。</span> </p> \n<p> <span class=\"bjh-p\">例如前段时间在德国举行的慕尼黑安全会议上，美国众议院议长佩洛西警告欧洲国家，声称如果它们让华为参与推出5G技术，将是“选择独裁而非民主”。美国国务卿蓬佩奥、国防部长埃斯珀威胁欧洲盟友如果使用华为的5G设备，可能会使合作伙伴的重大系统容易遭到破坏、操纵和刺探。这也可能危及通讯及情报互通能力，并可能进而危及与美国的结盟关系。当然这种胡乱攻击的言论受到了傅莹、王毅等人的有力回击。</span> </p> \n<p> <span class=\"bjh-p\"><img src=\"/upload/销售部/20200313162047_86.jpeg\" alt=\"\"><br> </span> </p> \n<span class=\"bjh-p\"><span class=\"bjh-p\"></span></span> \n<p></p> \n<h2> <span class=\"bjh-p\"> <p> <span class=\"bjh-p\"><span class=\"bjh-strong\">华为5G优势</span><span class=\"bjh-br\"></span></span> </p> </span> </h2> \n<p> <span class=\"bjh-p\"><span class=\"bjh-p\"> </span></span></p>\n<p> <span class=\"bjh-p\"> </span></p>\n<p> <span class=\"bjh-p\">相比较诺基亚和爱立信等其他5G设备厂商，华为在5G方面有着明显优势，不但华为的5G技术领先于其他厂商（华为创始人任正非说华为5G技术领先其他公司2年以上），而且除了5G基站外，华为还有自己的5G终端、5G系统、5G芯片、专属的端对端5G解决方案等，拥有更为完整的5G技术产业链。</span> </p> \n<p> <span class=\"bjh-p\">现在由于美国对华为的极限施压，在关键的技术上断供华为，使得华为不得不打造无美供应链。现在华为现在生产的5G基站已经可以完全脱离美国的零部件产品。这样华为的5G合同就排除了因为外力原因不能执行的可能性以及防止美国CIA对选用华为设备的国家的偷窥。</span> </p> \n<br>  \n<p></p> \n<br>  \n<p></p>', '2020-03-13', '/upload/销售部/20200313161911_412.jpeg', '0', '0', '4');
INSERT INTO contents VALUES ('52', '4', '销售部', '华为高管减薪，任正非气到咆哮，那年海外市场却创下240亿新高', '<p> <span class=\"bjh-p\">2003年，华为到了生死存亡关头。<span class=\"bjh-br\"></span></span> </p> \n<p> <span class=\"bjh-p\">前有泡沫经济阴影，后和思科纠缠打官司，3G投资十几亿，却在国内打水漂。加之突如其来的非典，华为高管降薪，公司停招，任正非数次失控，在办公室大咆哮。</span> </p> \n<p> <span class=\"bjh-p\">那年却也是华为的突破之年。从非典开始，海外销售一下子井喷……不到两年的时间，华为的海外收入高达240多亿，超过国内营收！</span> </p> \n<p> <span class=\"bjh-p\">华为做对了什么？我们对话了亲历这场变革的华为前全球人力资源专家、百森咨询创始人冉涛。</span> </p> \n<h2> <span class=\"bjh-p\"><span class=\"bjh-strong\">“一不抱怨，二去调整，信心比黄金更重要。”</span></span> </h2> \n<div> \n <p> <span class=\"bjh-p\"><img src=\"/upload/销售部/20200313162523_887.jpeg\" alt=\"\"><br> </span> </p> \n <p> </p>\n <h3> <span class=\"bjh-p\"><span class=\"bjh-strong\">非典时期，任正非在办公室大咆哮</span></span> </h3> \n <p> <span class=\"bjh-p\">2003年，对华为来讲是多灾多难之年。</span> </p> \n <p> <span class=\"bjh-p\">非典的时候，华为很多领导还坚持一线，我也在重要疫区内蒙古工作，还四处出差。</span> </p> \n <p> <span class=\"bjh-p\">说实话，非典对华为的影响反而不大。因为互联网泡沫的时候，华为已经吃过大苦头了，做了一系列的动作，大量前期调整。</span> </p> \n <h3> <span class=\"bjh-p\"><span class=\"bjh-strong\">动作一：</span><span class=\"bjh-strong\">分流员工</span></span> </h3> \n <p> <span class=\"bjh-p\">当时华为有不少人做技术服务工作，各地的人员缺口，他们承包他们顶上。公司给他们活，就出去干去了。</span> </p> \n <p> <span class=\"bjh-p\">华为还鼓励员工出去自己创业，数量不小。那一年就这样先分离了一部分人。</span> </p> \n <h3> <span class=\"bjh-p\"><span class=\"bjh-strong\">动作二：</span><span class=\"bjh-strong\">动员员工</span></span> </h3> \n <p> <span class=\"bjh-p\">很多非销售，下沉到一线去要款。激活所有员工。连新进来的应届大学生，很多都派去要款。</span> </p> \n <h3> <span class=\"bjh-p\"><span class=\"bjh-strong\">动作三：</span><span class=\"bjh-strong\">停止招聘</span></span> </h3> \n <p> <span class=\"bjh-p\"><span class=\"bjh-strong\">当时华为停止了两年的新员工招聘，这相当少见。高层也自愿降薪。大家都勒紧裤腰带过日子了。</span></span> </p> \n <p> <span class=\"bjh-p\">2003年华为确实很苦，和思科打知识产权官司，还有一个更大的打击——3G被推迟。</span> </p> \n <p> <span class=\"bjh-p\">当时同行很多走小灵通路线，<span class=\"bjh-strong\">任正非没有，他在3G上投了十几亿的研发费用，结果政策没有开始。</span></span> </p> \n <p> <span class=\"bjh-p\"><span class=\"bjh-strong\">我们在工位上，都可以听到任正非在办公室大咆哮，被逼得没有办法了，必须发力海外市场。</span></span> </p> \n <p> <span class=\"bjh-p\">其实，早在1996年，华为陆陆续续在香港、孟加拉拿了一点儿合同，慢慢往外走了。</span> </p> \n <p> <span class=\"bjh-p\">从非典开始，海外销售一下子突破了……不到两年的时间，华为的营业收入海外是超过国内。</span> </p> \n <p> <span class=\"bjh-p\">2005年华为收入是480多亿人民币，海外占了240亿。</span> </p> \n <br> \n <span class=\"bjh-p\"></span> \n <p></p> \n</div>', '2020-03-13', '/upload/销售部/20200313162523_887.jpeg', '0', '0', '2');
INSERT INTO contents VALUES ('53', '3', '财务部', '华为发布2019上半年经营业绩，揭秘强大的华为财务部门！', '<p style=\"font-size:16px;color:#191919;font-family:&quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif;font-style:normal;font-weight:400;text-align:left;text-indent:0px;background-color:#FFFFFF;\"> <span style=\"font-size:16px;\">华为创始人任正非曾经表示，“华为不是上市公司，不需要漂亮的财务报表。</span><span style=\"font-size:16px;\">华为完全是由其员工所有，股东近9.7万人，且没有任何外部实体持有华为的任何股份。</span><span style=\"font-size:16px;\">如果不想让华为呆在某些市场，可以缩减规模。</span><span style=\"font-size:16px;\">只要能够存活下来，养活员工，总有未来等着我们。</span><span style=\"font-size:16px;\">”</span> </p> \n<p style=\"font-size:16px;color:#191919;font-family:&quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif;font-style:normal;font-weight:400;text-indent:0px;background-color:#FFFFFF;text-align:justify;\"> <span style=\"font-size:16px;\">对华为来说，2019年备受全球关注。任正非在上半年接受媒体采访时坦言，2019年对华为而言将会是面临挑战和困难的一年。 如今半年过去，华为交出了怎样的一份答卷呢？</span> </p> \n<p style=\"font-size:16px;color:#191919;font-family:&quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif;font-style:normal;font-weight:400;text-indent:0px;background-color:#FFFFFF;text-align:justify;\"> <span style=\"font-size:16px;\">7月30日下午3点，华为向全球发布2019年上半年经营业绩。</span> </p> \n<p style=\"font-size:16px;color:#191919;font-family:&quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif;font-style:normal;font-weight:400;text-indent:0px;background-color:#FFFFFF;text-align:justify;\"> <span style=\"font-size:16px;\">报告显示，<strong>华为上半年营收4013亿人民币，同比增长23.2%，净利润率8.7%；</strong><strong>其中消费者业务2208亿元，占比55%；</strong><strong>运营商业务1465亿元，占比36.5%；</strong><strong>企业业务316亿元，占比7.9%。</strong></span> </p> \n<p style=\"font-size:16px;color:#191919;font-family:&quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif;font-style:normal;font-weight:400;text-indent:0px;background-color:#FFFFFF;text-align:justify;\"> <span style=\"font-size:16px;\">华为上半年智能手机出货达到1.18亿部，同比增加24%。华为已获得50份商用5G合同，全球基站发货超过15万个；华为上半年平板电脑同比增长10%，PC增长3倍，可穿戴设备增长2倍，云服务生态用户超过5亿。</span> </p> \n<p style=\"font-size:16px;color:#191919;font-family:&quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif;font-style:normal;font-weight:400;text-indent:0px;background-color:#FFFFFF;text-align:justify;\"> <span style=\"font-size:16px;\">华为董事长梁华表示，我们对未来充满信心，会持续投资未来，计划2019年<strong>研发投入1200亿人民币</strong>。</span> </p> \n<p> <br> </p> \n<p> </p>\n<p style=\"font-size:16px;color:#191919;font-family:&quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif;font-style:normal;font-weight:400;text-align:left;text-indent:0px;background-color:#FFFFFF;\"> <span style=\"font-size:16px;\"><strong><span style=\"font-size:16px;\">华为财务都是一群什么人?</span></strong></span> </p> \n<p style=\"font-size:16px;color:#191919;font-family:&quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif;font-style:normal;font-weight:400;text-indent:0px;background-color:#FFFFFF;text-align:justify;\"> <span style=\"font-size:16px;\">据华为CFO孟晚舟在华为内部致辞里透露的情况，我们大概能够看出华为财务团队工作、人员配置的一些细节:</span> </p> \n<p style=\"font-size:16px;color:#191919;font-family:&quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif;font-style:normal;font-weight:400;text-indent:0px;background-color:#FFFFFF;text-align:justify;\"> <span style=\"font-size:16px;\">1、华为财经团队来自牛津、剑桥、哈佛、耶鲁等著名大学的优秀学生有数百名；</span> </p> \n<p style=\"font-size:16px;color:#191919;font-family:&quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif;font-style:normal;font-weight:400;text-indent:0px;background-color:#FFFFFF;text-align:justify;\"> <span style=\"font-size:16px;\">2、光合同全球就有1500名项目财务跟进；</span> </p> \n<p style=\"font-size:16px;color:#191919;font-family:&quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif;font-style:normal;font-weight:400;text-indent:0px;background-color:#FFFFFF;text-align:justify;\"> <span style=\"font-size:16px;\">3、年平均约120万单的员工费用报销，员工在自助报销的同时，机器根据既定规则直接生成会计凭证；</span> </p> \n<p style=\"font-size:16px;color:#191919;font-family:&quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif;font-style:normal;font-weight:400;text-indent:0px;background-color:#FFFFFF;text-align:justify;\"> <span style=\"font-size:16px;\">4、98个国家和746个账户实现互联互通，支付指令可以在2分钟内传递至全球任一开户银行，付款准确率水平高于银行100倍以上；</span> </p> \n<p style=\"font-size:16px;color:#191919;font-family:&quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif;font-style:normal;font-weight:400;text-indent:0px;background-color:#FFFFFF;text-align:justify;\"> <span style=\"font-size:16px;\">5、在全球实施的RFID物联资产管理方案，目前已经覆盖52个国家、2382个场地、14万件固定资产。RFID标签贴在需要管理的固定资产上，每5分钟自动上报一次位置信息，每天更新一次固定资产的使用负荷(或者闲置)情况；</span> </p> \n<p style=\"font-size:16px;color:#191919;font-family:&quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif;font-style:normal;font-weight:400;text-indent:0px;background-color:#FFFFFF;text-align:justify;\"> <span style=\"font-size:16px;\">6、经营性现金流已实现12个月定长的滚动预测。从历史数据的拟合度看，在170个国家实现销售，收入规模约800亿美元，年度现金结算量约4000亿美元，最小偏差仅800万美元；</span> </p> \n<p style=\"font-size:16px;color:#191919;font-family:&quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif;font-style:normal;font-weight:400;text-indent:0px;background-color:#FFFFFF;text-align:justify;\"> <span style=\"font-size:16px;\"><strong>从中，我们可以得出几个结论:</strong><strong></strong></span> </p> \n<p style=\"font-size:16px;color:#191919;font-family:&quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif;font-style:normal;font-weight:400;text-indent:0px;background-color:#FFFFFF;text-align:justify;\"> <span style=\"font-size:16px;\"><strong>1、团队成员学历较高，拥有比较高的素质;</strong></span> </p> \n<p style=\"font-size:16px;color:#191919;font-family:&quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif;font-style:normal;font-weight:400;text-indent:0px;background-color:#FFFFFF;text-align:justify;\"> <span style=\"font-size:16px;\"><strong>2.、财务操作体系比较完善，并且自动化程度较高;</strong></span> </p> \n<p style=\"font-size:16px;color:#191919;font-family:&quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif;font-style:normal;font-weight:400;text-indent:0px;background-color:#FFFFFF;text-align:justify;\"> <span style=\"font-size:16px;\"><strong>3、每个财务成员的工作压力较大，工作强度较大;</strong></span> </p> \n<p style=\"font-size:16px;color:#191919;font-family:&quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif;font-style:normal;font-weight:400;text-indent:0px;background-color:#FFFFFF;text-align:justify;\"> <span style=\"font-size:16px;\"><strong>4、拥有细致的核查体系，误差率小。</strong></span> </p> \n<p></p> \n<p> </p>\n<p style=\"font-size:16px;color:#191919;font-family:&quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif;font-style:normal;font-weight:400;text-align:left;text-indent:0px;background-color:#FFFFFF;\"> <span style=\"font-size:16px;\"><strong><span style=\"font-size:16px;\">华为对财务人员的要求是什么？</span></strong><strong><span style=\"font-size:16px;\"></span></strong></span> </p> \n<p style=\"font-size:16px;color:#191919;font-family:&quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif;font-style:normal;font-weight:400;text-indent:0px;background-color:#FFFFFF;text-align:justify;\"> <span style=\"font-size:16px;\">华为的管理一直被外界推崇，当然这离不开华为内部每一位员工的努力。任正非对华为的财经团队非常重视，曾不止一次提到过对财务人员的四点要求。</span> </p> \n<p style=\"font-size:16px;color:#191919;font-family:&quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif;font-style:normal;font-weight:400;text-align:left;text-indent:0px;background-color:#FFFFFF;\"> <span style=\"font-size:16px;\">一</span> </p> \n<p style=\"font-size:16px;color:#191919;font-family:&quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif;font-style:normal;font-weight:400;text-align:left;text-indent:0px;background-color:#FFFFFF;\"> <span style=\"font-size:16px;\"><strong>财务如果不懂业务，只能提供低价值的会计服务</strong></span> </p> \n<p style=\"font-size:16px;color:#191919;font-family:&quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif;font-style:normal;font-weight:400;text-indent:0px;background-color:#FFFFFF;text-align:justify;\"> <span style=\"font-size:16px;\">目前财会领域低层次人才过剩，高端人才缺口巨大，在未来，提供低价值的会计服务很有可能被人工智能所包揽，会计人面临失业的风险。但是人工智能的出现可以在一定程度上打破高低端的阶层固化状态，使底层会计具有向上流动的主观意识。</span> </p> \n<p style=\"font-size:16px;color:#191919;font-family:&quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif;font-style:normal;font-weight:400;text-align:left;text-indent:0px;background-color:#FFFFFF;\"> <span style=\"font-size:16px;\">二</span> </p> \n<p style=\"font-size:16px;color:#191919;font-family:&quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif;font-style:normal;font-weight:400;text-align:left;text-indent:0px;background-color:#FFFFFF;\"> <span style=\"font-size:16px;\"><strong>财务必须要有渴望进步、渴望成长的自我动力</strong></span> </p> \n<p style=\"font-size:16px;color:#191919;font-family:&quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif;font-style:normal;font-weight:400;text-indent:0px;background-color:#FFFFFF;text-align:justify;\"> <span style=\"font-size:16px;\">财务工作的会计准则、会计制度、税法税率无时无刻都在变化当中，每一次变化都要会计人主动学习，接受变化，不断适应。对于学习专业知识会计人要保持终身学习态度，这不仅是为了开阔视野，更是为了能融入业务。</span> </p> \n<p style=\"font-size:16px;color:#191919;font-family:&quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif;font-style:normal;font-weight:400;text-align:left;text-indent:0px;background-color:#FFFFFF;\"> <span style=\"font-size:16px;\">三</span> </p> \n<p style=\"font-size:16px;color:#191919;font-family:&quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif;font-style:normal;font-weight:400;text-align:left;text-indent:0px;background-color:#FFFFFF;\"> <span style=\"font-size:16px;\"><strong>没有项目经营管理经验的财务人员，就不可能成长为CFO</strong></span> </p> \n<p style=\"font-size:16px;color:#191919;font-family:&quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif;font-style:normal;font-weight:400;text-indent:0px;background-color:#FFFFFF;text-align:justify;\"> <span style=\"font-size:16px;\">越大的公司对财务的分工越为细致，每个财务岗位接触的工作几乎都是片段式的。片段式的工作很容易让会计人们保持财务思维，习惯用财务语言去解释业务逻辑，开拓财务人员的全局视野，培养对数字的敏感和敏锐。</span> </p> \n<p style=\"font-size:16px;color:#191919;font-family:&quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif;font-style:normal;font-weight:400;text-align:left;text-indent:0px;background-color:#FFFFFF;\"> <span style=\"font-size:16px;\">四</span> </p> \n<p style=\"font-size:16px;color:#191919;font-family:&quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif;font-style:normal;font-weight:400;text-align:left;text-indent:0px;background-color:#FFFFFF;\"> <span style=\"font-size:16px;\"><strong>称职的CFO应随时可以接任CEO</strong></span> </p> \n<p style=\"font-size:16px;color:#191919;font-family:&quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif;font-style:normal;font-weight:400;text-indent:0px;background-color:#FFFFFF;text-align:justify;\"> <span style=\"font-size:16px;\">CFO是CEO最有力的接班人选，CFO站在业务的最后端，能够俯瞰公司管理的全貌，这就要求财务人员应融入业务，要积极参与项目管理、经营分析、预算决策，不要过分局限于专业技能中。</span> </p> \n<p style=\"font-size:16px;color:#191919;font-family:&quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif;font-style:normal;font-weight:400;text-indent:0px;background-color:#FFFFFF;text-align:justify;\"> <span style=\"font-size:16px;\">会计工作确实有些枯燥，在长时间的重复性工作之后，会陷入一个工作的舒适区，虽然工作已经得心应手，但是会感到莫名的恐慌，担心自己没有足够的专业积累，导致缺乏成长空间。</span> </p> \n<p style=\"font-size:16px;color:#191919;font-family:&quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif;font-style:normal;font-weight:400;text-indent:0px;background-color:#FFFFFF;text-align:justify;\"> <span style=\"font-size:16px;\">所以会计人一定要学会提升自己的价值，主动思考，在现有岗位上做出贡献，体现出自己的价值。</span> </p> \n<p></p>', '2020-03-14', null, '1', '0', '12');
INSERT INTO contents VALUES ('60', '1', '研发部', '考验华为P40系列国内价格诚意的时候到了', '<p style=\"text-indent:28px;font-size:16px;text-align:justify;color:#2B2B2B;font-family:&quot;Microsoft Yahei&quot;;font-style:normal;font-weight:400;background-color:#FFFFFF;\"> 华为P40 Pro </p> \n<p style=\"text-indent:28px;font-size:16px;text-align:justify;color:#2B2B2B;font-family:&quot;Microsoft Yahei&quot;;font-style:normal;font-weight:400;background-color:#FFFFFF;\"> 日前，华为线上发布了其春季旗舰产品——P40系列，带来P40、P40 Pro以及P 40Pro+三款产品，在售价方面，华为P40 8GB+128GB欧洲售价799欧元（约人民币6193元）；华为P40 Pro 8GB+256GB欧洲售价999欧元（约人民币7743元），华为P40 Pro+ 8GB+512GB欧洲售价1399欧元（约人民币10844元），国内市场售价目前暂未可知。 </p> \n<p style=\"text-indent:28px;font-size:16px;text-align:justify;color:#2B2B2B;font-family:&quot;Microsoft Yahei&quot;;font-style:normal;font-weight:400;background-color:#FFFFFF;\"> 其实欧洲市场的售价能给国内市场售价带来的参考性并不大。按照惯例，华为在国内市场的售价必然是要比欧洲市场低很多的。今年，华为或更需如此。邻章认为：考验华为P40系列国内价格诚意的时候已经到了。 </p> \n<p style=\"text-indent:28px;font-size:16px;text-align:justify;color:#2B2B2B;font-family:&quot;Microsoft Yahei&quot;;font-style:normal;font-weight:400;background-color:#FFFFFF;\"> <strong>为什么这么说？</strong> </p> \n<p style=\"text-indent:28px;font-size:16px;text-align:justify;color:#2B2B2B;font-family:&quot;Microsoft Yahei&quot;;font-style:normal;font-weight:400;background-color:#FFFFFF;\"> 作为华为主打影像和时尚的P系列，今年的华为P40系列不例外的是带来了进化的影像硬件和产品设计，其给料非常足的影像系统和不错的产品整体质感，个人认为基本上是不负影像与时尚之名，华为P40 Pro +独占的纳米微晶陶瓷后盖更是进一步的提升了产品的背部质感，但稍显遗憾的是其要六月份才能上市，所以说现在消费者实际能购买的只有P40和P40 Pro这两款产品。 </p> \n<p style=\"text-indent:28px;font-size:16px;text-align:justify;color:#2B2B2B;font-family:&quot;Microsoft Yahei&quot;;font-style:normal;font-weight:400;background-color:#FFFFFF;\"> 而华为P40系列，特别是P40 Pro最为核心的买点，当然还是在影像系统上，而这一次华为P40 Pro的影像系统在硬件配置上，也的确是非常强，1/1.28 英寸的RYYB的5000万像素主摄、1/1.54英寸的4000万像素的超广角、5倍光学变焦（P40为3被光学变焦、Pro +为十倍光学变焦）、50倍数码变焦等都让P40 Pro拥有了极为良好的影像硬件素质，成为了其最为诱人的买点。 </p> \n<p> <br> </p> \n<p> <img src=\"/upload/研发部/20200328133007_310.jpeg\" alt=\"\" title=\"\" width=\"600\" height=\"424\" align=\"\" style=\"width:600px;\"> </p> \n<p> </p>\n<p style=\"text-indent:28px;font-size:16px;text-align:justify;color:#2B2B2B;font-family:&quot;Microsoft Yahei&quot;;font-style:normal;font-weight:400;background-color:#FFFFFF;\"> 华为P40系列影像配置 </p> \n<p style=\"text-indent:28px;font-size:16px;text-align:justify;color:#2B2B2B;font-family:&quot;Microsoft Yahei&quot;;font-style:normal;font-weight:400;background-color:#FFFFFF;\"> <strong>但P40和P40 Pro这两款产品，除开拍照这个强买点外，其余的配置坦率而言却并不十分出色，有些放置在今年智能手机市场，甚至是有些没有跟上形式，属于“方向错了”的做法。</strong> </p> \n<p style=\"text-indent:28px;font-size:16px;text-align:justify;color:#2B2B2B;font-family:&quot;Microsoft Yahei&quot;;font-style:normal;font-weight:400;background-color:#FFFFFF;\"> 诸如在当下旗舰智能手机均采用定制级屏幕的现实下，华为P40和P40 Pro的屏幕相对而言依旧是其短板，大概率敌不过竞争对手的产品屏幕表现，但屏幕却是用户与智能手机交互最为核心主要的窗口，旗舰手机更应有旗舰级的屏幕表现，试想一张好照片如果不能在一块极佳的屏幕上显示，是何种的遗憾？ </p> \n<p style=\"text-indent:28px;font-size:16px;text-align:justify;color:#2B2B2B;font-family:&quot;Microsoft Yahei&quot;;font-style:normal;font-weight:400;background-color:#FFFFFF;\"> 又如在正面屏幕设计上，华为带来了所谓的四曲满溢屏，从发布会PTT所显示的上下左右边框几无的渲染图来看，的确非常具备设计感，但实际的真机图坦率来讲与PPT渲染图还是有较大差距。 </p> \n<p style=\"text-indent:28px;font-size:16px;text-align:justify;color:#2B2B2B;font-family:&quot;Microsoft Yahei&quot;;font-style:normal;font-weight:400;background-color:#FFFFFF;\"> 不仅如此，华为在P40系列上使用的双打孔设计相对于今年业界主流的单打孔方案而言，在产品的美观度上是有所折扣的。 </p> \n<p style=\"text-indent:28px;font-size:16px;text-align:justify;color:#2B2B2B;font-family:&quot;Microsoft Yahei&quot;;font-style:normal;font-weight:400;background-color:#FFFFFF;\"> <img src=\"/upload/研发部/20200328133100_511.jpeg\" alt=\"\" title=\"\" width=\"600\" height=\"450\" align=\"\" style=\"width:600px;\"> </p> \n<p style=\"text-indent:28px;font-size:16px;text-align:justify;color:#2B2B2B;font-family:&quot;Microsoft Yahei&quot;;font-style:normal;font-weight:400;background-color:#FFFFFF;\"> </p>\n<p style=\"text-indent:28px;font-size:16px;text-align:justify;color:#2B2B2B;font-family:&quot;Microsoft Yahei&quot;;font-style:normal;font-weight:400;background-color:#FFFFFF;\"> 发布会PPT渲染图（左）VS真机图（右） </p> \n<p style=\"text-indent:28px;font-size:16px;text-align:justify;color:#2B2B2B;font-family:&quot;Microsoft Yahei&quot;;font-style:normal;font-weight:400;background-color:#FFFFFF;\"> 对于华为P40系列的双打孔方案，业界一些人此前宣称是华为在此实现了支付级的人脸识别功能，所以需要更大面积的屏幕打孔。若真是如此，让设计服务于功能倒也未尝不可，诸如iPhone当下的刘海就是设计服务于功能的典型一例。 </p> \n<p style=\"text-indent:28px;font-size:16px;text-align:justify;color:#2B2B2B;font-family:&quot;Microsoft Yahei&quot;;font-style:normal;font-weight:400;background-color:#FFFFFF;\"> 但从结果来看，华为P40系列的双挖孔方案并没有实现支付级的人脸识别功能。所以个人认为此次华为P40的双挖孔方案是有些得不偿失的，其带来了更大的视觉干扰，对产品整体的设计美感而言是减分项。 </p> \n<p style=\"text-indent:28px;font-size:16px;text-align:justify;color:#2B2B2B;font-family:&quot;Microsoft Yahei&quot;;font-style:normal;font-weight:400;background-color:#FFFFFF;\"> 再如在华为一直引以为傲的电池和充电速度上，今年的P40从其电池容量来看，其续航可能是有些让人担心的。从数据来看，P40电池容量为3800毫安时、P40 Pro电池容量为4200毫安时，虽然数据不能代表全部，续航还要考量整体功耗优化能力，而这是建立在电池容量差距较小的现实上的。 </p> \n<p style=\"text-indent:28px;font-size:16px;text-align:justify;color:#2B2B2B;font-family:&quot;Microsoft Yahei&quot;;font-style:normal;font-weight:400;background-color:#FFFFFF;\"> 但若是电池容量差距较为明显那恐怕就不是优化所能够追回来的了，更何况P40 Pro还用上了90Hz刷新率和5G这两个耗电大户，这或使得华为P40系列原本就较小的电池容量在续航上面临更多挑战，当然实际续航究竟如何，还有待具体的测试。 </p> \n<p style=\"text-indent:28px;font-size:16px;text-align:justify;color:#2B2B2B;font-family:&quot;Microsoft Yahei&quot;;font-style:normal;font-weight:400;background-color:#FFFFFF;\"> 当然，好消息是华为P40 Pro的充电速率还是不错的，虽然其落后于一些竞争对手，但40W有线快充和27W无线快充，对于电量快速回血还是很有帮助的。 </p> \n<p></p> \n<p></p>', '2020-03-28', '/upload/研发部/20200328133007_310.jpeg', '2', '2', '9');
INSERT INTO contents VALUES ('61', '2', '生产部', '曾获华为哈勃投资，杰华特3亿元微电子研发生产基地项目开工', '<p> <img src=\"/upload/生产部/20200328134214_166.jpeg\" alt=\"\"> </p> \n<p> <br> </p> \n<p> </p>\n<p style=\"font-size:16px;color:#333333;text-align:justify;font-family:arial;font-style:normal;font-weight:400;text-indent:0px;background-color:#FFFFFF;\"> <span class=\"bjh-p\">集中开工项目共有13个，总投资71亿元、2020年计划投资38亿元，其中包括杰华特高端电源管理芯片全球生产制造基地项目。</span> </p> \n<p style=\"font-size:16px;color:#333333;text-align:justify;font-family:arial;font-style:normal;font-weight:400;text-indent:0px;background-color:#FFFFFF;\"> <span class=\"bjh-p\">据悉，杰华特微电子（杭州）有限公司将在杭州西湖区打造集高端电源管理芯片研发、生产、销售及售后于一体的微电子研发生产基地，项目总投资3亿元。</span> </p> \n<p style=\"font-size:16px;color:#333333;text-align:justify;font-family:arial;font-style:normal;font-weight:400;text-indent:0px;background-color:#FFFFFF;\"> <span class=\"bjh-p\">杰华特成立于2013年3月，总部位于杭州，目前在美国、韩国，中国张家港、深圳、厦门等地设有了分公司，拥有电池管理，LED照明，DC/DC转换器等产品。</span> </p> \n<p style=\"font-size:16px;color:#333333;text-align:justify;font-family:arial;font-style:normal;font-weight:400;text-indent:0px;background-color:#FFFFFF;\"> <span class=\"bjh-p\">2018年8月，该企业获得了华为哈勃科技的投资。在哈勃投资前，杰华特已经完成多轮融资，投资方包括华睿投资、鑫元基金、中电海康、中银浙商产业基金、同创伟业、聚源资本。</span> </p> \n<p style=\"font-size:16px;color:#333333;text-align:justify;font-family:arial;font-style:normal;font-weight:400;text-indent:0px;background-color:#FFFFFF;\"> <span class=\"bjh-p\">此外，也有消息显示，杰华特是华为供应商。</span> </p> \n<p style=\"font-size:16px;color:#333333;text-align:justify;font-family:arial;font-style:normal;font-weight:400;text-indent:0px;background-color:#FFFFFF;\"> <span class=\"bjh-p\">西行联合科技项目以高端装备制造(智能制造装备)为主导产业，专注于工业机器人的研发、制造、销售，致力于打造系统集成、本体制造、软件开发三位一体的工业机器人生态系统和整体自动化解决方案。项目占地面积40.05亩，总建筑面积约12.05万平方米，其中地上面积约7.99万平方米，地下面积约4.06万平方米，该项目总投资金额5.34亿元。</span> </p> \n<p></p>', '2020-03-28', '/upload/生产部/20200328134214_166.jpeg', '0', '0', '1');
INSERT INTO contents VALUES ('62', '2', '生产部', '华为：已有11家整机厂基于鲲鹏主板推出服务器及PC', '<p style=\"font-size:16px;color:#333333;text-align:justify;font-family:arial;font-style:normal;font-weight:400;text-indent:0px;background-color:#FFFFFF;\"> <span class=\"bjh-p\">3月27日上午，华为在线上举办了举行2020年开发者大会。会上，华为公布了鲲鹏+昇腾生态的最新进展。</span> </p> \n<p style=\"font-size:16px;color:#333333;text-align:justify;font-family:arial;font-style:normal;font-weight:400;text-indent:0px;background-color:#FFFFFF;\"> <span class=\"bjh-p\">华为云与计算BG总裁侯金龙表示，华为在计算产业上的战略是硬件开放，软件开源，使能伙伴。</span> </p> \n<p style=\"font-size:16px;color:#333333;text-align:justify;font-family:arial;font-style:normal;font-weight:400;text-indent:0px;background-color:#FFFFFF;\"> <span class=\"bjh-p\">硬件开放方面，华为聚焦做好处理器、板卡和主板等，使能合作伙伴优先发展自有品牌的计算产品整机。目前全球已经有11家整机厂商基于鲲鹏主板推出自有品牌的服务器及PC产品。</span> </p> \n<p style=\"font-size:16px;color:#333333;text-align:justify;font-family:arial;font-style:normal;font-weight:400;text-indent:0px;background-color:#FFFFFF;\"> <span class=\"bjh-p\">软件开源方面，2019年12月31日，openEuler社区正式上线。今天，openEuler 20.03 LTS版本也正式上线，麒麟软件、普华基础软件、统信软件、中科院软件所宣布发布基于openEuler的商用版本操作系统。</span> </p> \n<p style=\"font-size:16px;color:#333333;text-align:justify;font-family:arial;font-style:normal;font-weight:400;text-indent:0px;background-color:#FFFFFF;\"> <span class=\"bjh-p\">使能合作伙伴方面，截至目前，华为与产业伙伴联合成立了15个鲲鹏生态创新中心，与600多家的ISV伙伴推出了超过1500个通过鲲鹏技术认证的产品和解决方案，广泛应用于金融、政府与公共事业、运营商、能源等行业。</span> </p> \n<p> <br> </p> \n<p> <img src=\"/upload/生产部/20200328134352_438.jpeg\" alt=\"\"> </p> \n<p> </p>\n<p style=\"font-size:16px;color:#333333;text-align:justify;font-family:arial;font-style:normal;font-weight:400;text-indent:0px;background-color:#FFFFFF;\"> <span class=\"bjh-p\">3月13日，神州数码宣布，旗下首个鲲鹏系列产品生产基地――神州鲲泰厦门生产基地近日在福建厦门集美正式动工，一期工程预计4月中旬完工，5月正式投产。</span> </p> \n<p style=\"font-size:16px;color:#333333;text-align:justify;font-family:arial;font-style:normal;font-weight:400;text-indent:0px;background-color:#FFFFFF;\"> <span class=\"bjh-p\">据报道，该生产基地一期占地面积1万平方米，整体规划面积3万平方米，将主要生产搭载鲲鹏芯片的神州数码自有品牌神州鲲泰服务器及PC产品。</span> </p> \n<img src=\"/upload/生产部/20200328134418_145.jpeg\" alt=\"\"> \n<p></p> \n<p> </p>\n<p style=\"font-size:16px;color:#333333;text-align:justify;font-family:arial;font-style:normal;font-weight:400;text-indent:0px;background-color:#FFFFFF;\"> <span class=\"bjh-p\">去年1月份，华为正式发布了“业内性能最高”的ARM架构服务器处理器——鲲鹏920，7nm工艺制造，最多64个核心，主频2.6GHz，支持八通道DDR4内存，支持双10万兆网口、PCIe 4.0总线。</span> </p> \n<p style=\"font-size:16px;color:#333333;text-align:justify;font-family:arial;font-style:normal;font-weight:400;text-indent:0px;background-color:#FFFFFF;\"> <span class=\"bjh-p\">华为强调，鲲鹏处理器具有高性能、高带宽、高集成度、高效能四大特点。</span> </p> \n<p style=\"font-size:16px;color:#333333;text-align:justify;font-family:arial;font-style:normal;font-weight:400;text-indent:0px;background-color:#FFFFFF;\"> <span class=\"bjh-p\">此外，华为还推出了面向台式机的鲲鹏920S系列处理器，4-8核设计，频率2.6GHz。同时，华为还推出了自研的D920S10主板，内存支持DDR4-2400，最大64GB容量，支持6个SATA 3.0，2个M.2插槽，1个PCIe 3.0 x16，另外还有1个PCIe 3.0 x4、1个PCIe 3.0 x1插槽。</span> </p> \n<p></p>', '2020-03-28', '/upload/生产部/20200328134352_438.jpeg', '0', '0', '1');
INSERT INTO contents VALUES ('78', '1', '研发部', '毕业设计22', '<p> 毕业设计22 </p> \n<p> <img src=\"/upload/研发部/20200522153252_601.jpg\" alt=\"\" style=\"width:600px;\"> </p> \n<p> 毕业设计22 </p>', '2020-05-22', '/upload/研发部/20200522153252_601.jpg', '0', '0', '2');

-- ----------------------------
-- Table structure for `great`
-- ----------------------------
DROP TABLE IF EXISTS `great`;
CREATE TABLE `great` (
  `id` int(100) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cid` int(11) NOT NULL COMMENT '博客id',
  `uid` int(20) NOT NULL COMMENT '用户id',
  `type_id` int(20) NOT NULL COMMENT '博客、评论或回复的id',
  `type` int(20) NOT NULL DEFAULT '1' COMMENT '1博客点赞、2评论点赞、3回复点赞',
  `date` date NOT NULL COMMENT '时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0未读，1已读',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `cid` (`type_id`),
  KEY `cid_2` (`cid`),
  CONSTRAINT `great_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`id`),
  CONSTRAINT `great_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `contents` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of great
-- ----------------------------
INSERT INTO great VALUES ('28', '53', '4', '31', '2', '2020-03-28', '1');
INSERT INTO great VALUES ('29', '53', '4', '32', '2', '2020-03-28', '1');
INSERT INTO great VALUES ('34', '60', '15', '60', '1', '2020-05-22', '0');
INSERT INTO great VALUES ('35', '60', '15', '37', '2', '2020-05-22', '0');
INSERT INTO great VALUES ('36', '60', '15', '12', '3', '2020-05-22', '0');
INSERT INTO great VALUES ('37', '60', '15', '13', '3', '2020-05-22', '0');

-- ----------------------------
-- Table structure for `reply`
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cid` int(11) NOT NULL COMMENT '博客id',
  `comment_id` int(11) NOT NULL,
  `to_uid` int(11) NOT NULL COMMENT '被回复的用户id',
  `from_uid` int(11) NOT NULL COMMENT '回复的用户id',
  `to_uname` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '被回复用户姓名',
  `from_uname` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '回复用户姓名',
  `date` date NOT NULL COMMENT '时间',
  `content` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '回复内容',
  `star` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0未读、1已读',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `to_userid` (`to_uid`),
  KEY `from_userid` (`from_uid`),
  KEY `comment_id` (`comment_id`),
  CONSTRAINT `reply_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `contents` (`id`),
  CONSTRAINT `reply_ibfk_2` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of reply
-- ----------------------------
INSERT INTO reply VALUES ('12', '60', '37', '15', '15', '南华', '南华', '2020-05-22', '测试回复', '1', '1');
INSERT INTO reply VALUES ('13', '60', '37', '15', '15', '南华', '南华', '2020-05-22', '回复的回复', '1', '0');

-- ----------------------------
-- Table structure for `sys_notice`
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `content` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '内容',
  `date` date NOT NULL COMMENT '时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0未读、1已读',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO sys_notice VALUES ('1', '失败的回复', '2020-03-24', '0');
INSERT INTO sys_notice VALUES ('2', '第八次测试的回复', '2020-03-24', '0');
INSERT INTO sys_notice VALUES ('3', '第六次测试的回复', '2020-03-24', '0');
INSERT INTO sys_notice VALUES ('4', '第五次测试的回复', '2020-03-24', '0');
INSERT INTO sys_notice VALUES ('5', '第四次测试的回复', '2020-03-25', '0');
INSERT INTO sys_notice VALUES ('6', '试一下', '2020-03-27', '0');
INSERT INTO sys_notice VALUES ('7', '我这个网站老好了', '2020-03-28', '0');
INSERT INTO sys_notice VALUES ('8', '各位请文明发言', '2020-03-28', '0');
INSERT INTO sys_notice VALUES ('9', '过几天将添加一个部门', '2020-03-28', '0');
INSERT INTO sys_notice VALUES ('10', '这是一个测试', '2020-05-01', '0');
INSERT INTO sys_notice VALUES ('12', '南华船山毕业设计', '2020-05-22', '0');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(1000) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'login_user.jpg',
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `telephone` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO user VALUES ('1', '小明', 'login_user.jpg', '123@1', '123', '13245678999');
INSERT INTO user VALUES ('2', '小芳', 'login_user.jpg', '123@2', '123', '13245678999');
INSERT INTO user VALUES ('3', '小红', 'login_user.jpg', '123@3', '123', '13245678999');
INSERT INTO user VALUES ('4', '小王', 'login_user.jpg', '123@123', '123', '13245678999');
INSERT INTO user VALUES ('5', '王大锤', 'login_user.jpg', '123@1234', '123', '13245678999');
INSERT INTO user VALUES ('6', '大大怪', 'login_user.jpg', '111@111', '123', '13245678999');
INSERT INTO user VALUES ('7', '迪迦', 'login_user.jpg', 'asd@a', '123', '13245678999');
INSERT INTO user VALUES ('8', '李太白', 'login_user.jpg', '123@12344', '123', '13245678999');
INSERT INTO user VALUES ('11', '欧阳娜娜', 'login_user.jpg', '666@666', '123', '13245678999');
INSERT INTO user VALUES ('12', '晓晓', 'login_user.jpg', '789@789', '123', '15496325879');
INSERT INTO user VALUES ('15', '南华', 'login_user.jpg', '135@135', '123', '12365984562');
