From: Marco Chiappero <marco@absence.it>
Subject: [PATCH V2 1/14] sony-laptop: fix potential improper handle usage
Date: Fri, 09 Sep 2011 18:34:38 +0200
Message-ID: <1315586078.3613.76.camel@vesuvio>
References: <1315585214.3613.51.camel@vesuvio>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from s1.powermailhost.com ([93.95.221.60]:38540 "EHLO
	s1.powermailhost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752436Ab1IIQek (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 9 Sep 2011 12:34:40 -0400
In-Reply-To: <1315585214.3613.51.camel@vesuvio>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

SNC handles are positive numbers, all handles are valid with the sole
exception of handle 0x0. This patch replaces int type with unsigned int
when dealing with handles while sony_find_snc_handle now returns -1 when
its value is 0x0.

Signed-off-by: Marco Chiappero <marco@absence.it> 
--- 

--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -150,7 +150,7 @@ enum sony_nc_rfkill {
 	N_SONY_RFKILL,
 };
 
-static int sony_rfkill_handle;
+static unsigned int sony_rfkill_handle;
 static struct rfkill *sony_rfkill_devices[N_SONY_RFKILL];
 static int sony_rfkill_address[N_SONY_RFKILL] = {0x300, 0x500, 0x700,
0x900};
 static void sony_nc_rfkill_update(void);
@@ -811,12 +811,12 @@ static int sony_nc_handles_cleanup(struc
 	return 0;
 }
 
-static int sony_find_snc_handle(int handle)
+static int sony_find_snc_handle(unsigned int handle)
 {
 	int i;
 
-	/* not initialized yet, return early */
-	if (!handles)
+	/* not initialized yet or invalid handle, return early */
+	if (!handles || !handle)
 		return -1;
 
 	for (i = 0; i < 0x10; i++) {
@@ -830,7 +830,7 @@ static int sony_find_snc_handle(int hand
 	return -1;
 }
 
-static int sony_call_snc_handle(int handle, int argument, int *result)
+static int sony_call_snc_handle(unsigned int handle, int argument, int
*result)
 {
 	int ret = 0;
 	int offset = sony_find_snc_handle(handle);
@@ -937,7 +937,7 @@ static ssize_t sony_nc_sysfs_store(struc
  */
 struct sony_backlight_props {
 	struct backlight_device *dev;
-	int			handle;
+	unsigned int		handle;
 	u8			offset;
 	u8			maxlvl;
 };
@@ -1557,7 +1557,7 @@ static void sony_nc_kbd_backlight_resume
 				&ignore);
 }
 
-static void sony_nc_backlight_ng_read_limits(int handle,
+static void sony_nc_backlight_ng_read_limits(unsigned int handle,
 		struct sony_backlight_props *props)
 {
 	int offset;
