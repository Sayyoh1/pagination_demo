import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:pagenation_demo/data/models/ModelPagination.dart';

class GetRequest extends ChangeNotifier {
  List<Results> character = [];
  int? lastPage;
  int currentPage = 1;

  Future getNewRequests() async {
    if (lastPage == null){
      await firstGetRequests();
      notifyListeners();
    }else{
      if (lastPage! > currentPage) {
        currentPage++;
        await getRequests();
        notifyListeners();
      } else if (lastPage == currentPage) {
        return true;
      }
    }
  }

  Future<void> firstGetRequests() async {
    ModelPagination? data;
    final response = await http.get(Uri.parse('https://rickandmortyapi.com/api/character/?page=$currentPage'));
    if (response.statusCode == 200) {
      data = ModelPagination.fromJson(jsonDecode(response.body));
      if(data.info?.pages != null){
        lastPage = data.info?.pages!.toInt();
      }
      if(data.results != null){
        character.addAll(data.results!);
      }
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> getRequests() async {
    ModelPagination? data;
    final response = await http.get(Uri.parse('https://rickandmortyapi.com/api/character/?page=$currentPage'));
    if (response.statusCode == 200) {
      data = ModelPagination.fromJson(jsonDecode(response.body));
      if(data.info?.pages != null){
        lastPage = data.info?.pages!.toInt();
      }
      if(data.results != null){
        character.addAll(data.results!);
      }
    } else {
      throw Exception('Failed to load data');
    }
  }
}