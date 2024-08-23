Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C96417E01E
	for <platform-driver-x86@vger.kernel.org>; Fri, 23 Aug 2024 11:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724414319; cv=none; b=Or9jDJlhq41zcF3E9GHHeY+jyFBnlkY/NhXHQT355/mxunMRVL0fK4nI4lDkKjRV2Us0A69icN93hbw96iN5u8evZTOqtqVBDehZiIr42ShwcDXvBl9gagqEu532qDxOdXfcra3LEuhFVa7SGIBQsVQqGlNngPBZO2cacCE3qW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724414319; c=relaxed/simple;
	bh=M0X62fZgR660OqYh/QaAI/DnGfsKl4Acfw7CnaUDR3c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NEA3HaBCy9jhu59NBla9yjzdqSmiDFSxx9XsLvVSy9feofqI/sCVNM73DW7YPiAdzf9FSLPLoJ2IhnMUTymbftdvosn+zTmeWVkBdjRDzF48zk8AGOgdzjUNGkjxBAA3MaTKj19C7Qunq6CW04EvnDQIIj2PDFJwDq6ufdQk05Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fenniak.net; spf=pass smtp.mailfrom=fenniak.net; dkim=pass (2048-bit key) header.d=fenniak.net header.i=@fenniak.net header.b=eX6b/epw; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fenniak.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fenniak.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fenniak.net header.i=@fenniak.net header.b="eX6b/epw"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20230059241so16156985ad.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 23 Aug 2024 04:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fenniak.net; s=google; t=1724414315; x=1725019115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qQ753okLVrPQcSQx8laXwTZrkgm8wYxxXnj3EKQwJYg=;
        b=eX6b/epwR/s7UsviFrOxHPM0HkZe1CkmrBGdBZdOHxIaTh/uwCvBX2gQQ6tgU0rqee
         TL+eX7xqMYM5Dg9kKleYmDFyLfWcYMZg7lFQpsX/3sA1/1l/V2AusJwuKGdPNhzhIwxr
         Iy0jo/Umsnqnmydnwx6yh2qVCm+8aaESPO4jjKwYfn+ZN6xPKCmHmN1In5zuar5KV0ls
         uTSyBqPz8XlDaKhl2wF+S/OpPG3o4B0Ybov+RogvUgd10wMGwLCC09J7aaJbHPZ+cVX6
         +hN/vpKnRrrS1yG8/4l1o9B5Afr3vum++DTEu/oJHthprkY/mO4zmtBvd1vt88gmVezJ
         BkFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724414315; x=1725019115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qQ753okLVrPQcSQx8laXwTZrkgm8wYxxXnj3EKQwJYg=;
        b=RE7ZrxNYv10nqOit8dZKpMbgtCuToNYnccMFivChCjs6S5fVv2zIvjuHSQqVSVh9Gf
         xR03XTuk0cMMOmequ2DGNa+ArG1gZebRWa5ytBHPn6KSzedTTVAxXcCWvoKy/pqoCoTI
         j1iigBjMSxAFU+YkVm81y1zcD+5PLe/oKSQlDzgGaDKJx2bsFWzGasQZQGpDPXjU0Orh
         6OCUIV1OEV9JHMni0zTjTJRz2sjDhpie7+tQi/e0Lx4LPjw9XF4XmaAzRjL+ZStLUJOt
         vWiZLfj9IYQgOj4j3M76PYSVJFUCRrXnowKPk2+UBA9wyy+1k+jHKmf7K2tKwbghOCnt
         v2hA==
X-Forwarded-Encrypted: i=1; AJvYcCWpkZtC4fGDbHWOc8HUk3bqO3/dOoN/2WgeODV9izix9/h7VxCwRjYxOmdng4/oebTnvo/pQ277QU2kbANx2oxHgsjt@vger.kernel.org
X-Gm-Message-State: AOJu0YzdjKWf9IRp97zLOnu83JjwGcjUoXPPdQjczi8hEjc1zee21Ccc
	Mr4jYQnY5ithzROHDYmWqY0eFrGD+T9UEQFnM1wGmumkicJBl+DObk2gUCeKNwA=
