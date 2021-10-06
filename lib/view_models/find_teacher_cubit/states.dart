class FindTeachersStates {}

class GetAllTeacherLoadingState extends FindTeachersStates{}

class GetAllTeacherSuccessState extends FindTeachersStates{}

class GetAllTeacherErrorState extends FindTeachersStates{
  final String error;
  GetAllTeacherErrorState({required this.error});
}