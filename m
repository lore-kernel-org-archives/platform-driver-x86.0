From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 14/19] sony-laptop: add support for more WWAN modems
Date: Sat, 19 May 2012 22:35:57 +0900
Message-ID: <1337434562-12283-15-git-send-email-malattia@linux.it>
References: <1337434562-12283-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:47647 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758706Ab2ESNpQ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 19 May 2012 09:45:16 -0400
In-Reply-To: <1337434562-12283-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Marco Chiappero <marco@absence.it>, Mattia Dongili <malattia@linux.it>

From: Marco Chiappero <marco@absence.it>

Also make the initialization function return a value for consistency
with all the other setup functions.

Signed-off-by: Marco Chiappero <marco@absence.it>
Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c |   53 +++++++++++++++++++++++-------------
 1 file changed, 34 insertions(+), 19 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index f2d296a..7f8de3f 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -181,7 +181,8 @@ enum sony_nc_rfkill {
 static int sony_rfkill_handle;
 static struct rfkill *sony_rfkill_devices[N_SONY_RFKILL];
 static int sony_rfkill_address[N_SONY_RFKILL] = {0x300, 0x500, 0x700, 0x900};
-static void sony_nc_rfkill_setup(struct acpi_device *device);
+static int sony_nc_rfkill_setup(struct acpi_device *device,
+		unsigned int handle);
 static void sony_nc_rfkill_cleanup(void);
 static void sony_nc_rfkill_update(void);
 
@@ -1337,7 +1338,10 @@ static void sony_nc_function_setup(struct acpi_device *device,
 			break;
 		case 0x0124:
 		case 0x0135:
-			sony_nc_rfkill_setup(device);
+			result = sony_nc_rfkill_setup(device, handle);
+			if (result)
+				pr_err("couldn't set up rfkill support (%d)\n",
+						result);
 			break;
 		case 0x0137:
 		case 0x0143:
@@ -1605,37 +1609,46 @@ static void sony_nc_rfkill_update(void)
 	}
 }
 
-static void sony_nc_rfkill_setup(struct acpi_device *device)
+static int sony_nc_rfkill_setup(struct acpi_device *device,
+		unsigned int handle)
 {
 	u64 offset;
 	int i;
 	unsigned char buffer[32] = { 0 };
 
-	offset = sony_find_snc_handle(0x124);
-	if (offset == -1) {
-		offset = sony_find_snc_handle(0x135);
-		if (offset == -1)
-			return;
-		else
-			sony_rfkill_handle = 0x135;
-	} else
-		sony_rfkill_handle = 0x124;
-	dprintk("Found rkfill handle: 0x%.4x\n", sony_rfkill_handle);
+	offset = sony_find_snc_handle(handle);
+	sony_rfkill_handle = handle;
 
 	i = sony_nc_buffer_call(sony_nc_acpi_handle, "SN06", &offset, buffer,
 			32);
 	if (i < 0)
-		return;
-
-	/* the buffer is filled with magic numbers describing the devices
-	 * available, 0xff terminates the enumeration
+		return i;
+
+	/* The buffer is filled with magic numbers describing the devices
+	 * available, 0xff terminates the enumeration.
+	 * Known codes:
+	 *	0x00 WLAN
+	 *	0x10 BLUETOOTH
+	 *	0x20 WWAN GPRS-EDGE
+	 *	0x21 WWAN HSDPA
+	 *	0x22 WWAN EV-DO
+	 *	0x23 WWAN GPS
+	 *	0x25 Gobi WWAN no GPS
+	 *	0x26 Gobi WWAN + GPS
+	 *	0x28 Gobi WWAN no GPS
+	 *	0x29 Gobi WWAN + GPS
+	 *	0x30 WIMAX
+	 *	0x50 Gobi WWAN no GPS
+	 *	0x51 Gobi WWAN + GPS
+	 *	0x70 no SIM card slot
+	 *	0x71 SIM card slot
 	 */
 	for (i = 0; i < ARRAY_SIZE(buffer); i++) {
 
 		if (buffer[i] == 0xff)
 			break;
 
-		dprintk("Radio devices, looking at 0x%.2x\n", buffer[i]);
+		dprintk("Radio devices, found 0x%.2x\n", buffer[i]);
 
 		if (buffer[i] == 0 && !sony_rfkill_devices[SONY_WIFI])
 			sony_nc_setup_rfkill(device, SONY_WIFI);
@@ -1643,13 +1656,15 @@ static void sony_nc_rfkill_setup(struct acpi_device *device)
 		if (buffer[i] == 0x10 && !sony_rfkill_devices[SONY_BLUETOOTH])
 			sony_nc_setup_rfkill(device, SONY_BLUETOOTH);
 
-		if ((0xf0 & buffer[i]) == 0x20 &&
+		if (((0xf0 & buffer[i]) == 0x20 ||
+					(0xf0 & buffer[i]) == 0x50) &&
 				!sony_rfkill_devices[SONY_WWAN])
 			sony_nc_setup_rfkill(device, SONY_WWAN);
 
 		if (buffer[i] == 0x30 && !sony_rfkill_devices[SONY_WIMAX])
 			sony_nc_setup_rfkill(device, SONY_WIMAX);
 	}
+	return 0;
 }
 
 /* Keyboard backlight feature */
-- 
1.7.10