X-Google-Smtp-Source: AGHT+IGcagSKVRrqeqKYGELWF9o3/fwwXcnyAKNgYw86VSVELRo7EyAacgDpv5h9FUqtl5EZyJE24g==
X-Received: by 2002:a17:902:eccb:b0:1fb:93d6:9fef with SMTP id d9443c01a7336-2039e4cd9c9mr22997035ad.38.1724414315445;
        Fri, 23 Aug 2024 04:58:35 -0700 (PDT)
Received: from zenbook-nixos.tail73afb.ts.net (d104-205-214-17.abhsia.telus.net. [104.205.214.17])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20385581393sm27056685ad.102.2024.08.23.04.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 04:58:35 -0700 (PDT)
From: Mathieu Fenniak <mathieu@fenniak.net>
To: 
Cc: Mathieu Fenniak <mathieu@fenniak.net>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: asus-wmi: Fix spurious rfkill on UX8406MA
Date: Fri, 23 Aug 2024 13:56:45 +0200
Message-ID: <20240823115657.69053-1-mathieu@fenniak.net>
X-Mailer: git-send-email 2.44.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Asus Zenbook Duo (UX8406MA) has a keyboard which can be
placed on the laptop to connect it via USB, or can be removed from the
laptop to reveal a hidden secondary display in which case the keyboard
operates via Bluetooth.

When it is placed on the secondary display to connect via USB, it emits
a keypress for a wireless disable.  This causes the rfkill system to be
activated disconnecting the current wifi connection, which doesn't
reflect the user's true intention.

Detect this hardware and suppress any wireless switches from the
keyboard; this keyboard does not have a wireless toggle capability so
these presses are always suprious.

Signed-off-by: Mathieu Fenniak <mathieu@fenniak.net>
---
 drivers/platform/x86/asus-nb-wmi.c | 20 +++++++++++++++++++-
 drivers/platform/x86/asus-wmi.h    |  1 +
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index fceffe2082ec..ed3633c5955d 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -145,6 +145,10 @@ static struct quirk_entry quirk_asus_ignore_fan = {
 	.wmi_ignore_fan = true,
 };
 
+static struct quirk_entry quirk_asus_zenbook_duo_kbd = {
+	.ignore_key_wlan = true,
+};
+
 static int dmi_matched(const struct dmi_system_id *dmi)
 {
 	pr_info("Identified laptop model '%s'\n", dmi->ident);
@@ -516,6 +520,15 @@ static const struct dmi_system_id asus_quirks[] = {
 		},
 		.driver_data = &quirk_asus_ignore_fan,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUS Zenbook Duo UX8406MA",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "UX8406MA"),
+		},
+		.driver_data = &quirk_asus_zenbook_duo_kbd,
+	},
 	{},
 };
 
@@ -630,7 +643,12 @@ static void asus_nb_wmi_key_filter(struct asus_wmi_driver *asus_wmi, int *code,
 	case 0x32: /* Volume Mute */
 		if (atkbd_reports_vol_keys)
 			*code = ASUS_WMI_KEY_IGNORE;
-
+		break;
+	case 0x5D: /* Wireless console Toggle */
+	case 0x5E: /* Wireless console Enable */
+	case 0x5F: /* Wireless console Disable */
+		if (quirks->ignore_key_wlan)
+			*code = ASUS_WMI_KEY_IGNORE;
 		break;
 	}
 }
diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-wmi.h
index cc30f1853847..a6ee9440d932 100644
--- a/drivers/platform/x86/asus-wmi.h
+++ b/drivers/platform/x86/asus-wmi.h
@@ -50,6 +50,7 @@ struct quirk_entry {
 	 */
 	int no_display_toggle;
 	u32 xusb2pr;
+	bool ignore_key_wlan;
 };
 
 struct asus_wmi_driver {
-- 
2.44.1

