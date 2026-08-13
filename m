Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9BE3E1CF8
	for <platform-driver-x86@vger.kernel.org>; Thu, 13 Aug 2026 22:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786659476; cv=none; b=rPVMjrTa6xvl7OET5arKcDPcktG1Enq+kXfejjUJA8ejV45NcQIWyLlLprvy83IOaLfCb0Wuo7q6zAPoVQQ3JY5vXVY9XIFI4xlWOUjaOXI6su2BhnPswuGwE1xyFl+346Bvv+ag7HoPpxAvwZhKvUPslMyKjRDzK2F6wk+DUNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786659476; c=relaxed/simple;
	bh=5cPTCnPJa6O937ZZQIFK/lzfkFCIFcrM09a2SqAhsCw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qdSM9IZx5276ddic/is751q6ih29UkyCT/zqwYELNq5KtFI3GzFWSPNfgRV5s4IXJSLO4j/qYnlax7zzUadQyD1grQfpEaTz/wLa0WFi+MV8IMRZCvz00zLzcfCDg6GW7m4ELzbsLwghQOF5kfQ7k5KwDZ5R56VQBVM+vK0So9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fRvebYl7; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fRvebYl7"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so408438a91.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 13 Aug 2026 15:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786659474; x=1787264274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GDWpzRdkpQScqquzbwd+Qr1uIGmT0mrL4KFJepX9iCw=;
        b=fRvebYl7+/xUmaauyPrE6SOAbdgQzDPfB2s5BA6XhRRdtSMBz1Op5MjOdrKGIDBGmz
         X8mlyM8Wnb5UaQWmsUf5TqWyjjmBi44AHPFSMdav8kiOyhU/5AOVldczV/u4FYv2xHMl
         PHw2g2x9XFgXqXlD1HwHX0BdpiqssxxTcgaF8xOuWrdBoU5KJN+25kylRBj2KXbrq53p
         oV+J1UZT0ycav/r7P/+t1rC2GptE8YwezDIM2VwHlWdFWqhQFuwT0NSdZslkllpoU0z+
         2Gb/vTAqt4V7UVIIvJmUvwExF9W+UcTCToGu/q2gLfjbNLtd69uQRvgP2ufgsiZgYFJl
         M6Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786659474; x=1787264274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GDWpzRdkpQScqquzbwd+Qr1uIGmT0mrL4KFJepX9iCw=;
        b=LQ+744WuOaDGDIYlq9C5XQ0Ebi6T8kPAlX2D8kgSRUO7juWpQQpGPc8kW0C8YFgVpw
         wtPkVGluafSu8gzYnVRTygkEMkNb2FKeAooW94iBHi/CllqPZPlN9+z2dxPLULOLUrWF
         IHyrdSSZBe+cnWKKHq/FJObjwn88Ve+vIz3PhSUe2WfW3liTqfSY7g9iRUWQz6gsU+dh
         c9dfsYoBA15sBGeDDbUYlU9gbifbsDG8LzZ+Bw9raKs0SQw0nFVU9Tq0sKLwzHxBj6l3
         JkGIDkTp+dLpbTNF3d0Vw/gHvnbbJtZfpJPaoR3eme/Ju8YPQSZwQ1AUr7LqDLPjeZmY
         1mWw==
X-Gm-Message-State: AOJu0Yz6fyzDVg53YEDCPnllZFeNDHclR6hCYCTYaw9L8G007anL24wm
	iKeTjSJeLJAe3WDfcmfVFHSVHOaNQne4A3utnAkY3Sw6YpsUI9TMSMQg
X-Gm-Gg: AR+sD10Hu7e20cfgxyhpwPpCp71eOsYUDQRB27tncoJbMOkJ4T76Fhf9pUoobg1fKno
	zB14tDRVTL5z/a9mu8m0Tj9YbBuYFAKmhIaZ2lZZpVHOTb2mLstOQfiKzEuFxzTrz+N/t+Bj77m
	SjVFho0R5NwbzAoBDCv8EuuTyfxcrdLF08lanejIFKjNSoIIDZJxhwz3+dLI5SgRGyIW2md8jQv
	koX9rWw/6bbluI7TOvUhaXumhVFGn6ZdBhTv+n/tqrOxUBu9yg0RwA7QJ0oXfxeXHDFrez/B1rK
	R2wR/RsQF1jnJodfVJc67CvIigmwl1TFZwRp5jYDyhlYX8z9n2/zwTqMSFOoHBs+inrO5S4cadF
	7J0a4Bd5TdJA6Y32aBwlW6tjynP943y7jYgxKf1tUSh1bqwBeGrLroK3A580D0qIsnu8TMPlgu2
	L6r7VF4+qO8g3BUow7QzhFwpmv4++TU7sbc2K8kdWzsNt/9qW/qEYT0sar+zRT7jxZGDZ/OC9cJ
	J0Wji9/KDyUDUXhYVk=
