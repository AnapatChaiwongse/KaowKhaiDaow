import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'KaiDaow Application Demo'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Task Demo")),
        body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
          children: <Widget>[TaskPage()],
        ));
  }
}

class TaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // taskpagefzd (1:9)
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // headerAgV (51:1095)
              padding:
                  EdgeInsets.fromLTRB(26 * fem, 29 * fem, 26 * fem, 29 * fem),
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment(-0.275, -1),
                  end: Alignment(-0, 1),
                  colors: <Color>[
                    Color(0xffe1ffdd),
                    Color(0xffe7ffe3),
                    Color(0xffe0f9ff)
                  ],
                  stops: <double>[0, 0, 1],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3f000000),
                    offset: Offset(0 * fem, 4 * fem),
                    blurRadius: 10.75 * fem,
                  ),
                ],
              ),
              child: Text(
                '   Tasks',
                style: SafeGoogleFont(
                  'Inter',
                  fontSize: 16 * ffem,
                  fontWeight: FontWeight.w700,
                  height: 1.2125 * ffem / fem,
                  color: Color(0xff111111),
                ),
              ),
            ),
            Container(
              // autogrouppmuwtku (7mJ7M6B3tsYPE5eTsNpmuw)
              padding:
                  EdgeInsets.fromLTRB(26 * fem, 20.5 * fem, 27 * fem, 7 * fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // janD2V (51:1094)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0 * fem, 36.5 * fem),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // monthizq (23:1000)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 20.5 * fem),
                          child: Text(
                            '    18 January, 2024',
                            style: SafeGoogleFont(
                              'Inter',
                              fontSize: 14 * ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.2125 * ffem / fem,
                              color: Color(0xff111111),
                            ),
                          ),
                        ),
                        Container(
                          // csT5F (23:982)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 11 * fem),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(
                                  26 * fem, 38 * fem, 26 * fem, 39 * fem),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xffffffff),
                                borderRadius: BorderRadius.circular(19 * fem),
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    'assets/page-1/images/mask-group-U6h.png',
                                  ),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x3f000000),
                                    offset: Offset(0 * fem, 4 * fem),
                                    blurRadius: 2 * fem,
                                  ),
                                ],
                              ),
                              child: Text(
                                'CS - Assignment',
                                style: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 11 * ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 1.2125 * ffem / fem,
                                  color: Color(0xff414141),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          // group2c6Z (23:988)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 11 * fem),
                          padding: EdgeInsets.fromLTRB(
                              26 * fem, 38 * fem, 26 * fem, 39 * fem),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(19 * fem),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/page-1/images/mask-group-tn1.png',
                              ),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3f000000),
                                offset: Offset(0 * fem, 4 * fem),
                                blurRadius: 2 * fem,
                              ),
                            ],
                          ),
                          child: Text(
                            'AW - Quiz 1',
                            style: SafeGoogleFont(
                              'Inter',
                              fontSize: 11 * ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.2125 * ffem / fem,
                              color: Color(0xff414141),
                            ),
                          ),
                        ),
                        Container(
                          // group3Qo7 (23:994)
                          padding: EdgeInsets.fromLTRB(
                              26 * fem, 38 * fem, 26 * fem, 39 * fem),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(19 * fem),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/page-1/images/mask-group-Hj3.png',
                              ),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3f000000),
                                offset: Offset(0 * fem, 4 * fem),
                                blurRadius: 2 * fem,
                              ),
                            ],
                          ),
                          child: Text(
                            'HCI -  Project',
                            style: SafeGoogleFont(
                              'Inter',
                              fontSize: 11 * ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.2125 * ffem / fem,
                              color: Color(0xff414141),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // jan3bB (51:1093)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0 * fem, 27 * fem),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // monthNtM (23:1001)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 20.5 * fem),
                          child: Text(
                            '    30 January, 2024',
                            style: SafeGoogleFont(
                              'Inter',
                              fontSize: 14 * ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.2125 * ffem / fem,
                              color: Color(0xff111111),
                            ),
                          ),
                        ),
                        Container(
                          // group13Vi5 (23:1002)
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(19 * fem),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3f000000),
                                offset: Offset(0 * fem, 4 * fem),
                                blurRadius: 2 * fem,
                              ),
                            ],
                          ),
                          child: Center(
                            // maskgroupnhB (23:1004)
                            child: SizedBox(
                              width: 307 * fem,
                              height: 91 * fem,
                              child: Image.asset(
                                'assets/page-1/images/mask-group-gtm.png',
                                width: 307 * fem,
                                height: 91 * fem,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // addbuttonJQd (23:1175)
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xfff6f6f6),
                      borderRadius: BorderRadius.circular(19 * fem),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x3f000000),
                          offset: Offset(0 * fem, 4 * fem),
                          blurRadius: 2 * fem,
                        ),
                      ],
                    ),
                    child: Center(
                      // maskgroupPBB (23:1177)
                      child: SizedBox(
                        width: 307 * fem,
                        height: 91 * fem,
                        child: Image.asset(
                          'assets/page-1/images/mask-group-M6V.png',
                          width: 307 * fem,
                          height: 91 * fem,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // group11Vzu (42:128)
              width: double.infinity,
              height: 79 * fem,
              child: Stack(
                children: [
                  Positioned(
                    // ellipse6drD (42:129)
                    left: 215 * fem,
                    top: 0 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 59 * fem,
                        height: 59 * fem,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(29.5 * fem),
                            color: Color(0xffffffff),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3f000000),
                                offset: Offset(0 * fem, 0 * fem),
                                blurRadius: 5.1999998093 * fem,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // rectangle97mP (42:130)
                    left: 0 * fem,
                    top: 28 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 360 * fem,
                        height: 51 * fem,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xffffffff),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3f000000),
                                offset: Offset(0 * fem, 4 * fem),
                                blurRadius: 11.25 * fem,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // home211Ly (42:131)
                    left: 168 * fem,
                    top: 33 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 32 * fem,
                        height: 32 * fem,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: Image.asset(
                            'assets/page-1/images/home-2-1-hvV.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // emotions1tff (42:132)
                    left: 33 * fem,
                    top: 28 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 42 * fem,
                        height: 42 * fem,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: Image.asset(
                            'assets/page-1/images/emotions-1-n7o.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // settings1c5s (42:133)
                    left: 291 * fem,
                    top: 36 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 29 * fem,
                        height: 29 * fem,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: Image.asset(
                            'assets/page-1/images/settings-1-7Vo.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // ellipse77oK (42:134)
                    left: 215 * fem,
                    top: 0 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 59 * fem,
                        height: 59 * fem,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(29.5 * fem),
                            color: Color(0xffffffff),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3f000000),
                                offset: Offset(0 * fem, 0 * fem),
                                blurRadius: 0 * fem,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // calendar11ow3 (42:135)
                    left: 107 * fem,
                    top: 35 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 29 * fem,
                        height: 29 * fem,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: Image.asset(
                            'assets/page-1/images/calendar-1-1-zDj.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // clipboard1Jcu (42:136)
                    left: 227 * fem,
                    top: 11 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 35 * fem,
                        height: 35 * fem,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: Image.asset(
                            'assets/page-1/images/clipboard-1-S3o.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
