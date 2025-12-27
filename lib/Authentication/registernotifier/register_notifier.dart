import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shuleoneparents/Authentication/registernotifier/register_state.dart';

import '../../Widgets/popup_messages.dart';
import '../Repositories/registerrepositories.dart';

part 'register_notifier.g.dart';

@riverpod
class RegisterNotifier extends _$RegisterNotifier {
  late final RegisterRepository _repo;
  @override
  RegisterState build() {
    _repo = ref.read(registerRepositoryProvider);
    return RegisterState();
  }

  void onFirstNameChanged(String firstName) {
    state = state.copyWith(firstName: firstName);
  }

  void onMiddleNameChanged(String middleName) {
    state = state.copyWith(middleName: middleName);
  }

  void onLastNameChanged(String lastName) {
    state = state.copyWith(LastName: lastName);
  }

  void onUserNameChanged(String userName) {
    state = state.copyWith(UserName: userName);
  }

  void onadmChanged(String AdmNo) {
    state = state.copyWith(admNo: AdmNo);
  }

  void onselectedClassChanged(String selectedClass) {
    state = state.copyWith(selectedClass: selectedClass);
  }

  void onPhoneNumberchanged(String phoneNumber) {
    state = state.copyWith(phoneNumber: phoneNumber);
  }

  void onemailChanged(String email) {
    state = state.copyWith(email: email);
  }

  void onpasswordChanged(String password) {
    state = state.copyWith(password: password);
  }

  void onconfirmpasswordChanged(String confirmpassword) {
    state = state.copyWith(confirmPassword: confirmpassword);
  }

  Future<void> register() async {
    // Validation
    if (state.firstName.isEmpty) {
      toastInfo("First Name is required");
      return;
    }
    if (state.middleName.isEmpty) {
      toastInfo("Middle Name is required");
      return;
    }
    if (state.password != state.confirmPassword) {
      toastInfo("Passwords do not match");
      return;
    }

    try {
      state = state.copyWith(isLoading: true, error: null);

      await _repo.register(state);

      toastInfo("Account created successfully 🎉");
    } catch (e) {
      state = state.copyWith(error: e.toString());
      toastInfo(e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

}
