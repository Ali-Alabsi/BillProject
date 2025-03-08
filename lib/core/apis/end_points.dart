class EndPoints {
  static String baseUrl = 'http://192.168.8.185:8000/api/';
  static String signup = 'auth/register';
  static String login = 'auth/login';
  static String updateUser = 'user/update';
  static String createBill = 'bills';
  static String bills = 'bills';
  static String categories = 'categories';
  static String logout = 'users/logout';
  static String getUser (id){
    return 'user/get-user/$id';
  }
  static String deleteUser (id){
    return 'user/delete?id=$id';
  }

}

class ApiKey{
  static String status = 'status';
  static String email = 'email';
  static String password = 'password';
  static String acceptLanguage = 'Accept-Language';
  static String errorMessage = 'message';
  static String message = 'message';
  static String token = 'token';
  static String bearer = 'bearer';
  static String authorization = 'Authorization';
  static String id = 'id';
  static String name = 'name';
  static String phone = 'phone';
  static String confirmPassword = 'confirmPassword';
  static String location = 'location';
  static String profilePic = 'profilePic';
}