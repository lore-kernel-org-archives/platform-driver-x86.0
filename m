From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH 1/2] platform: chrome: add ChromeOS specific platform functions
Date: Mon, 31 Jul 2017 15:03:17 +0200
Message-ID: <20170731130318.22976-2-enric.balletbo@collabora.com>
References: <20170731130318.22976-1-enric.balletbo@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170731130318.22976-1-enric.balletbo@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Benson Leung <bleung@chromium.org>, Olof Johansson <olof@lixom.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Olof Johansson <olofj@chromium.org>
List-Id: platform-driver-x86.vger.kernel.org

From: Olof Johansson <olofj@chromium.org>

This driver provides abstracted interfaces to the firmware features
provided on ChromeOS devices. It depends on a lowlevel driver to
implement the firmware interface on the platform.

Signed-off-by: Olof Johansson <olofj@chromium.org>
Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
 drivers/platform/chrome/Kconfig    |  8 +++++++
 drivers/platform/chrome/Makefile   |  2 +-
 drivers/platform/chrome/chromeos.c | 28 ++++++++++++++++++++++
 drivers/platform/chrome/chromeos.h | 49 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 86 insertions(+), 1 deletion(-)
 create mode 100644 drivers/platform/chrome/chromeos.c
 create mode 100644 drivers/platform/chrome/chromeos.h

diff --git a/drivers/platform/chrome/Kconfig b/drivers/platform/chrome/Kconfig
index 0ad6e29..ba03e0a 100644
--- a/drivers/platform/chrome/Kconfig
+++ b/drivers/platform/chrome/Kconfig
@@ -14,6 +14,14 @@ menuconfig CHROME_PLATFORMS
 
 if CHROME_PLATFORMS
 
+config CHROMEOS
+	bool
+	depends on NVRAM && ACPI_CHROMEOS
+	---help---
+	  Provides abstracted interfaces to the firmware features provided on
+	  ChromeOS devices. It depends on a lowlevel driver to implement the
+	  firmware interface on the platform.
+
 config CHROMEOS_LAPTOP
 	tristate "Chrome OS Laptop"
 	depends on I2C && DMI && X86
diff --git a/drivers/platform/chrome/Makefile b/drivers/platform/chrome/Makefile
index 66c345c..d423bea 100644
--- a/drivers/platform/chrome/Makefile
+++ b/drivers/platform/chrome/Makefile
@@ -1,4 +1,4 @@
-
+obj-$(CONFIG_CHROMEOS)			+= chromeos.o
 obj-$(CONFIG_CHROMEOS_LAPTOP)		+= chromeos_laptop.o
 obj-$(CONFIG_CHROMEOS_PSTORE)		+= chromeos_pstore.o
 cros_ec_devs-objs			:= cros_ec_dev.o cros_ec_sysfs.o \
diff --git a/drivers/platform/chrome/chromeos.c b/drivers/platform/chrome/chromeos.c
new file mode 100644
index 0000000..e2a0dfd
--- /dev/null
+++ b/drivers/platform/chrome/chromeos.c
@@ -0,0 +1,28 @@
+/*
+ *  ChromeOS platform support code. Glue layer between higher level functions
+ *  and per-platform firmware interfaces.
+ *
+ *  Copyright (C) 2017 The Chromium OS Authors
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ */
+
+#include <linux/types.h>
+#include <linux/module.h>
+#include "chromeos.h"
+
+static struct chromeos_vbc *chromeos_vbc_ptr;
+
+int chromeos_vbc_register(struct chromeos_vbc *chromeos_vbc)
+{
+	chromeos_vbc_ptr = chromeos_vbc;
+	return 0;
+}
diff --git a/drivers/platform/chrome/chromeos.h b/drivers/platform/chrome/chromeos.h
new file mode 100644
index 0000000..ec349e4
--- /dev/null
+++ b/drivers/platform/chrome/chromeos.h
@@ -0,0 +1,49 @@
+/*
+ *  Copyright (C) 2017 The Chromium OS Authors
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ */
+#ifndef _DRIVERS_PLATFORM_CHROMEOS_H
+#define _DRIVERS_PLATFORM_CHROMEOS_H
+
+struct chromeos_vbc {
+	/**
+	 * Read vboot context to buffer
+	 *
+	 * @param buf		Pointer to buffer for storing vboot context
+	 * @param count		Size of buffer
+	 * @return	on success, the number of bytes read is returned and
+	 *		on error, -err is returned.
+	 */
+	ssize_t (*read)(void *buf, size_t count);
+
+	/**
+	 * Write vboot context from buffer
+	 *
+	 * @param buf		Pointer to buffer of new vboot context content
+	 * @param count		Size of buffer
+	 * @return	on success, the number of bytes written is returned and
+	 *		on error, -err is returned.
+	 */
+	ssize_t (*write)(const void *buf, size_t count);
+
+	const char *name;
+};
+
+/**
+ * Register chromeos_vbc callbacks.
+ *
+ * @param chromeos_vbc	Pointer to struct holding callbacks
+ * @return	on success, return 0, on error, -err is returned.
+ */
+int chromeos_vbc_register(struct chromeos_vbc *chromeos_vbc);
+
+#endif /* _DRIVERS_PLATFORM_CHROMEOS_H */
-- 
2.9.3
