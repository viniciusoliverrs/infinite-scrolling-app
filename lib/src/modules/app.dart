import 'package:flutter/material.dart';
import 'package:infinite_scrolling/src/core/externals/datasources/cache/cache_datasource.dart';
import 'package:infinite_scrolling/src/modules/contacts/data/datasouces/icontact_datasource.dart';
import 'package:infinite_scrolling/src/modules/contacts/data/repositories/contact_repository.dart';
import 'package:infinite_scrolling/src/modules/contacts/domain/data/repositories/icontact_repository.dart';
import 'package:infinite_scrolling/src/modules/contacts/externals/datasources/contact_datasource.dart';
import 'package:infinite_scrolling/src/modules/contacts/stores/contact.store.dart';
import 'package:infinite_scrolling/src/modules/contacts/views/contact_view.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CacheDatasource>(
          create: (_) => CacheDatasource(),
        ),
        Provider<IContactDatasource>(
          create: (context) => ContactDatasource(context.read()),
        ),
        Provider<IContactRepository>(
          create: (context) => ContactRepository(context.read()),
        ),
        Provider<ContactStore>(
          create: (context) => ContactStore(context.read()),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Infinite Scrolling',
        home: ContactView()
      ),
    );
  }
}
