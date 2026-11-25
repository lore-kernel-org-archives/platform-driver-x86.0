Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795648301;
	b=mn+fonn2LlyYlC2QW2nkJhuIX4+4fwZq2W8rrhVfx5n9uLYB/riOuLUnI5R2qkHOMD5L
	 8odIrSJ0zwKpQrvQASrmrs/2pKMmuGb/akyWw7SHrNrzCcCUowfg+64/wjNcwlym9tJMN
	 R+TXN6nvsuMX37y6xgMoRiOFOcti1DR73IEQyC5poZ5Wr+9h0ipLbY07TCLYxm0sCwV/T
	 avhUR8WzEX0znl9+iGGgrnm9iPtNly4wwgmZZamDez8XEM/go6j0auGy3JzzT8Za2kIUA
	 y/mfeIc80IkF/sXy5kpgYTmXtfRfgWCR1Wy36chWMteddHzU3wUjPF/j1fdkKyHMGig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648301;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=FYzpa+fF/4UHchQ/95yGL3VchrdjPBxjmxj9HUS14RM=;
	b=2qbTUDtThnuyTbWcNG2JzwxiIbAKtWcWBa31OjJ+ggqzxhpKZgYENoHnoGROagZLzUBK
	 YdOcb5yUYL7WCPApsu4q7d8Lxr0oF+exTHCL5HJNlGRdtgr6nDYcP4virP6E3to9dSjnA
	 qpJ5rNltt+j+YEBqhwX+Z7dMBBacLmzHySV9KqtSHYbtL+txb4OiS1p4t6ISAVH+oPzm4
	 3YhtEOt5l8aRSvgIn0JQDMtCkX720+xvkLNAK3u1H1nlkGrR7/bR7MSvEmZ6quxDehqOG
	 +BD0tSHGy1RYb1zxyr7VoqfvjGVToTBhfwG6zW4LuIyB1wzvZo0co2BAvADUB3mZWMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nE3TJw5O;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150A2606A32D
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 23:11:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 150A2606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nE3TJw5O
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso13508326eec.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 15:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795648300; x=1796253100; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FYzpa+fF/4UHchQ/95yGL3VchrdjPBxjmxj9HUS14RM=;
        b=nE3TJw5ODewB5h+10ldTDNc+wgEeYw58B6z1N1YSKhFXm85tAGn15diJM4h4iTXvjD
         YMRWiehLZdPNJI1/F2jlxe38pYY8oPCAZVFAU/mF+IRoTt6+Q+WHadcXJX79lwKL5RtZ
         QDRLcBNT9pc3ZgXFwFytOWzaAWVIlUpuv+AmDv6zryeE+H4o0U9RCr0vTrAtN+8JAO8y
         P3P6wXoZ/euqgyUPX1Cshuh2ROGs81KkG4ivPmEyMnr/fxpuuiCPQdA1XReZXRNV58pv
         tOYdxgUt186oaA5Vv6PjDeafk0paF3+EKcetRU+hAx7e87PE3qi4iOQpPzGllIfDi2uA
         GdHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795648300; x=1796253100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FYzpa+fF/4UHchQ/95yGL3VchrdjPBxjmxj9HUS14RM=;
        b=LyYRxilfV059+9YKUfoRbuNsO4rcMfxcW3ZY/YU5yH/C5FhxR2EZLe/jYv0Brdm5HL
         1q63/Hpid5dZeCyejbYqLUhS2pn6SCp0kuSzRL/7j8FDpE3KLv8cbjkEBPIxwte8kMc2
         NUTHUJgEV3dmFNK4LqCHjo+HR7sU0ZZQXrCaMa0DTc/2FxwaJV1jVOxW9+Ps8lkcwyb0
         E2LpLSKU8zvaiUyrj3THFX9COPS6qRrEjFooO/aNUZzSoaZkTp+FSGO4Rv0+YKREeRZX
         eF2dHbwpekZdUfcZgngxCgclMtUq+pIIjZ/tZCjP1Czm6IUecGgyVO7Bcu820xtC4UQD
         9yOQ==
X-Gm-Message-State: APuU4Z/A7Sbe3x6PQ+YGKlnAyTyKIu+O8Co222+P6n3QFyECuqDFDhuO
	n3Nj/lQvbXQFZlRuUxpBJiHSq/uAT6QZMNiTY/INw2z9qaqQ5cRUVQWF
