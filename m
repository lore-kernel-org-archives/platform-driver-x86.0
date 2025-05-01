Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40EB225A2C
	for <platform-driver-x86@vger.kernel.org>; Thu,  1 May 2025 05:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746078605; cv=none; b=fGKU6xMetipbo/sct09Qvb64QA4jdocNWsjIhDjNBbwYy4tJVZEZ9KHx2E2YmYSwcN3nFqh3bsJbzUUGxGKQ1XIBkqui7j1ecnIwk+HWrIRcBeTVoh+xFKRC2FP0EiBre+eCWNkikd0CDLW41meN7Kv0G4DrUs3MypslDXyDFRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746078605; c=relaxed/simple;
	bh=CHAIe/Aduu0jjAOkUhdYRwUwYN2uo7Y6WKvjk9Iy/JE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T+N5yV1wU5Nz+bjDXX6M4c9P4de78Y9Adh34qwfiSm36a0m7gJu5dAnPoFQwuwxAQqCwuXWXxXdUtcAh88mgt2C7Ac5cydQMPy5uY9a+fH7NdjNHzDYBsdjWQjJNhYA+zRmO3mNJ4szyIn0uICmPLMfNE+H5QIK4HOCRwkmEmBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E2qQvp6P; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E2qQvp6P"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ff64550991so545830a91.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Apr 2025 22:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746078603; x=1746683403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ePPnrHmVpm0Z+InkzGTGNsWljrYz+wjcMAGWTWtlSaI=;
        b=E2qQvp6PQGoFkjfTxeAJapTrVYPIqyqQ20tmDDyImPCF1IYq6c3uRaKRHIZ3uXITs2
         7go8gDVPG96jyM7LJr4xyUYpQkgkHeuuaZYIaZkxwWFmhGmZalLQ5frmiTXK8wbzdWhy
         SsYTDRcv3zVcW3wj2N6K76/RrM69PEHjnw5zBllb63wCQrF6FAZukFBlqrB/ZCIqvOk9
         zp2Dp0cOjrl5ZmdIuwODSaYKFljUk3oR4/7KAB+qXltiF9kegzSC8okMaj7My4nXoqu6
         TFPGqiPISCFKxdzvAAAte3j4Tp88r0FnjV8xAbIxyT6fMb+zz3SwhPma5OL/8BAA7WSO
         PVyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746078603; x=1746683403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ePPnrHmVpm0Z+InkzGTGNsWljrYz+wjcMAGWTWtlSaI=;
        b=bLI9A9SrU97a/F9kbgsixUD8KQ8WKLXwwlovg4pCkOLSZwAe7X2/vd7KS+hkndWbU3
         WnvifdE5QvppsLQdTLPZjHZhlGkMFGiqBkWZn0Jw9zlmDvVCMpau2LXuTyrjis7BmQnJ
         ip52vpL1iuMgU7AcdxGAbc6tZJ7JY2Tjsrfc4pk+evQeJZs3zWhuJcF3eITnzh7cPkdZ
         2L/sQJP+nt408rs1tVytPAb2Uqf5xUtj/ynHHGqQQEVCStN7UIRuSgWBgz7D7k0iVudi
         doQunEt3ABq/YYUgNW4Z4OBO92rpEcEkfEOQdmneO8mUxrMsvYlX+n412Y5x/A3Ks6c2
         rkeA==
X-Gm-Message-State: AOJu0YzN154tCWrxXgsJ0/jshr/vzbs94Pg0ulDM8viiZJSQzQCxL2gP
	wrF/e7JxesFdMmRRr6QXV1DcyxpKeDjamEeWbVzXoIq4vigjs5PL
X-Gm-Gg: ASbGncuSO6BWoCFiJ00GCfpT8CvtBdcAHhC5dvgZ7ke4/KQPP3LcudI9G6bkeCbbfv6
	ZpXZy7MYlgM/1X2Xc5/9bUHwGoOf1O8rY4h/LhLOBSCZxyCTCYOo+uy71MjH+GGZ2GFXRSoPXHr
	b0reJryqB7vfE2eZ6cIcP0KhuO6RXV2mku/YUoE+5QsTZy6/aaONxUYRVhBrL/cbDG5yrBgAGJZ
	JlhnTZkzuLIUtWfNI3AEB6DrNGCCE2ZCdLTSl974XVcGgfVnbPlvwN84gm32ULTPU9ypQOfK7rO
	SSaA8ZCsSXoK7LsY+eW1Sshs8fp0o+MPE3IA/PB9pDEdwbubKQJ62e0N+J5KiUwEM9S8Bv+uiE+
	lR4efd1ORTOWVhuxevR4JfU3g0xpg
X-Google-Smtp-Source: AGHT+IFkLQe1B8S8JD0HZPboF7tTTCM2cad5nxniZL+K+NMWxzStrcdubZf7bBQKYo6udlMEke73Ag==
X-Received: by 2002:a17:90b:5623:b0:2ee:e317:69ab with SMTP id 98e67ed59e1d1-30a4189295bmr2971283a91.0.1746078603065;
        Wed, 30 Apr 2025 22:50:03 -0700 (PDT)
Received: from ubuntu-ThinkPad-X9-14-Gen-1.. (127.37.178.217.static.user.transix.jp. [217.178.37.127])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a476267d5sm1589a91.33.2025.04.30.22.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 22:50:02 -0700 (PDT)
From: Nitin Joshi <nitjoshi@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com
Cc: platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	njoshi1@lenovo.com,
	Nitin Joshi <nitjoshi@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: [PATCH v4] platform/x86: thinkpad-acpi: Add support for new hotkey for  camera shutter switch
