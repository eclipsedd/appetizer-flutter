import 'package:appetizer/data/constants/api_endpoints.dart';
import 'package:appetizer/domain/models/appetizer_version.dart';
import 'package:appetizer/domain/models/feedback/appetizer_feedback.dart';
import 'package:appetizer/domain/models/feedback/feedback_response.dart';
import 'package:appetizer/domain/models/leaves/paginated_leaves.dart';
import 'package:appetizer/domain/models/menu/week_menu.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'dart:async';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiEndpoints.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(ApiEndpoints.checkVersion)
  Future<AppetizerVersion> checkVersion(
    @Path("platform") String platform,
    @Path("versionNumber") String versionNumber,
  );

  // TODO: add token to all headers
  // TODO: find a way to remove maps

  // Coupon API

  @POST(ApiEndpoints.coupon)
  Future<CouponStatus> applyForCoupon(
    @Body() Map<String, dynamic> map,
  );

  @PATCH(ApiEndpoints.couponWithId)
  Future<CouponStatus> cancelCoupon(
    @Path("couponId") String couponId,
    @Body() Map<String, dynamic> map,
  );

  // Feedback API

  @GET(ApiEndpoints.submittedFeedback)
  Future<List<AppetizerFeedback>> submittedFeedbacks();

  @GET(ApiEndpoints.responseOfFeedback)
  Future<List<FeedbackResponse>> responseOfFeedbacks();

  @POST(ApiEndpoints.newFeedback)
  Future<AppetizerFeedback> newFeedback(
    @Body() Map<String, dynamic> map,
  );

  // Leave API

  @GET(ApiEndpoints.remainingLeaves)
  Future<int> remainingLeaves();

  @GET(ApiEndpoints.getLeaves)
  Future<PaginatedLeaves> getLeaves(
    @Query("year") String year,
    @Query("month") String? month,
  );

  @POST(ApiEndpoints.check)
  Future<bool> checkout(
    @Body() Map<String, dynamic> map,
  );

  @POST(ApiEndpoints.check)
  Future<bool> checkin(
    @Body() Map<String, dynamic> map,
  );

  @POST(ApiEndpoints.leave)
  Future<void> leave(
    @Body() Map<String, dynamic> map,
  );

  @DELETE(ApiEndpoints.cancelLeave)
  Future<void> cancelLeave(
    @Path("id") int id,
  );

  // Menu API

  @GET(ApiEndpoints.weekMenuMultimessing)
  Future<WeekMenu> weekMenuMultimessing(
    @Query("hostel") String hostelCode,
    @Query("week_id") String week,
  );

  @GET(ApiEndpoints.weekMenuForYourMeals)
  Future<WeekMenu> weekMenuForYourMeals(
    @Query("week_id") String week,
  );

  @GET(ApiEndpoints.weekMenu)
  Future<WeekMenu> weekMenuByWeekId(
    @Query("week_id") String week,
  );

  @GET(ApiEndpoints.weekMenu)
  Future<WeekMenu> currentWeekMenu();

  @GET(ApiEndpoints.dayMenu)
  Future<WeekMenu> dayMenu(
    @Path("week") String week,
    @Path("dayOfWeek") String dayOfWeek,
  );
}
