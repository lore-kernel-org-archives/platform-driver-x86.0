Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96AC3BAD9B
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jun 2026 22:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781217568; cv=none; b=TotaEep+N8O8uEFYW8ONA/Up2CSOJEBrFXdAIF/HHhTGplms8Vtex7nyKwma6t/atp6inmmxP134XaluRDFlzcT/fvUpzobQZRcuMzocfhF14H/a3k8dNhenizlBk/uvP307JQkOTOOqtzGI2W3Vl8aQuSKTNyFQ4Oc3d0zN+f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781217568; c=relaxed/simple;
	bh=i6MFtNvxolieN4lk5VN/96A2bl1Y4HNUU5VxSOuv454=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iE+8vgHfiUsWf26Q9zPobsxqy1qHb5GVj+j5ZMvy9+iJGmClt+hP+o34zukUXpngLM3zgU0X32TTDU9BzkxY36XG96hXAUZf5uir5GpdTANzhIO/7hJB5u8As5MUhfi41mwC+2ZXbT/QMskFq4olud1eoxAz08oDG4KSBzK1dEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h4D0rS3x; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4D0rS3x"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-137eb0d76beso1031180c88.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jun 2026 15:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781217565; x=1781822365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pIOz3zm+RSFHd4HOq3rk3uZ1Gb4SoU/OadQL7cr2so8=;
        b=h4D0rS3xg9iY2KpgcVgkia5/oo+8Yr1G32yO9+s7r92HLP/16PxyEO8nxErMf3lyIh
         hhbTZ6iehikZgqFT97DYN4YpJfZ0zXJxZ5Fp7Usf88ChPlPbVBYONMBMNCI9IwvFCO+j
         WsVgq8JUDWffwJp/9wB1WBdU34nDNrkPhbXhLAZ/+ZXCSb12z49wRd9qcs2vPimjGtI/
         titeF5FZY018SehD1czyWOe252Z8O2U8pOjWiidqkp1qNNbWFGWMEgdZJbtvMpLHx/h6
         DV4yfpBYCFlnBVDrFUPqIjF2/Z8Hv2oBU/6lnAPhBf4H74c9oYkZZ5yGbxh5L4nQgJZJ
         f6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781217565; x=1781822365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pIOz3zm+RSFHd4HOq3rk3uZ1Gb4SoU/OadQL7cr2so8=;
        b=fCmqoYLJXMESSH+V+lv1P/23mToX1cGR+3PrCORuRZTk/QBHnEExAFkBm4oaK/B5GP
         hW0q6c2y9pvjiP3ib8VerTUcLxGwNlWALZC95jxXmdpNTfQtavRnOXnZKGmiOm4h5mbg
         ND/ujZUPrZc2Qhha1tqE2udO5sA0wNOuovpYb1Ja6ducXRB5aP9gfwjkskbDZ4WLUxJF
         a9ILGzNanFW19U1m3dLgOvL3RpRGYrHDHHK0Wk7idUAYIEAbNoihr8wBmBX4BRo6e20E
         IiRVCSznV18/VB9eJEahiqAjTqAGnF7mpf9/tLkr6TeJG9Pn8fD5iT6tVheSh1bSwiWr
         8q2g==
X-Forwarded-Encrypted: i=1; AFNElJ90+putEpvcWDDrz8b8R8xfNC0/yv0wbKZnt3Aqjud8b6u5QdP7GonhxpPy3WvMoNI4hcDU2SccjFhvDCh3Rxq90vWZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxeA/QMKmOcHvsK+5jd4JAhuZJbAPsZDcJUwYLfW2pVgp2xyAnz
	Hye4e9mJQOP4+Hg2hfwuHP2E73XtJY0vR3rAUt5+/SguC6GkQISR7ZfyKZGEBg==
X-Gm-Gg: Acq92OHLdjw6pSPu1ElHEffAEYCKJSGBiTDiCCcvNHdBwfkFrZ0vQj22YvThlZvjMSo
	TOYC8n94hmmIJRnOBgnYftlI2RjUv23G4u0cQxTWtoK8q+L5kSnjjkIslSwqNcHrh7R6EQRev6i
	ovh8zB6osOpR8Lu8RD2R8z4wuFisrB1xD+5Jl3TSGNdZN8lJYin+Rvs1S4tfXAymRCBEUgFyVDi
	8vX84u1zC23kbp/SU8aROK5VnECeTe43lhm8tEVASymFShxxy3HLChgDJ70fPE6DXF/A6DI4LuU
	0BPj6QM+4iXIMhdAGWDYrGnxBJB3jt3JhSI4xxf2qSQWIfsFlZUi+7vi2ky3Ft/ICZ6LyQ2eLA2
	mHwQQfh34X+3RMCrM8j5MHg9FRQ7quQzAqHLvp7mVvpezzPfEDg02CG/gOlGrWXxxiKjEUtpzA5
	R1uIudja7Ly1zeduNDkb1HA9utu8SvUzTdj5MUAr1KEoucu+5yA6PfgMCQlsTrvW+qpln1bIv8L
	EUD
