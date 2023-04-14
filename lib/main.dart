import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator/geolocator.dart'
    as geolocator; // or whatever name you want
import 'package:location/location.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:soleoserp/ui/res/localizations/app_localizations.dart';
import 'package:soleoserp/ui/res/style_resources.dart';
import 'package:soleoserp/ui/screens/DashBoard/home_screen.dart';
import 'package:soleoserp/ui/screens/authentication/first_screen.dart';
import 'package:soleoserp/ui/screens/authentication/serial_key_screen.dart';
import 'package:soleoserp/ui/screens/splash_screen.dart';
import 'package:soleoserp/utils/general_utils.dart';
import 'package:soleoserp/utils/local_notification/local_notification_manager.dart';
import 'package:soleoserp/utils/shared_pref_helper.dart';

import 'utils/offline_db_helper.dart';

Directory _appDocsDir;
String TitleNotificationSharvaya = "";

String Latitude;
String Longitude;
bool is_LocationService_Permission;
final Geolocator geolocator123 = Geolocator()..forceAndroidLocationManager;
Location location = new Location();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPrefHelper.createInstance();
  await OfflineDbHelper.createInstance();
  await NotificationController.initializeLocalNotifications();

  _appDocsDir = await getApplicationDocumentsDirectory();
  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
    var swAvailable = await AndroidWebViewFeature.isFeatureSupported(
        AndroidWebViewFeature.SERVICE_WORKER_BASIC_USAGE);
    var swInterceptAvailable = await AndroidWebViewFeature.isFeatureSupported(
        AndroidWebViewFeature.SERVICE_WORKER_SHOULD_INTERCEPT_REQUEST);

    if (swAvailable && swInterceptAvailable) {
      AndroidServiceWorkerController serviceWorkerController =
          AndroidServiceWorkerController.instance();

      serviceWorkerController.serviceWorkerClient = AndroidServiceWorkerClient(
        shouldInterceptRequest: (request) async {
          print(request);
          return null;
        },
      );
    }
  }
  checkPermissionStatus();
  /* runApp(DevicePreview(
    enabled: true,
    builder: (context) => MyApp(),
  ));*/

  /*await FlutterLogs.initLogs(
      logLevelsEnabled: [
        LogLevel.INFO,
        LogLevel.WARNING,
        LogLevel.ERROR,
        LogLevel.SEVERE
      ],
      timeStampFormat: TimeStampFormat.TIME_FORMAT_READABLE,
      directoryStructure: DirectoryStructure.FOR_DATE,
      logTypesEnabled: ["device", "network", "errors"],
      logFileExtension: LogFileExtension.LOG,
      logsWriteDirectoryName: "MyLogs",
      logsExportDirectoryName: "MyLogs/Exported",
      debugFileOperations: true,
      isDebuggable: true);*/

  runApp(MyApp());
}

void checkPermissionStatus() async {
  bool granted = await Permission.location.isGranted;
  bool Denied = await Permission.location.isDenied;
  bool PermanentlyDenied = await Permission.location.isPermanentlyDenied;

  print("PermissionStatus" +
      "Granted : " +
      granted.toString() +
      " Denied : " +
      Denied.toString() +
      " PermanentlyDenied : " +
      PermanentlyDenied.toString());

  if (Denied == true) {
    // openAppSettings();
    is_LocationService_Permission = false;
    /*  showCommonDialogWithSingleOption(Globals.context,
        "Location permission is required , You have to click on OK button to Allow the location access !",
        positiveButtonTitle: "OK", onTapOfPositiveButton: () async {
      await openAppSettings();
      Navigator.of(Globals.context).pop();
    });*/

    await Permission.location.request();
    // We didn't ask for permission yet or the permission has been denied before but not permanently.
  }

// You can can also directly ask the permission about its status.
  if (await Permission.location.isRestricted) {
    // The OS restricts access, for example because of parental controls.
    openAppSettings();
  }
  if (PermanentlyDenied == true) {
    // The user opted to never again see the permission request dialog for this
    // app. The only way to change the permission's status now is to let the
    // user manually enable it in the system settings.
    is_LocationService_Permission = false;
    openAppSettings();
  }

  if (granted == true) {
    // The OS restricts access, for example because of parental controls.
    is_LocationService_Permission = true;
    _getCurrentLocation();

    /*if (serviceLocation == true) {
        // Use location.
        _serviceEnabled=false;

         location.requestService();


      }
      else{
        _serviceEnabled=true;
        _getCurrentLocation();



      }*/
  }
}

