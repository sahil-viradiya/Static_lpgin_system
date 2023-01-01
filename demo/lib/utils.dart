String PASSWORD = "123456",EMAIL = "john@g.com";

enum LoginStates {LOGIN_SUCCESS,LOGIN_FAILED}

 LoginStates login({required String email,required String password}){
  if(email==EMAIL && password==PASSWORD){
    return LoginStates.LOGIN_SUCCESS;
  }
  return LoginStates.LOGIN_FAILED;
}