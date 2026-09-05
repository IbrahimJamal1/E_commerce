import 'package:e_commerce/feature/auth/widgets/snackbar.dart';
import 'package:e_commerce/feature/checkout/cubit/checkout_cubit.dart';
import 'package:e_commerce/feature/checkout/widget/infoperson.dart';
import 'package:e_commerce/feature/checkout/widget/paymentsheet.dart';
import 'package:e_commerce/feature/checkout/widget/rowcheckstap.dart';
import 'package:e_commerce/feature/mycart/cartstore/addtocatlocal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  int staps = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),

      appBar: AppBar(
        title: const Text(
          "Checkout",
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
        ),
      ),

      body: BlocConsumer<CheckoutCubit, CheckoutState>(
        listener: (context, state) {
          if (state is CheckoutSuccess) {
            showMySnackBar(context, 'Order success', isError: false);

            Navigator.pushNamed(context, 'orderstate');
          }

          if (state is CheckoutError) {
            showMySnackBar(context, state.message, isError: true);
          }
        },

        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(30),

            child: Column(
              children: [
                Row(
                  children: [
                    rowcheckstap(1, staps),

                    Expanded(
                      child: Container(
                        height: 2,
                        color: staps >= 2 ? Colors.blue : Colors.grey,
                      ),
                    ),

                    rowcheckstap(2, staps),
                  ],
                ),

                const SizedBox(height: 60),

                if (staps == 1) infoperson(),

                if (staps == 2) Paymentsheet(),
              ],
            ),
          );
        },
      ),

      bottomNavigationBar: BlocBuilder<CheckoutCubit, CheckoutState>(
        builder: (context, state) {
          final isLoading = state is CheckoutLoading;

          return Container(
            margin: const EdgeInsets.only(
              bottom: 50,
              left: 20,
              right: 20,
              top: 10,
            ),
            width: double.infinity,
            height: 55,

            child: ElevatedButton(
              onPressed: isLoading
                  ? null
                  : () {
                      if (staps == 1) {
                        setState(() {
                          staps = 2;
                        });
                      } else if (staps == 2) {
                        final cart = context.read<Addtocatlocal>();

                        context.read<CheckoutCubit>().checkout(cart);
                      }
                    },

              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),

              child: isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : Text(
                      staps == 1 ? "Continue To Shipping" : "Place Order",
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }
}
