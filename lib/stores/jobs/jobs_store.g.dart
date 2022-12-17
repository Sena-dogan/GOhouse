// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jobs_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$JobsStore on _JobsStore, Store {
  late final _$jobsAtom = Atom(name: '_JobsStore.jobs', context: context);

  @override
  ObservableList<Jobs> get jobs {
    _$jobsAtom.reportRead();
    return super.jobs;
  }

  @override
  set jobs(ObservableList<Jobs> value) {
    _$jobsAtom.reportWrite(value, super.jobs, () {
      super.jobs = value;
    });
  }

  late final _$getJobsAsyncAction =
      AsyncAction('_JobsStore.getJobs', context: context);

  @override
  Future<dynamic> getJobs() {
    return _$getJobsAsyncAction.run(() => super.getJobs());
  }

  late final _$_JobsStoreActionController =
      ActionController(name: '_JobsStore', context: context);

  @override
  void addData(JobCreateRequest asd) {
    final _$actionInfo =
        _$_JobsStoreActionController.startAction(name: '_JobsStore.addData');
    try {
      return super.addData(asd);
    } finally {
      _$_JobsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteData(JobDeleteRequest id) {
    final _$actionInfo =
        _$_JobsStoreActionController.startAction(name: '_JobsStore.deleteData');
    try {
      return super.deleteData(id);
    } finally {
      _$_JobsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editData(JobEditRequest id) {
    final _$actionInfo =
        _$_JobsStoreActionController.startAction(name: '_JobsStore.editData');
    try {
      return super.editData(id);
    } finally {
      _$_JobsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
jobs: ${jobs}
    ''';
  }
}
