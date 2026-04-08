Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1ABB3806DA
	for <platform-driver-x86@vger.kernel.org>; Wed,  8 Apr 2026 11:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775647093; cv=none; b=W2ghC0sQ00G+ahpggU9bZdOJJ1fWEtcxeO+0FROGFZatkv+VWMN3hjfuklSHVPZjt3MCx7UWYzLwwB7DV73PHdigova6uMKGhKdrb4F1II15WzhdxQv9Sk7d5W4AuiYuQiPLXPk5p1s59Q0aQxb7FrL5iJ65+yKHLIZIIWWbiZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775647093; c=relaxed/simple;
	bh=2JJwm+TEadk/RVJ++F3+rQ7Tk7rdiq5znuYA+7R5718=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HTGiSFG9RdkrPeGHrkbAgyMaiBpM11jpMZQYeQ25X8eDpUypCEOyrMkWDnxTG6cHQa2egDhwFAmRQXbqohV15I6NqtuFvf5lGv1lBadqGmFBMNZRLNckbpUXLqcZVVpK66Kpd9PQlxhGRFAIjokBbULs8ZViRf2JH3k4VpV3TWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dv2IbHDA; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dv2IbHDA"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c76b95e652bso2002718a12.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 Apr 2026 04:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775647091; x=1776251891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sUEk2Ea7JLAjxXHeto1QkqPgsjFkRXcBHDbf7e+WVlw=;
        b=Dv2IbHDAKeL1c4gWOjr7EezB7DFDmK0XwyjnwAx0Iog1idTy1TI5B2Xu5YH3Tq0Pz5
         3YI+3V4YCrvDpY9MhPAO4omv3Ru8S9o+v3U4jPBdjYssOVwr5xQPTj9K4FVCYtAJKDEl
         br881q1oLcG77H7rXtlPHZYma0uS5aPGb2hpHKSZO8IZWYqoi9A/gLKHkkTK3nXi95xA
         d359XLui5+PIHU6mF3+2+/5KQmX7GmoVfvJZBplWdHRUZJLdGgXfdZ+O1OzmMlzmOQsp
         O8oC7MwWvomiB6pM7Hbtgrg0xjPLXSdRMg9rYkiewoZZb+p1dnfQe9tOQsd5eOBXLk77
         IQFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775647091; x=1776251891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sUEk2Ea7JLAjxXHeto1QkqPgsjFkRXcBHDbf7e+WVlw=;
        b=kaz83+xkhifS7Zk2GilDnsGoqRlfFT5d5xILslMp0NiLKSOawqGYTj7U71G74xmXyp
         9tTNs4WnB04ov1TnRRsjOKuWNJXf0FzMXrYddMdsXLFpikiDN+Ed57E9D9cyxN3jUemL
         hMZUSFkOwRYTQ95aq3kn3BowHsnFQhdpmU1JDghbEm8KO32aawCluylRqblv6G2XvRTO
         ASx5jAYspn7yV4j21t1c+Lqx/pUVnddK+gguEIOXWudO+TkJ0SCLkYpjwxugDnxT7TnE
         x0xZOn6EX5lrG3cQj5ZOWnvSO0Jv34RlkIBASe1pRHccbqrglrrlCnqeXNpzKx4Olke9
         p5NA==
X-Gm-Message-State: AOJu0YyQv3u2MWPZeK1JYZXxK9tRMXQ05Cg1rFpIO58vXIMiWKlFyFh9
	XK8xr45gDRAgmM9qpyivIx2k9MEG7dUbgLCWyAbOzWo8wfEiIgOKBbjOFJRxXQ==
