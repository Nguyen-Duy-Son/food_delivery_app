import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/enum/load_status.dart';
import 'package:food_delivery_app/core/repositories/home_repository.dart';
import 'package:food_delivery_app/di.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());
  final  homeRepository = getIt<HomeRepository>();
}
