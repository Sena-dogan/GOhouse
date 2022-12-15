import 'package:gohouse/data/network/apis/posts/post_api.dart';
import 'package:gohouse/data/repository.dart';
import 'package:mobx/mobx.dart';

part 'jobs_store.g.dart';

class JobsStore = _JobsStore with _$JobsStore;

abstract class _JobsStore with Store {
  final Repository _repository;

  _JobsStore(Repository repository) : this._repository = repository {
    init();
  }

  void init() {}

  @observable
  ObservableList<Jobs> jobs = ObservableList<Jobs>();

  @action
  Future getJobs() async {
    try {
      jobs.clear();
      final jobResponse = await _repository.getJobs();
      jobResponse.jobs?.forEach((element) {
        jobs.add(element);
        print(element.name);
      });
    } catch (e) {
      print(e);
    }
  }

  @action
  void addData() {
    // jobs.add(Jobs(name: "test"));
    _repository
        .createJobs(
          JobCreateRequest(
            name: "fasfaf",
            description: "test",
            user: "N9rNM4s5obOo4v1soqHb3AhldUq1",
            category: "test",
            price: "400",
            image: "bosluk",
          ),
        )
        .then((value) => getJobs());
  }
}
