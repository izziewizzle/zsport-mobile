import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameC = TextEditingController();
  final _priceC = TextEditingController();
  final _descC = TextEditingController();
  final _thumbC = TextEditingController();

  static const _categories = {
    'clothing': 'Clothing',
    'footwear': 'Footwear',
    'equipment': 'Equipment',
    'accessories': 'Accessories',
    'merchandise': 'Merchandise',
  };

  String _category = 'equipment';
  bool _isFeatured = false;

  bool _isValidUrl(String input) {
    if (input.trim().isEmpty) return true;
    final uri = Uri.tryParse(input);
    return uri != null && (uri.isScheme('http') || uri.isScheme('https')) && uri.host.isNotEmpty;
  }

  void _save() {
    if (_formKey.currentState?.validate() != true) return;
    final price = int.tryParse(_priceC.text.trim()) ?? 0;

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Produk Berhasil Dibuat'),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              _item('Name', _nameC.text),
              _item('Price', price.toString()),
              _item('Description', _descC.text),
              _item('Thumbnail', _thumbC.text.isEmpty ? '(kosong)' : _thumbC.text),
              _item('Category', _categories[_category] ?? _category),
              _item('Featured', _isFeatured ? 'Ya' : 'Tidak'),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('OK')),
        ],
      ),
    );
  }

  Widget _item(String k, String v) => Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$k: ', style: const TextStyle(fontWeight: FontWeight.w600)),
            Expanded(child: Text(v)),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Produk')),
      drawer: const AppMainDrawer(),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              TextFormField(
                controller: _nameC,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                maxLength: 255,
                validator: (v) {
                  final s = (v ?? '').trim();
                  if (s.isEmpty) return 'Nama tidak boleh kosong';
                  if (s.length < 2) return 'Minimal 2 karakter';
                  return null;
                },
              ),
              const SizedBox(height: 12),

              TextFormField(
                controller: _priceC,
                decoration: const InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (v) {
                  final s = (v ?? '').trim();
                  if (s.isEmpty) return 'Harga tidak boleh kosong';
                  final n = int.tryParse(s);
                  if (n == null) return 'Masukkan angka bulat';
                  if (n < 0) return 'Harga tidak boleh negatif';
                  return null;
                },
              ),
              const SizedBox(height: 12),

              TextFormField(
                controller: _descC,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                minLines: 3,
                maxLines: 6,
                validator: (v) {
                  final s = (v ?? '').trim();
                  if (s.isEmpty) return 'Deskripsi tidak boleh kosong';
                  if (s.length < 10) return 'Minimal 10 karakter';
                  return null;
                },
              ),
              const SizedBox(height: 12),

              TextFormField(
                controller: _thumbC,
                decoration: const InputDecoration(
                  labelText: 'Thumbnail (URL)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.url,
                validator: (v) {
                  final s = (v ?? '').trim();
                  if (s.isEmpty) return null;
                  if (!_isValidUrl(s)) return 'Masukkan URL valid (http/https)';
                  return null;
                },
              ),
              const SizedBox(height: 12),

              DropdownButtonFormField<String>(
                value: _category,
                decoration: const InputDecoration(
                  labelText: 'Category',
                  border: OutlineInputBorder(),
                ),
                items: _categories.entries
                    .map((e) => DropdownMenuItem(value: e.key, child: Text(e.value)))
                    .toList(),
                onChanged: (val) => setState(() => _category = val ?? 'equipment'),
              ),
              const SizedBox(height: 8),

              SwitchListTile(
                title: const Text('Featured Product'),
                value: _isFeatured,
                onChanged: (val) => setState(() => _isFeatured = val),
              ),
              const SizedBox(height: 12),

              FilledButton.icon(
                icon: const Icon(Icons.save),
                label: const Text('Save'),
                onPressed: _save,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