Date: Thu,  1 May 2025 14:49:50 +0900
Message-ID: <20250501054951.8442-1-nitjoshi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

New Lenovo Thinkpad models, e.g. the 'X9-14 Gen 1' and 'X9-15 Gen 1'
has new shortcut on F9 key i.e to switch camera shutter and it
send a new 0x131b hkey event when F9 key is pressed.

This commit adds support for new hkey 0x131b.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Nitin Joshi <nitjoshi@gmail.com>
---
Changes in v4:
* Renamed macro from METHOD_ERR to GCES_NO_SHUTTER_DEVICE.
Changes in v3:
* Avoid wasteful get_camera_shutter() calls and Minor changes based on review comments to make
  code more readable.
Changes in v2:
* Added ASL method to get camera shutter status and send it to userspace.
---
 drivers/platform/x86/thinkpad_acpi.c | 46 +++++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 5790095c175e..6c6b9d4e613e 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -182,6 +182,7 @@ enum tpacpi_hkey_event_t {
 						   * directly in the sparse-keymap.
 						   */
 	TP_HKEY_EV_AMT_TOGGLE		= 0x131a, /* Toggle AMT on/off */
+	TP_HKEY_EV_CAMERASHUTTER_TOGGLE = 0x131b, /* Toggle Camera Shutter */
 	TP_HKEY_EV_DOUBLETAP_TOGGLE	= 0x131c, /* Toggle trackpoint doubletap on/off */
 	TP_HKEY_EV_PROFILE_TOGGLE	= 0x131f, /* Toggle platform profile in 2024 systems */
 	TP_HKEY_EV_PROFILE_TOGGLE2	= 0x1401, /* Toggle platform profile in 2025 + systems */
@@ -2250,6 +2251,25 @@ static void tpacpi_input_send_tabletsw(void)
 	}
 }
 
+#define GCES_NO_SHUTTER_DEVICE BIT(31)
+
+static int get_camera_shutter(void)
+{
+	acpi_handle gces_handle;
+	int output;
+
+	if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "GCES", &gces_handle)))
+		return -ENODEV;
+
+	if (!acpi_evalf(gces_handle, &output, NULL, "dd", 0))
+		return -EIO;
+
+	if (output & GCES_NO_SHUTTER_DEVICE)
+		return -ENODEV;
+
+	return output;
+}
+
 static bool tpacpi_input_send_key(const u32 hkey, bool *send_acpi_ev)
 {
 	bool known_ev;
@@ -3272,6 +3292,7 @@ static const struct key_entry keymap_lenovo[] __initconst = {
 	 * after switching to sparse keymap support. The mappings above use translated
 	 * scancodes to preserve uAPI compatibility, see tpacpi_input_send_key().
 	 */
+	{ KE_KEY, TP_HKEY_EV_CAMERASHUTTER_TOGGLE, { KEY_CAMERA_ACCESS_TOGGLE } },
 	{ KE_KEY, 0x131d, { KEY_VENDOR } }, /* System debug info, similar to old ThinkPad key */
 	{ KE_KEY, 0x1320, { KEY_LINK_PHONE } },
 	{ KE_KEY, TP_HKEY_EV_TRACK_DOUBLETAP /* 0x8036 */, { KEY_PROG4 } },
@@ -3303,7 +3324,7 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 	const struct key_entry *keymap;
 	bool radiosw_state  = false;
 	bool tabletsw_state = false;
-	int hkeyv, res, status;
+	int hkeyv, res, status, camera_shutter_state;
 
 	vdbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_HKEY,
 			"initializing hotkey subdriver\n");
@@ -3467,6 +3488,12 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 	if (res)
 		return res;
 
+	camera_shutter_state = get_camera_shutter();
+	if (camera_shutter_state >= 0) {
+		input_set_capability(tpacpi_inputdev, EV_SW, SW_CAMERA_LENS_COVER);
+		input_report_switch(tpacpi_inputdev, SW_CAMERA_LENS_COVER, camera_shutter_state);
+	}
+
 	if (tp_features.hotkey_wlsw) {
 		input_set_capability(tpacpi_inputdev, EV_SW, SW_RFKILL_ALL);
 		input_report_switch(tpacpi_inputdev,
@@ -3633,6 +3660,8 @@ static void adaptive_keyboard_s_quickview_row(void)
 /* 0x1000-0x1FFF: key presses */
 static bool hotkey_notify_hotkey(const u32 hkey, bool *send_acpi_ev)
 {
+	int camera_shutter_state;
+
 	/* Never send ACPI netlink events for original hotkeys (hkey: 0x1001 - 0x1020) */
 	if (hkey >= TP_HKEY_EV_ORIG_KEY_START && hkey <= TP_HKEY_EV_ORIG_KEY_END) {
 		*send_acpi_ev = false;
@@ -3643,6 +3672,21 @@ static bool hotkey_notify_hotkey(const u32 hkey, bool *send_acpi_ev)
 			return true;
 	}
 
+	if (hkey == TP_HKEY_EV_CAMERASHUTTER_TOGGLE) {
+		camera_shutter_state = get_camera_shutter();
+		if (camera_shutter_state < 0) {
+			pr_err("Error retrieving camera shutter state after shutter event\n");
+			return true;
+		}
+		mutex_lock(&tpacpi_inputdev_send_mutex);
+
+		input_report_switch(tpacpi_inputdev, SW_CAMERA_LENS_COVER, camera_shutter_state);
+		input_sync(tpacpi_inputdev);
+
+		mutex_unlock(&tpacpi_inputdev_send_mutex);
+		return true;
+	}
+
 	return tpacpi_input_send_key(hkey, send_acpi_ev);
 }
 
-- 
2.43.0

