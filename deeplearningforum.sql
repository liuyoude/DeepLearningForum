/*
Navicat MySQL Data Transfer

Source Server         : liuyoude
Source Server Version : 50728
Source Host           : localhost:3306
Source Database       : deeplearningforum

Target Server Type    : MYSQL
Target Server Version : 50728
File Encoding         : 65001

Date: 2020-01-02 21:57:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('5', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('9', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '4', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '4', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '4', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can view content type', '4', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('17', 'Can add session', '5', 'add_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can change session', '5', 'change_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete session', '5', 'delete_session');
INSERT INTO `auth_permission` VALUES ('20', 'Can view session', '5', 'view_session');
INSERT INTO `auth_permission` VALUES ('21', 'Can add 文章', '6', 'add_article');
INSERT INTO `auth_permission` VALUES ('22', 'Can change 文章', '6', 'change_article');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete 文章', '6', 'delete_article');
INSERT INTO `auth_permission` VALUES ('24', 'Can view 文章', '6', 'view_article');
INSERT INTO `auth_permission` VALUES ('25', 'Can add 分类', '7', 'add_category');
INSERT INTO `auth_permission` VALUES ('26', 'Can change 分类', '7', 'change_category');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete 分类', '7', 'delete_category');
INSERT INTO `auth_permission` VALUES ('28', 'Can view 分类', '7', 'view_category');
INSERT INTO `auth_permission` VALUES ('29', 'Can add 标签', '8', 'add_tag');
INSERT INTO `auth_permission` VALUES ('30', 'Can change 标签', '8', 'change_tag');
INSERT INTO `auth_permission` VALUES ('31', 'Can delete 标签', '8', 'delete_tag');
INSERT INTO `auth_permission` VALUES ('32', 'Can view 标签', '8', 'view_tag');
INSERT INTO `auth_permission` VALUES ('33', 'Can add 用户', '9', 'add_user');
INSERT INTO `auth_permission` VALUES ('34', 'Can change 用户', '9', 'change_user');
INSERT INTO `auth_permission` VALUES ('35', 'Can delete 用户', '9', 'delete_user');
INSERT INTO `auth_permission` VALUES ('36', 'Can view 用户', '9', 'view_user');
INSERT INTO `auth_permission` VALUES ('37', 'Can add 关注', '10', 'add_follow');
INSERT INTO `auth_permission` VALUES ('38', 'Can change 关注', '10', 'change_follow');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete 关注', '10', 'delete_follow');
INSERT INTO `auth_permission` VALUES ('40', 'Can view 关注', '10', 'view_follow');
INSERT INTO `auth_permission` VALUES ('41', 'Can add 评论', '11', 'add_comment');
INSERT INTO `auth_permission` VALUES ('42', 'Can change 评论', '11', 'change_comment');
INSERT INTO `auth_permission` VALUES ('43', 'Can delete 评论', '11', 'delete_comment');
INSERT INTO `auth_permission` VALUES ('44', 'Can view 评论', '11', 'view_comment');

-- ----------------------------
-- Table structure for deeplearningforum_article
-- ----------------------------
DROP TABLE IF EXISTS `deeplearningforum_article`;
CREATE TABLE `deeplearningforum_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `desc` varchar(500) NOT NULL,
  `content` longtext NOT NULL,
  `page_view` int(11) NOT NULL,
  `like_num` int(11) NOT NULL,
  `comment_num` int(11) NOT NULL,
  `time` datetime(6) NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `DeepLearningForum_ar_author_id_2218740d_fk_DeepLearn` (`author_id`),
  KEY `DeepLearningForum_ar_category_id_43745b62_fk_DeepLearn` (`category_id`),
  CONSTRAINT `DeepLearningForum_ar_author_id_2218740d_fk_DeepLearn` FOREIGN KEY (`author_id`) REFERENCES `deeplearningforum_user` (`id`),
  CONSTRAINT `DeepLearningForum_ar_category_id_43745b62_fk_DeepLearn` FOREIGN KEY (`category_id`) REFERENCES `deeplearningforum_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of deeplearningforum_article
-- ----------------------------
INSERT INTO `deeplearningforum_article` VALUES ('1', '图像风格迁移(Neural Style)简史', '面向读者：没有或有一定机器学习经验并对Prisma之类的app背后的原理感兴趣的读者。比较有经验的读者可以直接参照科技树阅读文章末罗列的引用论文。 阅读时间：10-20分钟 注：多图，请注意流量。', '<h2>Neural Style元年</h2><p>有了这么多铺垫，一切的要素已经凑齐，前置科技树也都已经被点亮了，终于可以进入正题了。基于神经网络的图像风格迁移在2015年由Gatys et al. 在两篇论文中提出：<a href=\"https://link.zhihu.com/?target=http%3A//papers.nips.cc/paper/5633-texture-synthesis-using-convolutional-neural-networks\" target=\"_blank\" rel=\"nofollow noreferrer\">Gatys et al., 2015a</a>和<a href=\"https://link.zhihu.com/?target=https%3A//arxiv.org/abs/1508.06576\" target=\"_blank\" rel=\"nofollow noreferrer\">Gatys et al., 2015b</a>。我们先说第一篇。第一篇比起之前的纹理生成算法，创新点只有一个：它给了一种用深度学习来给纹理建模的方法。之前说到纹理生成的一个重要的假设是纹理能够通过局部统计模型来描述，而手动建模方法太麻烦。于是Gatys看了一眼隔壁的物体识别论文，发现VGG19说白了不就是一堆局部特征识别器嘛。他把事先训练好的网络拿过来一看，发现这些识别器还挺好用的。于是Gatys套了个Gramian matrix上去算了一下那些不同局部特征的相关性，把它变成了一个统计模型，于是就有了一个不用手工建模就能生成纹理的方法。<br></p><figure><img src=\"https://pic1.zhimg.com/80/v2-99f6ed199359a99d9b8524d7f86ac328_hd.jpg\" normal\"=\"\" width=\"888\"></figure><p><i>基于神经网络的纹理生成算法</i></p><p>从纹理到图片风格其实只差两步。第一步也是比较神奇的，是Gatys发现<b><i>纹理能够描述一个图像的风格</i></b>。严格来说文理只是图片风格的一部分，但是不仔细研究纹理和风格之间的区别的话，乍一看给人感觉还真差不多。第二步是<b><i>如何只提取图片内容而不包括图片风格</i></b>。这两点就是他的第二篇论文做的事情：Gatys又偷了个懒，把物体识别模型再拿出来用了一遍，这次不拿Gramian算统计模型了，直接把局部特征看做近似的图片内容，这样就得到了一个把图片内容和图片风格（说白了就是纹理）分开的系统，剩下的就是把一个图片的内容和另一个图片的风格合起来。合起来的方法用的正是之前提到的让神经网络“梦到”狗的方法，也就是研究员们玩出来的Deep Dream，找到能让合适的特征提取神经元被激活的图片即可。<br></p><figure><img src=\"https://pic4.zhimg.com/80/v2-7fbd6cd3d0fe9bb7941aa4dcffe6d9ab_hd.jpg\" normal\"=\"\" width=\"950\"></figure><p><i>基于神经网络的图像风格迁移</i></p><p>至此，我们就把关于基于神经网络的图像风格迁移(Neural Style)的重点解释清楚了。背后的每一步都是前人研究的结果，不用因为名字里带深度啊神经网络啊而感觉加了什么特技，特别的高级。Gatys所做的改进是把两个不同领域的研究成果有机的结合了起来，做出了令人惊艳的结果。其实最让我惊讶的是纹理竟然能够和人们心目中认识到的图片的风格在很大程度上相吻合。（和真正的艺术风格有很大区别，但是看上去挺好看的。。。）从那之后对neural style的改进也层出不穷，在这里就先放一些图，技术细节暂且不表。</p><p><br></p><figure><img src=\"https://pic4.zhimg.com/80/v2-b483638c8b37dbd9e2c57eea652f3dc3_hd.jpg\" normal\"=\"\" width=\"542\"></figure><p><i><a href=\"https://link.zhihu.com/?target=http%3A//www.cv-foundation.org/openaccess/content_cvpr_2016/html/Li_Combining_Markov_Random_CVPR_2016_paper.html\" target=\"_blank\" rel=\"nofollow noreferrer\">改进后的图像风格迁移算法</a>，左：输入图像，中：改进前，右：改进后。生成时间：5-20分钟</i></p><p><br></p><figure><img src=\"https://pic1.zhimg.com/80/v2-d0c4a9e4008e25962beea47e10d3c508_hd.jpg\" normal\"=\"\" width=\"1183\"></figure><p><i><a href=\"https://link.zhihu.com/?target=https%3A//research.google.com/pubs/pub45832.html\" target=\"_blank\" rel=\"nofollow noreferrer\">多个预设风格的融合</a>，生成时间：少于1秒，训练时间：每个风格1-10小时</i></p><p><br></p><figure><img src=\"https://pic4.zhimg.com/80/v2-1588808c905d85d9b71572777515a947_hd.jpg\" normal\"=\"\" width=\"1683\"></figure><p><i><a href=\"https://link.zhihu.com/?target=https%3A//arxiv.org/abs/1612.04337\" target=\"_blank\" rel=\"nofollow noreferrer\">最新的实时任意风格迁移算法之一</a>，生成时间：少于10秒（<a href=\"https://link.zhihu.com/?target=https%3A//arxiv.org/abs/1703.06868\" target=\"_blank\" rel=\"nofollow noreferrer\">少于一秒的算法</a>也有，但个人认为看上去没这个好看），训练时间：10小时</i></p><p><br></p><figure><img src=\"https://pic4.zhimg.com/80/v2-ec79ae0b94c79aede2f4315a3afa19ef_hd.jpg\" normal\"=\"\" width=\"1012\"></figure><p><i><a href=\"https://link.zhihu.com/?target=https%3A//arxiv.org/abs/1705.01088\" target=\"_blank\" rel=\"nofollow noreferrer\">图片类比</a>，生成时间：5-20分钟</i></p><p>最后安利一篇与本文无关的文章吧，<a href=\"https://link.zhihu.com/?target=http%3A//distill.pub/2017/research-debt/\" target=\"_blank\" rel=\"nofollow noreferrer\">Research Debt</a>&nbsp;(原文为英语，相关知乎问题在<a href=\"https://www.zhihu.com/question/57639134\">这里</a>）是我写本文的动机。希望各位喜欢本文，也希望有余力的人能多写一些科普文。文笔不好献丑了。</p>', '0', '19', '0', '2019-12-28 17:40:19.376244', '2', '3');
INSERT INTO `deeplearningforum_article` VALUES ('4', '自然语言处理学习笔记1：自然语言处理介绍', '给外行能看懂的科普：这就叫自然语言处理 如何向文科同学科普自然语言处理（NLP）？  刘知远，NLPer 前几年曾经马少平老师的引荐，为某科普图书写过一篇短文介绍自然语言处理。如果只是介绍NLP的概念、任务和挑战，应该可以参考这篇小文。原文如下，仅供参考。', '<p><span style=\"font-weight: bold;\">一．概述</span><br>现状<br>现代nlp的主要任务已经跨越对词的研究，发展到了对句子研究，即句法、句义及句子生成的研究，已经能较好的解决句子层面的问题，但是尚未达到完全解决篇章层面的问题，尚不足以达到较为自由的人机交互。<br><br>专业技术：完全句法分析、浅层句法分析、信息抽取、词义消歧、潜在语义分析、文本蕴含和指代消解。<br><br>问题：<br>语法解析：大规模的中文分析、词性标注系统已基本达到商用，但是句法解析方面还存在精度问题。<br>语义解析: 命名实体识别、语义块已经获得了较高的精度。人工智能对知识库的研究历史悠久，已经形成了一整套的知识库的架构和推理体系。实现句子到知识库的主要方法是语义角色标注系统，但在整句理解，精度依赖于句法解析系统。<br><span style=\"font-weight: bold;\">二、三个平面的语义研究</span><br>1.词汇和本体论（关于语义意义）<br><br>词汇的语义---------&gt;对事物的编码<br><br>人在组织概念的认知机制-----&gt;范畴化<br><br>本体论-----------&gt;对领域内的真实存在做出客观描述，而不依赖于特定语言<br><br>2.格语法及框架（语法能否脱离语义而独立存在）<br><br>语义和语法相互依存，只能在抽象意义上分开，而在具体语言实例看做一体。<br><br>“格”：句子中体词（名词、代词等）和谓词（动词、形容词等）之间的及物关系。一旦被确定，句子的语义结构就被确定。<br><br>三部分：基本规则、词汇部分和转换部分<br><br>局限性：只研究了名词和动词的关系，没有考虑其他的语义关系<br><br>3. 语义角色研究<br><br>在格的影响下产生。适用于更复杂、多样的<br><br><span style=\"font-weight: bold;\">三、词汇和分词技术</span><br>1.分词规范<br><br>&nbsp;&nbsp;1）《北大（中科院）词性标注》、《现代汉语语料库加工规范》《北大现代汉语语料库基本加工规范》<br><br>&nbsp;&nbsp;北大标准包含40类词，兼顾了词的语法特征和语义特征，但是语义特征并不完备。<br><br>&nbsp;&nbsp;2）《宾州树库中文分词规范》<br><br>2.分词标准<br><br>&nbsp;1）粗粒度：词语作为最小标准。用于自然语言处理各种应用<br><br>&nbsp;2）细粒度：语素作为最小标准。用于搜索引擎<br><br>&nbsp;常用：索引时使用细粒度保证召回，查询使用粗粒度保证精度<br><br>3. 歧义<br><br>交集型歧义切分、组合型歧义切分-------&gt;词典+语言模型<br><br>词汇的构成<br>三个特性：稳固性、常用性和能产性（主要表现在产生新的词汇）<br><br>未登录词：九成专有名词、一成的通用新词和专业术语。未登录词识别即对专有名词的识别。<br><br>命名实体：专有名词和数字、日期等词<br><br>算法：基于半监督的条件随机场算法，处理不同领域的专名识别具有较低的成本和较好的效果。<br><br>ICTCLAS（NLPLR）中文自然语言处理从词法分析时代跨入了句法分析时代<br><br><span style=\"font-weight: bold;\">四、概率图模型</span><br>&nbsp;1.概率论概念<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.1概率<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;联合概率分布、边缘概率分布、条件概率分布、独立性和条件独立性<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.2 信息熵<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;概率是对事件确定性的度量，信息（信息量和信息熵）是对事物不确定性的度量。<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;信息量：离散信源信号发生的不确定性，在NLP中代表特征的不确定性。<br><br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; I(x)=-logP(x)<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;信息熵：离散信源信号发生的平均不确定性，在NLP中代表特征的不确定性的均值。<br><br>&nbsp; &nbsp; &nbsp;&nbsp;<br><br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 1)信息熵的本质是对信息量的期望<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2)信息熵上是对随机变量不确定性的分布<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3)平均分布是最不确定的分布<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.3 互信息和平均互信息<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;定义：x的后验概率与先验概率比值的对数称为y对x的互信息量，也称互信息。在NLP中是特征对应标签的不确定性，衡量了对称性。<br><br>&nbsp; &nbsp; &nbsp;&nbsp;<br><br>&nbsp; &nbsp; &nbsp;性质：(1)互信息可以认为是接受到信息X,对信源Y的不确定性的消除。<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(2)互信息是对称的。<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;平均互信息(信息增益)：<br><br>&nbsp; &nbsp; &nbsp;&nbsp;<br><br>&nbsp; &nbsp; &nbsp; 4.4&nbsp;联合熵<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;定义：借助联合概率分布对熵的自然推广，在NLP中是训练集总体不确定性。<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;公式：<br><br>&nbsp; &nbsp; &nbsp;&nbsp;<br><br>&nbsp; &nbsp; &nbsp;4.5 条件熵<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;定义：利用条件概率分布对熵的推广，熵度量的是随机变量X的不确定性，条件熵度量的则是已知Y=y后，X的不确定性。在NLP中给定标签的情况下，特征的不确定性，衡量了差异性。<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;公式：<br><br>&nbsp; &nbsp; &nbsp;&nbsp;<br><br>&nbsp; &nbsp; &nbsp; &nbsp;链式规则：<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;H(X,Y)=H(X)+H(Y|X)=H(Y)+H(X|Y)<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;I(X;Y)+H(X,Y)=H(X)+H(Y)<br><br>&nbsp; &nbsp; &nbsp; &nbsp;4.6交叉熵<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;定义：衡量两个概率分布的差异性，在NLP中是学习阶段中，不同时间点间的误差（损失函数）。在Logistic中交叉熵为其损失函数。<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;公式：<br><br>&nbsp; &nbsp; &nbsp; &nbsp;<br><br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;4.7相对熵<br><br>&nbsp; &nbsp; &nbsp; &nbsp; 定义：定义于随机变量X的状态空间熵的两个概率分布P(x)和Q(x)，可以用相对熵衡量其差异，在NLP中同样是不同时点间的误差，非对称性<br><br>&nbsp;公式：<br><br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br><br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;KL(P,Q)又称为P(x)和Q(x)的KL散度，并且KL(P,Q)不等于KL(Q,P)<br><br>五概率图模型<br>&nbsp;&nbsp;&nbsp;5.1定义：结合了概率论和图论，用图模式表达基于概率相关关系的模型的总称，目的是通过引入图模型可以将复杂的问题进行适当的分解，使得问题结构化。<br><br>&nbsp;&nbsp;&nbsp;5.2 三个基本问题<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.2.1模型的表示<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;从图模型表示上来说，可以分为贝叶斯网络和马尔科夫随机场，<br><br>贝叶斯网络采用有向无环图来表达事件的因果关系。每一个节点对应于一个先验概率分布或条件概率分布，于是联合概率分布就可以分解成单节点对应分布的乘积。<br><br>马尔科夫随机场采用无向图来表达变量间的相互作用。变量之间没有明确因果关系，因此联合概率会表达为一系列势函数乘积，通常乘积积分并不为1，因此需要通过归一化形成有效的概率分布。<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.2.2模型的学习<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;将给定的图模型，形式化为数学公式。<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;精度影响因素：1.训练集对总体的代表性<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.模型算法理论基础及所针对的问题，不同模型在不同问题上有更好的表现。<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.模型复杂度，参数估计精度越高，一般复杂度就越高，学习效率就越低。<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.2.3模型的预测<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;将新输入的样本通过学习后的模型，选取后验概率指向的最有可能的标签作结果，即<br><br>根据样本判定每种观测序列Y的概率。<br><br>&nbsp;&nbsp;&nbsp;5.3 产生式模型和判别式模型<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.3.1产生式模型<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;定义：在有限样本条件下，寻找不同数据间的最优分类面，目标是实现分类<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;核心：估计条件概率分布<br><br>代表模型：最大熵模型、条件随机场模型<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;条件随机场模型可以看做最大熵模型的序列化模型扩展。<br><br>优点：1.面向分类边界的训练<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.清晰分辨出类别之间的差异特征<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.可用于多分类的学习<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.比判别式模型简单<br><br>缺点：1.不能反应数据本身的特性，只能用于识别<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.数据量很大时，效果不高<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.缺乏灵活的建模工具和插入先验知识的方法<br><br>&nbsp; &nbsp; 评价：所有的序列标注和结构化学习&nbsp;&nbsp;<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.3.2判别式模型<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;定义：建立样本的联合概率分布，再利用模型推理预测，要求样本尽可能大。<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;核心：估计联合概率分布<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;代表模型：朴素贝叶斯模型、隐马尔科夫模型<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;隐马尔科夫模型可以看做朴素贝叶斯模型的序列化模型拓展。<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;优点：1.面向整体数据的分布<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.可以反映同类数据本身的相似度<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.模型可以进行增量学习<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.可用于数据不完整情况<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;缺点：1.计算所有变量的联合概率，占用资源大<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.类别识别精度有限<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.学习和计算过程复杂<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;评价：性能较低，适用于词性标注等<br>————————————————<br>版权声明：本文为CSDN博主「皮的开心」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。<br>原文链接：https://blog.csdn.net/asd2479745295/article/details/85108900</p>', '0', '1', '4', '2019-12-30 13:09:03.747026', '3', '1');
INSERT INTO `deeplearningforum_article` VALUES ('6', '语音增强简介', '大四上研究过一段时间NLMS，之后直到研一上做的都是关于麦克风阵列的语音增强，感觉时间久了又会记不太清楚，所以稍微整理下。', '<p>1 &nbsp;单麦克风语音增强<br><br>&nbsp; &nbsp; &nbsp; &nbsp; 麦克风，又称话筒或传声器，是一种将模拟声音信号转换成数字电子信号的换能器。按声场作用力麦克风可分为压强式麦克风、压差式麦克风和压强压差组合式麦克风。我们常用的麦克风就是压强式麦克风。用单麦克风对语音进行增强，可通过物理结构和设计滤波器两种方法实现。<br><br>(1) 物理结构实现<br><br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;指向性描述了麦克风对来自不同方向声音的灵敏度，可分为全指向性麦克风、双指向性麦克风和单一指向性麦克风。<br><br>&nbsp; &nbsp; &nbsp; &nbsp; 全指向性麦克风是压强式麦克风，是最普遍的麦克风。它只有一个入声口，传声器膜片压强的变化产生相应的输出电压。由于压强是一个标量，因而它对不同方向上的声音的灵敏度是相同的。所以这种麦克风采集四周环境的所有声音，不能增强期望语音。<br><br>&nbsp; &nbsp; &nbsp; &nbsp; 双指向性麦克风是压差式麦克风，它有两个入声口，通过其传声器膜片两侧压强差的变化产生相应的输出电压。这种麦克风可接受来自麦克风前方和后方的声音，因而如果期望信号在这两个方向上时，即可实现语音增强。<br><br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;单一指向性麦克风是压强与压差复合式麦克风，其结构上是在麦克风管的一端和管侧开口，形成一个声干涉管，如图1-1所示。来自管开口端的声音信号同时到达传声器膜片，没有相位干涉，可获得最大输出；而来自管侧的声音信号到达传声器膜片的路径不同，产生相位干涉，输出被抑制，从而可增强麦克风前端的语音信号。常见的单一指向性麦克风有心型指向性麦克风、超心型指向性麦克风和枪型指向性麦克风。<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br><br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 图1-1 声干涉管原理示意图<br><br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;规格上常用极性图来表示麦克风的指向性，如图1-2所示，每个图中虚线圆形的上方表示麦克风的前方，下方则表示麦克风的后方。<br><br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br><br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 图 1-2 各种麦克风的极性图<br><br>&nbsp; &nbsp; &nbsp; &nbsp; 这种利用物理结构特点增强后的语音在人的主观感受上有所改善，但对于语音人机交互系统来说仍达不到要求，即使是超指向性麦克风，来自管侧的干扰语音还是会严重影响语音识别的识别率。<br><br>(2) 设计滤波器实现<br><br>&nbsp; &nbsp; &nbsp; &nbsp; 将单个麦克风采集到的信号通过特别设计的滤波器，过滤掉非期望的噪声，实现语音增强。按处理域的不同可分为时域、频域和Karhunen-Loeve展开域(KLE)方法。时域方法就是设计一个最优时域滤波器来尽可能衰减噪音。频域方法是将信号变换到频域，在每个频率点上设计一个最优滤波器来衰减噪声。KLE域方法是先将麦克风采集到的数据的相关矩阵进行QR分解，利用得到的特征向量和特征值来衰减噪声。<br><br>&nbsp; &nbsp; &nbsp; &nbsp; 这种方法能提高语音的信噪比，但是也引起语音信号的失真，从而影响语音信号的可懂度。<br><br>2 麦克风阵列语音增强<br><br>&nbsp; &nbsp; &nbsp;麦克风阵列通过其拓扑结构排列来捕获空时信息，并运用这些信息来估计一些参数或提取感兴趣的信号。虽然窄带天线阵列问题已得到很好的解决，但实际上麦克风阵列遇到的问题则要复杂得多，因为语音是宽带信号，室内声场混响很高，环境和信号是非统计的，噪声可能和期望信号具有相同的空间谱特征。<br><br>&nbsp; &nbsp; &nbsp;许多麦克风阵列处理算法都是基于窄带的或是由窄带阵列简单扩展而来。这些算法的优点是已经广泛应用于天线阵列，因而仅需简单扩展就可以运用于麦克风阵列。但这些算法没有一个能适用于真实声学环境，因而简单的将这些算法应用于宽带语音处理效果并不理想。<br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;麦克风阵列语音增强主要需解决的问题有：噪声衰减，回声消除，去混响，声源定位，声源数估计，声源分离和“鸡尾酒会效应”。与单麦克风语音增强算法不同，运用麦克风阵列要在保证期望信号不失真的情况下尽可能衰减噪声。<br><br>3 &nbsp;盲源分离<br><br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;盲源分离问题起源于20世纪80年代，最早应用于数字通信系统。它是要在不知道输入信号任何信息和信道传播特性的情况下对混合输出信号进行分离，估计出输入信号。在生物医学及图像处理方面，盲源分离已有了很好的应用。<br><br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;在盲源分离问题中，独立成分分析是应用最为广泛的工具，因为它充分利用了输入信号的独立性。当各输入信号是瞬时线性混合时，独立成分分析能很好的将信号分离开来，然而在室内混响环境中，独立成分分析效果则不理想。尽管最近很多基于独立成分分析的理论方法被提出，但现在仍然不知道它怎样运用于语音声学环境中。因此基于卷积模型的盲源分离方法应运而生，它优化了输入信号的混合模型，更符合现实语音混合模型，但是基于此模型的相关算法有待进一步完善，以更好的应用。<br><br>4 &nbsp;麦克风阵列语音增强的研究进展<br><br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;语音增强和阵列技术的研究开展较早，虽然随着数字信号处理领域相关理论的完善和成熟，这两项技术也取得了一定的成果，但最早的语音增强重点研究单个麦克风语音增强，最早的阵列技术也是利用窄带天线阵列进行探测，而将阵列技术运用到语音增强中来，则始于20世纪80年代，并在90年代成为研究热点。国内的相关研究则更晚。每年国际国内重要期刊和会议上都会有大量相关的文献文章。<br><br>(1) 固定波束形成法<br><br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;固定波束形成法又称延迟-相加波束形成法，最早是由Flanagan于1985年提出的。它先对麦克风阵列各阵元接收到的声音信号进行时延补偿，使各阵元的信号同步，然后设计一个有限长度滤波器进行加权求和，输出的信号就是增强后的信号。因为设计的滤波器系数在处理过程中是固定不变的，所以称这种方法为固定波束形成法。<br><br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;这种方法的实现比较简单，但它需要较多的麦克风阵元才能达到较好的语音增强效果。<br><br>(2) 自适应波束形成法<br><br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;最早的自适应波束形成法是Frost于1972年提出的线性约束最小方差(Linearly Constrained Minimum Variance，LCMV)算法。该方法也称为Frost波束形成法，它在保证注视方向(Look&nbsp;direction)上期望信号频率响应不变的同时，通过约束条件使得阵列输出功率最小，即等价于使阵列输出噪声功率最小，从而实现噪声抑制。在此算法的基础上，Griffths和Jim于1982年提出广义旁瓣抵消(Generalized Sidelobe Canceler，GSC)算法，通过引入阻塞矩阵，将有约束的Frost滤波器扩展为无约束的GSC滤波器。GSC算法将阵列输出通过上下两个通道，上通道产生语音参考信号，下通道产生噪声参考信号，然后用语音参考信号减去噪声参考信号，从而得到增强信号。这种方法最大的问题在于噪声参考信号中并不仅仅都是噪声信号，也可能包含一些语音信号，这样在相减时可能抵消部分语音信号，造成语音信号失真。为了解决这一问题，许多学者对算法进行了改进，比如Hoshuyma于1996年提出的韧性自适应波束形成法，改进了阻塞矩阵，使得噪声参考信号中的语音成分最小，从而减小了信号失真。因为设计的滤波器系数在处理过程中是随着输入信号的变化而变化的，所以称这种方法为自适应波束形成法。<br><br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;自适应波束形成法能有效衰减相干噪声，在麦克风阵元数大于声源数时有较好的处理效果。<br><br>(3) 后置滤波法<br><br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;在麦克风阵列中运用后置滤波器进行波束形成的方法是由Zelinski于1988年提出的。该方法以维纳滤波器为基础，在延时-相加波束形成器的输出端加一个滤波器，通过求解Wiener-Hopf方程来求得滤波器系数。在此基础上，许多学者通过不同的方法提出许多不同的后置滤波器，比如McCowan于2002年提出的广义后置滤波器法，就是将噪声场中相关理论模型扩展到后置滤波器的转移函数中，从而改善滤波器性能。<br><br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;后置滤波器法一般不单独使用，而是与固定波束形成器或自适应波束形成器结合使用，这样通过自适应波束形成器衰减相干噪声，通过后置滤波器衰减非相干噪声，从而更好的抑制了噪声。<br><br>(4) 子空间法<br><br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;子空间法是先对每个麦克风阵元的信号使用单通道子空间或利用输入信号的相关矩阵子空间构建信号子空间，然后采用固定波束形成或自适应波束形成实现语音增强。这种算法分别由Hansen和Asano于1997年提出，并在之后的几年里被其他学者不断完善，比如Doclo等提出的基于广义奇异值分解的波束形成法。<br><br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;子空间法最大的缺点是计算复杂度太大，难于实时应用于数字信号处理。<br><br>(5) 子带波束形成法<br><br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;针对语音信号是宽带信号这一特点，许多学者于21世纪初提出了子带波束形成法。这种方法先将麦克风采集到的声音信号从时域经过傅里叶变换到频域，然后将频带分段，在每一段运用窄带波束形成法产生输出，然后逆傅里叶变换到时域，从而得到增强后的语音信号。比如McCowan于2001年，Grbic于2003年提出的基于均匀DFT子带波束形成法。<br><br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;子带波束形成法具有噪声抑制能力强，收敛速度快等优点。<br><br>(6) 频率不变波束形成法<br><br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;一般波束形成法在不同频段的波束形成效果不同，实际应用中男声的频率一般低于女声的频率，导致一般的波束形成法对男声和女声的增强效果不同。针对这一问题，许多学者提出了频率不变波束形成法，即波束形成效果不随频率的改变而改变。这一方法的关键在于频率不变波束形成器的设计，如1970年Hixson和Au等提出利用谐波嵌套法，1988年Doles和Benedict提出的利用非均匀阵列的渐近理论设计法，2002年Weiss等提出的倍频分解法。<br><br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;在线性阵列的基础上，Chan和Chen于2002年提出了圆阵频率不变波束形成器，于2005年到2007年扩展到同轴圆阵和同轴球型阵，从而将波束形成由一维扩展到二维和三维。<br>————————————————<br>版权声明：本文为CSDN博主「g放松放松」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。<br>原文链接：https://blog.csdn.net/qq_44945010/article/details/89435714</p>', '0', '1', '0', '2019-12-31 20:53:36.353266', '4', '2');
INSERT INTO `deeplearningforum_article` VALUES ('7', '图神经网络(GNN)的简介', '近年来，图神经网络(GNN)在社交网络、知识图、推荐系统甚至生命科学等各个领域得到了越来越广泛的应用。GNN在对图节点之间依赖关系进行建模的强大功能，使得与图分析相关的研究领域取得了突破。本文介绍了图神经网络的基本原理，以及两种高级的算法，DeepWalk和GraphSage。', '<p>近年来，图神经网络(GNN)在社交网络、知识图、推荐系统甚至生命科学等各个领域得到了越来越广泛的应用。GNN在对图节点之间依赖关系进行建模的强大功能，使得与图分析相关的研究领域取得了突破。本文介绍了图神经网络的基本原理，以及两种高级的算法，DeepWalk和GraphSage。<br></p><p><strong>图(Graph)</strong></p><p>在讨论GNN之前，我们先来了解一下什么是图。在计算机科学中，图是由顶点和边两部分组成的一种数据结构。图G可以通过顶点集合V和它包含的边E来进行描述。</p><p><img src=\"http://pic.rmb.bdstatic.com/09483b0b389f5cbfcfd771ccba877bf6.png@wm_2,t_55m+5a625Y+3L+S6keagluekvuWMug==,fc_ffffff,ff_U2ltSGVp,sz_4,x_3,y_3\"></p><p>根据顶点之间是否存在方向依赖关系，边可以是有向的，也可以是无向的。</p><p><img src=\"http://pic.rmb.bdstatic.com/b89a7b522ee974298723217c72efdf3a.png@wm_2,t_55m+5a625Y+3L+S6keagluekvuWMug==,fc_ffffff,ff_U2ltSGVp,sz_5,x_4,y_4\"></p><p>图 1有向图</p><p>顶点也称为节点,在本文中，这两个术语是可以互换。</p><h3>图神经网络</h3><p>图神经网络是一种直接作用于图结构上的神经网络。GNN的一个典型应用是节点分类,本质上，图中的每个节点都与一个标签相关联，我们希望预测未标记节点的标签。本文将介绍<strong>该论文</strong>中描述的算法,</p><p>在节点分类问题中，每个节点v都可以用其特征x_v表示并且与已标记的标签t_v相关联。给定部分标记的图G，目标是利用这些标记的节点来预测未标记的节点标签。它通过学习得到每个节点的d维向量（状态）表示为h_v，同时包含其相邻节点的信息。</p><p><img src=\"http://pic.rmb.bdstatic.com/165246e6c7e6d709e8738d629930bd14.png@wm_2,t_55m+5a625Y+3L+S6keagluekvuWMug==,fc_ffffff,ff_U2ltSGVp,sz_14,x_9,y_9\"></p><p>x_co[v] 代表连接顶点v的边的特征，h_ne[v]代表顶点v的邻居节点的嵌入表示，x_ne[v]代表顶点v的邻居节点特征。f是将输入投影到d维空间的转移函数,由于要求出h_v的唯一解，我们应用Banach不动点理论重写上述方程进行迭代更新。</p><p><img src=\"http://pic.rmb.bdstatic.com/85fda18baca7917cd17febb82ca6d3a1.png@wm_2,t_55m+5a625Y+3L+S6keagluekvuWMug==,fc_ffffff,ff_U2ltSGVp,sz_8,x_5,y_5\"></p><p>H和X分别表示所有h和x的连接,通过将状态h_v以及特征x_v传递给输出函数g来计算GNN的输出。</p><p><img src=\"http://pic.rmb.bdstatic.com/ba1ae8141a75d6523166b235f0b3f2e7.png@wm_2,t_55m+5a625Y+3L+S6keagluekvuWMug==,fc_ffffff,ff_U2ltSGVp,sz_7,x_5,y_5\"></p><p>这里的f和g都可以解释为全连接前馈神经网络,L1损失可以直接表述为如下函数：</p><p><img src=\"http://pic.rmb.bdstatic.com/e9ae65b33e65d20b7adbc43addeee283.png@wm_2,t_55m+5a625Y+3L+S6keagluekvuWMug==,fc_ffffff,ff_U2ltSGVp,sz_9,x_6,y_6\"></p><p>它可以通过梯度下降进行优化，但是该论文指出的原始GNN有三个主要局限：<br></p><p>1.如果放宽了“固定点”的假设，则可以利用多层感知器来学习更稳定的表示，并删除迭代更新过程。 这是因为在原始方法中，不同的迭代使用转移函数f的相同参数，而不同MLP层中的不同参数允许分层特征提取；</p><p>2.不能处理边缘信息（例如知识图谱中的不同边可能表示节点之间的不同关系）；</p><p>3. 固定点会限制节点分布的多样化，因此可能不适合学习节点表示。</p><p>虽然现在已经提出了几种GNN变体来解决上述问题。 但是他们不是论文的重点。</p><h3>DeepWalk</h3><p>DeepWalk是第一个以无监督学习的节点嵌入算法。它在训练过程中类似于词嵌入。它的目的是让图中的节点分布和语料库中的单词分布都遵循幂律，如下图所示：</p><p><img src=\"http://pic.rmb.bdstatic.com/b3f316f9d4f71724b078f6e4c45fcf86.png@wm_2,t_55m+5a625Y+3L+S6keagluekvuWMug==,fc_ffffff,ff_U2ltSGVp,sz_14,x_9,y_9\"></p><p>算法包括两个步骤：</p><p>1. 在图中的节点上执行随机游走生成节点序列;</p><p>2. 运行skip-gram，根据步骤1中生成的节点序列学习每个节点的嵌入;</p><p>在随机游走过程中，下一个节点是从前一节点的邻居统一采样。然后将每个序列截短为长度为2 | w |+1的子序列，其中w表示skip-gram中的窗口大小。如果您不熟悉skip-gram，我之前的博客文章已经向您介绍它的工作原理。</p><p>在论文中，分层softmax用于解决由于节点数量庞大而导致的softmax计算成本过高的问题。为了计算每个单独输出元素的softmax值，我们必须为所有元素k计算ek。</p><p><img src=\"http://pic.rmb.bdstatic.com/1e892ddab5a47863c9d07b6c0d604a45.png@wm_2,t_55m+5a625Y+3L+S6keagluekvuWMug==,fc_ffffff,ff_U2ltSGVp,sz_10,x_7,y_7\"></p><p>图 2 softmax的定义</p><p>因此，原始softmax的计算时间是 O(|V|) ，其中其中V表示图中的顶点集。</p><p>多层的softmax利用二叉树来解决softmax计算成本问题。 在二叉树中，所有叶子节点（上面所说的图中的v1，v2，... v8）都是图中的顶点。 在每个内部节点中（除了叶子节点以外的节点，也就是分枝结点），都通过一个二元分类器来决定路径的选取。 为了计算某个顶点v_k的概率，可以简单地计算沿着从根节点到叶子节点v_k的路径中的每个子路径的概率。 由于每个节点的孩子节点的概率和为1，因此在多层softmax中，所有顶点的概率之和等于1的特性仍然能够保持。如果n是叶子的数量，二叉树的最长路径由O（log（n））限定，因此，元素的计算时间复杂度将减少到O（log | V |）。</p><p><img src=\"http://pic.rmb.bdstatic.com/8faccc69926cd475c1252386261e4de0.png@wm_2,t_55m+5a625Y+3L+S6keagluekvuWMug==,fc_ffffff,ff_U2ltSGVp,sz_13,x_9,y_9\"></p><p>图 3多层softmax</p><p>在训练DeepWalk GNN之后，模型已经学习到了每个节点的表示，如下图所示。不同的颜色在输入图中（图a）表示不同标签。 我们可以看到，在输出图中，具有相同标签的节点聚集在一起，而具有不同标签的大多数节点被正确分开。</p><p><img src=\"http://pic.rmb.bdstatic.com/374bb9aeff8dc4d7245ee28aaaab2747.png@wm_2,t_55m+5a625Y+3L+S6keagluekvuWMug==,fc_ffffff,ff_U2ltSGVp,sz_15,x_10,y_10\"></p><p>然而，DeepWalk的主要问题是它缺乏泛化能力。每当有新节点加入到图中时，它必须重新训练模型以正确表示该节点。因此，这种GNN不适用于图中节点不断变化的动态图。</p><h3>GraphSage</h3><p>GraphSage提供了解决上述问题的方案，它以归纳方式学习每个节点的嵌入。具体来讲，它将每个节点用其邻域的聚合重新表示。因此，即使在训练期间未出现的新节点，也仍然可以由其相邻节点正确地表示。下图展示了GraphSage的算法过程：</p><p><img src=\"http://pic.rmb.bdstatic.com/9459cb1af5fa2b143a479c7d3e53365a.png@wm_2,t_55m+5a625Y+3L+S6keagluekvuWMug==,fc_ffffff,ff_U2ltSGVp,sz_16,x_10,y_10\"></p><p>外层for循环表示更新迭代次数，而 h^k_v 表示节点v在迭代第 k次时的本征向量。在每次迭代时，将通过聚合函数，前一次迭代中v和v领域的本征向量以及权重矩阵W^k来更新h^k_v。这篇论文提出了三种聚合函数：<br></p><p>1.均值聚合器：</p><p>均值聚合器取一个节点及其邻域的本征向量的平均值。</p><p></p><p><img src=\"http://pic.rmb.bdstatic.com/272229706f61535ed7bd178c77edcfe7.png@wm_2,t_55m+5a625Y+3L+S6keagluekvuWMug==,fc_ffffff,ff_U2ltSGVp,sz_14,x_9,y_9\"></p><p>与原始方程相比，它删除了上述伪代码中第5行的连接操作。这种操作可以被视为\"skip-connection\" (\"跳连接\")，这篇论文后面将证明其可以在很大程度上提高模型的性能。</p><p>2. LSTM聚合器：</p><p>由于图中的节点没有任何顺序，因此他们通过互换这些节点来随机分配顺序。</p><p>3.池聚合器：</p><p>此运算符在相邻顶点集上执行逐元素池化函数。下面显示了最大池的例子：</p><p><img src=\"http://pic.rmb.bdstatic.com/dc57d50b3062a6953a1def60609d83a1.png@wm_2,t_55m+5a625Y+3L+S6keagluekvuWMug==,fc_ffffff,ff_U2ltSGVp,sz_15,x_10,y_10\"></p><p>可以用平均池或任何其他对称池函数替换这种最大池函数。尽管均值池和最大池聚合器性能相似，但是池聚合器（也就是说采用最大池函数）被实验证明有最佳的性能。 论文使用max-pooling作为默认聚合函数。损失函数定义如下：</p><p><img src=\"http://pic.rmb.bdstatic.com/dbfee0d636a7f938cf3f9bd2bc151df2.png@wm_2,t_55m+5a625Y+3L+S6keagluekvuWMug==,fc_ffffff,ff_U2ltSGVp,sz_16,x_10,y_10\"></p><p>其中u 和v 共同出现在一定长度的随机游走中，而 v_n 是不与u共同出现的负样本。这种损失函数鼓动节点在投影空间中更靠近嵌入距离更近的节点，而与那些相距很远的节点分离。通过这种方法，节点将获得越来越多其邻域的信息。</p><p>GraphSage通过聚合其附近的节点，可以为看不见的节点生成可表示的嵌入位置。它让节点嵌入的方式可以被应用于涉及动态图的研究领域，这类动态图的图的结构是可以不断变化的。例如，Pinterest采用了GraphSage的扩展版本PinSage作为他们的内容探索系统的核心。</p>', '0', '1', '0', '2019-12-31 21:53:20.254573', '4', '4');
INSERT INTO `deeplearningforum_article` VALUES ('8', '语义分割江湖的那些事儿——从旷视说起', '今天的主题是 Face++ Detection 组近两年持续在做的 Semantic Segmentation相关工作，代表性成果主要有 1）GCN (CVPR2017)、2）DFN (CVPR2018)、3）BiSeNet (ECCV2018)', '<div><div><p>今天的主题是 Face++ Detection 组近两年持续在做的 Semantic Segmentation相关工作，代表性成果主要有 1）GCN (CVPR2017)、2）DFN (CVPR2018)、3）BiSeNet (ECCV2018)。我们先来看一段演示 Demo：</p><div><div><div><div><div><div><div><iframe frameborder=\"0\" allowfullscreen=\"\" src=\"https://www.zhihu.com/video/1070011872610164736?autoplay=false&amp;useMSE=\"></iframe></div></div></div><div><div>CVPR2018 DFN算法结果展示</div></div></div><div></div></div></div></div><h2>回顾</h2><p>介绍算法之前，我们先简单回顾一下语义分割（semantic segmentation）的历史。众所周知，计算机视觉有三大核心任务——分类、检测、分割，三者号称是深度学习炼丹师的“三大浪漫”。分类针对整张图片，检测针对图片的局部，语义分割则如图1所示，旨在给输入图片上的每个像素赋予一个正确的语义标签。</p><figure><img src=\"https://pic2.zhimg.com/80/v2-63fb029028871c74486194eca97ebbbd_hd.jpg\" width=\"731\"><figcaption>图 1：PASCAL VOC 2012 图片示例</figcaption></figure><p>传统的分割算法我们先按下不表。时间拨回到 2015 年，语义分割江湖之中，FCN 横空出世，自此 DL/NN 方法席卷了整个语义分割领域。短短几年，各个 Benchmark 的 state-of-the-art 不断刷新，成果喜人。</p><p>FCN 前期阶段，研究重点主要是解决“网络逐渐衰减的特征尺寸和需要原图尺寸的预测之间的矛盾”，换言之，就是如何解决网络不断 downsample 造成的信息损失；期间百家争鸣，百花齐放，涌现了希望保存或者恢复信息的 unpool、deconv 等方法，也出现了进行结构预测的各种花式 CRF 方法。</p><p>“大道之争”之中，碰撞出了两个最重要的设计：U-shape Structure 和 Dilation Conv，据此形成当下语义分割领域网络设计最常见的两大派系：1）U-shape 联盟以 RefineNet、GCN、DFN 等算法为代表；2）Dilation 联盟以 PSPNet、Deeplab 系列方法为代表；随着 Base Model 性能不断提升，语义分割任务的主要矛盾也逐渐渐演变为“如何更有效地利用 context”；这中间又是一番腥风血雨，我们今天介绍的 3 位主角也在其中贡献了一份力量。</p><h2>介绍</h2><p>语义分割任务同时需要 Spatial Context 和 Spatial Detail 。今天我们介绍的三种算法都将从这两方面分别提出各自对应的解决方案。整体对比如下：</p><figure><img src=\"https://pic3.zhimg.com/80/v2-3b7eddc57b5a564f964d93c2a8ef81b2_hd.jpg\" normal\"=\"\" width=\"942\"></figure><p><br></p><p><b>Global Convolutional Network</b></p><p>第一位主角是 CVPR2017 算法 Global Convolutional Network（GCN），江湖人送外号“Large Kernel”。论文 Arxiv 链接请见：<a href=\"https://link.zhihu.com/?target=https%3A//arxiv.org/abs/1703.02719\" target=\"_blank\" rel=\"nofollow noreferrer\">https://arxiv.org/abs/1703.02719</a>。</p><p>——Motivation——</p><p>GCN 主要将 Semantic Segmentation分解为：Classification 和 Localization两个问题。但是，这两个任务本质对特征的需求是矛盾的，Classification需要特征对多种Transformation具有不变性，而 Localization需要对 Transformation比较敏感。但是，普通的 Segmentation Model大多针对 Localization Issue设计，正如图2(b)所示，而这不利于 Classification。</p><figure><img src=\"https://pic2.zhimg.com/80/v2-03dc6c56da8758a0a028de84b8f0da91_hd.jpg\" width=\"1108\"><figcaption>图2</figcaption></figure><p>所以，为了兼顾这两个 Task，本文提出了两个 Principle：</p><ol><li>从 Localization 来看，我们需要全卷积网络，而且不能有全连接或者全局池化等操作丢失位置信息。</li><li>从 Classification 来看，我们需要让 Per-pixel Classifier 或者 Feature Map 上每个点的连接更稠密一些，也就需要更大的 Kernel Size，如图 2(c) 所示。</li></ol><p><br></p><p>——网络结构——</p><p>根据这两条 Principle，本文提出了Global Convolutional Network（GCN）。如图3所示，这个方法整体结构正是背景介绍中提到的U-shape结构，其核心模块主要包括：GCN 和 BR。</p><figure><img src=\"https://pic4.zhimg.com/80/v2-d968e1bce8f6ed484248af1aad7b37df_hd.jpg\" width=\"1998\"><figcaption>图3 网络结构</figcaption></figure><p>此处主要介绍GCN设计。正如图3(b)所示，它采用了较大 Kernel Size的卷积核，来同时解决上述的两个 Issue；然后根据矩阵分解，利用&nbsp;<img src=\"https://www.zhihu.com/equation?tex=1+%5Ctimes+k+%2B+k+%5Ctimes+1\" alt=\"[公式]\" eeimg=\"1\">&nbsp;和&nbsp;<img src=\"https://www.zhihu.com/equation?tex=k+%5Ctimes+1+%2B+1+%5Ctimes+k\" alt=\"[公式]\" eeimg=\"1\">&nbsp;的卷积来替代原来的&nbsp;<img src=\"https://www.zhihu.com/equation?tex=k+%5Ctimes+k\" alt=\"[公式]\" eeimg=\"1\">&nbsp;大核卷积。相对于原本的大核卷积，该设计能明显降低参数量和计算量。图4可视化了 Large Kernel Conv 和 普通 Conv网络有效感受野的对比。</p><figure><img src=\"https://pic2.zhimg.com/80/v2-fcf0ca4bdc87fd1a7dd19d995bc99ba1_hd.jpg\" width=\"2354\"><figcaption>图4</figcaption></figure><p>可以看到，Large Kernel Conv 的有效感受野显著增大。</p><p>——实验——</p><p>文中为了验证 Large Kernel Conv的有效性，对比了不同 Size的 Kernel，可以看到Kernel Size=15时比 Base Network整整高了 5.5% mean IoU.</p><figure><img src=\"https://pic4.zhimg.com/80/v2-3ac9b96ec335d0aa91f524aaba2fd557_hd.jpg\" normal\"=\"\" width=\"1196\"></figure><p>此外，文中还对 Large Kernel Conv 进行了一系列讨论。</p><ul><li>GCN 的有效是否得益于更多的参数？<br>在GCN中，随着 Kernel Size的增加，网络参数也随之增长，那么网络性能的提升是否得益于使用了更多的参数？为了证明提升来自于设计的有效性而不是增加了复杂度，文中设计了不同 Kernel Size的GCN和普通Conv的对比实验。<br></li></ul><figure><img src=\"https://pic2.zhimg.com/80/v2-5cd913f21e1505ff8eaf4e18c7159741_hd.jpg\" normal\"=\"\" width=\"1148\"></figure><p><br>通过实验结果可知，随着 Kernel Size的增加，普通 Conv的参数量远大于GCN，但是GCN的性能却持续地优于普通 Conv。</p><ul><li>GCN使用 Large Kernel Size增大了感受野，是否可以通过堆叠多个 Small Kernel Size的 Conv来替代？<br>文章为此设计了实验对比两者的结果。<br></li></ul><figure><img src=\"https://pic1.zhimg.com/80/v2-790f6facf90e8140c46937a6005cf594_hd.jpg\" normal\"=\"\" width=\"1106\"></figure><p><br>可以看到 GCN 依然优于普通 Conv 的堆叠，尤其是在较大 Kernel Size 的情况下。笔者认为这是一个很有价值的实验，可以启发我们去思考关于网络感受野的问题。我们以往认为，通过堆叠多个小核 Conv 可以达到和大核 Conv 一样的感受野，同时计算量还更少。最常见的应用比如 VGG-Net。但是，实际上并非如此。</p><p>随着网络深度的提升，理论上网络的感受野大多可以直接覆盖全图，但是实际有效感受野却远小于此。笔者的理解是对同一个 Feature Map 进行卷积，边缘区域进行计算的次数会小于中心区域，所以随着 Conv 的不断堆叠，实际上会导致边缘感受野的衰减，即有效感受野会远小于理论感受野。</p><p>最后文中给出了在 PASCAL VOC 2012 和 Cityscapes 上完整的 Training Strategy，这在当时还是很良心的，之前的一些 Paper 对此都语焉不详。具体详细的 Training 过程请参考原文。</p><p>最终 GCN 在 PASCAL VOC 2012 和 Cityscapes 上都取得了不错的结果。</p><p>——PASCAL VOC 2012——</p><figure><img src=\"https://pic4.zhimg.com/80/v2-43feba6ea1470e72c952985c7253c03b_hd.jpg\" normal\"=\"\" width=\"942\"></figure><p>——Cityscapes——</p><figure><img src=\"https://pic4.zhimg.com/80/v2-6f0996052c4873c468f07c0b443a5dbb_hd.jpg\" normal\"=\"\" width=\"848\"></figure><p><b>Discriminative Feature Network</b></p><p>接下来出场的是 CVPR2018 算法 Discriminative Feature Network（DFN）。论文Arxiv链接请见：<a href=\"https://link.zhihu.com/?target=https%3A//arxiv.org/abs/1804.09337\" target=\"_blank\" rel=\"nofollow noreferrer\">https://arxiv.org/abs/1804.09337</a>。详细解读请见：<a href=\"https://link.zhihu.com/?target=https%3A//mp.weixin.qq.com/s/4csAftUmJErdA4qn26mO3Q\" target=\"_blank\" rel=\"nofollow noreferrer\">CVPR 2018 | 旷视科技Face++提出用于语义分割的判别特征网络DFN</a>。</p><p>——Motivation——</p><p>本文总结了现有语义分割方法仍然有待解决的两类 Challenge（如图 5 所示）：</p><ul><li>Intra-class Inconsistency（具有相同的语义标签，不同的表观特征的区域）</li><li>Inter-class Indistinction（具有不同的语义标签，相似的表观特征的区域）</li></ul><figure><img src=\"https://pic4.zhimg.com/80/v2-7ce3db0acd06901a5542ec09a968f23f_hd.jpg\" width=\"372\"><figcaption>图5</figcaption></figure><p>所以，本文从宏观角度出发重新思考语义分割任务，提出应该将同一类的 Pixel考虑成一个整体，也就需要增强类内一致性，增大类间区分性。总结而言，我们需要更具有判别力的特征。</p><p>——网络结构——</p><p>本文提出的DFN主要包括两部分：Smooth Network 和 Border Network，如图6所示。</p><figure><img src=\"https://pic4.zhimg.com/80/v2-956741d4c876c47495c3a92d3eb49027_hd.jpg\" width=\"2314\"><figcaption>图6</figcaption></figure><p>Smooth Network 主要解决类内不一致性问题。文中认为类内不一致性问题主要来自Context 的缺乏。进而，我们需要引入 Multi-scale Context 和 Global Context；但是，不同 Stage 的特征虽然带来了 Multi-scale Context，与此同时也带来了不同的判别能力；因此，我们需要对这些具有不同判别力的特征进行筛选，这就诞生了其中核心的设计——Channel Attention Block（CAB）。</p><p>CAB 利用相邻 Stage 的特征计算 Channel Attention 然后对 Low-stage 的特征进行筛选，如图 7 所示。因为文中认为，High-stage 的特征语义信息更强，更具有判别力。</p><figure><img src=\"https://pic2.zhimg.com/80/v2-73d97a9d201916679bd6b7b0349e3ead_hd.jpg\" width=\"1138\"><figcaption>图7</figcaption></figure><p>此外，本文首次在 U-shape 结构中采用 Global Average Pooling，这个设计非常有效。ParseNet 首次在语义分割中使用 Global Average Pooling 提取 Global Context，而之后的 PSPNet，Deeplab V3 将其在 Dilation 阵营发扬光大。而本文将其应用 U-shape 的High-stage，并命名为“V-shape”。我们尝试将其迁移到 Detection 中的 FPN 结构，结果证明同样有效。</p><p>Border Network 主要解决类间低区分性的问题。文中认为具有相似表观特征的不同区域很容易被网络混淆，尤其是相邻之时。所以，需要增大特征之间的区分性。为此文章显式地引入了 Semantic Boundary 来引导特征学习。因为 Low-stage 主要关注一些细节边缘区域，而随着语义的增强，High-stage 的特征才是更多关注语义边界，所以 Border Network 采用了“反 U-shape”结构。</p><p>——实验——</p><p>文中进行了丰富的消融实验和可视化分析。</p><p>首先是对 Smooth Network 各部分的消融实验分析。可以看到Smooth Network非常有效，在PASCAL VOC 2012 Validation Set上可以达到 Single Scale 79.54% mean IoU。</p><figure><img src=\"https://pic3.zhimg.com/80/v2-04a1ddca4304ba6e8b48b25d72c6643e_hd.jpg\" normal\"=\"\" width=\"1104\"></figure><p>而通过可视化输出，可以看到Smooth Network确实可以将类内区域变得更加一致，如图8所示。</p><figure><img src=\"https://pic3.zhimg.com/80/v2-a0ab4d6038be427470993c2331a7f462_hd.jpg\" width=\"1118\"><figcaption>图8</figcaption></figure><p>同时，文中还对 Smooth Network 和 Border Network 进行了消融实验分析。</p><figure><img src=\"https://pic3.zhimg.com/80/v2-e886e1265e0155937b7814aa842e1ace_hd.jpg\" normal\"=\"\" width=\"1114\"></figure><p>通过可视化Border Network的输出，可以看到Border Network确实可以很好地关注到Semantic Boundary区域，如图9所示。</p><figure><img src=\"https://pic3.zhimg.com/80/v2-2e91c1e396d71b09d28295c85b37d8c2_hd.jpg\" width=\"1136\"><figcaption>图9</figcaption></figure><p>最终，DFN在PASCAL VOC 2012和 Cityscapes上性能都达到了当时的state-of-the-art。</p><figure><img src=\"https://pic1.zhimg.com/80/v2-1a8cab79710ffce549f25960249fc484_hd.jpg\" normal\"=\"\" width=\"1114\"></figure><figure><img src=\"https://pic4.zhimg.com/80/v2-57e5c0f5ca8a033db029cdbf42ebf6ef_hd.jpg\" normal\"=\"\" width=\"1104\"></figure><p><b>BiSeNet</b></p><p>最后出场的主角是 ECCV 2018 算法 Bilateral Segmentation Network（BiSeNet）。前面两个算法主要关注 Accuracy，探索 mean IoU 的极限；而 BiSeNet 关注于做出一个既快又好的实时语义分割算法。最终该算法在 Cityscapes 上能取得 68.4% mean IoU 105 FPS (NVIDIA Titan XP)的好成绩。当然，我们希望这篇工作能抛砖引玉，尝试探讨到底什么架构才更适合 Segmentation 任务，什么框架才能很好地同时获得充足的 Context 和丰富的空间信息？论文 Arxiv 链接请见：<a href=\"https://link.zhihu.com/?target=https%3A//arxiv.org/abs/1808.00897\" target=\"_blank\" rel=\"nofollow noreferrer\">https://arxiv.org/abs/1808.00897</a>。</p><p>详细解读请见：<a href=\"https://link.zhihu.com/?target=https%3A//mp.weixin.qq.com/s%3Fsrc%3D11%26timestamp%3D1548222143%26ver%3D1383%26signature%3DPCnMz4pSEsFyyq15KiBVLtI9Eeb14066FE7-PLfcp7vebrkqBlRH363YUEv6ZnajCamYK%2AvcAaThKUxsl9EWOmFpeZtxKOPywWHcU93sWPGXYWlCwpK-370iuIYb3yj4%26new%3D1\" target=\"_blank\" rel=\"nofollow noreferrer\">ECCV 2018 | 旷视科技提出双向网络BiSeNet：实现实时语义分割</a>。</p><p>——Motivation——</p><p>本文对之前的实时性语义分割算法进行了总结，发现当前主要有三种加速方法：1) 通过 Crop 或者 Resize 限制输入图片进而减少计算量；2) 减少网络通道数，尤其是 Early Stage；3) 还有像 ENet 类似的方法直接丢掉最后一个 Stage，如图10(a)所示。</p><p>这些提速的方法会丢失很多 Spatial Details 或者牺牲 Spatial Capacity，从而导致精度大幅下降。为了弥补空间信息的丢失，有些算法会采用 U-shape 的方式恢复空间信息。但是，U-shape 会降低速度，同时很多丢失的信息并不能简单地通过融合浅层特征来恢复，如图 10(b) 所示。</p><figure><img src=\"https://pic1.zhimg.com/80/v2-c054323b0bc68a8f09449f2af1852440_hd.jpg\" width=\"1838\"><figcaption>图10</figcaption></figure><p>总结而言，实时性语义分割算法中，加速的同时也需要重视空间信息。基于这些观察，本文提出了一种新的解决方案Bilateral Segmentation Network（BiSeNet）。</p><p>——网络结构——</p><p>BiSeNet区别于 U-shape 和 Dilation 结构，尝试一种新的方法同时保持 Spatial Context 和 Spatial Detail 。所以，我们设计了Spatial Path和Context Path两部分。顾名思义，Spatial Path使用较多的 Channel、较浅的网络来保留丰富的空间信息生成高分辨率特征；Context Path使用较少的 Channel、较深的网络快速 downsample来获取充足的 Context。基于这两路网络的输出，文中还设计了一个Feature Fusion Module（FFM）来融合两种特征，如图11所示。</p><figure><img src=\"https://pic2.zhimg.com/80/v2-05a2778cbc7b4a9b4d9e853da4e5f7cd_hd.jpg\" width=\"1844\"><figcaption>图11</figcaption></figure><p>Spatial Path 只包含三个&nbsp;<img src=\"https://www.zhihu.com/equation?tex=stride%3D2\" alt=\"[公式]\" eeimg=\"1\">&nbsp;的 Conv+BN+Relu，输出特征图的尺寸为原图的&nbsp;<img src=\"https://www.zhihu.com/equation?tex=1%2F8\" alt=\"[公式]\" eeimg=\"1\">&nbsp;。为了访存比考虑，此处并没有设计 Residual结构。</p><p>Context Path 可以替换成任意的轻量网络，比如 Xception，ShuffleNet 系列，MobileNet 系列。本文主要采用 Xception39 和 ResNet-18 进行实验。可以看到，为了准确率考虑，Context Path 这边使用了类似 U-shape 结构的设计。不过，不同于普通的 U-shape，此处只结合了最后两个 Stage，这样设计的原因主要是考虑速度。此外，和 DFN 类似，Context Path 依然在最后使用了 Global Average Pooling 来直接获取Global Context。</p><p>最后，文章中提到因为两路网络关注的信息不同，属于 Different Level 的特征，所以文中设计了一个 FFM 结构来有效融合两路特征。</p><p>——实验——</p><p>本文从精度和速度两个维度，进行了丰富的分析实验。</p><p>首先文中分析了 Context Path 这边使用不同变体的 U-shape 结构的速度和精度的对比。</p><figure><img src=\"https://pic3.zhimg.com/80/v2-8dd85c2d033ad3395c8744db7259ea6e_hd.jpg\" normal\"=\"\" width=\"1830\"></figure><p>此处，U-shape-8s 就是文中所展示的结构，U-shape-4s 则是普通的 U-shape 设计，即融合了更多 stage 特征。可以看到，U-shape-4s 的速度会明显慢于 U-shape-8s.</p><p>文中还对 BiSeNet 的各个部分进行了消融分析实验。</p><figure><img src=\"https://pic4.zhimg.com/80/v2-cada7b675a9144ad62410a8ef21c3b63_hd.jpg\" normal\"=\"\" width=\"1826\"></figure><p>文中还给出了 BiSeNet 的 GFLOPS、参数量等信息，以及在不同硬件平台不同分辨率下的速度对比。</p><figure><img src=\"https://pic4.zhimg.com/80/v2-5cc496dbb7ec519fb1fd4d30016ebecb_hd.jpg\" normal\"=\"\" width=\"1820\"></figure><figure><img src=\"https://pic4.zhimg.com/80/v2-c7c59c032f66957e3027f14b2c801863_hd.jpg\" normal\"=\"\" width=\"1854\"></figure><p>文中给出了 BiSeNet 分别与实时性算法和非实时性算法比较的结果。</p><p>与实时性算法比较：</p><figure><img src=\"https://pic4.zhimg.com/80/v2-b26ab50b58f3b7d4cecf05d219c0c74b_hd.jpg\" normal\"=\"\" width=\"1826\"></figure><p>虽然 BiSeNet 是实时性算法，但是它的精度甚至比一些非实时性算法还高。</p><p>与非实时性算法比较：</p><figure><img src=\"https://pic3.zhimg.com/80/v2-5642984b51a472e9e74fbc44c027577e_hd.jpg\" normal\"=\"\" width=\"1814\"></figure><p>可以看到，BiSeNet 是一种很有效的设计。当替换上大模型之后，精度甚至高于 PSPNet 等算法。另外，需要注意的是，为了和非实时性算法进行比较，在关注精度这部分实验 BiSeNet 使用的不同于关注速度部分的 Setting，具体细节详见论文。</p><p>BiSeNet 算法对实时性语义分割算法提出了新的思考，在提升速度的同时也需要关注空间信息。同时，该设计也是一次对 Segmentation Backbone 的思考，希望设计一个对 Segmentation 任务友好的框架，当然现在还存在许多需要改进的地方。此外，该方法不仅仅可应用于实时性语义分割算法，也可应用于其他领域，尤其是在对 Spatial Detail 和 Context 同时有需求的情况下。据笔者了解，已有研究将其应用于 Potrait Segmentation.</p><h2>重要的事情</h2><ul><li>我们的 DFN 和 BiSeNet 均已开源，后续将有更多的语义分割算法复现开源出来，欢迎大家 Star 和 Contribute：</li></ul><a target=\"_blank\" href=\"https://link.zhihu.com/?target=https%3A//github.com/ycszen/TorchSeg\">https://github.com/ycszen/TorchSeg<svg fill=\"currentColor\" viewBox=\"0 0 24 24\" width=\"17\" height=\"17\"><path d=\"M6.77 17.23c-.905-.904-.94-2.333-.08-3.193l3.059-3.06-1.192-1.19-3.059 3.058c-1.489 1.489-1.427 3.954.138 5.519s4.03 1.627 5.519.138l3.059-3.059-1.192-1.192-3.059 3.06c-.86.86-2.289.824-3.193-.08zm3.016-8.673l1.192 1.192 3.059-3.06c.86-.86 2.289-.824 3.193.08.905.905.94 2.334.08 3.194l-3.059 3.06 1.192 1.19 3.059-3.058c1.489-1.489 1.427-3.954-.138-5.519s-4.03-1.627-5.519-.138L9.786 8.557zm-1.023 6.68c.33.33.863.343 1.177.029l5.34-5.34c.314-.314.3-.846-.03-1.176-.33-.33-.862-.344-1.176-.03l-5.34 5.34c-.314.314-.3.846.03 1.177z\" fill-rule=\"evenodd\"></path></svg>github.com<div><svg fill=\"currentColor\" viewBox=\"0 0 24 24\" width=\"32\" height=\"32\"><path d=\"M11.991 3C7.023 3 3 7.032 3 12s4.023 9 8.991 9C16.968 21 21 16.968 21 12s-4.032-9-9.009-9zm6.237 5.4h-2.655a14.084 14.084 0 0 0-1.242-3.204A7.227 7.227 0 0 1 18.228 8.4zM12 4.836A12.678 12.678 0 0 1 13.719 8.4h-3.438A12.678 12.678 0 0 1 12 4.836zM5.034 13.8A7.418 7.418 0 0 1 4.8 12c0-.621.09-1.224.234-1.8h3.042A14.864 14.864 0 0 0 7.95 12c0 .612.054 1.206.126 1.8H5.034zm.738 1.8h2.655a14.084 14.084 0 0 0 1.242 3.204A7.188 7.188 0 0 1 5.772 15.6zm2.655-7.2H5.772a7.188 7.188 0 0 1 3.897-3.204c-.54.999-.954 2.079-1.242 3.204zM12 19.164a12.678 12.678 0 0 1-1.719-3.564h3.438A12.678 12.678 0 0 1 12 19.164zm2.106-5.364H9.894A13.242 13.242 0 0 1 9.75 12c0-.612.063-1.215.144-1.8h4.212c.081.585.144 1.188.144 1.8 0 .612-.063 1.206-.144 1.8zm.225 5.004c.54-.999.954-2.079 1.242-3.204h2.655a7.227 7.227 0 0 1-3.897 3.204zm1.593-5.004c.072-.594.126-1.188.126-1.8 0-.612-.054-1.206-.126-1.8h3.042c.144.576.234 1.179.234 1.8s-.09 1.224-.234 1.8h-3.042z\"></path></svg></div></a><ul><li>欢迎各位同学加入旷视科技 Face++ Detection Team，简历可以投递给 Detection 组负责人俞刚 （<b>yugang@megvii.com</b>）</li></ul><p><br></p><p>Reference</p><p>[1] Peng, C., Zhang, X., Yu, G., Luo, G., &amp; Sun, J. (2017). Large kernel matters—improve semantic segmentation by global convolutional network. In&nbsp;<i>Computer Vision and Pattern Recognition (CVPR), 2017 IEEE Conference on</i>(pp. 1743-1751). IEEE.</p><p>[2] Yu, C., Wang, J., Peng, C., Gao, C., Yu, G., &amp; Sang, N. (2018). Learning a Discriminative Feature Network for Semantic Segmentation.<i>arXiv preprint arXiv:1804.09337</i>.</p><p>[3] Yu, C., Wang, J., Peng, C., Gao, C., Yu, G., &amp; Sang, N. (2018, September). Bisenet: Bilateral segmentation network for real-time semantic segmentation. In<i>European Conference on Computer Vision</i>(pp. 334-349). Springer, Cham.</p><p>[4] Long, J., Shelhamer, E., &amp; Darrell, T. (2015). Fully convolutional networks for semantic segmentation. In<i>Proceedings of the IEEE conference on computer vision and pattern recognition</i>(pp. 3431-3440).</p><p>[5] Ronneberger, O., Fischer, P., &amp; Brox, T. (2015, October). U-net: Convolutional networks for biomedical image segmentation. In<i>International Conference on Medical image computing and computer-assisted intervention</i>(pp. 234-241). Springer, Cham.</p><p>---------解读者介绍-------</p><p>余昌黔，华中科技大学自动化系在读博士，旷视科技研究院算法实习生，语义分割算法DFN、BiSeNet 第一作者，研究方向涵盖语义分割、全景分割、快速分割、视频分割等，并在上述方向有着长期深入的研究；2018 年，参加计算机视觉顶会 ECCV 挑战赛 COCO+Mapillary，分获全景分割（Panoptic Segmentation）两项冠军，并受邀作现场口头报告。个人网页：</p><a target=\"_blank\" href=\"https://link.zhihu.com/?target=http%3A//changqianyu.me/\">Changqian Yu<svg fill=\"currentColor\" viewBox=\"0 0 24 24\" width=\"17\" height=\"17\"><path d=\"M6.77 17.23c-.905-.904-.94-2.333-.08-3.193l3.059-3.06-1.192-1.19-3.059 3.058c-1.489 1.489-1.427 3.954.138 5.519s4.03 1.627 5.519.138l3.059-3.059-1.192-1.192-3.059 3.06c-.86.86-2.289.824-3.193-.08zm3.016-8.673l1.192 1.192 3.059-3.06c.86-.86 2.289-.824 3.193.08.905.905.94 2.334.08 3.194l-3.059 3.06 1.192 1.19 3.059-3.058c1.489-1.489 1.427-3.954-.138-5.519s-4.03-1.627-5.519-.138L9.786 8.557zm-1.023 6.68c.33.33.863.343 1.177.029l5.34-5.34c.314-.314.3-.846-.03-1.176-.33-.33-.862-.344-1.176-.03l-5.34 5.34c-.314.314-.3.846.03 1.177z\" fill-rule=\"evenodd\"></path></svg>changqianyu.me<img alt=\"图标\" src=\"https://pic1.zhimg.com/v2-c28ce91ad3cd05659cdf2f5e8b459cb8_120x160.jpg\"></a><p></p></div></div><div>编辑于 2019-01-23</div>', '0', '1', '2', '2020-01-01 15:02:00.250537', '5', '3');
INSERT INTO `deeplearningforum_article` VALUES ('9', '元旦', '元旦', '<p>新年快乐新年快乐新年快乐新年快乐新年快乐新年快乐新年快乐新年快乐新年快乐信息信新年快乐新年快乐洗你在哪<br></p>', '0', '1', '4', '2020-01-01 15:27:39.594342', '6', '1');
INSERT INTO `deeplearningforum_article` VALUES ('10', '测试', '的好好睡觉', '<p><span style=\"font-weight: bold;\">不长脑子睡觉觉下班到家等级对吧几点结束都不喜欢心慌慌的解答解答惊喜就多吧奖学金还打不打</span><br></p>', '0', '1', '0', '2020-01-01 15:28:01.834801', '7', '4');
INSERT INTO `deeplearningforum_article` VALUES ('11', '立项某祥异闻录-其一', '恭喜祥哥成功脱单！！', '<p align=\"left\">立项某祥异闻录-其一<br>恭喜祥哥成功脱单！！</p><p>某黑人小姐姐离奇怀孕，立项某祥却神秘地出现在现场，</p><p>究竟是人性的泯灭？还是道德的沦丧？</p><p>敬请关注《立项某祥异闻录》</p><p><img alt=\"[坏笑]\" src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/50/pcmoren_huaixiao_org.png\" data-w-e=\"1\"><img alt=\"[坏笑]\" src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/50/pcmoren_huaixiao_org.png\" data-w-e=\"1\"><b></b><i></i><u></u><sub></sub><sup></sup><strike></strike><br></p>', '0', '0', '1', '2020-01-01 15:49:06.536450', '8', '4');
INSERT INTO `deeplearningforum_article` VALUES ('24', 'adsdas', 'dadsda', '<p>fdsasdhkfsdjkfhaskj考虑的撒发哈考虑到回复客户的数量卡还是分开来哈迪斯卡了</p>', '0', '0', '0', '2020-01-02 15:57:34.580384', '2', '4');

-- ----------------------------
-- Table structure for deeplearningforum_article_tag
-- ----------------------------
DROP TABLE IF EXISTS `deeplearningforum_article_tag`;
CREATE TABLE `deeplearningforum_article_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `DeepLearningForum_article_tag_article_id_tag_id_91c41354_uniq` (`article_id`,`tag_id`),
  KEY `DeepLearningForum_ar_tag_id_7c89f20c_fk_DeepLearn` (`tag_id`),
  CONSTRAINT `DeepLearningForum_ar_article_id_98f05e48_fk_DeepLearn` FOREIGN KEY (`article_id`) REFERENCES `deeplearningforum_article` (`id`),
  CONSTRAINT `DeepLearningForum_ar_tag_id_7c89f20c_fk_DeepLearn` FOREIGN KEY (`tag_id`) REFERENCES `deeplearningforum_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of deeplearningforum_article_tag
-- ----------------------------
INSERT INTO `deeplearningforum_article_tag` VALUES ('1', '1', '20');
INSERT INTO `deeplearningforum_article_tag` VALUES ('2', '1', '33');
INSERT INTO `deeplearningforum_article_tag` VALUES ('8', '4', '32');
INSERT INTO `deeplearningforum_article_tag` VALUES ('9', '4', '36');
INSERT INTO `deeplearningforum_article_tag` VALUES ('12', '6', '21');
INSERT INTO `deeplearningforum_article_tag` VALUES ('13', '7', '7');
INSERT INTO `deeplearningforum_article_tag` VALUES ('14', '7', '8');
INSERT INTO `deeplearningforum_article_tag` VALUES ('15', '7', '38');
INSERT INTO `deeplearningforum_article_tag` VALUES ('17', '8', '9');
INSERT INTO `deeplearningforum_article_tag` VALUES ('16', '8', '19');
INSERT INTO `deeplearningforum_article_tag` VALUES ('18', '9', '9');
INSERT INTO `deeplearningforum_article_tag` VALUES ('19', '10', '1');
INSERT INTO `deeplearningforum_article_tag` VALUES ('20', '10', '17');
INSERT INTO `deeplearningforum_article_tag` VALUES ('21', '11', '39');
INSERT INTO `deeplearningforum_article_tag` VALUES ('35', '24', '2');
INSERT INTO `deeplearningforum_article_tag` VALUES ('36', '24', '6');
INSERT INTO `deeplearningforum_article_tag` VALUES ('37', '24', '41');

-- ----------------------------
-- Table structure for deeplearningforum_category
-- ----------------------------
DROP TABLE IF EXISTS `deeplearningforum_category`;
CREATE TABLE `deeplearningforum_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of deeplearningforum_category
-- ----------------------------
INSERT INTO `deeplearningforum_category` VALUES ('1', '自然语言处理');
INSERT INTO `deeplearningforum_category` VALUES ('2', '语音识别');
INSERT INTO `deeplearningforum_category` VALUES ('3', '图像处理');
INSERT INTO `deeplearningforum_category` VALUES ('4', '其他');

-- ----------------------------
-- Table structure for deeplearningforum_comment
-- ----------------------------
DROP TABLE IF EXISTS `deeplearningforum_comment`;
CREATE TABLE `deeplearningforum_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8mb4 NOT NULL,
  `time` datetime(6) NOT NULL,
  `article_id` int(11) NOT NULL,
  `pid_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `comment_num` int(11) NOT NULL,
  `like_num` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `DeepLearningForum_co_article_id_55568ac2_fk_DeepLearn` (`article_id`),
  KEY `DeepLearningForum_co_user_id_d2fd2ff2_fk_DeepLearn` (`user_id`),
  KEY `DeepLearningForum_co_pid_id_be852ddc_fk_DeepLearn` (`pid_id`),
  CONSTRAINT `DeepLearningForum_co_article_id_55568ac2_fk_DeepLearn` FOREIGN KEY (`article_id`) REFERENCES `deeplearningforum_article` (`id`),
  CONSTRAINT `DeepLearningForum_co_pid_id_be852ddc_fk_DeepLearn` FOREIGN KEY (`pid_id`) REFERENCES `deeplearningforum_comment` (`id`),
  CONSTRAINT `DeepLearningForum_co_user_id_d2fd2ff2_fk_DeepLearn` FOREIGN KEY (`user_id`) REFERENCES `deeplearningforum_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of deeplearningforum_comment
-- ----------------------------
INSERT INTO `deeplearningforum_comment` VALUES ('8', '<p>终于成功了?</p>', '2019-12-30 19:35:35.673665', '4', null, '2', '2', '1');
INSERT INTO `deeplearningforum_comment` VALUES ('12', '恭喜恭喜', '2019-12-30 22:11:46.960821', '4', '8', '3', '0', '0');
INSERT INTO `deeplearningforum_comment` VALUES ('13', '<p>哈哈哈?</p>', '2019-12-31 09:21:07.307371', '4', null, '2', '0', '0');
INSERT INTO `deeplearningforum_comment` VALUES ('14', '跳转不对？', '2019-12-31 09:25:18.278839', '4', '8', '2', '0', '0');
INSERT INTO `deeplearningforum_comment` VALUES ('23', '<p><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/50/pcmoren_huaixiao_org.png\" alt=\"[坏笑]\" data-w-e=\"1\"><br></p>', '2020-01-01 15:51:38.141956', '11', null, '2', '0', '2');
INSERT INTO `deeplearningforum_comment` VALUES ('29', '<p><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/50/pcmoren_huaixiao_org.png\" alt=\"[坏笑]\" data-w-e=\"1\"><br></p>', '2020-01-02 10:43:24.879536', '9', null, '2', '0', '0');
INSERT INTO `deeplearningforum_comment` VALUES ('30', '<p>?<br></p>', '2020-01-02 10:43:52.268280', '9', null, '2', '1', '0');
INSERT INTO `deeplearningforum_comment` VALUES ('31', '哈哈，太秀了', '2020-01-02 10:45:40.434969', '9', '30', '2', '0', '0');
INSERT INTO `deeplearningforum_comment` VALUES ('32', '<p>?<br></p>', '2020-01-02 10:46:44.627277', '9', null, '2', '0', '0');
INSERT INTO `deeplearningforum_comment` VALUES ('34', '<p><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/50/pcmoren_huaixiao_org.png\" alt=\"[坏笑]\" data-w-e=\"1\"><br></p>', '2020-01-02 10:48:42.317504', '8', null, '2', '1', '0');
INSERT INTO `deeplearningforum_comment` VALUES ('35', '哈哈，太秀了', '2020-01-02 10:48:46.950107', '8', '34', '2', '0', '0');

-- ----------------------------
-- Table structure for deeplearningforum_follow
-- ----------------------------
DROP TABLE IF EXISTS `deeplearningforum_follow`;
CREATE TABLE `deeplearningforum_follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime(6) NOT NULL,
  `followed_id_id` int(11) NOT NULL,
  `follower_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `DeepLearningForum_fo_followed_id_id_2a4c1d94_fk_DeepLearn` (`followed_id_id`),
  KEY `DeepLearningForum_fo_follower_id_id_6151631d_fk_DeepLearn` (`follower_id_id`),
  CONSTRAINT `DeepLearningForum_fo_followed_id_id_2a4c1d94_fk_DeepLearn` FOREIGN KEY (`followed_id_id`) REFERENCES `deeplearningforum_user` (`id`),
  CONSTRAINT `DeepLearningForum_fo_follower_id_id_6151631d_fk_DeepLearn` FOREIGN KEY (`follower_id_id`) REFERENCES `deeplearningforum_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of deeplearningforum_follow
-- ----------------------------
INSERT INTO `deeplearningforum_follow` VALUES ('4', '2019-12-31 16:51:57.646781', '3', '2');
INSERT INTO `deeplearningforum_follow` VALUES ('5', '2019-12-31 20:37:07.230992', '3', '4');
INSERT INTO `deeplearningforum_follow` VALUES ('7', '2019-12-31 20:41:46.584665', '2', '4');
INSERT INTO `deeplearningforum_follow` VALUES ('8', '2020-01-01 15:02:16.628732', '4', '5');
INSERT INTO `deeplearningforum_follow` VALUES ('9', '2020-01-01 15:02:20.694856', '3', '5');
INSERT INTO `deeplearningforum_follow` VALUES ('10', '2020-01-01 15:02:22.468114', '2', '5');
INSERT INTO `deeplearningforum_follow` VALUES ('12', '2020-01-01 15:11:24.328351', '4', '2');
INSERT INTO `deeplearningforum_follow` VALUES ('13', '2020-01-01 15:26:26.504832', '5', '7');
INSERT INTO `deeplearningforum_follow` VALUES ('14', '2020-01-01 15:29:00.811563', '7', '8');
INSERT INTO `deeplearningforum_follow` VALUES ('15', '2020-01-01 15:29:04.677224', '6', '8');
INSERT INTO `deeplearningforum_follow` VALUES ('16', '2020-01-01 15:30:09.533754', '6', '7');
INSERT INTO `deeplearningforum_follow` VALUES ('17', '2020-01-01 15:30:15.431978', '2', '7');
INSERT INTO `deeplearningforum_follow` VALUES ('18', '2020-01-01 16:18:13.275105', '7', '2');
INSERT INTO `deeplearningforum_follow` VALUES ('24', '2020-01-02 16:19:54.856205', '6', '2');
INSERT INTO `deeplearningforum_follow` VALUES ('25', '2020-01-02 19:11:01.245575', '8', '2');

-- ----------------------------
-- Table structure for deeplearningforum_tag
-- ----------------------------
DROP TABLE IF EXISTS `deeplearningforum_tag`;
CREATE TABLE `deeplearningforum_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of deeplearningforum_tag
-- ----------------------------
INSERT INTO `deeplearningforum_tag` VALUES ('1', 'RNN');
INSERT INTO `deeplearningforum_tag` VALUES ('2', 'LSTM');
INSERT INTO `deeplearningforum_tag` VALUES ('3', 'GRU');
INSERT INTO `deeplearningforum_tag` VALUES ('4', 'CNN');
INSERT INTO `deeplearningforum_tag` VALUES ('5', 'GAN');
INSERT INTO `deeplearningforum_tag` VALUES ('6', 'Autoencoder');
INSERT INTO `deeplearningforum_tag` VALUES ('7', 'GNN');
INSERT INTO `deeplearningforum_tag` VALUES ('8', 'GCN');
INSERT INTO `deeplearningforum_tag` VALUES ('9', 'CVPR');
INSERT INTO `deeplearningforum_tag` VALUES ('10', 'AAAI');
INSERT INTO `deeplearningforum_tag` VALUES ('11', 'ICLR');
INSERT INTO `deeplearningforum_tag` VALUES ('12', 'SCI');
INSERT INTO `deeplearningforum_tag` VALUES ('13', 'IEEE');
INSERT INTO `deeplearningforum_tag` VALUES ('14', 'ICASSP');
INSERT INTO `deeplearningforum_tag` VALUES ('15', '论文笔记');
INSERT INTO `deeplearningforum_tag` VALUES ('16', '图像分类');
INSERT INTO `deeplearningforum_tag` VALUES ('17', '图像增强');
INSERT INTO `deeplearningforum_tag` VALUES ('18', '图像超分辨率');
INSERT INTO `deeplearningforum_tag` VALUES ('19', '图像语义分割');
INSERT INTO `deeplearningforum_tag` VALUES ('20', '风格迁移');
INSERT INTO `deeplearningforum_tag` VALUES ('21', '语音识别');
INSERT INTO `deeplearningforum_tag` VALUES ('22', '语音增强');
INSERT INTO `deeplearningforum_tag` VALUES ('23', '语音超频');
INSERT INTO `deeplearningforum_tag` VALUES ('24', '语音分类');
INSERT INTO `deeplearningforum_tag` VALUES ('25', '语音事件检测');
INSERT INTO `deeplearningforum_tag` VALUES ('26', '语音情感识别');
INSERT INTO `deeplearningforum_tag` VALUES ('27', '文本分类与聚类');
INSERT INTO `deeplearningforum_tag` VALUES ('28', '信息抽取');
INSERT INTO `deeplearningforum_tag` VALUES ('29', '情感分析');
INSERT INTO `deeplearningforum_tag` VALUES ('30', '信息检索');
INSERT INTO `deeplearningforum_tag` VALUES ('31', '机器翻译');
INSERT INTO `deeplearningforum_tag` VALUES ('32', '语义分析');
INSERT INTO `deeplearningforum_tag` VALUES ('33', '风格迁移的发展');
INSERT INTO `deeplearningforum_tag` VALUES ('34', '自然语言处理简介');
INSERT INTO `deeplearningforum_tag` VALUES ('35', '方向发展');
INSERT INTO `deeplearningforum_tag` VALUES ('36', '笔记');
INSERT INTO `deeplearningforum_tag` VALUES ('37', 'WaveNet');
INSERT INTO `deeplearningforum_tag` VALUES ('38', '非结构序列处理');
INSERT INTO `deeplearningforum_tag` VALUES ('39', '立项某祥异闻录');
INSERT INTO `deeplearningforum_tag` VALUES ('40', '测试');
INSERT INTO `deeplearningforum_tag` VALUES ('41', 'sada');

-- ----------------------------
-- Table structure for deeplearningforum_user
-- ----------------------------
DROP TABLE IF EXISTS `deeplearningforum_user`;
CREATE TABLE `deeplearningforum_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `avatar` varchar(200) NOT NULL,
  `desc` varchar(50) NOT NULL,
  `followed_num` int(11) NOT NULL,
  `follower_num` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of deeplearningforum_user
-- ----------------------------
INSERT INTO `deeplearningforum_user` VALUES ('1', 'pbkdf2_sha256$150000$BqBDSv2mh1nO$4UcQxL5IE/OXTcB1yoeFyTF+qgi2FEFQ+lg+ra/eWqs=', '2019-12-30 11:30:57.168775', '1', 'root', '', '', '2859648675@qq.com', '1', '1', '2019-12-28 16:40:20.692172', 'static/img/avatar/default.png', '这个人很懒，还没有留下简介哦', '0', '0');
INSERT INTO `deeplearningforum_user` VALUES ('2', 'pbkdf2_sha256$150000$paGPNcA4YljF$AAbYFZP458FdQo6antrt47rhBnb66Uh5FiVvknkQYyo=', '2020-01-02 16:11:04.559000', '0', '何处天涯觅知音', '', '', 'admin@qq.com', '0', '1', '2019-12-28 16:42:06.705129', 'static/img/avatar/2020/01/20200102213946_78.jpg', '渴望在深度学习有所发展的小白', '5', '3');
INSERT INTO `deeplearningforum_user` VALUES ('3', 'pbkdf2_sha256$150000$5Rnbwj8kR0sr$UAcE60N1mMeio0k/at7YTutdfDTfbqveBeUgf8AToxQ=', '2019-12-30 15:13:50.630893', '0', '逆风飞翔', '', '', '1289254@qq.com', '0', '1', '2019-12-30 13:01:59.309219', 'static/img/avatar/default.png', '这个人很懒，还没有留下简介哦', '0', '3');
INSERT INTO `deeplearningforum_user` VALUES ('4', 'pbkdf2_sha256$150000$VWUWTsVLnICq$zwKKAhkgMC4JZWAC7CiHtGeLWgVHCL/LQQA9Gjmp6jI=', '2019-12-31 20:36:57.349421', '0', '逆水寒', '', '', 'liuyoude@hrbeu.edu.cn', '0', '1', '2019-12-31 20:36:57.336455', 'static/img/avatar/2020/01/20200101144403_70.jpg', '好好学习天天向上', '2', '2');
INSERT INTO `deeplearningforum_user` VALUES ('5', 'pbkdf2_sha256$150000$2DaWc6T00YoM$5hFnUjzvo7boGF2lpT4z7TssBlERSH0pbylpdiYG1+k=', '2020-01-01 14:57:48.342063', '0', '吾往矣', '', '', '111111@qq.com', '0', '1', '2020-01-01 14:57:48.325108', 'static/img/avatar/2020/01/20200101150355_1.jpg', '尽吾志而不能至，可以无悔矣', '3', '1');
INSERT INTO `deeplearningforum_user` VALUES ('6', 'pbkdf2_sha256$150000$96uD0db3UMds$vIsQYB8gvx2lWmLVc6OSbENY+SqOhxPsbllh6yWpMOU=', '2020-01-01 15:24:44.762958', '0', '正直的桂圆', '', '', '13516494337@163.com', '0', '1', '2020-01-01 15:24:44.747998', 'static/img/avatar/default.png', '这个人很懒，还没有留下简介哦', '0', '3');
INSERT INTO `deeplearningforum_user` VALUES ('7', 'pbkdf2_sha256$150000$DSg5IB0iseHD$8grHrYs5L1/jniQwRpAGJnjlKrKwsoautrhFa0Jh8Zc=', '2020-01-01 15:25:02.152447', '0', 'liuyoude', '', '', '666666@qq.com', '0', '1', '2020-01-01 15:25:02.133497', 'static/img/avatar/2020/01/20200101153808_65.jpg', '测试ing', '3', '2');
INSERT INTO `deeplearningforum_user` VALUES ('8', 'pbkdf2_sha256$150000$9fD1qJTm7Y9i$Vyn9PJ8V3Vybn6wA7OR2R00BJ3upJ5hE1pPBkOTkK3g=', '2020-01-01 15:28:50.720554', '0', '九州散人', '', '', '1606677627@qq.com', '0', '1', '2020-01-01 15:28:50.711577', 'static/img/avatar/default.png', '这个人很懒，还没有留下简介哦', '2', '1');

-- ----------------------------
-- Table structure for deeplearningforum_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `deeplearningforum_user_groups`;
CREATE TABLE `deeplearningforum_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `DeepLearningForum_user_groups_user_id_group_id_f8578e51_uniq` (`user_id`,`group_id`),
  KEY `DeepLearningForum_user_groups_group_id_7115941d_fk_auth_group_id` (`group_id`),
  CONSTRAINT `DeepLearningForum_us_user_id_6f72eaa9_fk_DeepLearn` FOREIGN KEY (`user_id`) REFERENCES `deeplearningforum_user` (`id`),
  CONSTRAINT `DeepLearningForum_user_groups_group_id_7115941d_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of deeplearningforum_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for deeplearningforum_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `deeplearningforum_user_user_permissions`;
CREATE TABLE `deeplearningforum_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `DeepLearningForum_user_u_user_id_permission_id_17fb2ada_uniq` (`user_id`,`permission_id`),
  KEY `DeepLearningForum_us_permission_id_0793b41e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `DeepLearningForum_us_permission_id_0793b41e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `DeepLearningForum_us_user_id_6af178b1_fk_DeepLearn` FOREIGN KEY (`user_id`) REFERENCES `deeplearningforum_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of deeplearningforum_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_DeepLearningForum_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_DeepLearningForum_user_id` FOREIGN KEY (`user_id`) REFERENCES `deeplearningforum_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2019-12-28 16:43:54.113871', '1', '自然语言处理', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('2', '2019-12-28 16:44:01.626765', '2', '语音识别', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('3', '2019-12-28 16:44:04.844159', '3', '图像处理', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('4', '2019-12-28 16:44:25.485459', '1', 'RNN', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('5', '2019-12-28 16:44:30.611749', '2', 'LSTM', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('6', '2019-12-28 16:44:37.669870', '3', 'GRU', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('7', '2019-12-28 16:44:42.986730', '4', 'CNN', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('8', '2019-12-28 16:44:49.020512', '5', 'GAN', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('9', '2019-12-28 16:45:00.165702', '6', 'Autoencoder', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('10', '2019-12-28 16:45:05.565260', '7', 'GNN', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('11', '2019-12-28 16:45:09.540627', '8', 'GCN', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('12', '2019-12-28 16:45:29.627900', '9', 'CVPR', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('13', '2019-12-28 16:45:36.071665', '10', 'AAAI', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('14', '2019-12-28 16:45:48.316913', '11', 'ICLR', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('15', '2019-12-28 16:45:54.058065', '12', 'SCI', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('16', '2019-12-28 16:46:00.686850', '13', 'IEEE', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('17', '2019-12-28 16:46:07.960653', '14', 'ICASSP', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('18', '2019-12-28 16:46:23.965587', '15', '论文笔记', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('19', '2019-12-28 16:46:34.287979', '16', '图像分类', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('20', '2019-12-28 16:46:42.178874', '17', '图像增强', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('21', '2019-12-28 16:46:58.680737', '18', '图像超分辨率', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('22', '2019-12-28 16:47:06.917705', '19', '图像语义分割', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('23', '2019-12-28 16:47:15.514710', '20', '风格迁移', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('24', '2019-12-28 16:47:22.892977', '21', '语音识别', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('25', '2019-12-28 16:47:28.817131', '22', '语音事件检测', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('26', '2019-12-28 16:47:35.646864', '23', '语音超频', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('27', '2019-12-28 16:47:43.626521', '24', '语音分类', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('28', '2019-12-28 16:47:55.416985', '25', '语音事件检测', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('29', '2019-12-28 16:48:01.489743', '26', '语音情感识别', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('30', '2019-12-28 16:48:07.940489', '27', '文本分类与聚类', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('31', '2019-12-28 16:48:14.078073', '28', '信息抽取', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('32', '2019-12-28 16:48:21.604941', '29', '情感分析', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('33', '2019-12-28 16:48:27.062344', '30', '信息检索', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('34', '2019-12-28 16:48:32.948615', '31', '机器翻译', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('35', '2019-12-28 16:48:42.355455', '32', '语义分析', '1', '[{\"added\": {}}]', '8', '1');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('6', 'DeepLearningForum', 'article');
INSERT INTO `django_content_type` VALUES ('7', 'DeepLearningForum', 'category');
INSERT INTO `django_content_type` VALUES ('11', 'DeepLearningForum', 'comment');
INSERT INTO `django_content_type` VALUES ('10', 'DeepLearningForum', 'follow');
INSERT INTO `django_content_type` VALUES ('8', 'DeepLearningForum', 'tag');
INSERT INTO `django_content_type` VALUES ('9', 'DeepLearningForum', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2019-12-28 16:38:01.139916');
INSERT INTO `django_migrations` VALUES ('2', 'contenttypes', '0002_remove_content_type_name', '2019-12-28 16:38:01.181804');
INSERT INTO `django_migrations` VALUES ('3', 'auth', '0001_initial', '2019-12-28 16:38:01.221697');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0002_alter_permission_name_max_length', '2019-12-28 16:38:01.319436');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0003_alter_user_email_max_length', '2019-12-28 16:38:01.324422');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0004_alter_user_username_opts', '2019-12-28 16:38:01.330406');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0005_alter_user_last_login_null', '2019-12-28 16:38:01.334395');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0006_require_contenttypes_0002', '2019-12-28 16:38:01.336391');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0007_alter_validators_add_error_messages', '2019-12-28 16:38:01.341377');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0008_alter_user_username_max_length', '2019-12-28 16:38:01.345366');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0009_alter_user_last_name_max_length', '2019-12-28 16:38:01.350353');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0010_alter_group_name_max_length', '2019-12-28 16:38:01.375286');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0011_update_proxy_permissions', '2019-12-28 16:38:01.380273');
INSERT INTO `django_migrations` VALUES ('14', 'DeepLearningForum', '0001_initial', '2019-12-28 16:38:01.547825');
INSERT INTO `django_migrations` VALUES ('15', 'admin', '0001_initial', '2019-12-28 16:38:01.854006');
INSERT INTO `django_migrations` VALUES ('16', 'admin', '0002_logentry_remove_auto_add', '2019-12-28 16:38:01.901878');
INSERT INTO `django_migrations` VALUES ('17', 'admin', '0003_logentry_add_action_flag_choices', '2019-12-28 16:38:01.910854');
INSERT INTO `django_migrations` VALUES ('18', 'sessions', '0001_initial', '2019-12-28 16:38:01.923819');
INSERT INTO `django_migrations` VALUES ('19', 'DeepLearningForum', '0002_auto_20191228_1735', '2019-12-28 17:35:17.714557');
INSERT INTO `django_migrations` VALUES ('20', 'DeepLearningForum', '0003_user_desc', '2019-12-28 19:36:02.397262');
INSERT INTO `django_migrations` VALUES ('21', 'DeepLearningForum', '0004_auto_20191229_2059', '2019-12-29 20:59:07.960143');
INSERT INTO `django_migrations` VALUES ('22', 'DeepLearningForum', '0005_auto_20191230_1532', '2019-12-30 15:32:13.689573');
INSERT INTO `django_migrations` VALUES ('23', 'DeepLearningForum', '0006_comment_rid', '2019-12-30 20:34:23.855561');
INSERT INTO `django_migrations` VALUES ('24', 'DeepLearningForum', '0007_remove_comment_rid', '2019-12-30 21:20:55.595652');
INSERT INTO `django_migrations` VALUES ('25', 'DeepLearningForum', '0008_auto_20191231_1713', '2019-12-31 17:13:52.348960');
INSERT INTO `django_migrations` VALUES ('26', 'DeepLearningForum', '0009_auto_20191231_2152', '2019-12-31 21:52:51.609190');
INSERT INTO `django_migrations` VALUES ('27', 'DeepLearningForum', '0010_auto_20200101_1351', '2020-01-01 13:51:15.877827');
INSERT INTO `django_migrations` VALUES ('28', 'DeepLearningForum', '0011_auto_20200101_1421', '2020-01-01 14:21:36.290131');
INSERT INTO `django_migrations` VALUES ('29', 'DeepLearningForum', '0012_auto_20200101_1426', '2020-01-01 14:26:58.438630');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('bnrno24d01ruvnu9gm1dccc0jrqx19ut', 'ZGQwMGNjNjQzMWNjZDAzYjU2MzhjYjdjMWZmMTlhNmM2MmNjYzQyNjp7ImhhdmVfYXJ0aWNsZXMiOnRydWUsInRhZ19pZCI6bnVsbCwiY2F0ZWdvcnlfaWQiOm51bGwsInRvX3Bvc2l0aW9uIjp0cnVlLCJfYXV0aF91c2VyX2lkIjoiMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNjQ0NjBkNWIzNTY0ZDZhMjQ1N2M5ODU4NDY5NTMyODYwMmYyZTNjNiIsImlzX2FjdGl2ZSI6dHJ1ZSwidXNlcl9pZCI6MiwidG9fcG9zaXRpb25fY29tbWVudF9pZCI6ZmFsc2UsImNvbW1lbnRfc29ydCI6MSwiaGF2ZV9jb21tZW50cyI6dHJ1ZSwidG9fc2V0Ijp0cnVlLCJ0b19wZXJzb25hbCI6dHJ1ZX0=', '2020-01-16 21:39:46.628693');
INSERT INTO `django_session` VALUES ('bzwyoaxs4u9qjlliurdkq54md5djk1ay', 'NDAyM2FmZTdiMWFkNmI0ZTM4ZTg0YzM2OTc0Y2E1MDhjNmE1M2EwNTp7ImhhdmVfYXJ0aWNsZXMiOnRydWUsInRhZ19pZCI6bnVsbCwiY2F0ZWdvcnlfaWQiOm51bGwsInRvX3Bvc2l0aW9uIjp0cnVlLCJfYXV0aF91c2VyX2lkIjoiNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGUzNjY1YTJjOWRjZmY0MGM2YWY5NDIxNzVhMTU5M2ZlY2VlZTIwOCIsImlzX2FjdGl2ZSI6dHJ1ZSwidXNlcl9pZCI6NywidG9fc2V0Ijp0cnVlfQ==', '2020-01-15 15:38:12.737883');
INSERT INTO `django_session` VALUES ('oonhvshb8dpkq8snw7s0ldpn1wb0xlz3', 'NjczOTUyZDEwZjhhMTU0MmExODVlMTk0YWY2ZWRkNWVhZjFlMTFmYjp7ImhhdmVfYXJ0aWNsZXMiOnRydWUsInRhZ19pZCI6bnVsbCwiY2F0ZWdvcnlfaWQiOm51bGwsInRvX3Bvc2l0aW9uIjp0cnVlLCJfYXV0aF91c2VyX2lkIjoiOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOWMyODA4NjZmNjY4NTNhYTliMmY4OGU5YjkwMWZkOGMxZDc5MGIxMCIsImlzX2FjdGl2ZSI6dHJ1ZSwidXNlcl9pZCI6OCwidG9fc2V0IjpmYWxzZX0=', '2020-01-15 15:51:16.062012');
INSERT INTO `django_session` VALUES ('tu5cfgjctjv6tgl2xtqevd4jxpxydah8', 'NGIwMzZjNGRjYmJhYTI5MmFlNmIyNmYyZTc4MDBiNDVjNGNhNmNiYjp7ImhhdmVfYXJ0aWNsZXMiOnRydWUsInRhZ19pZCI6bnVsbCwiY2F0ZWdvcnlfaWQiOm51bGwsInRvX3Bvc2l0aW9uIjp0cnVlLCJfYXV0aF91c2VyX2lkIjoiNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDM1NzJhZmZiYWYxNTJlNGI5YzY2YzdiZDcyOTY4YmI1NjdmZWVjMiIsImlzX2FjdGl2ZSI6dHJ1ZSwidXNlcl9pZCI6NiwidG9fc2V0IjpmYWxzZX0=', '2020-01-15 15:29:11.851036');
