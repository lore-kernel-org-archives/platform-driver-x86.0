Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD9F17984
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 Mar 2024 21:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711576408; cv=none; b=nohZ6c9FYV57FDCA3K6VE/dNAwiju2N9Wny86WgL5VpycKqALcVluMf+8f4Pb+tp8Eq37Fv2wm3OI2ttEKIIks6MkB5ZBBB67PJCud11NMmgD5MyYwrG8imGokSBuVXz3GHv1AB87ximGHXyEjctxpjpSlJhGoIxJ59wQr3b3Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711576408; c=relaxed/simple;
	bh=2v7wc9fQwYf7d5X1GIFIUQt0lyBTBGde+QP7rENxUrY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j4CcJE9Thtgzb0XmXlxDoekC4wTNNHzH7Yr+lBMmGOEStYB2Gh5fVO/G52OhXDytV0b/hVJlQZaAZzjBsN9hLuvNLFRzosBIZRfqFA0O6NrriJiBW7jUZ8/dqooV9cMKaJyWURucUXxTWuZj6ogrM5Q0QD6UAOUQdAaQEdMSEFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-217.elisa-laajakaista.fi [88.113.26.217])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id 4324b3c1-ec84-11ee-b972-005056bdfda7;
	Wed, 27 Mar 2024 23:52:10 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v1 1/1] platform/x86: quickstart: Miscellaneous improvements
Date: Wed, 27 Mar 2024 23:52:08 +0200
Message-ID: <20240327215208.649020-1-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a mix of a few improvements to the driver.
I have done this instead of review, so it can quickly be
folded into the original code (partially or fully).

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/platform/x86/quickstart.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/quickstart.c b/drivers/platform/x86/quickstart.c
index ba3a7a25dda70..f686942662ccc 100644
--- a/drivers/platform/x86/quickstart.c
+++ b/drivers/platform/x86/quickstart.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * quickstart.c - ACPI Direct App Launch driver
+ * ACPI Direct App Launch driver
  *
  * Copyright (C) 2024 Armin Wolf <W_Armin@gmx.de>
  * Copyright (C) 2022 Arvid Norlander <lkml@vorapal.se>
@@ -10,15 +10,18 @@
  * <https://archive.org/details/microsoft-acpi-dirapplaunch>
  */
 
-#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
-
 #include <linux/acpi.h>
+#include <linux/device.h>
+#include <linux/errno.h>
 #include <linux/init.h>
 #include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
-#include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_wakeup.h>
+#include <linux/printk.h>
+#include <linux/slab.h>
 #include <linux/sysfs.h>
 #include <linux/types.h>
 
@@ -165,7 +168,8 @@ static int quickstart_probe(struct platform_device *pdev)
 	data->dev = &pdev->dev;
 	dev_set_drvdata(&pdev->dev, data);
 
-	/* We have to initialize the device wakeup before evaluating GHID because
+	/*
+	 * We have to initialize the device wakeup before evaluating GHID because
 	 * doing so will notify the device if the button was used to wake the machine
 	 * from S5.
 	 */
@@ -202,7 +206,7 @@ static int quickstart_probe(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id quickstart_device_ids[] = {
-	{ "PNP0C32", 0 },
+	{ "PNP0C32" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, quickstart_device_ids);
-- 
2.44.0

