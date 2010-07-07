From: Axel Lin <axel.lin@gmail.com>
Subject: [PATCH 2/2] toshiba_acpi: rename add_device() and remove_device()
	to create_toshiba_proc_entries() and remove_toshiba_proc_entries()
Date: Wed, 07 Jul 2010 14:06:25 +0800
Message-ID: <1278482785.12801.33.camel@mola>
References: <1278482630.12801.30.camel@mola>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:60334 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750923Ab0GGGGO (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 7 Jul 2010 02:06:14 -0400
In-Reply-To: <1278482630.12801.30.camel@mola>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: linux-kernel <linux-kernel@vger.kernel.org>
Cc: Matthew Garrett <mjg@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, =?ISO-8859-1?Q?M=E1rton_N=E9meth?= <nm127@freemail.hu>, Alexey Dobriyan <adobriyan@gmail.com>, platform-driver-x86@vger.kernel.org

To improve readability.
This patch rename add_device() to create_toshiba_proc_entries()
and rename remove_device() to remove_toshiba_proc_entries().

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 702869a..339a402 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -720,7 +720,7 @@ static const struct file_operations version_proc_fops = {
 
 #define PROC_TOSHIBA		"toshiba"
 
-static void __init add_device(void)
+static void __init create_toshiba_proc_entries(void)
 {
 	proc_create("lcd", S_IRUGO | S_IWUSR, toshiba_proc_dir, &lcd_proc_fops);
 	proc_create("video", S_IRUGO | S_IWUSR, toshiba_proc_dir, &video_proc_fops);
@@ -729,7 +729,7 @@ static void __init add_device(void)
 	proc_create("version", S_IRUGO, toshiba_proc_dir, &version_proc_fops);
 }
 
-static void remove_device(void)
+static void remove_toshiba_proc_entries(void)
 {
 	remove_proc_entry("lcd", toshiba_proc_dir);
 	remove_proc_entry("video", toshiba_proc_dir);
@@ -903,7 +903,7 @@ static void toshiba_acpi_exit(void)
 	if (toshiba_backlight_device)
 		backlight_device_unregister(toshiba_backlight_device);
 
-	remove_device();
+	remove_toshiba_proc_entries();
 
 	if (toshiba_proc_dir)
 		remove_proc_entry(PROC_TOSHIBA, acpi_root_dir);
@@ -965,7 +965,7 @@ static int __init toshiba_acpi_init(void)
 		toshiba_acpi_exit();
 		return -ENODEV;
 	} else {
-		add_device();
+		create_toshiba_proc_entries();
 	}
 
 	props.max_brightness = HCI_LCD_BRIGHTNESS_LEVELS - 1;
-- 
1.5.4.3
