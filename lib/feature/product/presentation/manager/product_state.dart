abstract class ProductState {}

class InitialState extends ProductState {}

class SuccessGetAllProduct extends ProductState {}

class ErrorProduct extends ProductState {}

class SuccessChangeProductView extends ProductState {}

class SuccessLoadingSelectImage extends ProductState {}

class SuccessRemoveSelectedImage extends ProductState {}

class SuccessChangeClassification extends ProductState {}
