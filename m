Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91CE240611
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Apr 2026 06:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777442836; cv=none; b=tu+x4R6u1Fh3QkBi/MdCqIq53xvWe/arNGSlh+WJNajErEGjCf3ioBkhrfjcR5PlM52a8ReVeTS71KunLmOxIz0kUGQ7u9uv8dqPN2nu9zxbR4sJ2o9v+mJDg1Bxr2mxw5txG1QlYfV4gW7ByxwDypYeWkxduAsvAbs0jjMrZwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777442836; c=relaxed/simple;
	bh=WUmQlCO8HskeZ40sNi+zc31d63kmo5FwbqrNYw1B7Z4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=U6cgAzbuDFizS1Y8GBnboNW6+UBqaWPSQisznB3u6x7kR7MjbpkoeZZWyuWKfDdkh9lmiYaf4wHk1PCghWvTSXFFZS2yk0yXpLbmUtRM62joFINccuUDE6ywRuOGyTwHxNScltFWyUBRMBiebWdtS9cmSbTWU/yO+26EdAjGQQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OiXKeI+n; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OiXKeI+n"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-82f8b60e54dso8207923b3a.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 23:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777442834; x=1778047634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1cXYsWwNFeqfn9qpghbGUMgCMCIRjPgYYlbfAqWkClI=;
        b=OiXKeI+nzT89BbBb9L3XPGJxenHS5r/9E3/CRLAw3hQhO5kj1E4W+dNUdciYChFIg6
         Lo3uBH7Gi+u+fMxBcVNWZ1XFoB9+aa/oSgpSSfBMU90/9Ud2hEWKvIO7W5WmbN1Nb16W
         e7IOHHDe23cbxG14jXpROr/ny0pTs3y/pG4eI4wifFmDjI1ShRTcJuznIdXgbsTi/P12
         HuRhGYWXJnI1PxOGIHTY0U17QBJyRqngUw/YKE1DUN+fjY8TIVu844QLOCoaZEuUEuUi
         4B29UiQk9MDk5mJYfC2c6JPu9D0R7GbZZJZY3a/8FTvwogt5ZXW7EYYqFGWDuu4hdDSi
         qrsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777442834; x=1778047634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1cXYsWwNFeqfn9qpghbGUMgCMCIRjPgYYlbfAqWkClI=;
        b=sa6uT3D4EUDIffUwRFlUOhmIzjYpCn+A9E+t8DzXoidjtb1rgpGZxCxrBxjDdgk1fb
         mn5unfVF3VUt4g0piIztJtcF0n3Ol4Us2haaJjBzuWBeJRI3jf7MFEsuijeYfHIXR8hi
         qxy+FSFAvBQnBddxAz83D3IUfreGhsRLrLA/ft5kT0P34EVZcpf2jhkM2r9by3jxWn50
         hSeDyYhF6DN+sglbHWHsEL1VAE6aPj9wpo9GzbZDyhhR3wpMl7IZabnLTAZKnCQkNlcO
         3hJ2kekyJgZbxuYGpQZwBP/nH2PlaWWq3LUlUlnFreMFsUKurVENMlPJP/kSwiAIiuwl
         dt2g==
X-Gm-Message-State: AOJu0YxouXjPkKNQBg0jEnplpaaBEaBFUkC5c2wO7Ot3C850+eBPPmPk
	m6t8rfhHarb/wnDAUOT6gcVelVe8HpiXnZ2nuqWCFE7k51lX4ZsWnh7K
X-Gm-Gg: AeBDiesfMCYzS2Xypdp797xzvbRlbT99mWddy/O0Urbla10/pUQDlRe9oICludQmQF6
	CWTmWySdVKpXGIcHfTuwu2hc8yuwgAXA979382nqE/ahHiecKBDlEJZmCOP4/yTZc5DnKkgbH7L
	Z9Oz6HNvBJaqIGi+QeTjvvhNx6p0AjsjG2w50U8bEGJtBBpNbq4lDIjT0T10rVOAD3ydiqJsxaj
	vdcwyKuIyrMI/92yjeF1vxmf3s8bNrkXx4AzdLR+rdWgv07fGzA3MmOKfTOX8FYB0gP79ZGvkBq
	gjE1XaJGdmFg7U3cnIZisTJl/kI4Eh2ZzxU7ujeMPO6ZtKDBoybuz6GcCNKBB5ObJUrQt0BtebN
	nRMEIT3Aj3o+qjazO1wS0lcWgyX50ILUTy9H9go4VYkkWghNd9IFcx37lYM+euI1lMBUPAvj/yQ
	3THNpYh9zxB1M2Mk1kLHkWlfoxEGN/bkJOrqcWjrE/tm2wF/q6JYATTV9xVJQRV+MI
X-Received: by 2002:a05:6a00:e12:b0:82c:6aee:b21a with SMTP id d2e1a72fcca58-834ddc9223bmr6381804b3a.45.1777442834176;
        Tue, 28 Apr 2026 23:07:14 -0700 (PDT)
Received: from localhost (61-219-108-167.hinet-ip.hinet.net. [61.219.108.167])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed5a02a7sm856764b3a.11.2026.04.28.23.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 23:07:13 -0700 (PDT)
From: Jack Wu <wojackbb@gmail.com>
X-Google-Original-From: Jack Wu <jackbb_wu@compal.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mario Limonciello <superm1@kernel.org>,
	Armin Wolf <W_Armin@gmx.de>
Subject: [PATCH v5] platform/x86: dell-dw5826e: Add reset driver for DW5826e
Date: Wed, 29 Apr 2026 14:06:43 +0800
Message-Id: <20260429060643.2367630-1-jackbb_wu@compal.com>
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
index 000000000000..24b18062ae0e
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

