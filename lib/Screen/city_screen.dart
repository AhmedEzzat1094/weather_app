import 'package:flutter/material.dart';
import 'package:weather_app/Screen/weather_home.dart';

class CityScreen extends StatelessWidget {
  CityScreen({super.key});
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF676BD0),
      appBar: AppBar(
        title: const Text("Weather App"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _key,
          child: Column(
            children: [
              const SizedBox(
                height: 45,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "City required";
                  }
                  return null;
                },
                controller: _controller,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Enter City",
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              MaterialButton(
                height: 50,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                color: Colors.amber,
                onPressed: () {
                  if (_key.currentState!.validate()) {
                    _controller.clear();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) =>
                            WeatherHome(cityName: _controller.text)));
                  }
                },
                child: const Text(
                  "Fetch Weather",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
