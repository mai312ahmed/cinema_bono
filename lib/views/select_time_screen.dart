import 'package:cinema_bono/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

List<int> selectedSeats = [];

class SelectTimeScreen extends StatefulWidget {
  const SelectTimeScreen(
      {super.key, required this.movieDetails, required this.hallsDetails});
  final Map<String, dynamic> movieDetails;
  final Map<String, dynamic> hallsDetails;
  @override
  SelectTimeScreenState createState() => SelectTimeScreenState();
}

class SelectTimeScreenState extends State<SelectTimeScreen> {
  List<String> dateOptions = [];

  String? selectedDate;
  String? selectedTime;

  @override
  void initState() {
    super.initState();
    generateDateOptions();
  }

  void generateDateOptions() {
    DateTime currentDate = DateTime.now();
    for (int i = 0; i < 20; i++) {
      DateTime date = currentDate.add(Duration(days: i));
      String formattedDate = DateFormat('EEEE, yyyy-MM-dd')
          .format(date); // مثال: Friday, 2024-11-22
      dateOptions.add(formattedDate);
    }
  }

  String? selectedHall;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Background(
            image: 'assets/images/img2.jpeg',
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildDropdown(
                      hint: 'Select a date',
                      value: selectedDate,
                      items: dateOptions,
                      onChanged: (value) {
                        setState(() {
                          selectedDate = value;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    buildDropdown(
                      hint: 'Select a time',
                      value: selectedTime,
                      items: widget.movieDetails["showTimes"].cast<String>(),
                      onChanged: (value) {
                        setState(() {
                          selectedTime = value;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                          widget.movieDetails["hallIds"].length,
                          (index) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedHall =
                                        widget.movieDetails["hallIds"][index];
                                  });
                                },
                                child: Hall(
                                  isSelected: selectedHall ==
                                      widget.movieDetails["hallIds"][index],
                                  hallNumber: widget.movieDetails["hallIds"]
                                      [index],
                                ),
                              )),
                    ),
                    const SizedBox(height: 20),
                    if (selectedHall != null)
                      Wrap(
                        children: List.generate(
                          20,
                          (index) {
                            return Seat(
                              seatNumber: index + 1,
                              isSelected: false,
                            );
                          },
                        ),
                      ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () {
                        if (selectedDate != null && selectedTime != null) {
                          // حفظ القيم المحددة
                          print('Selected Date: $selectedDate');
                          print('Selected Time: $selectedTime');
                        } else {
                          print('Please select both date and time.');
                        }
                      },
                      child: const Text('Save'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDropdown({
    required String hint,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: DropdownButton<String>(
        value: value,
        isExpanded: true,
        underline: const SizedBox(),
        hint: Text(hint),
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}

class Hall extends StatelessWidget {
  const Hall({
    super.key,
    required this.hallNumber,
    required this.isSelected,
  });
  final String hallNumber;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 120,
      decoration: BoxDecoration(
          color: isSelected ? Colors.purple.shade50 : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 3,
            color: isSelected ? Colors.purple : Colors.white,
          )),
      child: Center(
        child: Text("Hall $hallNumber"),
      ),
    );
  }
}

class Seat extends StatelessWidget {
  const Seat({
    super.key,
    required this.seatNumber,
    required this.isSelected,
  });
  final int seatNumber;

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? const Icon(
            Icons.chair,
            color: Colors.white,
            size: 35,
          )
        : const Icon(
            Icons.chair_outlined,
            color: Colors.white,
            size: 35,
          );
  }
}
