import 'package:bloc/bloc.dart';
import 'package:github_repositories/api_repositury/data_models/all_users_model.dart';
import 'package:github_repositories/api_repositury/repository.dart';
import 'package:meta/meta.dart';

part 'all_users_state.dart';

class AllUsersCubit extends Cubit<AllUsersState> {
  AllUsersCubit() : super(AllUsersInitial());

  Repository repository = Repository();

  List<AllUsersModel>? allUsers;

  void getAllUsers() async {
    emit(AllUsersLoading());
    allUsers = await repository.getAllUsers();
    if (allUsers == null) {
      emit(AllUsersError());
    } else {
      emit(AllUsersSuccess());
    }
  }
}
