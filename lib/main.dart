import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:mei_back/page/home_magazine.dart';
import 'package:mei_back/page/loginandregister/login.dart';
import 'package:mei_back/src/colors/themecolors.dart';
import 'package:oktoast/oktoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: ThemeColors.colorTheme,
          appBarTheme: AppBarTheme(
              color: Colors.white,
              elevation: 0.5,
              iconTheme: IconThemeData(color: Colors.grey)),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Login(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final pages = [
    HomeMagazine(),
    Text("sdf"),
    Text("sdf"),
    Text("sdf"),
    Text("sdf"),
  ];

  int currentIndex = 0;

  PageController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
    _controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBodyWidget(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: bottomNavItems,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        selectedItemColor: Colors.black,
        currentIndex: currentIndex,
        unselectedItemColor: Colors.black,
        onTap: (index) {
          _controller.jumpToPage(index);
        },
      ),
    );
  }

  /*切换页面*/
  void _changePage(int index) {
    /*如果点击的导航项不是当前项  切换 */
    if (index != currentIndex) {
      setState(() {
        currentIndex = index;
      });
    }
  }

  final List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
      activeIcon: SizedBox(
        child: Image.asset(
          "assets/images/zazhi.png",
        ),
        height: 20,
        width: 20,
      ),
      icon: SizedBox(
        child: Image.asset(
          "assets/images/zazhi_u.png",
        ),
        height: 20,
        width: 20,
      ),
      title: Text("首页"),
    ),
    BottomNavigationBarItem(
      activeIcon: SizedBox(
        child: Image.asset(
          "assets/images/shequ.png",
        ),
        height: 20,
        width: 20,
      ),
      icon: SizedBox(
        child: Image.asset(
          "assets/images/shequ_u.png",
        ),
        height: 20,
        width: 20,
      ),
      title: Text("供应"),
    ),
    BottomNavigationBarItem(
      activeIcon: SizedBox(
        child: Image.asset(
          "assets/images/shangdian.png",
        ),
        height: 20,
        width: 20,
      ),
      icon: SizedBox(
        child: Image.asset(
          "assets/images/shangdian_u.png",
        ),
        height: 20,
        width: 20,
      ),
      title: Text("消息"),
    ),
    BottomNavigationBarItem(
      activeIcon: SizedBox(
        child: Image.asset(
          "assets/images/fuwu.png",
        ),
        height: 20,
        width: 20,
      ),
      icon: SizedBox(
        child: Image.asset(
          "assets/images/fuwu_u.png",
        ),
        height: 20,
        width: 20,
      ),
      title: Text("分销"),
    ),
    BottomNavigationBarItem(
      activeIcon: SizedBox(
        child: Image.asset(
          "assets/images/wode.png",
        ),
        height: 20,
        width: 20,
      ),
      icon: SizedBox(
        child: Image.asset(
          "assets/images/wode_u.png",
        ),
        height: 20,
        width: 20,
      ),
      title: Text("我的"),
    ),
  ];

  void getLocation() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    print(_locationData.toString());
  }

  Widget _buildBodyWidget() {
    return PageView.builder(
      controller: _controller,
      itemCount: pages.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return pages[index];
      },
      onPageChanged: (index) {
        if (index != _controller) {
          setState(() {
            currentIndex = index;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
