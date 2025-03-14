import 'dart:convert';

import 'package:divkit/divkit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:remote/main.dart';

class DivKitPage extends StatefulWidget {
  const DivKitPage({super.key});

  @override
  _DivKitPageState createState() => _DivKitPageState();
}

class _DivKitPageState extends State<DivKitPage> {
  bool isLoading = false;
  String? errorMessage;
  DefaultDivKitData? data;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
      data = null;
    });

    try {
      final response = await http.get(
        Uri.http('84.201.148.80:8080', '/launch'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        setState(() {
          data = DefaultDivKitData.fromJson(responseData);
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = 'Failed to load data with statusCode: ${response.statusCode}';
          isLoading = false;
        });
      }
    } catch (error) {
      setState(() {
        errorMessage = 'Error: $error';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFfdeda4),
        title: const Text('Подробнее'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return RfwPage();
            },
          )),
        ),
      ),
      backgroundColor: const Color(0xFFF3EDF7),
      body: SafeArea(
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator()
              : errorMessage != null
                  ? errorWidget(errorMessage!)
                  : DivKitView(
                      data: data!,
                      //customHandler: MyCustomHandler(), // DivCustomHandler?
                      //actionHandler: MyCustomActionHandler(), // DivActionHandler?
                      variableStorage: DefaultDivVariableStorage(),
                    ),
        ),
      ),
    );
  }

  Widget errorWidget(String errorMessage) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(errorMessage),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: fetchData,
          child: const Text("Retry"),
        ),
      ],
    );
  }
}
