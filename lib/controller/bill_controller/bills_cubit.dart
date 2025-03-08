import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_bills/core/error/error_exception.dart';
import 'package:project_bills/model/bill_model.dart';

import '../../core/apis/api_consumer.dart';
import '../../core/apis/end_points.dart';

part 'bills_state.dart';

class BillsCubit extends Cubit<BillsState> {
  BillsCubit({required this.apiConsumer}) : super(BillsInitial());
  ApiConsumer apiConsumer;
  File? image;
  final picker = ImagePicker();

  static BillsCubit get(context) => BlocProvider.of(context);
  TextEditingController titleController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  GlobalKey<FormState> formKeyBill = GlobalKey();

  addBill(context) async {}

  Future getImage() async {
    try {
      emit(BillsLoadingImage());
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        image = File(pickedFile.path);
        emit(BillsLoadedImage());
        print('-------------------------');
        print(image?.path);
      } else {
        print('No image selected.');
      }
    } catch (e) {
      // emit(UsersError());
    }
  }

  createBill(context) async {
    emit(BillsCreateLoading());
    // Navigator.pop(context);

    print('createBill');

    try {
      BillModel billModel = BillModel(
          title: titleController.text,
          billNumber: idController.text,
          amount: amountController.text,
          details: detailsController.text,
          image: image?.path ?? '',
          categoryId: 1);
      final result = await apiConsumer.post(EndPoints.createBill,
          data: billModel.toJson());
      print(result);
      emit(BillsCreateLoaded());
    } on ServerException catch (e) {
      emit(BillsCreateError(message: e.errorModel.errorMessage));
    } catch (e) {
      emit(BillsCreateError(message: 'حدث خطأ ما'));
    }
  }

  clearData() {
    titleController.clear();
    idController.clear();
    amountController.clear();
    dateController.clear();
    categoryController.clear();
    detailsController.clear();
    image = null;
  }

  List<BillModel> bills = [];

  getBills() async {
    emit(BillsLoading());
    try {
      final result = await apiConsumer.get(EndPoints.bills);
      print(result['data']);
      bills = List<BillModel>.from(result['data'].map((x) => BillModel.fromJson(x)));
      print('billss ${bills.length}');
      emit(BillsLoaded());
    } on ServerException catch (e) {
      emit(BillsError(message: e.errorModel.errorMessage));
    } catch (e) {
      print('error $e');
      emit(BillsError(message: 'حدث خطأ ما'));
    }
  }
}
