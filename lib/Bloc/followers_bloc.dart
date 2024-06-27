import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../Repostory/Api/api_Followers.dart';
import '../Repostory/ModelClass/FollowersModel.dart';

part 'followers_event.dart';
part 'followers_state.dart';

class FollowersBloc extends Bloc<FollowersEvent, FollowersState> {
  late FollowersModel followersModel;
  FolloweresApi followeresApi=FolloweresApi();
  FollowersBloc() : super(FollowersInitial()) {
    on<FetchFollowersEvent>((event, emit)  async{
      emit(FollowersBlocLoading());
      try{
        followersModel =await followeresApi.getFollowers(event .followerid);
        emit(FollowersBlocLoaded());
      }
          catch(aaaa){emit(FollowersBlocError());}
      // TODO: implement event handler
    });
  }
}
