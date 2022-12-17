// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:gohouse/data/network/apis/posts/post_api.dart';
// import 'package:gohouse/data/repository.dart';
// import 'package:gohouse/models/jobs.dart';
// import 'package:mobx/mobx.dart';

// part 'user_store.g.dart';

// class UserStore = _UserStore with _$UserStore;

// abstract class _UserStore with Store {
//   static ObservableFuture<JobListResponse?> emptyJobsResponse =
//       ObservableFuture.value(null);
//   static ObservableFuture<JobListResponse?> emptyJobsWithUserResponse =
//       ObservableFuture.value(null);

//   @observable
//   ObservableFuture<JobListResponse?> fetchJobsFuture =
//       ObservableFuture<JobListResponse?>(emptyJobsResponse);

//   @observable
//   ObservableFuture<JobListResponse?> fetchJobsWithUserFuture =
//       ObservableFuture<JobListResponse?>(emptyJobsWithUserResponse);

//   final Repository _repository;

//   _UserStore(Repository repository) : this._repository = repository {
//     init();
//   }

//   void init() {}

//   @observable
//   ObservableList<User> user = ObservableList<User>();

//   @computed
//   bool get loading => fetchJobsFuture.status == FutureStatus.pending;

//   @computed
//   bool get loadingMyService =>
//       fetchJobsWithUserFuture.status == FutureStatus.pending;

//   @action
//   Future getJobs() async {
//     try {
//       jobs.clear();
//       final future = _repository.getJobs();
//       fetchJobsFuture = ObservableFuture(future);
//       fetchJobsFuture.then((jobResponse) {
//         jobResponse?.jobs?.forEach((element) {
//           jobs.add(element);
//           print(element.name);
//         });
//       });
//     } catch (e) {
//       print(e);
//     }
//   }

//   @action
//   void addData(JobCreateRequest asd) {
//     // jobs.add(Jobs(name: "test"));
//     _repository.createJobs(asd).then((value) => getJobs());
//   }

//   // delete data by id
//   @action
//   void deleteData(JobDeleteRequest id) {
//     _repository.deleteJobById(id).then((value) => getJobs());
//   }

//   // edit data by id
//   @action
//   void editData(JobEditRequest id) {
//     _repository.editJobById(id).then((value) => getJobs());
//   }

//   // get job by user
//   @action
//   Future getJobsByUser() async {
//     try {
//       jobs.clear();
//       final future =
//           _repository.getJobByUserId(JobGetByUserRequest(user: user!.email));
//       fetchJobsWithUserFuture = ObservableFuture(future);
//       fetchJobsWithUserFuture.then((jobResponse) {
//         jobResponse?.jobs?.forEach((element) {
//           jobs.add(element);
//           print(element.name);
//         });
//       });
//     } catch (e) {
//       print(e);
//     }
//   }
// }
