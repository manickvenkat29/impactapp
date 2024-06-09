import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:impactapp/data/models/user_model.dart';
import 'package:impactapp/data/repositories/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  int currentPage = 1;
  bool isFetching = false;
  List<UserModel> allUsers = [];

  UserBloc(this.userRepository) : super(UserInitial()) {
    on<FetchUsers>(_onFetchUsers);
    on<FetchUserDetail>(_onFetchUserDetail);
  }

  void _onFetchUsers(FetchUsers event, Emitter<UserState> emit) async {
    if (isFetching) return;
    isFetching = true;

    try {
      final users = await userRepository.fetchUsers(currentPage);
      currentPage++;
      allUsers.addAll(users);
      emit(UserLoaded(users: List.from(allUsers)));
    } catch (e) {
      emit(UserError(message: e.toString()));
    }

    isFetching = false;
  }

  void _onFetchUserDetail(FetchUserDetail event, Emitter<UserState> emit) async {
    try {
      final user = await userRepository.fetchUser(event.userId);
      emit(UserDetailLoaded(user: user));
    } catch (e) {
      emit(UserError(message: e.toString()));
    }
  }
}
