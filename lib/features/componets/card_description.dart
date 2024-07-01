import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DescriptionCard extends StatefulWidget {
  const DescriptionCard({super.key});

  @override
  _DescriptionCardState createState() => _DescriptionCardState();
}

class _DescriptionCardState extends State<DescriptionCard> {
  List<String> todayIngredients = [];
  List<String> tomorrowIngredients = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });

    // Replace with your API endpoint
    String apiUrl = 'https://api.example.com/ingredients';

    try {
      // Fetch data from API
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        // Parse JSON response
        Map<String, dynamic> data = jsonDecode(response.body);

        setState(() {
          todayIngredients = List<String>.from(data['today']);
          tomorrowIngredients = List<String>.from(data['tomorrow']);
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        throw Exception('Failed to load data');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ingredientes de Hoje:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: todayIngredients.length,
                  itemBuilder: (context, index) {
                    return Text(todayIngredients[index]);
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Ingredientes de Amanhã:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: tomorrowIngredients.length,
                  itemBuilder: (context, index) {
                    return Text(tomorrowIngredients[index]);
                  },
                ),
              ],
            ),
    );
  }
}
