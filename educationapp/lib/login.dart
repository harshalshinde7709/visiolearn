
import 'package:educationapp/admin/admin.dart';
import 'package:educationapp/main.dart';
import 'package:flutter/material.dart';
import 'classacadamy.dart';

class LogInPage extends StatefulWidget{

  const LogInPage({super.key});

  @override
  State createState()=> _LogInPageState();
}

class Users{
  String userName;
  String password;
  String name;
  String email;

  Users(
    this.userName,
    this.password,
    this.name,
    this.email
  );

  Map<String,String> retMap(){

    return {
      "userName": userName,
      "password": password,
      "name": name,
      "emailId": email
    };
  }
}

List validUsers = [
  //Users("aditya","password","aaa","dakfl"),
];
Users? currentUser;

Future<void> getUserData()async{
  List data =  await getData("userInfo");
  validUsers = List.generate(
    data.length, 
    (i){
      return Users(
        data[i]["userName"],
        data[i]["password"],
        data[i]["name"],
        data[i]["emailId"],
      );
    }
  );
}

class _LogInPageState extends State{

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isSignUp = false;
  bool isAdmin = false;
  bool showPassword = false;
  bool isConfirmPassword = false;

  void clearController(){
    userNameController.clear();
    passwordController.clear();
    fullNameController.clear();
    emailController.clear();
    confirmPasswordController.clear();
  }

  void addUser(Users user)async{
    
    await insertData("userInfo", user);
    await getUserData();
    setState(() {
      
    });
  }

  bool isSameUserName(String userName){

    for(int i=0;i<validUsers.length;i++){
      if(userName == validUsers[i].userName){
        return true;
      }
    }
    return false;
  }

