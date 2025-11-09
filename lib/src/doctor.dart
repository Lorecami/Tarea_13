class Doctor {
  final String nombre;
  final String especialidad;
  final String correo;
  final String imagen;

  Doctor({
    required this.nombre,
    required this.especialidad,
    required this.correo,
    required this.imagen,
  });

  // 🔹 Convierte el objeto en texto (para el QR)
  String toQRData() {
    return '$nombre|$especialidad|$correo';
  }

  // 🔹 Crea un doctor desde el texto leído del QR
  factory Doctor.fromQRData(String data) {
    final parts = data.split('|');
    if (parts.length < 3) return Doctor(
      nombre: 'Desconocido',
      especialidad: 'N/A',
      correo: 'N/A',
      imagen: 'images/default_doctor.png',
    );
    return Doctor(
      nombre: parts[0],
      especialidad: parts[1],
      correo: parts[2],
      imagen: 'images/default_doctor.png',
    );
  }
}
