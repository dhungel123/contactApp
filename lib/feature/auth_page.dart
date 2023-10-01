import 'package:contact_app/feature/contact_page/presentation/contact_page.dart';
import 'package:contact_app/feature/onboard/onboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final storage = new FlutterSecureStorage();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Future<void> checkUserStatus() async {
    bool userFirstTime = false;
    bool userLogin = false;

    await storage.read(key: 'isUserFirstTime').then((value) async =>
    {
      if(value == null || value != 'true'){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const OnBoardScreen())),
        await storage.write(key: 'isUserFirstTime', value: 'true'),
      } else
        {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ContactPage()))
        }
    });
    //
    //   if(userFirstTime){
    //     // goto onboarding
    //   }else{
    //     if(userLogin){
    //       // goto homepage
    //     }else{
    //       // goto loginpage
    //     }
    //   }
    // }
  }
}
