import 'package:api/Models/Appointments.dart';
import 'package:api/Models/Doctor.dart';
import 'package:api/Models/Patient.dart';

class Service {
  static List<Doctor> Doctors = [];
  static List<Patient> Patients = [];
  static List<Appointments> PatientAppointments = [];

  Service() {}

  void addTestData() {
    var doctor1 = Doctor(
        1, 'Mark Tanner', 'example@email.com', '01233 123456', 'Surgeon');
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

  List<Doctor> AddDoctor(
      String name, String email, String phoneNumber, String specialty) {
    int nextId = GetNextId();

    Doctors.add(Doctor(nextId, name, email, phoneNumber, specialty));

    print(Doctors);
  }

  int GetNextId() {
    return Doctors.last.Id + 1;
  }
}
