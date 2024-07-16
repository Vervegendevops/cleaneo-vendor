class CashCollectionResponsse {
  final String status;
  final String totalAmountCollected;
  final String totalAmountAfterCommission;
  final List<CashCollection> data;

 const  CashCollectionResponsse({
     this.status="",
     this.totalAmountCollected="",
     this.totalAmountAfterCommission="",
     this.data=const [],
  });

  factory CashCollectionResponsse.fromJson(Map<String, dynamic> json) {
    var dataList = json['data'] as List;
    List<CashCollection> dataItems = dataList.map((i) => CashCollection.fromJson(i)).toList();

    return CashCollectionResponsse(
      status: json['status'],
      totalAmountCollected: json['total_amount_collected'],
      totalAmountAfterCommission: json['total_amount_after_commission'],
      data: dataItems,
    );
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> dataItems = data.map((i) => i.toJson()).toList();

    return {
      'status': status,
      'total_amount_collected': totalAmountCollected,
      'total_amount_after_commission': totalAmountAfterCommission,
      'data': dataItems,
    };
  }
}
class CashCollection {
  final int id;
  final String orderId;
  final String vendorId;
  final String amountCollected;
  final DateTime transactionDate;
  final String commission;
  final String amountAfterCommission;

  const CashCollection({
     this.id=0,
     this.orderId="",
     this.vendorId="",
     this.amountCollected="",
     required this.transactionDate,
     this.commission="",
     this.amountAfterCommission="",
  });

  factory CashCollection.fromJson(Map<String, dynamic> json) {
    return CashCollection(
      id: json['id'],
      orderId: json['order_id'],
      vendorId: json['vendor_id'],
      amountCollected: json['amount_collected'],
      transactionDate: DateTime.parse(json['transaction_date']),
      commission: json['commission'],
      amountAfterCommission: json['amount_after_commission'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'order_id': orderId,
      'vendor_id': vendorId,
      'amount_collected': amountCollected,
      'transaction_date': transactionDate,
      'commission': commission,
      'amount_after_commission': amountAfterCommission,
    };
  }
}
