From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 4/4] sony-laptop: support basic functions for handle 0x14B and 0x14C
Date: Fri, 21 Dec 2012 07:21:11 +0900
Message-ID: <1356042071-8903-5-git-send-email-malattia@linux.it>
References: <1356042071-8903-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:37697 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751607Ab2LTW2E (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 20 Dec 2012 17:28:04 -0500
In-Reply-To: <1356042071-8903-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

Z series and other recent models have 0x14? for lid and keyboard
backlight.

Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c |   20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 385835d..075f998 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -1373,6 +1373,8 @@ static void sony_nc_function_setup(struct acpi_device *device,
 			break;
 		case 0x0137:
 		case 0x0143:
+		case 0x014b:
+		case 0x014c:
 			result = sony_nc_kbd_backlight_setup(pf_device, handle);
 			if (result)
 				pr_err("couldn't set up keyboard backlight function (%d)\n",
@@ -1435,6 +1437,8 @@ static void sony_nc_function_cleanup(struct platform_device *pd)
 			break;
 		case 0x0137:
 		case 0x0143:
+		case 0x014b:
+		case 0x014c:
 			sony_nc_kbd_backlight_cleanup(pd);
 			break;
 		default:
@@ -1479,6 +1483,8 @@ static void sony_nc_function_resume(void)
 			break;
 		case 0x0137:
 		case 0x0143:
+		case 0x014b:
+		case 0x014c:
 			sony_nc_kbd_backlight_resume();
 			break;
 		default:
@@ -2636,6 +2642,8 @@ static void sony_nc_backlight_ng_read_limits(int handle,
 		lvl_table_len = 9;
 		break;
 	case 0x143:
+	case 0x14b:
+	case 0x14c:
 		lvl_table_len = 16;
 		break;
 	}
@@ -2687,6 +2695,18 @@ static void sony_nc_backlight_setup(void)
 		sony_nc_backlight_ng_read_limits(0x143, &sony_bl_props);
 		max_brightness = sony_bl_props.maxlvl - sony_bl_props.offset;
 
+	} else if (sony_find_snc_handle(0x14b) >= 0) {
+		ops = &sony_backlight_ng_ops;
+		sony_bl_props.cmd_base = 0x3000;
+		sony_nc_backlight_ng_read_limits(0x14b, &sony_bl_props);
+		max_brightness = sony_bl_props.maxlvl - sony_bl_props.offset;
+
+	} else if (sony_find_snc_handle(0x14c) >= 0) {
+		ops = &sony_backlight_ng_ops;
+		sony_bl_props.cmd_base = 0x3000;
+		sony_nc_backlight_ng_read_limits(0x14c, &sony_bl_props);
+		max_brightness = sony_bl_props.maxlvl - sony_bl_props.offset;
+
 	} else if (ACPI_SUCCESS(acpi_get_handle(sony_nc_acpi_handle, "GBRT",
 						&unused))) {
 		ops = &sony_backlight_ops;
-- 
1.7.10.4
