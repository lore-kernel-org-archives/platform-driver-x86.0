Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D137269B0D
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Sep 2025 20:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758398843; cv=none; b=gd91Yb5dyehKM6yXBrPP89eXO+dX1YFwk9x8sC8pTvnwjwkBTeV9WmX2MuOY6lwIFOwzwLH0FWlN8F6Dyy0z4vuYD0Q6tKQtfiopKlszWvZfMd0aRlw0gZePHEZjAOMSSDO8olRmDh8QxChYTPYccfcDHQ9SzSTm17UlZCbJSl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758398843; c=relaxed/simple;
	bh=HPzwTsZSGxuFC2JKBR0Z1JfQf52FLoLyNgwSwGKIPhk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LaBjOPiyycPEGrp92NWpA+3BxvPOK6gr6ocMI0fgcuOPEv6ow9z6TcvuQBaUGgcch2g/bi5LzXkn7cRnB2ALvjR3xqGXGhbm3DIRxXJsoB6YZo/eZLZlFaxOmhinWmFAsi15ElpfOqcxCRIYCdrFousPGhedDEef0UjOqLJwWlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uGassLOT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uGassLOT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29B69C4CEEB;
	Sat, 20 Sep 2025 20:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758398842;
	bh=HPzwTsZSGxuFC2JKBR0Z1JfQf52FLoLyNgwSwGKIPhk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uGassLOTeglFo+ulpUnrJj9a72mTHICrQE8tqevI+EY13MwQvHu/5mLR0EY/hVVvQ
	 6mSKaYYSzfvniNjfT8Ik8yKK5bdqCRMlk5VmAPCc0vKbXFHWXGuci30oy7xQHqvtym
	 0fTPa6EePYK4fOW17WWwWxZBZY5GVrh7YIHjoKSTGmrMJUdB5R59Ezk102hdnoVqJr
	 5kB2huqKmRllDKFyTv5vC+DQz5rntjKztT466uNrXQsAfOHitjyrbvY30qY3xFE6fZ
	 m/S6ISlYy9yxlP17X2+DVqPuzwXwynXdb6z0njFsu62M4WwRc+YwsiKfU4dcWBzYPK
	 MBpTsz+kycZvg==
From: Hans de Goede <hansg@kernel.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v4 03/20] platform/x86: x86-android-tablets: convert HiDeep devices to GPIO references
Date: Sat, 20 Sep 2025 22:06:56 +0200
Message-ID: <20250920200713.20193-4-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250920200713.20193-1-hansg@kernel.org>
References: <20250920200713.20193-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Now that gpiolib supports software nodes to describe GPIOs, switch the
driver away from using GPIO lookup tables for HiDeep touchscreens to using
PROPERTY_ENTRY_GPIO() to keep all touchscreen properties together.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Tested-by: Hans de Goede <hansg@kernel.org>
Reviewed-by: Hans de Goede <hansg@kernel.org>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 .../platform/x86/x86-android-tablets/lenovo.c | 26 +++----------------
 1 file changed, 3 insertions(+), 23 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index f8d261d37284..49388266201b 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -97,6 +97,7 @@ static const struct property_entry lenovo_yb1_x90_hideep_ts_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1920),
 	PROPERTY_ENTRY_U32("touchscreen-max-pressure", 16384),
 	PROPERTY_ENTRY_BOOL("hideep,force-native-protocol"),
+	PROPERTY_ENTRY_GPIO("reset-gpios", &cherryview_gpiochip_nodes[0], 7, GPIO_ACTIVE_LOW),
 	{ }
 };
 
@@ -211,19 +212,6 @@ static const struct x86_gpio_button lenovo_yb1_x90_lid __initconst = {
 	.pin = 19,
 };
 
-static struct gpiod_lookup_table lenovo_yb1_x90_hideep_gpios = {
-	.dev_id = "i2c-hideep_ts",
-	.table = {
-		GPIO_LOOKUP("INT33FF:00", 7, "reset", GPIO_ACTIVE_LOW),
-		{ }
-	},
-};
-
-static struct gpiod_lookup_table * const lenovo_yb1_x90_gpios[] = {
-	&lenovo_yb1_x90_hideep_gpios,
-	NULL
-};
-
 static int __init lenovo_yb1_x90_init(struct device *dev)
 {
 	/* Enable the regulators used by the touchscreens */
@@ -252,7 +240,6 @@ const struct x86_dev_info lenovo_yogabook_x90_info __initconst = {
 	.serdev_count = ARRAY_SIZE(lenovo_yb1_x90_serdevs),
 	.gpio_button = &lenovo_yb1_x90_lid,
 	.gpio_button_count = 1,
-	.gpiod_lookup_tables = lenovo_yb1_x90_gpios,
 	.gpiochip_type = X86_GPIOCHIP_CHERRYVIEW,
 	.init = lenovo_yb1_x90_init,
 };
@@ -819,6 +806,7 @@ static const struct property_entry lenovo_yt3_hideep_ts_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 1600),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 2560),
 	PROPERTY_ENTRY_U32("touchscreen-max-pressure", 255),
+	PROPERTY_ENTRY_GPIO("reset-gpios", &cherryview_gpiochip_nodes[0], 7, GPIO_ACTIVE_LOW),
 	{ }
 };
 
@@ -1008,14 +996,6 @@ static int __init lenovo_yt3_init(struct device *dev)
 	return 0;
 }
 
-static struct gpiod_lookup_table lenovo_yt3_hideep_gpios = {
-	.dev_id = "i2c-hideep_ts",
-	.table = {
-		GPIO_LOOKUP("INT33FF:00", 7, "reset", GPIO_ACTIVE_LOW),
-		{ }
-	},
-};
-
 static struct gpiod_lookup_table lenovo_yt3_wm5102_gpios = {
 	.dev_id = "spi1.0",
 	.table = {
@@ -1028,7 +1008,6 @@ static struct gpiod_lookup_table lenovo_yt3_wm5102_gpios = {
 };
 
 static struct gpiod_lookup_table * const lenovo_yt3_gpios[] = {
-	&lenovo_yt3_hideep_gpios,
 	&lenovo_yt3_wm5102_gpios,
 	NULL
 };
@@ -1039,5 +1018,6 @@ const struct x86_dev_info lenovo_yt3_info __initconst = {
 	.spi_dev_info = lenovo_yt3_spi_devs,
 	.spi_dev_count = ARRAY_SIZE(lenovo_yt3_spi_devs),
 	.gpiod_lookup_tables = lenovo_yt3_gpios,
+	.gpiochip_type = X86_GPIOCHIP_CHERRYVIEW,
 	.init = lenovo_yt3_init,
 };
-- 
2.51.0

