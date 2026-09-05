import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import 'package:e_commerce/feature/mycart/cartstore/addtocatlocal.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitial());

  Future<void> checkout(Addtocatlocal cart) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;

    try {
      emit(CheckoutLoading());

      if (uid == null) {
        emit(CheckoutError("User is not logged in"));
        return;
      }

      if (cart.myCart.isEmpty) {
        emit(CheckoutError("Cart is empty"));
        return;
      }

      final orderRef = FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('orders')
          .doc();

      await orderRef.set({
        'orderId': orderRef.id,

        'items': cart.myCart.map((item) {
          return {
            'id': item.id,
            'name': item.name,
            'price': item.price,
            'quantity': item.quantity,
            'selectedSize': item.selectedSize,
            'image': item.image,
            // ignore: deprecated_member_use
            'color': item.color.value,
            'stock': item.stock,
          };
        }).toList(),

        'subtotal': cart.calculateTotalPrice(),
        'discount': cart.discount(),
        'shipping': 20,
        'total': cart.total(),

        'status': 'pending',
        'createdAt': FieldValue.serverTimestamp(),
      });

      cart.clearCart();

      emit(CheckoutSuccess(orderRef.id));
    } catch (e) {
      emit(CheckoutError(e.toString()));
    }
  }
}
