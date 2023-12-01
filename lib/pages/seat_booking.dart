import 'package:flutter/material.dart';

class SeatBookingScreen extends StatefulWidget {
  const SeatBookingScreen({super.key});

  @override
  _SeatBookingScreenState createState() => _SeatBookingScreenState();
}

class _SeatBookingScreenState extends State<SeatBookingScreen> {
  bool isSingleSeatSelected = false;
  List<int> selectedSeats = [];

  Set<int> bookedSeats = {3, 7, 11, 21, 25};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seat Booking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Select Your Seats',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            ToggleButtons(
              isSelected: [isSingleSeatSelected, !isSingleSeatSelected],
              onPressed: (index) {
                setState(() {
                  isSingleSeatSelected = index == 0;
                  selectedSeats.clear();
                });
              },
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Single'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Multi'),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: 30,
              itemBuilder: (context, index) {
                final seatNumber = index + 1;
                final isSeatBooked = bookedSeats.contains(seatNumber);
                final isSelected = selectedSeats.contains(seatNumber);

                return GestureDetector(
                  onTap: () {
                    if (!isSeatBooked) {
                      setState(() {
                        if (isSingleSeatSelected) {
                          selectedSeats.clear();
                        }
                        isSelected
                            ? selectedSeats.remove(seatNumber)
                            : selectedSeats.add(seatNumber);
                      });
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSeatBooked
                          ? Colors.red
                          : isSelected
                              ? Colors.blue
                              : Colors.grey,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      seatNumber.toString(),
                      style: TextStyle(
                        color: isSeatBooked ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _showConfirmationDialog();
              },
              child: const Text('Book Seats'),
            ),
          ],
        ),
      ),
    );
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Reservation Completed'),
          content: const Text('Your seats have been successfully booked.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
