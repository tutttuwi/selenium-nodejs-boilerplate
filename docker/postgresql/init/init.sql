
-- DROP TABLES
drop table if exists building;
drop table if exists building_fav;
drop table if exists prop;
--drop table if exists prop_info_details;
drop table if exists prop_info;
drop table if exists area_mst;
-- DROP SCHEMA
-- drop schema if exists dev;

-- CREATE DATABASE
--create schema dev;
--SET SCHEMA dev;

--------------------------------------------------------------------------------
create table building (
  url text not null
  , building_name text not null
  , nearest_station text
  , year_of_construction timestamp(6) without time zone
  , deleted_dt timestamp(6) without time zone
  , created_dt timestamp(6) without time zone not null
  , created_user text not null
  , updated_dt timestamp(6) without time zone not null
  , updated_user text not null
  , primary key (url)
);

--select * from building b ;
select * from building b where building_name like '%フォルティア%';

select * from building b where deleted_dt  is not null;


select count(*) from building b where nearest_station like '%茗荷谷%'

select round(EXTRACT(DAY FROM (CURRENT_TIMESTAMP - b.year_of_construction)) / 365)  AS elapsed ,* from building b where nearest_station like '%茗荷谷%' order by elapsed

-- 茗荷谷周辺マンション調査
select * from (
select round(EXTRACT(DAY FROM (CURRENT_TIMESTAMP - b.year_of_construction)) / 365)  AS elapsed ,* from building b where nearest_station like '%茗荷谷%' order by elapsed
) as tb left join (
SELECT a.* FROM prop a 
      inner join (select url, MAX(branch) as latest from prop group by url) as b 
      on a.url = b.url and a.branch = b.latest
) as p on tb.url = p.building_url 
order by 1

--select * from building b where b.building_name like '%クレド%'

     --create unique index account_connection_rank on account_connection(user_id,provider_id,rank);

--------------------------------------------------------------------------------


create table building_fav (
  userid text not null
  , url text not null
  , created_dt timestamp(6) without time zone not null
  , created_user text not null
  , updated_dt timestamp(6) without time zone not null
  , updated_user text not null
  , primary key (userid,url)
);

delete from building_fav

INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13101/to_1000016936/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');

select * from prop p where 
p.building_name = 'ピアース神楽坂'
or p.building_name = 'プラウド高田馬場'
or p.building_name = 'プレミスト新宿都庁前'
or p.building_name = 'パークハウス市谷柳町'
or p.building_name = 'ダイナシティ西新宿'
or p.building_name = 'モンヴェール四ツ谷'
or p.building_name = '根津シティタワー'
or p.building_name = 'プリメール弥生'
or p.building_name = 'リーラ白山'
or p.building_name = '小石川ザ・レジデンス　イーストスクエア'
or p.building_name = 'ライオンズマンション目白台シティ'
or p.building_name = 'リックスLお茶の水女子大前'
or p.building_name = 'ライズヒル千石'
or p.building_name = 'シャルムコート東日本橋'
or p.building_name = 'パークホームズ市谷薬王寺セントガレリア'
or p.building_name = 'アトラスステイシア文京千駄木'
or p.building_name = 'レジェンド西早稲田フォレストタワー'
or p.building_name = 'オープンレジデンシア目白御留山'
or p.building_name = 'ジェイパーク早稲田'
or p.building_name = 'ルクシェール新宿中落合'
or p.building_name = 'カテリーナ護国寺'
or p.building_name = 'プレミスト明石町'
or p.building_name = 'アデニウム東神田'
or p.building_name = 'グランスイート文京小石川'
or p.building_name = 'カテリーナ文京千駄木'
or p.building_name = 'ル・リオン西新宿'
or p.building_name = '川口アパートメント'
or p.building_name = 'フォリアージュ'
or p.building_name = 'エクセレントシティ文京小桜'
or p.building_name = 'レジデンシア春日安藤坂'
or p.building_name = 'フォルティア文京千石'
or p.building_name = 'リビオレゾン目白通り'
or p.building_name = 'アーバンクリスタル九段下'
or p.building_name = 'ジェイパーク三田'
or p.building_name = '朝日クレス・パリオ護国寺'


INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13101/to_1000180537/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13101/to_1001917550/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13102/to_1000107239/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13102/to_1000865084/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13103/to_1000161209/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13104/to_1000135616/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13104/to_1000175967/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13104/to_1000597477/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13104/to_1000839352/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13104/to_1001380191/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13104/to_1001402688/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13104/to_1001765733/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13104/to_1001818515/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13104/to_1001882833/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13104/to_1001913652/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13104/to_1002131404/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13104/to_1002141943/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13105/to_1000050164/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13105/to_1000090454/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13105/to_1000105062/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13105/to_1000142475/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13105/to_1000456523/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13105/to_1000545955/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13105/to_1000824031/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13105/to_1000892677/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13105/to_1001089186/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13105/to_1001094509/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13105/to_1001365274/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13105/to_1001453894/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13105/to_1001757506/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13105/to_1001843495/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13105/to_1001893463/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13105/to_1001934260/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13105/to_1000332332/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');





-----
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13101/to_1000016936/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13101/to_1000302395/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13101/to_1000397847/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13117/to_1000020659/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13117/to_1000043226/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
---
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13117/to_1000043951/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13117/to_1000117845/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13117/to_1000255947/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13117/to_1000280479/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13117/to_1000346885/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13117/to_1000360305/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13117/to_1000361009/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13117/to_1000365754/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13117/to_1000518555/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13117/to_1000669334/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13117/to_1000674425/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13117/to_1000674719/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13117/to_1000748333/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13117/to_1000749992/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13117/to_1000753431/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13117/to_1000758092/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13117/to_1000816024/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13117/to_1000840024/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13117/to_1000854491/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13117/to_1000923434/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13117/to_1000987248/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13117/to_1001009890/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13117/to_1001027203/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13117/to_1001083367/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13117/to_1001084239/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13117/to_1001101771/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13117/to_1001105006/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13117/to_1001112767/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13117/to_1001154140/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13117/to_1001163441/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13117/to_1001174311/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13117/to_1001231539/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13119/to_1000010114/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13119/to_1000662710/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13119/to_1000844310/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13119/to_1000867355/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13206/to_1000034127/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13206/to_1000053059/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13206/to_1000348538/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13206/to_1000407339/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13206/to_1000443406/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13206/to_1000463980/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13206/to_1000633789/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13206/to_1000649271/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13208/to_1000036039/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13208/to_1000170810/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13208/to_1000293416/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13208/to_1000315020/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13208/to_1000495072/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13208/to_1000562427/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13208/to_1000641915/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13208/to_1000646588/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13208/to_1000685646/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13208/to_1000700116/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13208/to_1000818866/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13208/to_1000864913/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13208/to_1000892201/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13208/to_1001077481/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13208/to_1001244812/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13208/to_1001295705/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13208/to_1001335551/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13208/to_1001520304/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13208/to_1001523482/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13208/to_1001704630/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13208/to_1001731667/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13208/to_1001811774/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13208/to_1001865368/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13208/to_1001876603/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13208/to_1001926552/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13208/to_1001987364/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13208/to_1001987368/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13208/to_1001991256/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13208/to_1002009464/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13208/to_1002035096/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13208/to_1002063273/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13208/to_1002074888/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13208/to_1002080148/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13208/to_1002114568/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13210/to_1000011909/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13210/to_1000031382/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13210/to_1000267784/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13210/to_1000408747/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.building_fav (userid, url, created_dt, created_user, updated_dt, updated_user) VALUES('SYSTEM_USER', 'https://suumo.jp/library/tf_13/sc_13210/to_1000441097/', current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');


--------------------------------------------------------------------------------

--create table proc_exectime (
--  label text not null
--  , executed_dt timestamp(6) without time zone not null
--  , created_dt timestamp(6) without time zone not null
--  , created_user text not null
--  , updated_dt timestamp(6) without time zone not null
--  , updated_user text not null
--  , primary key (label)
--);

SELECT * from prop p where created_dt >= current_date
select current_date 

--------------------------------------------------------------------------------
create table prop (
  url text not null
  , branch integer not null
  , building_url text
  , building_name text
  , floor_plan text
  , prop_price integer not null
  , ex_area decimal not null
  , direction text not null
  , serve_period_info text
  , fetched_prop_info_flg boolean default false -- 手動で更新対象にしたい場合、tureのパッチを当てる
  , deleted_dt timestamp(6) without time zone
  , created_dt timestamp(6) without time zone not null
  , created_user text not null
  , updated_dt timestamp(6) without time zone not null
  , updated_user text not null
  , primary key (url,branch)
);

--select * from prop b ;
--select count(*) from prop b ;

--select * from prop b where branch = 2;
--select * from prop b where url = 'https://suumo.jp/ms/chuko/tokyo/sc_bunkyo/nc_74093237/';
--select * from prop b where building_url = 'https://suumo.jp/library/tf_13/sc_13105/to_1000065708/';

select * from prop b where url = 'https://suumo.jp/ms/chuko/tokyo/sc_bunkyo/nc_73688657/';
select * from prop b where building_url  = 'https://suumo.jp/library/tf_13/sc_13105/to_1000061026/';

select * from prop p where branch <1

select * from prop p where deleted_dt is null
select * from prop p where deleted_dt is not null;
select * from prop p where url = 'https://suumo.jp/ms/chuko/tokyo/sc_bunkyo/nc_74071199/'

select * from prop p where direction  is not null;


select url,branch,count(*) from prop group by url,branch having count(*) > 1;

select url,branch,count(*) from prop group by url,branch having count(*) > 1;

select * from prop b where building_name like '%フォルティア%';

SELECT a.* FROM prop a
inner join (select url, MAX(branch) as latest from prop group by url) as b
on a.url = b.url
WHERE building_url = ''

SELECT a.* FROM prop a 
      inner join (select url, MAX(branch) as latest from prop group by url) as b 
      on a.url = b.url and a.branch = b.latest ;
--      WHERE building_url = $1 ;

--------------------------------------------------------------------------------
/*
create table prop_info_details (
  url character varying(255) not null
  , branch integer not null
  , building_name character varying(255)
  , floor_cnt character varying(255)
  , item_name character varying(255) not null
  , item_value character varying(10240)
  , created_dt timestamp(6) without time zone not null
  , created_user character varying(255) not null
  , updated_dt timestamp(6) without time zone not null
  , updated_user character varying(255) not null
  , primary key (url,branch,item_name,item_value)
);

--select * from prop_info_details;
--select count(*) from prop_info_details;
select * from prop_info_details pid where url = 'https://suumo.jp/ms/chuko/tokyo/sc_bunkyo/nc_73688657/';





SELECT url,branch FROM prop_info_details group by url, branch order by url,branch

*/

drop table prop_info 
-- 物件情報（加工）
CREATE TABLE prop_info (
    url text,
    branch INT not null,
    prop_name text,                  -- 物件名
    contact_information text,        -- お問い合せ先
    other_restrictions TEXT,                 -- その他制限事項
    other_overview_special_notes TEXT,       -- その他概要・特記事項
    other_area TEXT,                         -- その他面積
    event_information TEXT,                  -- イベント情報
    reform TEXT,                             -- リフォーム
    real_estate_company_guide TEXT,          -- 不動産会社ガイド
    transportation TEXT,                     -- 交通
    company_overview TEXT,                   -- 会社概要
    address text,                    -- 住所
    price text,                      -- 価格
    repair_reserve_fund TEXT,                -- 修繕積立基金
    repair_reserve_amount TEXT,              -- 修繕積立金
    transaction_conditions_expiry_date TEXT, -- 取引条件有効期限
    direction text,                   -- 向き
    inquiry_contact text,            -- 問い合わせ先
    completion_date_built TEXT,              -- 完成時期(築年月) / 完成時期（築年月）
    floor_area TEXT,                         -- 専有面積
    handover_date TEXT,                      -- 引渡可能時期
    information_provision_date TEXT,         -- 情報提供日
    location text,                  -- 所在地
    floor text,                      -- 所在階
    floor_structure text,            -- 所在階/構造・階建
    from_contact_person TEXT,                -- 担当者より
    land_right_form text,             -- 敷地の権利形態
    land_area TEXT,                          -- 敷地面積
    construction TEXT,                       -- 施工
    highest_price_range text,         -- 最多価格帯
    structure_building_levels text,  -- 構造・階建て
    next_update_date TEXT,                   -- 次回更新日
    property_name text,              -- 物件名
    zoning text,                      -- 用途地域
    management_fee text,             -- 管理費
    total_units TEXT,                        -- 総戸数
    various_expenses text,           -- 諸費用
    sales_schedule TEXT,                     -- 販売スケジュール
    number_of_units_for_sale TEXT,           -- 販売戸数
    floor_plan text,                  -- 間取り
    related_links text,              -- 関連リンク
    parking_spaces TEXT                      -- 駐車場
  , created_dt timestamp(6) without time zone not null
  , created_user text not null
  , updated_dt timestamp(6) without time zone not null
  , updated_user text not null
  , primary key (url,branch)
);

select * from prop_info pi2 
select count(*) from prop_info pi2 


select
	p.url,
	p.branch
from
	prop p
left join prop_info pi on
	p.url = pi.url
	and p.branch = pi.branch
where
	pi.url is null
	or p.fetched_prop_info_flg = true

select
	p.url,
	p.branch
from
	(
	select
		a.*
	from
		prop a
	inner join (
		select
			url,
			MAX(branch) as latest
		from
			prop
		group by
			url) as b 
      on
		a.url = b.url
		and a.branch = b.latest) p
left join prop_info pi on
	p.url = pi.url
	and p.branch = pi.branch
where
	(pi.url is null
		and p.deleted_dt is null)
	or p.fetched_prop_info_flg = true

--select count(*) from prop p where deleted_dt is not null

select * from prop p where p.url = 'https://suumo.jp/ms/chuko/tokyo/sc_minato/nc_74030304/'
select * from prop p where p.building_url = 'https://suumo.jp/library/tf_13/sc_13103/to_1001532246/'
select * from prop p where p.building_url = 'https://suumo.jp/library/tf_13/sc_13113/to_1000107265/' -- 2億　＞レコードチェック
select * from prop p where p.building_url = 'https://suumo.jp/library/tf_13/sc_13103/to_1000013845/' -- 1億880万　＞レコードチェック

select * from prop p where p.building_url = 'https://suumo.jp/library/tf_13/sc_13116/to_1000268025/' -- 
select * from prop p where p.building_url = 'https://suumo.jp/library/tf_13/sc_13101/to_1000180537/' order by 1,2-- 


SELECT a.* FROM prop a 
      inner join (select url, MAX(branch) as latest from prop group by url) as b 
      on a.url = b.url and a.branch = b.latest 
      WHERE building_url = 'https://suumo.jp/library/tf_13/sc_13101/to_1000180537/' and deleted_dt is null 

delete from prop delp where exists (
select * from prop p inner join (
select url, min(branch) as oldest from prop a where a.deleted_dt is not null group by url
) a
on p.url = a.url and p.branch > a.oldest
where p.deleted_dt is not null 
--and building_url = 'https://suumo.jp/library/tf_13/sc_13101/to_1000180537/'
and delp.url = p.url and delp.branch = p.branch
)

-------------
select
	p.*
from
	(
	select
		a.*
	from
		prop a
	inner join (
		select
			url,
			MAX(branch) as latest
		from
			prop
		group by
			url) as b                 
          on
		a.url = b.url
		and a.branch = b.latest) p
left join prop_info pi on
	p.url = pi.url
	and p.branch = pi.branch
where
	(pi.url is null
		and p.deleted_dt is null)
	or p.fetched_prop_info_flg = true

-------------


delete from prop where

select count(*) from prop 

select
	p.*
from
	(
	select
		a.*
	from
		prop a
	inner join (
		select
			url,
			MAX(branch) as latest
		from
			prop
		group by
			url) as b                 
          on
		a.url = b.url
		and a.branch = b.latest) p
left join prop_info pi on
	p.url = pi.url
	and p.branch = pi.branch
where
	(pi.url is null
		and p.deleted_dt is null)
	or p.fetched_prop_info_flg = true


insert into prop(url,branch ,building_url ,building_name ,floor_plan ,prop_price ,ex_area ,direction ,serve_period_info ,deleted_dt ,fetched_prop_info_flg ,created_dt ,created_user ,updated_dt ,updated_user)
select
	p.url,
	p.branch + 1 as branch,
	p.building_url ,
	p.building_name ,
	p.floor_plan ,
	p.prop_price ,
	p.ex_area ,
	p.direction ,
	p.serve_period_info ,
	current_timestamp ,
	p.fetched_prop_info_flg ,
	current_timestamp ,
	'SYSTEM_USER' ,
	current_timestamp ,
	'SYSTEM_USER'
from
	prop p 
	inner join (select p2.url,MAX(p2.branch) as latest from prop p2 group by p2.url) as p2
	on p.url = p2.url and p.branch = p2.latest
where
	p.building_url = 'https://suumo.jp/library/tf_13/sc_13103/to_1001532246/'
	and p.deleted_dt is null

select current_timestamp  
	
drop table area_mst
truncate table area_mst 
select * from area_mst am 
-- エリア情報
CREATE TABLE area_mst (
	seq serial PRIMARY key,
    prefecture text not null,
    area_name text not null,
    url text not null
  , created_dt timestamp(6) without time zone not null
  , created_user text not null
  , updated_dt timestamp(6) without time zone not null
  , updated_user text not null
);

select * from area_mst

-- 文京区絞り（掲載なしマンション全部）
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '文京区','https://suumo.jp/library/tf_13/sc_13105/'       , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');

-- 東京都全域
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '千代田区','https://suumo.jp/library/tf_13/sc_13101/?kb[]=3'     , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '中央区','https://suumo.jp/library/tf_13/sc_13102/?kb[]=3'       , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '港区','https://suumo.jp/library/tf_13/sc_13103/?kb[]=3'         , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '新宿区','https://suumo.jp/library/tf_13/sc_13104/?kb[]=3'       , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '文京区','https://suumo.jp/library/tf_13/sc_13105/?kb[]=3'       , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '渋谷区','https://suumo.jp/library/tf_13/sc_13113/?kb[]=3'       , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '台東区','https://suumo.jp/library/tf_13/sc_13106/?kb[]=3'       , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '墨田区','https://suumo.jp/library/tf_13/sc_13107/?kb[]=3'       , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '江東区','https://suumo.jp/library/tf_13/sc_13108/?kb[]=3'       , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '荒川区','https://suumo.jp/library/tf_13/sc_13118/?kb[]=3'       , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '足立区','https://suumo.jp/library/tf_13/sc_13121/?kb[]=3'       , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '葛飾区','https://suumo.jp/library/tf_13/sc_13122/?kb[]=3'       , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '江戸川区','https://suumo.jp/library/tf_13/sc_13123/?kb[]=3'     , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '品川区','https://suumo.jp/library/tf_13/sc_13109/?kb[]=3'       , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '目黒区','https://suumo.jp/library/tf_13/sc_13110/?kb[]=3'       , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '大田区','https://suumo.jp/library/tf_13/sc_13111/?kb[]=3'       , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '世田谷区','https://suumo.jp/library/tf_13/sc_13112/?kb[]=3'     , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '中野区','https://suumo.jp/library/tf_13/sc_13114/?kb[]=3'       , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '杉並区','https://suumo.jp/library/tf_13/sc_13115/?kb[]=3'       , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '練馬区','https://suumo.jp/library/tf_13/sc_13120/?kb[]=3'       , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '豊島区','https://suumo.jp/library/tf_13/sc_13116/?kb[]=3'       , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '北区','https://suumo.jp/library/tf_13/sc_13117/?kb[]=3'         , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '板橋区','https://suumo.jp/library/tf_13/sc_13119/?kb[]=3'       , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '八王子市','https://suumo.jp/library/tf_13/sc_13201/?kb[]=3'     , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '立川市','https://suumo.jp/library/tf_13/sc_13202/?kb[]=3'       , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '武蔵野市','https://suumo.jp/library/tf_13/sc_13203/?kb[]=3'     , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '三鷹市','https://suumo.jp/library/tf_13/sc_13204/?kb[]=3'       , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '青梅市','https://suumo.jp/library/tf_13/sc_13205/?kb[]=3'       , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '府中市','https://suumo.jp/library/tf_13/sc_13206/?kb[]=3'       , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '昭島市','https://suumo.jp/library/tf_13/sc_13207/?kb[]=3'       , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '調布市','https://suumo.jp/library/tf_13/sc_13208/?kb[]=3'       , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '町田市','https://suumo.jp/library/tf_13/sc_13209/?kb[]=3'       , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '小金井市','https://suumo.jp/library/tf_13/sc_13210/?kb[]=3'     , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '小平市','https://suumo.jp/library/tf_13/sc_13211/?kb[]=3'       , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '日野市','https://suumo.jp/library/tf_13/sc_13212/?kb[]=3'       , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '東村山市','https://suumo.jp/library/tf_13/sc_13213/?kb[]=3'     , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '国分寺市','https://suumo.jp/library/tf_13/sc_13214/?kb[]=3'     , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '国立市','https://suumo.jp/library/tf_13/sc_13215/?kb[]=3'       , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '福生市','https://suumo.jp/library/tf_13/sc_13218/?kb[]=3'       , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '狛江市','https://suumo.jp/library/tf_13/sc_13219/?kb[]=3'       , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '東大和市','https://suumo.jp/library/tf_13/sc_13220/?kb[]=3'     , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '清瀬市','https://suumo.jp/library/tf_13/sc_13221/?kb[]=3'       , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '東久留米市','https://suumo.jp/library/tf_13/sc_13222/?kb[]=3'   , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '武蔵村山市','https://suumo.jp/library/tf_13/sc_13223/?kb[]=3'   , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '多摩市','https://suumo.jp/library/tf_13/sc_13224/?kb[]=3'       , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '稲城市','https://suumo.jp/library/tf_13/sc_13225/?kb[]=3'       , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '羽村市','https://suumo.jp/library/tf_13/sc_13227/?kb[]=3'       , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', 'あきる野市','https://suumo.jp/library/tf_13/sc_13228/?kb[]=3'   , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '西東京市','https://suumo.jp/library/tf_13/sc_13229/?kb[]=3'     , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '西多摩郡','https://suumo.jp/library/tf_13/sc_13300/?kb[]=3'     , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '大島支庁','https://suumo.jp/library/tf_13/sc_13360/?kb[]=3'     , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '大島町','https://suumo.jp/library/tf_13/sc_13361/?kb[]=3'       , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '利島村','https://suumo.jp/library/tf_13/sc_13362/?kb[]=3'       , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '新島村','https://suumo.jp/library/tf_13/sc_13363/?kb[]=3'       , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '神津島村','https://suumo.jp/library/tf_13/sc_13364/?kb[]=3'     , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '三宅支庁','https://suumo.jp/library/tf_13/sc_13380/?kb[]=3'     , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '三宅島三宅村','https://suumo.jp/library/tf_13/sc_13381/?kb[]=3' , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '御蔵島村','https://suumo.jp/library/tf_13/sc_13382/?kb[]=3'     , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '八丈支庁','https://suumo.jp/library/tf_13/sc_13400/?kb[]=3'     , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '八丈島八丈町','https://suumo.jp/library/tf_13/sc_13401/?kb[]=3' , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '青ヶ島村','https://suumo.jp/library/tf_13/sc_13402/?kb[]=3'     , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '小笠原支庁','https://suumo.jp/library/tf_13/sc_13420/?kb[]=3'   , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');
INSERT INTO public.area_mst (seq, prefecture, area_name, url, created_dt, created_user, updated_dt, updated_user) VALUES(nextval('area_mst_seq_seq'::regclass), '東京都', '小笠原村','https://suumo.jp/library/tf_13/sc_13421/?kb[]=3'     , current_timestamp, 'SYSTEM_USER', current_timestamp, 'SYSTEM_USER');


select * from area_mst
--truncate table area_mst 



-- // -----------------------------

select count(*) from
(
select p.url,count(*) as cnt from prop p group by p.url having count(*) > 1
) as a


-- // --------------------------------------------
-- //                ゴミデータ削除用クエリ
-- // --------------------------------------------
select p9.* from prop p9
--delete from prop p9
where exists(
select * from (

with MULTI_ROW as (
select * from prop p1 where exists(
select p.url,count(*) as cnt from prop p where p1.url = p.url group by p.url having count(*) > 1
) order by url,branch
), ret as(
select r.url,r.branch,r.prop_price,r.deleted_dt,
(r.prop_price - lag( r.prop_price ) OVER( PARTITION BY url ORDER BY url,branch )) as price_diff,
(COALESCE(r.deleted_dt,'1900-01-01') = COALESCE(lag( r.deleted_dt ) OVER( PARTITION BY url ORDER BY url,branch ),'1900-01-01')) as is_change_deleted,
(coalesce(r.url,'') = coalesce (lag( r.url ) OVER( PARTITION BY url ORDER BY url,branch ),'')) as is_same_url
from MULTI_ROW r
order by r.url, r.branch
)
--select * from ret r 
select * from ret r where r.price_diff = 0 and r.is_change_deleted = true and is_same_url = true

)as td where p9.url = td.url and p9.branch = td.branch

)

-- // ------------------------



with MULTI_ROW as (
select * from prop p1 where exists(
select p.url,count(*) as cnt from prop p where p1.url = p.url group by p.url having count(*) > 1
) order by url,branch
), ret as(
select r.url,r.branch,r.prop_price,r.deleted_dt,
(r.prop_price - lag( r.prop_price ) OVER( PARTITION BY url ORDER BY url,branch )) as price_diff,
(COALESCE(r.deleted_dt,'1900-01-01') = COALESCE(lag( r.deleted_dt ) OVER( PARTITION BY url ORDER BY url,branch ),'1900-01-01')) as is_change_deleted,
(coalesce(r.url,'') = coalesce (lag( r.url ) OVER( PARTITION BY url ORDER BY url,branch ),'')) as is_same_url
from MULTI_ROW r
order by r.url, r.branch
) 
select * from ret r inner join prop_info pi on r.url = pi.url and r.branch = pi.branch
inner join prop p on r.url = p.url and r.branch = p.branch
where (r.price_diff > 0 or r.price_diff < 0)
--and pi.address like '東京都文京区%'
order by r.prop_price


-----


with MULTI_ROW as (
select * from prop p1 where exists(
select p.url,count(*) as cnt from prop p where p1.url = p.url group by p.url having count(*) > 1
) order by url,branch
), ret as(
select r.url,r.branch,r.prop_price,r.deleted_dt,
(r.prop_price - lag( r.prop_price ) OVER( PARTITION BY url ORDER BY url,branch )) as price_diff,
(COALESCE(r.deleted_dt,'1900-01-01') = COALESCE(lag( r.deleted_dt ) OVER( PARTITION BY url ORDER BY url,branch ),'1900-01-01')) as is_change_deleted,
(coalesce(r.url,'') = coalesce (lag( r.url ) OVER( PARTITION BY url ORDER BY url,branch ),'')) as is_same_url
from MULTI_ROW r
order by r.url, r.branch
) 
select r.*,p.ex_area,p.floor_plan,p.building_url from ret r inner join prop p on r.url = p.url and r.branch = p.branch
where 
--p.building_url = ''
p.created_dt >= current_date -1
order by r.url, r.branch

select * from prop p where p.created_dt >= current_date and branch = 1


-- is_change_deleted: false かつ deleted_dtがNULL：復活
-- is_change_deleted: false かつ deleted_dtがNULLじゃない：削除
-- price_diff がマイナスだったら減額
-- price_diff がプラスだったら増額


where (r.price_diff > 0 or r.price_diff < 0)
--and pi.address like '東京都文京区%'
order by r.prop_price


select * from building b where url = 'https://suumo.jp/library/tf_13/sc_13101/to_1000397847/'
select * from prop p where building_url = 'https://suumo.jp/library/tf_13/sc_13101/to_1000397847/'

select * from prop p where url = 'https://suumo.jp/ms/chuko/tokyo/sc_chiyoda/nc_74164219/'


select COALESCE(null,'a')

select * from prop p where p.url = 'https://suumo.jp/ms/chuko/tokyo/sc_bunkyo/nc_73596220/'





--------------------



select * from prop p where building_url = 'https://suumo.jp/library/tf_13/sc_13105/to_1000332332/'




select * from building b 
inner join prop p on b.url = p.building_url 
where b.building_name like '%オーベル文京千石%'








