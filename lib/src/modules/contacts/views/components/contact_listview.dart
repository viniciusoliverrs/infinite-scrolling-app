import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../stores/contact.store.dart';

class ContactListView extends StatelessWidget {
  const ContactListView({
    Key? key,
    required this.store,
    required this.scrollController,
  }) : super(key: key);

  final ContactStore store;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return ListView.builder(
          itemCount: store.contacts.length,
          shrinkWrap: true,
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(store.contacts[index].avatar),
              ),
              title: Text("${index + 1} ${store.contacts[index].name}"),
              trailing: const Icon(Icons.arrow_forward_ios),
            );
          },
        );
      },
    );
  }
}
