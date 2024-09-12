import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram/Bloc/following_bloc.dart';
import 'package:instagram/Repostory/ModelClass/FollowersModel.dart';
import 'package:instagram/Repostory/ModelClass/FollowingModel.dart';
import 'package:instagram/UI/page3.dart';

import '../Bloc/followers_bloc.dart';

class Screen2 extends StatefulWidget {
  final String followerid;
  final String followingid;
  final int index;

  const Screen2(
      {super.key, required this.followerid, required this.followingid,required this.index});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  late FollowersModel last;
  late FollowingModel lasted;

  @override
  void initState() {
    BlocProvider.of<FollowersBloc>(context)
        .add(FetchFollowersEvent(followerid: widget.followerid));
    BlocProvider.of<FollowingBloc>(context)
        .add(FetchFollowingEvent(followingid: widget.followingid));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
        appBar: AppBar(backgroundColor: Colors.
          black,
          title: Text("All  followers",
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.w500,
              ))),
        ),
        body: SafeArea(
          child: DefaultTabController(initialIndex: widget.index,
            length: 2,
            child: Column(
              children: [
                Container(
                  width: 500.w,
                  height: 50.h,
                  color: Colors.black,
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerHeight: 1,
                    indicatorColor: Colors.white,
                    labelColor: Colors.black,
                    tabs: [
                      Tab(
                          child: Text(
                        "Followers",
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 23.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )),
                      Tab(
                          child: Text(
                        "Following",
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 23.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 20),
                        child: BlocBuilder<FollowersBloc, FollowersState>(
                          builder: (context, state) {
                            if (state is FollowersBlocLoading) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            if (state is FollowersBlocError) {
                              return Center(
                                child: Text("Error"),
                              );
                            }
                            if (state is FollowersBlocLoaded) {
                              last = BlocProvider.of<FollowersBloc>(context)
                                  .followersModel;

                              return ListView.separated(
                                  itemCount: last.data!.items!.length,
                                  itemBuilder: (context, position) {
                                    return GestureDetector(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Screen3(dp:  last.data!.items![position]
                                        .username
                                        .toString(),)));},
                                      child: Container(
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 30.r,
                                              backgroundImage: NetworkImage(last
                                                  .data!
                                                  .items![position]
                                                  .profilePicUrl
                                                  .toString()),
                                            ),
                                            SizedBox(
                                              width: 20.w,
                                            ),
                                            SizedBox(
                                              width: 150.w,height: 20.h,
                                              child: Text(
                                                last.data!.items![position]
                                                    .fullName
                                                    .toString(),
                                                style: GoogleFonts.lato(
                                                    textStyle: TextStyle(
                                                      color: Colors.white,
                                                  fontSize: 17.sp,
                                                  fontWeight: FontWeight.w500,
                                                )),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, position) {
                                    return SizedBox(
                                      height: 10.h,
                                    );
                                  });
                            } else {
                              return SizedBox();
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 20),
                        child: BlocBuilder<FollowingBloc, FollowingState>(
                          builder: (context, state) {
                            if (state is FollowingBlocLoading) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            if (state is FollowingBlocError) {
                              return Center(
                                child: Text("Error"),
                              );
                            }
                            if (state is FollowingBlocLoaded) {
                              lasted = BlocProvider.of<FollowingBloc>(context)
                                  .followingModel;

                              return ListView.separated(
                                  itemCount: lasted.data!.items!.length,
                                  itemBuilder: (context, position) {
                                    return GestureDetector(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Screen3(dp:  last.data!.items![position]
                                        .username
                                        .toString(),)));},
                                      child: Container(
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                                radius: 30.r,
                                                backgroundImage: NetworkImage(
                                                    lasted.data!.items![position]
                                                        .profilePicUrl
                                                        .toString())),
                                            SizedBox(
                                              width: 20.w,
                                            ),
                                            SizedBox( width: 150.w,height: 20.h,
                                              child: Text(
                                                lasted
                                                    .data!.items![position].fullName
                                                    .toString(),
                                                style: GoogleFonts.lato(
                                                    textStyle: TextStyle(
                                                      color: Colors.white,
                                                  fontSize: 17.sp,
                                                  fontWeight: FontWeight.w500,
                                                )),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, position) {
                                    return SizedBox(
                                      height: 10.h,
                                    );
                                  });
                            } else {
                              return SizedBox();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
