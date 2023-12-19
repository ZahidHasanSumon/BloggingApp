import 'package:basic_flutter/pages/home.dart';
import 'package:basic_flutter/provider/changeBgColor.dart';
import 'package:basic_flutter/provider/languages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:basic_flutter/pages/loginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

}


class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  String lancode ='';
  String countrycode ='';
  @override
  void initState() {
    super.initState();
    sharedData();

  }
  void sharedData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    lancode = sp.getString('lang') ?? '';
    countrycode = sp.getString('cont') ?? '';
    setState(() {

    });



  }


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ChangeColor(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,

        theme: ThemeData(
          primarySwatch: Colors.red,
          fontFamily: 'Poppins',
        ),
        home: const LoginPage(),
        translations: Languages(),
        fallbackLocale: const Locale('en', 'Us'),
        locale: Locale(lancode,countrycode),



      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome',
              style: TextStyle(
                color: Colors.white,
                fontSize: 55,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'to my Blog',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            SvgPicture.asset(
              'assets/icons/loginPage.svg',
              height: 250,
              width: 500,
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: (){
                //normal implementation of routing page
                // Navigator.of(context).pushReplacement(
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return const HomePage();
                //     },
                //   ),
                // );

                //Getx implementation of routing pages
                // SharedPreferences sp = await SharedPreferences.getInstance();
                // String? lan = sp.getString('lang');
                // String? desh = sp.getString('cont');
                // locale: Locale( lan!, desh);
                // print(lan+desh!);

                Get.to(() => const LoginPage1());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.redAccent,
                minimumSize: const Size(300, 50),
              ),
              child: const Text('Login'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                minimumSize: const Size(300, 50),
              ),
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
