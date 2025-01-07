Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD00199236;
	Tue,  7 Jan 2025 17:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736269556; cv=none; b=NGNAERxpnYMKMAKo/HwV0lf8I21XzSYUoOYTz7EheRoEpuMuq6j7F6x2jjNGO+3ei/hTbY05ZeWjdEngOSZrIwTzEdgkE3bQUWiAdL6LgXfpUKwDemDS+gvkCJ548WpM6bCwIwzQihWh1ot+JhZqN5CFWEMmENCmvGo3b/YJzAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736269556; c=relaxed/simple;
	bh=v8v2bwASK20xizpHeRN3fIY6330Ur6fWSwRWF082iT8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mrZfOnMeS+zod00eyTy5aXIHEjJY8CmsOoR/OaXbFf+qhFw8HTKfEU1zoySH2wqPwuZ7z+/cu+tON62nw7dhkSKbj+/5V8Y/k7SCvp7kqU+ii1IdgJ1B4qOaViL1FRjUeQVyEllqXHThUlzp7wESmnkNiyctKnRsbbom36IdTBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Bm/ndyVZ; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Bm/ndyVZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1736269549;
	bh=v8v2bwASK20xizpHeRN3fIY6330Ur6fWSwRWF082iT8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Bm/ndyVZZSUnbd9yyH/un0AI8ox80kMeF5Hgi/XSjFSGLxG3JZjzOX/XQUMsD7i1x
	 U8nQktalOT9oFtZLF7fw5YutT0s4nffDdgXqN0PVC6JiQ5B7/jpCBmYaMCRij1Pry6
	 EWQave0P5qb5ZRSQsUVjfwFCMaMMrSQRoJSKWVpU=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 07 Jan 2025 18:05:38 +0100
Subject: [PATCH 2/2] platform/x86: firmware_attributes_class: Add test
 driver
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250107-pdx86-firmware-attributes-v1-2-9d75c04a3b52@weissschuh.net>
References: <20250107-pdx86-firmware-attributes-v1-0-9d75c04a3b52@weissschuh.net>
In-Reply-To: <20250107-pdx86-firmware-attributes-v1-0-9d75c04a3b52@weissschuh.net>
To: Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joshua Grisham <josh@joshuagrisham.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736269549; l=4401;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=v8v2bwASK20xizpHeRN3fIY6330Ur6fWSwRWF082iT8=;
 b=V7yWoSkmBka4u4h8tJQhlCci/yAwcYoP/YKl6/0+QUR4JtrPRLKuDOR0U0KgdhyoqpSd7hxaT
 t4L1NuigaX3A5mahTxK7c7cB9L/k2UPavTXmTna6qfPGdEU829R+g13
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The driver showcases the use of the new subsystem API.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/platform/x86/Kconfig                    | 12 ++++
 drivers/platform/x86/Makefile                   |  1 +
 drivers/platform/x86/firmware_attributes_test.c | 78 +++++++++++++++++++++++++
 3 files changed, 91 insertions(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 0258dd879d64be389f4dd9bc309fe089f23cc798..2a0e828657d2f07074944d6c42dc204fc8825a42 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1065,6 +1065,18 @@ source "drivers/platform/x86/x86-android-tablets/Kconfig"
 config FW_ATTR_CLASS
 	tristate
 
+config FW_ATTR_TEST
+	tristate "Firmware attribute test driver"
+	select FW_ATTR_CLASS
+	help
+	  This driver provides a test user of the firmware attribute subsystem.
+
+	  An instance is created at /sys/class/firmware-attributes/test/
+	  container various example attributes.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called firmware_attributes_test.
+
 config INTEL_IMR
 	bool "Intel Isolated Memory Region support"
 	depends on X86_INTEL_QUARK && IOSF_MBI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index e1b142947067475ee5472400a5a1cd20d79e12bd..610a1ca850a4353fd490e43b214a9e5872d2d28d 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -121,6 +121,7 @@ obj-$(CONFIG_TOPSTAR_LAPTOP)	+= topstar-laptop.o
 
 # Platform drivers
 obj-$(CONFIG_FW_ATTR_CLASS)		+= firmware_attributes_class.o
+obj-$(CONFIG_FW_ATTR_TEST)		+= firmware_attributes_test.o
 obj-$(CONFIG_SERIAL_MULTI_INSTANTIATE)	+= serial-multi-instantiate.o
 obj-$(CONFIG_MLX_PLATFORM)		+= mlx-platform.o
 obj-$(CONFIG_TOUCHSCREEN_DMI)		+= touchscreen_dmi.o
diff --git a/drivers/platform/x86/firmware_attributes_test.c b/drivers/platform/x86/firmware_attributes_test.c
new file mode 100644
index 0000000000000000000000000000000000000000..84f6a92e5163378c655f30ac022d513d7df5a18c
--- /dev/null
+++ b/drivers/platform/x86/firmware_attributes_test.c
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/module.h>
+#include <linux/sysfs.h>
+#include "firmware_attributes_class.h"
+
+struct fw_attr_test_data {
+	char attr1_value[PAGE_SIZE];
+};
+
+static ssize_t test_attr1_default_value_show(struct firmware_attributes_device *fwadev,
+					     const struct firmware_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "default 1\n");
+}
+
+static struct firmware_attribute test_attr1_default_value = __ATTR(default_value, 0444,
+								   test_attr1_default_value_show,
+								   NULL);
+
+static ssize_t test_attr1_current_value_show(struct firmware_attributes_device *fwadev,
+					     const struct firmware_attribute *attr, char *buf)
+{
+	struct fw_attr_test_data *data = fwadev->data;
+
+	return sysfs_emit(buf, "%s\n", data->attr1_value);
+}
+
+static ssize_t test_attr1_current_value_store(struct firmware_attributes_device *fwadev,
+					      const struct firmware_attribute *attr,
+					      const char *buf, size_t count)
+{
+	struct fw_attr_test_data *data = fwadev->data;
+
+	return strscpy(data->attr1_value, buf);
+}
+
+static struct firmware_attribute test_attr1_current_value = __ATTR(current_value, 0644,
+								   test_attr1_current_value_show,
+								   test_attr1_current_value_store);
+
+static struct attribute *test_attr1_attrs[] = {
+	firmware_attribute_type_string,
+	&test_attr1_default_value.attr,
+	&test_attr1_current_value.attr,
+	NULL
+};
+
+static const struct attribute_group test_attr1_group = {
+	.name	= "attr1",
+	.attrs	= test_attr1_attrs,
+};
+
+static const struct attribute_group *test_attr_groups[] = {
+	&test_attr1_group,
+	NULL
+};
+
+static struct firmware_attributes_device *fwadev;
+
+static int __init fw_test_init(void)
+{
+	static struct fw_attr_test_data data = {
+		.attr1_value = "attr1",
+	};
+
+	fwadev = firmware_attributes_device_register(NULL, "test", test_attr_groups, &data);
+	return PTR_ERR_OR_ZERO(fwadev);
+}
+module_init(fw_test_init);
+
+static void __exit fw_test_exit(void)
+{
+	firmware_attributes_device_unregister(fwadev);
+}
+module_exit(fw_test_exit);
+
+MODULE_LICENSE("GPL");

-- 
2.47.1

