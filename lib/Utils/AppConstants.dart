class AppConstants {
  static const String APP_NAME = "ShuleOneParents";
  static const int APP_VERSION = 1;

  static const String WS_BASE_URL = "wss://app.shuleone.co.ke/shuleoneAp";

  static const String BASE_URL = "https://portal.shuleone.co.ke";
  static const String TOKEN = "DBTOKEN";
  static const String LOGIN = "/api/auth/signin";
  static const String REGISTER = "/api/auth/signup";
  static const String GET_NEXT_ADM = "/api/getNextAdmission";
  static const String REG_GET_CLASSES = "/api/getClasses";
  static const String SIGN_IN = "/api/auth/signin";
  static const String STUDENT_GET_EXAMS ="/api/elearning/getmainexams";
  static const String STUDENT_GET_FEEBALANCE ="/api/elearning/getstudentbalance";
  static String STUDENT_EXAM_PERFORMANCE(int examId) {
    return "/api/elearning/getExamPerformance?examId=$examId";
  }
  static String PARENT_STUDENT_GET_FEEBALANCE(int studentid) {
    return "/api/parent/getstudentbalance/$studentid";
  }

  static String PARENT_MAIN_EXAMS(int studentid) {
    return "/api/parent/getmainexams/$studentid";
  }
  static String PARENT_EXAM_PERFORMANCE(int examId) {
    return "/api/parent/getExamPerformance?examId=$examId";
  }
  static String PARENT_ASSIGNMENTS(int examId) {
    return "/api/parent/loadlistofexams/$examId";
  }
  static const String STUDENT_ASSIGNMENTS ="/api/elearning/loadlistofexams";
  static const String STUDENT_LIVE_CLASSES ="/api/elearning/getliveclasses";

  static String PARENT_LIVE_CLASSES(int studentid) {
    return "/api/parent/getliveclasses/$studentid";
  }



}
