import 'package:esg_post_office/features/image_to_json/presentation/widgets/image_to_json_widget.dart';
import 'package:esg_post_office/features/record/presentation/providers/record_state.dart';
import 'package:esg_post_office/features/record/presentation/providers/bills_provider.dart';
import 'package:esg_post_office/features/auth/presentation/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FuelBillPage extends ConsumerStatefulWidget {
  const FuelBillPage({super.key});

  @override
  ConsumerState<FuelBillPage> createState() => _FuelBillPageState();
}

class _FuelBillPageState extends ConsumerState<FuelBillPage> {
  String get _promptForFuelBill => '''
Please analyze this fuel bill and provide the following information in a valid JSON format:
{
  "litresConsumed": <extract number of litres as a number>,
  "billNumber": "<extract bill number as text>"
}
Example output:
{
  "litresConsumed": 19.70,
  "billNumber": "FB123456"
}
''';

  Key _imageToJsonKey = UniqueKey();
  Map<String, dynamic>? _pendingBillData;
  bool _isProcessing = false;

  @override
  void initState() {
    super.initState();
    // Reset state when page is opened
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(fuelBillProvider.notifier).reset();
    });
  }

  @override
  void dispose() {
    // Reset state when page is closed
    ref.read(fuelBillProvider.notifier).reset();
    super.dispose();
  }

  void _handleJsonResult(Map<String, dynamic> data) {
    debugPrint('Received OCR data: $data'); // Debug log
    
    if (!mounted) return;
    
    // Update state immediately
    setState(() {
      _pendingBillData = data;
      _isProcessing = false;
    });
    
    // Force a rebuild after a short delay to ensure UI updates
    Future.microtask(() {
      if (mounted) {
        setState(() {});
      }
    });
    
    debugPrint('State updated - pendingBillData: $_pendingBillData, isProcessing: $_isProcessing');
  }

  Future<void> _submitBill() async {
    if (_pendingBillData == null || _isProcessing) return;

    setState(() {
      _isProcessing = true;
    });

    try {
      final authState = ref.read(authStateProvider);
      final billsService = ref.read(billsServiceProvider);

      final user = authState.value;
      if (user == null) {
        throw Exception('User not authenticated');
      }

      await billsService.submitFuelBill(
        postOfficeId: user.postOfficeId,
        billData: _pendingBillData!,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Fuel bill submitted successfully'),
            backgroundColor: Colors.green,
          ),
        );
        setState(() {
          _pendingBillData = null;
          _isProcessing = false;
          _imageToJsonKey = UniqueKey(); // Force rebuild of ImageToJsonWidget
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
        setState(() {
          _isProcessing = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Building FuelBillPage - pendingBillData: $_pendingBillData, isProcessing: $_isProcessing'); // Debug build state
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fuel Bill Record'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ImageToJsonWidget(
              key: _imageToJsonKey,
              customPrompt: _promptForFuelBill,
              onJsonResult: _handleJsonResult,
            ),
            if (_pendingBillData != null) ...[
              const SizedBox(height: 20),
              const Text(
                'Extracted Data:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: _pendingBillData!.length,
                  itemBuilder: (context, index) {
                    String key = _pendingBillData!.keys.elementAt(index);
                    dynamic value = _pendingBillData![key];
                    return ListTile(
                      title: Text(key),
                      subtitle: Text(value.toString()),
                    );
                  },
                ),
              ),
            ],
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _pendingBillData == null || _isProcessing
                    ? null
                    : _submitBill,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Theme.of(context).primaryColor,
                  disabledBackgroundColor: Colors.grey.shade400,
                ),
                child: _isProcessing
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(color: Colors.white),
                      )
                    : Text(
                        _pendingBillData == null
                            ? 'Upload Bill First'
                            : 'Submit Bill',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}