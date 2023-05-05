import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medhavi/components.dart';
import 'package:medhavi/controller/result_controller.dart';

class Result extends StatelessWidget {
  const Result({super.key});

  @override
  Widget build(BuildContext context) {
    ResultController resultController = Get.put(ResultController());

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Divider(color: Colors.grey.shade300, height: 0.1),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.arrow_back)),
                      const Text(
                        'Result',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Divider(color: Colors.grey.shade300, height: 0.1),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 40,
                        width: 112,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: const Color(0xff2BB8D6),
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {
                            showModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              context: context,
                              builder: (context) => Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(height: 16),
                                    Container(
                                      alignment: Alignment.topCenter,
                                      width: 40,
                                      height: 4,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    const Text(
                                      'Select year',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(height: 16),
                                    const Divider(
                                        height: 2, color: Colors.grey),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Wrap(
                                        children: [
                                          CustomModalButton(
                                            buttonName:
                                                resultController.yearList[0],
                                            index: 0,
                                            yearIndexController:
                                                resultController
                                                    .yearIndexController,
                                          ),
                                          CustomModalButton(
                                            buttonName:
                                                resultController.yearList[1],
                                            index: 1,
                                            yearIndexController:
                                                resultController
                                                    .yearIndexController,
                                          ),
                                          CustomModalButton(
                                            buttonName:
                                                resultController.yearList[2],
                                            index: 2,
                                            yearIndexController:
                                                resultController
                                                    .yearIndexController,
                                          ),
                                          CustomModalButton(
                                            buttonName:
                                                resultController.yearList[3],
                                            index: 3,
                                            yearIndexController:
                                                resultController
                                                    .yearIndexController,
                                          ),
                                          CustomModalButton(
                                            buttonName:
                                                resultController.yearList[4],
                                            index: 4,
                                            yearIndexController:
                                                resultController
                                                    .yearIndexController,
                                          ),
                                          CustomModalButton(
                                            buttonName:
                                                resultController.yearList[5],
                                            index: 5,
                                            yearIndexController:
                                                resultController
                                                    .yearIndexController,
                                          ),
                                          CustomModalButton(
                                            buttonName:
                                                resultController.yearList[6],
                                            index: 6,
                                            yearIndexController:
                                                resultController
                                                    .yearIndexController,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'This year',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              Icon(Icons.keyboard_arrow_down,
                                  color: Colors.black),
                            ],
                          ),
                        ),
                      ),
                      //
                      const SizedBox(width: 16)
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    height: 56,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        const SizedBox(width: 16),
                        TermButton(
                          termName: 'Final',
                          index: 0,
                          indexController: resultController.termIndexController,
                        ),
                        TermButton(
                          termName: '3rd term',
                          index: 1,
                          indexController: resultController.termIndexController,
                        ),
                        TermButton(
                          termName: '2nd term',
                          index: 2,
                          indexController: resultController.termIndexController,
                        ),
                        TermButton(
                          termName: '1st term',
                          index: 3,
                          indexController: resultController.termIndexController,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView(
                  children: [
                    Row(
                      children: [
                        MarkTile(
                            title: 'GPA',
                            marks: resultController.userMarkDetailsData.gpa),
                        const Spacer(),
                        MarkTile(
                            title: 'Grade',
                            marks: resultController.userMarkDetailsData.grade),
                        const Spacer(),
                        MarkTile(
                            title: 'Position',
                            marks:
                                resultController.userMarkDetailsData.position),
                        const Spacer(),
                        MarkTile(
                            title: 'Attendance',
                            marks: resultController
                                .userMarkDetailsData.attendence),
                      ],
                    ),
                    const SubjectMarkRow(
                      subject: 'Subject',
                      theory: 'Theory',
                      practical: 'Practical',
                      gradePoint: 'Grade Point',
                      grade: 'Grade',
                      isBold: true,
                    ),
                    for (var item in resultController.getSubjectMarkRowList())
                      item,
                    const EcaMarkRow(
                      ecaName: 'ECA',
                      ecaGrade: 'Grade',
                      ecaRemarks: 'Remarks',
                      isBold: true,
                    ),
                    for (var item in resultController.getEcaMarkRowList()) item,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// const EcaMarkRow(
//   ecaName: 'Dancing',
//   ecaGrade: 'A',
//   ecaRemarks: 'Excellent',
// ),
// const EcaMarkRow(
//   ecaName: 'Cursive',
//   ecaGrade: 'A',
//   ecaRemarks: 'Good',
// ),
// const EcaMarkRow(
//   ecaName: 'Karate',
//   ecaGrade: 'A',
//   ecaRemarks: 'Very Good',
// ),

// SubjectMarkRow(
//   subject: resultController.subjectData[0].subjectName,
//   theory: 'A',
//   practical: 'A+',
//   gradePoint: '3.6',
//   grade: 'A',
// ),
// const SubjectMarkRow(
//   subject: 'Com. maths',
//   theory: 'A+',
//   practical: "-",
//   gradePoint: '4.0',
//   grade: 'A+',
// ),
// const SubjectMarkRow(
//   subject: 'Nepali',
//   theory: 'A+',
//   practical: 'A',
//   gradePoint: '3.6',
//   grade: 'A',
// ),
// const SubjectMarkRow(
//   subject: 'English',
//   theory: 'B',
//   practical: 'A+',
//   gradePoint: '3.6',
//   grade: 'A',
// ),
// const SubjectMarkRow(
//   subject: 'Social',
//   theory: 'A+',
//   practical: 'A+',
//   gradePoint: '4.0',
//   grade: 'A+',
// ),
// const SubjectMarkRow(
//     subject: 'EPH',
//     theory: 'A',
//     practical: 'B+',
//     gradePoint: '3.2',
//     grade: 'B'),
// const SubjectMarkRow(
//     subject: 'Account(E)',
//     theory: 'A+',
//     practical: 'A+',
//     gradePoint: '3.6',
//     grade: 'A'),
// const SubjectMarkRow(
//   subject: 'Opt.maths(E)',
//   theory: 'A+',
//   practical: '-',
//   gradePoint: '4.0',
//   grade: 'A',
// ),
// Container(
//   height: 40,
//   padding: const EdgeInsets.symmetric(
//       horizontal: 20, vertical: 8),
//   decoration: BoxDecoration(
//     border: Border.all(color: Colors.blue),
//     borderRadius: BorderRadius.circular(20),
//   ),
//   child: Obx(
//     () => DropdownButton<String>(
//       value: dropdownValue.value,
//       icon: const Icon(Icons.keyboard_arrow_down),
//       underline: Container(),
//       items: yearList.map((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//       onChanged: (String? value) {
//         dropdownValue.value = value!;
//       },
//     ),
//   ),
// ),
