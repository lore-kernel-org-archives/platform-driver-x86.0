From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 18/19] sony-laptop: use an enum for SNC event types
Date: Sat, 19 May 2012 22:36:01 +0900
Message-ID: <1337434562-12283-19-git-send-email-malattia@linux.it>
References: <1337434562-12283-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:47642 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756415Ab2ESNpM (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 19 May 2012 09:45:12 -0400
In-Reply-To: <1337434562-12283-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c |   18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 3a95855..7f56f8d 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -1219,6 +1219,12 @@ static int sony_nc_hotkeys_decode(u32 event, unsigned int handle)
 /*
  * ACPI callbacks
  */
+enum event_types {
+	HOTKEY = 1,
+	KILLSWITCH,
+	HDDSHOCK,
+	ALS
+};
 static void sony_nc_notify(struct acpi_device *device, u32 event)
 {
 	u32 real_ev = event;
@@ -1243,7 +1249,7 @@ static void sony_nc_notify(struct acpi_device *device, u32 event)
 		/* hotkey event */
 		case 0x0100:
 		case 0x0127:
-			ev_type = 1;
+			ev_type = HOTKEY;
 			real_ev = sony_nc_hotkeys_decode(event, handle);
 
 			if (real_ev > 0)
@@ -1263,7 +1269,7 @@ static void sony_nc_notify(struct acpi_device *device, u32 event)
 			 * update the rfkill device status when the
 			 * switch is moved.
 			 */
-			ev_type = 2;
+			ev_type = KILLSWITCH;
 			sony_call_snc_handle(handle, 0x0100, &result);
 			real_ev = result & 0x03;
 
@@ -1276,7 +1282,7 @@ static void sony_nc_notify(struct acpi_device *device, u32 event)
 		/* hdd protection event */
 		case 0x0134:
 		case 0x0147:
-			ev_type = 3;
+			ev_type = HDDSHOCK;
 			break;
 
 		case 0x0143:
@@ -1287,7 +1293,7 @@ static void sony_nc_notify(struct acpi_device *device, u32 event)
 					real_ev == 1 ?
 					"light" : "backlight");
 
-			ev_type = 4;
+			ev_type = ALS;
 			break;
 
 		case 0x012f:
@@ -1301,7 +1307,7 @@ static void sony_nc_notify(struct acpi_device *device, u32 event)
 					als_handle->ops->event_handler)
 				als_handle->ops->event_handler();
 
-			ev_type = 4;
+			ev_type = ALS;
 			break;
 
 		default:
@@ -1316,7 +1322,7 @@ static void sony_nc_notify(struct acpi_device *device, u32 event)
 
 	} else {
 		/* old style event */
-		ev_type = 1;
+		ev_type = HOTKEY;
 		sony_laptop_report_input_event(real_ev);
 	}
 
-- 
1.7.10
