import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_model/dio_service.dart';
import 'package:flutter_model/model.dart';
import 'package:flutter_model/states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitState());
  AppCubit get(context) => BlocProvider.of(context);
  ProductsModel? productsModel;
  List<ProductsModel?> product = [];
  var products;
  getProducts() {
    emit(AppGetProductsLoadingState());
    DioHelper.getData(
      'products',
    ).then((value) {
      products = value?.data;
      products.forEach((v) {
        productsModel = ProductsModel.fromJson(v);
        product.add(productsModel);
      });
      print(product[0]?.title);
      emit(AppGetProductsSucceedState());
    }).catchError((error) {
      print(error.toString());
      emit(AppGetProductsErrorState());
    });
  }
}