X-Received: by 2002:a05:7022:485:b0:136:c2fa:32d6 with SMTP id a92af1059eb24-1384bffb32amr10275c88.7.1781217564602;
        Thu, 11 Jun 2026 15:39:24 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b975e55sm241273c88.13.2026.06.11.15.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 15:39:24 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Armin Wolf <W_Armin@gmx.de>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] platform/x86: msi-wmi: Reformat msi_wmi_notify()
Date: Thu, 11 Jun 2026 22:39:19 +0000
Message-ID: <20260611223920.1679438-2-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260611223920.1679438-1-derekjohn.clark@gmail.com>
References: <20260611223920.1679438-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reformats msi_wmi_notify() to use a switch statement that reduces nesting
and prepares the function to support additional ACPI types.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/platform/x86/msi-wmi.c | 71 +++++++++++++++++++---------------
 1 file changed, 39 insertions(+), 32 deletions(-)

diff --git a/drivers/platform/x86/msi-wmi.c b/drivers/platform/x86/msi-wmi.c
index 4a7ac85c4db4..d00ced756581 100644
--- a/drivers/platform/x86/msi-wmi.c
+++ b/drivers/platform/x86/msi-wmi.c
@@ -172,44 +172,51 @@ static const struct backlight_ops msi_backlight_ops = {
 
 static void msi_wmi_notify(union acpi_object *obj, void *context)
 {
-	struct key_entry *key;
+	struct key_entry *key = NULL;
+	int eventcode = 0;
 
-	if (obj && obj->type == ACPI_TYPE_INTEGER) {
-		int eventcode = obj->integer.value;
+	if (!obj)
+		return;
+
+	switch (obj->type) {
+	case ACPI_TYPE_INTEGER:
+		eventcode = obj->integer.value;
 		pr_debug("Eventcode: 0x%x\n", eventcode);
-		key = sparse_keymap_entry_from_scancode(msi_wmi_input_dev,
-				eventcode);
-		if (!key) {
-			pr_info("Unknown key pressed - %x\n", eventcode);
+		break;
+	default:
+		pr_info("Unknown event received\n");
+		return;
+	}
+
+	key = sparse_keymap_entry_from_scancode(msi_wmi_input_dev, eventcode);
+
+	if (!key) {
+		pr_info("Unknown key pressed - 0x%x\n", eventcode);
+		return;
+	}
+
+	if (event_wmi->quirk_last_pressed) {
+		ktime_t cur = ktime_get_real();
+		ktime_t diff = ktime_sub(cur, last_pressed);
+		/* Ignore event if any event happened in a 50 ms
+		 * timeframe -> Key press may result in 10-20 GPEs
+		 */
+		if (ktime_to_us(diff) < 1000 * 50) {
+			pr_debug("Suppressed key event 0x%X - Last press was %lld us ago\n",
+				 key->code, ktime_to_us(diff));
 			return;
 		}
+		last_pressed = cur;
+	}
 
-		if (event_wmi->quirk_last_pressed) {
-			ktime_t cur = ktime_get_real();
-			ktime_t diff = ktime_sub(cur, last_pressed);
-			/* Ignore event if any event happened in a 50 ms
-			   timeframe -> Key press may result in 10-20 GPEs */
-			if (ktime_to_us(diff) < 1000 * 50) {
-				pr_debug("Suppressed key event 0x%X - "
-					 "Last press was %lld us ago\n",
-					 key->code, ktime_to_us(diff));
-				return;
-			}
-			last_pressed = cur;
-		}
+	/* Brightness is served via acpi video driver */
+	if (key->type == KE_KEY &&
+	    (backlight || (key->code == MSI_KEY_BRIGHTNESSUP ||
+			   key->code == MSI_KEY_BRIGHTNESSDOWN)))
+		return;
 
-		if (key->type == KE_KEY &&
-		/* Brightness is served via acpi video driver */
-		(backlight ||
-		(key->code != MSI_KEY_BRIGHTNESSUP &&
-		key->code != MSI_KEY_BRIGHTNESSDOWN))) {
-			pr_debug("Send key: 0x%X - Input layer keycode: %d\n",
-				 key->code, key->keycode);
-			sparse_keymap_report_entry(msi_wmi_input_dev, key, 1,
-						   true);
-		}
-	} else
-		pr_info("Unknown event received\n");
+	pr_debug("Send key: 0x%X - Input layer keycode: %d\n", key->code, key->keycode);
+	sparse_keymap_report_entry(msi_wmi_input_dev, key, 1, true);
 }
 
 static int __init msi_wmi_backlight_setup(void)
-- 
2.54.0

