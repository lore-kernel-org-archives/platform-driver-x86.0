Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE12389459
	for <platform-driver-x86@vger.kernel.org>; Wed, 15 Apr 2026 06:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776234200; cv=none; b=hlDyCDWEYnyNzUUbUA84QrxSR4BCJtz0nwLg9G+M8mrjizZ5cM3uHDdnYYgitDNm5k6+/q0J6kY4ruW6SwpObG7UIaapqOGNJHpRsTxfe51xvdPXW4/PdCpqGKOEG+UiVVcilSUv0P2/ZwitVvuGV5DF1PM8kN5xcEtgmn/Vhk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776234200; c=relaxed/simple;
	bh=geyZvgprKjEeKiK0Tp6mRxctTowJFwFV+quIOdfUV5E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BQUgbGVf3eZUcKo9LVb6iYKDnDTdlCQAM+GlyKDTFPsKglk+j057ZjfSOF5UhZEjKcNXsVAzgHz0MlHdTw6YPMvrAjJNqGGopZGlKuGttG9aaEpkUHsb9G7diE136wqnsprqj3Gx86PiL6g4y9Gi/I2Fp810vlfKJr7WJFzzAp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=njMpeN+F; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="njMpeN+F"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ad9f316d68so28475765ad.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Apr 2026 23:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776234198; x=1776838998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ndeSRHcWpBsW4Wcl/vpjEgHTFPUXHibJevNehA2/+xo=;
        b=njMpeN+FkafoiTYDZrYQxa7Exd0nlZ/KKtgJw/p9dMHLLKz3Aju5dDXfhFNjSErkLH
         ZNeOeNpPGdJmyn9X0u7dIDpBpqIksY/vcUpYu8RrIyKQX2HD87GcxWs7kH6/gjdcG1PK
         wgKrkFkOoDvZQzFKo1ktoY+suqw1Jt480T1BRtUfPJZEKEXULrajfc8q9ioQLWIpiIRl
         7n9HCgVlfzZlvBWoM+QUqDCYC85QVUvEuCeK5918DUrCt5hjdK4cbt1MblphutuGl419
         umxb/NYZPaOQ6MQJaMtT6pH8yQ1bBKJjkcodA+0U+mtdBUnpyKepj3Mlz8TE+GdWWpmx
         kXwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776234198; x=1776838998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ndeSRHcWpBsW4Wcl/vpjEgHTFPUXHibJevNehA2/+xo=;
        b=VB2tjZ7CRIUKWp/gtXKwgAaADimDZlBocBVN0iaj20fLDIFhXBgUI5CEEPitTqiaRz
         pyC99vadQKnjQMqIxFqhwKxiM81kinbHl/wTrx66Fqtt9sTN/6HzcDKG0N/dbODEphgJ
         Eb36LQBRloofO6wKsWJFwXbfmQI1cRBAONBPV4LSwaAg4SNpnU7G/D1ZosXDqKFuhoLk
         uekJyXtRSRizUXXFV9Zbp7xjhPwEq3kGhzmxV0jDELj0QcXa5kXAZMJtyL94SggIevN3
         avX+emvL4RnVivWEsbQLiUf5s3zAcKzEYfTjVlwwDdI2JDSg5XB4U2zZBD3TuFTrIimv
         vdbg==
X-Gm-Message-State: AOJu0YyStIwsE+pQVXSVLE9HRiSfnfciXS68ZRnkwn/UKkeCJTamqxeB
	sMJhtSkfUF5thE1aJBG3Dq+X30dDmsDyR3K2xd81o2mFbsM/QtqrdES4oeMbug==
X-Gm-Gg: AeBDietH55rHQThO2vEl1Tg7BHczqqp87YBXmkLZa0yKRexaCNxfeMC+oKBOz9G73bX
	RJ+NH+NMp1xMtVPQIpYKCU93dJVosvKw3Bb1vIpYJAWrllB0A2z9AyGkz1CCqukJodLrQB965K5
	V1zQDSGf8zIkgdNCzltpx6bNs2il9R0ftfIovU2aWdcXxEhL7eXwTXrjk0xBGr+qfhINMNp5TlL
	GMI82QHkaF1fB1eVzfbLEOrsTlg60TfcA5COiUcpqVtiohv9Qo8V9ittdsQdlHjeDbDjNa4AuH0
	7mN8JBMZHg1ZaPRW7TUQvHk7mpc597e/pL3JnmKX9hpR9UjwkLk2B4623ICOHrEECKvAsgjF7V5
	wfPJpZ3HdscQ+Z6Vt05gzDpKXjP566Cfa5mGJQ2n1rjn6INYt8KSK4499flkH1E7uhdGvX8Fnzi
	VNSmunyFNnNDR53CjMs5U=
X-Received: by 2002:a17:902:7c8e:b0:2b2:42f8:1a4b with SMTP id d9443c01a7336-2b2d5a167d2mr148111235ad.27.1776234198163;
        Tue, 14 Apr 2026 23:23:18 -0700 (PDT)
Received: from localhost ([2402:7500:406:7646:cb3:e80b:d42c:fa71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b4782cde0bsm9525745ad.80.2026.04.14.23.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 23:23:17 -0700 (PDT)
From: Jack Wu <wojackbb@gmail.com>
X-Google-Original-From: Jack Wu <jackbb_wu@compal.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] platform/x86: dell-dw5826e: Add reset driver for DW5826e
Date: Wed, 15 Apr 2026 14:22:55 +0800
Message-Id: <20260415062255.1615337-1-jackbb_wu@compal.com>
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
 .../platform/x86/dell/dell-dw5826e-reset.c    | 89 +++++++++++++++++++
 4 files changed, 106 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-dell-dw5826e-reset
 create mode 100644 drivers/platform/x86/dell/dell-dw5826e-reset.c

diff --git a/Documentation/ABI/testing/sysfs-driver-dell-dw5826e-reset b/Documentation/ABI/testing/sysfs-driver-dell-dw5826e-reset
new file mode 100644
index 000000000000..88286191caa6
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-dell-dw5826e-reset
@@ -0,0 +1,9 @@
+What:		/sys/bus/platform/devices/<PALC0001 device>/wwan_reset
+Date:		April 2026
+KernelVersion:	7.0
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
index 000000000000..98c5b68c8746
--- /dev/null
+++ b/drivers/platform/x86/dell/dell-dw5826e-reset.c
@@ -0,0 +1,89 @@
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