X-Gm-Gg: AZFdTZeWcshnFgA59ddrErHU9WpVVoV9aAp4SjKX+NyBYW3LECJvLRGqH6Ts/22Bm78
	4RjXLKRiG7uUKBhLi2PXK34usXBDiNSmMByVjN9Pl9f0OeVrLNZb1y0KSNpLuOTq6vbVwOnUGfm
	0Rln4NO+1g/z5hyJ+93AIYj6vmwRDIgeJoS1f4/oWPMA/JMkwgJ5uNuEoD63AbyOaBIqE0pOr5t
	WzFBXWImclVRk3SeA3XPWlEmRZziUtpGlHEjnouaa04kpEVAhY104KHM2DJuNF1nIO6ubv2pjs+
	cIXm/2TFcwXGlJWuGddzL8lF0CAY97VTrRK51mt30x+JP1MXasNOyyJnqUKbVRj8is9SJxFtY0F
	6QUijbYAPXrUJQsr4E/ft8KTXBBxiCwPkl1fV0pFXNJC/PY/U25yDfuc98Z8luzHHI3pxyyw/M4
	kJHVQLVZV6zirsqTsQVC75WfAGpua4BdsDPFgaa6mC962UtiOUYyj0pGIX3+KrU1yCk4jhnX6NP
	vsfuNFrSko6LJeh+tEErZXD4g1l69caJSIk8818u5LVbj8+BcaF1uUgVOBuYpzOo2MFSVZzeGQC
	hNmVGKLCtTILgXOoo3GSwV6/XZKV/vvMimk4X32/iT43UAPwf9ZoWSgKeBpiaJF0lwrHQIEHfUk
	73kFxdAVaQMhX2fMh+Q==
X-Received: by 2002:a05:693c:87d2:10b0:386:b5a8:1c5b with SMTP id 5a478bee46e88-386b5a82496mr9851480eec.18.1795648300088;
        Wed, 25 Nov 2026 15:11:40 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:f528:8797:fe51:9f7e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm64430145eec.26.2026.11.25.15.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:11:39 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 25 Nov 2026 15:11:16 -0800
Subject: [PATCH 3/8] platform/x86: thinkpad_acpi: simplify hotkey
 open/close and poll setup
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-thinkpad-acpi-hotkey-poll-v1-3-6dee57519c2e@gmail.com>
References: <20261125-thinkpad-acpi-hotkey-poll-v1-0-6dee57519c2e@gmail.com>
In-Reply-To: <20261125-thinkpad-acpi-hotkey-poll-v1-0-6dee57519c2e@gmail.com>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, Rong Zhang <i@rong.moe>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, 
 ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev

Since commit 38b9ab80db31 ("platform/x86: thinkpad_acpi: Move subdriver
initialization to tpacpi_pdriver's probe."), tpacpi_subdrivers_release()
is registered via devm_add_action_or_reset() before tpacpi_inputdev is
registered. Because devres resources are unwound in reverse order,
tpacpi_inputdev is always unregistered (closing any open handles and
preventing new opens) before hotkey_exit() is called. Combined with
hotkey_kthread() no longer exiting early on TPACPI_LIFE_EXITING, the
lifecycle guards in the input callbacks are unnecessary.

Drop the obsolete tpacpi_lifecycle checks and BUG() from
hotkey_inputdev_open() and hotkey_inputdev_close(), as well as the
redundant driver mask check in hotkey_inputdev_close() (which
hotkey_poll_setup() already evaluates).

Also call hotkey_poll_setup() directly inside the existing hotkey_mutex
critical sections in hotkey_init() and hotkey_resume(), and remove the
now-unused hotkey_poll_setup_safe() wrapper.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 52 +++++++++--------------------
 1 file changed, 15 insertions(+), 37 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 659a2c5d1982..e5f78107bd1a 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -2546,12 +2546,6 @@ static void hotkey_poll_setup(const bool may_warn)
 	}
 }
 
