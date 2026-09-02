Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5C93793A8
	for <platform-driver-x86@vger.kernel.org>; Wed,  2 Sep 2026 17:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788371260; cv=none; b=HpnATzrTaDoc60Zddyc3UcrRxPIcXIV7q04ddT8oGgLlhrsP4iVVTmkmmbaJjUD7g1FAiwBtz2Mu7ZfrYeGh5EhiOr5A9miLmriWhhcJyPa9weMWf3NGS5bcQs6uRdWlRPBBWm3g8xT3TaYa+T4AeijvWhksl+IxpqEtUmoRoMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788371260; c=relaxed/simple;
	bh=gXEosb8CMRb1UXN41ZT9pY3EtnW7zgAt89WGeEYzu2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wz+LSbAuemxK6+hepXUUz3tZVr9XMB0TEY0P0u18qpYvk4J09vtZA2zmtctATMjfr5WcO0Nby/+mssDLQ5uF/0fykmF217SEATlkGj729qssDzHRCLd6inbraldcM5VfL4bEvcf5elNx+xJX/M7gDYexuFSh8S6FctRNjSP3fko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eSR9BfuY; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eSR9BfuY"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d6e954afbdso8649725ad.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 02 Sep 2026 10:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788371258; x=1788976058; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ay1coFvWOs2E2g41bXIVDKRlEoaNqpmJez8UBW0Q5bY=;
        b=eSR9BfuYsSUpniVwiv4SGZC2rX2fnQiLrpTyvwttsURol7txP1s8e7fRWjXU66cshP
         T4tN3aSbDT01+72POcXZ5TLUj4+LjHts2P4miSKrelFpt76Ts2xPBGv2hnJZtzZJQutQ
         /zTkb8OcVZIImXXVmQhjwJRN400SJoEVQnXrs5qTHtoISDm+V8CIxJuoAZSq4wpM1Ezv
         55MjLNFU7VM2qLUmLTxT8A6Oz8ou5G42UCNe5fz5ptwHVFOULOQL4U4tQymAeTQ2dpry
         EjS0gT1QSYT21UILCniNl8Qr70ndMNBJ0o8cjA8cl5zsp+Ow5Jn+5GP1v+MkgG2HJ/OD
         bW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788371258; x=1788976058;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ay1coFvWOs2E2g41bXIVDKRlEoaNqpmJez8UBW0Q5bY=;
        b=lLufojBvg1LzDVxbQW2Qzp4B+ubJ8D8roZH06E1M9qvUTdA/N+iGt9CzgDWq7KMyo9
         deUpImGxQgPKwUC5vodqfNkPLcKckYtF6ot5ZY2p5W2d827FjQQ06S+ZY54L8lLe/O/6
         J9JBQKQ1pvR4OTf/SaRJ0r5Ym5VtMnQesQRSL1Dwv2D8GM6qLKX34uoLumMqg55D3+h/
         Ka13o/fcCOwvvc+lCf8zjl0B93vxwP5t4WAm40FMWAVHN88GQLBRsT7jZ/SVbAS2Djy+
         hRx1HS1C0+QCIf6yN092Hgujcw1mP2XIM891AjqVjOKzngw3UNG1Z8tSdusCljJ//3ZI
         9ymg==
X-Gm-Message-State: AFuF++koikws6Jq8gXIHFLbnZpEUyYbwh2zenGuQYN/xrSZhKHG7j9Hl
	W9StlvyH9jLIKUMJ/m0AzemrcrZg+9ZLZdarIHPFIje/dUPfWrbiby4FYNRMU3yo