X-Gm-Gg: AeBDiev7q1A2TVPlhps6LjyongQvWIQ4xsdRemQbDybP0SRfznlBa31IBJLYXvIvcWi
	uUQCiRaQ4bP/SFTHeqQeyiPeib08Li2Pb2ufWReJYZGzYV0/MOchjclBQMSkD4Xz8nD8GCuRBIN
	fB3WjL88ZmKIW/WCl5BvKqq45qP6GCarwy46inB3w6i2dfRDiEYooUqmEl5FFjLL459eypabOv7
	tM/nRTayxTthlx1REwsEoO7t4eY0UDli4QLKeLF9fZz4wPHuSCplKL6y3um5lRDGiJetVoL2h56
	lcpiZgh1MdGOu32ZfIzbf2OaTotKW+YNYJIWPUEBd5exkrj5fyIncjOBC8tZ0xI7Yg6V1PcYVV/
	l94DRgQbDmAFwdM9zzfP0cTjqxfG3I3dJXJLnvlmTSRRLX0jjaYkcSfZy1ppPlqToIEawD6PMDF
	vUDCi8Ef8u+9DVNt2n
X-Received: by 2002:a17:903:b8d:b0:2ae:4800:141a with SMTP id d9443c01a7336-2b281771b1cmr211736815ad.32.1775647091192;
        Wed, 08 Apr 2026 04:18:11 -0700 (PDT)
Received: from localhost ([2402:7500:404:94a3:bc1:db3:c7d7:391])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b274779b48sm280006375ad.25.2026.04.08.04.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 04:18:10 -0700 (PDT)
From: Jack Wu <wojackbb@gmail.com>
X-Google-Original-From: Jack Wu <jackbb_wu@compal.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: dell-dw5826e: Add reset driver for DW5826e
Date: Wed,  8 Apr 2026 19:17:38 +0800
Message-Id: <20260408111738.232040-1-jackbb_wu@compal.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the DW5826e is in a frozen state and unable to receive USB commands,
this driver provides a method for the user to reset the DW5826e via ACPI.

Signed-off-by: Jack Wu <jackbb_wu@compal.com>
---
 drivers/platform/x86/dell/Kconfig             |   6 +
 drivers/platform/x86/dell/Makefile            |   2 +
 .../platform/x86/dell/dell-dw5826e-reset.c    | 120 ++++++++++++++++++
 3 files changed, 128 insertions(+)
 create mode 100644 drivers/platform/x86/dell/dell-dw5826e-reset.c

diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/dell/Kconfig
index 738c108c2163..c4540c837a88 100644
--- a/drivers/platform/x86/dell/Kconfig
+++ b/drivers/platform/x86/dell/Kconfig
@@ -276,4 +276,10 @@ config DELL_WMI_SYSMAN
 	  To compile this driver as a module, choose M here: the module will
 	  be called dell-wmi-sysman.
 
+config DELL_DW5826E_RESET
+	tristate "Dell DW5826e PLDR reset support"
+	default m
+	depends on ACPI
+	help
+	  This adds support for the Dell DW5826e PLDR reset via ACPI
 endif # X86_PLATFORM_DRIVERS_DELL
diff --git a/drivers/platform/x86/dell/Makefile b/drivers/platform/x86/dell/Makefile
index c7501c25e627..8150283cfd1d 100644
--- a/drivers/platform/x86/dell/Makefile
+++ b/drivers/platform/x86/dell/Makefile
@@ -28,3 +28,5 @@ obj-$(CONFIG_DELL_WMI_DESCRIPTOR)		+= dell-wmi-descriptor.o
 obj-$(CONFIG_DELL_WMI_DDV)			+= dell-wmi-ddv.o
 obj-$(CONFIG_DELL_WMI_LED)			+= dell-wmi-led.o
 obj-$(CONFIG_DELL_WMI_SYSMAN)			+= dell-wmi-sysman/
