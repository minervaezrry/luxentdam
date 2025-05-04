class AuthService {
  static User? _currentUser;
  
  static User? get currentUser => _currentUser;
  
  static Future<void> login(String email, String password) async {
    // Check if this is an admin login
    if (email == "admin@luxent.com" && password == "admin123") {
      await adminLogin(email, password);
      return;
    }
    
    // Regular user login
    _currentUser = User(
      id: 'user-$email',
      email: email,
      isAdmin: false,
    );
    
    // In a real app, you would typically:
    // 1. Validate credentials with backend
    // 2. Store authentication token
    // 3. Save user session
  }
  
  static Future<void> adminLogin(String email, String password) async {
    // Admin credentials - in production, these should come from secure storage
    // or be verified against a backend service
    const adminEmail = "admin@luxent.com";
    const adminPassword = "admin123";
    
    if (email == adminEmail && password == adminPassword) {
      _currentUser = User(
        id: 'admin-$email',
        email: email,
        isAdmin: true,
      );
    } else {
      throw Exception('Invalid admin credentials');
    }
  }
  
  static Future<void> register(String email, String password, String name) async {
    // Registration logic for new users
    _currentUser = User(
      id: 'user-$email',
      email: email,
      isAdmin: false,
    );
    
    // In a real app, you would typically:
    // 1. Create user in backend database
    // 2. Send verification email
    // 3. Store basic user info locally
  }
  
  static Future<void> logout() async {
    _currentUser = null;
    // In a real app, you would also:
    // 1. Clear any authentication tokens
    // 2. Clear local user data
    // 3. Notify backend of logout
  }
  
  static Future<bool> isLoggedIn() async {
    // In a real app, you would verify:
    // 1. If auth token exists and is valid
    // 2. If user session is still active
    return _currentUser != null;
  }
  
  static Future<void> resetPassword(String email) async {
    // Password reset logic
    // Typically would:
    // 1. Verify email exists in system
    // 2. Send password reset email
    // 3. Provide feedback to user
  }
}

class User {
  final String id;
  final String email;
  final bool isAdmin;
  final String? name;
  final String? profileImageUrl;
  
  const User({
    required this.id,
    required this.email,
    this.isAdmin = false,
    this.name,
    this.profileImageUrl,
  });
  
  // Helper method to convert user to map for storage
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'isAdmin': isAdmin,
      'name': name,
      'profileImageUrl': profileImageUrl,
    };
  }
  
  // Helper method to create user from map
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      email: map['email'],
      isAdmin: map['isAdmin'] ?? false,
      name: map['name'],
      profileImageUrl: map['profileImageUrl'],
    );
  }
}