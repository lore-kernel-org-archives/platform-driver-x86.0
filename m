Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723C47E0E8
	for <platform-driver-x86@vger.kernel.org>; Mon,  4 May 2026 01:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777858388; cv=none; b=D0F9MMr6Mv+8zOngfrGrWbCfr0j1viAjetr1EULQ8cideIF16/uHV4ZLRNAj6/zPku7FGQhVewEyn241rTluKIoFw2ePXyEdUK/RCCC/YVlahhm41XESV3u+CdXEnO5t4V5BhmlyHuJ1992dG1hjEJNQ1tKdbZoRfXVFGGign8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777858388; c=relaxed/simple;
	bh=iIZwcSJHTKXE1raLWL9tGJ3+wg5Yrl2KpUp4gDdaCwc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rIA6KoUZFbvl+TyLceumjsJLdB7ESxQJWL7uNGtBfp/qs15FPozF58Kcqhnm9cUO3RRqKlyXPZNDjEE/fQQ8U+SanmqRvd4Ev9FbzRW2UDcc7Io96XxVDXRk0ABkvQMmYIeS527EohFokfUfPcRNmCR6ZgKWEch0zaM9nQdPRRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oBTjxwS4; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oBTjxwS4"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-364ff382b0bso2211333a91.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 03 May 2026 18:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777858386; x=1778463186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vt1MXjRWO808dcrw7GdArARkDsPebzOjnTivrvOFjdE=;
        b=oBTjxwS4+p0JZZZkqE6JL7IpjACBrlNTMmGPkjpUJeJAGbiAC/erkpxDtF+e/+pqWr
         zyC1NrR4hX8WTiuKxt5d9qRRwRLegofMsgvR4TzbfPG8sTSVA/KQ8AByxOaNcTaNtyKI
         7OdWczgY1DP5vT3M46oRsTeugNg6D8Iak9GMtpA+GMMoQ3TdBwEImI8qUbBYMV0g51Sq
         hsIPIztILtYhz6mU9fnKTZKOJSt3rvYIkjPnWHlMIUwkafaezwhY5LVHZxYBIAc7slgK
         cIjmlZOVYDOlE4p2mbihR5f1d1Woiz8IS4tVEpTEWfvSg31EK45iyUnFwfon+Wz/4z3i
         ghCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777858386; x=1778463186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vt1MXjRWO808dcrw7GdArARkDsPebzOjnTivrvOFjdE=;
        b=SoHHjaxmUxcZlbyouZC5A79P4x6TluMshaQ0uvr+C/Yb4LMwcNkOujE1SknmIBpxH+
         BnjGr7kOkx1suuimQy9B/Di4/kkkfuaa4Z7nWY/47xjVS4XPXPT5GaVv2YTGYCo5fJ3j
         ijWFSbNSpwWze/Fo5Rs8arQtxJo9ozgdX8HILPqLy/kCozReQZqmypl7dDb+VTnzVLt5
         hRhYI7dozyAQN0xvaJ7wqxIXWA2Vv7Utj3PsFoEUz0AwfP35tiBTdfB5Rz0GP+kWndkn
         NZyv2244L20POTKOqi8DFMbp6DIY35qDioTv54deX6HiCnc+/jgKaHlcmevRl5KrVJQV
         DmnA==
X-Gm-Message-State: AOJu0Yzy25Kq596NmZ4B2pp5VRWilL2zmTimJ633fGRxdGcnG4MD2XkG
	s8BrKTOpXClqweH1VdB7dNsEzZEu+kW5g0PINenSZftVN2Dd1uCziuho
X-Gm-Gg: AeBDiev3Eect+NJ5apgb/LdCYuX0Kb5EP2uFeYR1WABiosjN0d1qY8RWuAQRDRKc42k
	EvVBcAnMpMTsBpd8VoqT+7WYQL3E5KEikrWn/n0H8wR4ZljXLaL/4E1wgRFczlzqBrQI4+uA3F1
	p7HTcY4Uxna9VCBbqQf13L4ZZOUIHmNjY6t7P1uOUUJ876fz+PceFVHQvoERzi3P18rb8u2bJZh
	AxBo3SyZfvTWteWd/4DYzk+laWvrc8ob2AAvo1TRP3qNZp8btv3iZEs11Zg1MnnmHTPksVGUeI1
	U4kyZmFKsimSO/3cU3sRJjeyBR7gdEniqnIxqUIW79MMo8mHhuKcA12ItDOA8M7d9Y3SOsCCFrY
	5HHDRcAwfZBFysbmQiau7U5+g11yEMCj/IAxCwlkpYqZpsN0iMGFbN96f2uSutO98/cr4vD5nWm
	dZTIMC9CQ0ZIBcIzKHnEkx31DrDr5HDwobj7US39otGuUp8JHRvFnTya6JI/4rpIgV
X-Received: by 2002:a17:90b:4ac2:b0:35f:b6a1:8d27 with SMTP id 98e67ed59e1d1-3650ce83a97mr8193407a91.18.1777858385651;
        Sun, 03 May 2026 18:33:05 -0700 (PDT)
Received: from localhost (61-219-108-167.hinet-ip.hinet.net. [61.219.108.167])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ec027690sm9306553a91.13.2026.05.03.18.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 18:33:05 -0700 (PDT)
From: Jack Wu <wojackbb@gmail.com>
X-Google-Original-From: Jack Wu <jackbb_wu@compal.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mario Limonciello <superm1@kernel.org>,
	Armin Wolf <W_Armin@gmx.de>
Subject: [PATCH v6 1/2] platform/x86: dell-dw5826e: Add reset driver for DW5826e
Date: Mon,  4 May 2026 09:32:43 +0800
Message-Id: <20260504013243.2445940-1-jackbb_wu@compal.com>
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

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Jack Wu <jackbb_wu@compal.com>
---
v6:
  - Use same define for the DSM check
v5:
  - Use BIT() for the DSM method
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
 .../platform/x86/dell/dell-dw5826e-reset.c    | 93 +++++++++++++++++++
 4 files changed, 110 insertions(+)
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
index 000000000000..d37c6a66c4c3
--- /dev/null
+++ b/drivers/platform/x86/dell/dell-dw5826e-reset.c
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  dell-dw5826e-reset.c - Dell DW5826e reset driver
+ *
+ *  Copyright (C) 2026 Jackbb Wu <jackbb.wu@compal.com>
+ */
+
+#include <linux/acpi.h>
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/types.h>
+#include <linux/uuid.h>
+
+#define PALC_DSM_FN_TRIGGER_PLDR    1
+
+static guid_t palc_dsm_guid =
+	GUID_INIT(0x5a1a4bba, 0x8006, 0x487e, 0xbe, 0x0a, 0xac, 0xf5, 0xd8, 0xfd, 0xfe, 0x59);
+
+static int trigger_palc_pldr(struct device *dev, acpi_handle handle)
+{
+	union acpi_object *obj;
+	int ret = 0;
+
+	obj = acpi_evaluate_dsm(handle, &palc_dsm_guid, 1, BIT(PALC_DSM_FN_TRIGGER_PLDR), NULL);
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
+	if (!acpi_check_dsm(handle, &palc_dsm_guid, 1, BIT(PALC_DSM_FN_TRIGGER_PLDR)))
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

