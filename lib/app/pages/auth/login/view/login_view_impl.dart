import 'package:flutter/widgets.dart';

import '../../../../core/ui/helpers/loader.dart';
import '../../../../core/ui/helpers/messages.dart';
import '../login_page.dart';
import 'login_view.dart';

class LoginViewImpl extends State<LoginPage>
    with Messages<LoginPage>, Loader<LoginPage>
    implements LoginView {
  @override
  void initState() {
    widget.presenter.view = this;
    super.initState();
  }

  @override
  void error(String message) {
    hideLoader();
    showError(message);
  }

  @override
  void success() {
    hideLoader();
    Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
