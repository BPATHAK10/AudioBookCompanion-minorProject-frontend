class User {
  final int id;
  final String name;
  final String avatar;

  User({
    required this.id,
    required this.name,
    required this.avatar,
  });
}

final User currentUser =
    User(id: 0, name: 'You', avatar: 'assets/images/blackhole.jpg');

final User blackhole =
    User(id: 1, name: 'Blackhole', avatar: 'assets/images/blackhole.jpg');

final User ai =
    User(id: 2, name: 'AI', avatar: 'assets/images/ai.jpg');


final User elon =
    User(id: 3, name: 'Elon Musk', avatar: 'assets/images/elon.jpg');

final User  pandas=
    User(id: 4, name: 'Pandas', avatar: 'assets/images/panda.jpg');
