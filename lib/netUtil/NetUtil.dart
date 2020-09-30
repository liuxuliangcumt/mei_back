import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import 'ox_log.dart';

class NetUtil {
  static post(String url, Map<String, dynamic> queryParams, Function success,
      Function error,
      {CancelToken cancelToken}) async {
    await dioPost(url, queryParams, cancelToken, success, error);
  }

  static get(String url, Map<String, dynamic> queryParams, Function success,
      Function error,
      {CancelToken cancelToken}) async {
    await dioGet(url, queryParams, cancelToken, success, error);
  }

  static postFromWebSocket(String url, Map<String, dynamic> queryParams,
      Function success, Function error,
      {FormData data}) async {
    if (data == null) {
      await dioPost(url, queryParams, null, success, error);
    } else {
      await dioPostWithData(url, queryParams, null, success, error, data);
    }
  }

  static postForm(String url, Map<String, dynamic> queryParams,
      Function success, Function error,
      {CancelToken cancelToken}) async {
    await dioPost(url, queryParams, cancelToken, success, error);
  }

  static Future dioPost(String url, Map<String, dynamic> queryParams,
      CancelToken cancelToken, Function success, Function error) async {
    logger.e("网络请求地址：  $url  参数 $queryParams");

    Map<String, dynamic> headersP = Map();
    //headersP["token"] = token;
    headersP["timeoutMs"] = 10000;
    Options options = Options();
    options.contentType = ContentType.parse("application/json");
    options.headers.addAll(headersP);

    //   FormData.from(queryParams);
    try {
      //todo 请求后加  queryParameters  queryParams ，  请求body data
      Dio dio = Dio();
      Response response;
      if (queryParams != null && queryParams.length != 0) {
        print("走data");
        print(jsonEncode(queryParams));
        FormData formData = FormData.from(queryParams);
        response = await dio.post(url,
            data: jsonEncode(queryParams),
           // queryParameters: queryParams,
            options: options,
            cancelToken: cancelToken);
      } else {
        print("走queryParams");
        response = await dio.post(url,
            queryParameters: queryParams,
            options: options,
            cancelToken: cancelToken);
      }

//      printLog(url, queryParams, response, token);
      if (response == null) {
        success(null);
        return;
      }

      if (response.statusCode == HttpStatus.ok) {
        /* if (response.data['code'] == "SUCCESS") {
          success(response);
        } else {
          String errorMsg = response.data['message'];
          if (errorMsg.contains("token 已过期！") ||
              errorMsg.contains("登录认证失败,请重新登录")) {
          }
          error(errorMsg);
        }*/
        success(response);
        print("请求接口返回结果：$url \n $response");
      } else {
        print("接口请求失败");

        error("接口请求失败,请检查网络~");
      }
    } on DioError catch (e) {
      logger.e("data网络请求过程中发生异常：exception is $e    ");
      error("接口请求失败,请检查网络~");
    }
  }

  static Future dioGet(String url, Map<String, dynamic> queryParams,
      CancelToken cancelToken, Function success, Function error) async {
    Map<String, dynamic> headersP = Map();
    //headersP["token"] = token;
    headersP["timeoutMs"] = 10000;
    Options options = Options();
    options.headers.addAll(headersP);
    if (queryParams != null && queryParams.length != 0) {
      url = url + "?";
      queryParams.forEach((key, value) {
        url = url + key + "=" + value.toString();
      });
    }
    logger.e("网络请求地址：  $url  参数 $queryParams");
    try {
      //todo 请求后加  queryParameters  queryParams ，  请求body data
      Dio dio = Dio();
      Response response = await dio.get(url,
          queryParameters: queryParams,
          options: options,
          //  data: queryParams,
          cancelToken: cancelToken);
//      printLog(url, queryParams, response, token);
      if (response == null) {
        success(null);
        return;
      }

      if (response.statusCode == HttpStatus.ok) {
        /* if (response.data['code'] == "SUCCESS") {
          success(response);
        } else {
          String errorMsg = response.data['message'];
          if (errorMsg.contains("token 已过期！") ||
              errorMsg.contains("登录认证失败,请重新登录")) {
          }
          error(errorMsg);
        }*/
        success(response);
        print("请求接口返回结果：$url \n $response");
      } else {
        error("接口请求失败,请检查网络~");
      }
    } on DioError catch (e) {
      logger.e("data网络请求过程中发生异常：exception is $e    ");
      error("接口请求失败,请检查网络~");
    }
  }

  static Future dioPostWithData(String url,
      Map<String, dynamic> queryParams,
      CancelToken cancelToken,
      Function success,
      Function error,
      FormData data) async {
    Map<String, dynamic> headersP = Map();
    // headersP["token"] = token;
    headersP["timeoutMs"] = 10000;
    Options options = Options();
    options.headers.addAll(headersP);

    try {
      Dio dio = Dio();
      Response response = await dio.post(url,
          queryParameters: queryParams,
          data: data,
          options: options,
          cancelToken: cancelToken);
//      printLog(url, queryParams, response, token);
      if (response == null) {
        success(null);
        return;
      }

      if (response.statusCode == HttpStatus.ok) {
        if (response.data['code'] == "SUCCESS") {
          success(response);
        } else {
          String errorMsg = response.data['message'];
          if (errorMsg.contains("token 已过期！") ||
              errorMsg.contains("登录认证失败,请重新登录")) {
            // 清空原有token 信息
            // prefs.setString("newToken", "");
            /*   NavigatorUtil.navigatorKey.currentState.pushReplacement(
                MaterialPageRoute(builder: (context) => LoginPage()));*/
          }
          error(errorMsg);
        }
      } else {
        error("接口请求失败,请检查网络~");
      }
    } on DioError catch (e) {
      logger.e("网络请求过程中发生异常：exception is $e");
      error("接口请求失败,请检查网络~");
    }
  }

  static void printLog(String url, Map<String, dynamic> queryParams,
      Response response, String token) {
    print("▼" * 30 + "网络请求开始");
    if (queryParams != null && queryParams.isNotEmpty) {
      StringBuffer sb = new StringBuffer("?");
      queryParams.forEach((key, value) {
        sb.write("$key" + "=$value" + "&");
      });
      String paramStr = sb.toString();
      paramStr = paramStr.substring(0, paramStr.length - 1);
      url += paramStr;
    }

    logger.d(url);
    logger.d(queryParams);
    logger.d(json.decode(response.toString()));
    logger.d('token:\n $token');
    print("▲" * 30 + "网络请求结束");
  }
}
