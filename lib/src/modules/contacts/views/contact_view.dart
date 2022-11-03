import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:infinite_scrolling/src/core/externals/datasources/cache/cache_datasource.dart';
import 'package:provider/provider.dart';

import '../stores/contact.store.dart';
import 'components/contact_listview.dart';

class ContactView extends StatefulWidget {
  const ContactView({super.key});

  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  late final ContactStore store;
  late final ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  _initialize() async {
    store = Provider.of<ContactStore>(context, listen: false);
    Provider.of<CacheDatasource>(context, listen: false);
    scrollController = ScrollController();
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        await store.getContacts();
      }
      // else if (scrollController.position.pixels ==
      //     scrollController.position.minScrollExtent) {
      //   store.beforePage();
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Infinite Scrolling',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: ContactListView(
            scrollController: scrollController,
            store: store,
          )),
          Observer(
            builder: (_) {
              return store.isLoading
                  ? const CircularProgressIndicator()
                  : const SizedBox.shrink();
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Observer(
          builder: (_) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Total Pages: ${store.pageResponse.totalPages}',
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  'Current: ${store.pageResponse.currentPage}',
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  'Per: ${store.pageResponse.perPage}',
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  'Items: ${store.pageResponse.totalItems}',
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
