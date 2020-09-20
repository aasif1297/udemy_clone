import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:udemy_clone/model/sections.dart';
import 'package:udemy_clone/repository/repository.dart';

class AllSectionsBloc {
  MainRepository _mainRepository = MainRepository();
  BehaviorSubject<List<Sections>> _subject = BehaviorSubject<List<Sections>>();

  getAllSections(String id, String token) async {
    List<Sections> response = await _mainRepository.getAllSections(token, id);
    _subject.sink.add(response);
  }

  void dainStream() {
    _subject.value = null;
  }

  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<List<Sections>> get subject => _subject;
}

var allSectionsBloc = AllSectionsBloc();
