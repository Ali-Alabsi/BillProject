import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_bills/core/apis/api_consumer.dart';

import '../../core/apis/end_points.dart';
import '../../core/error/error_exception.dart';
import '../../model/categories_model.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit({required this.apiConsumer}) : super(CategoryInitial());
  ApiConsumer apiConsumer;
  CategoriesModel? categoriesList;
  void getCategories() async {
    print('categoriesModel');
   try {
     emit(CategoryLoading());
     final response = await apiConsumer.get(EndPoints.categories);
     categoriesList = CategoriesModel.fromJson(response);
     emit(CategoryLoaded());
   }on ServerException catch (e) {
     emit(CategoryError(errorMessage: e.errorModel.errorMessage));
   }catch (e) {
     emit(CategoryError(errorMessage:'حدث خطأ ما'));
   }
  }
}
