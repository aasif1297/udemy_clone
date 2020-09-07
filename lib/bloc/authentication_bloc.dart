import 'package:rxdart/rxdart.dart';
import 'package:udemy_clone/model/login_response.dart';
import 'package:udemy_clone/repository/user_repository.dart';

class AuthenticationBloc {
  UserRepository _userRepository = UserRepository();
  BehaviorSubject<LoginResponse> _subject = BehaviorSubject<LoginResponse>();

  login(String email, String password) async {
    LoginResponse response =
        await _userRepository.login(email: email, password: password);
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<LoginResponse> get subject => _subject;
}

final authBloc = AuthenticationBloc();