-static void hotkey_poll_setup_safe(const bool may_warn)
-{
-	guard(mutex)(&hotkey_mutex);
-	hotkey_poll_setup(may_warn);
-}
-
 static void hotkey_poll_set_freq(unsigned int freq)
 {
 	lockdep_assert_held(&hotkey_mutex);
@@ -2568,10 +2562,6 @@ static void hotkey_poll_setup(const bool __unused)
 {
 }
 
-static void hotkey_poll_setup_safe(const bool __unused)
-{
-}
-
 static void hotkey_poll_stop_sync(void)
 {
 }
@@ -2579,21 +2569,12 @@ static void hotkey_poll_stop_sync(void)
 
 static int hotkey_inputdev_open(struct input_dev *dev)
 {
-	switch (tpacpi_lifecycle) {
-	case TPACPI_LIFE_INIT:
-	case TPACPI_LIFE_RUNNING:
-		scoped_guard(mutex, &hotkey_mutex) {
-			hotkey_input_enabled = true;
-			hotkey_poll_setup(false);
-		}
-		return 0;
-	case TPACPI_LIFE_EXITING:
-		return -EBUSY;
-	}
+	guard(mutex)(&hotkey_mutex);
+
+	hotkey_input_enabled = true;
+	hotkey_poll_setup(false);
 
-	/* Should only happen if tpacpi_lifecycle is corrupt */
-	BUG();
-	return -EBUSY;
+	return 0;
 }
 
 static void hotkey_inputdev_close(struct input_dev *dev)
@@ -2601,11 +2582,7 @@ static void hotkey_inputdev_close(struct input_dev *dev)
 	guard(mutex)(&hotkey_mutex);
 
 	hotkey_input_enabled = false;
-
-	/* disable hotkey polling when possible */
-	if (tpacpi_lifecycle != TPACPI_LIFE_EXITING &&
-	    !(hotkey_source_mask & hotkey_driver_mask))
-		hotkey_poll_setup(false);
+	hotkey_poll_setup(false);
 }
 
 /* sysfs hotkey enable ------------------------------------------------- */
@@ -3571,22 +3548,23 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 		res = hotkey_mask_set(((hotkey_all_mask & ~hotkey_reserved_mask)
 				       | hotkey_driver_mask)
 				      & ~hotkey_source_mask);
+		if (!res) {
+			hotkey_user_mask = (hotkey_acpi_mask | hotkey_source_mask)
+						& ~hotkey_reserved_mask;
+			vdbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_HKEY,
+				    "initial masks: user=0x%08x, fw=0x%08x, poll=0x%08x\n",
+				    hotkey_user_mask, hotkey_acpi_mask, hotkey_source_mask);
+			hotkey_poll_setup(true);
+		}
 	}
 	if (res) {
 		hotkey_exit();
 		return res;
 	}
-	hotkey_user_mask = (hotkey_acpi_mask | hotkey_source_mask)
-				& ~hotkey_reserved_mask;
-	vdbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_HKEY,
-		"initial masks: user=0x%08x, fw=0x%08x, poll=0x%08x\n",
-		hotkey_user_mask, hotkey_acpi_mask, hotkey_source_mask);
 
 	tpacpi_inputdev->open = &hotkey_inputdev_open;
 	tpacpi_inputdev->close = &hotkey_inputdev_close;
 
-	hotkey_poll_setup_safe(true);
-
 	/* Enable TrackPoint doubletap event reporting by default. */
 	tp_features.trackpoint_doubletap_enable = 1;
 
@@ -4024,6 +4002,7 @@ static void hotkey_resume(void)
 		if (hotkey_status_set(true) < 0 ||
 		    hotkey_mask_set(hotkey_acpi_mask) < 0)
 			pr_err("error while attempting to reset the event firmware interface\n");
+		hotkey_poll_setup(false);
 	}
 
 	tpacpi_send_radiosw_update();
@@ -4033,7 +4012,6 @@ static void hotkey_resume(void)
 	keyboard_attached_on_screen_notify_change();
 	hotkey_wakeup_reason_notify_change();
 	hotkey_wakeup_hotunplug_complete_notify_change();
-	hotkey_poll_setup_safe(false);
 
 	/* restore previous mode of adaptive keyboard of X1 Carbon */
 	if (tp_features.has_adaptive_kbd) {

-- 
2.56.1.839.g22a8290db9-goog

