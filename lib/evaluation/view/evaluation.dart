import 'package:expense_tracker/evaluation/blocs/bloc/selected_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class EvaluationPage extends StatelessWidget {
  const EvaluationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 80,
          ),
          Text("Evaluation",
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                CurrentPreviousButton(),
                SizedBox(
                  height: 40,
                ),
                BlocBuilder<SelectedBloc, SelectedState>(
                    builder: (context, state) {
                  return Container(
                    height: 180,
                    width: 350,
                    color: Colors.red,
                  );
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CurrentPreviousButton extends StatelessWidget {
  const CurrentPreviousButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            context.read<SelectedBloc>().add(SelectCurrent());
          },
          child: BlocBuilder<SelectedBloc, SelectedState>(
            builder: (context, state) {
              return Container(
                  height: state is Current ? 55 : 45,
                  width: 120,
                  decoration: BoxDecoration(
                      color: state is Current ? Colors.purple : Colors.white,
                      border: state is Current
                          ? Border.all()
                          : Border(
                              top: BorderSide(width: 3, color: Colors.purple),
                              left: BorderSide(width: 3, color: Colors.purple),
                              bottom:
                                  BorderSide(width: 3, color: Colors.purple),
                            ),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          bottomLeft: Radius.circular(40))),
                  alignment: Alignment(0, 0),
                  child: Text(
                    "Current",
                    style: TextStyle(
                      color: state is Current ? Colors.white : Colors.black,
                      fontSize: 20,
                      fontWeight: state is Current
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ));
            },
          ),
        ),
        GestureDetector(
          onTap: () {
            context.read<SelectedBloc>().add(SelectPrevious());
          },
          child: BlocBuilder<SelectedBloc, SelectedState>(
            builder: (context, state) {
              return Container(
                  height: state is Previous ? 55 : 45,
                  width: 120,
                  decoration: BoxDecoration(
                      color: state is Previous ? Colors.purple : Colors.white,
                      border: state is Previous
                          ? Border.all()
                          : Border(
                              top: BorderSide(width: 3, color: Colors.purple),
                              right: BorderSide(width: 3, color: Colors.purple),
                              bottom:
                                  BorderSide(width: 3, color: Colors.purple),
                            ),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          bottomRight: Radius.circular(40))),
                  alignment: Alignment(0, 0),
                  child: Text(
                    "Previous",
                    style: TextStyle(
                      color: state is Previous ? Colors.white : Colors.black,
                      fontSize: 20,
                      fontWeight: state is Previous
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ));
            },
          ),
        ),
      ],
    );
  }
}
