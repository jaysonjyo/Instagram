import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../Repostory/Api/api_post.dart';
import '../Repostory/ModelClass/PostModels.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  late PostModels postModels;
  PostApi postApi =PostApi();
  PostBloc() : super(PostInitial()) {
    on<FetchpostEvent>((event, emit) async{
      emit (postBlocLoading());
      try{
        postModels = await postApi.getpost(event.post);
        emit(postBlocLoaded());
      }
      catch(a){
        emit(postBlocError());
      }
      // TODO: implement event handler
    });
  }
}
