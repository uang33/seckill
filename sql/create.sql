-- 用户信息表
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
                          `id` int(11) NOT NULL COMMENT '用户ID',
                          `name` varchar(20) DEFAULT NULL COMMENT '用户名称',
                          PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

INSERT INTO `t_user` VALUES ('1', 'admin');
INSERT INTO `t_user` VALUES ('2', 'h33');

-- 商品表
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
                         `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
                         `goods_name` varchar(16) DEFAULT NULL COMMENT '商品名称',
                         `goods_title` varchar(64) DEFAULT NULL COMMENT '商品标题',
                         `goods_img` varchar(64) DEFAULT NULL COMMENT '商品图片',
                         `goods_detail` longtext COMMENT '商品详情',
                         `goods_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品价格',
                         `goods_stock` int(11) DEFAULT '0' COMMENT '商品库存',
                         PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品表';


-- 订单信息表
DROP TABLE IF EXISTS `order_info`;
CREATE TABLE `order_info` (
                              `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
                              `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
                              `goods_id` bigint(20) DEFAULT NULL COMMENT '商品ID',
                              `delivery_addr_id` bigint(20) DEFAULT NULL COMMENT '地址',
                              `goods_name` varchar(16) DEFAULT NULL COMMENT '商品名称',
                              `goods_count` int(11) DEFAULT '0' COMMENT '商品数量',
                              `goods_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品价格',
                              `order_channel` tinyint(4) DEFAULT '0' COMMENT '订单渠道',
                              `order_status` tinyint(4) DEFAULT '0' COMMENT '订单状态',
                              `create_date` datetime DEFAULT NULL COMMENT '创建时间',
                              `pay_date` datetime DEFAULT NULL COMMENT '支付时间',
                              PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单信息表';


-- 秒杀商品表
DROP TABLE IF EXISTS `seckill_goods`;
CREATE TABLE `seckill_goods` (
                                 `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '秒杀商品ID',
                                 `goods_id` bigint(20) DEFAULT NULL COMMENT '商品ID',
                                 `seckill_price` decimal(10,2) DEFAULT '0.00' COMMENT '秒杀价格',
                                 `stock_count` int(11) DEFAULT NULL COMMENT '商品库存',
                                 `version` INT NOT NULL DEFAULT 0 COMMENT '版本号，防止并发超卖',
                                 `start_date` datetime DEFAULT NULL COMMENT '秒杀开始时间',
                                 `end_date` datetime DEFAULT NULL COMMENT '秒杀结束时间',
                                 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='秒杀商品表';



-- 秒杀用户表
DROP TABLE IF EXISTS `seckill_user`;
CREATE TABLE `seckill_user` (
                                `id` bigint(20) NOT NULL COMMENT '用户ID',
                                `nickname` varchar(255) NOT NULL COMMENT '用户昵称',
                                `pwd` varchar(32) DEFAULT NULL COMMENT '用户密码',
                                `salt` varchar(10) DEFAULT NULL COMMENT '盐',
                                `head` varchar(128) DEFAULT NULL COMMENT '',
                                `register_date` datetime DEFAULT NULL COMMENT '注册时间',
                                `last_login_date` datetime DEFAULT NULL COMMENT '上次登录时间',
                                `login_count` int(11) DEFAULT '0' COMMENT '登录次数',
                                PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='秒杀用户表';


-- 秒杀订单表
DROP TABLE IF EXISTS `seckill_order`;
CREATE TABLE `seckill_order` (
                                 `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
                                 `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
                                 `order_id` bigint(20) DEFAULT NULL COMMENT '商品ID',
                                 `goods_id` bigint(20) DEFAULT NULL COMMENT '订单号',
                                 PRIMARY KEY (`id`),
                                 UNIQUE KEY `u_uid_gid` (`user_id`,`goods_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='秒杀订单表';

