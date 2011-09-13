From: Marco Chiappero <marco@absence.it>
Subject: [PATCH V2 RESEND 13/14] sony-laptop: input core improvements
Date: Tue, 13 Sep 2011 22:53:54 +0200
Message-ID: <1315947234.14415.162.camel@air.vesuvio.absence.it>
References: <1315585214.3613.51.camel@vesuvio>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from s1.powermailhost.com ([93.95.221.60]:34051 "EHLO
	s1.powermailhost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932446Ab1IMUx4 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 13 Sep 2011 16:53:56 -0400
In-Reply-To: <1315585214.3613.51.camel@vesuvio>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

Added a couple of Fn combos and sorted keys by "scancode" number. Fixed
a small error in a comment too.


Signed-off-by: Marco Chiappero <marco@absence.it> 
--- 

--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -239,7 +239,7 @@ static int sony_laptop_input_index[] = {
 	57,	/* 70 SONYPI_EVENT_VOLUME_DEC_PRESSED */
 	-1,	/* 71 SONYPI_EVENT_BRIGHTNESS_PRESSED */
 	58,	/* 72 SONYPI_EVENT_MEDIA_PRESSED */
-	59,	/* 72 SONYPI_EVENT_VENDOR_PRESSED */
+	59,	/* 73 SONYPI_EVENT_VENDOR_PRESSED */
 };
 
 static int sony_laptop_input_keycode_map[] = {
@@ -1084,10 +1084,6 @@ struct sony_nc_event {
 };
 
 static struct sony_nc_event sony_100_events[] = {
-	{ 0x90, SONYPI_EVENT_PKEY_P1 },
-	{ 0x10, SONYPI_EVENT_ANYBUTTON_RELEASED },
-	{ 0x91, SONYPI_EVENT_PKEY_P2 },
-	{ 0x11, SONYPI_EVENT_ANYBUTTON_RELEASED },
 	{ 0x81, SONYPI_EVENT_FNKEY_F1 },
 	{ 0x01, SONYPI_EVENT_FNKEY_RELEASED },
 	{ 0x82, SONYPI_EVENT_FNKEY_F2 },
@@ -1102,12 +1098,20 @@ static struct sony_nc_event sony_100_eve
 	{ 0x06, SONYPI_EVENT_FNKEY_RELEASED },
 	{ 0x87, SONYPI_EVENT_FNKEY_F7 },
 	{ 0x07, SONYPI_EVENT_FNKEY_RELEASED },
+	{ 0x88, SONYPI_EVENT_FNKEY_F8 },
+	{ 0x08, SONYPI_EVENT_FNKEY_RELEASED },
 	{ 0x89, SONYPI_EVENT_FNKEY_F9 },
 	{ 0x09, SONYPI_EVENT_FNKEY_RELEASED },
 	{ 0x8A, SONYPI_EVENT_FNKEY_F10 },
 	{ 0x0A, SONYPI_EVENT_FNKEY_RELEASED },
+	{ 0x8B, SONYPI_EVENT_FNKEY_F11 },
+	{ 0x0B, SONYPI_EVENT_FNKEY_RELEASED },
 	{ 0x8C, SONYPI_EVENT_FNKEY_F12 },
 	{ 0x0C, SONYPI_EVENT_FNKEY_RELEASED },
+	{ 0x90, SONYPI_EVENT_PKEY_P1 },
+	{ 0x10, SONYPI_EVENT_ANYBUTTON_RELEASED },
+	{ 0x91, SONYPI_EVENT_PKEY_P2 },
+	{ 0x11, SONYPI_EVENT_ANYBUTTON_RELEASED },
 	{ 0x9d, SONYPI_EVENT_ZOOM_PRESSED },
 	{ 0x1d, SONYPI_EVENT_ANYBUTTON_RELEASED },
 	{ 0x9f, SONYPI_EVENT_CD_EJECT_PRESSED },
