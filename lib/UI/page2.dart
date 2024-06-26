import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          DefaultTabController(
            length: 2,
            child: Column(
              children: [
                Container(
                  width: 500.w,
                  height: 50.h,color: Colors.white,
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerHeight: 1,
                    indicatorColor: Colors.black,
                    labelColor: Colors.white,
                    tabs: [
                      Tab(
                        child:Text("Followers",
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 23.sp,
                              fontWeight: FontWeight.w400,
                  ),
            ),
                        )
                      ),
                      Tab(
                        child:Text("Following", style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 23.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),)
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(height: 500.h,width: 500.w,
                  child: TabBarView(children: [
                    Container(width: 500.w,
                      height:double.infinity,
                      color: Colors.yellow,
                    ),
                    Container(width: 500.w,height: 500.h,
                      color: Colors.blue,
                    )
                  ],),
                ),
              ],
            ),
          ),
        ],),
      )

    );
  }
}
