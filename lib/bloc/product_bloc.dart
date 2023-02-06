import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:flutter_bloc_restapi_firebase/repo/repository.dart';

import '../model/product_model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;
  ProductBloc({
    required this.productRepository,
  }) : super(InitialState()) {
    on<GetData>((event, emit) async {
      emit(ProductLoading());
      await Future.delayed(Duration(seconds: 1));
      try {
        final data = await productRepository.get();
        emit(ProductLoaded(data));
      } catch (e) {
        emit(ProductError(error: e.toString()));
      }
    });
  }
}
