Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229FE1A5BB6
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Apr 2025 13:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745415574; cv=none; b=rtCoS5/RcZjQ0qS6zn5YLiKW7Ls7oeu3UC0BRJ8vPUwzUjwT4R/r48miRW3qd8icvEpbke9I6uQuuFBS4pFECLdfei7WMmcpVRPBRReKRTlb4uSFPF9zo2ZqJiWwLe7KWAKyimK+yKaOTapepBpTjZxYBSbIQesJh4B6R1S6jq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745415574; c=relaxed/simple;
	bh=aTc3gNE3jux9JMXT6uczcfJyXBQYed1JZgBM2nmwx3g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BoQa2uicUTI0JnAED+YAY51AFh8b1VUfo6AoGkT3PfbStoGULMLvumkf3IGkYagZsLSoMNZlJd0puKlpkLy5nqFIOOQNffTnvbwxpQgIPj23EYk8Enf0yeuaCWUhNJQMJJU0kIfml3q254HQZyBdypae4zmi2Q/2zRnl4VnWryk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R/7FwVzs; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R/7FwVzs"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-73972a54919so6683192b3a.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Apr 2025 06:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745415572; x=1746020372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QYmKRqT5yTen1ALhCY37qo3FXS5q/v+/Q7OXeXa4/C4=;
        b=R/7FwVzsH+Q2qtqTjKgX6aCrlBzTXkPJ431N9epBh9fTnhBJ8clqkw6YqpC8e/fAOg
         aq9frJI7W9YnEQp+kws5oow48GiKKSz2JNtmknsSMw51/VUg7ratTrDzcPptNTseVmde
         UWwzd/GI9RVD+Gxf3Eyk1U3nvyXJtrDeyllLbXIIJLixk/6cxPDQTTUJqHPbmm7sf2ln
         4wph7fF4GRzu5LPmm1m6gzoHOoiPiibfHUBTDHeckJYWYL4/KnCkeEzew6y017T5CAer
         dylJGOsESTWpofEkq44fN2PjoTU3HrRIMri81twC04vYGnlH4M1uxrPj9SyvhgU1ODWT
         3O2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745415572; x=1746020372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QYmKRqT5yTen1ALhCY37qo3FXS5q/v+/Q7OXeXa4/C4=;
        b=aaQDxGEkmLk7tvIq3qS8tUgbWzDvp9efnZSNGxYlKDf6a+DR+PBQaS8359hhUIs2VP
         j/zGmeCuok6rV8pRd+owrcrSAV4cGJOXEXyeUcELK9Ugas3SJAHu5RCuxZDU4q1HghXT
         w85YCbxq360ldD0KKeDrhnqnH7+cIeJ8gNFgMWDpJbPLEhGa2smGNDd785ss5tqP1OzM
         +zheEaEzF+S9QL6pM9YChCP7YT/pXxTeT1OfWkPBKi69PmoI4bWuMQ2y94eTlcx5zKhN
         2tMkjPiIBJF4BRLsuWr3qiTEDyhEXxrcB8Dfby2rfg+bcWbIc0woGtgQGIJU+L+yf7nz
         xTTQ==
X-Gm-Message-State: AOJu0Ywvyp2Qg1ul40+at/kMF3hkvtCau5NWKP6pjzgvE+QaZDA0GWI4
	gvSczNEhzcs6wP85ZNivrMFY8b2m85ENwOvhUrQCdLWQv4eQqFbf/1kEDih6qD4=
X-Gm-Gg: ASbGnctl+mMJSzuNAIfc9qmUinMyAKJ8UEHVTtg9096wO+iqYJ4OG1GECWobpUyn1Gm
	lSwWZcjnYE7Xs33n3W2sHwT/GsIK7B1gJXTseilBwiSvoaKFlTCrYYJH0+7rYDq1XCDjRM5qWNE
	oHajYs2XIIVXqkGFgNlGNIFblP13b+nn2dFxFUe6JDlDFl7JUR91ElsHbZvG9gvUPdeRF8o3nY1
	DXzYGeizaSNqj2RcHBr6CbVvkUuR4VEBoGYTcV/fFai3y3Ria8s0pN9wkimE/QDElhZz1gjzqnm
	xp73kjW5ddrf5g9gZ1n0+4WzDwS+N2et2+pyhCYJmR5nMy5RTYzG/3xR+UVmGvLHNlaCLYnkVq5
	G7EYlO1cbuWazw/vEVaMattvKr9lo
X-Google-Smtp-Source: AGHT+IGqSbPvZjH0OfGRc5vEt0f5TdhSIE8lkpvRsAADBs970BiG9+mGd0VtkmOcYoe3T3nQb1svfQ==
X-Received: by 2002:a05:6a20:12cc:b0:1f3:2a83:7548 with SMTP id adf61e73a8af0-203cbd4fdcbmr30803792637.38.1745415572303;
        Wed, 23 Apr 2025 06:39:32 -0700 (PDT)
Received: from ubuntu-ThinkPad-X9-14-Gen-1.. (127.37.178.217.static.user.transix.jp. [217.178.37.127])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db13c623bsm8889270a12.43.2025.04.23.06.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 06:39:31 -0700 (PDT)
From: Nitin Joshi <nitjoshi@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com
Cc: platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	njoshi1@lenovo.com,
	Nitin Joshi <nitjoshi@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: [PATCH v3] platform/x86: thinkpad-acpi: Add support for new hotkey for  camera shutter switch
Date: Wed, 23 Apr 2025 22:39:12 +0900
Message-ID: <20250423133912.16334-1-nitjoshi@gmail.com>
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
Changes in v3:
* Avoid wasteful get_camera_shutter() calls and Minor changes based on review comments to make
  code more readable.
Changes in v2:
* Added ASL method to get camera shutter status and send it to userspace.
---
 drivers/platform/x86/thinkpad_acpi.c | 46 +++++++++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 5790095c175e..0b011dcfc626 100644
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
 
+#define GCES_METHOD_ERR BIT(31)
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
+	if (output & GCES_METHOD_ERR)
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

