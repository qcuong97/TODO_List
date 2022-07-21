import 'package:flutter/foundation.dart';

import '../utils/context_utils.dart';

class BaseController extends ChangeNotifier {
  Future<dynamic> getResponse(Future<dynamic> service,
      {Function(dynamic)? onRes}) async {
    await service.then((res) {
      onRes?.call(res);
    }).catchError((onError) {
      if (kDebugMode) {
        print("Error - $onError");
      }
      ContextUtils.ins.showMessage("Có lỗi xảy ra\nHãy thử lại sau");
    });
  }

  showLoading() {
    ContextUtils.ins.showLoading();
  }

  hideLoading() {
    ContextUtils.ins.hideLoading();
    onRefresh();
  }

  onRefresh() {
    notifyListeners();
  }
}
