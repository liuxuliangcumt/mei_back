class HomeShopBean {
  String category_name;
  int uid;
  List<ShopList> list;

  List<AdWap> ad_wap;

  HomeShopBean(this.category_name, this.uid, this.list);

  HomeShopBean.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    category_name = json['category_name'];

    if (json['list'] != null) {
      list = new List<ShopList>();
      json['list'].forEach((i) {
        list.add(new ShopList.fromJson(i));
      });
    }

    if (json['ad_wap'] != null) {
      ad_wap = new List<AdWap>();
      json['ad_wap'].forEach((i) {
        ad_wap.add(new AdWap.fromJson(i));
      });
    }
  }
}

class ShopList {
  String goods_name;
  String shop;

  //  "goods_name": "看了又看 特 别致设计师风格  精致绣花工艺醋酸中长款外套",
  // "shop": "艺文荟",
  String goods_sale_price;
  String goods_file1;
  String url;

  ShopList(this.goods_name, this.shop, this.goods_sale_price, this.goods_file1,
      this.url);

  ShopList.fromJson(Map<String, dynamic> json) {
    goods_name = json['goods_name'];
    shop = json['shop'];
    goods_sale_price = json['goods_sale_price'];
    goods_file1 = json['goods_file1'];
    url = json['url'];
  }
}

class AdWap {
  String title;
  String pic;
  String url;

  AdWap(this.title, this.pic, this.url);

  AdWap.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    pic = json['pic'];
    url = json['url'];
  }
}
