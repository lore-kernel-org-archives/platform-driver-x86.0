Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE8D214204
	for <platform-driver-x86@vger.kernel.org>; Mon, 20 Apr 2026 06:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776664852; cv=none; b=PJR1vqPJZQIH9Bv/xLX7UW7B9rjj8rvDUFFj6BgATD1gQNDazWzIIvIZHItDcOLLQROxOk6u0HciwGAJnzcztUNJaF0sC2zsyDkkkmr3aqraWQkdv6JDO0ATzCmVvaCSSSF28lWPt9HNPu7UvOvuaVKmeUFlz+q0LKJ/0X8eV68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776664852; c=relaxed/simple;
	bh=RCC7mhfihNLXUAQpshgnrlRH9fonmVdKHPMsUEk+Es4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EKlA5y4URqlEwrkcnAKSenrK1cJ4PFVMJqrZDhLG93nsIvd25fjz0dBF5VPJcV2F+BUI16e2irwTaeQ2NJoSyJZHY04chYeniuuqnyqN111UFGnXBx5gFdOO3TkJActxFCkTEqqJ4ka9Bu+HYG/M9U1iapmZZn3Asrfg/vrApko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CEfBlUnf; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CEfBlUnf"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-354a18c48b5so2534875a91.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 19 Apr 2026 23:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776664850; x=1777269650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yz+oIzHN4SvCOmidsaqa2XOdC5mswCbAEa0s0bwdLUA=;
        b=CEfBlUnfS/w7ap916/XSzzsG25XVN9yfag0UfR/19Yw/bFidI1zjiJ4L7aLvzu0nwG
         RoQJ6lHqFQ/3hb+mAFPwAVOICp619/0aa8lXTvHPjbtUxCLESfzzklk1GIlvM+9T/+o2
         vDPFd0hNS8tObkS97ChFhHZ37NjTPTBRBKlu1zEuIMvXMEzF7swJCNTmuuRb6lp7IvEW
         I9FM62skzpPp/QpODBTAfkgDRDkcqiF9i5IJAROy+53hqRJQpa86pX3wiajoEl85Ql44
         M7OZaPB5YkmhO0OSk33F+t19/1Q+QhnO7pOKZm2eH3/VPUDcBwNg4akpxkyXhjet7/2G
         cxNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776664850; x=1777269650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yz+oIzHN4SvCOmidsaqa2XOdC5mswCbAEa0s0bwdLUA=;
        b=TI0Y9BLBHMwSrLh/2NMKHc/XMz6zdfhIVyNnaXCWl7PytTu83odnn4ewQ9Q3getPBq
         ZOoHEtzy5/MZQRmGtYAmhQH+CpqULsGJ/Ib/SJiJcMPjPLvsZLceWjHxLO4Sx9KPeIIS
         cx/UsX9ZsPjoaC+ViMVMrilpoGfqcpGhoMSPdxui6OM+Qn+yFtsSoesk9v2Zl1dE96Pl
         nP/Om41o6apkJEjvVGUiNk2YNvl3R96g5I24fGxyhK3wsvofMvF3aA8U17+MaUo5Poee
         7lkjeled8iw7aceuxrO5JqDNiXUmmbfEs9LK0ZJ1s2DGiR80iMBZNbYFC/5+CHJKeWYI
         LbCw==
X-Gm-Message-State: AOJu0Yzq3lGLANbgKiqRGXLrT0QdaYYt/N0HznGoKbH+az48KhfFVacT
	/VUOo6sSL+7JysaZcDo7UztCs28EzjkOpl04OszgDwqTplEX17Beap4Q
X-Gm-Gg: AeBDieuPzOg3GjlzYzU4JNOBis1+OeDYqW/iqJOid3qd2VQ10/WmSepKT6vkEhkFkbx
	dFk9WqZ5xXjy0JeBBhrC87iySHPAnPMQGJOEjrsMVXuM/spQz3Zpopwx8y69sG/XWKDsnMV/X58
	yOtlDFaH/1kKHcNn81jjyNOJ2Ewo91D2nEJYuKT9QSRr3xX6xGj2qikBIaqx5D0v+WUu5KCL8LV
	2g3od9oy0rg1qjKpyAoYbkxsiQZYfoKBIRSuRKBt1TFjV5WzgwoCSEWbW+wCxFwOfEOUskRT/0v
	yxZP08SjreLC4jGyP71ybigWeGVcw5VQh2SMpM5djYo1l8aNC62uZmIbVXvueNFeP7ZFRnwKakH
	egF75dSG8H9gnt3hw9osjvukRYGFlJiy9XAXmyEztAXV6cjQKCkr52hSvufIAy2dnoeG8bBdRl+
	Vu04qcrpTtFEksj6p8IAp1sR/cvySO8+JA8NrbiYlPbA==
X-Received: by 2002:a05:6a21:6d97:b0:3a2:d68d:9e6f with SMTP id adf61e73a8af0-3a2d68dd1demr935441637.33.1776664850261;
        Sun, 19 Apr 2026 23:00:50 -0700 (PDT)
