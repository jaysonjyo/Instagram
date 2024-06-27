import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../Repostory/Api/api_Tag.dart';
import '../Repostory/ModelClass/TagModel.dart';

part 'tag_event.dart';
part 'tag_state.dart';

class TagBloc extends Bloc<TagEvent, TagState> {
  late TagModel tagModel;
  TagApi tagApi=TagApi();
  TagBloc() : super(TagInitial()) {
    on<FetchTagEvent>((event, emit)async{
    emit(TagBlocLoading());
      try{
        tagModel = await tagApi.getTag(event.tag);
        emit(TagBlocLoaded());
      }
          catch(ddd){emit(TagBlocError());}
      // TODO: implement event handler
    });
  }
}
