import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class GetLocation {
  Future<List<Placemark>> getLocation() async {
    // التحقق من إذن الوصول إلى الموقع
    var permissionStatus = await Permission.location.status;
// لو موفقش
    if (permissionStatus.isDenied) {
      // طلب الإذن
      permissionStatus = await Permission.location.request();
    }
//لو سمح 
    if (permissionStatus.isGranted) {
      try {

      //  لو الاذن لسه مرفوض بعد الطلب
        Position position = await Geolocator.getCurrentPosition(

            // ignore: deprecated_member_use
            desiredAccuracy: LocationAccuracy.high);   // الموقع يبقي عالي الدقة
        List<Placemark> placemarks = await placemarkFromCoordinates(
            // بنديله خط الطول والعرض 
            position.latitude, position.longitude);
  
      
        print("Location fetched: ${placemarks[0].locality}");
        return placemarks;
      } catch (e) {
        // لو حصل خطا
        print("Error getting current position: $e");
        throw Exception("Could not get current location");
      }
    } else {
     // رفض المستخدم منح إذن الوصول إلى الموقع،
      throw Exception("Location permissions are denied");
    }
  }
}
