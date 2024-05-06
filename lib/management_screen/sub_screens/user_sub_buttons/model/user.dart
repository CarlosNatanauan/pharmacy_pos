class User {
  final String firstName;
  final String middleName;
  final String lastName;
  final String username;
  final String password;
  final String imageUrl;
  final String role; // Define the role property

  User({
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.username,
    required this.password,
    required this.imageUrl,
    required this.role, // Add role to the constructor parameters
  });
}
