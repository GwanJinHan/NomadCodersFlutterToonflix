import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool isRunning = false;
  bool isResting = false;
  int currentTime = 25;
  late int totalSeconds = currentTime * 60;
  late int minute = totalSeconds ~/ 60;
  late String seconds = totalSeconds % 60 < 10
      ? (totalSeconds % 60).toString().padLeft(2, '0')
      : (totalSeconds % 60).toString();
  int rounds = 0;
  int cycle = 0;
  late Timer timer;

  void onSettedTimePressed(int time) {
    setState(() {
      if (isRunning) timer.cancel();
      isRunning = false;
      currentTime = time;
      totalSeconds = currentTime * 60;
      minute = totalSeconds ~/ 60;
      seconds = totalSeconds % 60 < 10
          ? (totalSeconds % 60).toString().padLeft(2, '0')
          : (totalSeconds % 60).toString();
    });
  }

  void onTick(Timer timer) {
    if (totalSeconds == 0 && !isResting) {
      setState(() {
        isRunning = false;
        timer.cancel();

        cycle += 1;
        if (cycle == 4) {
          cycle = 0;
          rounds += 1;
          isResting = true;
          totalSeconds = 5 * 60;
          minute = totalSeconds ~/ 60;
          seconds = totalSeconds % 60 < 10
              ? (totalSeconds % 60).toString().padLeft(2, '0')
              : (totalSeconds % 60).toString();
        }
      });
    } else if (totalSeconds == 0 && isResting) {
      setState(() {
        isResting = false;
        timer.cancel();
      });
    } else {
      if (isRunning) {
        setState(() {
          totalSeconds -= 1;
        });
      }
    }
  }

  void onPlayButtonPressed() {
    setState(
      () {
        timer = Timer.periodic(
          const Duration(seconds: 1),
          (timer) {
            setState(
              () {
                isRunning = true;
                totalSeconds = totalSeconds - 1;
                minute = totalSeconds ~/ 60;
                seconds = totalSeconds % 60 < 10
                    ? (totalSeconds % 60).toString().padLeft(2, '0')
                    : (totalSeconds % 60).toString();
                if (totalSeconds <= 0) {
                  timer.cancel();
                }
              },
            );
          },
        );
      },
    );
  }

  void onPauseButtonPressed() {
    setState(() {
      timer.cancel();
      isRunning = false;
    });
  }

  void onResetButtonPressed() {
    setState(() {
      isRunning = false;
      totalSeconds = currentTime * 60;
      minute = totalSeconds ~/ 60;
      seconds = totalSeconds % 60 < 10
          ? (totalSeconds % 60).toString().padLeft(2, '0')
          : (totalSeconds % 60).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFE64D3D),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const Flexible(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "POMOTIMER",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )),
              Flexible(
                flex: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 130,
                          height: 180,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            minute.toString(),
                            style: const TextStyle(
                              color: Color(0xFFE64D3D),
                              fontSize: 80,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(45),
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                        const SizedBox(
                          width: 40,
                          height: 30,
                        ),
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(45),
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 130,
                          height: 180,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Text(
                            seconds,
                            style: const TextStyle(
                              color: Color(0xFFE64D3D),
                              fontSize: 80,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 3,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => onSettedTimePressed(15),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white.withOpacity(0.7),
                        alignment: Alignment.center,
                        backgroundColor: const Color(0xFFE64D3D),
                        padding: const EdgeInsets.all(20),
                        side: BorderSide(
                          width: 2,
                          color: Colors.white.withOpacity(0.7),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "15",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                      onPressed: () => onSettedTimePressed(20),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white.withOpacity(0.7),
                        alignment: Alignment.center,
                        backgroundColor: const Color(0xFFE64D3D),
                        padding: const EdgeInsets.all(20),
                        side: BorderSide(
                          width: 2,
                          color: Colors.white.withOpacity(0.7),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "20",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                      onPressed: () => onSettedTimePressed(25),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white.withOpacity(0.7),
                        alignment: Alignment.center,
                        backgroundColor: const Color(0xFFE64D3D),
                        padding: const EdgeInsets.all(20),
                        side: BorderSide(
                          width: 2,
                          color: Colors.white.withOpacity(0.7),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "25",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                      onPressed: () => onSettedTimePressed(30),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white.withOpacity(0.7),
                        alignment: Alignment.center,
                        backgroundColor: const Color(0xFFE64D3D),
                        padding: const EdgeInsets.all(20),
                        side: BorderSide(
                          width: 2,
                          color: Colors.white.withOpacity(0.7),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "30",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                      onPressed: () => onSettedTimePressed(35),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white.withOpacity(0.7),
                        alignment: Alignment.center,
                        backgroundColor: const Color(0xFFE64D3D),
                        padding: const EdgeInsets.all(20),
                        side: BorderSide(
                          width: 2,
                          color: Colors.white.withOpacity(0.7),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "35",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 9,
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: isRunning
                            ? onPauseButtonPressed
                            : onPlayButtonPressed,
                        icon: isRunning
                            ? const Icon(Icons.pause_circle_filled)
                            : const Icon(Icons.play_circle_filled),
                        iconSize: 120,
                        color: Colors.black.withOpacity(0.3),
                      ),
                      Visibility(
                        visible: !isRunning,
                        child: TextButton(
                          onPressed: onResetButtonPressed,
                          child: const Text(
                            "RESET",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 5,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text("$rounds/4",
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w600,
                                color: Colors.white.withOpacity(0.4))),
                        const SizedBox(height: 20),
                        const Text(
                          "ROUND",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text("$cycle/4",
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w600,
                                color: Colors.white.withOpacity(0.4))),
                        const SizedBox(height: 20),
                        const Text(
                          "CYCLE",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
