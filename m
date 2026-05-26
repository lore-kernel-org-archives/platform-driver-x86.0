Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42533DD851;
	Tue, 26 May 2026 10:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779791801; cv=none; b=RP/9OApugE2YaiHANT68IX8fb7opYYJPvQw7KPU1oHCJhtMfA5O/VygeLLn1nhu9fXIiPoU/spqvVv6Od8CamYejCF9QuRf6YShl6nUjLnZWCcVyIkyqVK8DlJ9Shfkvp433UTZIk5/VGLAfH5NgffbJT4PXHp9eUOzYn9v5UHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779791801; c=relaxed/simple;
	bh=yYaDwh1PW7z0Is1jBM94XYY6lR7atPv5eetz6SEs7J0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jG8rKEqznW3r9uK7ydJqse9Lrp6kUHmWckMh+Bj0FlYbjv+GRggOeSaCHi3BwncAsXYXFiSVYAijEXAn8xmmu9qmeDL7vE9TGqKgEwDrIVm7a2BoBN31rMi9DyH9q430uyQXYlhc6W5zsounKdIigSWy5DGt3vucFGWCr59bruA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sfbvUfhg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sfbvUfhg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46DC5C2BCB3;
	Tue, 26 May 2026 10:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779791801;
	bh=yYaDwh1PW7z0Is1jBM94XYY6lR7atPv5eetz6SEs7J0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=sfbvUfhgEfyMWYK4AlpFk86gSOZOu2xPTzLtvcTBDdMK3YYAVqp5yThF6RrSILdHH
	 yS0MyRevJjEbJBHDR45LEh6jsnEWU5fSHbRuBMQ506K+sA4hsF3CVvKk41TTWVbrbp
	 zwprU++Y+Y4DkFUCO4hhorMLWuP9JPn9/mjfq8cKOy29EeCbk2HVfCKUfwc5oHpbQ/
	 iGHkvgMkkuPs/iZSyijtJZ38f1Qxj1fK3PxExk7p0a6cuYtg771tVc6vOFxh4hT6YS
	 il5cR9lRWhyENmflGArFj6R5EF/lbpjfHiv67ffSAQTt7d7G6fS6PtPc95b3f4By3a
	 xVOfVTxPQTHbQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C7F5CD5BD0;
	Tue, 26 May 2026 10:36:41 +0000 (UTC)
From: Jack Wu via B4 Relay <devnull+jackbb_wu.compal.com@kernel.org>
Date: Tue, 26 May 2026 18:36:37 +0800
Subject: [PATCH v8] platform/x86: dell-dw5826e: Add reset driver for
 DW5826e
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260526-dell-reset-v8-v8-1-d3a29cb4cf2f@compal.com>
X-B4-Tracking: v=1; b=H4sIALR3FWoC/3WNQQ6CMBREr0L+2m9opaVxxT0Mi9J+pAaBtNhoS
 O9uwbWryUtm3mwQyDsKcC028BRdcPOUQZ0KMIOe7oTOZgZeclkKLtHSOKKnQCtGhaWQtahqyZW
 wkDeLp969D9+t/XF4dQ8y6y7ZG4ML6+w/x2Fke++fOzJkqGxXMXXpmdGyMfNz0eM5B7QppS9SM
 cBavQAAAA==
X-Change-ID: 20260526-dell-reset-v8-05675476285d
To: hansg@kernel.org, ilpo.jarvinen@linux.intel.com
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 "Mario Limonciello (AMD)" <superm1@kernel.org>, Armin Wolf <W_Armin@gmx.de>, 
 Jack Wu <jackbb_wu@compal.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779791800; l=6449;
 i=jackbb_wu@compal.com; s=20260526; h=from:subject:message-id;
 bh=cojydgSYQ+PTRiOczi2WPz3yWI1NZfPHWXOMON/wOhA=;
 b=P6XfhEZbvFuh6PyeWCGqDDNOdJXQLlsv7PoH8PEavV9NjnxLihNrXKtSUKDIRRKfhOmKs/ZiK
 fFpnTb57uiGCie/3qrblgfVXCi0t/3szaI2Ct8lvWEGs7Pco6c4Jt7J
X-Developer-Key: i=jackbb_wu@compal.com; a=ed25519;
 pk=VH1prTWixNl8OEUPPSfII3p46MzJpQN8J3+ecE1tZXg=
X-Endpoint-Received: by B4 Relay for jackbb_wu@compal.com/20260526 with
 auth_id=793
X-Original-From: Jack Wu <jackbb_wu@compal.com>
Reply-To: jackbb_wu@compal.com

From: Jack Wu <jackbb_wu@compal.com>

If the DW5826e is in a frozen state and unable to receive USB commands,
this driver provides a method for the user to reset the DW5826e via ACPI.

E.g: echo 1 > /sys/bus/platform/devices/PALC0001\:00/wwan_reset

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Jack Wu <jackbb_wu@compal.com>
---
Changes in v8:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://patch.msgid.link/20260526-dell-reset-v8-v1-1-8db4183f1ca6@compal.com

To: Hans de Goede <hansg@kernel.org>
To: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org
---
v8:
  - use b4 tool to send to avoiding tabs being replaced by spaces in Compal mail server.
v7:
  - Place BIT() into PALC_DSM_FN_TRIGGER_PLDR define
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
 .../ABI/testing/sysfs-driver-dell-dw5826e-reset    |  9 +++
 drivers/platform/x86/dell/Kconfig                  |  6 ++
 drivers/platform/x86/dell/Makefile                 |  2 +
 drivers/platform/x86/dell/dell-dw5826e-reset.c     | 93 ++++++++++++++++++++++
 4 files changed, 110 insertions(+)

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
index 000000000000..1ca7c3421bb5
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
+#define PALC_DSM_FN_TRIGGER_PLDR    BIT(1)
+
+static guid_t palc_dsm_guid =
+	GUID_INIT(0x5a1a4bba, 0x8006, 0x487e, 0xbe, 0x0a, 0xac, 0xf5, 0xd8, 0xfd, 0xfe, 0x59);
+
+static int trigger_palc_pldr(struct device *dev, acpi_handle handle)
+{
+	union acpi_object *obj;
+	int ret = 0;
+
+	obj = acpi_evaluate_dsm(handle, &palc_dsm_guid, 1, PALC_DSM_FN_TRIGGER_PLDR, NULL);
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
+	if (!acpi_check_dsm(handle, &palc_dsm_guid, 1, PALC_DSM_FN_TRIGGER_PLDR))
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

---
base-commit: 3036cd0d3328220a1858b1ab390be8b562774e8a
change-id: 20260526-dell-reset-v8-05675476285d

Best regards,
--  
Jack Wu <jackbb_wu@compal.com>


