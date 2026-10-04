import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:noah_ark_base_app_flutter/src/core/theme/church_colors.dart';
import 'package:noah_ark_base_app_flutter/src/features/giving/domain/fund.dart';
import 'package:noah_ark_base_app_flutter/src/features/giving/presentation/bloc/giving_bloc.dart';

class GivingScreen extends StatelessWidget {
  const GivingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tithes & Giving'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => context
                .read<GivingBloc>()
                .add(const GivingOverviewFetchRequested()),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: context.churchColors.primary,
        foregroundColor: context.churchColors.onPrimary,
        icon: const Icon(Icons.payment),
        label: const Text('Give Tithe / Offering'),
        onPressed: () => _openDonationModal(context),
      ),
      body: BlocBuilder<GivingBloc, GivingState>(
        builder: (context, state) {
          if (state is GivingLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is GivingLoaded) {
            final currencyFormat = NumberFormat.currency(symbol: 'NPR ', decimalDigits: 0);

            return ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                const Text(
                  'Church Funds & Ministry Sectors',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                if (state.funds.isEmpty)
                  const Text('No public funds listed.')
                else
                  ...state.funds.map((fund) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: context.churchColors.primary.withValues(alpha: 0.12),
                              foregroundColor: context.churchColors.primary,
                              child: const Icon(Icons.savings, size: 20),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    fund.name,
                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                  ),
                                  if (fund.description != null)
                                    Text(
                                      fund.description!,
                                      style: TextStyle(color: context.churchColors.textMuted, fontSize: 12),
                                    ),
                                ],
                              ),
                            ),
                            if (fund.visibility != FundVisibility.private && fund.balance != null)
                              Text(
                                currencyFormat.format(fund.balance),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: context.churchColors.primary,
                                  fontSize: 14,
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  }),
                const SizedBox(height: 24),
                const Text(
                  'My Giving Statement / Receipts',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                if (state.myDonations.isEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Center(
                      child: Text(
                        'No donations recorded under this account yet.',
                        style: TextStyle(color: context.churchColors.textMuted),
                      ),
                    ),
                  )
                else
                  ...state.myDonations.map((receipt) {
                    return Card(
                      child: ListTile(
                        leading: Icon(Icons.receipt_long, color: context.churchColors.secondary),
                        title: Text(
                          currencyFormat.format(receipt.amount),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          '${receipt.paymentMethod.toUpperCase()} • ${DateFormat.yMMMd().format(receipt.receivedAt)}',
                          style: const TextStyle(fontSize: 12),
                        ),
                        trailing: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: context.churchColors.success.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            receipt.status.toUpperCase(),
                            style: TextStyle(
                              color: context.churchColors.success,
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                const SizedBox(height: 80),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  void _openDonationModal(BuildContext context) {
    final amountController = TextEditingController();
    final refController = TextEditingController();
    final noteController = TextEditingController();
    var selectedMethod = 'bank_transfer';
    var isAnonymous = false;

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => StatefulBuilder(
        builder: (sheetContext, setModalState) {
          final givingState = context.read<GivingBloc>().state;
          final funds = givingState is GivingLoaded ? givingState.funds : <ChurchFund>[];
          var selectedFundId = funds.isNotEmpty ? funds.first.id : 1;

          return Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
              bottom: MediaQuery.of(sheetContext).viewInsets.bottom + 20,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Record Offering / Tithe Gift',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: amountController,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    decoration: const InputDecoration(
                      labelText: 'Amount (NPR)',
                      prefixText: 'NPR ',
                    ),
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<int>(
                    initialValue: selectedFundId,
                    decoration: const InputDecoration(labelText: 'Select Fund'),
                    items: funds.map((f) {
                      return DropdownMenuItem(value: f.id, child: Text(f.name));
                    }).toList(),
                    onChanged: (val) {
                      if (val != null) setModalState(() => selectedFundId = val);
                    },
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<String>(
                    initialValue: selectedMethod,
                    decoration: const InputDecoration(labelText: 'Payment Method'),
                    items: const [
                      DropdownMenuItem(value: 'bank_transfer', child: Text('Bank Deposit / QR')),
                      DropdownMenuItem(value: 'cash', child: Text('Cash Envelope')),
                      DropdownMenuItem(value: 'cheque', child: Text('Bank Cheque')),
                      DropdownMenuItem(value: 'esewa', child: Text('eSewa')),
                      DropdownMenuItem(value: 'khalti', child: Text('Khalti')),
                    ],
                    onChanged: (val) {
                      if (val != null) setModalState(() => selectedMethod = val);
                    },
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: refController,
                    decoration: const InputDecoration(
                      labelText: 'Reference / Voucher / Slip No.',
                      hintText: 'e.g. Bank slip or cheque number',
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: noteController,
                    decoration: const InputDecoration(labelText: 'Note (Optional)'),
                  ),
                  const SizedBox(height: 8),
                  SwitchListTile(
                    title: const Text('Give Anonymously'),
                    subtitle: const Text('Hide name from public donor lists'),
                    value: isAnonymous,
                    onChanged: (val) => setModalState(() => isAnonymous = val),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      final amount = double.tryParse(amountController.text.trim()) ?? 0;
                      if (amount > 0) {
                        context.read<GivingBloc>().add(
                              DonationSubmitRequested(
                                amount: amount,
                                fundId: selectedFundId,
                                paymentMethod: selectedMethod,
                                referenceId: refController.text.trim().isNotEmpty
                                    ? refController.text.trim()
                                    : null,
                                note: noteController.text.trim().isNotEmpty
                                    ? noteController.text.trim()
                                    : null,
                                isAnonymous: isAnonymous,
                              ),
                            );
                        Navigator.pop(ctx);
                      }
                    },
                    child: const Text('Submit Giving Record'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
