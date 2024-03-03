import 'package:flutter_08_project/models/get_top_manga_response.dart';
import 'package:flutter_08_project/network/configs/data_state.dart';
import 'package:flutter_08_project/network/repositories/home_repository.dart';
import 'package:get/get.dart';

enum GetTopMangaStatus {
  initial,
  isLoading,
  loaded,
  failed,
  loadmore,
}

class HomeController extends GetxController {
  final listMangaItem = <MangaItem?>[].obs;
  final getTopMangaStatus = GetTopMangaStatus.initial.obs;
  final currentPage = 0.obs;

  void getTopMangaResponse() async {
    currentPage.value++;
    if (currentPage.value != 1) {
      getTopMangaStatus.value = GetTopMangaStatus.loadmore;
    } else {
      getTopMangaStatus.value = GetTopMangaStatus.isLoading;
    }

    final getTopMangaResponse = await HomeRepository().getTopManga(
      page: currentPage.value,
    );

    if (getTopMangaResponse is DataSuccess) {
      listMangaItem.addAll(getTopMangaResponse.data?.data ?? []);
      getTopMangaStatus.value = GetTopMangaStatus.loaded;
    }
    if (getTopMangaResponse is DataFailed) {
      getTopMangaStatus.value = GetTopMangaStatus.failed;
    }
  }
}
