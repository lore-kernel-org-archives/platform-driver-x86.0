Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794325705;
	b=iGDQQ0v6sRyOyQ1WLUKUznyWrmOtqQnM9yoJR4FF8ja6wmVL7IRpaSOok41sBWaWWD4S
	 EDJBTMYlscDfHjInFwEOZccWYbtlHe4CMUjLL2XcYp+z89X5+dUkFC7OEVJr7n3pfxI19
	 0ry5imWzF7XS+HInOmBD0JgMNkqqZ3C171KYPEJF+V3qfcc+Ivl7ldzegvWu/17KE+ZFj
	 LxS9i/Yw0AAsZH+uetUUreR5jWVFVGNfcLOSqvtV91jwmery2rNPLm1gZnNIKsWgqs50m
	 be8DScmXYiO0GMdZaUH1fXvh8Y0T28mJ2qlCwlAOTzRkc5lGUj67ASyoOOmxkiMepVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794325705;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=8l0cEb/pGh72uQz0oEHPXZ7XzAZmDHIuKqZq4EFkg2U=;
	b=gETo2+xJq2Dn2Krfp4y4R8NZx97uqGlM/UqTzr0V3WV8Tea/p+SWLiOLhcACYolpfDDK
	 ld4baJT4tntsJ2wJalmZWm4UoP13DphKrQ6w5edtOML/HS8mgqr7dYRxYmhOyAmJ/qYnQ
	 lD81DA+ysPTLbCTp9vvlPoluWKeQHg0wfDzcOaLa1GGtEmeSseCL9PLvB4+sFBkc/AMKa
	 xllU9KbZ1919DsLq7LbSs9v44cVifHbVJ2JzTfX4f+N9ys1PeDVRJE8GWrHp9oe6vzCvL
	 vjwqHnaRlZ93BtKECmhpIXU4tLrvFdEgU4V4/+QgW05pmExizAfTvlRw/6iO3tTT8Xg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=ObO4cYjE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45492606A323;
	Tue, 10 Nov 2026 15:48:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45492606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=ObO4cYjE
ARC-Seal: i=1; a=rsa-sha256; t=1794325673; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=J9QftelKddyAH37jVLcNWK5+U42xad7A9DRsYZuHDcvs3+wUbXkblQTqXmzc7RMLvlhGfL2TlN/Ci0ERCTZDdbWEhnQI2ihshJnGobj18rOSYBeDHoDRMQnlbLMhWanLnjTptLM4kHKa+7aUPQkHSV7pvglnJU6x4KRlSwGn4eU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794325673; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8l0cEb/pGh72uQz0oEHPXZ7XzAZmDHIuKqZq4EFkg2U=; 
	b=VXGvCatmb8sQGBcWiq7+3C2nqS3bDO56HQSGRVixcJ6r4J1o069v/n9SN18VdPa31bVtfs4rTzd8ysI1N5m8xtdMqVShdiJFt0mm/n0vhF8ggxi1NCMWwI1cSJli76auk2roSNL/gqbEXGjKbCbKCZLH4snwo/WZRze7a6GTsYQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=ObO4cYjEQhdj1+uYecVlrLlfhFixd8oiqjnEUaoiPc6eUxYT/5y6jKrBiZa69RgJzRb2z1y/voIMJ+qRVsUHpx9Mefk33uIE1CQTyr5ZlevTEqAZUHtiy1BdFMdcD0kU5PdEKC4834Cc0jwjvwudQ8TTdA/G0isHqY8M5WmBdrnTVIctpQxrf2E+G8MUWUSGQ2eWwht6y1ijai77kDmFdXyCu4J7jtGW1+PSCq/Q4bHxixhftMWiykp8JOH02LrjvsCZ1Is0Fm92EwofZ10y1uJH2CiXxRvsmkdbDVQZU8i3aM9xFr1b6ORpafYlClIPg9/OZc9gsg+KiW++LzuQ6w==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=8l0cEb/pGh72uQz0oEHPXZ7XzAZmDHIuKqZq4EFkg2U=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794325671736229.56764940797223;
	Tue, 10 Nov 2026 07:47:51 -0800 (PST)
From: Rong Zhang <i@rong.moe>
Date: Tue, 10 Nov 2026 23:47:02 +0800
Subject: [PATCH v8 1/3] platform/x86: ideapad-laptop: Serialize keyboard
 backlight tracking
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261110-leds-trigger-hw-changed-v8-1-2717115d612c@rong.moe>
References: <20261110-leds-trigger-hw-changed-v8-0-2717115d612c@rong.moe>
In-Reply-To: <20261110-leds-trigger-hw-changed-v8-0-2717115d612c@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Vishnu Sankar <vishnuocv@gmail.com>, Vishnu Sankar <vsankar@lenovo.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ike Panhc <ikepanhc@gmail.com>, Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-ce4c1
X-ZohoMailClient: External

ACPI notifications are delivered in dedicated work contexts and may
arrive simultaneously. In the following change, much work will be done
while handling the notification, which could lead to potential race
conditions.

Introduce a new mutex to serialize keyboard backlight tracking to
prevent potential race conditions.

Acked-by: Ike Panhc <ikepanhc@gmail.com>
Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v6:
- Protects ideapad_kbd_bl_led_cdev_brightness_set() as well

Changes in v4:
- Remove needless #include (Thanks Ilpo Järvinen)
---
 drivers/platform/x86/lenovo/ideapad-laptop.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
index 91a8d11c79c5..04343e9a2d47 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -26,6 +26,7 @@
 #include <linux/kernel.h>
 #include <linux/leds.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/platform_profile.h>
 #include <linux/power_supply.h>
@@ -204,6 +205,7 @@ struct ideapad_private {
 		int type;
 		struct led_classdev led;
 		unsigned int last_brightness;
+		struct mutex mutex; /* protects brightness tracking */
 	} kbd_bl;
 	struct {
 		bool initialized;
@@ -1663,6 +1665,8 @@ static int ideapad_kbd_bl_brightness_set(struct ideapad_private *priv, unsigned
 	unsigned long value;
 	int type = priv->kbd_bl.type;
 
+	guard(mutex)(&priv->kbd_bl.mutex);
+
 	if (ideapad_kbd_bl_check_tristate(type)) {
 		if (brightness > priv->kbd_bl.led.max_brightness)
 			return -EINVAL;
@@ -1698,6 +1702,8 @@ static void ideapad_kbd_bl_notify(struct ideapad_private *priv)
 	if (!priv->kbd_bl.initialized)
 		return;
 
+	guard(mutex)(&priv->kbd_bl.mutex);
+
 	brightness = ideapad_kbd_bl_brightness_get(priv);
 	if (brightness < 0)
 		return;
@@ -1720,6 +1726,10 @@ static int ideapad_kbd_bl_init(struct ideapad_private *priv)
 	if (WARN_ON(priv->kbd_bl.initialized))
 		return -EEXIST;
 
+	err = devm_mutex_init(&priv->platform_device->dev, &priv->kbd_bl.mutex);
+	if (err)
+		return err;
+
 	if (ideapad_kbd_bl_check_tristate(priv->kbd_bl.type))
 		priv->kbd_bl.led.max_brightness = 2;
 	else

-- 
2.55.0

