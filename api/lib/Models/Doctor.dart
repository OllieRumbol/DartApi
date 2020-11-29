import 'package:api/Models/Person.dart';

class Doctor extends Person {
  Specialty Type;

  Doctor(int Id, String Name, String Email, String PhoneNumber, this.Type)
      : super(Id, Name, Email, PhoneNumber);

  Map<String, dynamic> toJson() => {
        'id': Id,
        'name': Name,
        'email': Email,
        'phoneNumber': PhoneNumber,
        'type': Type.toString()
      };
}

enum Specialty { SURGEON, NEUROLOGIST, RADIOLOGIST, PHYSICIAN, PEDIATRICIAN }
