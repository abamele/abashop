class AutumnModel {
  final String? productCategory;

  //product Details
  final String? productId;
  final String? productImage;
  final String? productDescription;
  final String? selectedSize;
  final num productOriginalPrice;
  final String? discount;
  final String? addresse;
  late final int orderQuantity;
  final String? waist;
  final String? tissue_type;

  final String? color;
  final String? thickness;
  final String? collarType;
  final String? armLenght;
  final String? style;
  final String? mold;
  final String? pattern;
  final String? collection;
  final String? sustainableDetail;
  bool isChecked;
  final List? favourites;

  //Seller detail
  final String? sellerId;
  final String? sellerName;
  final String? sellerEmail;
  final String? sellerPhoneNumber;
  final String? dateAdded;
  final String? timeAdded;
  final num? total;
  final num? totalUnit;
  final String? status;
  final int? orderNumber;
  //bool isChecked;

  AutumnModel(
      {this.productId,
        this.productCategory,
        this.productImage,
        this.productDescription,
        this.selectedSize,
        required this.productOriginalPrice,
        this.discount,
        this.addresse,
        required this.orderQuantity,
        this.waist,
        this.tissue_type,

        this.color,
        this.thickness,
        this.collarType,
        this.armLenght,
        this.style,
        this.mold,
        this.pattern,
        this.collection,
        this.sustainableDetail,
        required this.isChecked,

        this.favourites,
        this.sellerId,
        this.sellerName,
        this.sellerEmail,
        this.sellerPhoneNumber,
        this.orderNumber,
        this.total,
        this.totalUnit,
        this.dateAdded,
        this.timeAdded,
        this.status,
        //required this.isChecked
      });


  num get totalPrice => productOriginalPrice * orderQuantity;
}
