import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_bills/view/dealer/view_table_dealer.dart';
import '../../core/test/test_analysis_charts.dart';
import '../../view/dealer/analysis_dealer.dart';
import '../../view/screen/analysis.dart';
import '../../view/screen/category.dart';
import '../../view/screen/home.dart';
import '../../view/screen/profile.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  static LayoutCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  int currentIndexDealer = 0;
  List titles = [
    'التحليل',
    'التصنيف',
    'التحليل',
    'الاعدادات',
  ];
  List titlesDealer = [
    'الرئسية',
    'المبيعات',
    'التحليل',
    'الاعدادات',
  ];
  List screens = [
    Home(),
    Category(),
    Analysis(),
    Profile(),
  ];
  List screensDealer = [
    Home(),
    ViewTableDealer(),
    AnalysisDealer(),
    Profile(),
  ];
  void changeCurrentIndex(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBar());
  }
  void changeCurrentIndexDealer(int index) {
    currentIndexDealer = index;
    emit(ChangeBottomNavBar());
  }
}
