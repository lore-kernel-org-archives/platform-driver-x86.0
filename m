Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A05443785E;
	Tue, 28 Jul 2026 12:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785241676; cv=none; b=olONoa8IKSqtcNlfQcPF+NmjeVlQkIsRVy73Prp03kk57XXYMh2FqgAMY+Fv04DW4cZPXtZGhTBCqmBfiwx4liHOmtre8F5ZxbJrSxf6ybk+I2H8jk8CVzYBsL7107SvxEeEcAzlFMXsjHDToeA92uo8c/SlWTu+koPD1tcLgWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785241676; c=relaxed/simple;
	bh=XkCGvuAwp5T2SGZZM4EAG3SnnmFDtk9scNvMl9Wjm0I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IRRK14X5Z6S6ypHRd8QyHaYRBP/JVEKU6Aags2TwUIbR7oTT5ZObjN4+qc6DwUkMa97AznqmDP/C3Dp4NP3HIjU0kdoUJ7v295rMF50C4mguhfXfHA6GWjcMNRswRyBHbFMnpj7Ov3CFQh/d0NQwayRzbtmqHKur8x+qGNDYXqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=hYVaopEr; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="hYVaopEr"
Received: from aerhardt-tuxedo.buero.augsburg.tuxedo.de (business-24-134-105-141.pool2.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: a.erhardt@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 6A0772FC007D;
	Tue, 28 Jul 2026 14:27:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1785241665;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cf314/55BNRS1Ym6vUIxaqnrX9ZH9/8Z4JOFcIE8pkc=;
	b=hYVaopErcZcqSqboIcSDaHkvEiVcZqrdQSMu3fMHZgbboDVOTgvHHQLLKUDpUwbyiFA3gP
	/aZmT8J0RPpSdrNn0eArgelYrwNMLs6yxgtKKVIXaSaKYCMt57lyjaHYDcCUK/sbCXRV2m
	2+0uPWSz0sarsVE3N0YXR2qSXSRF+Ac=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=a.erhardt@tuxedocomputers.com smtp.mailfrom=aer@tuxedocomputers.com
From: Aaron Erhardt <aer@tuxedocomputers.com>
To: wse@tuxedocomputers.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: Aaron Erhardt <aer@tuxedocomputers.com>,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 5/6] platform/x86/tuxedo: Update and extend documentation
Date: Tue, 28 Jul 2026 14:26:37 +0200
Message-ID: <20260728122647.132540-6-aer@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728122647.132540-1-aer@tuxedocomputers.com>
References: <20260728122647.132540-1-aer@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fill-in missing details, update information and
clean up some obsolete documentation.

Signed-off-by: Aaron Erhardt <aer@tuxedocomputers.com>
---
 drivers/platform/x86/tuxedo/nb04/wmi_ab.c | 51 ++++++++++++-----------
 1 file changed, 27 insertions(+), 24 deletions(-)

diff --git a/drivers/platform/x86/tuxedo/nb04/wmi_ab.c b/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
index 2b985b030197..5dedf93f6d75 100644
--- a/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
+++ b/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
@@ -1,9 +1,15 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * This driver implements the WMI AB device found on TUXEDO notebooks with board
- * vendor NB04.
+ * vendor NB04. This enables keyboard backlight control via a virtual HID
+ * LampArray device.
+ *
+ * The device will be available through the regular HID interfaces, such as
+ * hidraw and can be used by any userspace program that implements the HID
+ * LampArray standard.
  *
  * Copyright (C) 2024-2025 Werner Sembach <wse@tuxedocomputers.com>
+ * Copyright (C) 2026 Aaron Erhardt <aer@tuxedocomputers.com>
  */
 
 #include <linux/dmi.h>
