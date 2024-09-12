import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram/Repostory/ModelClass/FollowersModel.dart';
import 'package:instagram/Repostory/ModelClass/InstagramModel.dart';
import 'package:instagram/Repostory/ModelClass/TagModel.dart';
import 'package:instagram/UI/page2.dart';

import '../Bloc/highlight_bloc.dart';
import '../Bloc/insta_bloc.dart';
import '../Bloc/post_bloc.dart';
import '../Bloc/tag_bloc.dart';
import '../Repostory/ModelClass/PostModels.dart';
import '../Repostory/ModelClass/highlightModel.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key,});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  late InstagramModel instagram;
  late HighlightModel highlightid;
  late PostModels posts;
  late TagModel tagedpost;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          //Colors.yellow
          Color(0xFF212121),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: TextField(cursorColor: Colors.white,
          style: TextStyle(color: Colors.white),
          controller: controller,
          onSubmitted: (value) {
            BlocProvider.of<InstaBloc>(context)
                .add(FetchInstaEvent(id: controller.text));
            BlocProvider.of<PostBloc>(context)
                .add(FetchpostEvent(post: controller.text));
            BlocProvider.of<HighlightBloc>(context).add(
              FetchHighlightEvent(Highlights: controller.text),
            );
            BlocProvider.of<TagBloc>(context).add(
              FetchTagEvent(tag: controller.text),
            );
          },
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.pink)),
              hintText: "Search",
              prefixIcon: Icon(
                Icons.search_outlined,
                color: Colors.white,
              ),
              hintStyle: TextStyle(color: Colors.white)),
        ),
      ),

      body: SingleChildScrollView(
        child: BlocBuilder<InstaBloc, InstaState>(
          builder: (context, state) {
            if (state is InstaBlocLoading) {
              return Center(
                child: CircularProgressIndicator(color: Colors.grey,backgroundColor: Colors.white,),
              );
            }
            if (state is InstaBlocError) {
              return Center(
                child: Text("Error"),
              );
            }
            if (state is InstaBlocLoaded) {
              instagram = BlocProvider.of<InstaBloc>(context).instagramModel;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 20),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 50.r,
                          backgroundImage: NetworkImage(
                              instagram.data!.profilePicUrlHd.toString()),
                        ),
                        SizedBox(
                          width: 25.w,
                        ),
                        Column(
                          children: [
                            Text(
                              instagram.data!.mediaCount.toString(),
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
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => Screen2(
                                      followerid:
                                          instagram.data!.username.toString(),
                                      followingid:
                                          instagram.data!.username.toString(),
                                      index: 0,
                                    )));
                          },
                          child: Column(
                            children: [
                              Text(
                                instagram.data!.followerCount.toString(),
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
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => Screen2(
                                  followerid:
                                      instagram.data!.username.toString(),
                                  followingid:
                                      instagram.data!.username.toString(),
                                  index: 1),
                            ));
                          },
                          child: Column(
                            children: [
                              Text(
                                instagram.data!.followingCount.toString(),
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
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    child: Text(
                      instagram.data!.fullName.toString(),
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
                                  side: BorderSide(
                                      width: 1.w, color: Colors.white38),
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
                                  side: BorderSide(
                                      width: 1.w, color: Colors.white38),
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
                                side: BorderSide(
                                    width: 1.w, color: Colors.white38)),
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
                    child: BlocBuilder<HighlightBloc, HighlightState>(
                      builder: (context, state) {
                        if (state is HighlightBlocLoading) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is HighlightBlocError) {
                          return Center(
                            child: Text("Error"),
                          );
                        }
                        if (state is HighlightBlocLoaded) {
                          highlightid = BlocProvider.of<HighlightBloc>(context)
                              .highlightModel;

                          return ListView.separated(
                            itemCount: highlightid.data!.items!.length,
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
                                          backgroundImage: NetworkImage(
                                              highlightid
                                                  .data!
                                                  .items![position]
                                                  .coverMedia!
                                                  .croppedImageVersion!
                                                  .url
                                                  .toString()),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5,left: 8),
                                      child: SizedBox(
                                        width: 60.w,
                                        height: 19.h,
                                        child: Text(
                                          highlightid
                                              .data!.items![position].title
                                              .toString(),
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
                          );
                        } else {
                          return SizedBox();
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.white70,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        Container(
                          width: 500.w,
                          height: 50.h,
                          child: TabBar(
                            indicatorSize: TabBarIndicatorSize.tab,
                            dividerHeight: 0,
                            indicatorColor: Colors.white,
                            labelColor: Colors.white,
                            tabs: [
                              Tab(
                                child: Icon(
                                  Icons.view_module_outlined,
                                  size: 30,
                                ),
                              ),
                              Tab(
                                child: Icon(
                                  Icons.account_box_outlined,
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        SizedBox(
                          height: 650.h,
                          child: TabBarView(children: [
                            BlocBuilder<PostBloc, PostState>(
                              builder: (context, state) {
                                if (state is postBlocLoading) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                if (state is postBlocError) {
                                  return Center(
                                     child: Text("Error"),
                                  );
                                }
                                if (state is postBlocLoaded) {
                                  posts = BlocProvider.of<PostBloc>(context)
                                      .postModels;
                                  return SizedBox(
                                    height: 300.h,
                                    width: 500.w,
                                    child: GridView.count(
                                      physics: NeverScrollableScrollPhysics(),
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 1.0,
                                      mainAxisSpacing: 1.0,
                                      shrinkWrap: true,
                                      children: List.generate(
                                        posts.data!.items!.length,
                                        (index) {
                                          return Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              image: DecorationImage(
                                                image: NetworkImage(posts
                                                    .data!
                                                    .items![index]
                                                    .imageVersions!
                                                    .items![0]
                                                    .url
                                                    .toString()),
                                                fit: BoxFit.cover,
                                              ),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(1),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                } else {
                                  return SizedBox();
                                }
                              },
                            ),
                            BlocBuilder<TagBloc, TagState>(
                              builder: (context, state) {
                                if (state is TagBlocLoading) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                if (state is TagBlocError) {
                                  return Center(
                                    child: Text("Error"),
                                  );
                                }
                                if (state is TagBlocLoaded) {
                                  tagedpost = BlocProvider.of<TagBloc>(context)
                                      .tagModel;
                                  return GridView.count(
                                    physics: NeverScrollableScrollPhysics(),
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 1.0,
                                    mainAxisSpacing: 1.0,
                                    shrinkWrap: true,
                                    children: List.generate(
                                      tagedpost.data!.items!.length,
                                      (index) {
                                        return Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            image: DecorationImage(
                                              image: NetworkImage(
                                              tagedpost.data!.items![index].displayUrl.toString()),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(1),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                } else {
                                  return SizedBox();
                                }
                              },
                            ),
                          ]),
                        )
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }
}
