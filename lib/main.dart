import 'dart:async';
import 'dart:convert';

import 'package:action_broadcast/action_broadcast.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
//import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:myteam/api/api_config.dart';
import 'package:myteam/config/colors.dart';
import 'package:myteam/config/config.dart';
import 'package:myteam/model/article.dart';
import 'package:myteam/model/player.dart';
import 'package:myteam/model/post.dart';
import 'package:myteam/model/staff.dart';
import 'package:myteam/model/team.dart';
import 'package:myteam/model/trophy.dart';
import 'package:myteam/provider/notification_manager.dart';
import 'package:myteam/provider/theme_provider.dart';
import 'package:myteam/screens/articles/article_detail.dart';
import 'package:myteam/screens/articles/articles_list.dart';
import 'package:myteam/screens/home/home.dart';
import 'package:myteam/screens/players/player_detail.dart';
import 'package:myteam/screens/players/players_list.dart';
import 'package:myteam/screens/post/post_detail.dart';
import 'package:myteam/screens/other/settings.dart';
import 'package:myteam/screens/splash/splash.dart';
import 'package:myteam/screens/staffs/staff_detail.dart';
import 'package:myteam/screens/staffs/staffs_list.dart';
import 'package:myteam/screens/trophies/trophies_list.dart';
import 'package:myteam/screens/trophies/trophy_detail.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'receive_sharing_intent.dart';

void main() async{
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.grey.withOpacity(0.3), // status bar color
    // Status bar brightness (optional)

  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: 'My Team - demo',
      options: const FirebaseOptions(
          appId: '1:690266354741:android:b2195c6aac46422d6ced7c',
          apiKey: 'AIzaSyA15EORBGToMw7vryvmtUPx4w1LfX1inVs',
          messagingSenderId: '690266354741',
          projectId: 'project-690266354741'
      )
  );
  MobileAds.instance.initialize();
  FacebookAudienceNetwork.init();

  runApp(MyApp());

}



