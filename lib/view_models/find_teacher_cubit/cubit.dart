import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/models/services_model.dart';
import 'package:movies_app/view_models/find_teacher_cubit/states.dart';

class FindTeachersCubit extends Cubit<FindTeachersStates> {
  FindTeachersCubit() : super(FindTeachersStates());

  static FindTeachersCubit get(context) => BlocProvider.of(context);

  // method for handling find teachers data

  List<ServicesModel>? allTeachersServices = [];

  void getAllTeacherData({required String key}) {
    allTeachersServices = [];
    emit(GetAllTeacherLoadingState());

    FirebaseFirestore.instance.collection('services').where('field', isEqualTo: key).get().then((value) {
      value.docs.forEach((element) {
        allTeachersServices!.add(ServicesModel.fromJson(element.data()));
      });
      emit(GetAllTeacherSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetAllTeacherErrorState(error: error.toString()));
    });
  }
}