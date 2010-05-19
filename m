From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: [PATCH 01/14] thinkpad-acpi: constrain IBM-era support to IBM boxes
Date: Wed, 19 May 2010 00:26:11 -0300
Message-ID: <1274239584-17743-2-git-send-email-hmh@hmh.eng.br>
References: <1274239584-17743-1-git-send-email-hmh@hmh.eng.br>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out3.smtp.messagingengine.com ([66.111.4.27]:47234 "EHLO
	out3.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752213Ab0ESD0d (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 18 May 2010 23:26:33 -0400
In-Reply-To: <1274239584-17743-1-git-send-email-hmh@hmh.eng.br>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, Henrique de Moraes Holschuh <hmh@hmh.eng.br>

Lenovo is playing around with its ACPI BIOS, and will end up reusing
method names.  Their memory is not nearly as long as thinkpad-acpi's...

Secure most of the old IBM codepaths against running in a non-IBM box.
This would happen on the Lenovo X100e in video_init(), for example.  We
would misdetect it as an ancient model 570 firmware.

Also, refuse to load the driver if we cannot identify the vendor.  No
ACPI ThinkPad in existence lacks this information, AFAIK.

Signed-off-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
---
 drivers/platform/x86/thinkpad_acpi.c |   57 +++++++++++++++++++++++-----------
 1 files changed, 39 insertions(+), 18 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 63290b3..21759da 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -480,6 +480,15 @@ static unsigned long __init tpacpi_check_quirks(
 	return 0;
 }
 
+static inline bool __pure __init tpacpi_is_lenovo(void)
+{
+	return thinkpad_id.vendor == PCI_VENDOR_ID_LENOVO;
+}
+
+static inline bool __pure __init tpacpi_is_ibm(void)
+{
+	return thinkpad_id.vendor == PCI_VENDOR_ID_IBM;
+}
 
 /****************************************************************************
  ****************************************************************************
@@ -1886,7 +1895,9 @@ static int __init thinkpad_acpi_driver_init(struct ibm_init_struct *iibm)
 		(thinkpad_id.ec_version_str) ?
 			thinkpad_id.ec_version_str : "unknown");
 
-	if (thinkpad_id.vendor && thinkpad_id.model_str)
+	BUG_ON(!thinkpad_id.vendor);
+
+	if (thinkpad_id.model_str)
 		printk(TPACPI_INFO "%s %s, model %s\n",
 			(thinkpad_id.vendor == PCI_VENDOR_ID_IBM) ?
 				"IBM" : ((thinkpad_id.vendor ==
@@ -3353,7 +3364,7 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 		goto err_exit;
 	}
 
-	if (thinkpad_id.vendor == PCI_VENDOR_ID_LENOVO) {
+	if (tpacpi_is_lenovo()) {
 		dbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_HKEY,
 			   "using Lenovo default hot key map\n");
 		memcpy(hotkey_keycode_map, &lenovo_keycode_map,
@@ -4422,7 +4433,8 @@ static int __init video_init(struct ibm_init_struct *iibm)
 	vdbg_printk(TPACPI_DBG_INIT, "initializing video subdriver\n");
 
 	TPACPI_ACPIHANDLE_INIT(vid);
-	TPACPI_ACPIHANDLE_INIT(vid2);
+	if (tpacpi_is_ibm())
+		TPACPI_ACPIHANDLE_INIT(vid2);
 
 	if (vid2_handle && acpi_evalf(NULL, &ivga, "\\IVGA", "d") && ivga)
 		/* G41, assume IVGA doesn't change */
@@ -4431,10 +4443,12 @@ static int __init video_init(struct ibm_init_struct *iibm)
 	if (!vid_handle)
 		/* video switching not supported on R30, R31 */
 		video_supported = TPACPI_VIDEO_NONE;
-	else if (acpi_evalf(vid_handle, &video_orig_autosw, "SWIT", "qd"))
+	else if (tpacpi_is_ibm() &&
+		 acpi_evalf(vid_handle, &video_orig_autosw, "SWIT", "qd"))
 		/* 570 */
 		video_supported = TPACPI_VIDEO_570;
-	else if (acpi_evalf(vid_handle, &video_orig_autosw, "^VADL", "qd"))
+	else if (tpacpi_is_ibm() &&
+		 acpi_evalf(vid_handle, &video_orig_autosw, "^VADL", "qd"))
 		/* 600e/x, 770e, 770x */
 		video_supported = TPACPI_VIDEO_770;
 	else
@@ -4811,8 +4825,10 @@ static int __init light_init(struct ibm_init_struct *iibm)
 
 	vdbg_printk(TPACPI_DBG_INIT, "initializing light subdriver\n");
 
-	TPACPI_ACPIHANDLE_INIT(ledb);
-	TPACPI_ACPIHANDLE_INIT(lght);
+	if (tpacpi_is_ibm()) {
+		TPACPI_ACPIHANDLE_INIT(ledb);
+		TPACPI_ACPIHANDLE_INIT(lght);
+	}
 	TPACPI_ACPIHANDLE_INIT(cmos);
 	INIT_WORK(&tpacpi_led_thinklight.work, light_set_status_worker);
 
@@ -5284,10 +5300,10 @@ static int __init led_init(struct ibm_init_struct *iibm)
 	if (!led_handle)
 		/* led not supported on R30, R31 */
 		led_supported = TPACPI_LED_NONE;
-	else if (strlencmp(led_path, "SLED") == 0)
+	else if (tpacpi_is_ibm() && strlencmp(led_path, "SLED") == 0)
 		/* 570 */
 		led_supported = TPACPI_LED_570;
-	else if (strlencmp(led_path, "SYSL") == 0)
+	else if (tpacpi_is_ibm() && strlencmp(led_path, "SYSL") == 0)
 		/* 600e/x, 770e, 770x, A21e, A2xm/p, T20-22, X20-21 */
 		led_supported = TPACPI_LED_OLD;
 	else
@@ -5741,11 +5757,12 @@ static int __init thermal_init(struct ibm_init_struct *iibm)
 			    TPACPI_THERMAL_TPEC_16 : TPACPI_THERMAL_TPEC_8;
 		}
 	} else if (acpi_tmp7) {
-		if (acpi_evalf(ec_handle, NULL, "UPDT", "qv")) {
+		if (tpacpi_is_ibm() &&
+		    acpi_evalf(ec_handle, NULL, "UPDT", "qv")) {
 			/* 600e/x, 770e, 770x */
 			thermal_read_mode = TPACPI_THERMAL_ACPI_UPDT;
 		} else {
-			/* Standard ACPI TMPx access, max 8 sensors */
+			/* IBM/LENOVO DSDT EC.TMPx access, max 8 sensors */
 			thermal_read_mode = TPACPI_THERMAL_ACPI_TMP07;
 		}
 	} else {
@@ -6249,7 +6266,7 @@ static int __init brightness_init(struct ibm_init_struct *iibm)
 	}
 
 	/* Safety */
-	if (thinkpad_id.vendor != PCI_VENDOR_ID_IBM &&
+	if (!tpacpi_is_ibm() &&
 	    (brightness_mode == TPACPI_BRGHT_MODE_ECNVRAM ||
 	     brightness_mode == TPACPI_BRGHT_MODE_EC))
 		return -EINVAL;
@@ -7968,9 +7985,11 @@ static int __init fan_init(struct ibm_init_struct *iibm)
 	tp_features.second_fan = 0;
 	fan_control_desired_level = 7;
 
-	TPACPI_ACPIHANDLE_INIT(fans);
-	TPACPI_ACPIHANDLE_INIT(gfan);
-	TPACPI_ACPIHANDLE_INIT(sfan);
+	if (tpacpi_is_ibm()) {
+		TPACPI_ACPIHANDLE_INIT(fans);
+		TPACPI_ACPIHANDLE_INIT(gfan);
+		TPACPI_ACPIHANDLE_INIT(sfan);
+	}
 
 	quirks = tpacpi_check_quirks(fan_quirk_table,
 				     ARRAY_SIZE(fan_quirk_table));
@@ -8662,6 +8681,10 @@ static int __init probe_for_thinkpad(void)
 	if (acpi_disabled)
 		return -ENODEV;
 
+	/* It would be dangerous to run the driver in this case */
+	if (!tpacpi_is_ibm() && !tpacpi_is_lenovo())
+		return -ENODEV;
+
 	/*
 	 * Non-ancient models have better DMI tagging, but very old models
 	 * don't.  tpacpi_is_fw_known() is a cheat to help in that case.
@@ -9059,9 +9082,7 @@ static int __init thinkpad_acpi_module_init(void)
 		tpacpi_inputdev->name = "ThinkPad Extra Buttons";
 		tpacpi_inputdev->phys = TPACPI_DRVR_NAME "/input0";
 		tpacpi_inputdev->id.bustype = BUS_HOST;
-		tpacpi_inputdev->id.vendor = (thinkpad_id.vendor) ?
-						thinkpad_id.vendor :
-						PCI_VENDOR_ID_IBM;
+		tpacpi_inputdev->id.vendor = thinkpad_id.vendor;
 		tpacpi_inputdev->id.product = TPACPI_HKEY_INPUT_PRODUCT;
 		tpacpi_inputdev->id.version = TPACPI_HKEY_INPUT_VERSION;
 		tpacpi_inputdev->dev.parent = &tpacpi_pdev->dev;
-- 
1.7.1

