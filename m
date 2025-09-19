Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D911FB3
	for <platform-driver-x86@vger.kernel.org>; Fri, 19 Sep 2025 20:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758314873; cv=none; b=XRECpFTWkOi6PH9eFvRWEitHj1FWj3E4OrihtvEENjFu76uPwUFDzY8sFEH3Kzkv6pUv9IAvIc5CAuNHSuMpHVRIVBfWId8EXQhmlKxJaANU3oCrMg5s+a/JUaUe6L51SZ7u3bBcGZMACiBICtvw9ce49LtwZVYmK8dOK0A4AOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758314873; c=relaxed/simple;
	bh=5icwLFiHW+yN7XpqOXvJS9dHLJbxET/jUm+6syudY3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N89hS0ZzYFj9WaoPlStiaANp3r+Bz7YF4b9vp9tM1r+UpgEKLkwEK8sA7d2g7Li9LhNzQ7mjfrzroMfKcKNrZ9d8WCcMJQS/cEcVMVigoJGEvMtVC2bchXL23JgMLgGgZnvawcOoUEZ74oDkpVu5UXtnTGWa5aIRH9ute/XeGI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aLdYPFmq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aLdYPFmq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FDADC4CEF0;
	Fri, 19 Sep 2025 20:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758314872;
	bh=5icwLFiHW+yN7XpqOXvJS9dHLJbxET/jUm+6syudY3Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aLdYPFmqFfIBAw2dRrn5K9+4EI/V7GTTBXNYdsGkbhQZytpMzT6pT68NTFx1zEi2l
	 teil6YHSwpMoKJfiG402sBSjClEpHB1pqZwKiLq+9t5y90Tfr3zrp0HRQO9njhlzLd
	 pQ2ovr2vW+JfQZBw7FLj7mgn8CiDxcTNb5cuQQ8Kj7tPXEcxukOv4vrF+RyZxwkAf7
	 FMrFJrIBfkAfiZsNehkX3LjArldKjeJveLBw2/K1iDUVpqEixLAGlLKJHeI0ZZSLck
	 fg71AXhEbaD/4vdgyzlswZaM+QPtedys0k0tiFn3Luhwcv2Bs9cycPbgeLgXQD+M73
	 y7OznQLsIEXDA==
From: Hans de Goede <hansg@kernel.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 04/19] platform/x86: x86-android-tablets: convert Novatek devices to GPIO references
Date: Fri, 19 Sep 2025 22:47:27 +0200
Message-ID: <20250919204742.25581-5-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250919204742.25581-1-hansg@kernel.org>
References: <20250919204742.25581-1-hansg@kernel.org>
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

