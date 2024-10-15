import 'package:flutter/material.dart';
import 'screens/home_screen.dart'; // Asegúrate de que este archivo tenga la clase HomeScreen
import 'screens/student_form.dart'; // Asegúrate de que este archivo tenga la clase StudentForm
import 'screens/student_list.dart'; // Asegúrate de que este archivo tenga la clase StudentList
import 'screens/chat_screen.dart'; // Asegúrate de que este archivo tenga la clase OtherScreen
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ',
      initialRoute: '/',
      routes: {
        '/': (context) => const MainScreen(),
        '/home': (context) => HomeScreen(),
        '/student_form': (context) =>  StudentForm(),
        '/student_list': (context) =>  StudentList(),
        '/other': (context) => const OtherScreen(),
        '/input_text': (context) => const InputAndTextScreen(),
        '/chat_screen': (context) => const ChatbotPage(),
        
      },
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(), // Página de HomeScreen
    StudentForm(), // Página de StudentForm
    const OtherScreen(), // Otra página
    const InputAndTextScreen(), // Página de Entrada de Texto
    const ChatbotPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menú de Navegación',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
                selectionColor: Colors.black,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('HomeScreen'),
              onTap: () {
                Navigator.pop(context); // Cierra el drawer
                setState(() {
                  _selectedIndex = 0; // Navega a HomeScreen
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.school),
              title: const Text('Student Form'),
              onTap: () {
                Navigator.pop(context); // Cierra el drawer
                setState(() {
                  _selectedIndex = 1; // Navega a StudentForm
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Otros'),
              onTap: () {
                Navigator.pop(context); // Cierra el drawer
                setState(() {
                  _selectedIndex = 2; // Navega a Otra Página
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.text_fields),
              title: const Text('Entrada de Texto'),
              onTap: () {
                Navigator.pop(context); // Cierra el drawer
                setState(() {
                  _selectedIndex = 3; // Navega a la Página de Entrada de Texto
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.adb),
              title: const Text('Chatbot'),
              onTap: () {
                Navigator.pop(context); // Cierra el drawer
                setState(() {
                  _selectedIndex = 4; // Navega a chatbot Página
                });
              },
            ),
          ],
        ),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            backgroundColor: Colors.black,
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Student Form',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.text_fields),
            label: 'Text Input',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.text_fields),
            label: 'Chatbot',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class OtherScreen extends StatelessWidget {
  const OtherScreen({super.key});

  Future<void> _launchGitHubUrl() async {
    const url = 'https://github.com/ManuelPeregrino/FlutterChatbot.git';
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'No se pudo abrir el enlace $url';
    }
  }

  // Método para hacer una llamada
  Future<void> _makePhoneCall() async {
    const telUrl = 'tel:+529612458375'; // Reemplaza con el número que desees marcar
    final Uri telUri = Uri.parse(telUrl);
    if (!await launchUrl(telUri, mode: LaunchMode.externalApplication)) {
      throw 'No se pudo iniciar la llamada: $telUrl';
    }
  }

  // Método para enviar un mensaje de texto
  Future<void> _sendMessage() async {
    const smsUrl = 'sms:+529612458375'; // Reemplaza con el número al que quieras enviar el mensaje
    final Uri smsUri = Uri.parse(smsUrl);
    if (!await launchUrl(smsUri, mode: LaunchMode.externalApplication)) {
      throw 'No se pudo enviar el mensaje: $smsUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Other Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/fotopere.jpeg'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Universidad Politécnica de Chiapas',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Nombre del Alumno: Manuel Alejandro Peregrino Clemente',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            const Text(
              'Matrícula: 221324',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _launchGitHubUrl,
              child: const Text('Enlace a GitHub'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _makePhoneCall,
              child: const Text('Llamar al número'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _sendMessage,
              child: const Text('Mandar mensaje'),
            ),
          ],
        ),
      ),
    );
  }
}

class InputAndTextScreen extends StatefulWidget {
  const InputAndTextScreen({super.key});

  @override
  State<InputAndTextScreen> createState() => _InputAndTextScreenState();
}

class _InputAndTextScreenState extends State<InputAndTextScreen> {
  final TextEditingController _inputController = TextEditingController();
  String _displayText = '';

  void _updateText() {
    setState(() {
      _displayText = _inputController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrada de Texto'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _inputController,
              decoration: const InputDecoration(
                labelText: 'Ingrese texto',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateText,
              child: const Text('Actualizar Texto'),
            ),
            const SizedBox(height: 20),
            Container(
              width: 370,
              height: 200,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Text(
                _displayText,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
