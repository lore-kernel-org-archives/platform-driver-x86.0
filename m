Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE67F23F26A
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Sep 2025 20:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758398846; cv=none; b=RyaYox8ra9COE5nkV0FROzDAfC4yUnS3Fvnk9olp4alJ/xIFQJYyJlbpiYbnPOqx4yus5vxN3tvIo8+JXxbOIisQFuTbYU/3A4q1ok1i+w8oJQc/TJB6LV9+a+Kv9gPOdSGjiKTStUka0DV5BfwJP2XrpUz/KOrXfejVZsOvXa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758398846; c=relaxed/simple;
	bh=8/r/2fmcRhGrRPZB1kI4qzbOHtQA4rZu3kl69OE4IZk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dn+9lSjQEx4lwh5L56kyq+y6UyxIv4f+t02pFlwY0KmojiGBirfIn1bUzPp22AuzPFLu2Tt0nOZrWM0Tyur1wUw9st3IyimW9XT4+rMuVysJolRYSugCWRh60ruma9Gav5aDP2OqWNZKdiC4uJPhQ9AfkzwuDim44wL0/vrNcoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=guQrPWf9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="guQrPWf9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2C5BC4CEF0;
	Sat, 20 Sep 2025 20:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758398846;
	bh=8/r/2fmcRhGrRPZB1kI4qzbOHtQA4rZu3kl69OE4IZk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=guQrPWf9Aj9OReR7ZEQa7lINZyHe70XKrIa+7NeK5vbFuUxlPK2LctjQ8qEF8je6X
	 v42GOPRt1TkNPtQihbrx4dBTCEOVWe6R/ArE21s77xrmTSbHncTyH8tNOyvSznmJP5
	 pQdQZ+INlJt590QVUZifwMB2XFB3BCVQ05ENNhd6L3QK8EDCjr4wKTiGIgHeojLTCj
	 sgOpdHGohj3Nr91I+UZrxmR4IYBMhlCQiPMzorSDGBWNnt3rVaJNiQVfrZTBigeXzV
	 sG4KRd/9e6xybdfQnAMu1U2xVTSLkKQG6D7JDcqXmqSjaIXBVbgWpJES7pVinGwV9P
	 c3e5II5ORl9Yg==
From: Hans de Goede <hansg@kernel.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v4 05/20] platform/x86: x86-android-tablets: convert EDT devices to GPIO references
Date: Sat, 20 Sep 2025 22:06:58 +0200
Message-ID: <20250920200713.20193-6-hansg@kernel.org>
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
driver away from using GPIO lookup tables for EDT touchscreens to using
PROPERTY_ENTRY_GPIO() to keep all touchscreen properties together.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Tested-by: Hans de Goede <hansg@kernel.org>
Reviewed-by: Hans de Goede <hansg@kernel.org>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 .../platform/x86/x86-android-tablets/other.c  | 28 +++++++++----------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/other.c b/drivers/platform/x86/x86-android-tablets/other.c
index 95c5001004a1..0f3cc0ea877e 100644
--- a/drivers/platform/x86/x86-android-tablets/other.c
+++ b/drivers/platform/x86/x86-android-tablets/other.c
@@ -436,6 +436,17 @@ static const struct software_node nextbook_ares8a_accel_node = {
 	.properties = nextbook_ares8a_accel_props,
 };
 
+static const struct property_entry nextbook_ares8a_ft5416_props[] = {
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 800),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 1280),
+	PROPERTY_ENTRY_GPIO("reset-gpios", &cherryview_gpiochip_nodes[1], 25, GPIO_ACTIVE_LOW),
+	{ }
+};
+
+static const struct software_node nextbook_ares8a_ft5416_node = {
+	.properties = nextbook_ares8a_ft5416_props,
+};
+
 static const struct x86_i2c_client_info nextbook_ares8a_i2c_clients[] __initconst = {
 	{
 		/* Freescale MMA8653FC accelerometer */
@@ -452,7 +463,7 @@ static const struct x86_i2c_client_info nextbook_ares8a_i2c_clients[] __initcons
 			.type = "edt-ft5x06",
 			.addr = 0x38,
 			.dev_name = "ft5416",
-			.swnode = &nextbook_ares8_touchscreen_node,
+			.swnode = &nextbook_ares8a_ft5416_node,
 		},
 		.adapter_path = "\\_SB_.PCI0.I2C6",
 		.irq_data = {
@@ -466,23 +477,10 @@ static const struct x86_i2c_client_info nextbook_ares8a_i2c_clients[] __initcons
 	},
 };
 
-static struct gpiod_lookup_table nextbook_ares8a_ft5416_gpios = {
-	.dev_id = "i2c-ft5416",
-	.table = {
-		GPIO_LOOKUP("INT33FF:01", 25, "reset", GPIO_ACTIVE_LOW),
-		{ }
-	},
-};
-
-static struct gpiod_lookup_table * const nextbook_ares8a_gpios[] = {
-	&nextbook_ares8a_ft5416_gpios,
-	NULL
-};
-
 const struct x86_dev_info nextbook_ares8a_info __initconst = {
 	.i2c_client_info = nextbook_ares8a_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(nextbook_ares8a_i2c_clients),
-	.gpiod_lookup_tables = nextbook_ares8a_gpios,
+	.gpiochip_type = X86_GPIOCHIP_CHERRYVIEW,
 };
 
 /*
-- 
2.51.0

