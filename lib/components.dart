import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomModalButton extends StatelessWidget {
  final String buttonName;
  final int index;
  final RxInt yearIndexController;

  const CustomModalButton({
    required this.buttonName,
    required this.index,
    required this.yearIndexController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.only(right: 16, bottom: 24),
        child: TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            fixedSize: const Size.fromHeight(52),
            backgroundColor: yearIndexController.value == index
                ? const Color(0xff2BB8D6)
                : const Color(0xff9A9A9A).withOpacity(0.1),
          ),
          onPressed: () {
            yearIndexController.value = index;
          },
          child: Text(
            buttonName,
            style: TextStyle(
                color: yearIndexController.value == index
                    ? Colors.white
                    : const Color(0xff9A9A9A),
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}

class TermButton extends StatelessWidget {
  final String termName;
  final int index;
  final RxInt indexController;

  const TermButton({
    required this.termName,
    required this.index,
    required this.indexController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextButton(
        style: TextButton.styleFrom(
          fixedSize: const Size(116, 40),
          backgroundColor: indexController.value == index
              ? const Color(0xff2BB8D6)
              : Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: () {
          indexController.value = index;
        },
        child: Text(
          termName,
          style: TextStyle(
            color: indexController.value == index
                ? Colors.white
                : const Color(0xff30323D),
          ),
        ),
      ),
    );
  }
}

class EcaMarkRow extends StatelessWidget {
  final String ecaName;
  final String ecaGrade;
  final String ecaRemarks;
  final bool? isBold;
  const EcaMarkRow({
    required this.ecaName,
    required this.ecaGrade,
    required this.ecaRemarks,
    this.isBold = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        height: 56,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 8,
              child: Text(
                ecaName,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: isBold! ? FontWeight.w600 : FontWeight.w400),
                // textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 5,
              child: Text(
                ecaGrade,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: isBold! ? FontWeight.w600 : FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 5,
              child: Text(
                ecaRemarks,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: isBold! ? FontWeight.w600 : FontWeight.w400),
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MarkTile extends StatelessWidget {
  final String title;
  final String marks;
  const MarkTile({
    required this.title,
    required this.marks,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Container(
        height: 60,
        width: 89,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
            Text(
              marks,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class SubjectMarkRow extends StatelessWidget {
  final String subject;
  final String theory;
  final String practical;
  final String gradePoint;
  final String grade;
  final bool? isBold;

  const SubjectMarkRow({
    required this.subject,
    required this.theory,
    required this.practical,
    required this.gradePoint,
    required this.grade,
    this.isBold = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Container(
        height: 48,
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 7,
              child: Text(
                subject,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: isBold! ? FontWeight.w600 : FontWeight.w500),
              ),
            ),
            Expanded(
              flex: 4,
              child: Text(
                theory,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: isBold! ? FontWeight.w600 : FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 4,
              child: Text(
                practical,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: isBold! ? FontWeight.w600 : FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 4,
              child: Text(
                gradePoint,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: isBold! ? FontWeight.w600 : FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                grade,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: isBold! ? FontWeight.w600 : FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
