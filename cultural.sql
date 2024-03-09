/*
 Navicat Premium Data Transfer

 Source Server         : 文化管理系统
 Source Server Type    : MySQL
 Source Server Version : 80012 (8.0.12)
 Source Host           : localhost:3306
 Source Schema         : cultural

 Target Server Type    : MySQL
 Target Server Version : 80012 (8.0.12)
 File Encoding         : 65001

 Date: 09/03/2024 19:53:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for about
-- ----------------------------
DROP TABLE IF EXISTS `about`;
CREATE TABLE `about`  (
  `id` int(1) NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of about
-- ----------------------------
INSERT INTO `about` VALUES (1, '##  md-editor-v3\n\nMarkdown 编辑器，vue3 版本，使用 jsx 模板 和 typescript 开发，支持切换主题、prettier 美化文本等。\n\n### ? 基本演示\n\n**加粗**，<u>下划线</u>，_斜体_，~~删除线~~，上标<sup>26</sup>，下标<sub>1</sub>，`inline code`，[超链接](https://imzbf.cc)\n\n> 引用：《I Have a Dream》\n\n1. So even though we face the difficulties of today and tomorrow, I still have a dream.\n2. It is a dream deeply rooted in the American dream.\n3. I have a dream that one day this nation will rise up.\n\n- [ ] 周五\n- [ ] 周六\n- [x] 周天\n\n![图片](https://imzbf.github.io/md-editor-rt/imgs/mark_emoji.gif)\n\n## ? 代码演示\n\n```vue\n<template>\n  <MdEditor v-model=\"text\" />\n</template>\n\n<script setup>\nimport { ref } from \'vue\';\nimport { MdEditor } from \'md-editor-v3\';\nimport \'md-editor-v3/lib/style.css\';\n\nconst text = ref(\'Hello Editor!\');\n</script>\n```\n\n## ? 文本演示\n\n依照普朗克长度这项单位，目前可观测的宇宙的直径估计值（直径约 930 亿光年，即 8.8 × 10<sup>26</sup> 米）即为 5.4 × 10<sup>61</sup>倍普朗克长度。而可观测宇宙体积则为 8.4 × 10<sup>184</sup>立方普朗克长度（普朗克体积）。\n\n## ? 表格演示\n\n| 昵称 | 来自      |\n| ---- | --------- |\n| 之间 | 中国-重庆 |\n\n## ? 公式\n\n行内：$x+y^{2x}$\n\n$$\n\\sqrt[3]{x}\n$$\n\n## ? 图表\n\n```mermaid\nflowchart TD\n  Start --> Stop\n```\n\n## ? 提示\n\n!!! note 支持的类型\n\nnote、abstract、info、tip、success、question、warning、failure、danger、bug、example、quote、hint、caution、error、attention\n\n!!!\n\n## ☘️ 占个坑@！\n');

-- ----------------------------
-- Table structure for albums
-- ----------------------------
DROP TABLE IF EXISTS `albums`;
CREATE TABLE `albums`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of albums
-- ----------------------------
INSERT INTO `albums` VALUES (1, '测试专辑', 'msglbo');
INSERT INTO `albums` VALUES (5, '123123', 'msglbo');
INSERT INTO `albums` VALUES (3, '新的专辑', 'msglbo');

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `des` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `num_read` int(11) NULL DEFAULT 0,
  `like` int(11) NULL DEFAULT 0,
  `is_campaigns` int(11) NULL DEFAULT 0,
  `album` int(11) NULL DEFAULT NULL,
  `is_check` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 155 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (118, '绵阳访古|四川少见的明代彩绘斗拱梁枋', '明代彩绘斗拱梁枋', 'http://127.0.0.1:9090/uploads/articleCovers/1697008218135.png', '绵阳访古|四川少见的明代彩绘斗拱梁枋\n建于明代正统元年(1436年)的鱼泉寺位于绵阳鱼泉山的山腰上，大雄宝殿的斗拱、梁枋等处保留了早期的彩绘，色泽如新，全国(重)点文物保护单位。个半山腰能使用的空间有限，鱼泉寺因地制宜，打破传统的纵向布局，采用两个并列四合院的横向布局方式，走进寺院，有一种在民居大院的随和感。\n学大雄宝殿前，建有一长方形石池，池南边正上方雕刻一石螭首，螭首内有水道与山泉相通，“寺有泉池不涸，有鱼游泳自如”，鱼泉寺因而得名。\n学大雄宝殿是单檐歇山顶抬梁式木构建筑，前檐额枋 上有墨书题记“大明正统元年(1436) 岁次...”， 也准确说明了鱼泉寺的建造时间。枋上有舒朗大气的斗拱6朵，有种北方木构的稳重大气感。\n了明末战乱，除这座大雄宝殿，其他都是清代增建,在这些建筑.上尚存多幅水墨壁画，题材包括佛教故事、戏曲，构图十分讲究。\n![](http://127.0.0.1:9090/uploads/articleImages/1697008265090.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697008265095.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697008265093.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697008265102.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697008265100.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697008265104.png)\n\n', 14, 'msglbo', '2023-10-11 15:11:26.455', NULL, 3, 0, 0, 3, 1);
INSERT INTO `article` VALUES (34, '绵阳会馆.羌》', '绵阳会馆《羌》', 'http://127.0.0.1:9090/uploads/articleCovers/1697010657028.png', '\n绵阳会馆.《羌》\n简介:\n以羌族史诗与神话故事为蓝本，结合羌绣传统纹样,展出一幕以“木姐珠”为主角、融合了“木姐珠与斗安珠”“羌族的诞生”“木姐珠与三座雪山”“羌戈大战”等神话故事组成的刺绣剧场。作品将--幅画面分成前后六个版块，使平面的刺绣走向空间，希望通过对羌族传统图腾、纹样的再创造，探索非遗与当代艺术的新可能。\n![](http://127.0.0.1:9090/uploads/articleImages/1697010687511.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697010687521.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697010687516.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697010687519.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697010687514.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697010687526.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697010687508.png)', 12, 'msglbo', '2022-02-16 14:23:10', '2003-09-28 06:45:11', 875, 749, 0, 3, 1);
INSERT INTO `article` VALUES (36, '艺术点亮生活-让生活充满诗意', '生活充满诗意', 'http://127.0.0.1:9090/uploads/articleCovers/1697003019589.png', '![](http://127.0.0.1:9090/uploads/articleImages/1697003040732.png)\n\n9月19日晚，绵阳市文化馆“艺荟时光”全民艺术普及系列公益讲座走进九州科技股份有限公司，开展了题为“朗诵让生活充满诗意”的讲座。80余位该企业班、组长及部门负责人到场聆听讲座。\n\n本次讲座邀请市文化馆“艺荟时光”公益培训班播音与主持授课教师、三级编导、绵阳市朗诵艺术家协会副秘书长吕青老师授课，吕青老师现为西南科技大学主持艺术团客座讲师，拥有20年语言艺术专业执教经验，曾任绵阳市历届经典诵读大赛节目指导及评审。\n\n绵阳市文化馆全面推进全民艺术普及，打造的“艺荟时光”公益培训班、“直播好课”“走进传统文化”等系列公益培训活动，以“群众点单+量身定制”新模式，免费向市民提供各类文艺培训及讲座，扫码关注绵阳市文化馆微信订阅号，获取更多信息。\n\n', 15, 'msglbo', '2019-04-15 18:12:01', '2019-10-12 03:41:04', 513, 105, 0, 1, 1);
INSERT INTO `article` VALUES (38, '千载回望古绵州|绵阳', '千载回望古绵州|绵阳', 'http://127.0.0.1:9090/uploads/articleCovers/1697013071285.png', '千载回望古绵州|绵阳\n感受古往今来的神秘色彩感受文化传续的风骨韵味\n东汉说唱俑、摇钱树泰\n东汉大铜马物、人体经络漆雕模型...这些只在历史书上见过的文物\n正穿梭了千年岁月，跃然眼前\n不同于国博、陕博那样的大热门门展馆的熙熙攘攘它们就这样静静的在这里，延续生命...\n![](http://127.0.0.1:9090/uploads/articleImages/1697013104272.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697013104269.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697013104265.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697013104268.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697013104275.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697013104263.png)\n', 16, 'banana', '2002-11-25 08:57:01', '2008-09-28 06:06:31', 624, 361, 0, 1, 1);
INSERT INTO `article` VALUES (39, '绵阳|越王楼-心危楼高百尺', '心危楼高百尺手可摘星辰', 'http://127.0.0.1:9090/uploads/articleCovers/1699860699188.png', '\n绵阳|越王楼\n心危楼高百尺手可摘星辰\n自古文人墨客喜爱咏诵名楼，为天下名楼赋诗作词,抒发内心情志。而国内最有名的黄鹤楼、岳阳楼、滕王阁都不是受诗人咏颂最多的名楼。咏颂最多的一座名楼是位于绵阳市龟山之巅的越王楼，其诗篇多达154篇，李白、杜甫、陆游都曾是楼上客，登上越王楼，为其赋诗篇。绵阳越王楼，便被称为天下诗文第一楼。\n![](http://127.0.0.1:9090/uploads/articleImages/1697015098489.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697015098495.png)\n绵阳越王楼 史记\n越王楼霸气壮观，历史文化浓厚，是唐太宗李世民第八子越王(李贞)任绵州刺史时所建，始建于唐高宗显庆年间(公元656年-661年)，距今已有1350余年，越王楼主楼共15层，高(今99米，唐29.4米),建筑集阁、楼、亭、殿、廊、塔于一体，一层至五层是阁，十层至十三层是楼，十五层是亭，顶端宝顶似塔，是当今仿古修复单体建筑之最。\n![](http://127.0.0.1:9090/uploads/articleImages/1697015098487.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697015098492.png)', 15, 'msglbo', '2004-02-16 21:53:58', '2006-01-24 15:48:49', 264, 313, 0, 1, 1);
INSERT INTO `article` VALUES (40, '优秀传统文化组团进校园播下文艺小种子', '传统文化进校园', 'http://127.0.0.1:9090/uploads/articleCovers/1697002671687.png', '9月22日下午，由绵阳市文化馆、绵阳市非遗中心、科学城春蕾学校工会主办的“艺起向未来”中华优秀传统文化系列公益讲座进校园活动在科学城春蕾学校举行，包括公益讲座、非遗项目展示等内容。380余名教职员工和小朋友共同感受中华优秀传统文化带来的魅力。\n![](http://127.0.0.1:9090/uploads/articleImages/1697002702963.png)\n本次讲座邀请了绵阳市艺术剧院川剧团青年演员、国家三级演员王强、黄金玉作主讲嘉宾，现场讲解并示范川剧四大类身段。王强老师还为教师们结合表演讲解了川剧的声腔、行当等基础知识，演奏了川剧常见的伴奏乐器，现场多名老师积极参与互动，一起感受、体验川剧艺术的魅力。绵阳市非遗中心也带来了平武剪纸、涪城面塑、吹糖人、麦芽糖画等非遗项目展示。此次活动，优秀传统文化组团进校园引起了全校师生的浓厚兴趣，小朋友们围在这些项目传承人面前，久久不愿离开。\n![](http://127.0.0.1:9090/uploads/articleImages/1697002702968.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697002702965.png)\n“艺起向未来”是绵阳市文化馆专门针对未成年人开展的公共文化服务重要内容之一，主要包括寒暑假公益培训班、公益讲座、公益沙龙等项目。近三年来，“艺起向未来”寒暑假公益培训班共开设了100余个班次，涉及少儿舞蹈、美术、书法、象棋、吟诵等10余个专业，为2000余名少年儿童提供免费艺术培训服务，已成为绵阳市文化馆每年定期开展的常态性工作。随着群众需求的增长，绵阳市文化馆还将定期更新服务模式及培训内容，推动未成年人综合素质发展，把文艺“种”进幼小的心灵。\n', 12, 'msglbo', '2009-01-24 18:16:07', '2019-11-29 07:53:42', 419, 0, 0, 1, 1);
INSERT INTO `article` VALUES (42, '“艺荟时光”走进传统文化', '茶艺沙龙', 'http://127.0.0.1:9090/uploads/articleCovers/1697003340913.png', '白露至，天渐凉，宜喝什么茶、怎么喝最养生？让我们一起来听听国家高级茶艺师杜若老师怎么说。\n![](http://127.0.0.1:9090/uploads/articleImages/1697003362682.png)\n杜若：国家高级茶艺师、评茶师、杜若茶书苑主理人', 12, 'msglbo', '2015-03-06 00:54:34', '2019-04-21 17:34:38', 71, 160, 0, 1, 2);
INSERT INTO `article` VALUES (45, '李白故居', '李白故居', 'http://127.0.0.1:9090/uploads/articleCovers/1697013874661.png', '\n李白(701年-762年) ，字太白，号青莲居士，又号“谪仙人”，汉族，祖籍陇西成纪(现甘肃秦安县)， 隋朝末年，因避乱(- -说流放)迁徙到中亚细亚碎叶城。\n碎叶城就是今天的吉尔吉斯斯坦北部托克马克附近，碎叶城是唐朝在西域设的重镇，与龟兹、疏勒、于阗并称为唐代“安西四镇”，李白即诞生于此。\n李白四岁时离开碎叶城，迁居四川绵州昌隆县(今四 川省江油市)青莲乡(青 莲居士就是这么来的)。有种说法是:李白的故乡是四川江油，是因为李白在少年时期生长在江油地区。\n二十 岁时只身出川，开始了广泛漫游，南到洞庭湘江，东至吴、越，寓居在安陆(今湖北省安陆市)、应山(今湖北省广水市)，后又继续北上太原、长安，东到齐、鲁各地。\n后来寓居山东任城(今山东济宁，现在济宁有个任城区)。\n![](http://127.0.0.1:9090/uploads/articleImages/1697013531023.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697013531030.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697013531021.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697013531026.png)', 16, 'banana', '2003-07-28 10:52:13', '2013-08-05 00:48:09', 399, 652, 0, 3, 1);
INSERT INTO `article` VALUES (52, '绵-延古今阳●名天下', '绵-延古今阳●名天下', 'http://127.0.0.1:9090/uploads/articleCovers/1697014027691.png', '\n\n绵.延古今阳●名天下\n“李白出生地，中国科技城”，两句话概述了绵阳这座城市的前世今生。\n幽青莲镇一笔落惊风雨， 诗成泣鬼神。故居里的青莲池为这里增色不少，荷花盛开的季节，这里配得上所有诗句的赞美。\n![](http://127.0.0.1:9090/uploads/articleImages/1697014067047.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697014067046.png)\n城区游览一 中国科技城的基础来源于. 上世纪五十年代一批军工厂落地绵阳。东方红大桥、跃进路、兴盛街，这些带有时代烙印的名字见证了一个时代的辉煌。值得庆幸的是，绵阳在发展的过程中并没抹去这些时代的记忆，保留历史是对祖辈父辈最大的尊重。绵阳城的夜景同样值得欣赏，登上越王楼绵阳城两江夜景尽收眼底。在越王楼上，不免心生感慨，“今人不见古时月，今月曾经照古人。”过往千年，唐朝的月，建国初期的月，与今天的月又有何不同呢?\n父浴火重生，震后重建一看 着残缺和扭倒的建筑,512所带来的恐惧仍然历历在目。当时的人们所经历的苦难可能并没有随着县城的重建而恢复，对自然的敬畏和继续生活下去的坚韧给我们带来新生的勇气。\n![](http://127.0.0.1:9090/uploads/articleImages/1697014067052.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697014067049.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697014105580.png)', 15, 'banana', '2010-11-29 09:30:30', '2009-09-22 14:11:30', 729, 634, 0, 3, 1);
INSERT INTO `article` VALUES (149, '万圣节幽灵椅', '万圣节幽灵椅', 'http://127.0.0.1:9090/uploads/articleCovers/1699859629370.png', '万圣节幽灵椅\n![](http://127.0.0.1:9090/uploads/articleImages/1699859612130.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699859612152.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699859612143.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699859612161.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699859612170.png)\n', 15, 'cc', '2023-11-13 15:14:13.215', NULL, 0, 0, 0, NULL, 1);
INSERT INTO `article` VALUES (148, '你也为我着迷吧！', '小狗weik', 'http://127.0.0.1:9090/uploads/articleCovers/1699859466339.png', '你也为我着迷吧！![](http://127.0.0.1:9090/uploads/articleImages/1699859481000.png)\n\n![](http://127.0.0.1:9090/uploads/articleImages/1699859434812.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699859434809.png)\n', 21, 'cc', '2023-11-13 15:11:27.935', NULL, 0, 0, 0, NULL, 1);
INSERT INTO `article` VALUES (150, '儿童餐具套装', '儿童餐具套装', 'http://127.0.0.1:9090/uploads/articleCovers/1699859817924.png', '阳光正好，分享一组可爱风餐具---儿童餐具套装。\n主要针对3-6岁儿童的，以海豚的造型作为仿生设计，并对餐具的造型进行了分层结构，使其整体的每一部分都“各尽其用”，做了模块化处理；餐具以硅胶作为主要材料，卫生且安全！\n![](http://127.0.0.1:9090/uploads/articleImages/1699859792014.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699859792023.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699859792019.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699859792016.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699859792021.png)\n', 15, 'cc', '2023-11-13 15:20:14.223', NULL, 0, 0, 0, NULL, 1);
INSERT INTO `article` VALUES (151, '居家智慧屏', '居家智慧屏', 'http://127.0.0.1:9090/uploads/articleCovers/1699860100601.png', '将室内各个设备的控制功能统一集成在一起的智能家庭控制屏---居家智慧屏。是将T5L驱动电路、液晶屏、触摸屏等可靠整合。运行DGUS平台软件的智能显示模组产品。全屋定制，一键操控。\n\n![](http://127.0.0.1:9090/uploads/articleImages/1699860090734.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699860090728.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699860090737.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699860090732.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699860090731.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699860090739.png)\n', 15, 'cc', '2023-11-13 15:23:58.863', NULL, 0, 0, 0, NULL, 1);
INSERT INTO `article` VALUES (152, '尧无敌', '尧霸天', 'http://127.0.0.1:9090/uploads/articleCovers/1700567044353.png', '轰隆隆', 13, 'msglbo', '2023-11-21 19:44:32.492', NULL, 0, 0, 0, NULL, 1);
INSERT INTO `article` VALUES (55, '非遗之美|绵阳拼布', '绵阳拼布', 'http://127.0.0.1:9090/uploads/articleCovers/1697012221450.png', '![](http://127.0.0.1:9090/uploads/articleImages/1697012227207.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697012275555.png)\n\n非遗之美|绵阳拼布\n起源于涪城的绵阳拼布\n在传统的基础上形式更加丰富，极具美感被列为市级非物质文化遗产保护项目\n同时也是省级农村生产生活遗产项目\n绵阳市代表性非遗项目\n![](http://127.0.0.1:9090/uploads/articleImages/1697012275564.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697012275577.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697012275570.png)\n《绵阳拼布》代表性传承人山果女红馆手工老师一顾玥瑜。\n毕业于西南科技大学工业设计专业毕业后从事设计、手工制作相关工作。\n在工作期间，对拼布艺术产生了浓厚兴趣后师从绵阳折花拼布第四代传承人石建群,潜心学习绵阳折花拼布。\n将传统折花拼布大胆创新，制作拼布日常用品、工艺品摆件及大型壁饰等使拼布更多的融入人们的日常工作和生活。\n我们希望在非遗传承中将传统与现代的碰撞变革与守旧的探讨贯穿其中让非遗真正成为活态遗产，在自洽和衍变中寻求活态传承。', 12, 'msglbo', '2006-01-25 13:11:11', '2002-12-09 21:38:15', 183, 577, 0, NULL, 1);
INSERT INTO `article` VALUES (58, '川渝汉迹之一绵阳平阳府君 ', '川渝汉迹之一绵阳平阳府君 ', 'http://127.0.0.1:9090/uploads/articleCovers/1697014622787.png', '川渝汉迹之一绵阳平阳府君 \n四川绵阳的平阳府君阙建于东汉晚期至蜀汉时期，距今近1800年，阙上刻有“平阳府君叔神道”字样。东西两阙相距26.2米，主阙通高5.45米。双阙保存完 好，但雕刻风化严重，尤其梁大通三年(529年) ，佛教徒雕凿佛龛和题记近三十处，阙.上原始信息被覆盖。\n平阳府君阙为第一批全国重 点文物保护单位，现伫立在绵阳科技馆前，全天开放。\n![](http://127.0.0.1:9090/uploads/articleImages/1697014574012.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697014574020.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697014574024.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697014574015.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697014574017.png)', 15, 'banana', '2003-04-09 20:14:25', '2014-07-10 05:59:47', 940, 410, 0, NULL, 1);
INSERT INTO `article` VALUES (63, '中国非遗--扎染永流传', '扎染永流传', 'http://127.0.0.1:9090/uploads/articleCovers/1697010940708.png', '中国传统非遗手工艺\n运用天然草木染料，用纱、线、绳等工具，对织物进行扎、缝、缚、缀、夹等多种形式组合后进行染色，染色完成后拆线，摊开洗净即可。\n![](http://127.0.0.1:9090/uploads/articleImages/1697010974010.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697010974014.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697010974012.png)\n', 12, 'msglbo', '2020-06-30 04:55:09', '2009-01-27 07:29:33', 657, 48, 0, NULL, 1);
INSERT INTO `article` VALUES (64, '平武剪纸--六折团花', '非遗剪纸', 'http://127.0.0.1:9090/uploads/articleCovers/1697004201787.png', '剪纸艺术出现在东汉之后，郭沫若先生曾赋诗:“曾见北国之窗花，其味天真而浑厚。今见南方之刻纸，玲珑剔透得未有。一剪之巧夺神功，美在民间永不朽。”一剪一刻，道出南北工艺的特点。\n![](http://127.0.0.1:9090/uploads/articleImages/1697004259281.png)\n被称为“江南剪纸第一人”的计建明剪南春剪纸工作室，就在同里古镇世界文化遗产退思园内，具体位置是在坐春望月楼下，在这里计建明老师，默默传承着。\n![](http://127.0.0.1:9090/uploads/articleImages/1697004259289.png)\n“同里是一座积淀着悠久历史的古镇，居民们大都世代生活在这里，生活节奏悠闲舒缓。这里的慢生活，会让人的心境也慢下来，很适合剪纸创作。”计建明说，剪纸是一门慢工出细活的艺术，构思、描线、动剪，每一道工序都自有其规律，-步也急躁不得。就像太极一样，以静制动，以柔克刚，欲速则不达。\n![](http://127.0.0.1:9090/uploads/articleImages/1697004259294.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697004259300.png)\n\n\n\n', 12, 'msglbo', '2002-10-03 18:52:03', '2018-05-14 23:20:44', 224, 958, 0, NULL, 1);
INSERT INTO `article` VALUES (119, '绵阳游仙区--鱼泉寺', '鱼泉寺', 'http://127.0.0.1:9090/uploads/articleCovers/1697008575411.png', '绵阳游仙区鱼泉寺\n\n间鱼泉寺位于四川绵阳游仙区东宣乡鱼泉村的鱼泉山腰上，距绵阳城约40公里。这里层峦叠翠，林木翳荫，又有清流激湍，萦拂山中，环境颇为幽静。寺因山势而建，坐南向北，创建于明代正统元年(1436年)。相传“寺有泉池不涸，有鱼游泳自如”故名。\n明末清初，寺遭兵燹。清康熙、乾隆年间寺僧增建了观音殿、地藏殿和前殿，并续构两廊及前灵官楼。现鱼泉寺的建筑，除大雄殿为明代建筑外，其余均清代遗存。\n![](http://127.0.0.1:9090/uploads/articleImages/1697008628149.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697008628146.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697008628143.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697008628144.png)\n', 14, 'abc', '2023-10-11 15:17:23.248', NULL, 1, 0, 0, NULL, 1);
INSERT INTO `article` VALUES (117, '绵阳-觉寺|仿宋榫-卯结构的木建筑“典雅无为为内涵”', '绵阳大觉寺|', 'http://127.0.0.1:9090/uploads/articleCovers/1697007643528.png', '绵阳.大觉寺|仿宋榫 卯结构的木建筑“典雅无为为内涵”\n![](http://127.0.0.1:9090/uploads/articleImages/1697007711352.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697007711350.png)\n今天在绵阳出差，中午下班决定下午出去转转。\n![](http://127.0.0.1:9090/uploads/articleImages/1697007711330.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697007711326.png)\n因大觉寺建筑以仿宋榫卯结构的木建筑为主，建设中挖掘经典的传统工艺技术，发扬工匠精神，精工细作，尤其在木结构建筑的斗拱方面，具有-定的特色，因此我和雯雯决定前去欣赏这-特色建筑。\n![](http://127.0.0.1:9090/uploads/articleImages/1697007711355.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697007711357.png)\n大觉禅寺位于距四川省绵阳市中区以西17公里的龙潭坡下、花拱桥边。这里是川西北四季常青的丘陵地带，因先秦时代贤圣踪迹历称“庄子沟”，至清代复有观音显圣得名“观音堂村”，其名称沿用至今。\n所有的建筑力求造型典雅、气韵祥和、结构安泰。殿堂门窗、走廊以及栏杆的造型均是自主设计，精心雕刻，要求自然古朴、静谧稳重。\n寺院的整理绿化以层次分明、清新典雅为要求，另一方面也在规划种植使寺院将来具有山林的树木气势。保证今后的寺院整体古树参天，细微之处禅意盎然、高雅脱俗。', 14, 'msglbo', '2023-10-11 15:02:46.022', NULL, 3, 0, 0, NULL, 1);
INSERT INTO `article` VALUES (120, '东方韵|意象东方', '云想衣裳花想容春风拂槛露华浓', 'http://127.0.0.1:9090/uploads/articleCovers/1697008879961.png', '云想衣裳花想容春风拂槛露华浓\n这幅大型舞台艺术作品唐诗“云想衣裳花想容，春风拂槛露华浓”的意象，创造出一个东方灵感浪漫情怀的场景。\n东方韵以其独特的魅力，如诗如画地在时尚舞台.上绽放。在传承自古代意境与现代国潮时尚完美交融，将传统与现代空间、情感与审美精髓交织成华美的画。\n![](http://127.0.0.1:9090/uploads/articleImages/1697008992053.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697009009729.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697009026393.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697009042014.png)\n\n', 13, 'abc', '2023-10-11 15:24:15.030', NULL, 1, 0, 0, NULL, 1);
INSERT INTO `article` VALUES (121, '以针为笔，可织万物', '以针为笔，可织万物', 'http://127.0.0.1:9090/uploads/articleCovers/1697009347841.png', '以针为笔，可织万物| \nAna Teresa Barboza 秘鲁艺术家Ana Teresa Barboza之前曾被吸弓|到用纱线和线来重新创造完整的风景，用河流、山谷和从墙壁溢出来的波浪来刺绣大型壁毯。\n![](http://127.0.0.1:9090/uploads/articleImages/1697009268117.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697009268108.png)\nBarboza继续探索以装置为基础的挂毯，她的新作品描绘了单个植物的生长，同时也将她的实践扩展到编织一-个相互连接的篮子的新作品。\n![](http://127.0.0.1:9090/uploads/articleImages/1697009268107.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697009268110.png)\n她的“增加”系列画出了一株植物15天的影子，稳定地追踪了它在两周时间里的生长和运动。每一幅挂毯的底部都有一团纱线，当它慢慢地添加到不断变化的画像中时，提供了一种逐渐减少的材料的可视化。多彩的刺绣在原植物的白色空间周围提供了充满活力的光芒，其不断增加的质量在锯齿形状和充满活力的色调的拼贴画中体现出来。\n![](http://127.0.0.1:9090/uploads/articleImages/1697009268120.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697009268112.png)', 13, 'abc', '2023-10-11 15:29:15.439', NULL, 4, 0, 0, NULL, 1);
INSERT INTO `article` VALUES (122, '千里江山图', '千里江山图', 'http://127.0.0.1:9090/uploads/articleCovers/1697009716281.png', '《千里江山图》\n光影微雕艺术展以光影的流动与变幻，呈现深远、平远和高远三种不同层次的江山美景。通过投影、灯光、影像等艺术形式，创造出灵动、丰富的视觉体验，进入一场身临其境的江山之旅，感受千年传统与现代创新的融合。\n深远之美:\n![](http://127.0.0.1:9090/uploads/articleImages/1697009705320.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697009705310.png)\n在展览的深远区域，光影投影将观众带入虚实交错的古朴山林。影像中的飘渺云雾、河流弯曲，仿佛让观众穿越时空，感受历史的厚重和沧桑。光线的柔和与明暗的对比，展示出深远景象的朴实与内涵，唤起观众心中对过去时光的回忆与思索。\n平远之美:\n![](http://127.0.0.1:9090/uploads/articleImages/1697009705315.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697009705313.png)\n平远区域将利用光影的层次感，打造出广袤平原与开阔水域的景象。通过投影映射的现代城市景观，与虚拟的田野、湖泊相互交融，形成生动的对比。观众将在光影的交错中感受到平远景象的包容与未来的希望，探索人类与自然的共生之道。\n高远之美:\n![](http://127.0.0.1:9090/uploads/articleImages/1697009705315.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697009705313.png)\n高远区域将采用灯光和投影的技术，创造出壮阔高山和悬崖峭壁的壮美场景。光线与阴影的对比，营造出高远景象的神秘与雄伟。观众仿佛漫步于高山云端，感受到高远江山的崇高与超越。通过光影的变幻，展现出高远景象的雄奇与仙境之美。#时尚美学#艺术\n![](http://127.0.0.1:9090/uploads/articleImages/1697009705323.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697009705326.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697009705332.png)', 13, 'abc', '2023-10-11 15:37:41.192', NULL, 6, 0, 0, NULL, 1);
INSERT INTO `article` VALUES (67, '手绘素描--普洱茶系列包装设计', '手绘包装', 'http://127.0.0.1:9090/uploads/articleCovers/1697004550724.png', '插画设计的重要作用\n视觉元素由图形、文字、色彩三大元素组成\n插画将产品信息以图形的形式传递给消费者\n使产品信息一目了然，新颖、个性化\n在众多的设计产品中脱颖而出。\n![](http://127.0.0.1:9090/uploads/articleImages/1697004683407.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697004683410.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697004683414.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697004683412.png)\n', 16, 'msglbo', '2019-05-28 18:12:36', '2018-03-31 03:24:04', 979, 350, 0, NULL, 2);
INSERT INTO `article` VALUES (115, '蝴蝶', '画画', 'http://127.0.0.1:9090/uploads/articleCovers/1697004907116.png', '![](http://127.0.0.1:9090/uploads/articleImages/1697004925857.png)\n真好看垭', 13, 'abc', '2023-10-11 14:15:33.609', NULL, 6, 0, 0, NULL, 1);
INSERT INTO `article` VALUES (68, '非物质文化遗产--仙居针刺无骨花灯', '无骨花灯', 'http://127.0.0.1:9090/uploads/articleCovers/1697005419145.png', '非遗质文化遗产仙居针刺无骨花灯! ! !\n![](http://127.0.0.1:9090/uploads/articleImages/1697005436867.png)\n仙居针刺无骨花灯发源地在浙江省仙居县皤滩，于2006年被列入国务院第-批中国非物质文化遗产。\n![](http://127.0.0.1:9090/uploads/articleImages/1697005436860.png)\n仙居针刺无骨花灯，当地民间称为“唐灯”。其工艺源自唐代，花灯融绘画、刺绣、建筑艺术于一体，整灯不用一根骨架，只用大小不等、形状各异的纸片黏贴接合，再覆盖用绣花针刺出各种花纹图案的纸片，经13道精细工序制作而成，被誉为“中华第一-灯”。其造型和图案千变万化，形成了繁多的花色品种，并且可以由大小不同的小灯组成一套巨大的花灯，绚丽\n![](http://127.0.0.1:9090/uploads/articleImages/1697005436869.png)\n现年87岁的王汝兰是浙江省非物质文化遗产项目代表性传承人，她从20世纪80年代起就致力于钻研花灯的灯面图案和式样，培养了众多传承人，为无骨花灯的传承、发展和弘扬作出了突出的贡献。\n![](http://127.0.0.1:9090/uploads/articleImages/1697005436858.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697005436864.png)\n', 12, 'msglbo', '2007-12-30 15:21:31', '2018-02-21 18:39:09', 940, 956, 0, NULL, 1);
INSERT INTO `article` VALUES (72, '南京绒花--指尖，上的非遗珍萃', '南京绒花', 'http://127.0.0.1:9090/uploads/articleCovers/1697005794531.png', '南京绒花--指尖，上的非遗珍萃\n![](http://127.0.0.1:9090/uploads/articleImages/1697005825981.png)\n南京绒花绒花始于唐朝，谐音荣华，是中华富贵文化的代表。唐代即为贡品。明末清初流入民间，主要在春节、端午节、中秋节及际逢婚嫁喜事时佩戴绒花。南京绒花的制作流程繁多，因其特殊的手法直到现在都无法用机器生产。绒花的制作过程非常繁复，即使是一件最简单的作品，比如百合花，也需要两天才能完成。绒花的原料简单易得，只要丝绸的下脚料就行，紫铜丝为骨架。简单的原料全靠手工匠人们巧手。\n![](http://127.0.0.1:9090/uploads/articleImages/1697005825983.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697005825988.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697005825976.png)\n绒花的制作过程包含了煮丝、染色、劈绒、勾条、打尖、传花、包装等近十道工序，其中最重要的是勾。\n![](http://127.0.0.1:9090/uploads/articleImages/1697005825978.png)\n虽然影视剧的热播让绒花被许多人喜爱，但这门技艺却面临着失传的危险。-方面，随着云锦产量急剧降低，生产绒花的边角料很难找到，现在要到苏州购买苏绣用的蚕丝作为原料。另一方面，绒花的制作工艺复杂，耗时长，收益慢，非遗传承人面临生存问题,年轻人即使对制作绒花有兴趣，也会因为面临生存压。\n![](http://127.0.0.1:9090/uploads/articleImages/1697005825973.png)\n2006年，南京绒花被列为江苏省非物质文化遗产。精致唯美的绒花可以永远保存，希望不败的绒花能和他的寓意-样得到大众的喜爱真正的做到“花开不 败”。\n![](http://127.0.0.1:9090/uploads/articleImages/1697005825990.png)\n\n\n\n\n\n\n\n\n\n', 12, 'msglbo', '2015-01-07 11:46:07', '2017-05-17 06:42:03', 986, 437, 0, NULL, 1);
INSERT INTO `article` VALUES (73, '中国非遗|纸浆画，“纸”尖上的艺术纸浆画类似于泥彩，', '纸浆画类似于泥彩', 'http://127.0.0.1:9090/uploads/articleCovers/1697006041457.png', '中国非遗|纸浆画，“纸”尖， 上的艺术纸浆画类似于泥彩，\n以纸浆为主要材料创作的工艺美术作品,彩色纸浆泥。\n![](http://127.0.0.1:9090/uploads/articleImages/1697006121765.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697006121770.png)\n可在木、瓷、玻璃、石、纸等多种材料.上绘制，颜色丰富多彩，具有浮雕效果。\n纸浆画，\n如今以一种较为现代的表现手法呈现在生活中，不仅传承了古代匠人的手艺,\n还让中式传统文化以一种新的形式流传至今。\n纸浆画体现了美化环境的传播理念,更考验创作者的耐心和审美能力，能够让人学会在独处时,\n感受手作的温暖和与自我相处的美好。\n![](http://127.0.0.1:9090/uploads/articleImages/1697006121775.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697006121772.png)', 12, 'msglbo', '2020-08-22 19:15:31', '2017-04-12 00:51:14', 862, 281, 0, NULL, 1);
INSERT INTO `article` VALUES (133, '晓窗风细响檐铃，一曲云傲枕上闻', '古建筑檐下的风铃一作用真不小 !!', 'http://127.0.0.1:9090/uploads/articleCovers/1699690106086.png', '古建筑檐下的风铃一作用真不小 !!\n![](http://127.0.0.1:9090/uploads/articleImages/1699689958337.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699689958340.png)\n这种庙宇殿堂屋角的铃铛现如今都称作“风铃”，亦称惊鸟铃、护花铃。\n在古代，建筑房檐下非常容易被燕子等鸟类筑巢,为了驱逐它们，古人想了个好办法，在檐下悬挂了风铃。\n个当风吹过时风铃叮当作响，鸟类被惊吓，不仅避免了房檐下被筑巢，也可以保护廊内的花花草草。\n古人悬挂风铃，是以“风吹玉振”的声音，达到警示、静心养性或祈福之目的。\n\n个寺庙建筑屋檐下的风铃，清脆之声庄严宁静，似在时时惊醒世人之意。警示世人遁入佛门，修行切记静心养性。另外，寺院屋檐上的风铃还有祈福、辟邪之寓意。\n\n在古代，风铃还有个别致的名字:铁马，古称\n\n“铎”。中国的风铃在北魏时期就出现了，当时风铃用于装点佛塔。\n很多诗词中都出现了关于风铃的描述，可见它在文人墨客中也极为风行。\n\n宋施枢一晓窗风细响檐铃，一曲云傲枕上闻。\n清李渔一最奇的是横阶塔影， 在平地上振响风铃。 陆游一桐阴清 润雨余天，檐铎摇风破书眠。梦到画 堂人不见，一双轻 燕蹴筝弦。\n真是想不到，古建筑屋檐下的铃铛还有这么多用处呢?\n\n![](http://127.0.0.1:9090/uploads/articleImages/1699689958343.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699689958347.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699689958352.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699689958349.png)\n', 14, 'msglbo', '2023-11-11 16:08:37.759', NULL, 0, 0, 0, NULL, 1);
INSERT INTO `article` VALUES (134, '中国六大建筑派|惊艳四海', '中国六大建筑派', 'http://127.0.0.1:9090/uploads/articleCovers/1699690303867.png', '中国六大建筑派|惊艳四海开\n![](http://127.0.0.1:9090/uploads/articleImages/1699690233968.png)\n京派建筑:在于它历经700多年演变而来的四合院，院落宽绰疏朗，四面房屋独立，大到皇宫王府，小到平民住宅，每一处雕饰，每一笔彩绘，都是北方文化的无价之宝。中国北方建筑以京派建筑最为典型，而京派建筑里最典型的便是北京的四合院了。\n![](http://127.0.0.1:9090/uploads/articleImages/1699690233978.png)\n闽派建筑:在于它历经500多年传承而来的土楼，将生土夯筑技术发挥到极致，单体建筑规模宏大精细，地堡式建筑风格沿用至今坚固无比，既可防火防震，亦可御敌入侵。闽，即福建，闽派民居即流行于闽南地区的一种建筑风格。其中“土楼”是其最为鲜明的代表，是一种供聚族而居、且具有防御性能的民居建筑。\n![](http://127.0.0.1:9090/uploads/articleImages/1699690233986.png)\n苏派建筑:在于它存在了数千年的苏州园林中，自春秋战国时期人们开始追求，脊角高翘的屋顶，江南风韵的门楼，曲折蜿蜒，藏而不露，饲鸟养鱼、叠石迭景，堪称园林式布局的艺术典范。中国古典园林讲究曲折蜿蜒，藏而不露。置身其中，四周流淌着的 是“曲径通幽处，禅房花木深”，“万籁此俱寂， 但余钟磬音”之感。直露中有迂回，舒缓处有起伏，让人回味无穷。\n![](http://127.0.0.1:9090/uploads/articleImages/1699690233994.png)\n皖派建筑: 在于它优雅了千年的徽派民居， 青瓦白墙，砖雕门楼，徽派建筑风格以民居、祠堂和牌坊闻名遐迩，集徽州山川风景之灵气，融风俗文化之精华。皖派建筑是六大建筑派系里最为突出的建筑风格之一，是中国南方民居的代表。\n![](http://127.0.0.1:9090/uploads/articleImages/1699690234001.png)\n川派建筑:在于它融合多民族智慧的吊脚楼，作为巴楚文化的活化石，依山靠河就势而建，丝檐走栏自成一派，看似随意却十分考究，成为千年民族文化的传承。川派建筑，即流行于四川、云南、贵州等地的一种建筑风格，为当地少数民族特有的建筑风格。在川派建筑中以傣族竹楼、侗族鼓楼、川西吊脚楼，最具鲜明特色。\n![](http://127.0.0.1:9090/uploads/articleImages/1699690234009.png)\n晋派建筑:在于它气势恢宏的乔家大院，斗拱飞檐，彩饰金装，砖瓦磨合，城楼细做,\n六个大院三百多间房屋错落有致，展现出晋商的稳重大气，严谨深沉，晋派只是一个泛称，不仅指山西一带，还包括陕西、甘肃、宁夏及青海部分地区。在这些地区中以山西的建筑风格最为成熟，故统称为晋派建筑。\n\n\n\n\n\n\n\n\n', 14, 'msglbo', '2023-11-11 16:15:44.999', NULL, 1, 0, 0, NULL, 1);
INSERT INTO `article` VALUES (135, '仰望星空', '艺术仰望星空', 'http://127.0.0.1:9090/uploads/articleCovers/1699857652177.png', '仰望星空\n梵高\n![](http://127.0.0.1:9090/uploads/articleImages/1699857643714.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699857643718.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699857643701.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699857643697.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699857643707.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699857643709.png)\n', 13, 'msglbo', '2023-11-13 14:40:55.719', NULL, 1, 0, 0, NULL, 1);
INSERT INTO `article` VALUES (136, '花', '梵高笔下的花', 'http://127.0.0.1:9090/uploads/articleCovers/1699857787696.png', '梵高笔下的花\n\n![](http://127.0.0.1:9090/uploads/articleImages/1699857770965.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699857770959.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699857770969.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699857770958.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699857770961.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699857770966.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699857770971.png)\n', 13, 'msglbo', '2023-11-13 14:43:09.250', NULL, 1, 0, 0, NULL, 1);
INSERT INTO `article` VALUES (137, '红配绿', '宋代经典美学', 'http://127.0.0.1:9090/uploads/articleCovers/1699857928920.png', '红配绿  宋代经典美学\n![](http://127.0.0.1:9090/uploads/articleImages/1699857919959.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699857919962.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699857919964.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699857919969.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699857919957.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699857919968.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699857919976.png)\n', 13, 'cc', '2023-11-13 14:45:30.300', NULL, 0, 0, 0, NULL, 1);
INSERT INTO `article` VALUES (138, '光影色彩构图', '光影色彩构图参考', 'http://127.0.0.1:9090/uploads/articleCovers/1699858066729.png', '光影色彩构图参考\n![](http://127.0.0.1:9090/uploads/articleImages/1699858057516.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699858057518.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699858057522.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699858057513.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699858057526.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699858057530.png)\n', 16, 'cc', '2023-11-13 14:47:48.470', NULL, 0, 0, 0, NULL, 1);
INSERT INTO `article` VALUES (139, '光与影的街头', '光与影的街头', 'http://127.0.0.1:9090/uploads/articleCovers/1699858198315.png', '光与影的街头\n![](http://127.0.0.1:9090/uploads/articleImages/1699858183452.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699858183446.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699858183462.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699858183456.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699858183449.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699858183459.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699858183468.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699858183472.png)\n', 16, 'cc', '2023-11-13 14:49:59.764', NULL, 0, 0, 0, NULL, 1);
INSERT INTO `article` VALUES (140, '哈基米日常', '这个世界不能没有小猫', 'http://127.0.0.1:9090/uploads/articleCovers/1699858483055.png', '哈基米日常\n这个世界不能没有小猫\n![](http://127.0.0.1:9090/uploads/articleImages/1699858470273.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699858470289.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699858470285.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699858470271.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699858470276.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699858470281.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699858470293.png)\n', 21, 'msglbo', '2023-11-13 14:54:44.703', NULL, 0, 0, 0, NULL, 1);
INSERT INTO `article` VALUES (141, '哈基米日常', '这个世界不能没有小猫', 'http://127.0.0.1:9090/uploads/articleCovers/1699858483055.png', '哈基米日常\n这个世界不能没有小猫\n![](http://127.0.0.1:9090/uploads/articleImages/1699858470273.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699858470289.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699858470285.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699858470271.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699858470276.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699858470281.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699858470293.png)\n', 21, 'msglbo', '2023-11-13 14:54:44.817', NULL, 1, 0, 0, NULL, 1);
INSERT INTO `article` VALUES (142, '啊 修狗狗', '地球不是只属于人类，还有我们狗狗！', 'http://127.0.0.1:9090/uploads/articleCovers/1699858646614.png', '地球不是只属于人类，还有我们狗狗！\n![](http://127.0.0.1:9090/uploads/articleImages/1699858628148.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699858628151.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699858628154.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699858628156.png)\n', 21, 'msglbo', '2023-11-13 14:57:27.832', NULL, 1, 0, 0, NULL, 1);
INSERT INTO `article` VALUES (143, '睡大觉咯', '咪咪酱', 'http://127.0.0.1:9090/uploads/articleCovers/1699858718660.png', '\n财财今天睡大觉咯\n![](http://127.0.0.1:9090/uploads/articleImages/1699858699926.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699858699935.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699858699950.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699858699943.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699858699957.png)\n', 21, 'msglbo', '2023-11-13 14:59:58.219', NULL, 3, 0, 0, NULL, 1);
INSERT INTO `article` VALUES (144, '我和你才是天下第一好', '天下第一好', 'http://127.0.0.1:9090/uploads/articleCovers/1699858930988.png', '我和你才是天下第一好\n![](http://127.0.0.1:9090/uploads/articleImages/1699858906073.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699858906071.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699858906075.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699858906078.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699858906081.png)\n', 21, 'msglbo', '2023-11-13 15:02:12.155', NULL, 1, 0, 0, NULL, 1);
INSERT INTO `article` VALUES (145, '花花吃饱饱', '花花吃饱饱', 'http://127.0.0.1:9090/uploads/articleCovers/1699859137395.png', '花花吃饱饱\n![](http://127.0.0.1:9090/uploads/articleImages/1699859115920.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699859115923.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699859115925.png)\n', 21, 'msglbo', '2023-11-13 15:05:40.129', NULL, 2, 0, 0, NULL, 1);
INSERT INTO `article` VALUES (146, '花花挨嘛嘛教育啦', '呼呼呼呼', 'http://127.0.0.1:9090/uploads/articleCovers/1699859296266.png', '![](http://127.0.0.1:9090/uploads/articleImages/1699859225199.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699859225209.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699859225216.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699859225224.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699859225231.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699859225238.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699859225245.png)\n', 21, 'cc', '2023-11-13 15:08:17.658', NULL, 9, 0, 0, NULL, 1);
INSERT INTO `article` VALUES (124, '三江大桥', '绵阳|涪江 上的设计感大桥', 'http://127.0.0.1:9090/uploads/articleCovers/1699686243592.png', '绵阳|涪江 上的设计感大桥\n![](http://127.0.0.1:9090/uploads/articleImages/1699686237258.png)\n位于涪江.上的三江大桥绝对是绵阳最具设计感最具美感最具实用主义的桥了吧!真正实现了人车分流不同道。\n行车的道由桥墩支撑，行人的道由桥索拉住，人行道由桥的一端的下方绕到桥的上方再绕到另-端的下方。有大货车通过时，人行道会轻微摇晃，这样的设计有助于分散大货车行走时对桥的作用能量，起到减震以保护主体的效果。\n三江大桥\n![](http://127.0.0.1:9090/uploads/articleImages/1699686237265.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699686237256.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699686237260.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699686237270.png)\n', 14, 'cc', '2023-11-11 15:05:41.821', NULL, 6, 0, 0, NULL, 1);
INSERT INTO `article` VALUES (125, '深山故宫-平武报恩寺', '平武报恩寺', 'http://127.0.0.1:9090/uploads/articleCovers/1699686791677.png', '深山故宫-平武报恩寺\n\n平武报恩寺，全名“敕脩报恩寺”。位于四川省绵阳市 平武县城区。寺院始建于明正统五年(1440年) ，至 英宗天顺四年(1460年) 全部竣工，是中国保存最为完整的明代早期建筑群落之一。\n传说是土官王玺父子二人计划修建自住，设计和施工都是北京故宫原班人马，俨然深山故宫，后被人告发，僭越之罪恐杀头，于是请圣旨修建为寺庙。以“报恩”为名修建的寺院在南京、沈阳、兰州等地也有，但是，惟有平武这座才真正是皇帝下旨修筑的报恩寺。\n![](http://127.0.0.1:9090/uploads/articleImages/1699686880465.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699686880473.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699686880474.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699686880467.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699686880478.png)\n\n报恩寺有六绝:\n一、整座建筑群均由楠木建造，楠木生长周期长，造价高，据说当时修建报恩寺用完了平武所有能用的楠木。处处可见价值连城的金丝楠木。\n\n二、斗拱。报恩寺的斗拱是中国古建和世界建筑史上的一大奇迹。建筑.上使用斗拱的花样、出跳是有讲究的，而报恩寺的斗拱不仅从数量上、花样.上都是全国.之最。全寺有奇巧严谨的斗拱36种2000多朵，又有“斗拱博物馆”之称。\n\n三、转轮经藏。系金丝楠木结构塔形器，中心置一根 立轴，可以左右旋转，它象征佛教的因果轮回，上 端套入殿梁，下端立于圆形地坑中央的铸铁砧上，迄今仍可平滑转动。是中国为数不多的几处转轮藏中保存最为完整，做工最为精美的一座。\n\n四、9999条龙。平武在古代称“龙州”，报恩寺简直是龙的世界，加上“当今皇帝万万岁”的九龙牌位，报恩寺就有一万条龙啦~~又有“深山龙宫”之称。\n\n五、壁画。报恩寺的大雄宝殿和万佛阁内现存300多平方米的珍贵明代壁画。壁画不是单纯仅以笔画出，在壁画表面均贴上凹凸有致的金粉，细看是立体的。画法和敦煌壁画类似。可惜WG时期万佛阁的墙壁因为存储粮食，有很大面积都随意抹了石灰，非常可惜\n\n六、千手千眼观音。大悲阁内存有千手观音像一尊,高约9米，正身以整根金丝楠木精雕而成，身后呈扇形密布1004只手。每只手分别刻有一圆睁的慧眼。真是神工之作!\n', 14, 'cc', '2023-11-11 15:15:12.982', NULL, 3, 0, 0, NULL, 1);
INSERT INTO `article` VALUES (126, '四川古迹| 绵阳碧水寺，真的有点水。', '#寺庙#绵阳#古建筑', 'http://127.0.0.1:9090/uploads/articleCovers/1699687570594.png', '四川古迹| 绵阳碧水寺，真的有点水。\n碧水寺摩崖造像和刻经位于碧水寺观音殿内崖壁上，开凿于唐贞观初年，有25个龛窟，造像题材有阿弥陀佛与五十二菩萨、西方三圣等。\n\n碧水寺藏开元寺石刻圆雕菩萨立像，唐早期从绵州开元寺日址搬迁至碧水寺内，高3米有余，兼具北周晚期至隋代长安造像风格与北齐造像特征。碧水寺藏青义千佛崖造像，原位于涪城区西北7千米的千佛崖山腰，1993年因修建绵江高等级公路，将造像整体搬迁，重新镶嵌在寺内碧水崖.上。该造像始凿于唐代开元年间，延续开凿至广明年间，共有大小21个龛窟,题记6则。\n\n总体感觉，碧水寺这个“国保”项确实有点水，石刻确实是唐代石刻，保存得也还不错，不过体量确实太小了，这样的石刻大足、安岳还有一大批，也都只是省级水平。\n![](http://127.0.0.1:9090/uploads/articleImages/1699687488901.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699687488907.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699687488904.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699687488912.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699687488918.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699687488915.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699687488932.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699687488928.png)\n', 14, 'cc', '2023-11-11 15:27:39.522', NULL, 1, 0, 0, NULL, 1);
INSERT INTO `article` VALUES (127, '李杜祠', '古建筑院落', 'http://127.0.0.1:9090/uploads/articleCovers/1699688025132.png', '绵阳城区唯一- 可以上房顶拍摄的古建筑点\n\n这里是绵阳很冷门的一个古建筑院落李杜祠，位于游仙区东津路，院子不算特别大但是游客很少、也比较安静!\n为纪念李白、杜甫两位大诗人所建，白色的东津门坊还有一点徽式建筑的感觉，院内还有-个类似戏台的场所，院内中央是一条狭长的亭子和走廊 ,最惊喜的地方就拐角处有楼梯可以上到阁楼上拍摄到房顶屋脊瓦片的感觉.\n![](http://127.0.0.1:9090/uploads/articleImages/1699687953070.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699687953074.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699687953057.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699687953060.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699687953065.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699687953068.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699687953086.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699687953088.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699687953081.png)\n', 14, 'cc', '2023-11-11 15:35:05.886', NULL, 2, 0, 0, NULL, 1);
INSERT INTO `article` VALUES (128, '传统建筑构件之美一', '古建筑传统建筑构件之美古建筑营造一传统建筑构件之美', 'http://127.0.0.1:9090/uploads/articleCovers/1699688403525.png', '古建筑传统建筑构件之美古建筑营造一传统建筑构件之美\n\n中国古建筑的历史源远流长，宫殿、陵墓、庙宇、园林、民宅。几千年来，建筑杰作不断涌现。中国古代建筑优美柔和的轮廓、变化多样的形式令人赞叹。这些特色的古建筑构件，你了解多少?\n\n●飞檐\n\n飞檐是中国传统建筑的一大特色，多指屋檐翼角向上 翘起，如飞举之势，《诗经》 有云“如鸟斯革，如翠斯飞”。它是中国古代建筑在檐部上的一种特殊处理和创造，常用在亭亭、台、楼、阁、宫殿、庙宇的屋顶转角处。通过檐部.上的这种特殊处理和创造，不但扩大了采光面、有利于排泄雨水，而且增添了建筑物向上的动感，仿佛是一种气将屋檐向.上托举，建筑群中层层叠叠的~飞檐更是营造出壮观的气势和中国古建筑特有的~飞动轻快的韵味。\n![](http://127.0.0.1:9090/uploads/articleImages/1699688326423.png)\n●斗拱\n\n斗拱，又作斗拱，别称斗科、樽栌，是中国木构架建筑结构的关键性部件，在横粱和立柱之间挑出以承< 重，将屋檐的荷载经斗拱传递到立柱。斗拱又有- -定的装饰作用，是中国古典建筑显著特征之一。\n![](http://127.0.0.1:9090/uploads/articleImages/1699688326432.png)\n●雀替\n\n所谓雀替，鸟雀替木，通常被置于建筑的横材(梁、枋)与竖材(柱)相交处，作用是缩短梁枋的净跨度从而增强梁枋的荷载力;减少梁与柱相接处的向下剪力;防止横竖构材间的角度之倾斜。其制作材料由该建筑所用的主要建材所决定，如木建筑.上用木雀替,石建筑上用石雀替。雀替的雏形在唐代之前就已出现，在宋代的《营造法式》中叫“绰幕”，有龙、凤、仙鹤、花鸟、花篮、金蟾等各种形式。雀替除了具有一-定的承重作用外，还可以减少梁、枋的跨距或是增加梁头的抗剪能力。\n![](http://127.0.0.1:9090/uploads/articleImages/1699688326427.png)\n', 14, 'msglbo', '2023-11-11 15:43:37.600', NULL, 0, 0, 0, NULL, 1);
INSERT INTO `article` VALUES (129, '传统建筑构件之美二', '古建筑传统建筑构件之美古建筑营造一传统建筑构件之美', 'http://127.0.0.1:9090/uploads/articleCovers/1699688973684.png', '古建筑传统建筑构件之美古建筑营造一传统建筑构件之美\n\n中国古建筑的历史源远流长，宫殿、陵墓、庙宇、园林、民宅。几千年来，建筑杰作不断涌现。中国古代建筑优美柔和的轮廓、变化多样的形式令人赞叹。这些特色的古建筑构件，你了解多少?\n雀替\n\n所谓雀替，鸟雀替木，通常被置于建筑的横材(梁、枋)与竖材(柱)相交处，作用是缩短梁枋的净跨度从而增强梁枋的荷载力;减少梁与柱相接处的向下剪力;防止横竖构材间的角度之倾斜。其制作材料由该建筑所用的主要建材所决定，如木建筑.上用木雀替,石建筑上用石雀替。雀替的雏形在唐代之前就已出现，在宋代的《营造法式》中叫“绰幕”，有龙、凤、仙鹤、花鸟、花篮、金蟾等各种形式。雀替除了具有一-定的承重作用外，还可以减少梁、枋的跨距或是增加梁头的抗剪能力。\n![](http://127.0.0.1:9090/uploads/articleImages/1699688675782.png)\n鸱吻\n\n鸱吻，又名螭吻、鸱尾，为中国神兽，龙的第九子。中国古建筑的岔脊上多有装饰小兽，在房脊.上安两个相对的鸱吻，不仅能加固房脊，还有避火灾之意。唐代木构建筑的鸱吻一般作鸱鸟嘴或鸱鸟尾状。\n\n\n![](http://127.0.0.1:9090/uploads/articleImages/1699688675792.png)\n', 14, 'msglbo', '2023-11-11 15:49:58.120', NULL, 0, 0, 0, NULL, 1);
INSERT INTO `article` VALUES (88, '诗心艺境---何多俊李白杜甫诗诗意画白图展', '诗心艺境', 'http://127.0.0.1:9090/uploads/articleCovers/1697001733436.png', '“诗心艺境——何多俊李白杜甫诗意画百图展”共展出何多俊先生三年来艺术精品100幅，作品描绘了画家心中的“李杜”诗意，传达了他对文化先贤的敬仰与热爱，展现了绵阳厚重的历史文化底蕴。这批呕心沥血之作，画风独特，造型朴拙，笔墨凝重，设色明丽，气势恢宏，令人震撼。一幅幅精品力作，带给观者诸多的思考，耐人回味。\n![](http://127.0.0.1:9090/uploads/articleImages/1697001846210.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697001846212.png)\n', 13, 'msglbo', '2013-12-27 21:14:17', '2023-02-15 15:01:18', 490, 379, 0, NULL, 1);
INSERT INTO `article` VALUES (89, '诗词中的绵阳-涪城', '诗词中的绵阳', 'http://127.0.0.1:9090/uploads/articleCovers/1697012579059.png', '诗词中的绵阳-涪城\n别称 涪城、绵州\n![](http://127.0.0.1:9090/uploads/articleImages/1697012596262.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697012596267.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697012596259.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697012596257.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697012596271.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697012596265.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697012596278.png)\n', 13, 'msglbo', '2019-03-04 08:07:27', '2009-07-15 20:30:59', 962, 589, 0, NULL, 1);
INSERT INTO `article` VALUES (91, '绵阳|西山公园赏荷季! ', '赏荷季! ', 'http://127.0.0.1:9090/uploads/articleCovers/1697011347533.png', '绵阳|西山公园赏荷季! 在这里感受古韵荷香。\nHELLO！ 这里是绵山之南。\n又到一年赏荷季，\n在绵阳市区西山公园和\n富乐山公园是首选。\n今天先来看看西山公园。\n西山公园的荷花，种植时间更久，色彩更丰富，再加上亭台楼阁，比富乐山更适合打卡拍照。\n两个赏荷点:\n山顶的凤尾湖\n这里人少，花多，色彩主要以红色荷花、黄色荷花、粉色荷花，还有很多混色的荷花，很有特色。\n山下的玉女湖\n花更高，更好取景，花的颜色以粉色白色为主。同样的亭台楼阁，也很出片。\n![](http://127.0.0.1:9090/uploads/articleImages/1697011365810.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697011365813.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1697011365818.png)\n', 13, 'msglbo', '2001-05-03 06:48:34', '2009-09-11 16:12:36', 35, 227, 0, NULL, 1);
INSERT INTO `article` VALUES (98, '“追光逐影-花鸟怡情”主题摄影作品展', '追光逐影-花鸟怡情', 'http://127.0.0.1:9090/uploads/articleCovers/1697002164145.png', '展览介绍为展现自然界生命的精彩，展现人与自然的和谐之道，让市民通过视觉艺术感受到全市良好的生态环境，以及更直观地认识鸟类及它们的生存环境，进一步宣传和倡导生态保护理念。绵阳市文化馆、绵阳市群众文化学会、绵阳市青年摄影家协会共同举办“追光逐影 花鸟怡情”主题摄影作品展，此次展出优秀摄影作品近60幅，大部分为绵阳市青年摄影家协会会员作品，艺术家们用镜头完美地定格了植物和鸟类的瞬间艺术之美！\n\n部分作品欣赏：\n![](http://127.0.0.1:9090/uploads/articleImages/1697002234292.png)\n作品名称：《恋》\n拍摄者：廖振兴\n![](http://127.0.0.1:9090/uploads/articleImages/1697002234297.png)\n作品名称：《柿柿如意》\n    拍摄者：余运强\n![](http://127.0.0.1:9090/uploads/articleImages/1697002234293.png)\n作品名称：《相思鸟》\n拍摄者：陈俊\n![](http://127.0.0.1:9090/uploads/articleImages/1697002255602.png)\n作品名称：《新宿莱》\n拍摄者：杨媛媛\n\n', 16, 'msglbo', '2021-06-14 06:01:24', '2020-03-13 08:26:22', 536, 504, 0, NULL, 1);
INSERT INTO `article` VALUES (130, '滕王阁', '落霞与孤鹜齐~飞，秋水共长天一色', 'http://127.0.0.1:9090/uploads/articleCovers/1699689187141.png', '落霞与孤鹜齐~飞，秋水共长天一色\n\n“诗人笔下的滕王阁究竟有多美”!因初唐诗人王勃所作《滕王阁序》而闻名于世，是中国古代四大名楼之一、“中国十大历史文化名楼”之一、世称“西江第一楼。\n![](http://127.0.0.1:9090/uploads/articleImages/1699689152682.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699689152692.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699689152699.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699689152707.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699689152714.png)\n', 14, 'msglbo', '2023-11-11 15:53:13.319', NULL, 0, 0, 0, NULL, 1);
INSERT INTO `article` VALUES (131, '鸿恩寺', '古建筑|有名无“寺” 的一座重庆寺庙', 'http://127.0.0.1:9090/uploads/articleCovers/1699689419269.png', '古建筑|有名无“寺” 的一座重庆寺庙\n\n鸿恩寺虽叫“寺’却并没有庙宇，关于这- -现象还有个历史传说呢!\n\n。相传明朝时期，建文帝为了躲避追杀---路逃至重庆龙脊山，走投无路之时被观音菩萨的十九只鸿雁所救，为了报答鸿雁的搭救之恩，就在山上建了一座寺庙取名“鸿恩寺”，里边供奉的正是观音菩萨。\n\n。清朝乾隆年间，重庆遭遇地震引发山火，鸿恩寺被烧毁。里边的经书、铜钟都被转运到了位于龙脊山对面的大龙山双龙寺，这一放就放到了道光年间。\n\n。后来乡民自发组织重建鸿恩寺，将铜钟接了回来,却把经书留给了双龙寺，这样两地的老百姓都可以共同沐浴观音菩萨的鸿恩。\n\n。天有不测风云，直至20世纪中期，鸿恩寺和双龙寺先后被毁，再也没有重建，龙脊山_上的鸿恩寺名就这样被保留了下来。\n\n现在的鸿恩寺虽不再是宗教重地，却被划为重庆市主要城市公园之一，是观景游玩的好去处。\n\n![](http://127.0.0.1:9090/uploads/articleImages/1699689300477.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699689300488.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699689300479.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699689300486.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699689300482.png)\n', 14, 'msglbo', '2023-11-11 15:57:35.136', NULL, 0, 0, 0, NULL, 1);
INSERT INTO `article` VALUES (132, '青砖黛瓦马头墙回廊花落花格窗', '古建筑之美-马头墙', 'http://127.0.0.1:9090/uploads/articleCovers/1699689736080.png', '青砖黛瓦马头墙回廊花落花格窗\n\n古建筑之美-马头墙\n\n马头墙也称作风火墙、防火墙、封火墙，其是赣派建筑、徽派建筑中的重要特色。\n![](http://127.0.0.1:9090/uploads/articleImages/1699689642700.png)\n■马头墙特指高于 两山墙屋面的墙垣，也就是山墙的墙顶部分，其造型丰富多样，翘首长空，既可防火，又可防风。\n\n■个马头墙是以其形命名，既可以是两幢房子之间的防火墙，也可以是一般山墙。防火墙就不一-定是马头墙，女儿墙、兜儿墙等高出瓦面能起隔离火源作用的均可。\n\n■江南传统民居建筑的墙体之所以采取这种形式，主要是因为在聚族而居的村落中，民居建筑密度较大，不利于防火的矛盾比较突出，火灾发生时，火势容易顺房蔓延。而在居宅的两山墙顶部砌筑有高出屋面的马头墙，则可以应村落房屋密集防火、防风之需，在相邻民居发生火灾的情况下，起着隔断火源的.作用。久而久之，就形成一种特殊风格了。\n■而在古代，徽州男子十二三岁便背井离乡踏上商路，马头墙是家人们望远盼归的物化象征，看到这种错落有致，黑白辉映的马头墙，也会使人得到一种明朗素雅和层次分明的韵律美的享受。\n\n■马头墙墙头都高出于屋顶，轮廓作阶梯状，脊檐长短随着房屋的进深而变化。\n\n多檐变化的马头墙在江南民居中广泛地被采用，有一阶、二阶、三阶、四阶之分，也可称为一叠式、两叠式、三叠式、四叠式，通常三阶、四阶更常见，马头墙的叠数可多至五叠，俗称五岳朝天。\n\n■较大的民居， 砖墙墙面以白灰粉刷，墙头覆以青瓦两坡墙檐，白墙青瓦，明朗而雅素。马头墙的构造为随屋面坡度层层迭落，以斜坡长度定为若干档，墙顶挑三线排檐砖，上覆以小青瓦，并在每只垛头顶端安装搏风板(金花板)。其上安各种苏样座头(马头),有鹊尾式、印斗式、坐吻式等数种。\n\n![](http://127.0.0.1:9090/uploads/articleImages/1699689642706.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699689642713.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699689642711.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699689642704.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699689642715.png)\n', 14, 'msglbo', '2023-11-11 16:02:27.132', NULL, 0, 0, 0, NULL, 1);
INSERT INTO `article` VALUES (104, '绵阳市文化创意平台祝大家中秋、国庆快乐！', '双节同庆', 'http://127.0.0.1:9090/uploads/articleCovers/1697000764799.png', '国庆又逢中秋月圆\n伟大祖国大好河山\n蒸蒸日上繁荣富强\n神州共奔富丽康庄\n![](http://127.0.0.1:9090/uploads/articleImages/1697001434753.png)\n', 13, 'msglbo', '2000-07-05 18:21:28', '2023-03-29 11:36:03', 271, 875, 0, NULL, 1);
INSERT INTO `article` VALUES (123, '盐亭县华严村字库塔', ' #古建筑#绵阳旅行', 'http://127.0.0.1:9090/uploads/articleCovers/1699685268251.png', '盐亭县华严村字库塔\n![](http://127.0.0.1:9090/uploads/articleImages/1699685303866.png)\n华严村字库塔建于清光绪十八年，由当地寇姓家族捐资兴建。字库塔平面六角形，高5层，塔身采用石雕、砖雕、灰塑、嵌瓷、彩绘等多种装饰手法，秀丽华美。\n华严村字库塔作为“盐亭字库塔群”的组成部分,于2019年公布为第九批四川省文物保护单位。\n![](http://127.0.0.1:9090/uploads/articleImages/1699685303874.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699685303886.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699685303877.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699685303880.png)\n', 14, 'msglbo', '2023-11-11 14:49:22.386', NULL, 1, 0, 0, NULL, 1);
INSERT INTO `article` VALUES (108, '“艺荟时光”全民艺术普及系列公益讲座', '钢琴公益讲座', 'http://127.0.0.1:9090/uploads/articleCovers/1697003210721.png', '为充分发挥文化馆公共文化服务职能，推进文化馆免费开放和艺术普及工作，提升市民群众的音乐艺术素养，着力于提高我市钢琴爱好者、钢琴辅导老师的演奏和教学水平，领略钢琴表演艺术的无限魅力，让艺术走进百姓生活，特举办本次讲座。\n![](http://127.0.0.1:9090/uploads/articleImages/1697003229080.png)\n', 13, 'msglbo', '2017-12-16 21:09:31', '2019-08-13 14:16:16', 756, 287, 0, NULL, 1);
INSERT INTO `article` VALUES (153, '测试专辑文章', '测试专辑文章', 'http://127.0.0.1:9090/uploads/articleCovers/1706452710526.jpg', '123123123123', 15, 'msglbo', '2024-01-28 22:38:33.480', NULL, 8, 0, 0, 3, 0);
INSERT INTO `article` VALUES (154, '123123', '123123', 'http://127.0.0.1:9090/uploads/articleCovers/1709985110173.jpg', '123123123', 15, 'msglbo', '2024-03-09 19:51:51.401', NULL, 1, 0, 0, 5, 0);

-- ----------------------------
-- Table structure for avatars
-- ----------------------------
DROP TABLE IF EXISTS `avatars`;
CREATE TABLE `avatars`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `only_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of avatars
-- ----------------------------
INSERT INTO `avatars` VALUES (36, 'http://127.0.0.1:9090/uploads/avatars/1695140595008.jpg', 'banana', 'a137fa8c-e2ae-4104-97b0-d37210cdedb9');
INSERT INTO `avatars` VALUES (37, 'http://127.0.0.1:9090/uploads/avatars/1695140624989.png', 'msglbo', '191f46a0-6407-4bf0-b311-7404e62aed2a');
INSERT INTO `avatars` VALUES (38, 'http://127.0.0.1:9090/uploads/avatars/1695146176848.jpg', 'banana', '26af55db-4b6e-40b2-8612-9fba84e2dae4');
INSERT INTO `avatars` VALUES (39, 'http://127.0.0.1:9090/uploads/avatars/1695479880932.png', 'msglbo', '46b523ba-8992-46aa-a269-6dbe4f764296');
INSERT INTO `avatars` VALUES (40, 'http://127.0.0.1:9090/uploads/avatars/1697000909690.png', 'msglbo', 'ce33633b-b77d-4d38-b32d-12309ec0e6d4');
INSERT INTO `avatars` VALUES (41, 'http://127.0.0.1:9090/uploads/avatars/1697004830543.png', 'abc', '3d2549a6-ada3-41b0-9703-192d766a440e');
INSERT INTO `avatars` VALUES (42, 'http://127.0.0.1:9090/uploads/avatars/1697457799914.png', 'msglbo', 'a29b1381-5025-4800-aecf-a5ce3b8d6eca');
INSERT INTO `avatars` VALUES (43, 'http://127.0.0.1:9090/uploads/avatars/1697599102200.png', 'msglbo', '3e80f639-1f13-445c-9209-589c1e6e7166');
INSERT INTO `avatars` VALUES (44, 'http://127.0.0.1:9090/uploads/avatars/1697782191600.png', 'cc', '6a7bf2f4-1fd1-402b-aa95-0dc799a50e27');
INSERT INTO `avatars` VALUES (45, 'http://127.0.0.1:9090/uploads/avatars/1700572083637.jpg', 'msglbo', '96edcf5c-aa5b-4823-9ee6-0fafcab154fb');
INSERT INTO `avatars` VALUES (46, 'http://127.0.0.1:9090/uploads/avatars/1700575306676.jpg', 'test11', '70f30362-1298-4111-98f7-cbe37c8ecb35');

-- ----------------------------
-- Table structure for campaigns
-- ----------------------------
DROP TABLE IF EXISTS `campaigns`;
CREATE TABLE `campaigns`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_time` bigint(20) NOT NULL,
  `end_time` bigint(20) NOT NULL,
  `join_num` int(11) NULL DEFAULT 0,
  `cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of campaigns
-- ----------------------------
INSERT INTO `campaigns` VALUES (22, '“亭”你会如何写？', '“亭”你会如何写？\n亭子，像是天地早已埋伏好的线索；\n“亭” 文案积累  亭子亦是自然的穴位。\n![](http://127.0.0.1:9090/uploads/articleImages/1699851600250.png)\n# 参与活动的用户 发布的作品 需要有个跟活动标题一样的关键词\n### 如: “亭”你会如何写？', 1697047059828, 1760637459000, 2, 'http://127.0.0.1:9090/uploads/articleCovers/1699851618343.png', 'msglbo');
INSERT INTO `campaigns` VALUES (23, '中秋诗词大会', '# 中秋诗词大会\n中秋当属最有诗意的节日，这些关于中秋节的诗词，你能答对几道？\n快来参加一场线上的中秋诗词大会，测测你是不是诗词达人\n![](http://127.0.0.1:9090/uploads/articleImages/1699855815220.png)\n', 1697047220000, 1729792814000, 2, 'http://127.0.0.1:9090/uploads/articleCovers/1699855851423.png', 'msglbo');
INSERT INTO `campaigns` VALUES (4, '月下猜成语', '##月下猜成语\n你知道关于中秋的词语吗？\n如果要用emoji表情猜成语，阁下又该如何应对呢？\n和你的加入朋友一起，试试这场别开生面的猜成语游戏吧1\n![](http://127.0.0.1:9090/uploads/articleImages/1699855990868.png)\n', 1690865796000, 1693439135000, 20, 'http://127.0.0.1:9090/uploads/articleCovers/1699856035336.png', 'msglbo');
INSERT INTO `campaigns` VALUES (5, '歌声见明月', '##### 歌声见明月\n自古以来，和“月”有关的歌曲有很多，这些耳熟能详的金曲，我才你一定听过！\n听歌曲，猜歌名，一起回忆难忘的中秋旋律！\n![](http://127.0.0.1:9090/uploads/articleImages/1699856297900.png)\n', 1701445040000, 1702607400000, 9, 'http://127.0.0.1:9090/uploads/articleCovers/1699856394618.png', 'msglbo');
INSERT INTO `campaigns` VALUES (6, '月字中谜', '####### 月中字谜\n中秋佳节，这个中秋祝福真的好有趣！\n看图片，解字谜，祝福就藏在月亮的影子里，快来试试看吧！\n![](http://127.0.0.1:9090/uploads/articleImages/1699856661079.png)\n', 1693497600000, 1695348000000, 13, 'http://127.0.0.1:9090/uploads/articleCovers/1699856708260.png', 'msglbo');
INSERT INTO `campaigns` VALUES (25, '时光有信', '书信承载了无尽的情感寄托与牵挂，在交通不发达，通信不方便的古代社会，这份感情尤为珍贵，收到的信件是承载了我们美好的回忆。时光有信，三生“有信”，从远方送来的每一封都有幸，传递幸福，传递爱心！\n\n![](http://127.0.0.1:9090/uploads/articleImages/1699851335115.png)\n![](http://127.0.0.1:9090/uploads/articleImages/1699851335119.png)\n', 1699851018000, 1700887547000, 0, 'http://127.0.0.1:9090/uploads/articleCovers/1699851353308.png', 'msglbo');
INSERT INTO `campaigns` VALUES (8, '月亮别称知多少', '月亮别称知多少\n月亮的别称有很多，除了“玉兔”、“婵娟”之外，你还知道哪些？猜月亮别称，了解更多月亮知识，过一个有意义的中秋节！\n![](http://127.0.0.1:9090/uploads/articleImages/1699856852326.png)\n', 1689393600000, 1690545600000, 10, 'http://127.0.0.1:9090/uploads/articleCovers/1699856874463.png', 'msglbo');
INSERT INTO `campaigns` VALUES (9, '中秋灯谜猜猜猜', '中秋灯谜猜猜猜\n举办一场线上的中秋灯谜会是什么体验？\n根据题目要求，猜和中秋有关的词语或歇后语!\n[](http://127.0.0.1:9090/uploads/articleImages/1699857024358.png)\n', 1698840000000, 1700481600000, 11, 'http://127.0.0.1:9090/uploads/articleCovers/1699857060460.png', 'msglbo');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (12, '非遗传承');
INSERT INTO `category` VALUES (13, '现代艺术');
INSERT INTO `category` VALUES (14, '建筑设计');
INSERT INTO `category` VALUES (15, '工业设计');
INSERT INTO `category` VALUES (16, '插画设计');
INSERT INTO `category` VALUES (21, '萌宠哈基米');

-- ----------------------------
-- Table structure for collect_article
-- ----------------------------
DROP TABLE IF EXISTS `collect_article`;
CREATE TABLE `collect_article`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NULL DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of collect_article
-- ----------------------------
INSERT INTO `collect_article` VALUES (2, 40, 'msglbo');
INSERT INTO `collect_article` VALUES (3, 41, 'msglbo');
INSERT INTO `collect_article` VALUES (6, 68, 'msglbo');
INSERT INTO `collect_article` VALUES (8, 55, 'msglbo');
INSERT INTO `collect_article` VALUES (9, 52, 'msglbo');
INSERT INTO `collect_article` VALUES (10, 38, 'msglbo');
INSERT INTO `collect_article` VALUES (13, 72, 'msglbo');
INSERT INTO `collect_article` VALUES (15, 154, 'msglbo');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (2, 111, '123', 'msglbo', 1695401701461);
INSERT INTO `comment` VALUES (3, 106, '测试测试', 'msglbo', 1695462411710);
INSERT INTO `comment` VALUES (5, 106, '收藏', 'msglbo', 1697000701027);
INSERT INTO `comment` VALUES (6, 88, '额4646', 'msglbo', 1697000735086);
INSERT INTO `comment` VALUES (7, 104, '节日快乐', 'msglbo', 1697001473455);
INSERT INTO `comment` VALUES (8, 88, '咳咳咳咳咳咳咳', 'msglbo', 1697001898369);
INSERT INTO `comment` VALUES (9, 40, '棒\n', 'msglbo', 1697002766245);
INSERT INTO `comment` VALUES (10, 42, '哇塞', 'abc', 1697004859733);
INSERT INTO `comment` VALUES (11, 42, '哇', 'abc', 1697004864592);
INSERT INTO `comment` VALUES (12, 67, '好看', 'abc', 1697004874277);
INSERT INTO `comment` VALUES (13, 117, '耶', 'abc', 1697008362094);
INSERT INTO `comment` VALUES (14, 64, '诗', 'abc', 1697009473049);
INSERT INTO `comment` VALUES (15, 122, '千里江山图', 'msglbo', 1697010048719);
INSERT INTO `comment` VALUES (16, 109, '123', 'msglbo', 1697024984565);
INSERT INTO `comment` VALUES (17, 72, '哇', 'msglbo', 1697457774015);
INSERT INTO `comment` VALUES (18, 108, '我要报名', 'msglbo', 1697599386842);
INSERT INTO `comment` VALUES (19, 68, '测试\n', 'msglbo', 1697606985279);
INSERT INTO `comment` VALUES (20, 68, '222', 'abc', 1697607016603);
INSERT INTO `comment` VALUES (21, 122, '来来来\n', 'msglbo', 1697780787725);
INSERT INTO `comment` VALUES (22, 121, '棒', 'msglbo', 1697780814822);
INSERT INTO `comment` VALUES (23, 121, '测试', 'cc', 1697782261373);
INSERT INTO `comment` VALUES (24, 68, '3333', 'cc', 1697782269380);
INSERT INTO `comment` VALUES (25, 52, '5555', 'cc', 1697782277891);
INSERT INTO `comment` VALUES (26, 91, '666666', 'cc', 1697782284175);
INSERT INTO `comment` VALUES (27, 118, '9999', 'cc', 1697782291234);
INSERT INTO `comment` VALUES (28, 118, '9999方', 'cc', 1697782299937);
INSERT INTO `comment` VALUES (29, 42, '5555', 'cc', 1697782307617);
INSERT INTO `comment` VALUES (30, 58, 'cc', 'cc', 1697782517744);
INSERT INTO `comment` VALUES (31, 40, 'cc', 'cc', 1697782522568);
INSERT INTO `comment` VALUES (32, 108, 'cc', 'cc', 1697782526358);
INSERT INTO `comment` VALUES (33, 64, 'cc', 'cc', 1697782537185);
INSERT INTO `comment` VALUES (34, 124, '哇', 'cc', 1699686358255);
INSERT INTO `comment` VALUES (35, 124, '哇', 'cc', 1699686360627);
INSERT INTO `comment` VALUES (36, 154, '123123123', 'msglbo', 1709985117025);

-- ----------------------------
-- Table structure for images
-- ----------------------------
DROP TABLE IF EXISTS `images`;
CREATE TABLE `images`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `only_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 484 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of images
-- ----------------------------
INSERT INTO `images` VALUES (83, 'd1722dd9-ab71-42d9-bccd-768622079f43', 'http://127.0.0.1:9090/uploads/articleCovers/1695311629427.jpg');
INSERT INTO `images` VALUES (84, '287df051-aa77-4fc7-9fef-163a0d056bfb', 'http://127.0.0.1:9090/uploads/articleImages/1695471627663.png');
INSERT INTO `images` VALUES (85, '853a8431-a39c-402c-81ce-473b94883490', 'http://127.0.0.1:9090/uploads/articleCovers/1696998972832.png');
INSERT INTO `images` VALUES (86, '7ac39fbe-18ae-44c1-b41a-9aace49aea9e', 'http://127.0.0.1:9090/uploads/articleCovers/1696999090265.png');
INSERT INTO `images` VALUES (87, 'dec3c35f-f25a-4132-9a5d-a034f7395161', 'http://127.0.0.1:9090/uploads/articleCovers/1696999177596.png');
INSERT INTO `images` VALUES (88, 'dc7bba85-dbc1-46eb-81ff-da1fbf9c374a', 'http://127.0.0.1:9090/uploads/articleCovers/1696999206635.png');
INSERT INTO `images` VALUES (89, 'f21eea10-d47d-4626-a94c-bfafa0e74002', 'http://127.0.0.1:9090/uploads/articleCovers/1696999334968.png');
INSERT INTO `images` VALUES (90, '72dc686f-699c-4292-a17e-6b1ca5092bed', 'http://127.0.0.1:9090/uploads/articleCovers/1697000629837.png');
INSERT INTO `images` VALUES (91, 'edb34480-de31-4460-b9d1-da60a3bed041', 'http://127.0.0.1:9090/uploads/articleCovers/1697000764799.png');
INSERT INTO `images` VALUES (92, 'a091192f-5f7c-461c-9e82-8a36d701ff01', 'http://127.0.0.1:9090/uploads/articleCovers/1697000804000.png');
INSERT INTO `images` VALUES (93, '5a3f0816-ad56-48b5-bc8d-a1f62f672f45', 'http://127.0.0.1:9090/uploads/articleImages/1697001434753.png');
INSERT INTO `images` VALUES (94, '6dd040a1-be68-416b-bc80-b1369a70d136', 'http://127.0.0.1:9090/uploads/articleCovers/1697001733436.png');
INSERT INTO `images` VALUES (95, 'e58122c3-1c7a-4938-bb39-a96f77f3d4e4', 'http://127.0.0.1:9090/uploads/articleImages/1697001846210.png');
INSERT INTO `images` VALUES (96, 'a65c41cf-7abb-4de3-983f-683e2e82693a', 'http://127.0.0.1:9090/uploads/articleImages/1697001846212.png');
INSERT INTO `images` VALUES (97, 'd50cfe86-2c51-4869-b129-378a1abf29f2', 'http://127.0.0.1:9090/uploads/articleCovers/1697002164145.png');
INSERT INTO `images` VALUES (98, '8eb9fd88-cbb1-4de3-9211-4da2bef3d5a4', 'http://127.0.0.1:9090/uploads/articleImages/1697002234292.png');
INSERT INTO `images` VALUES (99, 'f416850a-9870-457c-a38e-4debf8888592', 'http://127.0.0.1:9090/uploads/articleImages/1697002234297.png');
INSERT INTO `images` VALUES (100, 'bf672b1e-379d-4814-bb5b-076e4afeeecc', 'http://127.0.0.1:9090/uploads/articleImages/1697002234293.png');
INSERT INTO `images` VALUES (101, '79b8626f-b944-461f-b2fe-e545b847c9d5', 'http://127.0.0.1:9090/uploads/articleImages/1697002255602.png');
INSERT INTO `images` VALUES (102, '3102c295-3ef2-4321-8890-2576527e7b10', 'http://127.0.0.1:9090/uploads/articleCovers/1697002671687.png');
INSERT INTO `images` VALUES (103, '9340df6a-5f8c-47fe-beb5-e3ee5dbcc2d3', 'http://127.0.0.1:9090/uploads/articleImages/1697002702963.png');
INSERT INTO `images` VALUES (104, 'd375d601-b98a-4f83-ad3b-72ad5a14caa0', 'http://127.0.0.1:9090/uploads/articleImages/1697002702968.png');
INSERT INTO `images` VALUES (105, 'cfefe45d-b7f2-4d8f-adec-c7ae98a0b3f3', 'http://127.0.0.1:9090/uploads/articleImages/1697002702965.png');
INSERT INTO `images` VALUES (106, '23bc0d00-fa7f-4300-bfab-e5feb94d96d3', 'http://127.0.0.1:9090/uploads/articleCovers/1697003019589.png');
INSERT INTO `images` VALUES (107, 'b05e42db-a621-41ac-88ee-1c3c03b89820', 'http://127.0.0.1:9090/uploads/articleImages/1697003040732.png');
INSERT INTO `images` VALUES (108, 'dc50355e-e1c0-4647-8a94-eb468a82a3a3', 'http://127.0.0.1:9090/uploads/articleCovers/1697003210721.png');
INSERT INTO `images` VALUES (109, '1ea1eb42-44bb-4995-83d5-9a81b49fbb8a', 'http://127.0.0.1:9090/uploads/articleImages/1697003229080.png');
INSERT INTO `images` VALUES (110, '226c0357-0995-435d-981f-f19b5516c983', 'http://127.0.0.1:9090/uploads/articleCovers/1697003340913.png');
INSERT INTO `images` VALUES (111, 'a87dbcf6-205b-40f7-95d3-a81c87894235', 'http://127.0.0.1:9090/uploads/articleImages/1697003362682.png');
INSERT INTO `images` VALUES (112, 'b74179ac-1b12-4c94-9cf5-1a190f6cc7c1', 'http://127.0.0.1:9090/uploads/articleCovers/1697003791877.png');
INSERT INTO `images` VALUES (113, '731b5d32-a7ff-4a33-8c53-df2db3d1db34', 'http://127.0.0.1:9090/uploads/articleImages/1697003807928.png');
INSERT INTO `images` VALUES (114, '2a2e608e-8d85-4fd1-8975-074f65f659d5', 'http://127.0.0.1:9090/uploads/articleImages/1697003807931.png');
INSERT INTO `images` VALUES (115, '0f3d234a-fda3-4db8-b674-c97e329fb8b7', 'http://127.0.0.1:9090/uploads/articleImages/1697003807934.png');
INSERT INTO `images` VALUES (116, 'd2865e90-3514-4456-86f9-8f00686a1054', 'http://127.0.0.1:9090/uploads/articleImages/1697003807929.png');
INSERT INTO `images` VALUES (117, '69666f9e-5196-4754-b84d-aceaa85a13d0', 'http://127.0.0.1:9090/uploads/articleCovers/1697004201787.png');
INSERT INTO `images` VALUES (118, '6b1ef35c-7367-49c8-9213-aff7b87136b5', 'http://127.0.0.1:9090/uploads/articleImages/1697004259281.png');
INSERT INTO `images` VALUES (119, 'f3bbee85-cd3a-4e46-b021-153b27fb2ad8', 'http://127.0.0.1:9090/uploads/articleImages/1697004259289.png');
INSERT INTO `images` VALUES (120, '8c0f4776-d823-4bae-8fc7-a7029686512e', 'http://127.0.0.1:9090/uploads/articleImages/1697004259294.png');
INSERT INTO `images` VALUES (121, 'e38808b6-17c9-451c-8806-b03544e9342c', 'http://127.0.0.1:9090/uploads/articleImages/1697004259300.png');
INSERT INTO `images` VALUES (122, 'e994908d-c8dd-45b3-90ec-6b743c6b61d5', 'http://127.0.0.1:9090/uploads/articleCovers/1697004550724.png');
INSERT INTO `images` VALUES (123, '6f7cd6a2-8b3d-40e3-88cc-15fb342cfefe', 'http://127.0.0.1:9090/uploads/articleImages/1697004683410.png');
INSERT INTO `images` VALUES (124, '969766d4-5b0a-4011-9ece-02f7ab55a703', 'http://127.0.0.1:9090/uploads/articleImages/1697004683412.png');
INSERT INTO `images` VALUES (125, '71be5632-3672-4607-b292-278a915e72c8', 'http://127.0.0.1:9090/uploads/articleImages/1697004683414.png');
INSERT INTO `images` VALUES (126, '13d1ce41-4122-4b91-9428-1425600dd1da', 'http://127.0.0.1:9090/uploads/articleImages/1697004683407.png');
INSERT INTO `images` VALUES (127, 'b08f739f-dfef-4bf3-bcd1-fc990aa49291', 'http://127.0.0.1:9090/uploads/articleCovers/1697004907116.png');
INSERT INTO `images` VALUES (128, '47ff6fb1-3fa2-44f2-ae75-cb1955048ef6', 'http://127.0.0.1:9090/uploads/articleImages/1697004925857.png');
INSERT INTO `images` VALUES (129, 'df4f4692-e5ea-422c-a292-a1f2c0229a1f', 'http://127.0.0.1:9090/uploads/articleCovers/1697005419145.png');
INSERT INTO `images` VALUES (130, '55057645-d78a-4932-a325-1933ad8ed9ef', 'http://127.0.0.1:9090/uploads/articleImages/1697005436858.png');
INSERT INTO `images` VALUES (131, 'ddfaa638-2b29-4c05-bf98-b11c11f4b863', 'http://127.0.0.1:9090/uploads/articleImages/1697005436864.png');
INSERT INTO `images` VALUES (132, '8bcd20c7-3f37-465a-9558-d9d39cd7c6f5', 'http://127.0.0.1:9090/uploads/articleImages/1697005436860.png');
INSERT INTO `images` VALUES (133, 'bd14a52a-09ae-408d-b79c-a5ae93487604', 'http://127.0.0.1:9090/uploads/articleImages/1697005436867.png');
INSERT INTO `images` VALUES (134, '07e56a00-0bc5-4afb-8e47-88026956552c', 'http://127.0.0.1:9090/uploads/articleImages/1697005436869.png');
INSERT INTO `images` VALUES (135, '0d621c9d-58ad-4506-ad57-d2906176e195', 'http://127.0.0.1:9090/uploads/articleCovers/1697005794531.png');
INSERT INTO `images` VALUES (136, '63e3ebd7-95da-4841-8aa6-a1adbb16bd28', 'http://127.0.0.1:9090/uploads/articleImages/1697005825973.png');
INSERT INTO `images` VALUES (137, 'e31928e2-860a-4391-a605-e1d0723e4779', 'http://127.0.0.1:9090/uploads/articleImages/1697005825981.png');
INSERT INTO `images` VALUES (138, '7948e6c3-d5b1-48be-bb1a-2d1290738571', 'http://127.0.0.1:9090/uploads/articleImages/1697005825976.png');
INSERT INTO `images` VALUES (139, 'cb043d53-9cef-49b4-ac35-5c4aa18c04cc', 'http://127.0.0.1:9090/uploads/articleImages/1697005825978.png');
INSERT INTO `images` VALUES (140, '2cfe9a4b-353e-4f63-86e6-9f5d4a326634', 'http://127.0.0.1:9090/uploads/articleImages/1697005825983.png');
INSERT INTO `images` VALUES (141, '7b860f79-ff43-43f1-8a23-d189c3f75252', 'http://127.0.0.1:9090/uploads/articleImages/1697005825988.png');
INSERT INTO `images` VALUES (142, '716f812a-87e2-4b2b-8836-25eebddc9c32', 'http://127.0.0.1:9090/uploads/articleImages/1697005825990.png');
INSERT INTO `images` VALUES (143, '5c9be778-6c84-46fb-a05d-b35da85a5725', 'http://127.0.0.1:9090/uploads/articleCovers/1697006041457.png');
INSERT INTO `images` VALUES (144, '67a119ee-2f97-45fd-b2f6-8b29eebf7858', 'http://127.0.0.1:9090/uploads/articleImages/1697006121765.png');
INSERT INTO `images` VALUES (145, 'a4f416b4-f38a-49a5-8e5e-0fc9ab6cd59b', 'http://127.0.0.1:9090/uploads/articleImages/1697006121770.png');
INSERT INTO `images` VALUES (146, 'd804b1b1-34f1-4809-8b7f-8a07e81be68c', 'http://127.0.0.1:9090/uploads/articleImages/1697006121775.png');
INSERT INTO `images` VALUES (147, '6151b96c-3a5e-41fa-a3d6-78c11a15f77c', 'http://127.0.0.1:9090/uploads/articleImages/1697006121772.png');
INSERT INTO `images` VALUES (148, '067f4634-72d4-48ab-82ae-a2c47ea32880', 'http://127.0.0.1:9090/uploads/articleCovers/1697007643528.png');
INSERT INTO `images` VALUES (149, '08bdbbcf-25c4-4c7f-8539-a5a7548be6c6', 'http://127.0.0.1:9090/uploads/articleImages/1697007711326.png');
INSERT INTO `images` VALUES (150, '0f838acc-7cd0-4a81-9c92-d1709e36ec7e', 'http://127.0.0.1:9090/uploads/articleImages/1697007711350.png');
INSERT INTO `images` VALUES (151, 'afffda62-bedd-49ac-80ec-f6b02d834890', 'http://127.0.0.1:9090/uploads/articleImages/1697007711330.png');
INSERT INTO `images` VALUES (152, '2de3948c-ebad-4897-99ff-f2be979613ae', 'http://127.0.0.1:9090/uploads/articleImages/1697007711357.png');
INSERT INTO `images` VALUES (153, '713b605e-7b40-400c-994e-870426dd9590', 'http://127.0.0.1:9090/uploads/articleImages/1697007711352.png');
INSERT INTO `images` VALUES (154, '3b6f5d10-aa4d-4767-9085-b0b9b569f6be', 'http://127.0.0.1:9090/uploads/articleImages/1697007711355.png');
INSERT INTO `images` VALUES (155, '083d3a8b-65de-403f-a2be-4c001f685f6c', 'http://127.0.0.1:9090/uploads/articleCovers/1697008218135.png');
INSERT INTO `images` VALUES (156, '493db8b3-3d28-4cf4-81f3-32c4b6ba25c1', 'http://127.0.0.1:9090/uploads/articleImages/1697008265090.png');
INSERT INTO `images` VALUES (157, 'c02457cb-528c-4589-85a8-aecdf702c82c', 'http://127.0.0.1:9090/uploads/articleImages/1697008265100.png');
INSERT INTO `images` VALUES (158, '7e00cca2-0b8a-4e8c-9cf5-190841ba7ff7', 'http://127.0.0.1:9090/uploads/articleImages/1697008265093.png');
INSERT INTO `images` VALUES (159, '9121a6a8-99ec-4c8b-987e-157c23bf2aea', 'http://127.0.0.1:9090/uploads/articleImages/1697008265095.png');
INSERT INTO `images` VALUES (160, '8ef10d59-a58c-4295-ade9-9b36ea909911', 'http://127.0.0.1:9090/uploads/articleImages/1697008265102.png');
INSERT INTO `images` VALUES (161, '04256c5f-49b9-470b-88ab-1e14f74a6896', 'http://127.0.0.1:9090/uploads/articleImages/1697008265104.png');
INSERT INTO `images` VALUES (162, '15f3bad9-c316-4f0a-85ba-33936827b4da', 'http://127.0.0.1:9090/uploads/articleCovers/1697008575411.png');
INSERT INTO `images` VALUES (163, 'fc22815d-3f20-46e4-925a-6abb8bff2f99', 'http://127.0.0.1:9090/uploads/articleImages/1697008628143.png');
INSERT INTO `images` VALUES (164, 'b02ff51b-9e6b-479f-88f7-c5a6965a096f', 'http://127.0.0.1:9090/uploads/articleImages/1697008628149.png');
INSERT INTO `images` VALUES (165, '216d1bac-2ad7-42d1-91ca-7b8270d55802', 'http://127.0.0.1:9090/uploads/articleImages/1697008628144.png');
INSERT INTO `images` VALUES (166, 'd6804894-819b-4ecd-ba80-ef9583fbc210', 'http://127.0.0.1:9090/uploads/articleImages/1697008628146.png');
INSERT INTO `images` VALUES (167, '36c32385-b134-433d-9bae-42ca5ac22f6b', 'http://127.0.0.1:9090/uploads/articleCovers/1697008879961.png');
INSERT INTO `images` VALUES (168, '03b7d2f5-eec9-4696-887d-cb6d65ae75d1', 'http://127.0.0.1:9090/uploads/articleImages/1697008907729.png');
INSERT INTO `images` VALUES (169, '46e1fd65-2138-4d7f-857a-8ca5cb66af7d', 'http://127.0.0.1:9090/uploads/articleImages/1697008907732.png');
INSERT INTO `images` VALUES (170, '64c45511-9cb0-47a7-a7ec-ceb72d7392c3', 'http://127.0.0.1:9090/uploads/articleImages/1697008907736.png');
INSERT INTO `images` VALUES (171, '4832541d-b241-4776-a7bd-8c41f488c862', 'http://127.0.0.1:9090/uploads/articleImages/1697008907738.png');
INSERT INTO `images` VALUES (172, 'a08874ae-5196-4ecb-96d4-32387ba98c3b', 'http://127.0.0.1:9090/uploads/articleImages/1697008929601.png');
INSERT INTO `images` VALUES (173, '1fc57a55-b438-4d4d-bb93-ba2cef9a6d06', 'http://127.0.0.1:9090/uploads/articleImages/1697008938294.png');
INSERT INTO `images` VALUES (174, 'b4f7ec5a-a2a0-4072-a246-ce96dd7930df', 'http://127.0.0.1:9090/uploads/articleImages/1697008970867.png');
INSERT INTO `images` VALUES (175, '5b5d240c-cf76-4df4-a3a7-4da6b3478ebf', 'http://127.0.0.1:9090/uploads/articleImages/1697008970875.png');
INSERT INTO `images` VALUES (176, 'a2e7d465-ce05-4be8-b3f9-7873165a48d6', 'http://127.0.0.1:9090/uploads/articleImages/1697008970881.png');
INSERT INTO `images` VALUES (177, '77301b46-9e00-4f89-a140-188242cd78e6', 'http://127.0.0.1:9090/uploads/articleImages/1697008970887.png');
INSERT INTO `images` VALUES (178, 'bee0870c-8ad5-49dc-aeec-6d6f8c10066c', 'http://127.0.0.1:9090/uploads/articleImages/1697008992053.png');
INSERT INTO `images` VALUES (179, '8c1f7c8d-9699-4aa3-b171-e932d9e66ea1', 'http://127.0.0.1:9090/uploads/articleImages/1697009009729.png');
INSERT INTO `images` VALUES (180, 'e9d66ef4-5560-439e-b2ce-6ce333e45faf', 'http://127.0.0.1:9090/uploads/articleImages/1697009026393.png');
INSERT INTO `images` VALUES (181, '128950bf-8554-4a6a-9819-c41a245294ba', 'http://127.0.0.1:9090/uploads/articleImages/1697009042014.png');
INSERT INTO `images` VALUES (182, '4cb9e9cd-5009-48f2-a3fc-94e879046111', 'http://127.0.0.1:9090/uploads/articleImages/1697009268107.png');
INSERT INTO `images` VALUES (183, 'e88ea839-bc94-4b5b-99ff-6aee90899ccd', 'http://127.0.0.1:9090/uploads/articleImages/1697009268117.png');
INSERT INTO `images` VALUES (184, '840c5821-91fc-423b-a2af-20508e14a0c3', 'http://127.0.0.1:9090/uploads/articleImages/1697009268108.png');
INSERT INTO `images` VALUES (185, 'b1500076-3b70-424f-9dc8-6ad7a26c592b', 'http://127.0.0.1:9090/uploads/articleImages/1697009268110.png');
INSERT INTO `images` VALUES (186, '07dbddeb-14ea-4a63-9325-76dae923b1d9', 'http://127.0.0.1:9090/uploads/articleImages/1697009268112.png');
INSERT INTO `images` VALUES (187, '1f0e14d4-c717-4af8-bbaa-a88df5e5d0b3', 'http://127.0.0.1:9090/uploads/articleImages/1697009268120.png');
INSERT INTO `images` VALUES (188, '033d4ebb-b9c7-4d1c-97f8-28843664c0c8', 'http://127.0.0.1:9090/uploads/articleCovers/1697009347841.png');
INSERT INTO `images` VALUES (189, '4a14f6b2-0cc2-424e-9969-605afe894300', 'http://127.0.0.1:9090/uploads/articleImages/1697009705310.png');
INSERT INTO `images` VALUES (190, '982b669c-a811-4f00-bbf8-679975ddf9b5', 'http://127.0.0.1:9090/uploads/articleImages/1697009705313.png');
INSERT INTO `images` VALUES (191, 'd503b075-3bd1-4826-96de-390f3b5bdbe2', 'http://127.0.0.1:9090/uploads/articleImages/1697009705315.png');
INSERT INTO `images` VALUES (192, '20b9a3ce-9cf2-4865-8cc9-a8985e2ef274', 'http://127.0.0.1:9090/uploads/articleImages/1697009705320.png');
INSERT INTO `images` VALUES (193, 'c167d2d1-692a-41f6-9a7e-b43c51a53253', 'http://127.0.0.1:9090/uploads/articleImages/1697009705323.png');
INSERT INTO `images` VALUES (194, '0847962c-a3c6-44ea-a8a1-5db31fb2d07e', 'http://127.0.0.1:9090/uploads/articleImages/1697009705326.png');
INSERT INTO `images` VALUES (195, '900c6f42-3843-47d2-935f-83d895c32e7d', 'http://127.0.0.1:9090/uploads/articleImages/1697009705332.png');
INSERT INTO `images` VALUES (196, '7b839ba2-86a6-4e89-ac48-b1ffba287952', 'http://127.0.0.1:9090/uploads/articleCovers/1697009716281.png');
INSERT INTO `images` VALUES (197, '9191cae0-34ca-4067-a995-0d31f88fb7ef', 'http://127.0.0.1:9090/uploads/articleCovers/1697010648629.png');
INSERT INTO `images` VALUES (198, '952e1264-209e-4805-af63-401e87e6bf04', 'http://127.0.0.1:9090/uploads/articleCovers/1697010657028.png');
INSERT INTO `images` VALUES (199, '79524e15-06c0-41ae-9cca-8dbccb733195', 'http://127.0.0.1:9090/uploads/articleImages/1697010687508.png');
INSERT INTO `images` VALUES (200, 'cbc9859c-c533-40c9-941a-8db28690b3d6', 'http://127.0.0.1:9090/uploads/articleImages/1697010687514.png');
INSERT INTO `images` VALUES (201, 'bc9cc25b-a68e-4480-9e3d-68f3b54fe2d3', 'http://127.0.0.1:9090/uploads/articleImages/1697010687511.png');
INSERT INTO `images` VALUES (202, 'f768ef14-4d1f-4747-a2fe-417422f618bb', 'http://127.0.0.1:9090/uploads/articleImages/1697010687516.png');
INSERT INTO `images` VALUES (203, '722fa72d-f1a3-4d1e-b118-51d20e97b0a3', 'http://127.0.0.1:9090/uploads/articleImages/1697010687519.png');
INSERT INTO `images` VALUES (204, '1c505282-adef-47fe-b59c-09f62e6b9cdc', 'http://127.0.0.1:9090/uploads/articleImages/1697010687521.png');
INSERT INTO `images` VALUES (205, '939dc5aa-e887-4c03-b2e0-8bdca4741958', 'http://127.0.0.1:9090/uploads/articleImages/1697010687526.png');
INSERT INTO `images` VALUES (206, '1150c075-9ac9-475c-93cc-3d1ac9f32d9c', 'http://127.0.0.1:9090/uploads/articleCovers/1697010940708.png');
INSERT INTO `images` VALUES (207, '5f892c0b-c449-44d1-9b32-91a1b4e938f0', 'http://127.0.0.1:9090/uploads/articleImages/1697010974010.png');
INSERT INTO `images` VALUES (208, 'b938038f-d92d-483f-b7f4-95c8c2150cd7', 'http://127.0.0.1:9090/uploads/articleImages/1697010974012.png');
INSERT INTO `images` VALUES (209, 'e5d0a14e-6572-4174-ada9-2e9b01a4182e', 'http://127.0.0.1:9090/uploads/articleImages/1697010974014.png');
INSERT INTO `images` VALUES (210, '9c5a54c2-676e-4aa7-9319-2dd7e1b34aab', 'http://127.0.0.1:9090/uploads/articleCovers/1697011331270.png');
INSERT INTO `images` VALUES (211, '8e1d1d2f-a53c-4cd9-8332-38694f49dd3e', 'http://127.0.0.1:9090/uploads/articleCovers/1697011347533.png');
INSERT INTO `images` VALUES (212, 'bccf8945-9fa4-4095-a503-ebad6d4a634c', 'http://127.0.0.1:9090/uploads/articleImages/1697011365810.png');
INSERT INTO `images` VALUES (213, 'a2206413-42fd-42df-a0e0-f843023a3a84', 'http://127.0.0.1:9090/uploads/articleImages/1697011365813.png');
INSERT INTO `images` VALUES (214, 'dba9795d-8dbf-48d5-b79e-27774920a95c', 'http://127.0.0.1:9090/uploads/articleImages/1697011365818.png');
INSERT INTO `images` VALUES (215, 'fb706cd1-8082-49d9-8969-4602b71e9bb0', 'http://127.0.0.1:9090/uploads/articleCovers/1697012221450.png');
INSERT INTO `images` VALUES (216, '0e8526b2-76b2-447b-b528-3c881b2954c5', 'http://127.0.0.1:9090/uploads/articleImages/1697012227207.png');
INSERT INTO `images` VALUES (217, '303b620a-4b57-4c40-a29b-dc027f1053fc', 'http://127.0.0.1:9090/uploads/articleImages/1697012275555.png');
INSERT INTO `images` VALUES (218, '8bc90e8e-7d8e-4a2d-ba35-fccd7541c614', 'http://127.0.0.1:9090/uploads/articleImages/1697012275564.png');
INSERT INTO `images` VALUES (219, '8fb8f23e-f0ec-4a7f-9187-1de612ae27bd', 'http://127.0.0.1:9090/uploads/articleImages/1697012275570.png');
INSERT INTO `images` VALUES (220, 'ae7cef67-1a17-4c5d-b758-e40797221692', 'http://127.0.0.1:9090/uploads/articleImages/1697012275577.png');
INSERT INTO `images` VALUES (221, 'cb6c649b-9366-4ecb-9bc6-9de81afb0577', 'http://127.0.0.1:9090/uploads/articleCovers/1697012579059.png');
INSERT INTO `images` VALUES (222, '332b54a1-790c-4603-b3f2-e929a16dc1d1', 'http://127.0.0.1:9090/uploads/articleImages/1697012596257.png');
INSERT INTO `images` VALUES (223, 'be16635c-d734-4ebc-98c0-430b57c937d4', 'http://127.0.0.1:9090/uploads/articleImages/1697012596271.png');
INSERT INTO `images` VALUES (224, 'cbbed585-17aa-40f8-abd6-59c7284e31aa', 'http://127.0.0.1:9090/uploads/articleImages/1697012596259.png');
INSERT INTO `images` VALUES (225, '53e046b7-2686-4cc6-a393-08201845b0e9', 'http://127.0.0.1:9090/uploads/articleImages/1697012596262.png');
INSERT INTO `images` VALUES (226, 'fdc2dc33-3841-4f39-80e6-08124b7fff8f', 'http://127.0.0.1:9090/uploads/articleImages/1697012596265.png');
INSERT INTO `images` VALUES (227, 'a97dc3f9-66ea-4c1a-95e3-5657c31c21b9', 'http://127.0.0.1:9090/uploads/articleImages/1697012596267.png');
INSERT INTO `images` VALUES (228, '654a1c2b-9012-46fb-be4b-2a0154f9ec52', 'http://127.0.0.1:9090/uploads/articleImages/1697012596278.png');
INSERT INTO `images` VALUES (229, 'e4c19baf-3c2e-48b8-8d6c-4cea40a4105b', 'http://127.0.0.1:9090/uploads/articleCovers/1697013059739.png');
INSERT INTO `images` VALUES (230, '0902368a-977d-4506-b452-d7bbea0f1302', 'http://127.0.0.1:9090/uploads/articleCovers/1697013071285.png');
INSERT INTO `images` VALUES (231, 'f0097725-a51d-4780-ba16-66c47538574f', 'http://127.0.0.1:9090/uploads/articleImages/1697013104263.png');
INSERT INTO `images` VALUES (232, '0ad82fcf-37c8-47b2-964c-6d623dd7783e', 'http://127.0.0.1:9090/uploads/articleImages/1697013104268.png');
INSERT INTO `images` VALUES (233, 'a339194a-67a3-46d8-9239-1b587aad14f5', 'http://127.0.0.1:9090/uploads/articleImages/1697013104265.png');
INSERT INTO `images` VALUES (234, '0d0ff0aa-05b3-4fc0-bfbf-a356657f40fb', 'http://127.0.0.1:9090/uploads/articleImages/1697013104275.png');
INSERT INTO `images` VALUES (235, '021d05b5-79f9-47af-a61e-c898a364efab', 'http://127.0.0.1:9090/uploads/articleImages/1697013104269.png');
INSERT INTO `images` VALUES (236, '553c2560-9a37-4d18-9468-5c185794a196', 'http://127.0.0.1:9090/uploads/articleImages/1697013104272.png');
INSERT INTO `images` VALUES (237, '84837257-8138-49f2-83c7-e2a877aafead', 'http://127.0.0.1:9090/uploads/articleImages/1697013531021.png');
INSERT INTO `images` VALUES (238, '52f66398-01e7-4af5-9527-bd438dc3fb29', 'http://127.0.0.1:9090/uploads/articleImages/1697013531023.png');
INSERT INTO `images` VALUES (239, 'c1467e16-6c77-41d5-8792-8decb69ca862', 'http://127.0.0.1:9090/uploads/articleImages/1697013531026.png');
INSERT INTO `images` VALUES (240, 'bdbc061b-364e-40fa-a4d5-00e3fb0d2f10', 'http://127.0.0.1:9090/uploads/articleImages/1697013531030.png');
INSERT INTO `images` VALUES (241, '1d7e0554-ea5b-4064-9efe-58acbd8840b1', 'http://127.0.0.1:9090/uploads/articleCovers/1697013543881.png');
INSERT INTO `images` VALUES (242, '6c046b48-b688-4b40-905c-af3269abfb2e', 'http://127.0.0.1:9090/uploads/articleCovers/1697013874661.png');
INSERT INTO `images` VALUES (243, '7a657c20-f4b4-408c-8e56-555ef2ea4f28', 'http://127.0.0.1:9090/uploads/articleCovers/1697014027691.png');
INSERT INTO `images` VALUES (244, 'f78a06c7-715f-4246-9e05-c2e5bdcfbcbe', 'http://127.0.0.1:9090/uploads/articleImages/1697014067046.png');
INSERT INTO `images` VALUES (245, '2df3127a-2af6-43c2-9bea-07e176266404', 'http://127.0.0.1:9090/uploads/articleImages/1697014067047.png');
INSERT INTO `images` VALUES (246, '2653292b-8dc6-4b58-a936-699a79992897', 'http://127.0.0.1:9090/uploads/articleImages/1697014067049.png');
INSERT INTO `images` VALUES (247, 'ca104684-9f6b-4f0a-a55f-8f50bda12814', 'http://127.0.0.1:9090/uploads/articleImages/1697014067052.png');
INSERT INTO `images` VALUES (248, '5aded41d-7f5f-40c1-9c88-1b264b6fd1a4', 'http://127.0.0.1:9090/uploads/articleImages/1697014105580.png');
INSERT INTO `images` VALUES (249, 'b1abe811-f1b1-4a2e-b42e-4c46e2ac07d1', 'http://127.0.0.1:9090/uploads/articleImages/1697014574012.png');
INSERT INTO `images` VALUES (250, '6a139dd4-7508-4adb-88ae-3d73b6eefd4f', 'http://127.0.0.1:9090/uploads/articleImages/1697014574015.png');
INSERT INTO `images` VALUES (251, '89f6ab89-b40f-4dd4-aa45-08801bcf5aae', 'http://127.0.0.1:9090/uploads/articleImages/1697014574017.png');
INSERT INTO `images` VALUES (252, '8f1b183a-1b91-445c-881b-3fbf45b849a2', 'http://127.0.0.1:9090/uploads/articleImages/1697014574024.png');
INSERT INTO `images` VALUES (253, '16d05a5d-bf56-4ab9-a1ab-f700afa65904', 'http://127.0.0.1:9090/uploads/articleImages/1697014574020.png');
INSERT INTO `images` VALUES (254, '1c15eb3a-f6d6-4b64-b525-c50004aa374f', 'http://127.0.0.1:9090/uploads/articleCovers/1697014622787.png');
INSERT INTO `images` VALUES (255, '8b3d9c85-f8b8-4bdc-9bca-888c5f353433', 'http://127.0.0.1:9090/uploads/articleImages/1697015098487.png');
INSERT INTO `images` VALUES (256, 'a018b8d1-be8d-4bf6-b4a2-389c4b30503a', 'http://127.0.0.1:9090/uploads/articleImages/1697015098489.png');
INSERT INTO `images` VALUES (257, '0ca60294-32dd-47f2-99b8-b7a6d254d68a', 'http://127.0.0.1:9090/uploads/articleImages/1697015098492.png');
INSERT INTO `images` VALUES (258, '6d6f48fd-50ad-4fee-ba89-d63cc84580aa', 'http://127.0.0.1:9090/uploads/articleImages/1697015098495.png');
INSERT INTO `images` VALUES (259, '6331b9a3-5678-4b59-9243-0f00904d55cd', 'http://127.0.0.1:9090/uploads/articleImages/1697015286738.png');
INSERT INTO `images` VALUES (260, '6da7ffc6-a0d0-40ad-a815-313cb631bf9c', 'http://127.0.0.1:9090/uploads/articleCovers/1697015301385.png');
INSERT INTO `images` VALUES (261, 'a98d4f7d-fb81-4fb1-932c-bcd970845856', 'http://127.0.0.1:9090/uploads/articleCovers/1697035879601.png');
INSERT INTO `images` VALUES (262, 'a5da6697-62a4-497e-912d-29815576a9b8', 'http://127.0.0.1:9090/uploads/articleCovers/1697036312711.png');
INSERT INTO `images` VALUES (263, 'a075e85b-a0fd-4413-bbc7-06ec9294c779', 'http://127.0.0.1:9090/uploads/articleCovers/1697047077649.png');
INSERT INTO `images` VALUES (264, '22013589-8487-41cd-9cc5-0c075d8814b0', 'http://127.0.0.1:9090/uploads/articleImages/1697047098675.png');
INSERT INTO `images` VALUES (265, 'c82a617e-1582-45f6-873b-5ca80858c703', 'http://127.0.0.1:9090/uploads/articleCovers/1697047228593.png');
INSERT INTO `images` VALUES (266, '1b592f0b-43e2-47bf-b396-de5e7ffae81f', 'http://127.0.0.1:9090/uploads/articleImages/1697047245022.png');
INSERT INTO `images` VALUES (267, 'e602fc59-92d0-4bbf-a24e-a77aa6005fdf', 'http://127.0.0.1:9090/uploads/articleCovers/1697451833815.png');
INSERT INTO `images` VALUES (268, '73966a25-be16-4c22-8865-b41056be4ef9', 'http://127.0.0.1:9090/uploads/articleCovers/1697780847662.png');
INSERT INTO `images` VALUES (269, '14143020-e9da-4534-aebb-bc7ec1d8daf7', 'http://127.0.0.1:9090/uploads/articleCovers/1697780875132.png');
INSERT INTO `images` VALUES (270, '5ee994c8-41e5-4d18-829a-b9bac711a3f0', 'http://127.0.0.1:9090/uploads/articleCovers/1697780904797.png');
INSERT INTO `images` VALUES (271, '9ba7b71f-0d3c-4574-a96e-d13e6b8666a2', 'http://127.0.0.1:9090/uploads/articleCovers/1699685268251.png');
INSERT INTO `images` VALUES (272, '780c815c-9436-42ac-acf2-15dacb68ba01', 'http://127.0.0.1:9090/uploads/articleImages/1699685303866.png');
INSERT INTO `images` VALUES (273, '3dd6b8ff-c6aa-4faf-a94a-2a4e09216c0a', 'http://127.0.0.1:9090/uploads/articleImages/1699685303874.png');
INSERT INTO `images` VALUES (274, 'a1817617-1b89-4ccc-bd67-5208c3824ab2', 'http://127.0.0.1:9090/uploads/articleImages/1699685303886.png');
INSERT INTO `images` VALUES (275, '31a9cea0-0e43-4a01-9a31-22431c81b586', 'http://127.0.0.1:9090/uploads/articleImages/1699685303877.png');
INSERT INTO `images` VALUES (276, 'dd2cc3d3-0e39-4214-953d-eca57d68fc59', 'http://127.0.0.1:9090/uploads/articleImages/1699685303880.png');
INSERT INTO `images` VALUES (277, '803b3f41-37cc-4109-95e1-5b6fd2510e92', 'http://127.0.0.1:9090/uploads/articleImages/1699686237256.png');
INSERT INTO `images` VALUES (278, 'd7103571-740e-4887-bc45-d8ee78126993', 'http://127.0.0.1:9090/uploads/articleImages/1699686237258.png');
INSERT INTO `images` VALUES (279, '3c875604-a4df-43b0-b4ee-a0e644d7e79f', 'http://127.0.0.1:9090/uploads/articleImages/1699686237270.png');
INSERT INTO `images` VALUES (280, '74e35302-a527-42c9-bd35-afc7b9a12012', 'http://127.0.0.1:9090/uploads/articleImages/1699686237265.png');
INSERT INTO `images` VALUES (281, '5c14fd3b-357d-4c5d-b997-3a2b452bc0d9', 'http://127.0.0.1:9090/uploads/articleImages/1699686237260.png');
INSERT INTO `images` VALUES (282, 'c95c06e8-3f11-49c5-be3e-d8b26edf031f', 'http://127.0.0.1:9090/uploads/articleCovers/1699686243592.png');
INSERT INTO `images` VALUES (283, '0efcaa35-c534-4047-959e-b1958fd6dce9', 'http://127.0.0.1:9090/uploads/articleCovers/1699686791677.png');
INSERT INTO `images` VALUES (284, 'ec854f99-7f4f-4ae0-be14-453515716714', 'http://127.0.0.1:9090/uploads/articleImages/1699686880465.png');
INSERT INTO `images` VALUES (285, '4d4991d9-27e5-43c0-914e-37f10fe5b5ba', 'http://127.0.0.1:9090/uploads/articleImages/1699686880473.png');
INSERT INTO `images` VALUES (286, '790d7a54-a111-489b-a8df-bb0705d50f79', 'http://127.0.0.1:9090/uploads/articleImages/1699686880467.png');
INSERT INTO `images` VALUES (287, '30bcffa4-79cf-4f2b-9227-06ef3fd92f53', 'http://127.0.0.1:9090/uploads/articleImages/1699686880474.png');
INSERT INTO `images` VALUES (288, 'ec29faba-9a6e-44e6-9f6c-fea9d67cd562', 'http://127.0.0.1:9090/uploads/articleImages/1699686880478.png');
INSERT INTO `images` VALUES (289, 'a897fce2-8a44-4616-86c6-5ce9654c4631', 'http://127.0.0.1:9090/uploads/articleImages/1699687488907.png');
INSERT INTO `images` VALUES (290, 'ac1e49f3-491a-4e91-91fa-89e4198c9943', 'http://127.0.0.1:9090/uploads/articleImages/1699687488901.png');
INSERT INTO `images` VALUES (291, 'f8ed1dbc-c93f-46c6-8ae7-b24809bbba29', 'http://127.0.0.1:9090/uploads/articleImages/1699687488912.png');
INSERT INTO `images` VALUES (292, '2298bbd3-4cb0-442f-abb7-34b396c42197', 'http://127.0.0.1:9090/uploads/articleImages/1699687488915.png');
INSERT INTO `images` VALUES (293, 'eeb9e6c9-d132-4b0f-a76d-65deefd5ff7e', 'http://127.0.0.1:9090/uploads/articleImages/1699687488904.png');
INSERT INTO `images` VALUES (294, '01d9e529-6123-4929-97a9-8d57f7f92714', 'http://127.0.0.1:9090/uploads/articleImages/1699687488928.png');
INSERT INTO `images` VALUES (295, 'bcb597a4-69b6-4c53-af27-7169f6a84220', 'http://127.0.0.1:9090/uploads/articleImages/1699687488932.png');
INSERT INTO `images` VALUES (296, 'd95a8492-b41f-4763-bd0b-d59d275aaab2', 'http://127.0.0.1:9090/uploads/articleImages/1699687488918.png');
INSERT INTO `images` VALUES (297, '3d24d439-5292-4fb2-b3a5-495ae1d5a612', 'http://127.0.0.1:9090/uploads/articleCovers/1699687570594.png');
INSERT INTO `images` VALUES (298, '41b4e26d-e7d8-41c6-9620-feeda6f5622b', 'http://127.0.0.1:9090/uploads/articleImages/1699687953057.png');
INSERT INTO `images` VALUES (299, '4af64d3a-7b7d-4e18-9b06-f2fee2ddf6dd', 'http://127.0.0.1:9090/uploads/articleImages/1699687953060.png');
INSERT INTO `images` VALUES (300, '30b494e5-ac53-4ce5-bad3-178990264d16', 'http://127.0.0.1:9090/uploads/articleImages/1699687953074.png');
INSERT INTO `images` VALUES (301, '36909539-4f89-4f6d-b882-7f5935f9f9ca', 'http://127.0.0.1:9090/uploads/articleImages/1699687953065.png');
INSERT INTO `images` VALUES (302, '9e56d849-e17c-4ee8-a371-97d5f8bd9a6b', 'http://127.0.0.1:9090/uploads/articleImages/1699687953068.png');
INSERT INTO `images` VALUES (303, '674c4f91-b02e-4fbb-8753-6964e26187c5', 'http://127.0.0.1:9090/uploads/articleImages/1699687953070.png');
INSERT INTO `images` VALUES (304, '2c4f35e1-d7ac-4c82-8c6b-c2f5d511bcaf', 'http://127.0.0.1:9090/uploads/articleImages/1699687953081.png');
INSERT INTO `images` VALUES (305, '591e292e-c0e0-44c2-899c-4073f5baca2c', 'http://127.0.0.1:9090/uploads/articleImages/1699687953086.png');
INSERT INTO `images` VALUES (306, '2b780bca-6773-4811-91e2-2651bd141eae', 'http://127.0.0.1:9090/uploads/articleImages/1699687953088.png');
INSERT INTO `images` VALUES (307, 'fed285f7-70fb-454d-8b37-2af89fe660e8', 'http://127.0.0.1:9090/uploads/articleCovers/1699688025132.png');
INSERT INTO `images` VALUES (308, '7f7ed4cc-5418-4a26-b21c-98865f079242', 'http://127.0.0.1:9090/uploads/articleImages/1699688326423.png');
INSERT INTO `images` VALUES (309, '3bba0de0-4e1d-4f73-b833-48021af5008e', 'http://127.0.0.1:9090/uploads/articleImages/1699688326427.png');
INSERT INTO `images` VALUES (310, '02a39985-16a0-4fc4-8436-a21d5e808ffe', 'http://127.0.0.1:9090/uploads/articleImages/1699688326432.png');
INSERT INTO `images` VALUES (311, '917b446c-da8a-4eb2-8351-10de4ae35586', 'http://127.0.0.1:9090/uploads/articleCovers/1699688372845.png');
INSERT INTO `images` VALUES (312, '421707e9-7b77-46b1-953b-c5d4a7a12d07', 'http://127.0.0.1:9090/uploads/articleCovers/1699688403525.png');
INSERT INTO `images` VALUES (313, '586b79a5-9ef1-4922-8644-ed3aff566414', 'http://127.0.0.1:9090/uploads/articleImages/1699688675782.png');
INSERT INTO `images` VALUES (314, '1ba39010-9582-4655-aae5-d690c4972e50', 'http://127.0.0.1:9090/uploads/articleImages/1699688675792.png');
INSERT INTO `images` VALUES (315, 'd143acc9-faf1-469c-9fc2-e8a22274ccea', 'http://127.0.0.1:9090/uploads/articleCovers/1699688973684.png');
INSERT INTO `images` VALUES (316, '1db6cfae-0a40-465e-98f6-1dcab007f3cd', 'http://127.0.0.1:9090/uploads/articleImages/1699689152682.png');
INSERT INTO `images` VALUES (317, '073c814a-02e4-4695-9d44-549dfb3dceed', 'http://127.0.0.1:9090/uploads/articleImages/1699689152692.png');
INSERT INTO `images` VALUES (318, '63a6e31a-e04e-4247-89c3-6d7e7e460887', 'http://127.0.0.1:9090/uploads/articleImages/1699689152699.png');
INSERT INTO `images` VALUES (319, '72761591-d543-463f-9187-3ca042c1033a', 'http://127.0.0.1:9090/uploads/articleImages/1699689152707.png');
INSERT INTO `images` VALUES (320, '8d946832-b6cf-4d92-aff0-bcaa5154f5a7', 'http://127.0.0.1:9090/uploads/articleImages/1699689152714.png');
INSERT INTO `images` VALUES (321, 'a4ea77cf-4295-4bb1-acd0-2bf5a8deb473', 'http://127.0.0.1:9090/uploads/articleCovers/1699689187141.png');
INSERT INTO `images` VALUES (322, '1f14e69e-2d84-4e41-bce7-de639b02940f', 'http://127.0.0.1:9090/uploads/articleImages/1699689300477.png');
INSERT INTO `images` VALUES (323, '123b4095-ba84-47c4-b689-92d4c99a329b', 'http://127.0.0.1:9090/uploads/articleImages/1699689300479.png');
INSERT INTO `images` VALUES (324, '21715176-c9a4-4797-9953-c781b1c65bd3', 'http://127.0.0.1:9090/uploads/articleImages/1699689300482.png');
INSERT INTO `images` VALUES (325, '54280f8e-a5d3-4b6f-9c61-265a6b5dc06d', 'http://127.0.0.1:9090/uploads/articleImages/1699689300486.png');
INSERT INTO `images` VALUES (326, '88d8266c-1b5e-4aa2-8c72-832e3d69f2cb', 'http://127.0.0.1:9090/uploads/articleImages/1699689300488.png');
INSERT INTO `images` VALUES (327, '44a5b955-f062-484f-80d5-5f7677abf326', 'http://127.0.0.1:9090/uploads/articleCovers/1699689419269.png');
INSERT INTO `images` VALUES (328, 'f23ccfdd-27d2-4511-8aea-5bc4ffe03918', 'http://127.0.0.1:9090/uploads/articleImages/1699689642700.png');
INSERT INTO `images` VALUES (329, '4c00922c-70a4-434f-9e9d-3e476bd9d73b', 'http://127.0.0.1:9090/uploads/articleImages/1699689642704.png');
INSERT INTO `images` VALUES (330, '239f128e-b954-4c64-af5a-44b0c41cc2c7', 'http://127.0.0.1:9090/uploads/articleImages/1699689642706.png');
INSERT INTO `images` VALUES (331, '81fe4b9b-3ee6-4f7f-a89a-e9269e7daf6d', 'http://127.0.0.1:9090/uploads/articleImages/1699689642713.png');
INSERT INTO `images` VALUES (332, 'e499c5fc-880b-4266-8680-a5c94957fddf', 'http://127.0.0.1:9090/uploads/articleImages/1699689642715.png');
INSERT INTO `images` VALUES (333, '94460bbc-d8e4-499a-a824-90ba81c36f9e', 'http://127.0.0.1:9090/uploads/articleImages/1699689642711.png');
INSERT INTO `images` VALUES (334, '4e06cc65-ceac-4356-b32d-1420f2d194a0', 'http://127.0.0.1:9090/uploads/articleCovers/1699689736080.png');
INSERT INTO `images` VALUES (335, 'e498f947-de20-477b-9785-1c19b2e2aad0', 'http://127.0.0.1:9090/uploads/articleImages/1699689958337.png');
INSERT INTO `images` VALUES (336, 'e0a38cea-7f0f-4e73-98fd-11808a8cec41', 'http://127.0.0.1:9090/uploads/articleImages/1699689958340.png');
INSERT INTO `images` VALUES (337, 'a700cca4-edf3-4b26-baf8-08003a17d409', 'http://127.0.0.1:9090/uploads/articleImages/1699689958343.png');
INSERT INTO `images` VALUES (338, '6696905b-eab8-4d70-84ec-72589ddd51e8', 'http://127.0.0.1:9090/uploads/articleImages/1699689958352.png');
INSERT INTO `images` VALUES (339, '31d4a44d-5a0b-4c89-9455-0232cc0567e2', 'http://127.0.0.1:9090/uploads/articleImages/1699689958347.png');
INSERT INTO `images` VALUES (340, 'd95e5161-77a4-4008-aa4f-187aca0cf7c0', 'http://127.0.0.1:9090/uploads/articleImages/1699689958349.png');
INSERT INTO `images` VALUES (341, '715264ce-4504-4d18-a901-330e82455cae', 'http://127.0.0.1:9090/uploads/articleCovers/1699690106086.png');
INSERT INTO `images` VALUES (342, '106d6360-09bf-481f-b515-d66813213637', 'http://127.0.0.1:9090/uploads/articleImages/1699690233968.png');
INSERT INTO `images` VALUES (343, '789abb64-4f94-4191-8cd4-f5cf0377d8fb', 'http://127.0.0.1:9090/uploads/articleImages/1699690233978.png');
INSERT INTO `images` VALUES (344, '61fa4f39-24b7-4965-9b0f-5e1beffdea63', 'http://127.0.0.1:9090/uploads/articleImages/1699690233986.png');
INSERT INTO `images` VALUES (345, '56cdde4b-fb73-4052-83c5-089d6ffa3c28', 'http://127.0.0.1:9090/uploads/articleImages/1699690233994.png');
INSERT INTO `images` VALUES (346, '5fc9f8b0-b209-42b6-9ff7-379f180a2442', 'http://127.0.0.1:9090/uploads/articleImages/1699690234001.png');
INSERT INTO `images` VALUES (347, '6642ea33-91f4-468f-aeb4-3deda0827887', 'http://127.0.0.1:9090/uploads/articleImages/1699690234009.png');
INSERT INTO `images` VALUES (348, '0b065a76-0799-441b-8f06-86672b395fa6', 'http://127.0.0.1:9090/uploads/articleCovers/1699690303867.png');
INSERT INTO `images` VALUES (349, 'c5c563b8-0d0f-48ac-b1e7-5c5a38ccee60', 'http://127.0.0.1:9090/uploads/articleImages/1699851335111.png');
INSERT INTO `images` VALUES (350, 'c4e12885-33ae-4091-b56f-29d983f2863a', 'http://127.0.0.1:9090/uploads/articleImages/1699851335119.png');
INSERT INTO `images` VALUES (351, '89147d0d-6290-480a-abd3-d4b220bff38f', 'http://127.0.0.1:9090/uploads/articleImages/1699851335115.png');
INSERT INTO `images` VALUES (352, '15598e3c-3722-43cb-9e92-1d1653018b11', 'http://127.0.0.1:9090/uploads/articleCovers/1699851353308.png');
INSERT INTO `images` VALUES (353, '8f3cdd51-6e63-4d37-b93a-ac192a266f64', 'http://127.0.0.1:9090/uploads/articleImages/1699851600250.png');
INSERT INTO `images` VALUES (354, '738c72bd-7fda-4ef1-963f-4af76685ee7a', 'http://127.0.0.1:9090/uploads/articleCovers/1699851618343.png');
INSERT INTO `images` VALUES (355, '956f5cbb-9be7-4679-969f-00836e4514c3', 'http://127.0.0.1:9090/uploads/articleImages/1699855815220.png');
INSERT INTO `images` VALUES (356, '63f58458-11fe-4eb3-bb69-3145c81efbc5', 'http://127.0.0.1:9090/uploads/articleCovers/1699855851423.png');
INSERT INTO `images` VALUES (357, '1b01e878-9b12-435e-8465-fdfb6c23d0ff', 'http://127.0.0.1:9090/uploads/articleImages/1699855990868.png');
INSERT INTO `images` VALUES (358, 'c2a91316-79df-44ab-a388-154aa57d0d6e', 'http://127.0.0.1:9090/uploads/articleCovers/1699856035336.png');
INSERT INTO `images` VALUES (359, '6cc01eb6-c2c6-48f1-a602-49f7bd022f15', 'http://127.0.0.1:9090/uploads/articleImages/1699856297900.png');
INSERT INTO `images` VALUES (360, 'ab2b4a70-cbab-4d48-b901-51f2a7d50b52', 'http://127.0.0.1:9090/uploads/articleCovers/1699856394618.png');
INSERT INTO `images` VALUES (361, '90b2061a-4272-48ec-9907-d10e451a5cff', 'http://127.0.0.1:9090/uploads/articleImages/1699856661079.png');
INSERT INTO `images` VALUES (362, '93c8aa09-4a05-4b99-87fc-bae42a49018a', 'http://127.0.0.1:9090/uploads/articleCovers/1699856708260.png');
INSERT INTO `images` VALUES (363, 'b5fc697f-bfb3-494a-a801-a17cf1e59348', 'http://127.0.0.1:9090/uploads/articleImages/1699856852326.png');
INSERT INTO `images` VALUES (364, 'd05b687c-de57-4f8b-b639-897f9bbf9348', 'http://127.0.0.1:9090/uploads/articleCovers/1699856874463.png');
INSERT INTO `images` VALUES (365, '0ef6f1f1-256a-463d-948e-cfe3dc76682f', 'http://127.0.0.1:9090/uploads/articleImages/1699857024358.png');
INSERT INTO `images` VALUES (366, 'ff8af1dd-205d-44b7-89e6-b23c771c3cf8', 'http://127.0.0.1:9090/uploads/articleCovers/1699857060460.png');
INSERT INTO `images` VALUES (367, '652a2acb-6b55-4752-a883-d331a32bf5cd', 'http://127.0.0.1:9090/uploads/articleImages/1699857643697.png');
INSERT INTO `images` VALUES (368, '0419bafe-2fd7-4957-82ab-a90675d58a60', 'http://127.0.0.1:9090/uploads/articleImages/1699857643707.png');
INSERT INTO `images` VALUES (369, '46886b6b-c6b6-4496-9af8-31b522a7b8bf', 'http://127.0.0.1:9090/uploads/articleImages/1699857643701.png');
INSERT INTO `images` VALUES (370, 'bdccb8ca-5a95-4f64-8195-efb9f8c2a56a', 'http://127.0.0.1:9090/uploads/articleImages/1699857643714.png');
INSERT INTO `images` VALUES (371, '52368110-b93c-4ea1-bcfa-c993c4af02ae', 'http://127.0.0.1:9090/uploads/articleImages/1699857643709.png');
INSERT INTO `images` VALUES (372, '134c523e-cf28-4a1c-a5ca-079644c1c8da', 'http://127.0.0.1:9090/uploads/articleImages/1699857643718.png');
INSERT INTO `images` VALUES (373, '48ad5eac-de56-4758-88d8-f0745752c60d', 'http://127.0.0.1:9090/uploads/articleCovers/1699857652177.png');
INSERT INTO `images` VALUES (374, 'f38491a8-a16c-489f-b2b3-b7e1be959092', 'http://127.0.0.1:9090/uploads/articleImages/1699857770958.png');
INSERT INTO `images` VALUES (375, '22f173b8-36e9-469a-a0f6-9a0d781a2497', 'http://127.0.0.1:9090/uploads/articleImages/1699857770959.png');
INSERT INTO `images` VALUES (376, '5393077b-1cf1-44e7-b229-b4119b111fb4', 'http://127.0.0.1:9090/uploads/articleImages/1699857770965.png');
INSERT INTO `images` VALUES (377, '2f51f342-9a80-46d1-a4d0-68c66eae6bc0', 'http://127.0.0.1:9090/uploads/articleImages/1699857770966.png');
INSERT INTO `images` VALUES (378, '725e0196-dc92-40f0-90a9-9c5d196c4eec', 'http://127.0.0.1:9090/uploads/articleImages/1699857770961.png');
INSERT INTO `images` VALUES (379, '609448ac-386f-4be1-bb3f-e1a1b54e74f5', 'http://127.0.0.1:9090/uploads/articleImages/1699857770969.png');
INSERT INTO `images` VALUES (380, '151333e7-3c16-4509-93f5-100a16046c78', 'http://127.0.0.1:9090/uploads/articleImages/1699857770971.png');
INSERT INTO `images` VALUES (381, '53d7cb94-b20f-4e31-90c6-4fd89be649f8', 'http://127.0.0.1:9090/uploads/articleCovers/1699857787696.png');
INSERT INTO `images` VALUES (382, '792d21d0-79b0-457d-b551-41479417682c', 'http://127.0.0.1:9090/uploads/articleImages/1699857919957.png');
INSERT INTO `images` VALUES (383, '7391f930-b963-420e-89ac-7d0c398c691d', 'http://127.0.0.1:9090/uploads/articleImages/1699857919968.png');
INSERT INTO `images` VALUES (384, '62690385-99eb-400e-9354-7ad671162168', 'http://127.0.0.1:9090/uploads/articleImages/1699857919959.png');
INSERT INTO `images` VALUES (385, 'd8a55aa8-6f03-4050-bafe-703844ae8008', 'http://127.0.0.1:9090/uploads/articleImages/1699857919964.png');
INSERT INTO `images` VALUES (386, 'f682a813-5163-4ee0-a9e2-9f3d35214c2f', 'http://127.0.0.1:9090/uploads/articleImages/1699857919962.png');
INSERT INTO `images` VALUES (387, '3050a96a-d654-425f-8214-186b9a8023a0', 'http://127.0.0.1:9090/uploads/articleImages/1699857919969.png');
INSERT INTO `images` VALUES (388, '933ab57b-f050-4552-998b-4618863341df', 'http://127.0.0.1:9090/uploads/articleImages/1699857919976.png');
INSERT INTO `images` VALUES (389, '42bd5c5c-ffee-4352-b5c7-522eca324772', 'http://127.0.0.1:9090/uploads/articleCovers/1699857928920.png');
INSERT INTO `images` VALUES (390, '0875e8ae-3db7-4518-8d40-d7c4d8fcefa7', 'http://127.0.0.1:9090/uploads/articleImages/1699858057513.png');
INSERT INTO `images` VALUES (391, 'd14bf37d-86a8-4f0c-a0ca-169c34357ce3', 'http://127.0.0.1:9090/uploads/articleImages/1699858057516.png');
INSERT INTO `images` VALUES (392, '9deeb3e2-427e-4cfd-9fe3-bdc19d48f2f6', 'http://127.0.0.1:9090/uploads/articleImages/1699858057518.png');
INSERT INTO `images` VALUES (393, 'a7f5511a-b192-4ba5-8f4b-f9a3131c5245', 'http://127.0.0.1:9090/uploads/articleImages/1699858057522.png');
INSERT INTO `images` VALUES (394, 'ff63718b-9189-4b18-b6a4-741fbf3f0acc', 'http://127.0.0.1:9090/uploads/articleImages/1699858057526.png');
INSERT INTO `images` VALUES (395, '7e42faa7-8579-4301-844b-d654683fe733', 'http://127.0.0.1:9090/uploads/articleImages/1699858057530.png');
INSERT INTO `images` VALUES (396, 'b8895fa2-172b-4ae7-b1b4-d107b05567c6', 'http://127.0.0.1:9090/uploads/articleCovers/1699858066729.png');
INSERT INTO `images` VALUES (397, '31d7b136-addc-4e7e-a10d-5d9e32405ecc', 'http://127.0.0.1:9090/uploads/articleImages/1699858183446.png');
INSERT INTO `images` VALUES (398, 'a0da4e68-ea38-4924-b191-a56c7ccaf385', 'http://127.0.0.1:9090/uploads/articleImages/1699858183449.png');
INSERT INTO `images` VALUES (399, '3a7d620e-941f-44c9-b14e-0148bcb2c12d', 'http://127.0.0.1:9090/uploads/articleImages/1699858183456.png');
INSERT INTO `images` VALUES (400, '7ec1858d-bebc-40d9-80ee-3c1c432ca98d', 'http://127.0.0.1:9090/uploads/articleImages/1699858183452.png');
INSERT INTO `images` VALUES (401, '364ec755-d30e-4fd3-a54b-f73f1772f008', 'http://127.0.0.1:9090/uploads/articleImages/1699858183462.png');
INSERT INTO `images` VALUES (402, 'fa322be6-1953-4e8e-aa1f-084fce509bd2', 'http://127.0.0.1:9090/uploads/articleImages/1699858183459.png');
INSERT INTO `images` VALUES (403, 'f53393a4-8779-4771-8f6a-a366ab184a60', 'http://127.0.0.1:9090/uploads/articleImages/1699858183468.png');
INSERT INTO `images` VALUES (404, '6df8803a-e7ba-4581-9b43-06614fb0976d', 'http://127.0.0.1:9090/uploads/articleImages/1699858183472.png');
INSERT INTO `images` VALUES (405, 'e93eed36-97cb-494e-a31a-5b7e3c4a2035', 'http://127.0.0.1:9090/uploads/articleCovers/1699858198315.png');
INSERT INTO `images` VALUES (406, 'ec2180bf-27d8-4aa4-95a0-14ac041c6145', 'http://127.0.0.1:9090/uploads/articleImages/1699858470271.png');
INSERT INTO `images` VALUES (407, '8298c5e6-a2fd-457d-a507-adeb828d3fff', 'http://127.0.0.1:9090/uploads/articleImages/1699858470281.png');
INSERT INTO `images` VALUES (408, '6bfd654d-511f-4014-a082-410c14588fe5', 'http://127.0.0.1:9090/uploads/articleImages/1699858470273.png');
INSERT INTO `images` VALUES (409, 'a6a66398-9b6f-4e88-ae5d-228221de5690', 'http://127.0.0.1:9090/uploads/articleImages/1699858470276.png');
INSERT INTO `images` VALUES (410, '0f4ccdcf-a31a-4b73-8310-d3319c7f3828', 'http://127.0.0.1:9090/uploads/articleImages/1699858470285.png');
INSERT INTO `images` VALUES (411, 'c15abcb1-dff2-4ee0-bb04-d3f8a65f973a', 'http://127.0.0.1:9090/uploads/articleImages/1699858470289.png');
INSERT INTO `images` VALUES (412, '9dcaa257-6fd1-4048-9263-8ba8b915b828', 'http://127.0.0.1:9090/uploads/articleImages/1699858470293.png');
INSERT INTO `images` VALUES (413, 'fd763327-5a5d-4309-82db-e33ce373adca', 'http://127.0.0.1:9090/uploads/articleCovers/1699858483055.png');
INSERT INTO `images` VALUES (414, '598b010a-5bd3-4007-a110-54447992996a', 'http://127.0.0.1:9090/uploads/articleImages/1699858628148.png');
INSERT INTO `images` VALUES (415, 'bb5db69b-5270-4522-9e09-8daef3b92eeb', 'http://127.0.0.1:9090/uploads/articleImages/1699858628154.png');
INSERT INTO `images` VALUES (416, 'e57a1c93-087e-4520-96fc-9c3070baf85d', 'http://127.0.0.1:9090/uploads/articleImages/1699858628151.png');
INSERT INTO `images` VALUES (417, '9f232ae4-8646-472c-87b1-74b73fc97673', 'http://127.0.0.1:9090/uploads/articleImages/1699858628156.png');
INSERT INTO `images` VALUES (418, 'e1eb963c-903a-42f4-a33a-723c4f55fee8', 'http://127.0.0.1:9090/uploads/articleCovers/1699858646614.png');
INSERT INTO `images` VALUES (419, 'e906d5f2-5edb-497b-9bc6-126088669b7c', 'http://127.0.0.1:9090/uploads/articleImages/1699858699926.png');
INSERT INTO `images` VALUES (420, '7710f4df-583d-4b2b-9a48-da352f3d18b5', 'http://127.0.0.1:9090/uploads/articleImages/1699858699935.png');
INSERT INTO `images` VALUES (421, 'c603d23f-06b2-43ed-9cce-45d7bd31c140', 'http://127.0.0.1:9090/uploads/articleImages/1699858699943.png');
INSERT INTO `images` VALUES (422, 'b361193a-e2e7-4457-bdef-9aa95261ee1e', 'http://127.0.0.1:9090/uploads/articleImages/1699858699950.png');
INSERT INTO `images` VALUES (423, '9c1e055d-88aa-4dd8-8c15-e16da2e64db3', 'http://127.0.0.1:9090/uploads/articleImages/1699858699957.png');
INSERT INTO `images` VALUES (424, '237e27a5-f36c-4b69-8a4c-a59d43655328', 'http://127.0.0.1:9090/uploads/articleCovers/1699858718660.png');
INSERT INTO `images` VALUES (425, '778e88d7-a3eb-4d3a-8f15-4ec5f101de21', 'http://127.0.0.1:9090/uploads/articleImages/1699858906071.png');
INSERT INTO `images` VALUES (426, '0fc742d1-7d49-4d0b-bd51-24c03f8d1ca9', 'http://127.0.0.1:9090/uploads/articleImages/1699858906073.png');
INSERT INTO `images` VALUES (427, '47698bdb-97ed-4def-aee1-58be676a80d4', 'http://127.0.0.1:9090/uploads/articleImages/1699858906081.png');
INSERT INTO `images` VALUES (428, '4bf3d60d-0de5-422c-8847-14b74d22e456', 'http://127.0.0.1:9090/uploads/articleImages/1699858906075.png');
INSERT INTO `images` VALUES (429, 'c8c222b2-a34b-403a-9236-db26fc54b8a3', 'http://127.0.0.1:9090/uploads/articleImages/1699858906078.png');
INSERT INTO `images` VALUES (430, '0b7d427b-a198-486b-8190-98c5febdb796', 'http://127.0.0.1:9090/uploads/articleCovers/1699858920349.png');
INSERT INTO `images` VALUES (431, '44569942-1467-4eee-93bd-6011f571f15f', 'http://127.0.0.1:9090/uploads/articleCovers/1699858930988.png');
INSERT INTO `images` VALUES (432, '9724db99-c408-4809-ad9b-40f63cffc140', 'http://127.0.0.1:9090/uploads/articleImages/1699859115920.png');
INSERT INTO `images` VALUES (433, '2eea9ed2-254e-4df1-b4b6-3cdaebe31db4', 'http://127.0.0.1:9090/uploads/articleImages/1699859115923.png');
INSERT INTO `images` VALUES (434, '2b294b6a-785b-48f3-ab9c-8a4d8c18241e', 'http://127.0.0.1:9090/uploads/articleImages/1699859115925.png');
INSERT INTO `images` VALUES (435, '06412c53-2b3f-4c38-943b-f081f228a0c1', 'http://127.0.0.1:9090/uploads/articleCovers/1699859137395.png');
INSERT INTO `images` VALUES (436, '53e8a541-c9bf-44cf-b9c4-adbdd8ce8472', 'http://127.0.0.1:9090/uploads/articleImages/1699859225199.png');
INSERT INTO `images` VALUES (437, 'ccc15d38-c1a9-4ca3-9f9d-4f932b6b4d33', 'http://127.0.0.1:9090/uploads/articleImages/1699859225209.png');
INSERT INTO `images` VALUES (438, 'ee4ac502-fdf8-4296-aa72-b404a72c02bf', 'http://127.0.0.1:9090/uploads/articleImages/1699859225216.png');
INSERT INTO `images` VALUES (439, 'ce3d7757-ce35-441c-87b9-55a86dc6d63c', 'http://127.0.0.1:9090/uploads/articleImages/1699859225224.png');
INSERT INTO `images` VALUES (440, '9ca20b21-9bb8-4b68-9ac6-408023c2b663', 'http://127.0.0.1:9090/uploads/articleImages/1699859225231.png');
INSERT INTO `images` VALUES (441, '3e26615b-5b12-4e49-a2b8-d337d378a3a1', 'http://127.0.0.1:9090/uploads/articleImages/1699859225238.png');
INSERT INTO `images` VALUES (442, '8a25aa6e-2506-457d-8e14-c080f626289f', 'http://127.0.0.1:9090/uploads/articleImages/1699859225245.png');
INSERT INTO `images` VALUES (443, '99e2e93c-5265-44a7-8676-d5a8c123817d', 'http://127.0.0.1:9090/uploads/articleCovers/1699859281206.png');
INSERT INTO `images` VALUES (444, '520c42ee-1446-4cf4-b34c-397d2c9a3422', 'http://127.0.0.1:9090/uploads/articleCovers/1699859289272.png');
INSERT INTO `images` VALUES (445, 'c523a3a1-37e6-4f3a-a818-f7d078adda99', 'http://127.0.0.1:9090/uploads/articleCovers/1699859296266.png');
INSERT INTO `images` VALUES (446, '0295912c-57c1-4177-a0af-a2429f841ff6', 'http://127.0.0.1:9090/uploads/articleImages/1699859434809.png');
INSERT INTO `images` VALUES (447, 'c2850cb0-5bef-4d75-8167-bd623966cab0', 'http://127.0.0.1:9090/uploads/articleImages/1699859434812.png');
INSERT INTO `images` VALUES (448, 'c95857c8-44a0-4c1c-babf-2806d05fd38f', 'http://127.0.0.1:9090/uploads/articleCovers/1699859466339.png');
INSERT INTO `images` VALUES (449, '3760a936-99cd-4fee-b7dc-1ca74b8fd2e5', 'http://127.0.0.1:9090/uploads/articleImages/1699859481000.png');
INSERT INTO `images` VALUES (450, 'b5f8d991-1552-485c-b40e-6c92bd1361db', 'http://127.0.0.1:9090/uploads/articleImages/1699859612130.png');
INSERT INTO `images` VALUES (451, 'be0b8448-e4b7-452b-bcee-e000ea137d5f', 'http://127.0.0.1:9090/uploads/articleImages/1699859612143.png');
INSERT INTO `images` VALUES (452, '746daea3-14d8-42bb-a03d-e407c9b1e530', 'http://127.0.0.1:9090/uploads/articleImages/1699859612152.png');
INSERT INTO `images` VALUES (453, 'eaf0578c-1051-4e92-8997-8f0b09016ccb', 'http://127.0.0.1:9090/uploads/articleImages/1699859612161.png');
INSERT INTO `images` VALUES (454, '329b25de-b30c-405d-abb9-891159c4c86a', 'http://127.0.0.1:9090/uploads/articleImages/1699859612170.png');
INSERT INTO `images` VALUES (455, 'b1abc548-319c-48a3-b4d0-5e8c5ee3851b', 'http://127.0.0.1:9090/uploads/articleCovers/1699859629370.png');
INSERT INTO `images` VALUES (456, '6842c1ba-17f9-4e66-bfa0-7431a180d520', 'http://127.0.0.1:9090/uploads/articleImages/1699859792014.png');
INSERT INTO `images` VALUES (457, '68015519-a83e-4e3a-b2ac-41d8c486ff14', 'http://127.0.0.1:9090/uploads/articleImages/1699859792016.png');
INSERT INTO `images` VALUES (458, 'aadf9433-5568-4375-92e5-b58d9af62ce6', 'http://127.0.0.1:9090/uploads/articleImages/1699859792019.png');
INSERT INTO `images` VALUES (459, 'fad1b856-cdb1-446b-bcab-7cfa2eaed9e6', 'http://127.0.0.1:9090/uploads/articleImages/1699859792021.png');
INSERT INTO `images` VALUES (460, 'ede67c96-d061-46da-b4f6-a8179939d607', 'http://127.0.0.1:9090/uploads/articleImages/1699859792023.png');
INSERT INTO `images` VALUES (461, '3c4bcd54-98e8-496e-b5a4-282008048165', 'http://127.0.0.1:9090/uploads/articleCovers/1699859817924.png');
INSERT INTO `images` VALUES (462, '29f2f7db-f3d1-49cf-8f6d-18b1502834f1', 'http://127.0.0.1:9090/uploads/articleImages/1699860090728.png');
INSERT INTO `images` VALUES (463, 'c7d47617-20af-4d8d-99f0-dd6d04f3ce24', 'http://127.0.0.1:9090/uploads/articleImages/1699860090731.png');
INSERT INTO `images` VALUES (464, '78309346-6bdb-4b16-8ae2-0f215155aaad', 'http://127.0.0.1:9090/uploads/articleImages/1699860090734.png');
INSERT INTO `images` VALUES (465, '614c1339-4060-4c28-b0f6-55521a81d9fc', 'http://127.0.0.1:9090/uploads/articleImages/1699860090739.png');
INSERT INTO `images` VALUES (466, '51d0deef-9e54-4876-9440-4428e7f47770', 'http://127.0.0.1:9090/uploads/articleImages/1699860090732.png');
INSERT INTO `images` VALUES (467, 'ed5555ed-3d31-4017-a4fc-521dbcf288aa', 'http://127.0.0.1:9090/uploads/articleImages/1699860090737.png');
INSERT INTO `images` VALUES (468, 'b73e84c9-aaef-47bf-ae49-3ced3c42c5b8', 'http://127.0.0.1:9090/uploads/articleCovers/1699860100601.png');
INSERT INTO `images` VALUES (469, '83ce069a-b5fb-4bd3-adf8-e5da887ab21b', 'http://127.0.0.1:9090/uploads/articleCovers/1699860699188.png');
INSERT INTO `images` VALUES (470, 'fc8e2672-4077-4505-93ca-a36d545d618e', 'http://127.0.0.1:9090/uploads/articleCovers/1700567044353.png');
INSERT INTO `images` VALUES (471, '1d6dde65-27d9-48b7-b429-ac211f6ac6ed', 'http://127.0.0.1:9090/uploads/articleCovers/1700574467700.jpg');
INSERT INTO `images` VALUES (472, 'b1d80c1c-f734-47e6-b40d-f57d2a44e508', 'http://127.0.0.1:9090/uploads/articleCovers/1700574606686.jpg');
INSERT INTO `images` VALUES (473, '0c82c4c3-9a14-49a3-b034-736d4a735365', 'http://127.0.0.1:9090/uploads/articleCovers/1700575235120.jpg');
INSERT INTO `images` VALUES (474, 'fdfbe6c9-91c0-4077-938a-2540039c0f64', 'http://127.0.0.1:9090/uploads/articleCovers/1700576047931.jpg');
INSERT INTO `images` VALUES (475, '88b38b44-07e7-4fe5-b244-c8533f7e8469', 'http://127.0.0.1:9090/uploads/articleCovers/1700576140373.jpg');
INSERT INTO `images` VALUES (476, 'f6873722-1ab3-41a4-b053-1d4539c826f3', 'http://127.0.0.1:9090/uploads/articleCovers/1700576278089.jpg');
INSERT INTO `images` VALUES (477, '12fcf62c-3be3-48e8-9abd-d6b4507c7005', 'http://127.0.0.1:9090/uploads/articleCovers/1700576387923.jpg');
INSERT INTO `images` VALUES (478, 'ddd9b1e8-b6d7-4ed8-935a-c4058c020eb0', 'http://127.0.0.1:9090/uploads/articleCovers/1700576573316.jpg');
INSERT INTO `images` VALUES (479, 'c3cd93e3-81b8-4c91-b9d7-bdd3ccc86d45', 'http://127.0.0.1:9090/uploads/articleCovers/1700576619443.jpg');
INSERT INTO `images` VALUES (480, '89d5f6c7-a331-404c-b482-e750a2d43962', 'http://127.0.0.1:9090/uploads/articleCovers/1700577266525.jpg');
INSERT INTO `images` VALUES (481, 'e3d1bc33-54f0-4dbd-8b34-7c0f66993a67', 'http://127.0.0.1:9090/uploads/articleCovers/1700577772574.jpg');
INSERT INTO `images` VALUES (482, 'c3b994a2-72ed-422f-8c2f-0afd863fb7b8', 'http://127.0.0.1:9090/uploads/articleCovers/1706452710526.jpg');
INSERT INTO `images` VALUES (483, 'd91ada55-74a3-4bbf-b4da-e26b7f28724d', 'http://127.0.0.1:9090/uploads/articleCovers/1709985110173.jpg');

-- ----------------------------
-- Table structure for like_article
-- ----------------------------
DROP TABLE IF EXISTS `like_article`;
CREATE TABLE `like_article`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NULL DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of like_article
-- ----------------------------
INSERT INTO `like_article` VALUES (6, 64, 'msglbo');
INSERT INTO `like_article` VALUES (7, 68, 'msglbo');
INSERT INTO `like_article` VALUES (14, 55, 'msglbo');
INSERT INTO `like_article` VALUES (15, 52, 'msglbo');
INSERT INTO `like_article` VALUES (16, 38, 'msglbo');
INSERT INTO `like_article` VALUES (19, 72, 'msglbo');

-- ----------------------------
-- Table structure for setting_campaigns
-- ----------------------------
DROP TABLE IF EXISTS `setting_campaigns`;
CREATE TABLE `setting_campaigns`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of setting_campaigns
-- ----------------------------

-- ----------------------------
-- Table structure for setting_carousel
-- ----------------------------
DROP TABLE IF EXISTS `setting_carousel`;
CREATE TABLE `setting_carousel`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  PRIMARY KEY (`id`, `article_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of setting_carousel
-- ----------------------------
INSERT INTO `setting_carousel` VALUES (1, 104);
INSERT INTO `setting_carousel` VALUES (2, 63);
INSERT INTO `setting_carousel` VALUES (3, 134);
INSERT INTO `setting_carousel` VALUES (4, 73);

-- ----------------------------
-- Table structure for setting_information
-- ----------------------------
DROP TABLE IF EXISTS `setting_information`;
CREATE TABLE `setting_information`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of setting_information
-- ----------------------------
INSERT INTO `setting_information` VALUES (2, 134);
INSERT INTO `setting_information` VALUES (1, 73);

-- ----------------------------
-- Table structure for setting_recommend
-- ----------------------------
DROP TABLE IF EXISTS `setting_recommend`;
CREATE TABLE `setting_recommend`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of setting_recommend
-- ----------------------------
INSERT INTO `setting_recommend` VALUES (3, 134);
INSERT INTO `setting_recommend` VALUES (2, 104);
INSERT INTO `setting_recommend` VALUES (1, 63);

-- ----------------------------
-- Table structure for user_campaigns
-- ----------------------------
DROP TABLE IF EXISTS `user_campaigns`;
CREATE TABLE `user_campaigns`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `campaign` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_campaigns
-- ----------------------------
INSERT INTO `user_campaigns` VALUES (35, 'msglbo', 23, 1);
INSERT INTO `user_campaigns` VALUES (34, 'msglbo', 22, 1);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `identity` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT 0,
  `campaigns` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (2, 'msglbo', '$2a$10$1BHwPwttuG3I4ksn87uKtexAEXHTz1ZXIpGNdwtu1EYTL7JSTw7xm', '管理员', '多多吃饱了', '女', '3099558241@qq.com', 'http://127.0.0.1:9090/uploads/avatars/1700572083637.jpg', '2023-09-11 16:11:03.974', '2023-11-21 21:08:06.280', 0, '[\"22\",\"23\"]');
INSERT INTO `users` VALUES (5, 'banana', '$2a$10$I6rnRBTR7mP1iT9gNr1xve9O8NdbsrFiie4dq0y.CvxRJzdsM/Noi', '用户', '买四根香蕉', NULL, '209627304@qq.com', 'http://127.0.0.1:9090/uploads/avatars/1695146176848.jpg', '2023-09-19 23:59:48.649', '2023-09-20 01:56:23.400', 0, '');
INSERT INTO `users` VALUES (6, 'abc', '$2a$10$3NNPpemHnju8sytIowafRub4Rbi963JC/xcKIO.s2.RxT/MZm8nYS', '用户', '小狗', '女', '3099558242@qq.com', 'http://127.0.0.1:9090/uploads/avatars/1697004830543.png', '2023-10-11 14:13:27.462', '2023-10-11 14:14:05.404', 0, '');
INSERT INTO `users` VALUES (7, 'cc', '$2a$10$mUtgT5XvTc4..yjiWvESjOLBpTkmzhkZnRtuVBUix8HWlVsAWlS1S', '用户', 'cc', '男', '3099558244@qq.com', 'http://127.0.0.1:9090/uploads/avatars/1697782191600.png', '2023-10-20 14:09:31.901', '2023-10-20 14:15:09.113', 0, '');
INSERT INTO `users` VALUES (8, 'test11', '$2a$10$CKJrNVqBd75GwqM5euwYfuS8L.Q0o5aujuRC.TY1W/hVkAY3XA0L6', '用户', NULL, NULL, '24130801@qq.com', 'http://127.0.0.1:9090/uploads/avatars/1700575306676.jpg', '2023-11-21 22:01:19.749', '2023-11-21 22:01:47.693', 0, '');

SET FOREIGN_KEY_CHECKS = 1;
