import 'package:flutter/material.dart';

void main() {
  runApp(InmobiliariaPoloApp());
}

class InmobiliariaPoloApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ContactPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              color: Colors.teal,
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Center(
                child: Text(
                  '¡Llamanos!(656)123-4567',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Inmobiliaria\nPolo',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Icon(Icons.home_work, size: 48),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.lightBlue[100],
              child: Center(
                child: Text(
                  '¡Hola! haz nos saber como podemos ayudarte',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 10),
            _buildTextField(label: 'Nombre:'),
            _buildTextField(label: 'Correo Electronico:'),
            _buildTextField(label: '¿Como te podemos ayudar?', maxLines: 5),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ServicesPage()),
                );
              },
              child: Text(
                'Enviar',
                style: TextStyle(color: Colors.white, letterSpacing: 2),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({required String label, int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.lightBlue[100],
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

class ServicesPage extends StatelessWidget {
  final List<String> services = [
    'Diseño de planos arquitectónicos',
    'Supervisión de obra',
    'Construcción de casas residenciales',
    'Remodelación de interiores',
    'Ampliación de espacios habitacionales',
    'Construcción de oficinas y locales',
    'Instalaciones eléctricas y plomería'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('INMOBILIARIAPOLO'),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'SERVICIOS',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ...services.map((service) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    children: [
                      Icon(Icons.construction, size: 20, color: Colors.teal),
                      SizedBox(width: 10),
                      Expanded(child: Text(service)),
                    ],
                  ),
                )),
            SizedBox(height: 30),
            Text(
              'Construcción de calidad',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Información'),
                    content: Text(
                      'Nos especializamos en ofrecer construcción de calidad '
                      'utilizando materiales duraderos, mano de obra calificada '
                      'y procesos eficientes que garantizan resultados seguros y estéticos.',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Cerrar'),
                      )
                    ],
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
              ),
              child: Text('Obten más información'),
            )
          ],
        ),
      ),
    );
  }
}
