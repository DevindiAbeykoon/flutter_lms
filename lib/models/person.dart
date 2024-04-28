class Person {
  String? userId;
  String? email;
  String? userName;

  Person({
    this.userId,
    this.email,
    this.userName,
  });

  // receiving data from server
  factory Person.fromMap(map) {
    return Person(
      userId: map['userId'],
      email: map['email'],
      userName: map['userName'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'email': email,
      'userName': userName,
    };
  }
}
