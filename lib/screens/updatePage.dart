// ignore_for_file: file_names, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({super.key});
  static const String id = 'UpdatePage';

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  bool isLoading = false;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  late ProductModel product;

  @override
  void initState() {
    super.initState();
    // هنا لسه مش بنقدر نجيب arguments
    // فهنستناها جوه WidgetsBinding
    WidgetsBinding.instance.addPostFrameCallback((_) {
      product = ModalRoute.of(context)!.settings.arguments as ProductModel;

      // نحط القيم في الـ TextFields بعد تحميل الصفحة مرة واحدة فقط
      _titleController.text = product.title;
      _descController.text = product.description;
      _imageController.text = product.image;
      _priceController.text = product.price.toString();

      setState(() {}); // لتحديث الواجهة بعد إدخال القيم
    });
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Update Product',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Product Title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: const Icon(Icons.title),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _descController,
                decoration: InputDecoration(
                  labelText: 'Product Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: const Icon(Icons.description),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _imageController,
                decoration: InputDecoration(
                  labelText: 'Product Image URL',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: const Icon(Icons.image),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _priceController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: InputDecoration(
                  labelText: 'Product Price',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: const Icon(Icons.attach_money),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: const WidgetStatePropertyAll(Colors.blue),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                    ),
                  ),
                  onPressed: () async {
                    setState(() => isLoading = true);
                    try {
                      await UpdateProduct().updateProduct(
                        id: product.id.toString(),
                        title: _titleController.text,
                        price: _priceController.text,
                        description: _descController.text,
                        image: _imageController.text,
                        category: product.category,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Product updated successfully!'),
                        ),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text('Error: $e')));
                    } finally {
                      setState(() => isLoading = false);
                    }
                  },
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
