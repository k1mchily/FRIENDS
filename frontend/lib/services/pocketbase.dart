import 'package:pocketbase/pocketbase.dart';

/* 
Backend URLs:
'http://127.0.0.1:8090' - Windows / Desktop
'http://10.0.2.2:8090'  - Android Emulator
'http://localhost:8090' - Mac/Linux
'http://<your-ip>:8090' - Mobile devices (replace <your-ip> with machine IP)
*/
const String backendUrl = 'http://127.0.0.1:8090';

// Global PocketBase instance
late final PocketBase pb;

void initPocketBase() {
  pb = PocketBase(backendUrl);
}
