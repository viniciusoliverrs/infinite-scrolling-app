import 'package:infinite_scrolling/src/modules/contacts/domain/entities/contact_entity.dart';

class ContactDto {
  static ContactEntity fromMap(Map<String, dynamic> map) {
    return ContactEntity(
      name: map['name'],
      avatar: map['avatar'],
    );
  }
}