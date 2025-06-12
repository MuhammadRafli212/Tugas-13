import 'package:flutter/material.dart';
import 'package:jim_dedi/tugas_13/database/db_workout.dart';
import 'package:jim_dedi/tugas_13/model/model_workout.dart';
import 'package:jim_dedi/tugas_13/model/workout.dart';

class TambahLatihan extends StatefulWidget {
  const TambahLatihan({super.key});

  @override
  State<TambahLatihan> createState() => _TambahLatihanState();
}

class _TambahLatihanState extends State<TambahLatihan> {
  final _form = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();

  String _status = 'Belum Selesai';
  List<Workout> _workouts = [];
  int? _editingId;

  @override
  void initState() {
    super.initState();
    _loadWorkouts();
  }

  void _loadWorkouts() async {
    final data = await DbWorkout.getAllWorkouts();
    setState(() {
      _workouts = data;
    });
  }

  void _simpan() async {
    if (_form.currentState!.validate()) {
      final workout = Workout(
        id: _editingId,
        title: _titleController.text,
        duration: int.tryParse(_durationController.text) ?? 0,
        status: _status,
      );

      if (_editingId == null) {
        // Insert data baru
        await DbWorkout.insertWorkout(workout);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Latihan berhasil disimpan')),
        );
      } else {
        // Update data yang diedit
        await DbWorkout.updateWorkout(workout);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Latihan berhasil diperbarui')),
        );
      }

      _resetForm();
      _loadWorkouts();
    }
  }

  void _hapus(int id) async {
    await DbWorkout.deleteWorkout(id);
    _loadWorkouts();
  }

  void _isiFormEdit(Workout w) {
    setState(() {
      _titleController.text = w.title;
      _durationController.text = w.duration.toString();
      _status = w.status;
      _editingId = w.id;
    });
  }

  void _resetForm() {
    _titleController.clear();
    _durationController.clear();
    _status = 'Belum Selesai';
    _editingId = null;
    setState(() {});
  }

  @override
  void dispose() {
    _titleController.dispose();
    _durationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Latihan')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Form(
              key: _form,
              child: Column(
                children: [
                  TextFormField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                      labelText: 'Jenis Latihan',
                    ),
                    validator:
                        (v) => v == null || v.isEmpty ? 'Wajib diisi' : null,
                  ),
                  TextFormField(
                    controller: _durationController,
                    decoration: const InputDecoration(
                      labelText: 'Durasi (menit)',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (v) {
                      if (v == null || v.isEmpty) return 'Wajib diisi';
                      if (int.tryParse(v) == null) return 'Harus berupa angka';
                      return null;
                    },
                  ),
                  DropdownButtonFormField<String>(
                    value: _status,
                    decoration: const InputDecoration(labelText: 'Status'),
                    items:
                        ['Belum Selesai', 'Selesai']
                            .map(
                              (s) => DropdownMenuItem(value: s, child: Text(s)),
                            )
                            .toList(),
                    onChanged: (v) => setState(() => _status = v!),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _simpan,
                          child: Text(_editingId == null ? 'Simpan' : 'Update'),
                        ),
                      ),
                      if (_editingId != null) const SizedBox(width: 10),
                      if (_editingId != null)
                        ElevatedButton(
                          onPressed: _resetForm,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey,
                          ),
                          child: const Text('Batal'),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const Text(
              'Data Latihan Tersimpan',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ..._workouts.map(
              (w) => WorkoutTile(
                workout: w,
                onEdit: () => _isiFormEdit(w),
                onDelete: () => _hapus(w.id!),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
