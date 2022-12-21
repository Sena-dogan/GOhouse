import 'package:firebase_auth/firebase_auth.dart';
import 'package:gohouse/constants/assets.dart';
import 'package:gohouse/data/repository.dart';
import 'package:gohouse/models/jobs.dart';
import 'package:gohouse/models/user.dart';
import 'package:mobx/mobx.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  static ObservableFuture<UserData?> emptyUserResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<UserData?> fetchUserFuture =
      ObservableFuture<UserData?>(emptyUserResponse);

  final Repository _repository;
  // final user = FirebaseAuth.instance.currentUser;

  _UserStore(Repository repository) : this._repository = repository {
    init();
  }

  void init() {
    if (FirebaseAuth.instance.currentUser != null)
      getUserData(FirebaseAuth.instance.currentUser!.email.toString());
  }

  final firebaseUser = FirebaseAuth.instance.currentUser;

  // @observable user data not list
  @observable
  UserData? userdata;

  @computed
  bool get loading => fetchUserFuture.status == FutureStatus.pending;

  // get user data by email
  @action
  Future getUserData(String email) async {
    try {
      final future = _repository.getUserById(GetUserRequest(email: email));
      fetchUserFuture = ObservableFuture(future);
      fetchUserFuture.then((userResponse) {
        userdata = userResponse!;
        Assets.userImageLink = userdata!.user!.image!;
        print(userResponse);
      });
    } catch (e) {
      print(e);
    }
  }

  // edit data by id
  @action
  void editData(EditUserRequest id) {
    _repository
        .editUserById(id)
        .then((value) => getUserData(id.email.toString()));
  }
}


  // @action
  // Future getJobs() async {
  //   try {
  //     jobs.clear();
  //     final jobResponse = await _repository.getJobs();
  //     jobResponse.jobs?.forEach((element) {
  //       jobs.add(element);
  //       print(element.name);
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }