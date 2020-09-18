import 'banners.dart';

class HomeNews {
  List<NewBean> newBeans;

  HomeNews.fromJson(List<dynamic> json)
      : newBeans = json.map((i) => NewBean.fromJson(i)).toList();

  @override
  String toString() {
    return 'HomeNews: $newBeans';
  }
}

class NewBean {
  int uid;
  String board_name_code;
  String board_title;
  List<MyBanner> ad_app;
  List<ShopBean> list;

  NewBean(
      this.uid, this.board_name_code, this.board_title, this.ad_app, this.list);

  NewBean.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    board_name_code = json['board_name_code'];
    board_title = json['board_title'];
    if (json['ad_app'] != null) {
      ad_app = new List<MyBanner>();
      json['ad_app'].forEach((i) {
        ad_app.add(new MyBanner.fromJson(i));
      });
    }
    if (json['list'] != null) {
      list = new List<ShopBean>();
      json['list'].forEach((i) {
        list.add(new ShopBean.fromJson(i));
      });
    }
  }

  @override
  String toString() {
    return 'NewBean{uid: $uid, board_name_code: $board_name_code, board_title: $board_title, ad_app: $ad_app, list: $list}';
  }
}

//商品Bean
class ShopBean {
  int uid;
  String ps_name;
  String board_subject;
  String cover;
  String author;
  String register_date;
  String jianjie;
  String board_body;
  String url;
  String sub_title1;
  String sub_title2;
  String sub_title3;

  ShopBean(
      this.uid,
      this.ps_name,
      this.board_subject,
      this.cover,
      this.author,
      this.register_date,
      this.jianjie,
      this.board_body,
      this.url,
      this.sub_title1,
      this.sub_title2,
      this.sub_title3);

  ShopBean.fromJson(Map<String, dynamic> json)
      : uid = json['uid'],
        ps_name = json['ps_name'],
        board_subject = json['board_subject'],
        cover = json['cover'],
        author = json['author'],
        register_date = json['register_date'],
        jianjie = json['jianjie'],
        board_body = json['board_body'],
        url = json['url'],
        sub_title1 = json['sub_title1'],
        sub_title2 = json['sub_title2'],
        sub_title3 = json['sub_title3'];

  @override
  String toString() {
    return 'ShopBean{uid: $uid, ps_name: $ps_name, board_subject: $board_subject, cover: $cover, author: $author, register_date: $register_date, jianjie: $jianjie, board_body: $board_body, url: $url, sub_title1: $sub_title1, sub_title2: $sub_title2, sub_title3: $sub_title3}';
  }
}
