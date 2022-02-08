class Customer {
  final int id;
  final String name;
  final String email;
  final double balance;

  Customer({
    required this.id,
    required this.name,
    required this.email,
    required this.balance,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'balance': balance,
    };
  }

  @override
  String toString() {
    return 'customer{id: $id, name: $name, email: $email, balance:$balance}\n';
  }
}
