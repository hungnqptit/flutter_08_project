import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
// {
//           "id": 106,
//           "name": "Sakamoto Days (FULL HD)",
//           "cover_url": "https://storage-ct.lrclib.net/file/cuutruyen/uploads/manga/106/cover/processed-b04ed54eaab7559840abc7c9a42d40aa.jpg",
//           "cover_mobile_url": "https://storage-ct.lrclib.net/file/cuutruyen/uploads/manga/106/cover/processed_mobile-093e4dfbcfeb1b7dd0c6a15f1eadac53.jpg",
//           "newest_chapter_number": "156",
//           "newest_chapter_id": 32200,
//           "newest_chapter_created_at": "2024-02-26T00:23:37.471+07:00",
//           "views_count": 5819022,
//           "views_count_week": 33822,
//           "views_count_month": 139416
//       },

class GetTopMangaResponse {
  List<MangaItem?>? data;
  MetaData? metadata;
  GetTopMangaResponse({
    this.data,
    this.metadata,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data?.map((x) => x?.toMap()).toList(),
      'metadata': metadata?.toMap(),
    };
  }

  factory GetTopMangaResponse.fromMap(Map<String, dynamic> map) {
    return GetTopMangaResponse(
      data: map['data'] != null
          ? List<MangaItem?>.from(
              (map['data'] as List<dynamic>).map<MangaItem?>(
                (x) => MangaItem?.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      metadata: map['_metadata'] != null
          ? MetaData.fromMap(map['_metadata'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetTopMangaResponse.fromJson(String source) =>
      GetTopMangaResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}

class MetaData {
  int? totalCount;
  int? totalPages;
  int? currentPage;
  int? perPage;

  MetaData({
    this.totalCount,
    this.totalPages,
    this.currentPage,
    this.perPage,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'totalCount': totalCount,
      'totalPages': totalPages,
      'currentPage': currentPage,
      'perPage': perPage,
    };
  }

  factory MetaData.fromMap(Map<String, dynamic> map) {
    return MetaData(
      totalCount: map['total_count'] != null ? map['total_count'] as int : null,
      totalPages: map['total_pages'] != null ? map['total_pages'] as int : null,
      currentPage:
          map['current_page'] != null ? map['current_page'] as int : null,
      perPage: map['per_page'] != null ? map['per_page'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MetaData.fromJson(String source) =>
      MetaData.fromMap(json.decode(source) as Map<String, dynamic>);
}

class MangaItem {
  int? id;
  String? name;
  String? coverUrl;
  String? coverMobileUrl;
  String? newestChapterNumber;
  int? newestChapterId;
  int? viewsCount;

  MangaItem({
    this.id,
    this.name,
    this.coverUrl,
    this.coverMobileUrl,
    this.newestChapterNumber,
    this.newestChapterId,
    this.viewsCount,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'coverUrl': coverUrl,
      'coverMobileUrl': coverMobileUrl,
      'newestChapterNumber': newestChapterNumber,
      'newestChapterId': newestChapterId,
      'viewsCount': viewsCount,
    };
  }

  factory MangaItem.fromMap(Map<String, dynamic> map) {
    return MangaItem(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      coverUrl: map['cover_url'] != null ? map['cover_url'] as String : null,
      coverMobileUrl: map['cover_mobile_url'] != null
          ? map['cover_mobile_url'] as String
          : null,
      newestChapterNumber: map['newest_chapter_number'] != null
          ? map['newest_chapter_number'] as String
          : null,
      newestChapterId: map['newest_chapter_id'] != null
          ? map['newest_chapter_id'] as int
          : null,
      viewsCount: map['views_count'] != null ? map['views_count'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MangaItem.fromJson(String source) =>
      MangaItem.fromMap(json.decode(source) as Map<String, dynamic>);
}
