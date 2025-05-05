Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7C0192580
	for <platform-driver-x86@vger.kernel.org>; Mon,  5 May 2025 15:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746457341; cv=none; b=aYyXGatZQCzzC3U3ypjelQwI3Al7YDDL19aGDnf5CMWPxIqdscP4t+YX3nZepkLDKR+t/4GhcjCej3cTjFKcRrtZLjQvjDhD7EXtal+0jaCL+7WtAozolJZgC5gv+QBmMiTn6iKtsjJEKxiTD452a8Go4sfebT1m/qAmOA5vV5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746457341; c=relaxed/simple;
	bh=WG2C79iYLpYk5QOXfriAT9Bi91qZ3VBPRQSuXKVp3KE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QAESVRAnTGRCYhN/NZn5Pz5IM8Cg1qhiTRHLRgTFX55Poq+zKgXIKsfzWh0MIet1orGHpNBOsRq5W4eSDjL/3S2LMMFK6FeWAP7iAeuJxzBJ+P9yL0mvZGtbSoUa7D6KL8VdoX2WrGX//G0y9F0hnSPP/UPFCX1wGc4jIS7QVyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R2aEZF4h; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R2aEZF4h"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7376dd56f8fso6163640b3a.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 05 May 2025 08:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746457335; x=1747062135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V6yGuW8BR0PciYSktpZ92vqN5OVhzfVd+WKgX8I0EpE=;
        b=R2aEZF4h1ATlkOdc81xey788iUnrp+Io0+Z2bNpa11q+8QKQTkWNFKYKsYhA9FxucR
         uT+tSbr4hNwVz8yiw3f1A8iBwWsHZ7dFIENY1fSzehiXUuoU19JkG9k4OsaNN7bfdgho
         QmjlpfkkKIZ28jvvOYuej5jB4odUmE/wNHBcTxc0AFeeWaBEOEEbqp51qmVhSy8mu+yI
         STzozG6WettsJyzRvpA93TzXZK9/IGwoX/KDb5stzeSXiPoPGRBW09t3I4mCjlPYmQRm
         I708cedSrsYvPQ17b7bDeXodPjZ5XnIYCgbZbEk815TwFMYyAgEKfT5s4QXZKoc7b2Ii
         kExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746457335; x=1747062135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V6yGuW8BR0PciYSktpZ92vqN5OVhzfVd+WKgX8I0EpE=;
        b=KT1IfoNEerxsBdD/JVYt1uy/mSWVHNeWWHpRN3V+F2pLRM8UF7nUK1BwSCoAvmxOuG
         G404Ms/IgsP3MkQeKztmVyoeHZ/jp+681eXawcfxhW32DUHO08D+lTtQoPzrCgKIVhOZ
         cTaUFbvZF6DelUYmaYB9vWA4/svd2KT0cbnz2KRty8nyiTlrmHFBbdP+Z4VW+N4Q/mdA
         S3TTzxTr5YvDrxxvNHvrvyoG2UQS0zSGaz2be+mZZja3sr0yqbHh1LHPlluvfBkJPrvr
         dfrJWpGxjJzFZYzs78cIMdkvdkcxQXtN81NlMly2XMraW6jzqlpkG6EO8NZTYt2OTHq2
         WFyg==
X-Gm-Message-State: AOJu0Yx+FKwq4hniq9sLmQaEqW4F1IVymBGB+wZ8Y3ajNPNpEAWJhwRi
	y4m1lQo6IxAErhNlP8Xesl8D+aq0CbFmBOEPisbq913aLu5QBwXT
X-Gm-Gg: ASbGncvedRNM/jpcmMMeg5hUXcMP8N/uqflVyVEBcLi5GPE1EBrxmw9imP7xVIxfDiq
	ThC/pFP4PFJNRh8dAXfkNGsYr5/0qmkxurfttd8MCzQqEedLKaKSIKTybVzw48KPVS42o+8i5No
	a0AjrabEODyTY4vBUGfwhbzOhlERUg6I6WOZXFskg+TerWDMyMtxmKo0LK3P52LyumDClEIXjG8
	3hHwYB1G48P3wfeu74iPs4P6ixvu04PrKwjDbhXjZ9tpSf0udQBALI+BL+lPDUSaeZUCydpM1Cu
	xKBhwwOZ/TlpBfaH1eIHwtNQe5RoXEb6Lf+yF2icS6X+JbGPIiOYpS7d0MltQUcoqvwUCVkEd4O
	S0kx25WRQgh/z5dRcB1xhMtBJx6cD
X-Google-Smtp-Source: AGHT+IHugqt4tDsPKUidUvY9R0DFha+pPS2TuRrpdrakO0pYx9BF8/eXiMnHyWm89dq7lpwuyjL+xg==
X-Received: by 2002:a17:90b:4c51:b0:2ee:5958:828 with SMTP id 98e67ed59e1d1-30a5ae10effmr15093637a91.9.1746457334420;
        Mon, 05 May 2025 08:02:14 -0700 (PDT)
Received: from ubuntu-ThinkPad-X9-14-Gen-1.. (127.37.178.217.static.user.transix.jp. [217.178.37.127])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a3471f323sm13058746a91.7.2025.05.05.08.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 08:02:14 -0700 (PDT)
From: Nitin Joshi <nitjoshi@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com
Cc: platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	njoshi1@lenovo.com,
	Nitin Joshi <nitjoshi@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: [PATCH v6] platform/x86: thinkpad-acpi: Add support for new hotkey for  camera shutter switch
Date: Tue,  6 May 2025 00:01:52 +0900
Message-ID: <20250505150152.27968-1-nitjoshi@gmail.com>
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
Changes in v6:
* Fix sparse error.
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
index 5790095c175e..080063395082 100644
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
@@ -11161,6 +11187,8 @@ static struct platform_driver tpacpi_hwmon_pdriver = {
  */
 static bool tpacpi_driver_event(const unsigned int hkey_event)
 {
+	int camera_shutter_state;
+
 	switch (hkey_event) {
 	case TP_HKEY_EV_BRGHT_UP:
 	case TP_HKEY_EV_BRGHT_DOWN:
@@ -11236,6 +11264,19 @@ static bool tpacpi_driver_event(const unsigned int hkey_event)
 		else
 			dytc_control_amt(!dytc_amt_active);
 
+		return true;
+	case TP_HKEY_EV_CAMERASHUTTER_TOGGLE:
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

