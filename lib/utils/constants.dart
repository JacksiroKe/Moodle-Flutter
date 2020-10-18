class APIConstants {
  static const String OCTET_STREAM_ENCODING = "application/octet-stream";
  static const String API_BASE_URL = "https://127.0.0.0/moodle";
}

class APIOperations {
  static const String LOGIN = "login";
  static const String REGISTER = "register";
  static const String CHANGE_PASSWORD = "chgPass";
  static const String SUCCESS = "success";
  static const String FAILURE = "failure";

  static const String fetchUserDetail = "webservice/rest/server.php?wsfunction=core_webservice_get_site_info&moodlewsrestformat=json";
  static const String getTokenByLogin = "login/token.php?service=moodle_mobile_app&moodlewsrestformat=json";
  static const String getPublicConfig = "lib/ajax/service.php?info=tool_mobile_get_public_config";
  static const String checkToken = "webservice/rest/server.php?wsfunction=core_webservice_get_site_info&moodlewsrestformat=json";
  static const String getUserCourses = "webservice/rest/server.php?wsfunction=core_enrol_get_users_courses&moodlewsrestformat=json";
  static const String getCourses = "webservice/rest/server.php?wsfunction=core_course_get_courses&moodlewsrestformat=json";
  static const String getCategories = "webservice/rest/server.php?wsfunction=core_course_get_categories&moodlewsrestformat=json";
  static const String getCourseContent = "webservice/rest/server.php?wsfunction=core_course_get_contents&moodlewsrestformat=json";
  
}

class EventConstants {
  static const int NO_INTERNET_CONNECTION = 0;

  static const int LOGIN_USER_SUCCESSFUL = 500;
  static const int LOGIN_USER_UN_SUCCESSFUL = 501;

  static const int USER_REGISTRATION_SUCCESSFUL = 502;
  static const int USER_REGISTRATION_UN_SUCCESSFUL = 503;
  static const int USER_ALREADY_REGISTERED = 504;

  static const int CHANGE_PASSWORD_SUCCESSFUL = 505;
  static const int CHANGE_PASSWORD_UN_SUCCESSFUL = 506;
  static const int INVALID_OLD_PASSWORD = 507;
}

class APIResponseCode {
  static const int SC_OK = 200;
}

class SharedPreferenceKeys {
  static const String IS_USER_LOGGED_IN = "is_user_logged_in";
  static const String APP_USER = "app_user";
  static const String USER_TOKEN = "user_token";
  static const String DARK_MODE = "dark_mode";
  static const String SITE_NAME = "site_name";
  static const String SITE_URL = "site_url";
}

class ProgressDialogTitles {
  static const String IN_PROGRESS = "In Progress...";
  static const String USER_LOG_IN = "Logging In...";
  static const String USER_CHANGE_PASSWORD = "Changing...";
  static const String USER_REGISTER = "Registering...";
  static const String checking_site = "Checking Site";
  static const String login_progress_authenticating = "Authenticating";
  static const String login_progress_fetch_detail = "Fetching user details";
  static const String login_progress_fetch_category_list = "Fetching category list";
  static const String login_progress_fetch_course_list = "Fetching course list";
  static const String login_progress_fetch_course_contents = "Fetching course contents";
}

class SnackBarText {
  static const String NO_INTERNET_CONNECTION = "No Internet Conenction";
  static const String LOGIN_SUCCESSFUL = "Login Successful";
  static const String LOGIN_UN_SUCCESSFUL = "Login Un Successful";
  static const String CHANGE_PASSWORD_SUCCESSFUL = "Change Password Successful";
  static const String CHANGE_PASSWORD_UN_SUCCESSFUL =
      "Change Password Un Successful";
  static const String REGISTER_SUCCESSFUL = "Register Successful";
  static const String REGISTER_UN_SUCCESSFUL = "Register Un Successful";
  static const String USER_ALREADY_REGISTERED = "User Already Registered";
  static const String ENTER_USERNAME = "Please Enter your Username";
  static const String ENTER_PASS = "Please Enter your Password";
  static const String ENTER_NEW_PASS = "Please Enter your New Password";
  static const String ENTER_OLD_PASS = "Please Enter your Old Password";
  static const String ENTER_EMAIL = "Please Enter your Email Id";
  static const String ENTER_VALID_MAIL = "Please Enter Valid Email Id";
  static const String ENTER_NAME = "Please Enter your Name";
  static const String INVALID_OLD_PASSWORD = "Invalid Old Password";
}

class Texts {
  static const String APP_NAME = "Moodle Flutter";
  static const String REGISTER_NOW = "Register Now!";
  static const String NEW_USER = "Don\'t have an account?";
  static const String OLD_USER = "Already Registered?";
  static const String PLEASE_LOGIN = "Please enter your username and password to login";
  static const String LOGIN_NOW = "Login Now!";
  static const String LOGIN = "LOGIN";
  static const String REGISTER = "REGISTER";
  static const String PASSWORD = "Password";
  static const String OLD_PASSWORD = "Old Password";
  static const String NEW_PASSWORD = "New Password";
  static const String CHANGE_PASSWORD = "CHANGE PASSWORD";
  static const String LOGOUT = "LOGOUT";
  static const String EMAIL = "Email Address";
  static const String USERNAME = "Username";
  static const String NOT_A_USERNAME = "Enter a valid username";
  static const String NOT_A_PASSWORD = "Enter a valid password";
  static const String NAME = "Name";
}
