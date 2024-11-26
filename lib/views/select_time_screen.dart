// ignore_for_file: use_build_context_synchronously

import 'package:cinema_bono/methods/get_data_methods.dart';
import 'package:cinema_bono/methods/helper_methods.dart';
import 'package:cinema_bono/methods/login_method.dart';
import 'package:cinema_bono/common%20widget/background.dart';
import 'package:cinema_bono/common%20widget/general_button.dart';
import 'package:cinema_bono/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

List<int> selectedSeats = [];

class SelectTimeScreen extends StatefulWidget {
  const SelectTimeScreen({
    super.key,
    required this.movieDetails,
  });
  final Map<String, dynamic> movieDetails;

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

  late List<bool> seatsStatus;
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
                                    seatsStatus = List<bool>.filled(
                                        selectedHall == "1" ? 20 : 50, false);
                                    selectedSeats = [];
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
                          seatsStatus.length,
                          (index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  seatsStatus[index] = !seatsStatus[index];
                                  if (seatsStatus[index]) {
                                    selectedSeats.add(index);
                                  } else {
                                    selectedSeats.remove(index);
                                  }
                                });
                              },
                              child: Seat(
                                isSelected: seatsStatus[index],
                              ),
                            );
                          },
                        ),
                      ),
                    const SizedBox(height: 20),
                    GeneralButton(
                      onPressed: () async {
                        if (selectedDate != null &&
                            selectedTime != null &&
                            selectedHall != null &&
                            selectedSeats.isNotEmpty) {
                          showloading(context);
                          var userName = await getUserInfo();
                          List<Map<String, dynamic>> movies = await getMovies();
                          Navigator.pop(context);
                          showDialog(
                              context: context,
                              builder: (context) {
                                return const AlertDialog(
                                  title: Center(
                                      child: Icon(
                                    Icons.done,
                                    color: Colors.green,
                                    size: 50,
                                  )),
                                  content: Text("Booking successful!"),
                                );
                              });
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen(
                                      movies: movies,
                                      userName: userName ?? "Bono user",
                                    )),
                          );
                        } else {
                          showDialogCustom(context,
                              "Please select a date, time, hall, and at least one seat.");
                        }
                      },
                      text: 'Book',
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
    required this.isSelected,
  });

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? const Icon(
            Icons.chair,
            color: Colors.white,
            size: 50,
          )
        : const Icon(
            Icons.chair_outlined,
            color: Colors.white,
            size: 50,
          );
  }
}
