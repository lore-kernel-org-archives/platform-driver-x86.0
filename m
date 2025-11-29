Received: from mail1.khirnov.net (quelana.khirnov.net [94.230.150.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076C0266A7;
	Sat, 29 Nov 2025 04:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.230.150.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764389528; cv=none; b=CvFNvv9T9rEEQt5XtEyB7QO8Plq03XsFe2MNmdIv6dDxgw+IhNS0Rz/XsuF2jlrKtWuTWy/DEaP+u2BtkBCXNGDwM+uw1oDim/GYPT/k0eid3zGPCbS1uyJ3K2o5+uLrNIWptLFs8WjYKl0lIvc1Zr+ugDE28eUhygWiP3RYvgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764389528; c=relaxed/simple;
	bh=5OIn+ly65WD0MtPlkSDUekH5MtqV8LoOjnxFW7gR4zM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ie3jlAUpg5PA6AQnjY1443WMkWlebExV74PLS3UKEqemld7XwJuPMMS5BUenB/Mkye1VYLwqAxD3Tua4bvixY+AW1J4Z7AvUt/xb/ipS8okrFcEz8fevNMnvGDtybw9NeBF2x//HMOoW/1ip7H8ibuON0XhK/3lTnD8Uphgs2LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=khirnov.net; spf=pass smtp.mailfrom=khirnov.net; dkim=pass (2048-bit key) header.d=khirnov.net header.i=@khirnov.net header.b=R7+8HV2E; arc=none smtp.client-ip=94.230.150.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=khirnov.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=khirnov.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=khirnov.net header.i=@khirnov.net header.b="R7+8HV2E"
Authentication-Results: mail1.khirnov.net;
	dkim=pass (2048-bit key; unprotected) header.d=khirnov.net header.i=@khirnov.net header.a=rsa-sha256 header.s=mail header.b=R7+8HV2E;
	dkim-atps=neutral
Received: from localhost (mail1.khirnov.net [IPv6:::1])
	by mail1.khirnov.net (Postfix) with ESMTP id 7A94F40C4;
	Sat, 29 Nov 2025 05:04:56 +0100 (CET)
Received: from mail1.khirnov.net ([IPv6:::1])
 by localhost (mail1.khirnov.net [IPv6:::1]) (amavis, port 10024) with ESMTP
 id mhiExOiG65_7; Sat, 29 Nov 2025 05:04:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=khirnov.net; s=mail;
	t=1764389092; bh=5OIn+ly65WD0MtPlkSDUekH5MtqV8LoOjnxFW7gR4zM=;
	h=From:To:Cc:Subject:Date:From;
	b=R7+8HV2EielFP0XiBgNKEWS43Rm4Pft9wsPs9lKu9GuRF8SEY/TdnZzjmdA7vcbaH
	 vXZu66K/PZzuhMpaLgXmkA9csO0RjTB4yQ+p2CDsCzDlERPm0s6kdo48+cr6iWhycF
	 jgHeofGjsPnC3pfXvw2mPYmJmxw3yfghG3os+D8F8Q7PVNF5OZ5k4bOZCeQY5b5C6B
	 hyEZIUjrzxkhBXDmUhgRrP+XKiZuPiIloIUjNcoNTWUY1JjyTto8K16u7CiHibmrhJ
	 uT0GFYwjREO4NzUxljGucSyZ+Pm/psqCfYO+6SV9lebDG1xqtG+iaiqkJJhspZ63v0
	 geIyO+wYSLu4g==
Received: from dev0.khirnov.net (dev0.khirnov.net [IPv6:2a00:c500:561:201::6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "dev0.khirnov.net", Issuer "smtp.khirnov.net SMTP CA" (verified OK))
	by mail1.khirnov.net (Postfix) with ESMTPS id 1FDDD409A;
	Sat, 29 Nov 2025 05:04:52 +0100 (CET)
Received: by dev0.khirnov.net (Postfix, from userid 1000)
	id F1CD3402DF8; Sat, 29 Nov 2025 05:04:51 +0100 (CET)
From: Anton Khirnov <anton@khirnov.net>
To: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <benato.denis96@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jian-Hong Pan <jian-hong@endlessm.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: asus-wmi: use brightness_set_blocking() for kbd led
Date: Sat, 29 Nov 2025 05:02:46 +0100
Message-ID: <20251129040247.13411-1-anton@khirnov.net>
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

Fixes "BUG: scheduling while atomic" when using this led with a trigger.

Fixes: 9fe44fc98ce4 ("platform/x86: asus-wmi: Simplify the keyboard brightness updating process")
Signed-off-by: Anton Khirnov <anton@khirnov.net>
---
 drivers/platform/x86/asus-wmi.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index e72a2b5d158e..638ff56e50a3 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1619,14 +1619,15 @@ static void do_kbd_led_set(struct led_classdev *led_cdev, int value)
 	kbd_led_update(asus);
 }
 
-static void kbd_led_set(struct led_classdev *led_cdev,
-			enum led_brightness value)
+static int kbd_led_set(struct led_classdev *led_cdev,
+		       enum led_brightness value)
 {
 	/* Prevent disabling keyboard backlight on module unregister */
 	if (led_cdev->flags & LED_UNREGISTERING)
-		return;
+		return 0;
 
 	do_kbd_led_set(led_cdev, value);
+	return 0;
 }
 
 static void kbd_led_set_by_kbd(struct asus_wmi *asus, enum led_brightness value)
@@ -1802,7 +1803,7 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
 		asus->kbd_led_wk = led_val;
 		asus->kbd_led.name = "asus::kbd_backlight";
 		asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
-		asus->kbd_led.brightness_set = kbd_led_set;
+		asus->kbd_led.brightness_set_blocking = kbd_led_set;
 		asus->kbd_led.brightness_get = kbd_led_get;
 		asus->kbd_led.max_brightness = 3;
 
-- 
2.47.3

