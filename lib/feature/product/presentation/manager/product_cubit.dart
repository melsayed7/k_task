import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:k_task/feature/product/data/model/product_model.dart';
import 'package:k_task/feature/product/data/repo/product_repo.dart';
import 'package:k_task/feature/product/presentation/manager/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(InitialState());

  ProductModel? productModel;
  bool isViewHorizontal = false;
  List<XFile> productImages = [];
  String? classificationSelected;

  Future<ProductModel?> getProducts() async {
    ProductRepo.getProducts().then((value) async {
      productModel = ProductModel.fromJson(value);
      print(productModel?.products![0].name);
      emit(SuccessGetAllProduct());
    }).catchError((onError) {
      emit(ErrorProduct());
    });
    return productModel;
  }

  void changeHomeView() {
    isViewHorizontal = !isViewHorizontal;
    emit(SuccessChangeProductView());
  }

  Future<void> selectedProductImages() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> selectImage = await picker.pickMultiImage();
    if (selectImage.isNotEmpty) {
      productImages.addAll(selectImage);
    }
    emit(SuccessLoadingSelectImage());
  }

  void removeSelectImage(int index) {
    productImages.removeAt(index);
    emit(SuccessRemoveSelectedImage());
  }

  void changeClassification(String? value) {
    classificationSelected = value;
    emit(SuccessChangeClassification());
  }
}