@@ -488,12 +494,14 @@ static int handle_lamp_array_attributes_report(struct hid_device *hdev,
 	struct tux_hdev_driver_data_t *driver_data = hdev->driver_data;
 
 	rep->lamp_count = driver_data->lamp_count;
+
+	// Physical dimensions of the Sirius 16 keyboard
 	rep->bounding_box_width_in_micrometers = 368000;
 	rep->bounding_box_height_in_micrometers = 266000;
 	rep->bounding_box_depth_in_micrometers = 30000;
 	/*
 	 * LampArrayKindKeyboard, see "26.2.1 LampArrayKind Values" of
-	 * "HID Usage Tables v1.5"
+	 * "HID Usage Tables v1.7"
 	 */
 	rep->lamp_array_kind = 1;
 	// Some guessed value for interval microseconds
@@ -547,7 +555,7 @@ static int handle_lamp_attributes_response_report(struct hid_device *hdev,
 	rep->update_latency_in_microseconds = 100;
 	/*
 	 * LampPurposeControl, see "26.3.1 LampPurposes Flags" of
-	 * "HID Usage Tables v1.5"
+	 * "HID Usage Tables v1.7"
 	 */
 	rep->lamp_purpose = 1;
 	rep->red_level_count = 0xff;
@@ -560,8 +568,8 @@ static int handle_lamp_attributes_response_report(struct hid_device *hdev,
 		rep->input_binding = driver_data->kbl_map[lamp_id].code;
 	} else {
 		/*
-		 * Everything bigger is reserved/undefined, see
-		 * "10 Keyboard/Keypad Page (0x07)" of "HID Usage Tables v1.5"
+		 * Everything bigger than 0xe8 is reserved/undefined, see
+		 * "10 Keyboard/Keypad Page (0x07)" of "HID Usage Tables v1.7"
 		 * and should return 0, see "26.8.3 Lamp Attributes" of the same
 		 * document.
 		 */
@@ -606,10 +614,7 @@ static int handle_lamp_multi_update_report(struct hid_device *hdev,
 	u8 key_id, key_id_j, intensity_i, red_i, green_i, blue_i;
 	int ret;
 
-	/*
-	 * Catching misformatted lamp_multi_update_report and fail silently
-	 * according to "HID Usage Tables v1.5"
-	 */
+	// Catch bad reports and fail silently according to "HID Usage Tables v1.7"
 	for (unsigned int i = 0; i < rep->lamp_count; ++i) {
 		if (rep->lamp_id[i] > driver_data->lamp_count) {
 			hid_dbg(hdev, "Out of bounds lamp_id in lamp_multi_update_report. Skipping whole report!\n");
@@ -624,6 +629,7 @@ static int handle_lamp_multi_update_report(struct hid_device *hdev,
 		}
 	}
 
+	// Fill kbl_set_multiple_keys_in update buffer
 	for (unsigned int i = 0; i < rep->lamp_count; ++i) {
 		key_id = driver_data->kbl_map[rep->lamp_id[i]].code;
 
@@ -632,6 +638,8 @@ static int handle_lamp_multi_update_report(struct hid_device *hdev,
 		     ++j) {
 			rgb_configs_j = &next->kbl_set_multiple_keys_in.rgb_configs[j];
 			key_id_j = rgb_configs_j->key_id;
+
+			// Search for existing or empty entry
 			if (key_id_j != 0x00 && key_id_j != key_id)
 				continue;
 
@@ -691,10 +699,7 @@ static int handle_lamp_range_update_report(struct hid_device *hdev,
 	struct lamp_rgbi_tuple_t *update_channels_j;
 	int ret;
 
-	/*
-	 * Catching misformatted lamp_range_update_report and fail silently
-	 * according to "HID Usage Tables v1.5"
-	 */
+	// Catch bad reports and fail silently according to "HID Usage Tables v1.7"
 	if (rep->lamp_id_start > rep->lamp_id_end) {
 		hid_dbg(hdev, "lamp_id_start > lamp_id_end in lamp_range_update_report. Skipping whole report!\n");
 		return sizeof(*rep);
@@ -706,8 +711,8 @@ static int handle_lamp_range_update_report(struct hid_device *hdev,
 	}
 
 	/*
-	 * Break handle_lamp_range_update_report call down to multiple
-	 * handle_lamp_multi_update_report calls to easily ensure that mixing
+	 * Break handle_lamp_range_update_report call down into multiple
+	 * handle_lamp_multi_update_report calls to ensure that mixing
 	 * handle_lamp_range_update_report and handle_lamp_multi_update_report
 	 * does not break things.
 	 */
@@ -750,15 +755,12 @@ static int handle_lamp_array_control_report(struct hid_device *hdev __always_unu
 					    struct lamp_array_control_report_t *rep)
 {
 	/*
-	 * The keyboards firmware doesn't have any built in controls and the
-	 * built in effects are not implemented so this is a NOOP.
-	 * According to the HID Documentation (HID Usage Tables v1.5) this
+	 * The keyboards firmware doesn't have any built-in controls and the
+	 * built-in effects are not implemented so this is a NOOP.
+	 * According to the HID Documentation (HID Usage Tables v1.7) this
 	 * function is optional and can be removed from the HID Report
 	 * Descriptor, but it should first be confirmed that userspace respects
-	 * this possibility too. The Microsoft MacroPad reference implementation
-	 * (https://github.com/microsoft/RP2040MacropadHidSample 1d6c3ad)
-	 * already deviates from the spec at another point, see
-	 * handle_lamp_*_update_report.
+	 * this possibility too.
 	 */
 
 	return sizeof(*rep);
@@ -894,8 +896,8 @@ static struct wmi_driver tuxedo_nb04_wmi_tux_driver = {
 };
 
 /*
- * We don't know if the WMI API is stable and how unique the GUID is for this
- * ODM. To be on the safe side we therefore only run this driver on tested
+ * We don't know whether the WMI API is stable and how unique the GUID is for
+ * this ODM. To be on the safe side we therefore only run this driver on tested
  * devices defined by this list.
  */
 static const struct dmi_system_id tested_devices_dmi_table[] __initconst = {
@@ -933,4 +935,5 @@ module_exit(tuxedo_nb04_wmi_tux_exit);
 
 MODULE_DESCRIPTION("Virtual HID LampArray interface for TUXEDO NB04 devices");
 MODULE_AUTHOR("Werner Sembach <wse@tuxedocomputers.com>");
+MODULE_AUTHOR("Aaron Erhardt <aer@tuxedocomputers.com>");
 MODULE_LICENSE("GPL");
-- 
2.43.0

