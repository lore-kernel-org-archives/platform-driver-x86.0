Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB1F36CE1E
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Apr 2026 09:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775813899; cv=none; b=V8eQ0ubWsizkT61d9XKTLbMb+wb7UFQZlJr+FTzUfOqM4Fal/qpHBQr3pOp2r3BOUvGMga91ekkIMVbH60btF2sBFPfWDeCpN3dtTJwXeHu4PP2zum/mOdDvc80NzRjLaVsyW0b3nuJrj08qr1Fsv3NhWyrqHgqm7Dsd2421LWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775813899; c=relaxed/simple;
	bh=aSmtDzF2UtcOQnNd2fhRFLoqn9B6xZOun32UWNpl4L0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sKVg7gtnqu56bCbrfY6DniEeGWOZpAIHPy4Han/Pc2EYq3zfOq5bjGkDUhC1rABvV2gWWJmb1T7gpQKrPXNRCDlCIZknl5E4w01BHpKPxT4088QxyxmMD94B+/LrSbRXhyB7q5hVDmSLzIXnCj54YbXBRoTEzwJ5Vu5pBqIxpoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pg5k10e3; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pg5k10e3"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2b0c8362d93so12752965ad.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Apr 2026 02:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775813896; x=1776418696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6vwcRPslwhrYVAEmvINakniySZsO6ad72sLfnSB79tI=;
        b=Pg5k10e3edqh6MG9lfyhZ3C13EqZdLdrRlRLBEVQ+Qfd3KLWMmaBxkHEVhq4lKwXLt
         cxejg4Qol8AqMuDKfCk7rtifdfMBNfu9AXhZ7BBtlNyQp2r/gg+jHRUzLK9SYjXmX/6o
         aM4ntSVaYN63Iuyp/3Js/HNJNONNUM1WXeOzZVBAXVWEMHhQ06KrBGRN6qbytYlDMoW0
         KtUncfMhNQXM6ws6n8xBgGa4BFYe9jFk+JQD95k+pDb25UcimvDhunft5KKfmwqe1pNw
         ZEZAyxEBUhIGZDN+o+lqBh875zoplNPlGrQwmCIaXEa+EIn3p2H4awdXRvkUIUf1BoU4
         hpRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775813896; x=1776418696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6vwcRPslwhrYVAEmvINakniySZsO6ad72sLfnSB79tI=;
        b=KjyEn5pifk1bwBcyV3as3Q9QrUleQWN76mI8IvURXb/6hOEomOsROVFQ17Dg0OeqhF
         uLd8LCtMt0IQZv9V0KJMO77mEUMqIy4VIkK9sZHusO5np0iQh5n8vNsrSou3P3jhjR0O
         USQzllZkq07Ouwm0/4Ag4QXe0JymOwnhTCb+8rX7/xL85XJ8WgpQuEvI1YpBytwaDBYv
         ZwMLLe4IhvaAEBZoa6p79SmH+Hm/pfA7VAb9+DPUZVQ0oDzWNnqr2OmPztt1mpY9vlN/
         7cDDJEw3botsGw6Y5BNqs0bljvGyGP+YqtQym7NxeswDlOSc0x9Xvw/G9fH9dyJDMxmK
         Tx+g==
X-Gm-Message-State: AOJu0YzE11/3q5qztvV1h+BLoyWndypfXPYjfjpRov+wW+X4lu93tHJP
	FWklvyCy8M8YiC+JUbS60x9pMa2KKrdkJJs4tiqGDQaQ2zxvoY+/9SzL
X-Gm-Gg: AeBDietwB7c4foY8scVovgOXXB3dSiG8BCENXdGU+XvbqFf9hJzOpdHg6Hle+OwF5yl
	jlkKalYfdEuJR1LqU/U6sS/na9EmIpkO2BjCKjvlXtn9jHZnR/uIno06fL1nJIf7llaixHk6sXn
	naX6cpyTuktt7t4AqmtSf+Bypuv8JtNSpANmhgA/IRoZ6WpyUZ1D/tvQhVZ6DmGvJQK/DwxQpKW
	QV5kQHpnOMh98IHqUVsVmmiK0/a8L/bdc9dYuFhPA7WcDCzU6oftN56PsQrHe570rGWpjF0/yjN
	gAVNYqfiBlDvFaHVyU3x2JW/sEhMjO1cBedfU10ut3Qjs9oeXcLHb/X+2HIybEQPp3tTYjak0ld
	2tYqrD4lGlh51bi6hcQEiT5m1begc9cgu/jKqoFgMA9JdXTwFIddb8bcYjmjbV+DT0R7EK+5AiU
	3mb+nbRlcIMR6OdWpcjZVI
X-Received: by 2002:a17:902:7886:b0:2b2:5042:dd18 with SMTP id d9443c01a7336-2b2d594152bmr20095815ad.3.1775813896134;
        Fri, 10 Apr 2026 02:38:16 -0700 (PDT)
Received: from localhost ([2402:7500:488:8797:fb65:d6e4:65a8:4bfd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d843c5c2sm14941245ad.12.2026.04.10.02.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 02:38:15 -0700 (PDT)
From: Jack Wu <wojackbb@gmail.com>
X-Google-Original-From: Jack Wu <jackbb_wu@compal.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] platform/x86: dell-dw5826e: Add reset driver for DW5826e
Date: Fri, 10 Apr 2026 17:37:52 +0800
Message-Id: <20260410093752.298067-1-jackbb_wu@compal.com>
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

E.g: echo 1 > /sys/bus/platform/devices/PALC0001\:00/pldr

Signed-off-by: Jack Wu <jackbb_wu@compal.com>
---
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
 drivers/platform/x86/dell/Kconfig             |  6 ++
 drivers/platform/x86/dell/Makefile            |  2 +
 .../platform/x86/dell/dell-dw5826e-reset.c    | 83 +++++++++++++++++++
 3 files changed, 91 insertions(+)
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
index 000000000000..52002578ed68
--- /dev/null
+++ b/drivers/platform/x86/dell/dell-dw5826e-reset.c
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  dell-dw5826e-reset.c - Dell DW5826e reset driver
+ *
+ *  Copyright (C) 2026 Jackbb Wu <jackbb.wu@compal.com>
+ */
+
+#include <linux/acpi.h>
+#include <linux/device.h>
+#include <linux/uuid.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
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
+static ssize_t pldr_store(struct device *dev, struct device_attribute *attr,
+			  const char *buf, size_t count)
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
+static DEVICE_ATTR_WO(pldr);
+
+static struct attribute *palc_attrs[] = {
+	&dev_attr_pldr.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(palc);
+
+static int palc_probe(struct platform_device *pdev)
+{
+	if (!ACPI_HANDLE(&pdev->dev))
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

