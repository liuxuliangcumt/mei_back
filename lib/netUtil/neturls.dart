class NetUrls {
  static String baseUrl = "http://www.bjxmqy.com:9501/";
// 用户注册验证码接口
  static String get_registerverify_code =
      baseUrl + "common/get_registerverify_code";

//用户登录验证码
  static String get_loginverify_code = baseUrl + "common/get_loginverify_code";

//用户忘记密码验证码
  static String get_lossverify_code = baseUrl + "common/get_lossverify_code";

//注册新手机号
  static String register = baseUrl + "common/register";

  //账户登录
  static String login = baseUrl + "common/login";

  //手机登录账号
  static String phlogin = baseUrl + "common/phlogin";

  // 忘记密码 修改密码
  static String lostpasswd = baseUrl + "common/lostpasswd";

// 获取分类商品列表 home
  static String goods_list = baseUrl + "news/goods_list";
}
