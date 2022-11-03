import '../../domain/entities/page_response_entity.dart';

abstract class IContactDatasource {
  PageResponseEntity<Map<String, dynamic>> getByPage(int skip, int take);
}
