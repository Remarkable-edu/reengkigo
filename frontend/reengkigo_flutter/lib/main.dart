import 'package:flutter/material.dart';
import 'generated/login.pb.dart';
import 'dart:typed_data';
import 'ffi/reengkigo_ffi.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reengkigo Login Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _accountController = TextEditingController(text: 'rk0000');
  final TextEditingController _passwordController = TextEditingController(text: '16680503');
  
  bool _isLoading = false;
  String _result = '';

  Future<void> _performLogin() async {
    setState(() {
      _isLoading = true;
      _result = 'Logging in...';
    });

    try {
      // Create protobuf login request
      final loginRequest = LoginRequest()
        ..account = _accountController.text
        ..password = _passwordController.text;

      // Serialize to bytes
      final requestBytes = loginRequest.writeToBuffer();

      // Call FFI function
      final responseBytes = await ReengkigoFFI.login(Uint8List.fromList(requestBytes));

      if (responseBytes != null) {
        // Deserialize response
        final loginResponse = LoginResponse.fromBuffer(responseBytes);
        
        setState(() {
          _result = '''
Login Successful!

Account ID: ${loginResponse.auth.accountId}
Account Type ID: ${loginResponse.auth.accountTypeId}
Agency ID: ${loginResponse.auth.agencyId}
Academy ID: ${loginResponse.auth.academyId}
Account: ${loginResponse.auth.account}
State: ${loginResponse.auth.state}
''';
        });
      } else {
        setState(() {
          _result = 'Login failed: No response from server';
        });
      }
    } catch (e) {
      setState(() {
        _result = 'Login error: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Reengkigo Login Test'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Login with Protobuf + FFI',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            
            TextField(
              controller: _accountController,
              decoration: const InputDecoration(
                labelText: 'Account',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 16),
            
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24),
            
            ElevatedButton(
              onPressed: _isLoading ? null : _performLogin,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: _isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(color: Colors.white),
                    )
                  : const Text(
                      'Login',
                      style: TextStyle(fontSize: 18),
                    ),
            ),
            const SizedBox(height: 24),
            
            const Text(
              'Result:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.shade50,
                ),
                child: SingleChildScrollView(
                  child: Text(
                    _result.isEmpty ? 'No login attempt yet' : _result,
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _accountController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}