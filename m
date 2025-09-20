Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1705626B098
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Sep 2025 20:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758398873; cv=none; b=SWca6KuVWz2o93rUKGzKqFEy0k2fPEYYRjiT/+NcxtsW/oNURExdfk2T1Ip0rwy0caj7oNjuDKnHOlP4ks8KMQssCv/kkUOs9iAYw+7Ij+imCLnGhjIG1TkZMcHyxTV/q6noK3wwNtnSAYoD0S9fnd/qb+v+zMu8dyeWoi3yPcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758398873; c=relaxed/simple;
	bh=ENFQlgNt1PTCKe7Cnymy7TIFJbCWFTKkkW2xpXgGrSM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YQ/zvbxBz+Ws0QyuM9ilHRGgN8E1i8TFOeTZ+UDcInzMbhlMqtJMFkbqHgpRlehD85ral9Z8cR0Ssy+XhKcR8hzopSubngxteQ5ddjPLEGdm6RHRnajj3cOFSJBBBW7MkTSjvVQz6017GVK0rUZrabsIE2Hcc442+IC8fIJJxwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n9qEYtEo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n9qEYtEo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44DC1C4CEF9;
	Sat, 20 Sep 2025 20:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758398872;
	bh=ENFQlgNt1PTCKe7Cnymy7TIFJbCWFTKkkW2xpXgGrSM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n9qEYtEoyQGxVPDmYb1o/8Jfu7wXTyQVwOAM36HVlgPDPTxZD42mrf5S2VoFTwzk/
	 qfi210z9AwMpAAtMPL8hbKyWYCZpBAbFYW0FU5V+SB8aMQ5hTdDYlk3XNHXnBU6Nri
	 aygPodejNLgW31DrXry5nj8squ0emd3el/k7ia3dZsBRNjTb10NuxsiumWTQKrMh5D
	 XTH6lWswZebTiMHUW4DLE2biUP0P26bGVM7c/7f8iBPSi9X7wkGPQgGLeRe63r/ufr
	 v/GMyYK88jaAYwSL6u1T+fQA2iiS8yxPk/NL65uApEP0INGisIpzbd6jzL/M4BBAWg
	 4/8hucS6dcmEA==
From: Hans de Goede <hansg@kernel.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v4 19/20] platform/x86: x86-android-tablets: Fix modules lists for Lenovo devices
Date: Sat, 20 Sep 2025 22:07:12 +0200
Message-ID: <20250920200713.20193-20-hansg@kernel.org>
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

2 fixes for Lenovo tablets:

- The bq24190 charger on the Lenovo Yoga Tab2 830/1050 devices does not use
  the crystal-cove PMIC charger IRQ, so these shouldn't use bq24190_modules
  as that includes "intel_crystal_cove_charger"

- Both the Tab2 and the Tab3 devices have a SPI audio-codec which init()
  attaches properties to, resp. the whole SPI device gets instantiated by
  the x86-android-tablets code. This requires the "spi_pxa2xx_platform"
  module to be loaded before init() runs

Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 .../platform/x86/x86-android-tablets/lenovo.c | 21 ++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index 08cabaa5e0c0..e3d3a8290949 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -443,6 +443,12 @@ static const struct software_node *lenovo_yoga_tab2_830_1050_swnodes[] = {
 static int __init lenovo_yoga_tab2_830_1050_init(struct device *dev);
 static void lenovo_yoga_tab2_830_1050_exit(void);
 
+static const char * const lenovo_yoga_tab2_modules[] __initconst = {
+	"spi_pxa2xx_platform",	/* For the SPI codec device */
+	"bq24190_charger",	/* For the Vbus regulator for int3496/lc824206xa */
+	NULL
+};
+
 const struct x86_dev_info lenovo_yoga_tab2_830_1050_info __initconst = {
 	.i2c_client_info = lenovo_yoga_tab2_830_1050_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(lenovo_yoga_tab2_830_1050_i2c_clients),
@@ -450,7 +456,7 @@ const struct x86_dev_info lenovo_yoga_tab2_830_1050_info __initconst = {
 	.pdev_count = ARRAY_SIZE(lenovo_yoga_tab2_830_1050_pdevs),
 	.gpio_button_swnodes = lenovo_yoga_tab2_830_1050_lid_swnodes,
 	.swnode_group = lenovo_yoga_tab2_830_1050_swnodes,
-	.modules = bq24190_modules,
+	.modules = lenovo_yoga_tab2_modules,
 	.gpiochip_type = X86_GPIOCHIP_BAYTRAIL,
 	.init = lenovo_yoga_tab2_830_1050_init,
 	.exit = lenovo_yoga_tab2_830_1050_exit,
@@ -767,11 +773,6 @@ static const struct platform_device_info lenovo_yoga_tab2_1380_pdevs[] __initcon
 	},
 };
 
-static const char * const lenovo_yoga_tab2_1380_modules[] __initconst = {
-	"bq24190_charger",            /* For the Vbus regulator for lc824206xa */
-	NULL
-};
-
 static int __init lenovo_yoga_tab2_1380_init(struct device *dev)
 {
 	int ret;
@@ -800,7 +801,7 @@ const struct x86_dev_info lenovo_yoga_tab2_1380_info __initconst = {
 	.pdev_count = ARRAY_SIZE(lenovo_yoga_tab2_1380_pdevs),
 	.gpio_button_swnodes = lenovo_yoga_tab2_830_1050_lid_swnodes,
 	.swnode_group = lenovo_yoga_tab2_830_1050_swnodes,
-	.modules = lenovo_yoga_tab2_1380_modules,
+	.modules = lenovo_yoga_tab2_modules,
 	.gpiochip_type = X86_GPIOCHIP_BAYTRAIL,
 	.init = lenovo_yoga_tab2_1380_init,
 	.exit = lenovo_yoga_tab2_830_1050_exit,
@@ -1061,12 +1062,18 @@ static int __init lenovo_yt3_init(struct device *dev)
 	return 0;
 }
 
+static const char * const lenovo_yt3_modules[] __initconst = {
+	"spi_pxa2xx_platform",	/* For the SPI codec device */
+	NULL
+};
+
 const struct x86_dev_info lenovo_yt3_info __initconst = {
 	.i2c_client_info = lenovo_yt3_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(lenovo_yt3_i2c_clients),
 	.spi_dev_info = lenovo_yt3_spi_devs,
 	.spi_dev_count = ARRAY_SIZE(lenovo_yt3_spi_devs),
 	.swnode_group = lenovo_yt3_swnodes,
+	.modules = lenovo_yt3_modules,
 	.gpiochip_type = X86_GPIOCHIP_CHERRYVIEW,
 	.init = lenovo_yt3_init,
 };
-- 
2.51.0

