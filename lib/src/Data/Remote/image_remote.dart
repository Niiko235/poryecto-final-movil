import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ImageRemote extends StatefulWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;

  const ImageRemote({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  @override
  State<ImageRemote> createState() => _ImageRemoteState();
}

class _ImageRemoteState extends State<ImageRemote> {
  Uint8List? _imageData;
  bool _isLoading = true;
  bool _hasError = false;

  void initState() {
    super.initState();
    // Aquí iría la lógica para cargar la imagen desde una URL remota
    // Por simplicidad, este ejemplo no implementa la carga real
    // Simulamos una carga exitosa después de un retraso
    _fetchImage();
  }

  Future<void> _fetchImage() async {
    try {
      final token =
          'ea4758054cbcb8691f3df48dbdce8889d5ee912bc1e4498d4a96a3917c013bbb'; // Reemplaza con la lógica para obtener el token
      final response = await http.get(
        Uri.parse(widget.imageUrl),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        print('✅ Imagen cargada correctamente desde ${widget.imageUrl}');
        setState(() {
          _imageData = response.bodyBytes;
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to load image');
      }
    } catch (_) {
      setState(() {
        _isLoading = false;
        _hasError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    } else if (_hasError || _imageData == null) {
      return Image.asset(
        'assets/image_fail.jpg',
        width: widget.width,
        height: widget.height,
        fit: widget.fit,
      );
    } else {
      return Image.memory(
        _imageData!,
        width: widget.width,
        height: widget.height,
        fit: widget.fit,
      );
    }
  }
}
