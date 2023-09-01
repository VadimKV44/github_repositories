import 'package:bloc/bloc.dart';
import 'package:github_repositories/api_repositury/data_models/user_models.dart';
import 'package:github_repositories/api_repositury/repository.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  Repository repository = Repository();

  UserModel? user;

  void getUser(String name) async {
    emit(UserLoading());
    user = await repository.getUser(name);
    if ((user?.error ?? '').isNotEmpty || (user?.message ?? '').isNotEmpty) {
      emit(UserError());
    } else {
      emit(UserSuccess());
    }
  }
}