X-Gm-Gg: AYBFou2UTmY3TSOWsC8XSQB0L4XKHUI2JCYJGFsdeCjj3GBeyCmmyQzQzvXnPXmOsGo
	eieIMdnaPV4uHRpR45g5knxBh6oTnEncnJNsWF8K8DMhkIzlvwn9KWae/ePXeh7dEzDpIZnlwO1
	ltn1+Slbq4Hj5YqVICpydC0UibRsjO7G+LY2eHOye3NiJK0aEvTJAHRD22SVkF8l4rWlASlLd5n
	54syKNDRRFLY1RFpMHf2FbArULjKbGLzOqCUAiZvbuW5b+hKJL+JOnO2d5unbfMIYygi6xiqio2
	8px15AVtVgyu5DlkF7Hh4+5Wk5Y2v0vK+ZAQ9dkfHxl2g/ijEVm/oR4RYhwMPBRuuensuwcoF4I
	jzmxGTUHIyBd/nmjfUosVeKEqGkfpV33w87nvEZlvqkYHnpjggxojUZDUSsQce19Lx6VHH3AjKe
	TFJzUE49gH4KR6aZrcVHoG8UJZcJ0BA1D5FHJYuUAxy5YvtNECknmK5+3GALWU5pqkuAr99xaIk
	ZrqNoEBI6P5ggNJ
X-Received: by 2002:a17:90b:2f06:b0:398:a2a3:b631 with SMTP id 98e67ed59e1d1-39aee12359fmr10172568a91.19.1788371257581;
        Wed, 02 Sep 2026 10:47:37 -0700 (PDT)
