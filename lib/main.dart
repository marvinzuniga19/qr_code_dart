import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Generador de QR para USDT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const QRGeneratorScreen(),
    );
  }
}

class QRGeneratorScreen extends StatefulWidget {
  const QRGeneratorScreen({super.key});

  @override
  State<QRGeneratorScreen> createState() => _QRGeneratorScreenState();
}

class _QRGeneratorScreenState extends State<QRGeneratorScreen> {
  // Configuración de la wallet
  final String walletAddress = "TZ1MP76aV6mfQGcAuHQXQr6ZJ9VB9QKt2Ar"; // Reemplaza con tu dirección
  final String cryptoScheme = "tron"; // Cambia según tu red (tron, binance, etc.)
  final String amount = "5"; // Monto opcional en USDT

  String getCryptoUri() {
    if (amount.isNotEmpty) {
      return "$cryptoScheme:$walletAddress?amount=$amount";
    }
    return "$cryptoScheme:$walletAddress";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR para USDT'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Código QR
            QrImageView(
              data: getCryptoUri(),
              version: QrVersions.auto,
              size: 300.0,
              gapless: false,
              errorCorrectionLevel: QrErrorCorrectLevel.H, // Alta corrección
              // (Opcional) Añadir logo embebido
              embeddedImage: const AssetImage('assets/usdt_logo.png'),
              embeddedImageStyle: const QrEmbeddedImageStyle(
                size: Size(60, 60),
              ),
            ),
            const SizedBox(height: 20), // Espacio entre QR y texto
            // Dirección de la wallet debajo
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                walletAddress,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}