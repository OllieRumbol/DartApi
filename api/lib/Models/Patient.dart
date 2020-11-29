import 'package:api/Models/Person.dart';

class Patient extends Person {
  String MedicalNotes;

  Patient(
      int Id, String Name, String Email, String PhoneNumber, this.MedicalNotes)
      : super(Id, Name, Email, PhoneNumber);

  Map<String, dynamic> toJson() => {
        'id': Id,
        'name': Name,
        'email': Email,
        'phoneNumber': PhoneNumber,
        'medicalNotes': MedicalNotes
      };
}
