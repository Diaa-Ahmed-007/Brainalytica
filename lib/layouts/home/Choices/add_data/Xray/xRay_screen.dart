import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:doctors/core/utils/assets.dart';
import 'package:doctors/data/models/XrayResponseModel.dart';
import 'package:doctors/di/di.dart';
import 'package:doctors/layouts/Flows/widgets/Custom_button.dart';
import 'package:doctors/layouts/home/Choices/add_data/Xray/view_model/analysis_view_model.dart';
import 'package:doctors/layouts/home/Choices/add_data/Xray/view_model/xray_view_model.dart';
import 'package:doctors/layouts/home/Choices/add_data/Xray/view_model/xray_view_model_states.dart';
import 'package:doctors/layouts/home/Choices/add_data/provider/analysis_data_provider.dart';
import 'package:doctors/layouts/home/Choices/add_data/provider/save_xray_results_provider.dart';
import 'package:doctors/layouts/home/Choices/add_data/provider/upload_provider.dart';
import 'package:doctors/layouts/home/Choices/add_data/widgets/add_analysis_data.dart';
import 'package:doctors/layouts/home/Choices/add_data/widgets/result_widget.dart';
import 'package:doctors/layouts/home/Choices/add_data/widgets/upload_button.dart';
import 'package:doctors/layouts/home/Choices/add_data/widgets/upload_buttons_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class XrayScreen extends StatelessWidget {
  XrayScreen({super.key});

  Future<void> pickImage(BuildContext context, ImageSource source) async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? xfile = await picker.pickImage(source: source);

      if (xfile == null) {
        log("No image selected.");
        return;
      }

      UploadProvider provider =
          Provider.of<UploadProvider>(context, listen: false);
      provider.setFile(File(xfile.path));
      provider.changeIsShown(false);

      XrayViewModel.get(context).upload(filePath: provider.file!.path);
    } catch (e) {
      log("Image picking error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("Failed to pick image. Please try again.")),
      );
    }
  }

  void bottomSheetAddData(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return BlocProvider(
          create: (context) => getIt<AnalysisViewModel>(),
          child: const AddAnalysisData(),
        );
      },
    );
  }

  XrayResponseModel xrayResponseModel = XrayResponseModel();

  @override
  Widget build(BuildContext context) {
    final prediction = context.watch<AnalysisDataProvider>().prediction;
    print("🔁 Prediction value: $prediction");

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    UploadProvider uploadProvider = Provider.of<UploadProvider>(context);
    SaveXrayResultsProvider saveXrayResultsProvider =
        Provider.of<SaveXrayResultsProvider>(context);
    File? file = uploadProvider.file;
    return BlocListener<XrayViewModel, XrayViewModelState>(
      listener: (context, state) {
        if (state is XrayViewModeSuccess) {
          xrayResponseModel = state.xrayResponseModel;
          log(xrayResponseModel.strokeDetection ?? "");
          log(xrayResponseModel.strokeClassification ?? "");
          saveXrayResultsProvider.changeStrokeClassification(
              xrayResponseModel.strokeClassification ?? "");
          saveXrayResultsProvider
              .changeStrokeDetection(xrayResponseModel.strokeDetection ?? "");
          uploadProvider.changeIsShown(false);
        }
        if (state is XrayViewModeError) {
          log(state.error);
        }
        showDialog(
          context: context,
          builder: (context) =>
              const Center(child: CircularProgressIndicator()),
        );
        Navigator.pop(context);
      },
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              Assets.assetsImagesXRayBackground,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                const Text(
                  "Patients",
                  style: TextStyle(
                    color: Color(0xffb8cfe1),
                    fontSize: 50,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: height * 0.1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    UploadButton(
                      height: height,
                      width: width,
                      onTap: () {
                        bottomSheetAddData(context);
                      },
                      title: "Analysis",
                    ),
                    SizedBox(width: width * 0.1),
                    UploadButton(
                      height: height,
                      width: width,
                      onTap: () {
                        uploadProvider.changeIsShown(true);
                      },
                      title: "x_ray",
                    ),
                  ],
                ),
                SizedBox(height: height * 0.07),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: height * 0.07,
                          width: double.infinity,
                          child: CustomButton(
                            title: "SAVE",
                            ontap: () => bottomSheetAddData(context),
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
                      SizedBox(width: width * 0.1),
                      Expanded(
                        child: SizedBox(
                          height: height * 0.07,
                          width: double.infinity,
                          child: CustomButton(
                            title: "EDIT",
                            ontap: () {},
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.03),
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "status_report",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                if (file != null)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      width: double.infinity,
                      height: height * 0.27,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: FileImage(file),
                          fit: BoxFit.cover,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                  ),
                SizedBox(height: height * 0.03),
                ResultsWidget(
                  height: height,
                  width: width,
                  title: "stroke_Detection",
                  result: saveXrayResultsProvider.strokeDetection,
                ),
                SizedBox(height: height * 0.03),
                ResultsWidget(
                  height: height,
                  width: width,
                  title: "stroke_classification",
                  result: saveXrayResultsProvider.strokeClassification,
                ),
                SizedBox(height: height * 0.05),
                Consumer<AnalysisDataProvider>(
                  builder: (context, provider, _) {
                    return ResultsWidget(
                      height: height,
                      width: width,
                      title: "prediction",
                      result: provider.prediction,
                    );
                  },
                ),
                SizedBox(height: height * 0.05),
                Consumer<AnalysisDataProvider>(
                  builder: (context, provider, _) {
                    return ResultsWidget(
                      height: height,
                      width: width,
                      title: "probability",
                      result: provider.probability.toString(),
                    );
                  },
                ),
                SizedBox(height: height * 0.05),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: SizedBox(
                    height: height * 0.07,
                    child: CustomButton(
                      title: "cancel",
                      ontap: () {
                        Navigator.pop(context);
                      },
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.02),
              ],
            ),
            Visibility(
              visible: uploadProvider.isShown,
              child: Align(
                alignment: Alignment.center,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () =>
                                  uploadProvider.changeIsShown(false),
                              icon: const Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                        UploadButtonsWidget(
                          title: "Gallery",
                          onTap: () => pickImage(context, ImageSource.gallery),
                        ),
                        const SizedBox(height: 30),
                        UploadButtonsWidget(
                          title: "Camera",
                          onTap: () => pickImage(context, ImageSource.camera),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
