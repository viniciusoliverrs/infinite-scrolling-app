class ContactEntity {
  final String name;
  final String avatar;

  ContactEntity({
    required this.name,
    required this.avatar,
  });

  ContactEntity copyWith({
    String? name,
    String? avatar,
  }) {
    return ContactEntity(
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
    );
  }
}
