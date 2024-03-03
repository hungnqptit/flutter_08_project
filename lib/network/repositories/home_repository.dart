import 'package:flutter_08_project/models/get_top_manga_response.dart';
import 'package:flutter_08_project/network/apis/home_api.dart';
import 'package:flutter_08_project/network/configs/data_state.dart';

class HomeRepository {
  Future<DataState<GetTopMangaResponse?>> getTopManga({
    int page = 1,
    int perPage = 10,
  }) async {
    final responseFromApi = await HomeApi().getTopManga(
      perPage: perPage,
      page: page,
    );

    if (responseFromApi != null) {
      return DataSuccess(data: responseFromApi);
    } else {
      return DataFailed(data: responseFromApi);
    }
  }
}
