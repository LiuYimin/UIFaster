//
//  Model.swift
//  UIFaster
//
//  Created by 0000 on 2023/12/7.
//

import Foundation


struct Person: Codable {
    let name: String
    let age: Int
}
//
//struct UserProfile: Codable {
//   let userID: String
//   let username: String
//   let uniqueId: Int
//   let displayName: String
//   let bio: String
//   let profileImageURL: String
//   var credits: Int
//   let faceModelTrainingStatus: Int
//   let imageGenerationStatus: Int
//   var gender: String?
//   let likes: Int
//   let follower: Int
//   let following: Int
//   let createdDate: String
//   let updatedDate: String
//   let lastActivityTime: String?
//   let lastActivityLevel: String?
//   let deviceToken: String
//   let notificationLevel: String?
//   let phoneNumber: String?
//   let timezone: String
//   let langCode: String
//   let appCode: String
//   let countryCode: String?
//   let gpuRegion: String?
//   let restoreFace: Bool
//   let promotionPurchased: Bool
//   let region: String
//   let promotionPurchaseable: Bool
//   var watermark: Bool?
//   var aspectRatio: String?
//   var imageQuality: String?
//   var parallelGenerations: Bool?
//   var skipGenerationQueue: Bool?
//   var preTrainedModel: String?
//   var tutorialFinishStatus: Bool
//   let subscription: Subscription?
//   let preferences: Preferences?
//   let generatedImages: Int?
//   let wechat: String
//   let phone: String
//   let creditsFree: Int
//   let creditsPaid: Int
//   let trainedImageList: String
//   let savedTemplateList: String
//   let updatedUsername: Bool
//   let userProfilePublic: Bool
//   let imageQuantity: Int
//   let aiAvatar: String
//   let creditsPreImage: Int
//   
//   var isSubscribe: Bool {
//      return false//!(subscription?.subscriptionId.isNilOrEmpty == true)
//   }
//   
//   enum CodingKeys: String, CodingKey {
//      case userID = "user_id"
//      case username
//      case uniqueId = "unique_id"
//      case displayName = "display_name"
//      case bio
//      case profileImageURL = "profile_image_url"
//      case credits
//      case faceModelTrainingStatus = "face_model_training_status"
//      case imageGenerationStatus = "image_generation_status"
//      case gender
//      case likes
//      case follower
//      case following
//      case userProfilePublic = "public"
//      case createdDate = "created_date"
//      case updatedDate = "updated_date"
//      case lastActivityTime = "last_activity_time"
//      case lastActivityLevel = "last_activity_level"
//      case deviceToken = "device_token"
//      case notificationLevel = "notification_level"
//      case phoneNumber = "phone_number"
//      case timezone
//      case langCode = "lang_code"
//      case appCode = "app_code"
//      case countryCode = "country_code"
//      case gpuRegion = "gpu_region"
//      case restoreFace = "restore_face"
//      case promotionPurchased = "promotion_purchased"
//      case region
//      case promotionPurchaseable = "promotion_purchaseable"
//      case watermark
//      case aspectRatio = "aspect_ratio"
//      case imageQuality = "image_quality"
//      case parallelGenerations = "parallel_generations"
//      case skipGenerationQueue = "skip_generation_queue"
//      case preTrainedModel = "pre_trained_model"
//      case tutorialFinishStatus = "tutorial_finish_status"
//      case subscription
//      case preferences
//      case generatedImages = "generated_images"
//      case wechat
//      case phone
//      case creditsFree = "credits_free"
//      case creditsPaid = "credits_paid"
//      case trainedImageList = "trained_image_list"
//      case savedTemplateList = "saved_template_list"
//      case updatedUsername = "updated_username"
//      case imageQuantity = "image_quantity"
//      case aiAvatar = "ai_avatar"
//      case creditsPreImage = "credits_pre_image"
//   }
//   
//   init(from decoder: Decoder) throws {
//      let container = try decoder.container(keyedBy: CodingKeys.self)
//      self.userID = try container.decode(String.self, forKey: .userID)
//      self.username = try container.decode(String.self, forKey: .username)
//      self.uniqueId = try container.decode(Int.self, forKey: .uniqueId)
//      self.displayName = try container.decodeIfPresent(String.self, forKey: .displayName) ?? ""
//      self.bio = try container.decodeIfPresent(String.self, forKey: .bio) ?? ""
//      self.profileImageURL = try container.decodeIfPresent(String.self, forKey: .profileImageURL) ?? ""
//      self.credits = try container.decode(Int.self, forKey: .credits)
//      self.faceModelTrainingStatus = try container.decode(Int.self, forKey: .faceModelTrainingStatus)
//      self.imageGenerationStatus = try container.decode(Int.self, forKey: .imageGenerationStatus)
//      self.gender = try container.decodeIfPresent(String.self, forKey: .gender)
//      self.likes = try container.decode(Int.self, forKey: .likes)
//      self.follower = try container.decode(Int.self, forKey: .follower)
//      self.following = try container.decode(Int.self, forKey: .following)
//      self.userProfilePublic = try container.decode(Bool.self, forKey: .userProfilePublic)
//      self.createdDate = try container.decode(String.self, forKey: .createdDate)
//      self.updatedDate = try container.decode(String.self, forKey: .updatedDate)
//      self.lastActivityTime = try container.decodeIfPresent(String.self, forKey: .lastActivityTime)
//      self.lastActivityLevel = try container.decodeIfPresent(String.self, forKey: .lastActivityLevel)
//      self.deviceToken = try container.decode(String.self, forKey: .deviceToken)
//      self.notificationLevel = try container.decodeIfPresent(String.self, forKey: .notificationLevel)
//      self.phoneNumber = try container.decodeIfPresent(String.self, forKey: .phoneNumber)
//      self.timezone = try container.decode(String.self, forKey: .timezone)
//      self.langCode = try container.decode(String.self, forKey: .langCode)
//      self.appCode = try container.decode(String.self, forKey: .appCode)
//      self.countryCode = try container.decodeIfPresent(String.self, forKey: .countryCode)
//      self.gpuRegion = try container.decodeIfPresent(String.self, forKey: .gpuRegion)
//      self.restoreFace = try container.decode(Bool.self, forKey: .restoreFace)
//      self.promotionPurchased = try container.decode(Bool.self, forKey: .promotionPurchased)
//      self.region = try container.decode(String.self, forKey: .region)
//      self.promotionPurchaseable = try container.decode(Bool.self, forKey: .promotionPurchaseable)
//      self.watermark = try container.decodeIfPresent(Bool.self, forKey: .watermark)
//      self.aspectRatio = try container.decodeIfPresent(String.self, forKey: .aspectRatio)
//      self.imageQuality = try container.decodeIfPresent(String.self, forKey: .imageQuality)
//      self.parallelGenerations = try container.decodeIfPresent(Bool.self, forKey: .parallelGenerations)
//      self.skipGenerationQueue = try container.decodeIfPresent(Bool.self, forKey: .skipGenerationQueue)
//      self.preTrainedModel = try container.decodeIfPresent(String.self, forKey: .preTrainedModel)
//      self.tutorialFinishStatus = try container.decode(Bool.self, forKey: .tutorialFinishStatus)
//      self.subscription = try container.decodeIfPresent(Subscription.self, forKey: .subscription)
//      self.preferences = try container.decodeIfPresent(Preferences.self, forKey: .preferences)
//      self.generatedImages = try container.decodeIfPresent(Int.self, forKey: .generatedImages)
//      self.wechat = try container.decode(String.self, forKey: .wechat)
//      self.phone = try container.decode(String.self, forKey: .phone)
//      self.creditsFree = try container.decode(Int.self, forKey: .creditsFree)
//      self.creditsPaid = try container.decode(Int.self, forKey: .creditsPaid)
//      self.trainedImageList = try container.decode(String.self, forKey: .trainedImageList)
//      self.savedTemplateList = try container.decode(String.self, forKey: .savedTemplateList)
//      self.updatedUsername = try container.decode(Bool.self, forKey: .updatedUsername)
//      self.imageQuantity = try container.decodeIfPresent(Int.self, forKey: .imageQuantity) ?? 1
//      self.aiAvatar = try container.decodeIfPresent(String.self, forKey: .aiAvatar) ?? ""
//      self.creditsPreImage = try container.decodeIfPresent(Int.self, forKey: .creditsPreImage) ?? 1
//   }
//   
//   // 用户生图偏好设置
//   var imagePreferences: ImagePreferences {
//      return ImagePreferences(watermark: watermark, aspectRatio: aspectRatio, imageQuality: imageQuality, parallelGenerations: parallelGenerations, skipGenerationQueue: skipGenerationQueue, gender: gender, imageQuantity: imageQuantity)
//   }
//}
//
//struct Subscription: Codable {
//   let subscriptionId: String?
//   let subscriptionName: SubscriptionName?
//   let status: String?
//   let expirationDate: String?
//   
//   enum CodingKeys: String, CodingKey {
//      case subscriptionId = "subscription_id"
//      case subscriptionName = "subscription_name"
//      case status
//      case expirationDate = "expiration_date"
//   }
//   
//   init(from decoder: Decoder) throws {
//      let container = try decoder.container(keyedBy: CodingKeys.self)
//      self.subscriptionId = try container.decodeIfPresent(String.self, forKey: .subscriptionId)
//      self.subscriptionName = try? container.decodeIfPresent(SubscriptionName.self, forKey: .subscriptionName)
//      self.status = try container.decodeIfPresent(String.self, forKey: .status)
//      self.expirationDate = try container.decodeIfPresent(String.self, forKey: .expirationDate)
//   }
//   
//   var flag: SubscriptionFlag? {
////      if let flag = DataManager.shared.subscriptionsData.value?.first(where: {$0.subscriptionId == subscriptionId }) {
////         return flag.flag
////      }
//      return nil
//   }
//   
//   var type: SubscriptionName? {
//      if let name = subscriptionName {
//         return name
//      } else if let suffix = subscriptionId?.split(separator: ".").last {
//         return SubscriptionName(rawValue: suffix.capitalized)
//      }
//      return nil
//   }
//}
//
//public struct ImagePreferences: Codable {
//   public enum AspectRadio: String, Codable {
//      case oneToOne = "1:1"
//      case twoToThree = "2:3"
//      
//      public init(from decoder: Decoder) throws {
//         self = try AspectRadio(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .oneToOne
//      }
//   }
//   
//   public enum ImageQuality: String, Codable {
//      case standard = "Standard"
//      case hd = "HD"
//      
//      public init(from decoder: Decoder) throws {
//         self = try ImageQuality(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .standard
//      }
//      
//      var stringValule: String {
//         switch self {
//         case .standard:
//            return "RString.v2_setting_standard()"
//         case .hd:
//            return "RString.v2_setting_hd()"
//         }
//      }
//   }
//   
//   var variation: Int = 1
//   var watermark: Bool
//   var aspectRatio: AspectRadio
//   var imageQuality: ImageQuality
//   var parallelGenerations: Bool
//   var skipGenerationQueue: Bool
//   var imageQuantity: Int = 1
//   var gender: String
//   
//   enum CodingKeys: String, CodingKey {
//      case variation
//      case watermark = "watermark"
//      case aspectRatio = "aspect_ratio"
//      case imageQuality = "image_quality"
//      case parallelGenerations = "parallel_generations"
//      case skipGenerationQueue = "skip_generation_queue"
//      case imageQuantity = "image_quantity"
//      case gender
//   }
//   
//   public init(from decoder: Decoder) throws {
//      let container = try decoder.container(keyedBy: CodingKeys.self)
//      self.variation = try container.decodeIfPresent(Int.self, forKey: .variation) ?? 1
//      self.watermark = try container.decodeIfPresent(Bool.self, forKey: .watermark) ?? true
//      self.aspectRatio = try container.decodeIfPresent(ImagePreferences.AspectRadio.self, forKey: .aspectRatio) ?? .oneToOne
//      self.imageQuality = try container.decodeIfPresent(ImagePreferences.ImageQuality.self, forKey: .imageQuality) ?? .standard
//      self.parallelGenerations = try container.decodeIfPresent(Bool.self, forKey: .parallelGenerations) ?? false
//      self.skipGenerationQueue = try container.decodeIfPresent(Bool.self, forKey: .skipGenerationQueue) ?? false
//      let quantity = try container.decodeIfPresent(Int.self, forKey: .imageQuantity) ?? 1
//      self.imageQuantity = max(quantity, 1)
//      self.gender = try container.decodeIfPresent(String.self, forKey: .gender) ?? ""
//   }
//   
//   init(watermark: Bool?, aspectRatio: String?, imageQuality: String?, parallelGenerations: Bool?, skipGenerationQueue: Bool?, gender: String?, imageQuantity: Int) {
//      self.watermark = watermark ?? true
//      if let ar = aspectRatio {
//         self.aspectRatio = AspectRadio(rawValue: ar) ?? .oneToOne
//      } else {
//         self.aspectRatio = .oneToOne
//      }
//      
//      if let iq = imageQuality {
//         self.imageQuality = ImageQuality(rawValue: iq) ?? .standard
//      } else {
//         self.imageQuality = .standard
//      }
//      self.parallelGenerations = parallelGenerations ?? false
//      self.skipGenerationQueue = skipGenerationQueue ?? false
//      self.gender = gender ?? ""
//      self.imageQuantity = imageQuantity
//   }
//   
//   init() {
//      self.watermark = true
//      self.aspectRatio = .oneToOne
//      self.imageQuality = .standard
//      self.parallelGenerations = false
//      self.skipGenerationQueue = false
//      self.gender = ""
//   }
//   
//   var creditCosts: Int {
//      return 0//V2GenerateManager.estimatedCredits(count: imageQuantity)
//   }
//}
//
//struct Preferences: Codable {
//   let imageQuantity: Int
//   let skinTone: String
//   let weight: String
//   let height: String
//   let hair: String
//   let aiModel: String
//   let realisticImages: Bool
//   let autoFaceSmoothing: String
//   let lighting: String
//   let photoType: String
//   let shotType: String
//   let bustSize: String
//   let hairStyle: String
//   let nsfwFilter: Bool
//   
//   enum CodingKeys: String, CodingKey {
//      case imageQuantity = "image_quantity"
//      case skinTone = "skin_tone"
//      case weight
//      case height
//      case hair
//      case aiModel = "ai_model"
//      case realisticImages = "realistic_images"
//      case autoFaceSmoothing = "auto_face_smoothing"
//      case lighting
//      case photoType = "photo_type"
//      case shotType = "shot_type"
//      case bustSize = "bust_size"
//      case hairStyle = "hair_style"
//      case nsfwFilter = "nsfw_filter"
//   }
//   
//   init(from decoder: Decoder) throws {
//      let container = try decoder.container(keyedBy: CodingKeys.self)
//      self.imageQuantity = try container.decodeIfPresent(Int.self, forKey: .imageQuantity) ?? 1
//      self.skinTone = try container.decodeIfPresent(String.self, forKey: .skinTone) ?? ""
//      self.weight = try container.decodeIfPresent(String.self, forKey: .weight) ?? ""
//      self.height = try container.decodeIfPresent(String.self, forKey: .height) ?? ""
//      self.hair = try container.decodeIfPresent(String.self, forKey: .hair) ?? ""
//      self.aiModel = try container.decodeIfPresent(String.self, forKey: .aiModel) ?? ""
//      self.realisticImages = try container.decodeIfPresent(Bool.self, forKey: .realisticImages) ?? false
//      self.autoFaceSmoothing = try container.decodeIfPresent(String.self, forKey: .autoFaceSmoothing) ?? ""
//      self.lighting = try container.decodeIfPresent(String.self, forKey: .lighting) ?? ""
//      self.photoType = try container.decodeIfPresent(String.self, forKey: .photoType) ?? ""
//      self.shotType = try container.decodeIfPresent(String.self, forKey: .shotType) ?? ""
//      self.bustSize = try container.decodeIfPresent(String.self, forKey: .bustSize) ?? ""
//      self.hairStyle = try container.decodeIfPresent(String.self, forKey: .hairStyle) ?? ""
//      self.nsfwFilter = try container.decodeIfPresent(Bool.self, forKey: .nsfwFilter) ?? true
//   }
//}
//
//
//enum SubscriptionName: String, Codable {
//   case lite = "Lite"
//   case plus = "Plus"
//   case pro = "Pro"
//   
//   var intValue: Int {
//      switch self {
//      case .lite:
//         return 0
//      case .plus:
//         return 1
//      case .pro:
//         return 2
//      }
//   }
//   
////   var icon: UIImage {
////      switch self {
////      case .lite:
////         return RImage.ic_sub_lite_color()!
////      case .plus:
////         return RImage.ic_sub_plus()!
////      case .pro:
////         return RImage.ic_sub_pro()!
////      }
////   }
////   
////   var purcharseIcon: UIImage {
////      switch self {
////      case .lite:
////         return RImage.v3_ic_sub_lite()!
////      case .plus:
////         return RImage.ic_sub_plus()!
////      case .pro:
////         return RImage.ic_sub_pro()!
////      }
////   }
////   
////   var whiteIcon: UIImage {
////      switch self {
////      case .lite:
////         return RImage.ic_sub_lite()!
////      case .plus:
////         return RImage.ic_sub_plus()!
////      case .pro:
////         return RImage.ic_sub_pro()!
////      }
////   }
////   
////   var subIcon: UIImage {
////      switch self {
////      case .lite:
////         return RImage.v4_sub_lite_icon()!
////      case .plus:
////         return RImage.v4_sub_plus_icon()!
////      case .pro:
////         return RImage.v4_sub_pro_icon()!
////      }
////   }
////   
////   var subBgImage: UIImage {
////      switch self {
////      case .lite:
////         return RImage.v4_sub_bg_lite()!
////      case .plus:
////         return RImage.v4_sub_bg_plus()!
////      case .pro:
////         return RImage.v4_sub_bg_pro()!
////      }
////   }
//}
//
//extension SubscriptionInfo {
////   var icon: UIImage {
////      return subscriptionName.icon
////   }
////   
////   // 白色图标
////   var whiteIcon: UIImage {
////      return subscriptionName.whiteIcon
////   }
//}
//
//struct SubscriptionsModel: Codable {
//   let currentSubscription: String?
//   let nextPaymentDate: String?
//   let subscriptions: [SubscriptionInfo]
//   
//   var subscriptionName: SubscriptionName? {
//      if let sub = currentSubscription {
//         return  SubscriptionName(rawValue: sub)
//      }
//      return nil
//   }
// 
//   // 自定义参数
////   var contents: [SubscriptionModel]
//   
//   enum CodingKeys: String, CodingKey {
//      case currentSubscription = "current_subscription"
//      case nextPaymentDate = "next_payment_date"
//      case subscriptions
////      case contents
//   }
//   
//   init(from decoder: Decoder) throws {
//      let container = try decoder.container(keyedBy: CodingKeys.self)
//      self.currentSubscription = try container.decodeIfPresent(String.self, forKey: .currentSubscription)
//      self.nextPaymentDate = try container.decodeIfPresent(String.self, forKey: .nextPaymentDate)
//      self.subscriptions = try container.decode([SubscriptionInfo].self, forKey: .subscriptions)
////      self.contents = try container.decodeIfPresent([SubscriptionModel].self, forKey: .contents) ?? SubscriptionModel.parse(json: contentsJson)
//   }
//}
//
//class SubscriptionInfo: Codable, Equatable {
//   static func == (lhs: SubscriptionInfo, rhs: SubscriptionInfo) -> Bool {
//      return lhs.subscriptionId == rhs.subscriptionId
//   }
//   
//   let subscriptionId: String
//   let subscriptionName: SubscriptionName
//   let subscriptionCover: String?
//   let subscriptionDescription: String
//   let price: String
//   let currency: String
//   let credits: Int
//   let flag: SubscriptionFlag
//   // 自定义字段
////   let contents: [SubscriptionModel]
//   let description: String
//   var isYearly: Bool
//   
//   var contents: SubscriptionModel {
//      var retrainTimes: String = ""
//      if flag.retrainFaceModelCount == 0 {
//         retrainTimes = ""
//      } else {
//         retrainTimes = "\(flag.retrainFaceModelCount)"
//      }
//      
//      var contents = [
////         SubscriptionContentModel(text: RString.sub_modelCount(), enabled: true),
////         SubscriptionContentModel(text: RString.sub_retrain_model(retrainTimes), enabled: flag.retrainFaceModelEnabled),
////         SubscriptionContentModel(text: RString.sub_generated_count(credits), enabled: true),
////         SubscriptionContentModel(text: RString.sub_aspect_ratios(), enabled: flag.aspectRatiosEnabled),
////         SubscriptionContentModel(text: RString.sub_no_watermark(), enabled: flag.noWatermarkEnabled),
////         SubscriptionContentModel(text: RString.sub_image_quality(), enabled: flag.imageQualityEnabled),
////         SubscriptionContentModel(text: RString.sub_skip_queue(), enabled: flag.skipGenerationQueue),
////         SubscriptionContentModel(text: RString.sub_paralle_generation(), enabled: flag.parallelImageGeneration)
//      ]
//      if Environment.isHongKong {
//         contents.append(SubscriptionContentModel(text: RString.v4_sub_nsfw_filter(), enabled: flag.nsfwFilterDisabled))
//      }
//      return SubscriptionModel(title: RString.sub_title1(), content: contents)
//   }
//   
//   
//   enum CodingKeys: String, CodingKey {
//      case subscriptionId = "subscription_id"
//      case subscriptionName = "subscription_name"
//      case subscriptionCover = "subscription_cover"
//      case subscriptionDescription = "subscription_description"
//      case price
//      case currency
//      case credits
//      case flag
//      // 自定义字段
////      case contents
//      case description
//      case isYearly = "is_yearly"
//   }
//   
//   required init(from decoder: Decoder) throws {
//      let container = try decoder.container(keyedBy: CodingKeys.self)
//      self.subscriptionId = try container.decode(String.self, forKey: .subscriptionId)
//      self.subscriptionName = try container.decode(SubscriptionName.self, forKey: .subscriptionName)
//      self.subscriptionCover = try container.decodeIfPresent(String.self, forKey: .subscriptionCover)
//      self.subscriptionDescription = try container.decode(String.self, forKey: .subscriptionDescription)
//      self.price = try container.decode(String.self, forKey: .price)
//      self.currency = try container.decode(String.self, forKey: .currency)
//      self.credits = try container.decode(Int.self, forKey: .credits)
//      self.flag = try container.decode(SubscriptionFlag.self, forKey: .flag)
//      self.isYearly = try container.decodeIfPresent(Bool.self, forKey: .isYearly) ?? false
//      
//      switch subscriptionName {
//      case .lite:
//         self.description = RString.v2_subscription_lite_desc()
//      case .plus:
//         self.description = RString.v2_subscription_plus_desc()
//      case .pro:
//         self.description = RString.v2_subscription_pro_desc()
//      }
//   }
//}
//
//struct SubscriptionFlag: Codable {
//   let trainedFaceModelCount: Int
//   let retrainFaceModelEnabled: Bool
//   let retrainFaceModelCount: Int
//   let generatedImageCount: Int
//   let aspectRatiosEnabled: Bool
//   let noWatermarkEnabled: Bool
//   let imageQualityEnabled: Bool
//   let skipGenerationQueue: Bool
//   let parallelImageGeneration: Bool
//   let nsfwFilterDisabled: Bool
//   
//   enum CodingKeys: String, CodingKey {
//      case trainedFaceModelCount = "trained_face_model_count"
//      case retrainFaceModelEnabled = "retrain_face_model_enabled"
//      case retrainFaceModelCount = "retrain_face_model_count"
//      case generatedImageCount = "generated_image_count"
//      case aspectRatiosEnabled = "aspect_ratios_enabled"
//      case noWatermarkEnabled = "no_watermark_enabled"
//      case imageQualityEnabled = "image_qulity_enabled"
//      case skipGenerationQueue = "skip_generation_queue"
//      case parallelImageGeneration = "parallel_image_generation"
//      case nsfwFilterDisabled = "nsfw_filter_disabled"
//   }
//   
//   init(from decoder: Decoder) throws {
//      let container = try decoder.container(keyedBy: CodingKeys.self)
//      self.trainedFaceModelCount = try container.decode(Int.self, forKey: .trainedFaceModelCount)
//      self.retrainFaceModelEnabled = try container.decode(Bool.self, forKey: .retrainFaceModelEnabled)
//      self.retrainFaceModelCount = try container.decode(Int.self, forKey: .retrainFaceModelCount)
//      self.generatedImageCount = try container.decode(Int.self, forKey: .generatedImageCount)
//      self.aspectRatiosEnabled = try container.decode(Bool.self, forKey: .aspectRatiosEnabled)
//      self.noWatermarkEnabled = try container.decode(Bool.self, forKey: .noWatermarkEnabled)
//      self.imageQualityEnabled = try container.decode(Bool.self, forKey: .imageQualityEnabled)
//      self.skipGenerationQueue = try container.decode(Bool.self, forKey: .skipGenerationQueue)
//      self.parallelImageGeneration = try container.decode(Bool.self, forKey: .parallelImageGeneration)
//      self.nsfwFilterDisabled = try container.decodeIfPresent(Bool.self, forKey: .nsfwFilterDisabled) ?? true
//   }
//}
//
//
//struct SubscriptionContentModel: Codable {
//   let text: String
//   let enabled: Bool
//}
//
//struct SubscriptionModel: Codable {
//   let title: String
//   let content: [SubscriptionContentModel]
//}
//
//
//struct SubscriptionValidModel: Codable {
//   let id: Int
//   let subscriptionId: String
//   let expiresAt: String
//   let renew: Bool //是否是刷新订阅
//   
//   enum CodingKeys: String, CodingKey {
//      case id
//      case subscriptionId = "subscription_id"
//      case expiresAt = "expires_at"
//      case renew
//   }
//   
//   init(from decoder: Decoder) throws {
//      let container = try decoder.container(keyedBy: CodingKeys.self)
//      self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
//      self.subscriptionId = try container.decodeIfPresent(String.self, forKey: .subscriptionId) ?? ""
//      self.expiresAt = try container.decodeIfPresent(String.self, forKey: .expiresAt) ?? ""
//      self.renew = try container.decodeIfPresent(Bool.self, forKey: .renew) ?? false
//   }
//}
