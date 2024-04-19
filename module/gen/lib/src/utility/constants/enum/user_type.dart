/// [UserType] enum is used to define the type of user.
enum UserType {
  /// [admin] observes users and products
  admin,

  /// [user] observes products
  user;

  /// [name] is used to get the name of the user type.:
  String get name {
    switch (this) {
      case UserType.admin:
        return 'ADMIN';
      case UserType.user:
        return 'USER';
    }
  }
}
