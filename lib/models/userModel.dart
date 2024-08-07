class User {
 final String username;
 final String password;
 User ({
   required this.username,
   required this.password,
});
 factory User.fromJson(Map<String, dynamic> json) {
   return User(
     username: json['username'] as String,
     password: json['password'] as String,

   );
 }

 static List<User> fromJsonList(List<dynamic> jsonList) {
   return jsonList.map((json) => User.fromJson(json)).toList();
 }
}