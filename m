From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 1/7] sony-laptop: use an enum for SNC event types
Date: Sat,  9 Jun 2012 13:18:08 +0900
Message-ID: <1339215494-4020-2-git-send-email-malattia@linux.it>
References: <20120531220257.GA3986@kamineko.org>
 <1339215494-4020-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:33915 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750805Ab2FIESg (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 9 Jun 2012 00:18:36 -0400
In-Reply-To: <1339215494-4020-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c |   10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 210d4ae..615ab06 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -1172,6 +1172,10 @@ static int sony_nc_hotkeys_decode(u32 event, unsigned int handle)
 /*
  * ACPI callbacks
  */
+enum event_types {
+	HOTKEY = 1,
+	KILLSWITCH
+};
 static void sony_nc_notify(struct acpi_device *device, u32 event)
 {
 	u32 real_ev = event;
@@ -1196,7 +1200,7 @@ static void sony_nc_notify(struct acpi_device *device, u32 event)
 		/* hotkey event */
 		case 0x0100:
 		case 0x0127:
-			ev_type = 1;
+			ev_type = HOTKEY;
 			real_ev = sony_nc_hotkeys_decode(event, handle);
 
 			if (real_ev > 0)
@@ -1216,7 +1220,7 @@ static void sony_nc_notify(struct acpi_device *device, u32 event)
 			 * update the rfkill device status when the
 			 * switch is moved.
 			 */
-			ev_type = 2;
+			ev_type = KILLSWITCH;
 			sony_call_snc_handle(handle, 0x0100, &result);
 			real_ev = result & 0x03;
 
@@ -1238,7 +1242,7 @@ static void sony_nc_notify(struct acpi_device *device, u32 event)
 
 	} else {
 		/* old style event */
-		ev_type = 1;
+		ev_type = HOTKEY;
 		sony_laptop_report_input_event(real_ev);
 	}
 
-- 
1.7.10
