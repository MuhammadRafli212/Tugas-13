import 'package:flutter/material.dart';

class TimePickerPage extends StatefulWidget {
  const TimePickerPage({super.key});

  @override
  State<TimePickerPage> createState() => _TimePickerPageState();
}

class _TimePickerPageState extends State<TimePickerPage> {
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          child: const Text('Pilih Waktu Pengingat'),
          onPressed: () async {
            final picked = await showTimePicker(
              context: context,
              initialTime: selectedTime ?? TimeOfDay.now(),
            );
            if (picked != null) {
              setState(() {
                selectedTime = picked;
              });
            }
          },
        ),
        const SizedBox(height: 20),
        if (selectedTime != null)
          Text(
            'Pengingat diatur pukul: ${selectedTime!.format(context)}',
            style: const TextStyle(fontSize: 16),
          ),
      ],
    );
  }
}
