// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_bloc.dart';

@immutable
abstract class ProductState extends Equatable {}

class ProductLoading extends ProductState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProductError extends ProductState {
  final String error;
  ProductError({
    required this.error,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}

class InitialState extends ProductState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProductLoaded extends ProductState {
  List<ProductModel> data;
  ProductLoaded(this.data);
  @override
  // TODO: implement props
  List<Object?> get props => [data];
}
