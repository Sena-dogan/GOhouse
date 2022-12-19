// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on _UserStore, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??=
          Computed<bool>(() => super.loading, name: '_UserStore.loading'))
      .value;

  late final _$fetchUserFutureAtom =
      Atom(name: '_UserStore.fetchUserFuture', context: context);

  @override
  ObservableFuture<UserData?> get fetchUserFuture {
    _$fetchUserFutureAtom.reportRead();
    return super.fetchUserFuture;
  }

  @override
  set fetchUserFuture(ObservableFuture<UserData?> value) {
    _$fetchUserFutureAtom.reportWrite(value, super.fetchUserFuture, () {
      super.fetchUserFuture = value;
    });
  }

  late final _$userdataAtom =
      Atom(name: '_UserStore.userdata', context: context);

  @override
  UserData? get userdata {
    _$userdataAtom.reportRead();
    return super.userdata;
  }

  @override
  set userdata(UserData? value) {
    _$userdataAtom.reportWrite(value, super.userdata, () {
      super.userdata = value;
    });
  }

  late final _$getUserDataAsyncAction =
      AsyncAction('_UserStore.getUserData', context: context);

  @override
  Future<dynamic> getUserData(String email) {
    return _$getUserDataAsyncAction.run(() => super.getUserData(email));
  }

  late final _$_UserStoreActionController =
      ActionController(name: '_UserStore', context: context);

  @override
  void editData(EditUserRequest id) {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.editData');
    try {
      return super.editData(id);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fetchUserFuture: ${fetchUserFuture},
userdata: ${userdata},
loading: ${loading}
    ''';
  }
}
