set names utf8;
set foreign_key_checks=0;

drop database if exists i1810b;
create database if not exists i1810b;

use i1810b;

create table user_info(
  id int primary key not null auto_increment comment "ID",
  user_id varchar(16) unique not null comment "ユーザーID",
  password varchar(16) not null comment "パスワード",
  family_name varchar(32) not null comment "姓",
  first_name varchar(32) not null comment "名",
  family_name_kana varchar(32) not null comment "姓かな",
  first_name_kana varchar(32) not null comment "名かな",
  sex tinyint not null default 0 comment "性別",
  email varchar(32) not null comment "メールアドレス",
  status tinyint not null default 0 comment "ステータス",
  logined tinyint not null default 0 comment "ログインフラグ",
  regist_date datetime not null comment "登録日",
  update_date datetime comment "更新日"
)
default charset=utf8
comment="会員情報テーブル"
;

insert into user_info values
  (1,"guest","guest","インターノウス","ゲストユーザー","いんたーのうす","げすとゆーざー",0,"guest@gmail.com",0,0,now(),now()),
  (2,"guest2","guest2","インターノウス","ゲストユーザー2","いんたーのうす","げすとゆーざー2",0,"guest2@gmail.com",0,0,now(),now()),
  (3,"guest3","guest3","インターノウス","ゲストユーザー3","いんたーのうす","げすとゆーざー3",0,"guest3@gmail.com",0,0,now(),now()),
  (4,"guest4","guest4","インターノウス","ゲストユーザー4","いんたーのうす","げすとゆーざー4",0,"guest4@gmail.com",0,0,now(),now()),
  (5,"guest5","guest5","インターノウス","ゲストユーザー5","いんたーのうす","げすとゆーざー5",0,"guest5@gmail.com",0,0,now(),now()),
  (6,"guest6","guest6","インターノウス","ゲストユーザー6","いんたーのうす","げすとゆーざー6",0,"guest6@gmail.com",0,0,now(),now()),
  (7,"guest7","guest7","インターノウス","ゲストユーザー7","いんたーのうす","げすとゆーざー7",0,"guest7@gmail.com",0,0,now(),now()),
  (8,"guest8","guest8","インターノウス","ゲストユーザー8","いんたーのうす","げすとゆーざー8",0,"guest8@gmail.com",0,0,now(),now()),
  (9,"guest9","guest9","インターノウス","ゲストユーザー9","いんたーのうす","げすとゆーざー9",0,"guest9@gmail.com",0,0,now(),now()),
  (10,"guest10","guest10","インターノウス","ゲストユーザー10","いんたーのうす","げすとゆーざー10",0,"guest10@gmail.com",0,0,now(),now()),
  (11,"guest11","guest11","インターノウス","ゲストユーザー11","いんたーのうす","げすとゆーざー11",0,"guest11@gmail.com",0,0,now(),now()),
  (12,"guest12","guest12","インターノウス","ゲストユーザー12","いんたーのうす","げすとゆーざー12",0,"guest12@gmail.com",0,0,now(),now());

create table product_info(
  id int primary key not null auto_increment comment "ID",
  product_id int unique not null comment "商品ID",
  product_name varchar(100) unique not null comment "商品名",
  product_name_kana varchar(100) not null comment "商品名かな",
  product_description varchar(255) not null comment "商品詳細",
  category_id int not null comment "カテゴリーID",
  price int comment "価格",
  image_file_path varchar(100) comment "画像ファイルパス",
  image_file_name varchar(50) comment "画像ファイル名",
  release_date datetime not null comment "発売年月",
  release_company varchar(50) comment "発売会社",
  status tinyint not null default 0 comment "ステータス",
  regist_date datetime not null comment "登録日",
  update_date datetime comment "更新日",
  foreign key(category_id) references m_category(category_id)
)
default charset=utf8
comment="商品情報テーブル"
;

