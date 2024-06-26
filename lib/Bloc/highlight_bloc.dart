import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../Repostory/Api/api_highlight.dart';
import '../Repostory/ModelClass/highlightModel.dart';

part 'highlight_event.dart';
part 'highlight_state.dart';

class HighlightBloc extends Bloc<HighlightEvent, HighlightState> {
  late HighlightModel highlightModel;
  HighlightApi highlightapi = HighlightApi();
  HighlightBloc() : super(HighlightInitial()) {
    on<FetchHighlightEvent>((event, emit) async{
      emit (HighlightBlocLoading());
      try{
        highlightModel  = await highlightapi.gethighlight(event.Highlights);
        emit (HighlightBlocLoaded());
      }
          catch(b){ emit(HighlightBlocError());}
      // TODO: implement event handler
    });
  }
}
