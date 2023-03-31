class  Urls {
  static String baseUrl = 'https://task.teamrabbil.com/api/v1';
  static String loginUrl = '$baseUrl/login';
  static String registrationUrl = '$baseUrl/registration';
  static String createNewTaskUrl = '$baseUrl/createTask';
  static String newTaskUrl = '$baseUrl/listTaskByStatus/New';
  static String completeTaskUrl = '$baseUrl/listTaskByStatus/Completed';
  static String progressTaskUrl = '$baseUrl/listTaskByStatus/Progress';
  static String cancelledTaskUrl = '$baseUrl/listTaskByStatus/Cancelled';
  static String profileUpdateTaskUrl = '$baseUrl/profileUpdate';
  static String recoverResetPassUrl = '$baseUrl/RecoverResetPass';

  static String changeTaskStatus(String taskId,String status) =>
      '$baseUrl/updateTaskStatus/$taskId/$status';

  static String deleteTask(taskId) => "$baseUrl/deleteTask/$taskId";


static String recoverVerifyEmailUrl(String email) =>'$baseUrl/RecoverVerifyEmail/$email';
static String recoverVerifyOTPUrl(String email,String otp) =>'$baseUrl/RecoverVerifyOTP/$email/$otp';

}

