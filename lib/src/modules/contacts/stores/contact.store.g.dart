// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ContactStore on _ContactStore, Store {
  late final _$skipAtom = Atom(name: '_ContactStore.skip', context: context);

  @override
  int get skip {
    _$skipAtom.reportRead();
    return super.skip;
  }

  @override
  set skip(int value) {
    _$skipAtom.reportWrite(value, super.skip, () {
      super.skip = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_ContactStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$pageResponseAtom =
      Atom(name: '_ContactStore.pageResponse', context: context);

  @override
  PageResponseEntity<ContactEntity> get pageResponse {
    _$pageResponseAtom.reportRead();
    return super.pageResponse;
  }

  @override
  set pageResponse(PageResponseEntity<ContactEntity> value) {
    _$pageResponseAtom.reportWrite(value, super.pageResponse, () {
      super.pageResponse = value;
    });
  }

  late final _$contactsAtom =
      Atom(name: '_ContactStore.contacts', context: context);

  @override
  List<ContactEntity> get contacts {
    _$contactsAtom.reportRead();
    return super.contacts;
  }

  @override
  set contacts(List<ContactEntity> value) {
    _$contactsAtom.reportWrite(value, super.contacts, () {
      super.contacts = value;
    });
  }

  late final _$getContactsAsyncAction =
      AsyncAction('_ContactStore.getContacts', context: context);

  @override
  Future getContacts() {
    return _$getContactsAsyncAction.run(() => super.getContacts());
  }

  late final _$_ContactStoreActionController =
      ActionController(name: '_ContactStore', context: context);

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$_ContactStoreActionController.startAction(
        name: '_ContactStore.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_ContactStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
skip: ${skip},
isLoading: ${isLoading},
pageResponse: ${pageResponse},
contacts: ${contacts}
    ''';
  }
}
