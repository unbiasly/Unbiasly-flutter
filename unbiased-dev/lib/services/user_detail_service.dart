import 'package:unbiased/data/auth/models/sign_in_model.dart';
import 'package:unbiased/helpers/base_view_model.dart';

class UserDetailService extends BaseViewModel {
  LoginResponse? _userDetailResponse;
  LoginResponse? get userDetailResponse => _userDetailResponse;

  void setuserDetail(LoginResponse? detailResponse) {
    _userDetailResponse = detailResponse;
    notifyListeners();
  }
}
