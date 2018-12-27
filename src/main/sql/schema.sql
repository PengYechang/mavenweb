-- 创建数据库
create
database
seckill;
use
seckill;
-- 创建秒杀库存表
create table seckill
(
  `seckill_id`  bigint       not null auto_increment comment '商品id',
  `name`        varchar(120) not null comment '商品名称',
  `number`      int          not null comment '库存数量',
  `start_time`  datetime  not null comment '秒杀开启时间',
  `end_time`    datetime     not null comment '秒杀结束时间',
  `create_time` timestamp    not null default current_timestamp comment '创建时间',
  primary key (seckill_id),
  key           idx_start_time(start_time),
  key           idx_end_time(end_time),
  key           idx_create_time(create_time)
) engine=InnoDB auto_increment=1000 default charset =utf8 comment ='秒杀库存表';

-- 初始化数据
insert into seckill(name, number, start_time, end_time)
values ('1000元秒杀ipad', 100, '2018-11-28 00:00:00', '2018-11-29 00:00:00'),
       ('2000元秒杀iphone', 200, '2018-11-28 00:00:00', '2018-11-29 00:00:00'),
       ('3000元秒杀honor', 300, '2018-11-28 00:00:00', '2018-11-29 00:00:00');

-- 秒杀成功明细表
create table success_killed
(
  `seckill_id`  bigint    not null comment '秒杀商品',
  `user_phone`  bigint    not null comment '用户手机号',
  `state`       tinyint   not null default -1 comment '状态：-1无效 0：成功 1：已付款',
  `create_time` timestamp not null default current_timestamp comment '创建时间',
  primary key (seckill_id, user_phone),
  key           idx_create_time(create_time)
) engine = InnoDB default charset =utf8 comment ='秒杀成功明细表';