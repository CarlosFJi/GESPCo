
class RoleType {
  static const ADMIN = 0;
  static const MODERATOR = 1;
  static const CLIENT = 2;

  static String convertRole(int type) {
    switch (type) {
      case RoleType.CLIENT:
        return "client";
      case RoleType.MODERATOR:
        return "moderador";
      default:
        return "not_matched";
    }
  }
}
