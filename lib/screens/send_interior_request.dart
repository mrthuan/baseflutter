// 📁 lib/api/send_interior_request.dart

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String?> sendInteriorRequest({
  required String apiKey,
  required String modelId,
  required String prompt,
  required String negativePrompt,
  required String initImageBase64,
  required int width,
  required int height,
}) async {
  final uri = Uri.parse('https://modelslab.com/api/v5/controlnet');

  final body = {
    "key": apiKey,
    "model_id": modelId,
    "controlnet_model": "canny",
    "controlnet_type": "canny",
    "prompt": prompt,
    "negative_prompt": negativePrompt,
    "init_image": initImageBase64,
    "control_image": initImageBase64,
    "base64": "yes", // Important to indicate image is base64
    "width": width,
    "height": height,
  };

  try {
    final response = await http.post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('📥 Response: $data');

      if (data['status'] == 'success') {
        return data['output'][0]; // URL of the processed image
      } else {
        print('⚠️ Modelslab error: ${data['messege'] ?? data['message'] ?? 'Unknown error'}');
      }
    } else {
      print('❌ HTTP ${response.statusCode}: ${response.body}');
    }
  } catch (e) {
    print('❌ Exception: $e');
  }

  return null;
}