class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeProvider themeChangeProvider = new ThemeProvider();
  late StreamSubscription _intentDataStreamSubscription;
  late String post_id;

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey(debugLabel: "Main Navigator");


  String _name ="";
  String _subname = "";
  late String _type ;
  late String _data;
  String _info = "ok" ;

  late SharedPreferences prefs ;

  String _applogo="";
  String _appsponsors="";
  FirebaseMessaging _messaging = FirebaseMessaging.instance;

  _goToDeeplyNestedView() {
    navigatorKey.currentState?.pushReplacement(
        MaterialPageRoute(builder: (_) => Splash(post: post_id,appname: _name,appsubname:_subname,applogo: _applogo,appsponsors: _appsponsors,type:_type,data : _data,info:_info, status: '',))
    );
  }
  void registerNotification() async {
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    _info = "walo";
    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null ) {
      var message = initialMessage.data;
      setState(() {
        _type = '${message['type']}';
        if(_type == "link"){
          _data = '${message['link']}';
        }else if(_type == "post") {
          _data = '${message['id']}';
        }else if(_type == "status") {
          _data = '${message['id']}';
        }else if(_type == "match") {
          _data = '${message['id']}';
        }
      });
    }
    //_info = "initial " + initialMessage.data.toString();
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage _message) {
      var message = _message.data;
      setState(() {

        _type = '${message['type']}';
        if(_type == "link"){
          _data = '${message['link']}';
        }else if(_type == "post") {
          _data = '${message['id']}';
        }else if(_type == "status") {
          _data = '${message['id']}';
        }else if(_type == "match") {
          _data = '${message['id']}';
        }
      });
      _goToDeeplyNestedView();
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage _message) {
      print("onMessage");
      var message = _message.data;

      print('onMessage received: $message');
      sendBroadcast("matchNotif",data:  message);

      setState(() {
        String type  = '${message['type']}';
        String title  = '${message['title']}';
        String __message  = '${message['message']}';
        String image  = '${message['image']}';
        String icon  = '${message['icon']}';

        String  id = '${message['id']}';

        late String data;
        if(type == "link"){
          data = '{"id":"${message["id"]}","type":"${message["type"]}","data":"${message["link"]}"}';
        }else if(type == "post"){
          data = '{"id":"${message["id"]}","type":"${message["type"]}","data":"${message["id"]}"}';
        }else if(type == "status"){
          data = '{"id":"${message["id"]}","type":"${message["type"]}","data":"${message["id"]}"}';
        }else if(type == "match"){
          data = '{"id":"${message["id"]}","type":"${message["type"]}","data":"${message["id"]}"}';
        }
        notificationManager.showNotificationWithAttachment(id,title, __message, image, icon, data);

      });
    });


    _messaging.getToken().then((token) {
      print('Token: $token');
    }).catchError((e) {
      print(e);
    });
  }
  OnNotificationReceived(ReceivedNotification receivedNotification){}
  onNotificationClicked(String payload){
    onSelectNotification(payload);
  }
  @override
  void initState() {
    super.initState();
    initSettings();
    notificationManager.setOnNotificationClicked(onNotificationClicked);
    notificationManager.setOnNotificationReceived(OnNotificationReceived);
    getCurrentAppTheme();
    // 1. Initialize the Firebase app
    registerNotification();

    // For sharing or opening urls/text coming from outside the app while the app is in the memory
    _intentDataStreamSubscription =

        ReceiveSharingIntent.getTextStream().listen((String value) {
          setState(() {
            if(value != null){
              String api_url = apiConfig.api_url.replaceAll("/api/", "");
              post_id = value.replaceAll(api_url, "");

              post_id = post_id.replaceAll(".html", "");
              post_id = post_id.replaceAll("/post/", "");
            }

          });
        }, onError: (err) {
          print("getLinkStream error: $err");
        });

    // For sharing or opening urls/text coming from outside the app while the app is closed
    ReceiveSharingIntent.getInitialText().then((String value) {
      setState(() {
        if(value != null){
          String api_url = apiConfig.api_url.replaceAll("/api/", "");
          post_id = value.replaceAll(api_url, "");

          post_id = post_id.replaceAll(".html", "");
          post_id = post_id.replaceAll("/post/", "");
        }
      });
    } as FutureOr Function(String? value));

  }

  @override
  void dispose() {
    _intentDataStreamSubscription.cancel();
    super.dispose();
  }
  initSettings() async{
      prefs = await SharedPreferences.getInstance();
      getAppName();
      firebaseSubscribe();

  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
    await themeChangeProvider.themePreference.getTheme();
  }
  void getAppName(){
    setState(() {
      _name = ((prefs.getString("app_name") == null)? Config.appName :prefs.getString("app_name"))!;
      _subname = ((prefs.getString("app_sub_name") == null)? Config.subName :prefs.getString("app_sub_name"))!;
      _applogo = ((prefs.getString("app_logo") == null)? "" :prefs.getString("app_logo"))!;
      _appsponsors = ((prefs.getString("app_sponsors") == null)? Config.subName :prefs.getString("app_sponsors"))!;
    });
  }
  void firebaseSubscribe() async {
    if(prefs.getBool("notification_news") == null){
      await _messaging.subscribeToTopic('news');
      prefs.setBool("notification_news", true);

    }

    if(prefs.getBool("notification_status") == null){
      await _messaging.subscribeToTopic('status');
      prefs.setBool("notification_status", true);

    }

    if(prefs.getBool("notification_matches") == null){
      await _messaging.subscribeToTopic('matches');
      prefs.setBool("notification_matches", true);

    }

    if(prefs.getBool("notification_application") == null){
      await _messaging.subscribeToTopic('application');
      prefs.setBool("notification_application", true);

    }

  }
  @override
  Widget build(BuildContext context) {
    return   ChangeNotifierProvider(
      create: (_) {
        return themeChangeProvider;
      },
      child: Consumer<ThemeProvider>(
        builder: (BuildContext context, value, Widget? child) {
          return MaterialApp(
            navigatorKey: navigatorKey,

            debugShowCheckedModeBanner: false,
            theme: AppColors.themeData(themeChangeProvider.darkTheme, context),
            home: Splash(post:post_id,appname: _name,appsubname:_subname,applogo: _applogo,appsponsors: _appsponsors,type:_type,data : _data,info:_info, status: '',),
            // home: App(),
            routes: {
              "/home": (context) => Home(),
              "/settings": (context) => Settings(),
              "/article_list": (context) => ArticlesList(team: Null as Team,),
              "/article_detail": (context) => ArticleDetail(article: Null as Article,),

              "/players_list": (context) => PlayersList(team: Null as Team,),
              "/player_detail": (context) => PlayerDetail(player: Null as Player,),

              "/trophies_list": (context) => TrophiesList(team: Null as Team,),
              "/trophy_detail": (context) => TrophyDetail(trophy: Null as Trophy,),

              "/staffs_list": (context) => StaffsList(team: Null as Team,),
              "/staff_detail": (context) => StaffDetail(staff: Null as Staff,),

              "/post_detail": (context) => PostDetail(postFavorite: Null as Function, post: Null as Post,),
            },
          );
        },
      ),
    );
  }


  Future onSelectNotification(String payload) async {
    print(payload);
    Map parsed =json.decode(payload);
    _type = parsed['type'];
    if(_type == "link"){
      _data = parsed['data'];
    }else if(_type == "post") {
      _data = parsed['data'];
    }else if(_type == "status") {
      _data = parsed['data'];
    }else if(_type == "match") {
      _data = parsed['data'];
    }
    _goToDeeplyNestedView();

  }

}