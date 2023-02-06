part of 'product_bloc.dart';

@immutable
abstract class ProductEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetData extends ProductEvent {
  GetData();
}
