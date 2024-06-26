import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../Repostory/Api/api_main.dart';
import '../Repostory/ModelClass/InstagramModel.dart';

part 'insta_event.dart';
part 'insta_state.dart';

class InstaBloc extends Bloc<InstaEvent, InstaState> {
  late InstagramModel instagramModel;
  InstaApi instaApi= InstaApi();
  InstaBloc() : super(InstaInitial()) {
    on<FetchInstaEvent>((event, emit) async{
      emit (InstaBlocLoading());
      try{
        instagramModel = await instaApi.getInstagram(event.id);
        emit(InstaBlocLoaded());
      }
          catch(a){
        emit(InstaBlocError());
          }
      // TODO: implement event handler
    });
  }
}
