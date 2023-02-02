import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hong_kong_app/app/core/extensions/formater_extensions.dart';
import 'package:hong_kong_app/app/core/ui/helpers/size_extensions.dart';
import 'package:hong_kong_app/app/core/ui/styles/text_styles.dart';
import 'package:hong_kong_app/app/core/ui/widgets/ecommerce_appbar.dart';
import 'package:hong_kong_app/app/core/ui/widgets/ecommerce_increment_button.dart';
import 'package:hong_kong_app/app/dto/order_product_dto.dart';
import 'package:hong_kong_app/app/models/product_model.dart';
import 'package:hong_kong_app/app/pages/product_detail/product_detail_controller.dart';

import '../../core/ui/base_state/base_state.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductModel product;
  final OrderProductDto? order;

  const ProductDetailPage({super.key, required this.product, this.order});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState
    extends BaseState<ProductDetailPage, ProductDetailController> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final amout = widget.order?.amout ?? 1;
    controller.initial(amout, widget.order != null);
  }

  void _showConfirmDelete(int amount) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: const Text('Deseja excluir este item?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Cancelar',
                  style:
                      context.textStyles.textBold.copyWith(color: Colors.red),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.of(context).pop(
                    OrderProductDto(
                      product: widget.product,
                      amout: amount,
                    ),
                  );
                },
                child: Text(
                  'Confirmar',
                  style:
                      context.textStyles.textBold.copyWith(color: Colors.green),
                ),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EcommerceAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: context.screenWidht,
            height: context.percentHeight(.4),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.product.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              widget.product.name,
              style: context.textStyles.textExtraBold.copyWith(fontSize: 22),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Text(widget.product.description),
              ),
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          Row(
            children: [
              Container(
                width: context.percentWidth(.5),
                height: 68,
                padding: const EdgeInsets.all(8),
                child: BlocBuilder<ProductDetailController, int>(
                  builder: (context, amount) {
                    return EcommerceIncrementButton(
                      decrementTap: () {
                        controller.decrement();
                      },
                      incrementTap: () {
                        controller.increment();
                      },
                      amout: amount,
                    );
                  },
                ),
              ),
              Container(
                width: context.percentWidth(.5),
                height: 68,
                padding: EdgeInsets.all(8),
                child: BlocBuilder<ProductDetailController, int>(
                  builder: (context, amount) {
                    return ElevatedButton(
                      style: amount == 0
                          ? ElevatedButton.styleFrom(
                              backgroundColor: Colors.red)
                          : null,
                      onPressed: () {
                        if (amount == 0) {
                          _showConfirmDelete(amount);
                        } else {
                          Navigator.of(context).pop(
                            OrderProductDto(
                                product: widget.product, amout: amount),
                          );
                        }
                      },
                      child: Visibility(
                        visible: amount > 0,
                        replacement: Text(
                          'Excluir Produto',
                          style: context.textStyles.textExtraBold,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Adicionar',
                              style: context.textStyles.textExtraBold
                                  .copyWith(fontSize: 13),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: AutoSizeText(
                                (widget.product.price * amount).currencyPTBR,
                                minFontSize: 5,
                                maxFontSize: 13,
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                style: context.textStyles.textExtraBold
                                    .copyWith(fontSize: 13),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
