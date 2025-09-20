Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B97926B762
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Sep 2025 20:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758398867; cv=none; b=JKYlAO2n5qizzHQVvRh9idUYUjWKzG8mLtZj1pymu3SsPPnReWzTWJLhE7bbdChXpg6OZ0s9Rn4b4F8qXL9J4CkmNNCoehCXzsMc5kkONktTbGzpVRYYD7lavNhxMPBa2om0NnJw0Xmbj0ShDE06wDIPvyjbHz7+DyLp5UWRzio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758398867; c=relaxed/simple;
	bh=CVNvAwwvj9zZScb4XZTA3bsF5y6yuWOAu3cpOOvqySs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vc0Cezh5XK90ed5Q45/CyFNZEPrmnEdyXNWbdIE8jA9x9G6Q92RF9nK6cAChbmWcQvq1whRis0/mjx0n6/JHKIkUSEf+2CRiJR9ax2EkLPUQV5kiCgZHh7Qx9zEzmu4wYibf8crsFF8NJcaxXs4aU5eI3LkJ+Eap0eJ6MKvUs7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hlXQigG1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hlXQigG1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99955C4CEEB;
	Sat, 20 Sep 2025 20:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758398867;
	bh=CVNvAwwvj9zZScb4XZTA3bsF5y6yuWOAu3cpOOvqySs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hlXQigG1yXeoAP/v/RncSwImGofr8tx2c6XJ2w9rzhcKt47sJA/SQvxPGGPLoWKN2
	 TZr4V0x3ncGZzUQ3DM7qEuTquWRVlmgDn6CvNZAJjgCqHbHsPbD/aBBe+d2BZRWgN4
	 0uVgjx2SdiSDFQQ3sVmQIp8RF4+W4eCpuqhFLIefQrwewHW3mEeMaYThRiraQ8R76B
	 HVqDCCp9oET9mOOxQX1LpQrmDxQWm5ejHRqGoj9aA7xGUGflV2NbB3v26Qiwu7Nqvd
	 PIcelVNe6yqWtsGfRuLz9XK91tE3kmocISKfy+ZhFNXke6jPIdlj2lff7lOm96RD94
	 5/GgUw7RrzM3g==
From: Hans de Goede <hansg@kernel.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v4 16/20] platform/x86: x86-android-tablets: Move Acer info to its own file
Date: Sat, 20 Sep 2025 22:07:09 +0200
Message-ID: <20250920200713.20193-17-hansg@kernel.org>
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

Acer has several x86 based Android tablets which need x86-android-tablets
support to work around their broken ACPI tables.

At the moment x86-android-tablets only support one model, move this to
its own file before adding support for more models to avoid needing to
move more code around later.

Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
Changes in v3:
- Rebase on top of Dmitry's GPIO software node reference series and
  include it as part of this series
---
 .../platform/x86/x86-android-tablets/Makefile |  2 +-
 .../platform/x86/x86-android-tablets/acer.c   | 87 +++++++++++++++++++
 .../platform/x86/x86-android-tablets/other.c  | 70 ---------------
 3 files changed, 88 insertions(+), 71 deletions(-)
 create mode 100644 drivers/platform/x86/x86-android-tablets/acer.c

diff --git a/drivers/platform/x86/x86-android-tablets/Makefile b/drivers/platform/x86/x86-android-tablets/Makefile
index 313be30548bc..a2cf8cbdb351 100644
--- a/drivers/platform/x86/x86-android-tablets/Makefile
+++ b/drivers/platform/x86/x86-android-tablets/Makefile
@@ -6,4 +6,4 @@
 obj-$(CONFIG_X86_ANDROID_TABLETS) += vexia_atla10_ec.o
 obj-$(CONFIG_X86_ANDROID_TABLETS) += x86-android-tablets.o
 x86-android-tablets-y := core.o dmi.o shared-psy-info.o \
