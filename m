Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00DB33F582
	for <platform-driver-x86@vger.kernel.org>; Thu, 13 Aug 2026 02:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786589856; cv=none; b=VYwn+UkcNycnvLRagESLcUDFfVwabSbz3Zww3UW+XcCJN9exNVzue4WEUx7TDqO9Ymyk/BCPmekEp6veVhcE1jzPHjttz1wgdIfJoQknQ7DWdQ+jqNY83hIw/4MhB5RpKvpVSJ7YXg0m2YdEgoD7W95WmcMEkXNt5t91xjdbAvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786589856; c=relaxed/simple;
	bh=cRQfdbLZ3ICmfv+Fc5dWwLKI4CXtVAZc0TRfydSnF+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RChjW4tGwuE+IjJPS0lrXxf9xABYFt+wf2qLmk29wgZ0lrA3jS0EQ2aWCGyb/Rf90H0aSwSvhGuup94I0XBCVoUPg1j8zwyhDiXmaBCWuWYvEXi+NRAxaLWXP/s3ENFuOgnaRRb6QE8eq7x6L0W3wgpXYduNUe98OWKST4nFcwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D1XzdeH4; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D1XzdeH4"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38e69bdb0fcso280739a91.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Aug 2026 19:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786589854; x=1787194654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zhNKXXTZhX7lAIpUNXsVTvjOGLIK85dFzIC2xWkANms=;
        b=D1XzdeH41XE9LC7RsBjHAiMesIPXDpolir/W0WmBQ2S/SmWj4jeujhvwI9B+QsiirS
         jvW+/4kx1P6okhragJrPHsa5nj/gTJdaN7WquJ+XSt3PIihQX2L9O+W9elV6k+UdYaU3
         cZbSaLbxolvekQ2Rf3f1uVbJEvPaoPwz5gFNaFoD6Eq1KDA5iYzu0W6lalpqp7IHqHjV
         2lLRnRCuajtHMwTAip0/pRYWhpC0uv7er1X/Gn/EFOneeEZdwMzhQMrVkfVXPKaMdqEU
         +yM6WvsFgSIUk+V3S6z8ifT9Si9Nq/7ednvbPKEPjQwv4q7xesdAqzhA2ocGu/adEJMT
         FPXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786589854; x=1787194654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zhNKXXTZhX7lAIpUNXsVTvjOGLIK85dFzIC2xWkANms=;
        b=Hrkjw0oxXCBUtoIE9m3ThrCBzgcKv6xvw9DjZqV1+M1MU62BuLtiphQdy6RrJ54BvO
         hvoD8KCytDbn8/dk6Px9thj3zlo79ddo68EqwVgotlQCfaIzoaFA6B39xRYxgLNq4F7T
         mZQoSBRMdAGVoCAd5NOixs7is1o/71U6zjoafpHyzdX8gBYNHj07WbBwIezLL/CGL2O8
         MPK1LVvOVVsysSmo8zqIOziB3IjwklrIsqF+Vx7a5ymiatM0by+cvAkPojQtvIkVlvC1
         Y84/v2roVh+1iIlzv6Uzdibbhc00K35BaFyJt69T9zuuhjfdg6U9rrTj3t9dmGjBw1wv
         eOqw==
X-Gm-Message-State: AOJu0Ywtv8795ZYADmigcNevfRk3W2ev8TRA48gk5H9k3J1q40M0OWFf
	57Y3Pnf5LCYBOjGZlaW5wn4WsBAcuGxLkr+9tZqihgURlHNvPX6ytdEZ
X-Gm-Gg: AR+sD10eoWPAMz2CXGLU473RayOp5/X7EdKffqh2EsjUs+aUN7k4fb0DeSyQmjpt/Hh
	aC6Ozc8RaNp9Yu8OsOYVA5vo00WQpxBQ+MunpN/cGpgePVb9/lr69yNn0D6u759vslZvvrHWvgU
	fJ0uDeWRDHSMCQfuK9/At/0mt9dFxWsU3rQn8gSk6bTu2UaktttelHY8x6rmnU8LH35MNGr8bDl
	CAuozPQJ+ob8z7Xn3vqDCFmqusimRp06i4mkKXxkII7fYY59G88E/zKIQSTpZRY7jHwK8MOctWY
	th8lrI2Z8JySPunnHAlIMWJT3Iwjh59PHQNIyuGD+PWdmIQkF/ODcVCp8fnhBOYrY/owChJllg7
	VtmLyxMf+/JFfXIMtA4GmoxMQSF9T+6wU2RXN+LGxXhCRxuLlJWiu2EHwPiCeu7G6LCpzViixGp
	ScKzT0LI/xCxlbzvnI5lNigkqdsZg11YoUUN2U4YIVGebVD5hwmxL+dpo4NkSy2ittDw8SivqV3
	VRVTH/474VR7w0VmSU=
X-Received: by 2002:a17:90b:540c:b0:390:b41a:b92f with SMTP id 98e67ed59e1d1-3931e31bd38mr3055871a91.18.1786589853993;
        Wed, 12 Aug 2026 19:57:33 -0700 (PDT)
Received: from sonic ([177.181.237.62])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebcf66340sm2097470eec.13.2026.08.12.19.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 19:57:33 -0700 (PDT)
From: Hilgad Montelo <hilgad.montelo@gmail.com>
To: Kenneth Chan <kenneth.t.chan@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hilgad Montelo <hilgad.montelo@gmail.com>
Subject: [PATCH 1/3] platform/x86: panasonic-laptop: Handle CF-33 rotation-lock button
Date: Wed, 12 Aug 2026 23:56:23 -0300
Message-ID: <20260813025626.24266-2-hilgad.montelo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813025626.24266-1-hilgad.montelo@gmail.com>
References: <20260813025626.24266-1-hilgad.montelo@gmail.com>
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
 drivers/platform/x86/panasonic-laptop.c | 75 ++++++++++++++++++++++++-
 1 file changed, 74 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
index 719add7..730d7cb 100644
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
@@ -276,6 +343,9 @@ static bool panasonic_i8042_filter(unsigned char data, unsigned char str,
 		case 0x2e: /* e0 2e / e0 ae, Volume Down press / release */
 		case 0x30: /* e0 30 / e0 b0, Volume Up press / release */
 			return true;
+		case 0x5b: /* e0 5b, possible start of rotate-lock sequence */
+			rstate = ROT_WAIT_65;
+			return true;
 		default:
 			/*
 			 * Report the previously filtered e0 before continuing
@@ -944,6 +1014,9 @@ static int acpi_pcc_init_input(struct pcc_acpi *pcc)
 		goto err_free_dev;
 	}
 
+	/* Synthesized by panasonic_i8042_filter(), not part of the ACPI keymap. */
+	input_set_capability(input_dev, EV_KEY, KEY_ROTATE_LOCK_TOGGLE);
+
 	error = input_register_device(input_dev);
 	if (error) {
 		pr_err("Unable to register input device\n");
@@ -1090,7 +1163,7 @@ static int acpi_pcc_hotkey_probe(struct platform_device *pdev)
 		pcc->platform = NULL;
 	}
 
-	i8042_install_filter(panasonic_i8042_filter, NULL);
+	i8042_install_filter(panasonic_i8042_filter, pcc);
 	return 0;
 
 out_platform:
-- 
2.53.0

