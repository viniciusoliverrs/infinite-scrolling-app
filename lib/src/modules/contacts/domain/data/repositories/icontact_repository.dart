import 'package:infinite_scrolling/src/modules/contacts/domain/entities/contact_entity.dart';

import '../../entities/page_response_entity.dart';

abstract class IContactRepository {
  PageResponseEntity<ContactEntity> getByPage(int skip, int take);
}
