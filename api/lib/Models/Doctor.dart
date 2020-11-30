import 'package:api/Models/Person.dart';

class Doctor extends Person {
  String Speciality;

  Doctor(int Id, String Name, String Email, String PhoneNumber, this.Speciality)
      : super(Id, Name, Email, PhoneNumber);

  Map<String, dynamic> toJson() => {
        'id': Id,
        'name': Name,
        'email': Email,
        'phoneNumber': PhoneNumber,
        'speciality': Speciality
      };
}

