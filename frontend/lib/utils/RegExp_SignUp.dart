class SignUpRegExp {
  static RegExp regExp_birthdate =
      RegExp(r'^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/[0-9]{4}$');

  static RegExp regExp_name = RegExp(r'^[a-zA-Z]{2,20}$');
  static RegExp regExp_surname = RegExp(r'^[a-zA-Z]{2,20}$');

  static RegExp regExp_CF =
      RegExp(r'^[A-Z]{6}[0-9]{2}[A-Z][0-9]{2}[A-Z][0-9]{3}[A-Z]$');
  static RegExp regExp_email = RegExp(
      r'^[a-zA-Z0-9.!#$%&*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$');
  static RegExp regExp_password = RegExp(
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$');

  static RegExp regExp_medcode = RegExp(r'^\d{7}[A-Z]{3}\d$');
}
