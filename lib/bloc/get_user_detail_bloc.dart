import 'package:rxdart/rxdart.dart';
import 'package:udemy_clone/model/user_detail.dart';
import 'package:udemy_clone/repository/repository.dart';

class UserDetailBloc {
  MainRepository _mainRepository = MainRepository();
  BehaviorSubject<UserDetails> _subject = BehaviorSubject<UserDetails>();

  getUserDetails(String token) async {
    UserDetails response = await _mainRepository.getUserDetails(token);
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<UserDetails> get subject => _subject;
}

var userDetailBloc = UserDetailBloc();
