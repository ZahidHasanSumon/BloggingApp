import 'dart:ffi';

import 'package:basic_flutter/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../provider/changeBgColor.dart';
import 'description.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color bgColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        // title: const Text('I am home'),
        // centerTitle: true,
        backgroundColor: Colors.red,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            onPressed: () {
              // context.read<ChangeColor>().color;

              setState(() {
                if (bgColor == Colors.white) {
                  bgColor = Colors.red;
                  context.read<ChangeColor>().changedColor(newBgColor: bgColor);
                } else if (bgColor != Colors.white) {
                  bgColor = Colors.white;
                  context.read<ChangeColor>().changedColor(newBgColor: bgColor);
                }
              });
            },
            icon: const Icon(Icons.color_lens_rounded),
          ),
        ],
      ),
      drawer: SafeArea(
        child: Drawer(
          child: Column(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
                child: ListTile(
                  title: Text(
                    'My Blog',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.face_rounded),
                title: Text('profile'.tr),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.settings),
                title: Text('settings'.tr),
              ),
              ListTile(
                onTap: () {
                  // Navigator.of(context).pushReplacement(
                  //   MaterialPageRoute(
                  //     builder: (context) {
                  //       return const LoginPage();
                  //     },
                  //   ),
                  // );

                  Get.off(() => LoginPage());
                },
                leading: const Icon(Icons.logout_rounded),
                title: Text('logout'.tr),
              ),
              ListTile(
                leading: const Icon(Icons.language_rounded),
                title: Text('language'.tr),
              ),
              ListTile(
                leading: ElevatedButton(
                  onPressed: () async {
                    Get.updateLocale(const Locale('en', 'Us'));
                    SharedPreferences sp =
                        await SharedPreferences.getInstance();
                    sp.setString('lang', 'en');
                    sp.setString('cont', 'Us');
                  },
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.redAccent; //<-- SEE HERE
                        }
                        return null; // Defer to the widget's default.
                      },
                    ),
                  ),
                  child: const Text(
                    'English',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                trailing: ElevatedButton(
                  onPressed: () async {
                    Get.updateLocale(const Locale('bn', 'Bd'));
                    SharedPreferences sp =
                        await SharedPreferences.getInstance();
                    sp.setString('lang', 'bn');
                    sp.setString('cont', 'Bd');
                  },
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.redAccent; //<-- SEE HERE
                        }
                        return null; // Defer to the widget's default.
                      },
                    ),
                  ),
                  child: const Text(
                    'বাংলা',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {

                Get.to(() =>  DescriptionPage(
                    title: 'blog1'.tr,
                    path: 'assets/icons/avatar-thinking.svg'));

                Get.snackbar(
                  "Hello user,",
                  "Please wait a moment while we are fetching your requested data",
                  icon: const Icon(Icons.person, color: Colors.white),
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.redAccent,
                  margin: const EdgeInsets.all(10),
                  colorText: Colors.white,
                  duration: const Duration(seconds: 2),
                );
              },
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/avatar-thinking.svg',
                      height: 250,
                    ),
                    ListTile(
                      title: Text('blog1'.tr),
                      trailing: const Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return const DescriptionPage(
                //         title: 'Which topics should you add in your blog?',
                //         path: 'assets/icons/avatar-thinking-4.svg',
                //       );
                //     },
                //   ),
                // );
                Get.to(() =>  DescriptionPage(
                    title: 'blog2'.tr,
                    path: 'assets/icons/avatar-thinking-4.svg'));
              },
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/avatar-thinking-4.svg',
                      height: 250,
                    ),
                    ListTile(
                      title: Text('blog2'.tr),
                      trailing: const Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return  DescriptionPage(
                        title: 'blog3'.tr,
                        path: 'assets/icons/avatar-thinking-2.svg',
                      );
                    },
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/avatar-thinking-2.svg',
                      height: 250,
                    ),
                    ListTile(
                      title: Text('blog3'.tr),
                      trailing: const Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return  DescriptionPage(
                        title: 'blog4'.tr,
                        path: 'assets/icons/avatar-thinking-6.svg',
                      );
                    },
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/avatar-thinking-6.svg',
                      height: 250,
                    ),
                    ListTile(
                      title: Text('blog4'.tr),
                      trailing: const Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
