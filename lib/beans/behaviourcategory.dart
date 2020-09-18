class BCategory {
  String board_name_code;
  String board_title;
  int parentid;
  int uid;

  BCategory(this.board_name_code, this.board_title, this.parentid, this.uid);

  BCategory.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    board_name_code = json['board_name_code'];
    board_title = json['board_title'];
    parentid = json['parentid'];
  }
}
