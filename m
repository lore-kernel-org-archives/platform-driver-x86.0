Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B6023F26A
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Sep 2025 20:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758398844; cv=none; b=LpSvMBbTPyUJxyZSd3BQWXcDCOIUiziYz/pT8uBY7siToWDsO01YicGVGkgZhv3zSrV9N9En8NzL5RYultwxCAw66QZkWMk5KWhFaeslRcOhs1ICoR3CxSp4sFp1e/0mewzZVW595xT/aAtwmVOtHs5XxLOTQrnvcYD04pAUpm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758398844; c=relaxed/simple;
	bh=5Wl0JC272z/y2NbiOTvrtROwx8yNkHi7YUHL4jypinI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hx7l8EeUpJDMxL+SIPDYv5z+JcPeTmM0WWKXywKMaPRdUXkCS0nuT8ZANJU8+WU3PWNunKwb4l1OpNp/TykHIBg4Q4QGjyczAprVmEiWVkZM3U3utHjz9IKhO3GVxIjpilrC5FyulJGo7wXPDNqrco7kWuYNd87tiUvcLdQsrA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vR8Ru3Vb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vR8Ru3Vb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BAABC4CEF9;
	Sat, 20 Sep 2025 20:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758398844;
	bh=5Wl0JC272z/y2NbiOTvrtROwx8yNkHi7YUHL4jypinI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vR8Ru3VbZbgmbB0ai6dOfpxxPmV9IT6wrIqTvE7rvUdkSwEGMzjqVzUkM/yrmc5d6
	 CmUWK789BxNNwPCHGjjZC/+p4f+UlKeC+V1dfSE1w5yYRjesWqquqPSX8lXZXZd2is
	 FvysXoHX8fNpEIZNxzS8QLioS+8iKAYcRq5Ayt5fNpFf9sJ0qpJS/umeljAnllL6RI
	 ioNhLKavLzJTjxcO/yHLdJeCIQDz4PaNH5k5pz4IgksBV7gAlpaEJKc7SblMNb/Vhu
	 FLtxPP4ACfws/JYZH/3p2SUKYde6La9Lv0OHGxrTbt722C8V2jfnD1kcZADEdeWuGl
	 pPq7iG4gDU9RA==
From: Hans de Goede <hansg@kernel.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v4 04/20] platform/x86: x86-android-tablets: convert Novatek devices to GPIO references
Date: Sat, 20 Sep 2025 22:06:57 +0200
Message-ID: <20250920200713.20193-5-hansg@kernel.org>
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
driver away from using GPIO lookup tables for Novatek touchscreens to
using PROPERTY_ENTRY_GPIO() to keep all touchscreen properties together.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Tested-by: Hans de Goede <hansg@kernel.org>
Reviewed-by: Hans de Goede <hansg@kernel.org>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 .../platform/x86/x86-android-tablets/other.c  | 20 ++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/other.c b/drivers/platform/x86/x86-android-tablets/other.c
index e3907812c8bc..95c5001004a1 100644
--- a/drivers/platform/x86/x86-android-tablets/other.c
+++ b/drivers/platform/x86/x86-android-tablets/other.c
@@ -38,6 +38,15 @@ static const struct software_node acer_b1_750_bma250e_node = {
 	.properties = acer_b1_750_bma250e_props,
 };
 
+static const struct property_entry acer_b1_750_novatek_props[] = {
+	PROPERTY_ENTRY_GPIO("reset-gpios", &baytrail_gpiochip_nodes[1], 26, GPIO_ACTIVE_LOW),
+	{ }
+};
+
+static const struct software_node acer_b1_750_novatek_node = {
+	.properties = acer_b1_750_novatek_props,
+};
+
 static const struct x86_i2c_client_info acer_b1_750_i2c_clients[] __initconst = {
 	{
 		/* Novatek NVT-ts touchscreen */
@@ -45,6 +54,7 @@ static const struct x86_i2c_client_info acer_b1_750_i2c_clients[] __initconst =
 			.type = "nt11205-ts",
 			.addr = 0x34,
 			.dev_name = "NVT-ts",
+			.swnode = &acer_b1_750_novatek_node,
 		},
 		.adapter_path = "\\_SB_.I2C4",
 		.irq_data = {
@@ -74,16 +84,7 @@ static const struct x86_i2c_client_info acer_b1_750_i2c_clients[] __initconst =
 	},
 };
 
-static struct gpiod_lookup_table acer_b1_750_nvt_ts_gpios = {
-	.dev_id = "i2c-NVT-ts",
-	.table = {
-		GPIO_LOOKUP("INT33FC:01", 26, "reset", GPIO_ACTIVE_LOW),
-		{ }
-	},
-};
-
 static struct gpiod_lookup_table * const acer_b1_750_gpios[] = {
-	&acer_b1_750_nvt_ts_gpios,
 	&int3496_reference_gpios,
 	NULL
 };
@@ -94,6 +95,7 @@ const struct x86_dev_info acer_b1_750_info __initconst = {
 	.pdev_info = int3496_pdevs,
 	.pdev_count = 1,
 	.gpiod_lookup_tables = acer_b1_750_gpios,
+	.gpiochip_type = X86_GPIOCHIP_BAYTRAIL,
 };
 
 /*
-- 
2.51.0

