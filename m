Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D39190685
	for <platform-driver-x86@vger.kernel.org>; Sun, 31 Aug 2025 10:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756637599; cv=none; b=QFLXf0EUOV3Hscu1JSakWU3IzkrjciVtuxMAId/XNBd3swwvJO4pE6+aM3JXVhIluXnGYqP00pn/fuWHArw5dX+atwWJ5BzxxVxSFsbFB76PIDa9gFKBsHyzn86hX9Eey3PpIM8ySkdyvl9Gg1FHw/VnwWmcW+bsQMyQfd7sy1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756637599; c=relaxed/simple;
	bh=3G76/8aqYprDe9JlSnaRAkPALKCcdFLzOVOclztnER0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=et337+hrT9wtzs7FA1UBeNxCB0DnbkmnU38z31OzCMb5S57bq8L4ThJZ9WbmO4KYtlmqpsA/8W38sze9GZlQnU5ML7O9pKJTIBx+DNkqKZnSAzcHeEmp4Zrj2/if8SU5vBeJWeexIsT/7km2STWeGoNEzNVuYPlfNpmphP2J1YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mAhdEoFf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mAhdEoFf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEDE5C4CEF5;
	Sun, 31 Aug 2025 10:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756637599;
	bh=3G76/8aqYprDe9JlSnaRAkPALKCcdFLzOVOclztnER0=;
	h=From:To:Cc:Subject:Date:From;
	b=mAhdEoFfmUgMUfFfFMfpJrOAfANBNB4BJfLEa9RuJlLTzbiUYX7FqA00rYcOW63f/
	 n4Y/1t6xrrGLq/jgQVuy6joPzDv7nWlTPllw9jifTGDaKHpWeMsr1LuO9sSbabFqP0
	 hMqy6iXwslzhR8Sn+v2EFia+HhvmXDTGcaPrV6y61L1MO594uVjaqayB70IMrN8wO9
	 tXI90yXiYVZPHEeL/d21gOisE3DWYzBjvWg3+jkkIHLqId/8yu4uf6NdjuppMI8Fl8
	 WwgQsDTEwuDAY2oIihG5orx8/xQTiUkEE61U5rWHSwfuojnxKBbOSEXP56qqTvEYad
	 l/EAvadKnHjTA==
From: Hans de Goede <hansg@kernel.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 1/2] platform/x86: x86-android-tablets: Move Acer info to its own file
Date: Sun, 31 Aug 2025 12:53:14 +0200
Message-ID: <20250831105315.15349-1-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hans de Goede <hdegoede@redhat.com>

Acer has several x86 based Android tablets which need x86-android-tablets
support to work around their broken ACPI tables.

At the moment x86-android-tablets only support one model, move this to
its own file before adding support for more models to avoid needing to
move more code around later.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../platform/x86/x86-android-tablets/Makefile |  2 +-
 .../platform/x86/x86-android-tablets/acer.c   | 90 +++++++++++++++++++
 .../platform/x86/x86-android-tablets/other.c  | 74 ---------------
 3 files changed, 91 insertions(+), 75 deletions(-)
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
index 000000000000..e3ed19bdce66
--- /dev/null
+++ b/drivers/platform/x86/x86-android-tablets/acer.c
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Board info for Acer X86 tablets which ship with Android as the factory image
+ * and which have broken DSDT tables. The factory kernels shipped on these
+ * devices typically have a bunch of things hardcoded, rather than specified
+ * in their DSDT.
+ *
+ * Copyright (C) 2021-2024 Hans de Goede <hansg@kernel.org>
+ */
+
+#include <linux/gpio/machine.h>
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
+static const struct x86_i2c_client_info acer_b1_750_i2c_clients[] __initconst = {
+	{
+		/* Novatek NVT-ts touchscreen */
+		.board_info = {
+			.type = "nt11205-ts",
+			.addr = 0x34,
+			.dev_name = "NVT-ts",
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
+static struct gpiod_lookup_table acer_b1_750_nvt_ts_gpios = {
+	.dev_id = "i2c-NVT-ts",
+	.table = {
+		GPIO_LOOKUP("INT33FC:01", 26, "reset", GPIO_ACTIVE_LOW),
+		{ }
+	},
+};
+
+static struct gpiod_lookup_table * const acer_b1_750_gpios[] = {
+	&acer_b1_750_nvt_ts_gpios,
+	&int3496_reference_gpios,
+	NULL
+};
+
+const struct x86_dev_info acer_b1_750_info __initconst = {
+	.i2c_client_info = acer_b1_750_i2c_clients,
+	.i2c_client_count = ARRAY_SIZE(acer_b1_750_i2c_clients),
+	.pdev_info = int3496_pdevs,
+	.pdev_count = 1,
+	.gpiod_lookup_tables = acer_b1_750_gpios,
+};
diff --git a/drivers/platform/x86/x86-android-tablets/other.c b/drivers/platform/x86/x86-android-tablets/other.c
index f7bd9f863c85..77df2f33e242 100644
--- a/drivers/platform/x86/x86-android-tablets/other.c
+++ b/drivers/platform/x86/x86-android-tablets/other.c
@@ -21,80 +21,6 @@
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
-static const struct x86_i2c_client_info acer_b1_750_i2c_clients[] __initconst = {
-	{
-		/* Novatek NVT-ts touchscreen */
-		.board_info = {
-			.type = "nt11205-ts",
-			.addr = 0x34,
-			.dev_name = "NVT-ts",
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
-static struct gpiod_lookup_table acer_b1_750_nvt_ts_gpios = {
-	.dev_id = "i2c-NVT-ts",
-	.table = {
-		GPIO_LOOKUP("INT33FC:01", 26, "reset", GPIO_ACTIVE_LOW),
-		{ }
-	},
-};
-
-static struct gpiod_lookup_table * const acer_b1_750_gpios[] = {
-	&acer_b1_750_nvt_ts_gpios,
-	&int3496_reference_gpios,
-	NULL
-};
-
-const struct x86_dev_info acer_b1_750_info __initconst = {
-	.i2c_client_info = acer_b1_750_i2c_clients,
-	.i2c_client_count = ARRAY_SIZE(acer_b1_750_i2c_clients),
-	.pdev_info = int3496_pdevs,
-	.pdev_count = 1,
-	.gpiod_lookup_tables = acer_b1_750_gpios,
-};
-
 /*
  * Advantech MICA-071
  * This is a standard Windows tablet, but it has an extra "quick launch" button
-- 
2.51.0

