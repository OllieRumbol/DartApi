class Appointments {
  int DoctorId;
  int PatientId;
  DateTime Date;

  Appointments(this.DoctorId, this.PatientId, this.Date);

  Map<String, dynamic> toJson() => {
        'doctorId': DoctorId,
        'patientId': PatientId,
        'date': Date,
      };
}
