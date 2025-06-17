class EndPoints {
  static const String patientRegisterEndPoint =
      "api/Patients/PatientRegistration";
  static const String patientLoginEndPoint = "api/Patients/PatientLogin";
  static const String doctorRegisterEndPoint = "api/Doctor/DoctorRegistration";
  static const String doctorLoginEndPoint = "api/Doctor/DoctorLogin";
  static const String getAllDoctorsEndPoint = "api/Doctor/GetDoctors";
  static const String xrayEndPoint = "/predict/";
  static const String getAllPatientsEndPoint = "/api/PatientMedicalData/GetAll";
  static  String addPatientEndPoint({required int patientId}) =>"/api/PatientMedicalData/Add/$patientId";
  static  String addEmergancyEndPoint({required int patientId}) =>"/api/Emergency/Add/$patientId";
  static String addAnalysisEndPoint = "/predict/";
}
