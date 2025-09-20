Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDAA26A1AB
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Sep 2025 20:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758398852; cv=none; b=Q6k5cFk4r7ROo35652q8o9BpzQ1h8Qg7JUJTQFqCF7xHIYduW55mA/4+YlKerDmkg9LBR8HDTdmYWYGQ+pAzxjPXqFdnYm62BqJdl74Sx1px/Ez3CasMdvNTzeu9oM1Ldz1XD9iEM0u1wCLJj+FHSWFhil03I8mPviNsVgTBcoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758398852; c=relaxed/simple;
	bh=+5PFru8OfdLYmptxjpJ/8AG8848g1K3/UsZEAKq521o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gpyBbPOCO2kPvuDpe4Usy9PnhAr72vvwpPw/2HGvOAF4RQ6RJ+dtdM7A4NXk/pnz6UDFZkHi944ompcjTcToDxwfhVzp0OmYvzanHymY3P6xy1KeJesFWvCnOj4JEbXJr8GryG+mSJrAORKlPJd8+yC5VCe9OS0e8igpRNiQmUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VAtku7/U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VAtku7/U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8679DC4CEEB;
	Sat, 20 Sep 2025 20:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758398852;
	bh=+5PFru8OfdLYmptxjpJ/8AG8848g1K3/UsZEAKq521o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VAtku7/UjadhBG8xt1FKLCR0k6vdUkZpWLInPe+9CqGtDvFZD81brOHn2U3104sB4
	 GanWSZp5Ji7DFlEBR6VexgAiAk2oicSVR983zyma6rWqE2x5FBL7f8ogtP9k94W9n9
	 G46IYBfQzsXR7qgyCeaBMv6RYsrTZ0YVC92bBvz9Z7Wp+Kqh09YbHUbw9/ga4psBzT
	 GUzZTnm/x/9L1m6nccSRUoU0tYDuBCs5ewxMPE5S87jJ8XEn57x12gcPR7wqWJ/LyX
	 ieG2q7A81UqKiZyozXwMtVwXCj10P5kNoHpHWhFhVephYgmOg5uAES5zMBo49j5Q+w
	 /njEO3tD4y9VA==
From: Hans de Goede <hansg@kernel.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v4 08/20] platform/x86: x86-android-tablets: convert HID-I2C devices to GPIO references
Date: Sat, 20 Sep 2025 22:07:01 +0200
Message-ID: <20250920200713.20193-9-hansg@kernel.org>
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
driver away from using GPIO lookup tables for HID-I2C touchscreens to
using PROPERTY_ENTRY_GPIO() to keep all touchscreen properties together.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Tested-by: Hans de Goede <hansg@kernel.org>
Reviewed-by: Hans de Goede <hansg@kernel.org>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 .../platform/x86/x86-android-tablets/other.c  | 32 +++----------------
 1 file changed, 4 insertions(+), 28 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/other.c b/drivers/platform/x86/x86-android-tablets/other.c
index 2f12b68080ba..5309831243b3 100644
--- a/drivers/platform/x86/x86-android-tablets/other.c
+++ b/drivers/platform/x86/x86-android-tablets/other.c
@@ -571,6 +571,7 @@ const struct x86_dev_info whitelabel_tm800a550l_info __initconst = {
 static const struct property_entry vexia_edu_atla10_5v_touchscreen_props[] = {
 	PROPERTY_ENTRY_U32("hid-descr-addr", 0x0000),
 	PROPERTY_ENTRY_U32("post-reset-deassert-delay-ms", 120),
+	PROPERTY_ENTRY_GPIO("reset-gpios", &baytrail_gpiochip_nodes[1], 26, GPIO_ACTIVE_LOW),
 	{ }
 };
 
@@ -605,23 +606,10 @@ static const struct x86_i2c_client_info vexia_edu_atla10_5v_i2c_clients[] __init
 	}
 };
 
-static struct gpiod_lookup_table vexia_edu_atla10_5v_ft5416_gpios = {
-	.dev_id = "i2c-FTSC1000",
-	.table = {
-		GPIO_LOOKUP("INT33FC:01", 26, "reset", GPIO_ACTIVE_LOW),
-		{ }
-	},
-};
-
-static struct gpiod_lookup_table * const vexia_edu_atla10_5v_gpios[] = {
-	&vexia_edu_atla10_5v_ft5416_gpios,
-	NULL
-};
-
 const struct x86_dev_info vexia_edu_atla10_5v_info __initconst = {
 	.i2c_client_info = vexia_edu_atla10_5v_i2c_clients,
 	.i2c_client_count = ARRAY_SIZE(vexia_edu_atla10_5v_i2c_clients),
-	.gpiod_lookup_tables = vexia_edu_atla10_5v_gpios,
+	.gpiochip_type = X86_GPIOCHIP_BAYTRAIL,
 };
 
 /*
@@ -657,6 +645,7 @@ static const struct software_node vexia_edu_atla10_9v_accel_node = {
 static const struct property_entry vexia_edu_atla10_9v_touchscreen_props[] = {
 	PROPERTY_ENTRY_U32("hid-descr-addr", 0x0000),
 	PROPERTY_ENTRY_U32("post-reset-deassert-delay-ms", 120),
+	PROPERTY_ENTRY_GPIO("reset-gpios", &baytrail_gpiochip_nodes[0], 60, GPIO_ACTIVE_LOW),
 	{ }
 };
 
@@ -749,19 +738,6 @@ static const struct x86_serdev_info vexia_edu_atla10_9v_serdevs[] __initconst =
 	},
 };
 
-static struct gpiod_lookup_table vexia_edu_atla10_9v_ft5416_gpios = {
-	.dev_id = "i2c-FTSC1000",
-	.table = {
-		GPIO_LOOKUP("INT33FC:00", 60, "reset", GPIO_ACTIVE_LOW),
-		{ }
-	},
-};
-
-static struct gpiod_lookup_table * const vexia_edu_atla10_9v_gpios[] = {
-	&vexia_edu_atla10_9v_ft5416_gpios,
-	NULL
-};
-
 static int __init vexia_edu_atla10_9v_init(struct device *dev)
 {
 	struct pci_dev *pdev;
@@ -791,9 +767,9 @@ const struct x86_dev_info vexia_edu_atla10_9v_info __initconst = {
 	.i2c_client_count = ARRAY_SIZE(vexia_edu_atla10_9v_i2c_clients),
 	.serdev_info = vexia_edu_atla10_9v_serdevs,
 	.serdev_count = ARRAY_SIZE(vexia_edu_atla10_9v_serdevs),
-	.gpiod_lookup_tables = vexia_edu_atla10_9v_gpios,
 	.init = vexia_edu_atla10_9v_init,
 	.use_pci = true,
+	.gpiochip_type = X86_GPIOCHIP_BAYTRAIL,
 };
 
 /*
-- 
2.51.0