-			 asus.o lenovo.o other.o
+			 acer.o asus.o lenovo.o other.o
diff --git a/drivers/platform/x86/x86-android-tablets/acer.c b/drivers/platform/x86/x86-android-tablets/acer.c
new file mode 100644
index 000000000000..e5850da8037a
--- /dev/null
+++ b/drivers/platform/x86/x86-android-tablets/acer.c
@@ -0,0 +1,87 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Board info for Acer X86 tablets which ship with Android as the factory image
+ * and which have broken DSDT tables. The factory kernels shipped on these
+ * devices typically have a bunch of things hardcoded, rather than specified
+ * in their DSDT.
+ *
+ * Copyright (C) 2021-2025 Hans de Goede <hansg@kernel.org>
+ */
+
+#include <linux/gpio/machine.h>
+#include <linux/gpio/property.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+
+#include "shared-psy-info.h"
+#include "x86-android-tablets.h"
+
+/* Acer Iconia One 7 B1-750 has an Android factory image with everything hardcoded */
+static const char * const acer_b1_750_mount_matrix[] = {
+	"-1", "0", "0",
+	"0", "1", "0",
+	"0", "0", "1"
+};
+
+static const struct property_entry acer_b1_750_bma250e_props[] = {
+	PROPERTY_ENTRY_STRING_ARRAY("mount-matrix", acer_b1_750_mount_matrix),
+	{ }
+};
+
+static const struct software_node acer_b1_750_bma250e_node = {
+	.properties = acer_b1_750_bma250e_props,
+};
+
+static const struct property_entry acer_b1_750_novatek_props[] = {
+	PROPERTY_ENTRY_GPIO("reset-gpios", &baytrail_gpiochip_nodes[1], 26, GPIO_ACTIVE_LOW),
+	{ }
+};
+
+static const struct software_node acer_b1_750_novatek_node = {
+	.properties = acer_b1_750_novatek_props,
+};
+
+static const struct x86_i2c_client_info acer_b1_750_i2c_clients[] __initconst = {
+	{
+		/* Novatek NVT-ts touchscreen */
+		.board_info = {
+			.type = "nt11205-ts",
+			.addr = 0x34,
+			.dev_name = "NVT-ts",
+			.swnode = &acer_b1_750_novatek_node,
+		},
+		.adapter_path = "\\_SB_.I2C4",
+		.irq_data = {
+			.type = X86_ACPI_IRQ_TYPE_GPIOINT,
+			.chip = "INT33FC:02",
+			.index = 3,
+			.trigger = ACPI_EDGE_SENSITIVE,
+			.polarity = ACPI_ACTIVE_LOW,
+			.con_id = "NVT-ts_irq",
+		},
+	}, {
+		/* BMA250E accelerometer */
+		.board_info = {
+			.type = "bma250e",
+			.addr = 0x18,
+			.swnode = &acer_b1_750_bma250e_node,
+		},
+		.adapter_path = "\\_SB_.I2C3",
+		.irq_data = {
+			.type = X86_ACPI_IRQ_TYPE_GPIOINT,
+			.chip = "INT33FC:02",
+			.index = 25,
+			.trigger = ACPI_LEVEL_SENSITIVE,
+			.polarity = ACPI_ACTIVE_HIGH,
+			.con_id = "bma250e_irq",
+		},
+	},
+};
+
+const struct x86_dev_info acer_b1_750_info __initconst = {
+	.i2c_client_info = acer_b1_750_i2c_clients,
+	.i2c_client_count = ARRAY_SIZE(acer_b1_750_i2c_clients),
+	.pdev_info = int3496_pdevs,
+	.pdev_count = 1,
+	.gpiochip_type = X86_GPIOCHIP_BAYTRAIL,
+};
diff --git a/drivers/platform/x86/x86-android-tablets/other.c b/drivers/platform/x86/x86-android-tablets/other.c
index bc473979e4f6..ea7a01d7ccb4 100644
--- a/drivers/platform/x86/x86-android-tablets/other.c
+++ b/drivers/platform/x86/x86-android-tablets/other.c
@@ -22,76 +22,6 @@
 #include "shared-psy-info.h"
 #include "x86-android-tablets.h"
 
-/* Acer Iconia One 7 B1-750 has an Android factory image with everything hardcoded */
-static const char * const acer_b1_750_mount_matrix[] = {
-	"-1", "0", "0",
-	"0", "1", "0",
-	"0", "0", "1"
-};
-
-static const struct property_entry acer_b1_750_bma250e_props[] = {
-	PROPERTY_ENTRY_STRING_ARRAY("mount-matrix", acer_b1_750_mount_matrix),
-	{ }
-};
-
-static const struct software_node acer_b1_750_bma250e_node = {
-	.properties = acer_b1_750_bma250e_props,
-};
-
-static const struct property_entry acer_b1_750_novatek_props[] = {
-	PROPERTY_ENTRY_GPIO("reset-gpios", &baytrail_gpiochip_nodes[1], 26, GPIO_ACTIVE_LOW),
-	{ }
-};
-
-static const struct software_node acer_b1_750_novatek_node = {
-	.properties = acer_b1_750_novatek_props,
-};
-
-static const struct x86_i2c_client_info acer_b1_750_i2c_clients[] __initconst = {
-	{
-		/* Novatek NVT-ts touchscreen */
-		.board_info = {
-			.type = "nt11205-ts",
-			.addr = 0x34,
-			.dev_name = "NVT-ts",
-			.swnode = &acer_b1_750_novatek_node,
-		},
-		.adapter_path = "\\_SB_.I2C4",
-		.irq_data = {
-			.type = X86_ACPI_IRQ_TYPE_GPIOINT,
-			.chip = "INT33FC:02",
-			.index = 3,
-			.trigger = ACPI_EDGE_SENSITIVE,
-			.polarity = ACPI_ACTIVE_LOW,
-			.con_id = "NVT-ts_irq",
-		},
-	}, {
-		/* BMA250E accelerometer */
-		.board_info = {
-			.type = "bma250e",
-			.addr = 0x18,
-			.swnode = &acer_b1_750_bma250e_node,
-		},
-		.adapter_path = "\\_SB_.I2C3",
-		.irq_data = {
-			.type = X86_ACPI_IRQ_TYPE_GPIOINT,
-			.chip = "INT33FC:02",
-			.index = 25,
-			.trigger = ACPI_LEVEL_SENSITIVE,
-			.polarity = ACPI_ACTIVE_HIGH,
-			.con_id = "bma250e_irq",
-		},
-	},
-};
-
-const struct x86_dev_info acer_b1_750_info __initconst = {
-	.i2c_client_info = acer_b1_750_i2c_clients,
-	.i2c_client_count = ARRAY_SIZE(acer_b1_750_i2c_clients),
-	.pdev_info = int3496_pdevs,
-	.pdev_count = 1,
-	.gpiochip_type = X86_GPIOCHIP_BAYTRAIL,
-};
-
 /*
  * Advantech MICA-071
  * This is a standard Windows tablet, but it has an extra "quick launch" button
-- 
2.51.0

