bool emailcheck({required email}){
  // here we are going to check that the email of the user is of the correct format
  String pattern = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
  RegExp regExp = RegExp(pattern);
  if(!regExp.hasMatch(email)){
    return false;
  }
  return true;
}
bool passwordMatching({required  password, required retypepassword}){
  // here we are going to match the password entered are corrects
  if(password!=retypepassword){
    // so our password matches correctly
    return false;
  }
  return true;
}

bool strongPassword({required String password}){
  // here we are going to check weather the password entered by the user are  strong
  String pattern = r'^(?=.*[A-Z])(?=.*[@!#$%^&*(),.?":{}|<>])(?=.*\d).{8,}$';
  RegExp regExp = RegExp(pattern);

  // Use the regex to test the password
  if(!regExp.hasMatch(password)){
    return false;
  }
  return true;
}


bool validPhone({required phoneno}){
  RegExp phoneRegex = RegExp(r"^\d{10}$");

  if(!phoneRegex.hasMatch(phoneno)){
    return false;
  }
  return true;
}

