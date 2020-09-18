import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';



class BannerList {
  List<MyBanner> banners;

  BannerList.fromJson(List<dynamic> json)
      : banners = json.map((i) => MyBanner.fromJson(i)).toList();

  @override
  String toString() {
    return 'BannerList: $banners';
  }
}
class MyBanner  {
    String label;
    String img;
    String url;

    MyBanner(this.label, this.img, this.url);

    MyBanner.fromJson(Map<String, dynamic> json)
        : label = json['label'],
            img = json['img'],
            url = json['url'];

    @override
    String toString() {
        return 'Banner{label: $label, img: $img, url: $url}';
    }


}
