import 'package:infinite_scrolling/src/core/externals/datasources/cache/cache_datasource.dart';
import 'package:infinite_scrolling/src/modules/contacts/data/datasouces/icontact_datasource.dart';
import 'package:infinite_scrolling/src/modules/contacts/domain/entities/page_response_entity.dart';

class ContactDatasource implements IContactDatasource {
  final CacheDatasource cacheDatasource;
  ContactDatasource(this.cacheDatasource);
  @override
  PageResponseEntity<Map<String, dynamic>> getByPage(int skip, int take) {
    return PageResponseEntity<Map<String, dynamic>>(
      data: cacheDatasource.contacts.skip(skip).take(take).toList(),
      totalItems: cacheDatasource.contacts.length,
      perPage: take,
      currentPage: skip ~/ take,
      totalPages: (cacheDatasource.contacts.length / take).ceil(),
    );
  }
}
