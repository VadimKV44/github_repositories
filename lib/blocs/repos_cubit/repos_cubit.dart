import 'package:bloc/bloc.dart';
import 'package:github_repositories/api_repositury/data_models/repository_model.dart';
import 'package:github_repositories/api_repositury/repository.dart';
import 'package:meta/meta.dart';

part 'repos_state.dart';

class ReposCubit extends Cubit<ReposState> {
  ReposCubit() : super(ReposInitial());

  Repository repository = Repository();

  List<RepositoryModel>? repositories;

  List<RepositoryModel>? filterRepositories;

  void getRepositories(String name) async {
    emit(ReposLoading());
    repositories = await repository.getRepos(name);
    if (repositories == null) {
      emit(ReposError());
    } else {
      filterRepositories = repositories;
      emit(ReposSuccess());
    }
  }

  void search(String text) {
    if (text.isNotEmpty) {
      filterRepositories = repositories!.where((RepositoryModel data) {
        return data.name!.toLowerCase().contains(text.toLowerCase());
      }).toList();
    } else {
      filterRepositories = repositories;
    }
    emit(ReposSuccess());
  }
}
