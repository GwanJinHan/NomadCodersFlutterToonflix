import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final Color bgColor;
  final List<String> titleText;
  final List<String> people;
  final List<String> dates;

  const CardWidget({
    super.key,
    required this.bgColor,
    required this.titleText,
    required this.people,
    required this.dates,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(45)),
      ),
      child: Padding(
          padding: const EdgeInsets.all(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    dates[0],
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    dates[1],
                    style: const TextStyle(fontSize: 20),
                  ),
                  const Icon(
                    Icons.arrow_drop_down_outlined,
                    color: Colors.black,
                  ),
                  Text(
                    dates[2],
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    dates[3],
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titleText[0],
                    style: const TextStyle(
                        fontSize: 60, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    titleText[1],
                    style: const TextStyle(
                        fontSize: 60, fontWeight: FontWeight.bold),
                  ),
                  Transform.translate(
                      offset: const Offset(0, 15),
                      child: Row(
                        children: [
                          Text("ALEX",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.5))),
                          const SizedBox(
                            width: 30,
                          ),
                          Text("HELENA",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.5))),
                          const SizedBox(
                            width: 30,
                          ),
                          Text("NANA",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.5))),
                        ],
                      ))
                ],
              )
            ],
          )),
    );
  }
}