Received: from mizar.onca-liberty.ts.net ([182.10.129.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b083f04d1sm470584a91.8.2026.09.02.10.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 10:47:37 -0700 (PDT)
From: Idotoho Reimon Simanjuntak <idotohors@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Denis Benato <denis.benato@linux.dev>,
	"Luke D . Jones" <luke@ljones.dev>,
	Corentin Chary <corentin.chary@gmail.com>,
	Idotoho Reimon Simanjuntak <idotohors@gmail.com>
Subject: [PATCH v3 1/3] platform/x86: asus-wmi: use named masks for TUF RGB commands
Date: Thu,  3 Sep 2026 00:47:16 +0700
Message-ID: <20260902174718.16228-2-idotohors@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902174718.16228-1-idotohors@gmail.com>
References: <20260902174718.16228-1-idotohors@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Replace open-coded bit shifts and magic numbers in kbd_rgb_mode_store()
and kbd_rgb_state_store() with FIELD_PREP() and named GENMASK() masks.

Define ASUS_WMI_TUF_RGB_STATE_CMD_ID (0xbd) as a named constant instead
of an inline literal, making the required arg0 command ID self-documenting.

In kbd_rgb_state_store(), remove the unused intermediate "flags" variable
entirely. The old BIT(1)/BIT(3)/BIT(5)/BIT(7) construction is replaced by
FIELD_PREP with per-flag named masks (TUF_RGB_STATE_BOOT, _AWAKE, _SLEEP,
_KEYBOARD), building arg0 directly. This preserves the exact sysfs input
format ("cmd boot awake sleep keyboard") and the resulting WMI argument
bit layout — no behavioral change.

In kbd_rgb_mode_store(), replace the positional shift expressions for
arg1 and arg2 with FIELD_PREP using TUF_RGB_MODE_{CMD,MODE,RED,GREEN}
and TUF_RGB_MODE_{BLUE,SPEED} masks respectively.

This is a preparatory cleanup to improve readability before adding
model-specific quirks that depend on these definitions.

Signed-off-by: Idotoho Reimon Simanjuntak <idotohors@gmail.com>
---
 drivers/platform/x86/asus-wmi.c | 48 ++++++++++++++++++++++++++-------
 1 file changed, 38 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index a65090429..efc730c2c 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -15,6 +15,7 @@
 
 #include <linux/acpi.h>
 #include <linux/backlight.h>
+#include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
@@ -1047,6 +1048,27 @@ static DEVICE_ATTR_RW(gpu_mux_mode);
 #endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
 
 /* TUF Laptop Keyboard RGB Modes **********************************************/
+
+/* Command IDs passed in arg0 byte 0 for TUF RGB WMI methods */
+#define ASUS_WMI_TUF_RGB_STATE_CMD_ID	0xbd
+
+/* Bit mask for the save-to-BIOS command flag in kbd_rgb_state_store (arg0 bit 10) */
+#define TUF_RGB_STATE_SAVE	GENMASK(10, 10)
+
+/* Bit masks for kbd_rgb_state_store flags field (arg0 bits [23:16]) */
+#define TUF_RGB_STATE_BOOT	GENMASK(17, 17)
+#define TUF_RGB_STATE_AWAKE	GENMASK(19, 19)
+#define TUF_RGB_STATE_SLEEP	GENMASK(21, 21)
+#define TUF_RGB_STATE_KEYBOARD	GENMASK(23, 23)
+
+/* Bit masks for kbd_rgb_mode_store fields */
+#define TUF_RGB_MODE_CMD	GENMASK(7, 0)
+#define TUF_RGB_MODE_MODE	GENMASK(15, 8)
+#define TUF_RGB_MODE_RED	GENMASK(23, 16)
+#define TUF_RGB_MODE_GREEN	GENMASK(31, 24)
+#define TUF_RGB_MODE_BLUE	GENMASK(7, 0)
+#define TUF_RGB_MODE_SPEED	GENMASK(15, 8)
+
 static ssize_t kbd_rgb_mode_store(struct device *dev,
 				 struct device_attribute *attr,
 				 const char *buf, size_t count)
@@ -1093,7 +1115,12 @@ static ssize_t kbd_rgb_mode_store(struct device *dev,
 	}
 
 	err = asus_wmi_evaluate_method3(ASUS_WMI_METHODID_DEVS, asus->kbd_rgb_dev,
-			cmd | (mode << 8) | (r << 16) | (g << 24), b | (speed << 8), NULL);
+			FIELD_PREP(TUF_RGB_MODE_CMD, cmd) |
+			FIELD_PREP(TUF_RGB_MODE_MODE, mode) |
+			FIELD_PREP(TUF_RGB_MODE_RED, r) |
+			FIELD_PREP(TUF_RGB_MODE_GREEN, g),
+			FIELD_PREP(TUF_RGB_MODE_BLUE, b) |
+			FIELD_PREP(TUF_RGB_MODE_SPEED, speed), NULL);
 	if (err)
 		return err;
 
@@ -1119,28 +1146,29 @@ static ssize_t kbd_rgb_state_store(struct device *dev,
 				 struct device_attribute *attr,
 				 const char *buf, size_t count)
 {
-	u32 flags, cmd, boot, awake, sleep, keyboard;
+	u32 cmd, boot, awake, sleep, keyboard;
+	u32 arg0;
 	int err;
 
 	if (sscanf(buf, "%d %d %d %d %d", &cmd, &boot, &awake, &sleep, &keyboard) != 5)
 		return -EINVAL;
 
+	arg0 = ASUS_WMI_TUF_RGB_STATE_CMD_ID;
+
 	if (cmd)
-		cmd = BIT(2);
+		arg0 |= FIELD_PREP(TUF_RGB_STATE_SAVE, 1);
 
-	flags = 0;
 	if (boot)
-		flags |= BIT(1);
+		arg0 |= FIELD_PREP(TUF_RGB_STATE_BOOT, 1);
 	if (awake)
-		flags |= BIT(3);
+		arg0 |= FIELD_PREP(TUF_RGB_STATE_AWAKE, 1);
 	if (sleep)
-		flags |= BIT(5);
+		arg0 |= FIELD_PREP(TUF_RGB_STATE_SLEEP, 1);
 	if (keyboard)
-		flags |= BIT(7);
+		arg0 |= FIELD_PREP(TUF_RGB_STATE_KEYBOARD, 1);
 
-	/* 0xbd is the required default arg0 for the method. Nothing happens otherwise */
 	err = asus_wmi_evaluate_method3(ASUS_WMI_METHODID_DEVS,
-			ASUS_WMI_DEVID_TUF_RGB_STATE, 0xbd | cmd << 8 | (flags << 16), 0, NULL);
+			ASUS_WMI_DEVID_TUF_RGB_STATE, arg0, 0, NULL);
 	if (err)
 		return err;
 
-- 
2.55.0