+obj-$(CONFIG_DELL_DW5826E_RESET)		+= dell-dw5826e-reset.o
+
diff --git a/drivers/platform/x86/dell/dell-dw5826e-reset.c b/drivers/platform/x86/dell/dell-dw5826e-reset.c
new file mode 100644
index 000000000000..28865a123c63
--- /dev/null
+++ b/drivers/platform/x86/dell/dell-dw5826e-reset.c
@@ -0,0 +1,120 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  dell-dw5826e-reset.c - Dell DW5826e reset driver
+ *
+ *  Copyright (C) 2026 Jackbb Wu <jackbb.wu@compal.com>
+ *
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/acpi.h>
+#include <linux/miscdevice.h>
+#include <linux/fs.h>
+#include <linux/uaccess.h>
+
+static guid_t palc_dsm_guid =
+	GUID_INIT(0x5a1a4bba, 0x8006, 0x487e, 0xbe, 0x0a, 0xac, 0xf5, 0xd8, 0xfd, 0xfe, 0x59);
+
+struct palc_dev {
+	struct device *dev;
+	acpi_handle handle;
+	struct miscdevice miscdev;
+};
+
+static int trigger_palc_pldr(struct palc_dev *palc)
+{
+	union acpi_object *obj;
+
+	dev_info(palc->dev, "Triggering PLDR via ACPI _DSM Function 1...\n");
+
+	obj = acpi_evaluate_dsm(palc->handle, &palc_dsm_guid, 1, 1, NULL);
+
+	if (!obj) {
+		dev_err(palc->dev, "Failed to evaluate _DSM\n");
+		return -EIO;
+	}
+
+	if (obj->type == ACPI_TYPE_BUFFER)
+		dev_info(palc->dev, "PLDR _DSM executed successfully\n");
+
+	ACPI_FREE(obj);
+	return 0;
+}
+
+static ssize_t palc_write(struct file *filp, const char __user *buf, size_t count, loff_t *ppos)
+{
+	struct palc_dev *palc = filp->private_data;
+
+	trigger_palc_pldr(palc);
+
+	return count;
+}
+
+static int palc_open(struct inode *inode, struct file *filp)
+{
+	struct palc_dev *palc = container_of(filp->private_data, struct palc_dev, miscdev);
+
+	filp->private_data = palc;
+	return 0;
+}
+
+static const struct file_operations palc_fops = {
+	.owner  = THIS_MODULE,
+	.open   = palc_open,
+	.write  = palc_write,
+};
+
+static int palc_acpi_probe(struct acpi_device *adev)
+{
+	struct palc_dev *palc;
+
+	palc = devm_kzalloc(&adev->dev, sizeof(*palc), GFP_KERNEL);
+	if (!palc)
+		return -ENOMEM;
+
+	palc->dev    = &adev->dev;
+	palc->handle = adev->handle;
+
+	palc->miscdev.minor  = MISC_DYNAMIC_MINOR;
+	palc->miscdev.name   = "reset_palc";
+	palc->miscdev.fops   = &palc_fops;
+	palc->miscdev.parent = &adev->dev;
+
+	if (misc_register(&palc->miscdev))
+		return -EINVAL;
+
+	dev_set_drvdata(&adev->dev, palc);
+
+	dev_info(&adev->dev, "DW5826e Reset Device (PALC0001) Driver Loaded\n");
+	return 0;
+}
+
+static void palc_acpi_remove(struct acpi_device *adev)
+{
+	struct palc_dev *palc = dev_get_drvdata(&adev->dev);
+
+	if (palc)
+		misc_deregister(&palc->miscdev);
+}
+
+static const struct acpi_device_id palc_acpi_ids[] = {
+	{ "PALC0001", 0 },
+	{ "", 0 }
+};
+
+static struct acpi_driver palc_acpi_driver = {
+	.name  = "palc_reset",
+	.ids   = palc_acpi_ids,
+	.ops = {
+		.add    = palc_acpi_probe,
+		.remove = palc_acpi_remove,
+	},
+};
+
+MODULE_DEVICE_TABLE(acpi, palc_acpi_ids);
+module_acpi_driver(palc_acpi_driver);
+
+MODULE_DESCRIPTION("Dell DW5826e reset driver");
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("JackBB Wu");
-- 
2.34.1