Received: from localhost ([2402:7500:488:a282:4b1b:c431:6491:7795])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c797701d9bfsm6749812a12.16.2026.04.19.23.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 23:00:49 -0700 (PDT)
From: Jack Wu <wojackbb@gmail.com>
X-Google-Original-From: Jack Wu <jackbb_wu@compal.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] platform/x86: dell-dw5826e: Add reset driver for DW5826e
Date: Mon, 20 Apr 2026 14:00:29 +0800
Message-Id: <20260420060029.1754854-1-jackbb_wu@compal.com>
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

E.g: echo 1 > /sys/bus/platform/devices/PALC0001\:00/wwan_reset

Signed-off-by: Jack Wu <jackbb_wu@compal.com>
---
v4:
  - Fix version of the ABI documentation to 7.2
  - Add include linux/types.h
v3:
  - Rename sysfs attribute from "pldr" to "wwan_reset" for clarity
  - Add ABI documentation for the wwan_reset sysfs interface
  - Validate _DSM method availability in probe using acpi_check_dsm()
v2:
  - Remove extra empty line
  - Add missing includes and Remove unnecessary includes, sort includes alphabetically
  - Remove noisy dev_info()
  - Handle obj->type != ACPI_TYPE_BUFFER as error with proper return code
  - Replace miscdevice/file_operations with sysfs attribute (DEVICE_ATTR_WO) to reduce boilerplate
  - Propagate trigger_palc_pldr() return code to userspace
  - Convert from acpi_driver to platform_driver
---
---
 .../testing/sysfs-driver-dell-dw5826e-reset   |  9 ++
 drivers/platform/x86/dell/Kconfig             |  6 ++
 drivers/platform/x86/dell/Makefile            |  2 +
 .../platform/x86/dell/dell-dw5826e-reset.c    | 90 +++++++++++++++++++
 4 files changed, 107 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-dell-dw5826e-reset
 create mode 100644 drivers/platform/x86/dell/dell-dw5826e-reset.c

diff --git a/Documentation/ABI/testing/sysfs-driver-dell-dw5826e-reset b/Documentation/ABI/testing/sysfs-driver-dell-dw5826e-reset
new file mode 100644
index 000000000000..a665e265633f
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-dell-dw5826e-reset
@@ -0,0 +1,9 @@
+What:		/sys/bus/platform/devices/<PALC0001 device>/wwan_reset
+Date:		April 2026
+KernelVersion:	7.2
+Contact:	Jackbb Wu <jackbb.wu@compal.com>
+Description:
+		Writing to this file triggers a Platform Level Device Reset
+		(PLDR) of the Dell DW5826e WWAN module via an ACPI _DSM
+		method. This can be used to recover the modem when it is in
+		a frozen state and unable to respond to USB commands.
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
index 000000000000..4e0d64535abb
--- /dev/null
+++ b/drivers/platform/x86/dell/dell-dw5826e-reset.c
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  dell-dw5826e-reset.c - Dell DW5826e reset driver
+ *
+ *  Copyright (C) 2026 Jackbb Wu <jackbb.wu@compal.com>
+ */
+
+#include <linux/acpi.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/types.h>
+#include <linux/uuid.h>
+
+static guid_t palc_dsm_guid =
+	GUID_INIT(0x5a1a4bba, 0x8006, 0x487e, 0xbe, 0x0a, 0xac, 0xf5, 0xd8, 0xfd, 0xfe, 0x59);
+
+static int trigger_palc_pldr(struct device *dev, acpi_handle handle)
+{
+	union acpi_object *obj;
+	int ret = 0;
+
+	obj = acpi_evaluate_dsm(handle, &palc_dsm_guid, 1, 1, NULL);
+	if (!obj) {
+		dev_err(dev, "Failed to evaluate _DSM\n");
+		return -EIO;
+	}
+
+	if (obj->type != ACPI_TYPE_BUFFER) {
+		dev_err(dev, "Unexpected _DSM return type: %d\n", obj->type);
+		ret = -EINVAL;
+	}
+
+	ACPI_FREE(obj);
+	return ret;
+}
+
+static ssize_t wwan_reset_store(struct device *dev, struct device_attribute *attr,
+				const char *buf, size_t count)
+{
+	acpi_handle handle = ACPI_HANDLE(dev);
+	int ret;
+
+	ret = trigger_palc_pldr(dev, handle);
+	if (ret)
+		return ret;
+
+	return count;
+}
+static DEVICE_ATTR_WO(wwan_reset);
+
+static struct attribute *palc_attrs[] = {
+	&dev_attr_wwan_reset.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(palc);
+
+static int palc_probe(struct platform_device *pdev)
+{
+	acpi_handle handle;
+
+	handle = ACPI_HANDLE(&pdev->dev);
+	if (!handle)
+		return -ENODEV;
+
+	if (!acpi_check_dsm(handle, &palc_dsm_guid, 1, BIT(1)))
+		return -ENODEV;
+
+	return 0;
+}
+
+static const struct acpi_device_id palc_acpi_ids[] = {
+	{ "PALC0001", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, palc_acpi_ids);
+
+static struct platform_driver palc_driver = {
+	.driver = {
+		.name = "dell-dw5826e-reset",
+		.acpi_match_table = palc_acpi_ids,
+		.dev_groups = palc_groups,
+	},
+	.probe  = palc_probe,
+};
+module_platform_driver(palc_driver);
+
+MODULE_DESCRIPTION("Dell DW5826e reset driver");
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("JackBB Wu");
-- 
2.34.1

