import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/models/message_model.dart';
import 'package:movies_app/models/services_model.dart';
import 'package:movies_app/models/teacher_model.dart';
import 'package:movies_app/models/user_model.dart';
import 'package:movies_app/view_models/Services_cubit/states.dart';

class ServicesCubit extends Cubit<ServicesStates> {
  ServicesCubit() : super(ServicesStates());

  static ServicesCubit get(context) => BlocProvider.of(context);

  // method for handling get teacher data

  TeacherModel? teacherModel;

  void getTeacherData() {
    emit(GetTeacherLoadingState());

    FirebaseFirestore.instance.collection('teachers').doc(uId).get().then((value) {
      teacherModel = TeacherModel.fromJson(value.data()!);
      emit(GetTeacherSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetTeacherErrorState(error: error.toString()));
    });
  }

  // method for uploading new services

  void uploadService(ServicesModel model) {
    emit(AddServiceLoadingState());

    FirebaseFirestore.instance.collection("services").add(model.toMap()).then((value) {
      getService();
      emit(AddServiceSuccessState());
    }).catchError((error) {
      emit(AddServiceErrorState(error: error.toString()));
    });
  }

  // method for getting teacher services

  List<ServicesModel>? teacherServices = [];

  void getService() {
    teacherServices = [];
    emit(GetServiceLoadingState());
    FirebaseFirestore.instance.collection("services").where('uid', isEqualTo: uId).get().then((value) {
      value.docs.forEach((element) {
        teacherServices!.add(ServicesModel.fromJson(element.data()));
      });
      emit(GetServiceSuccessState());
    }).catchError((error) {
      emit(GetServiceErrorState(error: error.toString()));
    });
  }

  // methods handling editing the user profile

  File? profileImage;
  var picker = ImagePicker();

  Future<void> getProfileImage() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(TeacherImagePickedSuccessState());
    } else {
      print('No image selected.');
      emit(TeacherImagePickedErrorState());
    }
  }

  void uploadProfileImage({
    required String name,
    required String phone,
    required String email,
  }) async{
    emit(TeacherUpdateLoadingState());
    await getProfileImage();
    FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        //emit(SocialUploadProfileImageSuccessState());
        print(value);
        updateTeacher(
          name: name,
          phone: phone,
          image: value,
          email: email,
        );
      }).catchError((error) {
        emit(UploadTeacherProfileImageErrorState());
      });
    }).catchError((error) {
      emit(UploadTeacherProfileImageErrorState());
    });
  }

  void updateTeacher({
    required String name,
    required String phone,
    required String email,
    String? image,
  }) {
    TeacherModel model = TeacherModel(
      name: name,
      phone: phone,
      email: email,
      image: image ?? teacherModel!.image,
      uid: teacherModel!.uid,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(teacherModel!.uid)
        .update(model.toMap())
        .then((value) {
      getTeacherData();
    }).catchError((error) {
      emit(TeacherUpdateErrorState());
    });
  }

  // method for getting old chats

  List<LogInModel>? chatList = [];

  void getChats() {
    chatList = [];
    emit(GetChatDataLoadingState());
    FirebaseFirestore.instance.collection('chatRooms').where('receiverId', isEqualTo: uId).get().then((value) {
      value.docs.forEach((element) {
        var id = element.data()['senderId'];
        print(id);
        FirebaseFirestore.instance.collection("users").doc(id).get().then((value) {
          print(value.data());
          chatList!.add(LogInModel.fromJson(value.data()!));
        });
      });
      emit(GetChatDataSuccessState());
    }).catchError((error) {
      emit(GetChatDataErrorState(error: error.toString()));
    });
  }

  // method for sending and getting messages

  void sendMessage({
    required String receiverId,
    required String dateTime,
    required String text,
  }) {
    MessageModel model = MessageModel(
      text: text,
      senderId: teacherModel!.uid,
      receiverId: receiverId,
      dateTime: dateTime,
    );

    // set my chats

    FirebaseFirestore.instance
        .collection('teachers')
        .doc(teacherModel!.uid)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .add(model.toMap())
        .then((value) {
      emit(SendMessageSuccessState());
    }).catchError((error) {
      emit(SendMessageErrorState());
    });

    // set receiver chats

    FirebaseFirestore.instance
        .collection('users')
        .doc(receiverId)
        .collection('chats')
        .doc(teacherModel!.uid)
        .collection('messages')
        .add(model.toMap())
        .then((value) {
      emit(SendMessageSuccessState());
    }).catchError((error) {
      emit(SendMessageErrorState());
    });

  }

  List<MessageModel> messages = [];

  void getMessages({
    required String receiverId,
  }) {
    FirebaseFirestore.instance
        .collection('teachers')
        .doc(teacherModel!.uid)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .orderBy('dateTime')
        .snapshots()
        .listen((event) {
      messages = [];

      event.docs.forEach((element) {
        messages.add(MessageModel.fromJson(element.data()));
      });

      emit(GetMessagesSuccessState());
    });
  }
}