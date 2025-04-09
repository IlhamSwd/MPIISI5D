import 'package:flutter/material.dart';
import 'models/time_model.dart';
import 'services/api_service.dart';

void main() {
  runApp(TimeApiApp());
}

class TimeApiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TimeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TimeScreen extends StatefulWidget {
  @override
  _TimeScreenState createState() => _TimeScreenState();
}

class _TimeScreenState extends State<TimeScreen> {
  late Future<TimeData> futureTimeData;

  @override
  void initState() {
    super.initState();
    futureTimeData = ApiService.fetchTimeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Waktu Amsterdam')),
      body: FutureBuilder<TimeData>(
        future: futureTimeData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildCenteredRow('Date', snapshot.data!.date),
                  buildCenteredRow('Time', snapshot.data!.time),
                  buildCenteredRow('TimeZone', snapshot.data!.timeZone),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildCenteredRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$label: ',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
