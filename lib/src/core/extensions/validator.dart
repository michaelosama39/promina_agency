import 'package:flutter/material.dart';

extension Validator on String {
  String? validateEmpty(BuildContext context) {
    if (trim().isEmpty) {
      return 'هذا الحقل مطلوب';
    }
    return null;
  }

  String? validatePassword(BuildContext context) {
    if (trim().isEmpty) {
      return 'هذا الحقل مطلوب';
    } else if (length < 6) {
      return 'يجب أن تكون كلمة المرور مؤلفة من ستة أرقام أو أكثر';
    }
    return null;
  }


}