_getCurrentLocation() {
  geolocator123
      .getCurrentPosition(desiredAccuracy: geolocator.LocationAccuracy.best)
      .then((Position position) async {
    Longitude = position.longitude.toString();
    Latitude = position.latitude.toString();
  }).catchError((e) {
    print(e);
  });

  location.onLocationChanged.listen((LocationData currentLocation) async {
    // Use current location
    print("OnLocationChange" +
        " Location : " +
        currentLocation.latitude.toString());
    //  placemarks = await placemarkFromCoordinates(currentLocation.latitude,currentLocation.longitude);
    // final coordinates = new Coordinates(currentLocation.latitude,currentLocation.longitude);
    // var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    // var first = addresses.first;
    //  print("${first.featureName} : ${first.addressLine}");
    Latitude = currentLocation.latitude.toString();
    Longitude = currentLocation.longitude.toString();
    SharedPrefHelper.instance.setLatitude(Latitude);
    SharedPrefHelper.instance.setLongitude(Longitude);

    //  Address = "${first.featureName} : ${first.addressLine}";
  });

  // _FollowupBloc.add(LocationAddressCallEvent(LocationAddressRequest(key:"",latlng:Latitude+","+Longitude)));
}

//RouteSettings settings123;

File fileFromDocsDir(String filename) {
  String pathName = p.join(_appDocsDir.path, filename);
  return File(pathName);
}

class MyApp extends StatefulWidget {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  _MyAppState createState() => _MyAppState();

  ///handles screen transaction based on route name
  static MaterialPageRoute globalGenerateRoute(RouteSettings settings) {
    //if screen have no argument to pass data in next screen while transiting
    // final GlobalKey<ScaffoldState> key = settings.arguments;

    switch (settings.name) {
      case SplashScreen.routeName:
        return getMaterialPageRoute(SplashScreen());
      case SerialKeyScreen.routeName:
        return getMaterialPageRoute(SerialKeyScreen());
      case FirstScreen.routeName:
        return getMaterialPageRoute(FirstScreen());
      case HomeScreen.routeName:
        return getMaterialPageRoute(HomeScreen());

      default:
        return null;
    }
  }
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /* return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const HomePage(),
    );*/
    return OverlaySupport(
      child: MaterialApp(
          //useInheritedMediaQuery: true,
          // builder: DevicePreview.appBuilder,
          onGenerateRoute: MyApp.globalGenerateRoute,
          debugShowCheckedModeBanner: false,
          supportedLocales: [
            Locale('en', 'US'),
          ],
          localizationsDelegates: [
            // A class which loads the translations from JSON files
            AppLocalizations.delegate,
            // Built-in localization of basic text for Material widgets
            GlobalMaterialLocalizations.delegate,
            // Built-in localization for text direction LTR/RTL
            GlobalWidgetsLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            MonthYearPickerLocalizations.delegate,
          ],
          // Returns a locale which will be used by the app
          localeResolutionCallback: (locale, supportedLocales) {
            // Check if the current device locale is supported
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale.languageCode &&
                  supportedLocale.countryCode == locale.countryCode) {
                return supportedLocale;
              }
            }
            // If the locale of the device is not supported, use the first one
            // from the list (English, in this case).
            return supportedLocales.first;
          },
          title: "Flutter base app",
          theme: buildAppTheme(),
          initialRoute: getInitialRoute(TitleNotificationSharvaya)),
    );
  }

  ///returns initial route based on condition of logged in/out
  getInitialRoute(String titleNotificationSharvaya) {
    if (SharedPrefHelper.instance.isLogIn()) {
      //return Mayank_Dashboard.routeName;
    } else if (SharedPrefHelper.instance.isRegisteredIn()) {
      return FirstScreen.routeName;
    }

    return SerialKeyScreen.routeName;
  }
}
