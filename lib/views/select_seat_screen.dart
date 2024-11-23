// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'confirm_booking_screen.dart';

class SelectSeatScreen extends StatefulWidget {
  final Map<String, dynamic> movieDetails;
  final String time;

  const SelectSeatScreen(
      {super.key, required this.movieDetails, required this.time});

  @override
  _SelectSeatScreenState createState() => _SelectSeatScreenState();
}

class _SelectSeatScreenState extends State<SelectSeatScreen> {
  // A list of available seats (10 rows, 7 seats per row)
  List<List<bool>> seats = List.generate(
    10, // 10 rows
    (i) => List.generate(7, (j) => false), // 7 columns per row
  );

  // To keep track of selected seats
  List<String> selectedSeats = [];

  // List of row labels ("A", "B", "C", ..., "J")
  final List<String> rowLabels = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J"
  ];

  // Function to handle seat selection
  void toggleSeat(int row, int col) {
    setState(() {
      seats[row][col] = !seats[row][col]; // Toggle seat selection
      String seat = '${rowLabels[row]}${col + 1}'; // Seat label (e.g., A1, B2)

      if (seats[row][col]) {
        selectedSeats.add(seat); // Add seat to selected list
      } else {
        selectedSeats.remove(seat); // Remove seat from selected list
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Movie and time information
              Text(
                'Select your seats for ${widget.movieDetails["name"]} at ${widget.time}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFa6924b),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              // Grid of seats (10 rows, 7 columns)
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7, // 7 seats per row
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: 70, // 10 rows * 7 columns = 70 seats
                  itemBuilder: (context, index) {
                    int row = index ~/ 7; // Row number (0 to 9)
                    int col = index % 7; // Column number (0 to 6)

                    String seat =
                        '${rowLabels[row]}${col + 1}'; // Seat label (e.g., A1, B2)

                    return GestureDetector(
                      onTap: () {
                        toggleSeat(row, col); // Toggle seat selection on tap
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: seats[row][col]
                              ? const Color(0xFFA6924B) // Selected seat
                              : Colors.grey.shade300, // Available seat
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: seats[row][col]
                                ? const Color(0xFFA6924B)
                                : Colors.grey,
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            seat,
                            style: TextStyle(
                              color:
                                  seats[row][col] ? Colors.white : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Show selected seats
              if (selectedSeats.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Selected Seats: ${selectedSeats.join(', ')}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),

              // Confirm booking button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: selectedSeats.isEmpty
                      ? null
                      : () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ConfirmBookingScreen(
                                movieDetails: widget.movieDetails,
                                time: widget.time,
                                seats: selectedSeats.join(', '),
                              ),
                            ),
                          );
                        },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: const Color(0xFFA6924B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Confirm Booking',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
