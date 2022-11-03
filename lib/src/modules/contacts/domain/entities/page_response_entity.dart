class PageResponseEntity<T> {
  int currentPage;
  int perPage;
  int totalPages;
  int totalItems;
  List<T> data;

  PageResponseEntity({
    this.currentPage = 1,
    required this.perPage,
    required this.totalPages,
    required this.totalItems,
    required this.data,
  });

  PageResponseEntity<T> copyWith({
    int? currentPage,
    int? perPage,
    int? totalPages,
    List<T>? data,
    int? totalItems,
  }) {
    return PageResponseEntity<T>(
      currentPage: currentPage ?? this.currentPage,
      perPage: perPage ?? this.perPage,
      totalPages: totalPages ?? this.totalPages,
      data: data ?? this.data,
      totalItems: totalItems ?? this.totalItems,
    );
  }
}