insert into product_info values
(1,1,"アットウシ","あっとうし","北海道・東北詳細1",2,1000,"./images","hokkaid1.png",now(),"会社1",0,now(),now()),
(2,2,"奥会津編み組細工","おくあいづあみくみざいく","北海道・東北詳細2",2,1000,"./images","hokkaid2.png",now(),"会社2",0,now(),now()),
(3,3,"会津塗","あいづぬり","北海道・東北詳細3",2,1000,"./images","hokkaid3.png",now(),"会社3",0,now(),now()),
(4,4,"樺細工","かばざいく","北海道・東北詳細4",2,1000,"./images","hokkaid4.png",now(),"会社4",0,now(),now()),
(5,5,"秋田杉桶樽","あきたすぎおけだる","北海道・東北詳細5",2,1000,"./images","hokkaid5.png",now(),"会社5",0,now(),now()),
(6,6,"置賜紬","おいたまつるぎ","北海道・東北詳細6",2,1000,"./images","hokkaid6.png",now(),"会社6",0,now(),now()),
(7,7,"津軽塗","つがるぬり","北海道・東北詳細7",2,1000,"./images","hokkaid7.png",now(),"会社7",0,now(),now()),
(8,8,"天童将棋駒","てんどうしょうぎごま","北海道・東北詳細8",2,1000,"./images","hokkaid8.png",now(),"会社8",0,now(),now()),
(9,9,"木彫りの熊","きぼりのくま","北海道・東北詳細9",2,1000,"./images","hokkaid9.png",now(),"会社9",0,now(),now()),
(10,10,"みかも焼き","みかもやき","関東地方詳細1",3,2000,"./images","kanto1.jpg",now(),"会社10",0,now(),now()),
(11,11,"海峰","かいほう","関東地方詳細2",3,2000,"./images","kanto2.jpg",now(),"会社11",0,now(),now()),
(12,12,"鎌倉彫","かまくらぼり","関東地方詳細3",3,2000,"./images","kanto3.jpg",now(),"会社12",0,now(),now()),
(13,13,"桐下駄","きりげた","関東地方詳細4",3,2000,"./images","kanto4.jpg",now(),"会社13",0,now(),now()),
(14,14,"桐生織り","きりゅうおり","関東地方詳細5",3,2000,"./images","kanto5.jpg",now(),"会社14",0,now(),now()),
(15,15,"江戸切子","えどきりこ","関東地方詳細6",3,2000,"./images","kanto6.jpg",now(),"会社15",0,now(),now()),
(16,16,"小砂焼","こいさごやき","関東地方詳細7",3,2000,"./images","kanto7.jpg",now(),"会社16",0,now(),now()),
(17,17,"多摩織","たまおり","関東地方詳細8",3,2000,"./images","kanto8.jpg",now(),"会社17",0,now(),now()),
(18,18,"越前漆器","えちぜんしっき","中部地方詳細1",4,400,"./images","tyubu1.jpg",now(),"会社18",0,now(),now()),
(19,19,"燕鎚起銅器","つばめついきどうき","中部地方詳細2",4,400,"./images","tyubu2.jpg",now(),"会社19",0,now(),now()),
(20,20,"甲州印伝","こうしゅういんでん","中部地方詳細3",4,400,"./images","tyubu3.jpg",now(),"会社20",0,now(),now()),
(21,21,"紙塑人形","しそにんぎょう","中部地方詳細4",4,400,"./images","tyubu4.jpg",now(),"会社21",0,now(),now()),
(22,22,"駿河雛具","つるがひなく","中部地方詳細5",4,400,"./images","tyubu5.jpg",now(),"会社22",0,now(),now()),
(23,23,"赤津焼き","あかづやき","中部地方詳細6",4,400,"./images","tyubu6.jpg",now(),"会社23",0,now(),now()),
(24,24,"大樋焼","おおひやき","中部地方詳細7",4,400,"./images","tyubu7.jpg",now(),"会社24",0,now(),now()),
(25,25,"土鍋・土楽","どなべどらく","中部地方詳細8",4,400,"./images","tyubu8.jpg",now(),"会社25",0,now(),now()),
(26,26,"美濃焼","みのやき","中部地方詳細9",4,400,"./images","tyubu9.jpg",now(),"会社26",0,now(),now()),
(27,27,"紀州漆器","きしゅうしっき","近畿・四国地方詳細1",5,3330,"./images","kinki1.jpg",now(),"会社27",0,now(),now()),
(28,28,"京黒紋付染","きょうくろもんつきぞめ","近畿・四国地方詳細2",5,3330,"./images","kinki2.jpg",now(),"会社28",0,now(),now()),
(29,29,"京友禅","きょうゆうぜん","近畿・四国地方詳細3",5,3330,"./images","kinki3.jpg",now(),"会社29",0,now(),now()),
(30,30,"高山茶筅","たかやまちゃせん","近畿・四国地方詳細4",5,3330,"./images","kinki4.jpg",now(),"会社30",0,now(),now()),
(31,31,"堺打ち刃物","さかいうちはもの","近畿・四国地方詳細5",5,3330,"./images","kinki5.jpg",now(),"会社31",0,now(),now()),
(32,32,"大谷焼","おおたにやき","近畿・四国地方詳細6",5,3330,"./images","kinki6.jpg",now(),"会社32",0,now(),now()),
(33,33,"砥部焼","とべやき","近畿・四国地方詳細7",5,3330,"./images","kinki7.jpg",now(),"会社33",0,now(),now()),
(34,34,"土佐和紙","とさわし","近畿・四国地方詳細8",5,3330,"./images","kinki8.jpg",now(),"会社34",0,now(),now()),
(35,35,"雲州算盤","うんしゅうそろばん","中国地方詳細1",6,9110,"./images","china1.png",now(),"会社35",0,now(),now()),
(36,36,"宮島細工","みやじまざいく","中国地方詳細2",6,9110,"./images","china2.png",now(),"会社36",0,now(),now()),
(37,37,"弓浜絣","ゆみはまがすり","中国地方詳細3",6,9110,"./images","china3.png",now(),"会社37",0,now(),now()),
(38,38,"広島仏壇","ひろしまぶつだん","中国地方詳細4",6,9110,"./images","china4.png",now(),"会社38",0,now(),now()),
(39,39,"勝山竹細工","かつやまたけざいく","中国地方詳細5",6,9110,"./images","china5.png",now(),"会社39",0,now(),now()),
(40,40,"川尻筆","かわじりふで","中国地方詳細6",6,9110,"./images","china6.png",now(),"会社40",0,now(),now()),
(41,41,"大内塗","おおうちぬり","中国地方詳細7",6,9110,"./images","china7.png",now(),"会社41",0,now(),now()),
(42,42,"備前焼","びぜんやき","中国地方詳細8",6,9110,"./images","china8.png",now(),"会社42",0,now(),now()),
(43,43,"福山琴","ふくやまこと","中国地方詳細9",6,9110,"./images","china9.png",now(),"会社43",0,now(),now()),
(44,44,"高千穂神楽面","たかちほかぐらめん","九州地方詳細1",7,10000,"./images","kyusyu1.jpg",now(),"会社44",0,now(),now()),
(45,45,"山鹿灯籠","やまがとうろう","九州地方詳細2",7,10000,"./images","kyusyu2.jpg",now(),"会社45",0,now(),now()),
(46,46,"佐賀錦の鞄","さがにしきのかばん","九州地方詳細3",7,10000,"./images","kyusyu3.jpg",now(),"会社46",0,now(),now()),
(47,47,"薩摩切子のグラス","さつまきりこのぐらす","九州地方詳細4",7,10000,"./images","kyusyu4.jpg",now(),"会社47",0,now(),now()),
(48,48,"ビートロ","びーとろ","九州地方詳細5",7,10000,"./images","kyusyu5.jpg",now(),"会社48",0,now(),now()),
(49,49,"べっこう細工","べっこうざいく","九州地方詳細6",7,10000,"./images","kyusyu6.jpg",now(),"会社49",0,now(),now()),
(50,50,"博多織","はかたおり","九州地方詳細7",7,10000,"./images","kyusyu7.jpg",now(),"会社50",0,now(),now()),
(51,51,"久留米絣の手ぬぐい","くるめがすりのてぬぐい","九州地方詳細8",7,10000,"./images","kyusyu8.jpg",now(),"会社51",0,now(),now());


