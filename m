From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 19/19] sony-laptop: notify userspace of GFX switch position changes
Date: Sat, 19 May 2012 22:36:02 +0900
Message-ID: <1337434562-12283-20-git-send-email-malattia@linux.it>
References: <1337434562-12283-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:47640 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756178Ab2ESNpM (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 19 May 2012 09:45:12 -0400
In-Reply-To: <1337434562-12283-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Marco Chiappero <marco@absence.it>, Mattia Dongili <malattia@linux.it>

From: Marco Chiappero <marco@absence.it>

Some Vaios come with both integrated and discrete graphics, plus a
switch for choosing one of the two. When the switch position is changed,
a notification is generated.

Signed-off-by: Marco Chiappero <marco@absence.it>
Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c |   21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 7f56f8d..48a1ca6 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -1223,7 +1223,8 @@ enum event_types {
 	HOTKEY = 1,
 	KILLSWITCH,
 	HDDSHOCK,
-	ALS
+	ALS,
+	GFX_SWITCH
 };
 static void sony_nc_notify(struct acpi_device *device, u32 event)
 {
@@ -1310,6 +1311,24 @@ static void sony_nc_notify(struct acpi_device *device, u32 event)
 			ev_type = ALS;
 			break;
 
+		case 0x0128:
+		case 0x0146:
+			/* Hybrid GFX switching */
+			sony_call_snc_handle(handle, 0x0000, &result);
+			dprintk("GFX switch event received (reason: %s)\n",
+					(result & 0x01) ?
+					"switch change" : "unknown");
+
+			/* verify the switch state
+			 * 1: discrete GFX
+			 * 0: integrated GFX
+			 */
+			sony_call_snc_handle(handle, 0x0100, &result);
+
+			ev_type = GFX_SWITCH;
+			real_ev = result & 0xff;
+			break;
+
 		default:
 			dprintk("Unknown event 0x%x for handle 0x%x\n",
 					event, handle);
-- 
1.7.10
