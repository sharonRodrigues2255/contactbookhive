import 'package:hive/hive.dart';
part 'contact_model.g.dart';

@HiveType(typeId: 1)
class ContactModel extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String phone;

  @HiveField(2)
  final int id;

  ContactModel({required this.name, required this.phone, required this.id});
}
