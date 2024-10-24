class DashboardDataMOdel {
  final List<Banner> banners;
  final List<Bike> bikes;
  final List<Testimonial> testimonials;

  DashboardDataMOdel({
    required this.banners,
    required this.bikes,
    required this.testimonials,
  });

  factory DashboardDataMOdel.fromJson(Map<String, dynamic> json) {
    return DashboardDataMOdel(
      banners: (json['banners'] as List)
          .map((banner) => Banner.fromJson(banner))
          .toList(),
      bikes: (json['bikes'] as List)
          .map((bike) => Bike.fromJson(bike))
          .toList(),
      testimonials: (json['testimonials'] as List)
          .map((testimonial) => Testimonial.fromJson(testimonial))
          .toList(),
    );
  }
}

class Banner {
  final String bannerId;
  final String bannerImage;
  final String bannerImageMobile;
  final String bannerLink;
  final String bannerPosition;
  final String createdDate;
  final String lastModifiedDate;

  Banner({
    required this.bannerId,
    required this.bannerImage,
    required this.bannerImageMobile,
    required this.bannerLink,
    required this.bannerPosition,
    required this.createdDate,
    required this.lastModifiedDate,
  });

  factory Banner.fromJson(Map<String, dynamic> json) {
    return Banner(
      bannerId: json['bannerId'],
      bannerImage: json['bannerImage'],
      bannerImageMobile: json['bannerImageMobile']??'',
      bannerLink: json['bannerLink'],
      bannerPosition: json['bannerPosition'],
      createdDate: json['createdDate'],
      lastModifiedDate: json['lastModifiedDate'],
    );
  }
}

class Bike {
  final String bikeId;
  final String bikeName;
  final String branchId;
  final String bikeModel;
  final String bikeManufacturer;
  final String bikePicture;
  final String bikeStock;
  final String bikePosition;
  final String weekdayHalfPrice;
  final String weekdayFullPrice;
  final String weekendHalfPrice;
  final String weekendFullPrice;
  final String holidayHalfPrice;
  final String holidayFullPrice;
  final String kmLimit;
  final String kmLimitText;
  final String bikeExclusion;
  final String status;
  final String createdDate;
  final String lastModifiedDate;

  Bike({
    required this.bikeId,
    required this.bikeName,
    required this.branchId,
    required this.bikeModel,
    required this.bikeManufacturer,
    required this.bikePicture,
    required this.bikeStock,
    required this.bikePosition,
    required this.weekdayHalfPrice,
    required this.weekdayFullPrice,
    required this.weekendHalfPrice,
    required this.weekendFullPrice,
    required this.holidayHalfPrice,
    required this.holidayFullPrice,
    required this.kmLimit,
    required this.kmLimitText,
    required this.bikeExclusion,
    required this.status,
    required this.createdDate,
    required this.lastModifiedDate,
  });

  factory Bike.fromJson(Map<String, dynamic> json) {
    return Bike(
      bikeId: json['bikeId'],
      bikeName: json['bikeName'],
      branchId: json['branchId'],
      bikeModel: json['bikeModel'],
      bikeManufacturer: json['bikeManufacturer'],
      bikePicture: json['bikePicture'],
      bikeStock: json['bikeStock'],
      bikePosition: json['bikePosition'],
      weekdayHalfPrice: json['weekdayHalfPrice'],
      weekdayFullPrice: json['weekdayFullPrice'],
      weekendHalfPrice: json['weekendHalfPrice'],
      weekendFullPrice: json['weekendFullPrice'],
      holidayHalfPrice: json['holidayHalfPrice'],
      holidayFullPrice: json['holidayFullPrice'],
      kmLimit: json['kmLimit'],
      kmLimitText: json['kmLimitText'],
      bikeExclusion: json['bikeExclusion'],
      status: json['status'],
      createdDate: json['createdDate'],
      lastModifiedDate: json['lastModifiedDate'],
    );
  }
}

class Testimonial {
  final String testimonialsId;
  final String customerName;
  final String customerDesignation;
  final String testimonial;
  final String createdDate;
  final String lastModifiedDate;

  Testimonial({
    required this.testimonialsId,
    required this.customerName,
    required this.customerDesignation,
    required this.testimonial,
    required this.createdDate,
    required this.lastModifiedDate,
  });

  factory Testimonial.fromJson(Map<String, dynamic> json) {
    return Testimonial(
      testimonialsId: json['testimonialsId'],
      customerName: json['customerName'],
      customerDesignation: json['customerDesignation'],
      testimonial: json['testimonial'],
      createdDate: json['createdDate'],
      lastModifiedDate: json['lastModifiedDate'],
    );
  }
}