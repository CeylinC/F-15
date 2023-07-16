import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavBarController extends GetxController {
  var currentIndex = 0.obs;
  var fitnessSalon = ''.obs;
  var formattedDate = ''.obs;
  var selectedTimeFitness = ''.obs;
  var selectedDateFitness = ''.obs;
  var sportBaslik = ''.obs;
  var sportNerede = ''.obs;
  var sportKacKisi = 0.obs;
  var sportTarih = ''.obs;
  var sportZaman = ''.obs;
  var selectedSport = ''.obs;
  var basketball = false.obs;
  var football = false.obs;
  var other = false.obs;
  var sportTopVar = false.obs;
  var sportTopYok = false.obs;

  PageController myPage = PageController(initialPage: 0);
}
