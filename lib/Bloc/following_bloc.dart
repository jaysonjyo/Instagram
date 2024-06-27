import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../Repostory/Api/api_Following.dart';
import '../Repostory/ModelClass/FollowingModel.dart';

part 'following_event.dart';
part 'following_state.dart';

class FollowingBloc extends Bloc<FollowingEvent, FollowingState> {
  late FollowingModel followingModel;
  FollowingApi followingApi=FollowingApi();
  FollowingBloc() : super(FollowingInitial()) {
    on<FetchFollowingEvent>((event, emit) async{
      emit( FollowingBlocLoading());
      try{
        followingModel =await followingApi.getFollowing(event.followingid);
        emit(FollowingBlocLoaded());
      }

      catch(bbbb){emit(FollowingBlocError());

      }
      // TODO: implement event handler
    });
  }
}