create table cart_info(
  id int primary key not null auto_increment comment "ID",
  user_id varchar(16) not null comment "ユーザーID",
  temp_user_id varchar(16) comment "仮ユーザーID",
  product_id int not null comment "商品ID",
  product_count int not null comment "個数",
  price int not null comment "金額",
  regist_date datetime not null comment "登録日",
  update_date datetime comment "更新日"
)
default charset=utf8
comment="カート情報テーブル"
;


create table purchase_history_info(
  id int primary key not null auto_increment comment "ID",
  user_id varchar(16) not null comment "ユーザーID",
  product_id int not null comment "商品ID",
  product_count int not null comment "個数",
  price int not null comment "金額",
  destination_id int not null comment "宛先情報ID",
  regist_date datetime not null comment "登録日",
  update_date datetime not null comment "更新日",
  foreign key(user_id) references user_info(user_id),
  foreign key(product_id) references product_info(product_id)
)
default charset=utf8
comment="購入履歴情報テーブル"
;


 create table destination_info(
   id int primary key not null auto_increment comment "ID",
   user_id varchar(16) not null comment "ユーザーID",
   family_name varchar(32) not null comment "姓",
   first_name varchar(32) not null comment "名",
   family_name_kana varchar(32) not null comment "姓かな",
   first_name_kana varchar(32) not null comment "名かな",
   email varchar(32) not null comment "メールアドレス",
   tel_number varchar(13) not null comment "電話番号",
   user_address varchar(50) not null comment "住所",
   regist_date datetime not null comment "登録日",
   update_date datetime comment "更新日"
)
default charset=utf8
comment="宛先情報テーブル"
;


create table m_category(
  id int primary key not null comment "ID",
  category_id int not null unique comment "カテゴリID",
  category_name varchar(20) not null unique comment "カテゴリ名",
  category_description varchar(100) comment "カテゴリ詳細",
  insert_date datetime not null comment "登録日",
  update_date datetime comment "更新日"
)
default charset=utf8
comment="カテゴリマスタテーブル"
;

insert into m_category values
  (1,1,"全てのカテゴリ","日本全国の伝統工芸品が対象となります",now(),null),
  (2,2,"北海道・東北","北海道・東北地方の伝統工芸品が対象となります",now(),null),
  (3,3,"関東","関東地方の伝統工芸品が対象となります",now(),null),
  (4,4,"中部","中部地方の伝統工芸品が対象となります",now(),null),
  (5,5,"近畿・四国","近畿・四国地方の伝統工芸品が対象となります",now(),null),
  (6,6,"中国","中国地方の伝統工芸品が対象になります",now(),null),
  (7,7,"九州","九州地方の伝統工芸品が対象になります",now(),null);