import 'package:faker/faker.dart';

class CacheDatasource {
  List<Map<String, dynamic>> contacts = [];
  CacheDatasource() {
    if (contacts.isEmpty) {
      contacts = generateCache();
    } else {
      throw Exception('Cache already initialized');
    }
  }
  List<Map<String, dynamic>> generateCache() {
    return List.generate(55, (index) {
      return {
        'name': Faker().person.name(),
        'avatar': Faker().image.image(random: true),
      };
    });
  }
}
