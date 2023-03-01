import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter_getx/app/data/entertainment_response.dart';
import 'package:flutter_getx/app/data/headline_response.dart';
import 'package:flutter_getx/app/data/sports_response.dart';
import 'package:flutter_getx/app/data/technology_response.dart';
import 'package:flutter_getx/app/utils/api.dart';

class DashboardController extends GetxController {
  final _getConnect = GetConnect();
  //TODO: Implement DashboardController

  Future<headlineResponse> getHeadline() async {
    final response = await _getConnect.get(BaseUrl.headline);
    return headlineResponse.fromJson(jsonDecode(response.body));
  }

  Future<TechnologyResponse> getTechnology() async {
    final response = await _getConnect.get(BaseUrl.technology);
    return TechnologyResponse.fromJson(jsonDecode(response.body));
  }

  Future<SportsResponse> getSports() async {
    final response = await _getConnect.get(BaseUrl.sports);
    return SportsResponse.fromJson(jsonDecode(response.body));
  }

  Future<entertainmentResponse> getEntertaiment() async {
    final response = await _getConnect.get(BaseUrl.entertainment);
    return entertainmentResponse.fromJson(jsonDecode(response.body));
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void increment() => count.value++;
}
