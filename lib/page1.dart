import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          //Colors.yellow
          Color(0xFF212121),
      appBar: AppBar(
        backgroundColor: Color(0xFF212121),
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
              "user_name",
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 23.sp,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
        leading: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.white,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(
              Icons.more_horiz_rounded,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 20),
            child: Row(
              children: [
                CircleAvatar(radius: 50.r),
                SizedBox(
                  width: 25.w,
                ),
                Column(
                  children: [
                    Text(
                      '129',
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 25.64.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Text(
                      'Posts',
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 23.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20.w,
                ),
                Column(
                  children: [
                    Text(
                      '3680',
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 25.64.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Text(
                      'Followers',
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 23.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20.w,
                ),
                Column(
                  children: [
                    Text(
                      '230',
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 25.64.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Text(
                      'Following',
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 23.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Text(
              'Name',
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 1),
            child: Text(
              'Local business',
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  color: Color(0xFF8E8E8E),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 1),
            child: Text(
              'www.website.com',
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  color: Color(0xFFD4E0ED),
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 29.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                Container(
                  width: 112.37.w,
                  height: 40.h,
                  decoration: ShapeDecoration(
                      color: Color(0xFF4192EF),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Center(
                    child: Text(
                      'Follow',
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18.05.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 9.w,
                ),
                Container(
                  width: 112.37.w,
                  height: 40.h,
                  decoration: ShapeDecoration(
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1.w, color: Colors.white38),
                          borderRadius: BorderRadius.circular(10))),
                  child: Center(
                    child: Text(
                      'Message',
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18.05.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 9.w,
                ),
                Container(
                  width: 112.37.w,
                  height: 40.h,
                  decoration: ShapeDecoration(
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1.w, color: Colors.white38),
                          borderRadius: BorderRadius.circular(10))),
                  child: Center(
                    child: Text(
                      'Email',
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18.05.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 9.w,
                ),
                Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: ShapeDecoration(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(width: 1.w, color: Colors.white38)),
                  ),
                  child: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          SizedBox(
            height: 110.h,
            width: 500.w,
            child: ListView.separated(
              itemCount: 7,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, position) {
                return Container(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 39.r,
                        backgroundColor: Colors.white38,
                        child: CircleAvatar(
                          radius: 37.r,
                          backgroundColor: Colors.black,
                          child: CircleAvatar(
                            radius: 34.r,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          'Highlight',
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              color: Color(0xFFFAFAFA),
                              fontSize: 14.91,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, position) {
                return SizedBox(
                  width: 10.w,
                );
              },
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Divider(
            thickness: 1,
            color: Colors.white70,
          )
        ],
      ),
    );
  }
}
