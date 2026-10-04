import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:noah_ark_base_app_flutter/src/core/theme/app_theme.dart';
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
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              children: [
                _buildGivingHero(context),
                const SizedBox(height: 26),
                _buildSectionHeader(context, 'Church Funds'),
                const SizedBox(height: 12),
                if (state.funds.isEmpty)
                  Text(
                    'No public funds listed.',
                    style: TextStyle(color: context.churchColors.textMuted),
                  )
                else
                  ...state.funds.map((fund) => _buildFundCard(context, fund, currencyFormat)),
                const SizedBox(height: 22),
                _buildSectionHeader(context, 'My Giving Statement / Receipts'),
                const SizedBox(height: 12),
                if (state.myDonations.isEmpty)
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: AppTheme.sanctuaryCard(context.churchColors),
                    child: Text(
                      'No donations recorded under this account yet.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: context.churchColors.textMuted),
                    ),
                  )
                else
                  ...state.myDonations.map((receipt) => _buildReceiptCard(context, receipt, currencyFormat)),
                const SizedBox(height: 96),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildGivingHero(BuildContext context) {
    final colors = context.churchColors;
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppTheme.heroGradient(colors),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: colors.primary.withValues(alpha: 0.28),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'TITHES & OFFERINGS',
            style: AppTheme.trackingBadge(color: colors.onPrimary.withValues(alpha: 0.85)),
          ),
          const SizedBox(height: 10),
          Text(
            'Support the work of the church',
            style: AppTheme.serif(
              fontSize: 25,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.4,
              height: 1.2,
              color: colors.onPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Text(
      title,
      style: AppTheme.serif(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.3,
        color: context.churchColors.text,
      ),
    );
  }

  Widget _buildFundCard(BuildContext context, ChurchFund fund, NumberFormat currencyFormat) {
    final colors = context.churchColors;
    final showBalance = fund.visibility != FundVisibility.private && fund.balance != null;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: AppTheme.sanctuaryCard(colors),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: colors.primary.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(Icons.savings_outlined, size: 22, color: colors.primary),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fund.name,
                  style: AppTheme.serif(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    height: 1.25,
                    color: colors.text,
                  ),
                ),
                if (fund.description != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    fund.description!,
                    style: TextStyle(color: colors.textMuted, fontSize: 12.5, height: 1.45),
                  ),
                ],
              ],
            ),
          ),
          if (showBalance) ...[
            const SizedBox(width: 10),
            Text(
              currencyFormat.format(fund.balance),
              style: AppTheme.serif(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: colors.primary,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildReceiptCard(BuildContext context, DonationReceipt receipt, NumberFormat currencyFormat) {
    final colors = context.churchColors;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: AppTheme.sanctuaryCard(colors),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: colors.secondary.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(Icons.receipt_long_rounded, size: 22, color: colors.secondary),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currencyFormat.format(receipt.amount),
                  style: AppTheme.serif(fontSize: 17, fontWeight: FontWeight.w700, color: colors.text),
                ),
                const SizedBox(height: 3),
                Text(
                  '${receipt.paymentMethod.toUpperCase()} • ${DateFormat.yMMMd().format(receipt.receivedAt)}',
                  style: TextStyle(color: colors.textMuted, fontSize: 12),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: colors.success.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              receipt.status.toUpperCase(),
              style: AppTheme.trackingBadge(color: colors.success, fontSize: 10),
            ),
          ),
        ],
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