  Users? isValidateUser(TextEditingController userNameController,TextEditingController passwordController){
    for(int i=0;i<validUsers.length;i++){
      if(userNameController.text == validUsers[i].userName){
        if(passwordController.text == validUsers[i].password){
          getMyCourseData();
          return validUsers[i];
        }
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context){

    return !isSignUp ? 
    Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(232, 237, 250, 1),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    isAdmin = false;
                    setState(() {
                      
                    });
                  },
                  child: const Text("User")
                ),
                Container(
                  color: !isAdmin ? Colors.black: const Color.fromRGBO(232, 237, 250, 1),
                  height: 2,
                  width: 100,
                ),
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    isAdmin = true;
                    setState(() {
                      
                    });
                  },
                  child: const Text("Admin")
                ),
                Container(
                  color: isAdmin ? Colors.black: const Color.fromRGBO(232, 237, 250, 1),
                  height: 2,
                  width: 100,
                ),
              ],
            ),
          ],
        ),
      ),
      body: Container(
        color: const Color.fromRGBO(232, 237, 250, 1),
        child: Form(
          key: globalKey,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 50,
              left: 50,
              right: 50,
              bottom: 0,
            ),
            child: ListView(
              children: [
                const SizedBox(height: 30,),
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    //color: Colors.black,
                    borderRadius: BorderRadius.circular(100),
                    image: const DecorationImage(
                      image: AssetImage(
                        "assets/pngs/image.png",
                      ),
                    ),
                  ),
                  // child: Image.asset(
                  //   "assets/images/profile.jpeg",
                  //   height: 100,
                  // ),
                ),
                const SizedBox(height: 20,),
                Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "Log In",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 40,),
                TextFormField(
                  controller: userNameController,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Please Enter Username";
                    }else{
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person_outline),
                    label: const Text("Enter Username"),
                    hintText: "username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                TextFormField(
                  controller: passwordController,
                  obscureText: !showPassword,
                  obscuringCharacter: "*",
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Please Enter Password";
                    }else{
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: GestureDetector( 
                      onTap: () {
                        showPassword = !showPassword;
                        setState(() {
                        });
                      },
                    child: showPassword ? 
                      const Icon(Icons.visibility_off_outlined,) :
                      const Icon(Icons.visibility_outlined,),
                    ),
                    label: const Text("Enter Password"),
                    hintText: "password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                Container(
                  width: double.infinity,
                  height: 50,
                  //color: const Color.fromRGBO(2, 167, 177, 1),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(2, 167, 177, 1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ElevatedButton(
                    onPressed: (){
                      bool isVal = globalKey.currentState!.validate();

                      if(isVal){

                        if (!isAdmin) {
                          Users? isValidate = isValidateUser(userNameController,passwordController);
                          if(isValidate!= null){
                            currentUser = isValidate;
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ClassAcadamy(),
                              ),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Log In Successful!"),
                              ),
                            );
                            clearController();
                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Invalid Username or Password")
                              ),
                            );
                          }
                        }
                        else{

                          if(userNameController.text == "harshal" && passwordController.text == "0609"){
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AdminPage(),
                              ),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Log In Successful!"),
                              ),
                            );
                            clearController();
                          }
                          else{
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Invalid Username or Password")
                              ),
                            );
                          }
                        }
                      }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please Enter Username or Password"),
                          ),
                        );
                      }
                    },
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                         Color.fromARGB(255, 124, 1, 246),
                      ),
                      foregroundColor: MaterialStatePropertyAll(
                        Color.fromRGBO(232, 237, 250, 1),
                      ),
                    ),
                    child: const Text("Log In"),
                  ),
                ),
                const SizedBox(height: 10,),
                (isAdmin) ?
                const SizedBox():
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have account ? "),
                    GestureDetector(
                      onTap: () {
                        clearController();
                        setState(() {
                          isSignUp = true;
                        });
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.blue
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    ) : 
    Scaffold(
        body: //Container(
          //color: const Color.fromRGBO(232, 237, 250, 1),
          //child: 
          Container(
            color: const Color.fromRGBO(232, 237, 250, 1),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 50,
                left: 50,
                right: 50,
                //bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Form(
                key: signUpFormKey,
                child: ListView(
                   //crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: double.infinity,
                        height: 20,
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          //color: Colors.black,
                          borderRadius: BorderRadius.circular(100),
                          image: const DecorationImage(
                            image: AssetImage(
                              "assets/pngs/image.png",
                            ),
                          ),
                        ),
                        // child: Image.asset(
                        //   "assets/images/profile.jpeg",
                        //   height: 100,
                        // ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: fullNameController,
                        decoration: InputDecoration(
                          hintText: "name surname",
                          label: const Text("Enter Your Full Name"),
                          border: OutlineInputBorder(
                            borderRadius:BorderRadius.circular(30),
                          ),
                          prefixIcon: const Icon(
                            Icons.person_outline,
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if(value==null||value.isEmpty){
                            return "Please enter fullname";
                          }else{
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: "abc@gmail.com",
                          label: const Text("Enter Your Email"),
                          border: OutlineInputBorder(
                            borderRadius:BorderRadius.circular(30),
                          ),
                          prefixIcon: const Icon(
                            Icons.email_outlined
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if(value==null||value.isEmpty){
                            return "Please enter email";
                          }else{
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: userNameController,
                        decoration: InputDecoration(
                          hintText: "username",
                          label: const Text("Enter User Name"),
                          border: OutlineInputBorder(
                            borderRadius:BorderRadius.circular(30),
                          ),
                          prefixIcon:  Container(
                            margin:const EdgeInsets.all(8),
                            height: 2,
                            width: 2,
                            child: const Text(
                              " @",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if(value==null||value.isEmpty){
                            return "Please enter username";
                          }else if(isSameUserName(value)){
                            return "username already taken";
                          }
                          else{
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                      obscureText:true,
                      obscuringCharacter: "*",
                        controller: passwordController,
                        decoration: InputDecoration(
                          hintText: "password",
                          label: const Text("Enter Password"),
                          border: OutlineInputBorder(
                            borderRadius:BorderRadius.circular(30),
                          ),
                          prefixIcon: const Icon(
                            Icons.lock_outline
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if(value==null||value.isEmpty){
                            return "Please enter password";
                          }else{
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                      obscureText:!showPassword,
                      obscuringCharacter: "*",
                        controller: confirmPasswordController,
                        decoration: InputDecoration(
                          hintText: "confirm password",
                          label: const Text("Confirm Password"),
                          border: OutlineInputBorder(
                            borderRadius:BorderRadius.circular(30),
                          ),
                          prefixIcon: const Icon(
                            Icons.lock_outline
                          ),
                          suffixIcon: 
                        GestureDetector(
                          onTap: () {
                            showPassword=!showPassword;
                            setState(() {
                              
                            });
                          },
                          
                          child:showPassword?
                            const Icon(Icons.visibility_off_outlined,):
                            const Icon(Icons.visibility_outlined)
                        )
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if(value==null||value.isEmpty){
                            return "Please Confirm Password";
                          }else if(passwordController.text != value){
                            isConfirmPassword=true;
                            return "Please Enter Same Password";
                          }else{
                            return null;
                          }
                        },
                        // onFieldSubmitted: (value) {
                        //   if(confirmPasswordController!=passwordController.text){
                        //     isConfirmPassword=false;
                        //   }
                        //   signUpFormKey.currentState!.validate();
                        // }
            
                        // onFieldSubmitted: (value) {
                        //   if(value==passwordController.text){
                        //     return null;
                        //   }else{
                        //     return "Please re-enter correct password"
                        //   }
                        // },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        //color: const Color.fromRGBO(2, 167, 177, 1),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(2, 167, 177, 1),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child:ElevatedButton(
                          onPressed: (){
                            setState(() {
                              bool signUpValidation=signUpFormKey.currentState!.validate();
            
                              if(signUpValidation){
                                // userInfoList.add(
                                //   UserInfo(
                                //   fullNameController.text,
                                //   userNameController.text, 
                                //   passwordController.text,
                                //   )
                                // );
                                if(isSameUserName(userNameController.text)){
                                  signUpFormKey.currentState!.validate();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:Text("username isn't awailable"),
                                  )
                                );
                                // if(confirmPasswordController==passwordController.text){
                                //   //isConfirmPassword=false;
                                //   signUpFormKey.currentState!.validate();
                                // }
                                //signUpFormKey.currentState!.validate();
                                }
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:Text("SignUp Successful"),
                                  )
                                );
                                addUser(
                                  Users(
                                    userNameController.text,
                                    passwordController.text,
                                    fullNameController.text,
                                    emailController.text
                                  )
                                );
                                isSignUp=false;
                                showPassword = false;
                                clearController();
                              }
                              else{
                                ScaffoldMessenger.of(context).showSnackBar(  
                                const SnackBar(
                                    content:Text("Please Enter Data") 
                                  ),
                                );
                              }
                            }
                          );  
                        }, 
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                             Color.fromARGB(255, 124, 1, 246),
                          ),
                          foregroundColor: MaterialStatePropertyAll(
                            Color.fromRGBO(232, 237, 250, 1),
                          ),
                        ),
                        child:const Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account ? "
                        ),
                        GestureDetector(
                          onTap: () {
                            clearController();
                            setState(() {
                              isSignUp=false;
                            });
                          },
                          child:const Text("Login ",
                          style: TextStyle(
                            color: Colors.blue
                          )
                          )
                        )
                      ],
                    ),
                    const SizedBox(height: 20,),
                  ],
                ),
              ),
            ),
          ),
      //  )
      );
  }
}