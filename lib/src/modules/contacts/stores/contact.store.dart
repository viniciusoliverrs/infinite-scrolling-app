import 'package:infinite_scrolling/src/modules/contacts/domain/data/repositories/icontact_repository.dart';
import 'package:mobx/mobx.dart';

import '../domain/entities/contact_entity.dart';
import '../domain/entities/page_response_entity.dart';

part 'contact.store.g.dart';

class ContactStore = _ContactStore with _$ContactStore;

abstract class _ContactStore with Store {
  final IContactRepository repository;
  _ContactStore(this.repository) {
    getContacts();
  }
  @observable
  int skip = 0;
  final int take = 15;
  @observable
  bool isLoading = false;
  @observable
  PageResponseEntity<ContactEntity> pageResponse =
      PageResponseEntity<ContactEntity>(
    perPage: 0,
    totalPages: 0,
    data: [],
    totalItems: 0,
  );

  @observable
  List<ContactEntity> contacts = [];

  @action
  getContacts() async {
    setLoading(true);
    await Future.delayed(const Duration(seconds: 1), () {
      pageResponse = repository.getByPage(skip, take);
      if (pageResponse.data.isNotEmpty) {
        contacts += pageResponse.data;
        skip += take;
      }
    });
    setLoading(false);
  }

  @action
  setLoading(bool value) {
    isLoading = value;
  }
}
