class ExploreStates {}

class GetUserLoadingState extends ExploreStates {}
class GetUserSuccessState extends ExploreStates {}
class GetUserErrorState extends ExploreStates {
final String error;
GetUserErrorState({required this.error});
}
class ProfileImagePickedSuccessState extends ExploreStates {}
class ProfileImagePickedErrorState extends ExploreStates {}
class UserUpdateLoadingState extends ExploreStates {}
class UploadProfileImageErrorState extends ExploreStates {}
class UserUpdateErrorState extends ExploreStates {}

