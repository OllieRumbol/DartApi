import 'package:api/Models/Doctor.dart';

class Service {
  static List<Doctor> Doctors = new List();

  Service() {}

  void addTestData() {
    var doctor1 = Doctor(1, 'Mark Tanner', 'example@email.com', '01233 123456',
        Specialty.SURGEON);
    Doctors.add(doctor1);
  }

  Doctor GetDoctorById(int id) {
    for (var doctor in Doctors) {
      if (doctor.Id == id) {
        return doctor;
      }
    }

    return null;
  }

  List<Doctor> GetAllDoctors() {
    return Doctors;
  }
}
