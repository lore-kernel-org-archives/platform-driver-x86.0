Received: from mail1.khirnov.net (quelana.khirnov.net [94.230.150.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5718A125A9;
	Sat, 29 Nov 2025 10:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.230.150.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764411376; cv=none; b=u8DIrrTiY/QQiBJHFQsvK7RxiaudYiKw5rgw+MhRU1qalhvxQKxCQDAltGkZuB6sHXSUPivm3cSRTn6N7igIH4ZJOA2xppQvd+dD7wez7BfYmVVXjykMLzhjJNP3t7vgGV9rhkyWyo7MhXG3c5uM6YquXvlCATAUJY1DVoNU8uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764411376; c=relaxed/simple;
	bh=NK9Fg5hTZk4lQivdnbaD0C60mNg7kH+GodQuEBSAnM8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DxHE/tPHUqwUG/1pSgn42lVW7dDC0FEkOiqS2hzUUkdR5FKJ/tCjCbONyHnA1ScY8A5pMxgSc5hwJyUW94m0D3R3TFTM25lFjSr3Y3RYZ8yPc2bY9tm943mXGb4+9Nfg8yP1vwOXxspeuIfwuFAVZ++XGP+vcRVYiStPXolzto4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=khirnov.net; spf=pass smtp.mailfrom=khirnov.net; dkim=pass (2048-bit key) header.d=khirnov.net header.i=@khirnov.net header.b=JUZannYH; arc=none smtp.client-ip=94.230.150.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=khirnov.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=khirnov.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=khirnov.net header.i=@khirnov.net header.b="JUZannYH"
Authentication-Results: mail1.khirnov.net;
	dkim=pass (2048-bit key; unprotected) header.d=khirnov.net header.i=@khirnov.net header.a=rsa-sha256 header.s=mail header.b=JUZannYH;
	dkim-atps=neutral
Received: from localhost (mail1.khirnov.net [IPv6:::1])
	by mail1.khirnov.net (Postfix) with ESMTP id 5CA2040AE;
	Sat, 29 Nov 2025 11:16:08 +0100 (CET)
Received: from mail1.khirnov.net ([IPv6:::1])
 by localhost (mail1.khirnov.net [IPv6:::1]) (amavis, port 10024) with ESMTP
 id zRBgNuuI9wMz; Sat, 29 Nov 2025 11:16:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=khirnov.net; s=mail;
	t=1764411362; bh=NK9Fg5hTZk4lQivdnbaD0C60mNg7kH+GodQuEBSAnM8=;
	h=From:To:Cc:Subject:Date:From;
	b=JUZannYHR6SUSR3Cv3epbhIr99fohW9nqam6CWMDbGwRPiWnCm8JtMdd8jzGyVrFN
	 tmoKojnQm43E+ptmM2yo9Frk+X/Spw2k/1iNJKha8Qt2hoBMvw8SXWqv/LotIswfWL
	 5vFk07A6XjZwo+iRHQp4bKwvXPLfcjixk9kervhO8QEBvc0jhkAaUELq6gglxTHzpQ
	 qTYXSZrxYxQEkzYbq3FEN3CMQ8zrZ6kU3BI7LRUA+ctgPAzlHQA0a9JnWsAzAa/VBt
	 wxfU8679/aIpaq1PwujSmEo0Fc0W/J1d5RXVQjCD9ye1MJnMxck25txk1wURXzgyt4
	 yHhWz1099BVog==
Received: from dev0.khirnov.net (dev0.khirnov.net [IPv6:2a00:c500:561:201::6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "dev0.khirnov.net", Issuer "smtp.khirnov.net SMTP CA" (verified OK))
	by mail1.khirnov.net (Postfix) with ESMTPS id B8DCC3254;
	Sat, 29 Nov 2025 11:16:02 +0100 (CET)
Received: by dev0.khirnov.net (Postfix, from userid 1000)
	id A233D402DF8; Sat, 29 Nov 2025 11:16:02 +0100 (CET)
From: Anton Khirnov <anton@khirnov.net>
To: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <benato.denis96@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jian-Hong Pan <jian-hong@endlessm.com>
Cc: anton@khirnov.net,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] platform/x86: asus-wmi: use brightness_set_blocking() for kbd led
Date: Sat, 29 Nov 2025 11:13:08 +0100
Message-ID: <20251129101307.18085-3-anton@khirnov.net>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kbd_led_set() can sleep, and so may not be used as the brightness_set()
callback.

Otherwise using this led with a trigger leads to system hangs
accompanied by:
BUG: scheduling while atomic: acpi_fakekeyd/2588/0x00000003
CPU: 4 UID: 0 PID: 2588 Comm: acpi_fakekeyd Not tainted 6.17.9+deb14-amd64 #1 PREEMPT(lazy)  Debian 6.17.9-1
Hardware name: ASUSTeK COMPUTER INC. ASUS EXPERTBOOK B9403CVAR/B9403CVAR, BIOS B9403CVAR.311 12/24/2024
Call Trace:
 <TASK>
 [...]
 schedule_timeout+0xbd/0x100
 __down_common+0x175/0x290
 down_timeout+0x67/0x70
 acpi_os_wait_semaphore+0x57/0x90
 [...]
 asus_wmi_evaluate_method3+0x87/0x190 [asus_wmi]
 led_trigger_event+0x3f/0x60
 [...]

Fixes: 9fe44fc98ce4 ("platform/x86: asus-wmi: Simplify the keyboard brightness updating process")
Signed-off-by: Anton Khirnov <anton@khirnov.net>
---
v2:
 - reworded commit message, adding traceback
 - merged lines in kbd_led_set() signature
---
 drivers/platform/x86/asus-wmi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index e72a2b5d158e..8e3300f5c294 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1619,14 +1619,14 @@ static void do_kbd_led_set(struct led_classdev *led_cdev, int value)
 	kbd_led_update(asus);
 }
 
-static void kbd_led_set(struct led_classdev *led_cdev,
-			enum led_brightness value)
+static int kbd_led_set(struct led_classdev *led_cdev, enum led_brightness value)
 {
 	/* Prevent disabling keyboard backlight on module unregister */
 	if (led_cdev->flags & LED_UNREGISTERING)
-		return;
+		return 0;
 
 	do_kbd_led_set(led_cdev, value);
+	return 0;
 }
 
 static void kbd_led_set_by_kbd(struct asus_wmi *asus, enum led_brightness value)
@@ -1802,7 +1802,7 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
 		asus->kbd_led_wk = led_val;
 		asus->kbd_led.name = "asus::kbd_backlight";
 		asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
-		asus->kbd_led.brightness_set = kbd_led_set;
+		asus->kbd_led.brightness_set_blocking = kbd_led_set;
 		asus->kbd_led.brightness_get = kbd_led_get;
 		asus->kbd_led.max_brightness = 3;
 
-- 
2.47.3

