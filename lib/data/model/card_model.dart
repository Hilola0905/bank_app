class CardModel{
  final String cardNumber;
  final String cardHolder;
  final String expireDate;
  final String userId;
  final int type;
  final String cvc;
  final String icon;
  final double balance;
  final String bank;
  final String cardId;
  final String color;
  CardModel({
    required this.expireDate,
    required this.icon,
    required this.userId,
    required this.cvc,
    required this.cardHolder,
    required this.bank,
    required this.cardId,
    required this.color,
    required this.type,
    required this.cardNumber,
    required this.balance,
  });

  CardModel copyWidth({
     String? cardNumber,
     String? cardHolder,
     String? expireDate,
     String? userId,
     int? type,
     String? cvc,
     String? icon,
     double? balance,
     String? bank,
     String? cardId,
     String? color,
  }){
    return CardModel(
      expireDate: expireDate ?? this.expireDate,
      icon: icon ?? this.icon,
      userId: userId ?? this.userId,
      cvc:  cvc ?? this.cvc,
      cardHolder: cardHolder ?? this.cardHolder,
      bank: bank ?? this.bank,
      cardId: cardId ?? this.cardId,
      color: color ?? this.color,
      cardNumber: cardNumber ?? this.cardNumber,
      type: type ?? this.type,
      balance: balance ?? this.balance,
    );
  }

  Map<String,dynamic> toJson() => {
    "cardHolder":cardHolder,
    "expireDate":expireDate,
    "userId":userId,
    "cvc":cvc,
    "icon":icon,
    "bank":bank,
    "cardId":cardId,
    "color":color,
    "cardNumber":cardNumber,
    "type":type,
    "balance":balance,
  };
  Map<String,dynamic> toJsonForUpdate() => {
    "icon":icon,
    "bank":bank,
    "color":color,
  };

  factory CardModel.fromJson(Map<String,dynamic> json){
    return CardModel(
        expireDate: json["lastName"] as String? ?? "",
        icon: json["imageUrl"] as String? ?? "",
        userId: json["password"] as String? ?? "",
        cvc:json["email"] as String? ?? "",
        cardHolder: json["userName"] as String? ?? "",
        bank: json["phoneNumber"] as String? ?? "",
        cardId: json["uuid"] as String? ?? "",
        color: json["fcm"] as String? ?? "",
        cardNumber: json["userId"] as String? ?? "",
        type: json["type"] as int? ?? 0,
        balance: (json["balance"] as num? ?? 0).toDouble()
    );
  }

  static CardModel initial() =>
      CardModel(
          expireDate: "",
          icon: "",
          userId: "",
          cvc: "",
          cardHolder: "",
          bank: "",
          cardId: "",
          color:"",
          cardNumber:"",
          type: 0,
          balance:0.0
      );

}