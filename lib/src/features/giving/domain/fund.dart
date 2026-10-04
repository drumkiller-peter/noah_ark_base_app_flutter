import 'package:equatable/equatable.dart';

enum FundVisibility {
  private('private'),
  totals('totals'),
  donors('donors');

  final String value;
  const FundVisibility(this.value);

  static FundVisibility fromString(String val) {
    return FundVisibility.values.firstWhere(
      (v) => v.value == val,
      orElse: () => FundVisibility.private,
    );
  }
}

class ChurchFund extends Equatable {
  final int id;
  final String name;
  final String code;
  final String? description;
  final FundVisibility visibility;
  final double? balance;
  final double? totalReceived;
  final int? donationCount;
  final bool isActive;

  const ChurchFund({
    required this.id,
    required this.name,
    required this.code,
    this.description,
    this.visibility = FundVisibility.totals,
    this.balance,
    this.totalReceived,
    this.donationCount,
    this.isActive = true,
  });

  factory ChurchFund.fromJson(Map<String, dynamic> json) {
    return ChurchFund(
      id: json['id'] as int,
      name: json['name'] as String,
      code: json['code'] as String,
      description: json['description'] as String?,
      visibility: FundVisibility.fromString(json['visibility'] as String? ?? 'totals'),
      balance: (json['balance'] as num?)?.toDouble(),
      totalReceived: (json['total_received'] as num?)?.toDouble(),
      donationCount: json['donation_count'] as int?,
      isActive: json['is_active'] as bool? ?? true,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        code,
        description,
        visibility,
        balance,
        totalReceived,
        donationCount,
        isActive,
      ];
}

class DonationReceipt extends Equatable {
  final int id;
  final double amount;
  final String currency;
  final int fundId;
  final String? fundName;
  final String paymentMethod;
  final String status;
  final String? referenceId;
  final DateTime receivedAt;

  const DonationReceipt({
    required this.id,
    required this.amount,
    this.currency = 'NPR',
    required this.fundId,
    this.fundName,
    required this.paymentMethod,
    required this.status,
    this.referenceId,
    required this.receivedAt,
  });

  factory DonationReceipt.fromJson(Map<String, dynamic> json) {
    return DonationReceipt(
      id: json['id'] as int,
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String? ?? 'NPR',
      fundId: json['fund_id'] as int,
      fundName: json['fund_name'] as String?,
      paymentMethod: json['payment_method'] as String? ?? 'cash',
      status: json['status'] as String? ?? 'completed',
      referenceId: json['reference_id'] as String?,
      receivedAt: DateTime.parse(json['created_at'] as String? ?? DateTime.now().toIso8601String()),
    );
  }

  @override
  List<Object?> get props => [id, amount, currency, fundId, fundName, paymentMethod, status, referenceId, receivedAt];
}