X-Received: by 2002:a17:90b:4c8f:b0:38d:dfd1:7c1 with SMTP id 98e67ed59e1d1-3933b77fff8mr1008035a91.2.1786659473561;
        Thu, 13 Aug 2026 15:17:53 -0700 (PDT)
Received: from sonic ([2804:18:167:9e8c:e6b5:fa0:d068:30e3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebc667bfesm11463318eec.2.2026.08.13.15.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 15:17:53 -0700 (PDT)
From: Hilgad Montelo <hilgad.montelo@gmail.com>
To: kenneth.t.chan@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hilgad Montelo <hilgad.montelo@gmail.com>
Subject: [PATCH v2 1/3] platform/x86: panasonic-laptop: Handle CF-33 rotation-lock button
Date: Thu, 13 Aug 2026 19:17:42 -0300
Message-ID: <20260813221744.25668-2-hilgad.montelo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813221744.25668-1-hilgad.montelo@gmail.com>
References: <20260813221744.25668-1-hilgad.montelo@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the Panasonic Toughbook CF-33 the bezel "Rotation Lock" button does
not signal via ACPI notify like the other hotkeys. Instead the
embedded controller injects raw i8042/PS2 scancodes that alias the
real Left-GUI/Meta key:

    press:   e0 5b   65
    release: e5      e0 db

e0 5b / e0 db are the standard AT scancode for the physical Left-GUI
key. The bare 65 / e5 bytes interleaved with them are not valid codes
for any real key and only ever appear as part of this vendor signal
(confirmed by tracing raw bytes crossing the i8042 port on the actual
hardware). Left unfiltered, this shows up as a spurious KEY_LEFTMETA +
KEY_F14 combo, which does nothing useful and can trigger desktop
environment Meta-key bindings on every press.

This driver already installs an i8042 filter (panasonic_i8042_filter)
to de-duplicate volume key events. Extend it with a small state
machine that recognizes and swallows the exact e0 5b 65 ... e5 e0 db
sequence, and emits a single debounced KEY_ROTATE_LOCK_TOGGLE event
instead. The 600ms debounce is needed because the EC repeats the
make/break unit every ~280-400ms for as long as the button is
physically held, which would otherwise fire multiple toggles for one
tap. If a byte sequence starts the same way but doesn't complete the
pattern, the buffered e0 5b bytes are replayed unfiltered, so a
genuine Left-GUI keypress is unaffected.

Verified on a CF-33 Mk1: each button press now produces exactly one
KEY_ROTATE_LOCK_TOGGLE pair, the plain keyboard device stays silent
during presses (no more stray LEFTMETA/F14), and GNOME's auto-rotate
lock correctly engages/disengages. Brightness and volume hotkeys are
unaffected.

Signed-off-by: Hilgad Montelo <hilgad.montelo@gmail.com>
---
 drivers/platform/x86/panasonic-laptop.c | 85 ++++++++++++++++++++++++-
 1 file changed, 84 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
index 719add7..0c0e4a6 100644
--- a/drivers/platform/x86/panasonic-laptop.c
+++ b/drivers/platform/x86/panasonic-laptop.c
@@ -127,6 +127,7 @@
 #include <linux/init.h>
 #include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
+#include <linux/jiffies.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -256,15 +257,81 @@ struct pcc_acpi {
 /*
  * On some Panasonic models the volume up / down / mute keys send duplicate
  * keypress events over the PS/2 kbd interface, filter these out.
+ *
+ * On the CF-33 the bezel "Rotation Lock" button also signals over this same
+ * interface, instead of via an ACPI notify like the other hotkeys. It does
+ * so by injecting scancodes that alias the real Left-GUI/Meta key
+ * (e0 5b make / e0 db break), interleaved with a bare byte (0x65 / 0xe5)
+ * that no physical key on this keyboard uses. Left unfiltered this shows up
+ * as a bogus LEFTMETA+F14 combo. We recognize and swallow the whole
+ * sequence and emit a single debounced KEY_ROTATE_LOCK_TOGGLE instead; any
+ * byte that breaks the expected pattern is treated as a genuine key and
+ * replayed unfiltered.
  */
+enum rot_lock_state {
+	ROT_IDLE,
+	ROT_WAIT_65,
+	ROT_WAIT_E5,
+	ROT_WAIT_E0B,
+	ROT_WAIT_DB,
+};
+
 static bool panasonic_i8042_filter(unsigned char data, unsigned char str,
 				   struct serio *port, void *context)
 {
+	struct pcc_acpi *pcc = context;
 	static bool extended;
+	static enum rot_lock_state rstate = ROT_IDLE;
+	static unsigned long last_toggle;
+	const unsigned long debounce = msecs_to_jiffies(600);
 
 	if (str & I8042_STR_AUXDATA)
 		return false;
 
+	switch (rstate) {
+	case ROT_WAIT_65:
+		if (data == 0x65) {
+			rstate = ROT_WAIT_E5;
+			if (pcc && pcc->input_dev &&
+			    time_after(jiffies, last_toggle + debounce)) {
+				input_report_key(pcc->input_dev,
+						  KEY_ROTATE_LOCK_TOGGLE, 1);
+				input_sync(pcc->input_dev);
+				input_report_key(pcc->input_dev,
+						  KEY_ROTATE_LOCK_TOGGLE, 0);
+				input_sync(pcc->input_dev);
+				last_toggle = jiffies;
+			}
+			return true;
+		}
+		/* Not our sequence: replay the buffered genuine Left-GUI make. */
+		rstate = ROT_IDLE;
+		serio_interrupt(port, 0xe0, 0);
+		serio_interrupt(port, 0x5b, 0);
+		break;
+	case ROT_WAIT_E5:
+		if (data == 0xe5) {
+			rstate = ROT_WAIT_E0B;
+			return true;
+		}
+		rstate = ROT_IDLE;
+		break;
+	case ROT_WAIT_E0B:
+		if (data == 0xe0) {
+			rstate = ROT_WAIT_DB;
+			return true;
+		}
+		rstate = ROT_IDLE;
+		break;
+	case ROT_WAIT_DB:
+		rstate = ROT_IDLE;
+		if (data == 0xdb)
+			return true;
+		break;
+	case ROT_IDLE:
+		break;
+	}
+
 	if (data == 0xe0) {
 		extended = true;
 		return true;
@@ -276,6 +343,19 @@ static bool panasonic_i8042_filter(unsigned char data, unsigned char str,
 		case 0x2e: /* e0 2e / e0 ae, Volume Down press / release */
 		case 0x30: /* e0 30 / e0 b0, Volume Up press / release */
 			return true;
+		case 0x5b: /* e0 5b, possible start of rotate-lock sequence */
+			if (data == 0x5b) {
+				rstate = ROT_WAIT_65;
+				return true;
+			}
+			/*
+			 * data == 0xdb: genuine Left-GUI/Meta break code.
+			 * The rotate-lock sequence only ever begins with
+			 * the make code, so this is a real key release,
+			 * not our sequence; the code below replays it
+			 * untouched.
+			 */
+			fallthrough;
 		default:
 			/*
 			 * Report the previously filtered e0 before continuing
@@ -944,6 +1024,9 @@ static int acpi_pcc_init_input(struct pcc_acpi *pcc)
 		goto err_free_dev;
 	}
 
+	/* Synthesized by panasonic_i8042_filter(), not part of the ACPI keymap. */
+	input_set_capability(input_dev, EV_KEY, KEY_ROTATE_LOCK_TOGGLE);
+
 	error = input_register_device(input_dev);
 	if (error) {
 		pr_err("Unable to register input device\n");
@@ -1090,7 +1173,7 @@ static int acpi_pcc_hotkey_probe(struct platform_device *pdev)
 		pcc->platform = NULL;
 	}
 
-	i8042_install_filter(panasonic_i8042_filter, NULL);
+	i8042_install_filter(panasonic_i8042_filter, pcc);
 	return 0;
 
 out_platform:
-- 
2.53.0

