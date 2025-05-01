Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066181EFFA3
	for <platform-driver-x86@vger.kernel.org>; Thu,  1 May 2025 12:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746102988; cv=none; b=FDyM09Wu4zQtdLJRMrFqgnePj6w5H1Ft1HAhQ0l1EnDTVgjApCpRrAs4xXvOHK3RndqnQgRKZ7jdQEjiumbwUZbQYS2jVg5XCrLan7qLgqP6BdFkHXVgPm5qChkHL4jqtVdZoi9a1AnDQU7HA9UTAY33vz8JoCbSF39gjGTkh3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746102988; c=relaxed/simple;
	bh=kJb8OFzo2QPdADZT8TuBM0vrZGcx46Ft6sootAXB7Og=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oK8gnIj/jtVxAy2racNFfhiy8+nHqv+IOdvMxA6a5vqWP8SY9SQbLtyElbyEhaBRkR5X+6U9rLhzWJvZRx9rSPFQicVKFDNhoZzu0CdreNW7h/Tgf/lgde9C74jHMuwxlw5vkKGDv103x+QhxqR1nmTSooBWI/8hKkQQ0JXX/Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WYnIHA7e; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WYnIHA7e"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-736c062b1f5so941743b3a.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 01 May 2025 05:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746102986; x=1746707786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MMI/DERRoxRq+t8tOC8hQAJu83pVlUe4sFrkZmRjM4s=;
        b=WYnIHA7ePNoMp2pbdeztwi56pcMo1CSiMqYrR3UDPUA7h0JcouwOvG2WJgrYh9zGs+
         5Rn2xjtiusL1/QyTfpCtdBwbb/yY8GpGpkqEGtBWy9msxQmAZDu9q+s5nVXFD+kFUDNu
         W4WaMy4YRAV8nIZMCdjx5z5AVlagl5xt27OjhNp46wPHSCBkbl03TUeyTdhaQbitManG
         fZ3fSPB5yXUzOTCarAks0hnzJ0k4alTJTXs4TDEvkiaZtEoDlu5yqdQfi6RWswkZOHHc
         2hfqZwg3MpfC2pnwSFu6Sho7LLzotKsoOcxZY1raJP7X/mudZ2Otx9NzqwrQwFe+oBZi
         1vFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746102986; x=1746707786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MMI/DERRoxRq+t8tOC8hQAJu83pVlUe4sFrkZmRjM4s=;
        b=e4m2d+q0aP348jxv8BZ3teZpCf73iTRwELSbRLP1LqfLSJLUdkdIhhHNDtyBS04Hg9
         P2FCLxv6ycgj+n5KGJxqauR9rc57Rbu04IZak4hTtPuS0tOWY2EUIg0yaIRnlvJ5jLVw
         O+osBUDCQjltGNhni2TixXXucQO6vWwWhC/Jx+87tznycDIBcPBJARj0LGKvj/hyNcYp
         BZFaahRLFcA2iuWz+9boV0DbaYF+wcVPfSp6Tvq1vCAbLFmLul3wRnaeZEWSUDvkoY+z
         sHnbWvztkKQpr/y/nK/PxW/1c15a8JkZgRSZ7pHSZsG/iECpq3xXKNdDaaimN7Gg/JOZ
         5O/w==
X-Gm-Message-State: AOJu0Yxn32dld1BdjqazLFbO7qjqvMcC/6v1eOPHtFynJYScYq2xhP7D
	TP8NUO8f576hZKozTEuaPBD1V5IRrlbU86aFJE9EB6Yv7CxeS20C
X-Gm-Gg: ASbGncvAuV1Nt5z640Lel/7aM46HP2rn562kAnsaQELAz5t23Oq4/hLUNx4TEjepY8h
	qEEtJAcL0NWIk0qv1iTzqcqahsoSBC1lUZmGul+2bRDm0Ome8Oe8/0GR5btLhr/5mju+o9EwdIy
	BZdRLCBy8QIrnyU/Gm4qwJOS1U/wFz4zJS/w+AagUJFcaKla8AZ1YzBOw7zvkvLnVMBbrM/vvcd
	SzihN/Yj8I1uiwMhNcQs6+EMAJf1i3JODNAJ9DXAqTZew5kzMxXLJwCGRFWqmtFQbl/zL0VGk2i
	jjuf2Ku1yY1hD49v8yiPBU/jR7r8zfx+/glgImPgq0D9f9CakxjjJGL0jmsU6Zg1U2ZbngK/3CB
	2aNJg2pLL87KtQ2s01ChQgTbFLXNv
X-Google-Smtp-Source: AGHT+IGgSITmIkvvIJIhqOAH+R4D/WSgJcBfRMhgyLuWrtVPyIZ4+xj4Zv3uO3H7BdzsNbUeOSQiDg==
X-Received: by 2002:a05:6a20:43a3:b0:1d9:c615:d1e6 with SMTP id adf61e73a8af0-20bd3f8afaamr3457142637.0.1746102986180;
        Thu, 01 May 2025 05:36:26 -0700 (PDT)
Received: from ubuntu-ThinkPad-X9-14-Gen-1.. (127.37.178.217.static.user.transix.jp. [217.178.37.127])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1f9d66d6b6sm590336a12.63.2025.05.01.05.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 05:36:25 -0700 (PDT)
From: Nitin Joshi <nitjoshi@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com
Cc: platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	njoshi1@lenovo.com,
	Nitin Joshi <nitjoshi@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: [PATCH v5] platform/x86: thinkpad-acpi: Add support for new hotkey for  camera shutter switch
Date: Thu,  1 May 2025 21:36:07 +0900
Message-ID: <20250501123607.14171-1-nitjoshi@gmail.com>
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
Changes in v5:
* Incorporated review comments for consistency.
Changes in v4:
* Renamed macro from METHOD_ERR to GCES_NO_SHUTTER_DEVICE.
Changes in v3:
* Avoid wasteful get_camera_shutter() calls and Minor changes based on review comments to make
  code more readable.
Changes in v2:
* Added ASL method to get camera shutter status and send it to userspace.
---
 drivers/platform/x86/thinkpad_acpi.c | 43 +++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 5790095c175e..3c75161667cf 100644
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
@@ -3303,7 +3323,7 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 	const struct key_entry *keymap;
 	bool radiosw_state  = false;
 	bool tabletsw_state = false;
-	int hkeyv, res, status;
+	int hkeyv, res, status, camera_shutter_state;
 
 	vdbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_HKEY,
 			"initializing hotkey subdriver\n");
@@ -3467,6 +3487,12 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
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
@@ -11236,6 +11262,21 @@ static bool tpacpi_driver_event(const unsigned int hkey_event)
 		else
 			dytc_control_amt(!dytc_amt_active);
 
+		return true;
+	case TP_HKEY_EV_CAMERASHUTTER_TOGGLE:
+		int camera_shutter_state;
+
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
 		return true;
 	case TP_HKEY_EV_DOUBLETAP_TOGGLE:
 		tp_features.trackpoint_doubletap = !tp_features.trackpoint_doubletap;
-- 
2.43.0

