import 'package:doctors/core/utils/assets.dart';
import 'package:doctors/data/models/doctor_register_model/AllDoctorsModel.dart';
import 'package:doctors/layouts/home/Choices/Doctors/view_model/all_doctors_view_model.dart';
import 'package:doctors/layouts/home/Choices/Doctors/view_model/all_doctors_view_model_state.dart';
import 'package:doctors/layouts/home/Choices/Doctors/widgets/doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorsScreen extends StatelessWidget {
  const DoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Image.asset(
            Assets.assetsImagesDoctorBackground,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.only(top: height * 0.04, left: width * 0.03),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 150),
              BlocBuilder<AllDoctorsViewModel, AllDoctorsViewModelState>(
                builder: (context, state) {
                  if (state is AllDoctorsViewModelSuccess) {
                    List<AllDoctorsModel> doctorsModel = state.allDoctorsModel;
                    return Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const Divider(),
                        itemBuilder: (context, index) {
                          return DoctorCard(
                            doctorsModel: doctorsModel[index],
                          );
                        },
                        itemCount: doctorsModel.length,
                      ),
                    );
                  } else if (state is AllDoctorsViewModelError) {
                    return const Center(
                      child:
                          Text("there are no doctors at the moment available"),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
