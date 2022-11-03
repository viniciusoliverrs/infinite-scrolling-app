import 'package:infinite_scrolling/src/modules/contacts/data/datasouces/icontact_datasource.dart';
import 'package:infinite_scrolling/src/modules/contacts/data/dto/contact_dto.dart';
import 'package:infinite_scrolling/src/modules/contacts/domain/data/repositories/icontact_repository.dart';
import 'package:infinite_scrolling/src/modules/contacts/domain/entities/contact_entity.dart';
import 'package:infinite_scrolling/src/modules/contacts/domain/entities/page_response_entity.dart';

class ContactRepository extends IContactRepository {
  final IContactDatasource datasource;

  ContactRepository(this.datasource);
  @override
  PageResponseEntity<ContactEntity> getByPage(int skip, int take) {
    var response = datasource.getByPage(skip, take);
    return PageResponseEntity<ContactEntity>(
      data: response.data.map((e) => ContactDto.fromMap(e)).toList(),
      totalItems: response.totalItems,
      perPage: response.perPage,
      currentPage: response.currentPage,
      totalPages: response.totalPages,
    );
  }
}
