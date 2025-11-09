import 'package:flutter/material.dart';

class NuevaCitaPage extends StatefulWidget {
  const NuevaCitaPage({super.key});

  @override
  State<NuevaCitaPage> createState() => _NuevaCitaPageState();
}

class _NuevaCitaPageState extends State<NuevaCitaPage> {
  final _formKey = GlobalKey<FormState>();
  String? pacienteSeleccionado;
  DateTime? fechaSeleccionada;
  TimeOfDay? horaSeleccionada;

  // Pacientes ficticios
  final List<String> pacientes = [
    "Juan Pérez",
    "Ana Torres",
    "Carlos León",
    "María López",
    "Sofía García"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tomar nueva cita')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                value: pacienteSeleccionado,
                hint: const Text('Selecciona paciente'),
                items: pacientes.map((String paciente) {
                  return DropdownMenuItem<String>(
                    value: paciente,
                    child: Text(paciente),
                  );
                }).toList(),
                onChanged: (value) => setState(() => pacienteSeleccionado = value),
                validator: (value) => value == null ? 'Selecciona un paciente' : null,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _seleccionarFecha,
                child: Text(fechaSeleccionada == null
                    ? 'Seleccionar fecha'
                    : '📅 ${fechaSeleccionada!.day}/${fechaSeleccionada!.month}/${fechaSeleccionada!.year}'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: _seleccionarHora,
                child: Text(horaSeleccionada == null
                    ? 'Seleccionar hora'
                    : '🕒 ${horaSeleccionada!.format(context)}'),
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                icon: const Icon(Icons.check),
                label: const Text('Confirmar Cita'),
                onPressed: _guardarCita,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _seleccionarFecha() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2026),
    );
    if (picked != null) setState(() => fechaSeleccionada = picked);
  }

  void _seleccionarHora() async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picked != null) setState(() => horaSeleccionada = picked);
  }

  void _guardarCita() {
    if (_formKey.currentState!.validate() &&
        fechaSeleccionada != null &&
        horaSeleccionada != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '✅ Cita guardada para $pacienteSeleccionado el '
            '${fechaSeleccionada!.day}/${fechaSeleccionada!.month} '
            'a las ${horaSeleccionada!.format(context)}',
          ),
          backgroundColor: Colors.green.shade300,
        ),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Completa todos los campos antes de guardar'),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }
}
