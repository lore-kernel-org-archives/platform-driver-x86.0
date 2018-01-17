From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [patch v9 1/4] platform/x86: Move Mellanox hardware platform hotplug driver to platform/mellanox
Date: Wed, 17 Jan 2018 18:21:53 +0000
Message-ID: <1516213316-32278-2-git-send-email-vadimp@mellanox.com>
References: <1516213316-32278-1-git-send-email-vadimp@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1516213316-32278-1-git-send-email-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy.shevchenko@gmail.com, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us, Vadim Pasternak <vadimp@mellanox.com>
List-Id: platform-driver-x86.vger.kernel.org

It moves drivers/platform/x86/mlxcpld-hotplug.c to
drivers/platform/mellanox/mlxreg-hotplug.c and
include/linux/platform_data/mlxcpld-hotplug.h to
include/linux/platform_data/mlxreg.h for making hotplug driver usable for
the different machine architectures.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
v9->v8:
 Comments pointed out by Darren:
 - make removing of X86_64 dependency of mlx-platform to a separate patch
   since it is not related to the moving hotplug driver to
   platform/mellanox;
v7->v8:
v6->v7:
 Fixes added by Vadim:
 - remove dependency on X86_64 to allow also X86 architecture;
v5->v6:
 Fixes added by Vadim:
 - add SPD license record to Kconfig and Makefile;
v4->v5:
 Comments pointed out by Andy:
 - arrange MAINTAINERS in correct alphabetic order;
v3->v4:
 Comments pointed out by Darren:
 - Refactor the patches to provide the changes in patchset in incremental
   order;
 - Modify MAINTAINERS records;
 - Use git-mv for the replaced files;
  Commnets pointed out by Colin:
 - Make structures mlxplat_dev and mlxplat_hotplug static;
---
 MAINTAINERS                                        |   7 +-
 drivers/platform/Kconfig                           |   2 +
 drivers/platform/Makefile                          |   1 +
 drivers/platform/mellanox/Kconfig                  |  25 +++
 drivers/platform/mellanox/Makefile                 |   6 +
 .../mlxreg-hotplug.c}                              | 223 ++++++++++-----------
 drivers/platform/x86/Kconfig                       |   8 -
 drivers/platform/x86/Makefile                      |   1 -
 drivers/platform/x86/mlx-platform.c                |  18 +-
 .../platform_data/{mlxcpld-hotplug.h => mlxreg.h}  |  25 ++-
 10 files changed, 170 insertions(+), 146 deletions(-)
 create mode 100644 drivers/platform/mellanox/Kconfig
 create mode 100644 drivers/platform/mellanox/Makefile
 rename drivers/platform/{x86/mlxcpld-hotplug.c => mellanox/mlxreg-hotplug.c} (65%)
 rename include/linux/platform_data/{mlxcpld-hotplug.h => mlxreg.h} (84%)

diff --git a/MAINTAINERS b/MAINTAINERS
index bc4d776..c07e114 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8860,12 +8860,13 @@ W:	http://www.mellanox.com
 Q:	http://patchwork.ozlabs.org/project/netdev/list/
 F:	drivers/net/ethernet/mellanox/mlxfw/
 
-MELLANOX MLX CPLD HOTPLUG DRIVER
+MELLANOX HARDWARE PLATFORM SUPPORT
+M:	Andy Shevchenko <andy@infradead.org>
+M:	Darren Hart <dvhart@infradead.org>
 M:	Vadim Pasternak <vadimp@mellanox.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Supported
-F:	drivers/platform/x86/mlxcpld-hotplug.c
-F:	include/linux/platform_data/mlxcpld-hotplug.h
+F:	drivers/platform/mellanox/
 
 MELLANOX MLX4 core VPI driver
 M:	Tariq Toukan <tariqt@mellanox.com>
diff --git a/drivers/platform/Kconfig b/drivers/platform/Kconfig
index c11db8b..d4c2e42 100644
--- a/drivers/platform/Kconfig
+++ b/drivers/platform/Kconfig
@@ -8,3 +8,5 @@ endif
 source "drivers/platform/goldfish/Kconfig"
 
 source "drivers/platform/chrome/Kconfig"
+
+source "drivers/platform/mellanox/Kconfig"
diff --git a/drivers/platform/Makefile b/drivers/platform/Makefile
index d3a6630..4b2ce58 100644
--- a/drivers/platform/Makefile
+++ b/drivers/platform/Makefile
@@ -4,6 +4,7 @@
 #
 
 obj-$(CONFIG_X86)		+= x86/
+obj-$(CONFIG_MELLANOX_PLATFORM)	+= mellanox/
 obj-$(CONFIG_MIPS)		+= mips/
 obj-$(CONFIG_OLPC)		+= olpc/
 obj-$(CONFIG_GOLDFISH)		+= goldfish/
diff --git a/drivers/platform/mellanox/Kconfig b/drivers/platform/mellanox/Kconfig
new file mode 100644
index 0000000..d735292
--- /dev/null
+++ b/drivers/platform/mellanox/Kconfig
@@ -0,0 +1,25 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Platform support for Mellanox hardware
+#
+
+menuconfig MELLANOX_PLATFORM
+	bool "Platform support for Mellanox hardware"
+	depends on X86 || COMPILE_TEST
+	---help---
+	  Say Y here to get to see options for platform support for
+	  Mellanox systems. This option alone does not add any kernel code.
+
+	  If you say N, all options in this submenu will be skipped and disabled.
+
+if MELLANOX_PLATFORM
+
+config MLXREG_HOTPLUG
+	tristate "Mellanox platform hotplug driver support"
+	depends on HWMON
+	depends on I2C
+	---help---
+	  This driver handles hot-plug events for the power suppliers, power
+	  cables and fans on the wide range Mellanox IB and Ethernet systems.
+
+endif # MELLANOX_PLATFORM
diff --git a/drivers/platform/mellanox/Makefile b/drivers/platform/mellanox/Makefile
new file mode 100644
index 0000000..7c8385e
--- /dev/null
+++ b/drivers/platform/mellanox/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for linux/drivers/platform/mellanox
+# Mellanox Platform-Specific Drivers
+#
+obj-$(CONFIG_MLXREG_HOTPLUG)	+= mlxreg-hotplug.o
diff --git a/drivers/platform/x86/mlxcpld-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
similarity index 65%
rename from drivers/platform/x86/mlxcpld-hotplug.c
rename to drivers/platform/mellanox/mlxreg-hotplug.c
index aff3686..2866c76 100644
--- a/drivers/platform/x86/mlxcpld-hotplug.c
+++ b/drivers/platform/mellanox/mlxreg-hotplug.c
@@ -1,7 +1,6 @@
 /*
- * drivers/platform/x86/mlxcpld-hotplug.c
- * Copyright (c) 2016 Mellanox Technologies. All rights reserved.
- * Copyright (c) 2016 Vadim Pasternak <vadimp@mellanox.com>
+ * Copyright (c) 2017 Mellanox Technologies. All rights reserved.
+ * Copyright (c) 2017 Vadim Pasternak <vadimp@mellanox.com>
  *
  * Redistribution and use in source and binary forms, with or without
  * modification, are permitted provided that the following conditions are met:
@@ -40,39 +39,39 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/platform_data/mlxcpld-hotplug.h>
+#include <linux/platform_data/mlxreg.h>
 #include <linux/platform_device.h>
 #include <linux/spinlock.h>
 #include <linux/wait.h>
 #include <linux/workqueue.h>
 
 /* Offset of event and mask registers from status register */
-#define MLXCPLD_HOTPLUG_EVENT_OFF	1
-#define MLXCPLD_HOTPLUG_MASK_OFF	2
-#define MLXCPLD_HOTPLUG_AGGR_MASK_OFF	1
+#define MLXREG_HOTPLUG_EVENT_OFF	1
+#define MLXREG_HOTPLUG_MASK_OFF	2
+#define MLXREG_HOTPLUG_AGGR_MASK_OFF	1
 
-#define MLXCPLD_HOTPLUG_ATTRS_NUM	8
+#define MLXREG_HOTPLUG_ATTRS_NUM	8
 
 /**
- * enum mlxcpld_hotplug_attr_type - sysfs attributes for hotplug events:
- * @MLXCPLD_HOTPLUG_ATTR_TYPE_PSU: power supply unit attribute;
- * @MLXCPLD_HOTPLUG_ATTR_TYPE_PWR: power cable attribute;
- * @MLXCPLD_HOTPLUG_ATTR_TYPE_FAN: FAN drawer attribute;
+ * enum mlxreg_hotplug_attr_type - sysfs attributes for hotplug events:
+ * @MLXREG_HOTPLUG_ATTR_TYPE_PSU: power supply unit attribute;
+ * @MLXREG_HOTPLUG_ATTR_TYPE_PWR: power cable attribute;
+ * @MLXREG_HOTPLUG_ATTR_TYPE_FAN: FAN drawer attribute;
  */
-enum mlxcpld_hotplug_attr_type {
-	MLXCPLD_HOTPLUG_ATTR_TYPE_PSU,
-	MLXCPLD_HOTPLUG_ATTR_TYPE_PWR,
-	MLXCPLD_HOTPLUG_ATTR_TYPE_FAN,
+enum mlxreg_hotplug_attr_type {
+	MLXREG_HOTPLUG_ATTR_TYPE_PSU,
+	MLXREG_HOTPLUG_ATTR_TYPE_PWR,
+	MLXREG_HOTPLUG_ATTR_TYPE_FAN,
 };
 
 /**
- * struct mlxcpld_hotplug_priv_data - platform private data:
+ * struct mlxreg_hotplug_priv_data - platform private data:
  * @irq: platform interrupt number;
  * @pdev: platform device;
  * @plat: platform data;
  * @hwmon: hwmon device;
- * @mlxcpld_hotplug_attr: sysfs attributes array;
- * @mlxcpld_hotplug_dev_attr: sysfs sensor device attribute array;
+ * @mlxreg_hotplug_attr: sysfs attributes array;
+ * @mlxreg_hotplug_dev_attr: sysfs sensor device attribute array;
  * @group: sysfs attribute group;
  * @groups: list of sysfs attribute group for hwmon registration;
  * @dwork: delayed work template;
@@ -82,14 +81,14 @@ enum mlxcpld_hotplug_attr_type {
  * @pwr_cache: last value of power register status;
  * @fan_cache: last value of FAN register status;
  */
-struct mlxcpld_hotplug_priv_data {
+struct mlxreg_hotplug_priv_data {
 	int irq;
 	struct platform_device *pdev;
-	struct mlxcpld_hotplug_platform_data *plat;
+	struct mlxreg_hotplug_platform_data *plat;
 	struct device *hwmon;
-	struct attribute *mlxcpld_hotplug_attr[MLXCPLD_HOTPLUG_ATTRS_NUM + 1];
+	struct attribute *mlxreg_hotplug_attr[MLXREG_HOTPLUG_ATTRS_NUM + 1];
 	struct sensor_device_attribute_2
-			mlxcpld_hotplug_dev_attr[MLXCPLD_HOTPLUG_ATTRS_NUM];
+			mlxreg_hotplug_dev_attr[MLXREG_HOTPLUG_ATTRS_NUM];
 	struct attribute_group group;
 	const struct attribute_group *groups[2];
 	struct delayed_work dwork;
@@ -100,29 +99,29 @@ struct mlxcpld_hotplug_priv_data {
 	u8 fan_cache;
 };
 
-static ssize_t mlxcpld_hotplug_attr_show(struct device *dev,
-					 struct device_attribute *attr,
-					 char *buf)
+static ssize_t mlxreg_hotplug_attr_show(struct device *dev,
+					struct device_attribute *attr,
+					char *buf)
 {
 	struct platform_device *pdev = to_platform_device(dev);
-	struct mlxcpld_hotplug_priv_data *priv = platform_get_drvdata(pdev);
+	struct mlxreg_hotplug_priv_data *priv = platform_get_drvdata(pdev);
 	int index = to_sensor_dev_attr_2(attr)->index;
 	int nr = to_sensor_dev_attr_2(attr)->nr;
 	u8 reg_val = 0;
 
 	switch (nr) {
-	case MLXCPLD_HOTPLUG_ATTR_TYPE_PSU:
+	case MLXREG_HOTPLUG_ATTR_TYPE_PSU:
 		/* Bit = 0 : PSU is present. */
 		reg_val = !!!(inb(priv->plat->psu_reg_offset) & BIT(index));
 		break;
 
-	case MLXCPLD_HOTPLUG_ATTR_TYPE_PWR:
+	case MLXREG_HOTPLUG_ATTR_TYPE_PWR:
 		/* Bit = 1 : power cable is attached. */
 		reg_val = !!(inb(priv->plat->pwr_reg_offset) & BIT(index %
 						priv->plat->pwr_count));
 		break;
 
-	case MLXCPLD_HOTPLUG_ATTR_TYPE_FAN:
+	case MLXREG_HOTPLUG_ATTR_TYPE_FAN:
 		/* Bit = 0 : FAN is present. */
 		reg_val = !!!(inb(priv->plat->fan_reg_offset) & BIT(index %
 						priv->plat->fan_count));
@@ -132,9 +131,9 @@ static ssize_t mlxcpld_hotplug_attr_show(struct device *dev,
 	return sprintf(buf, "%u\n", reg_val);
 }
 
-#define PRIV_ATTR(i) priv->mlxcpld_hotplug_attr[i]
-#define PRIV_DEV_ATTR(i) priv->mlxcpld_hotplug_dev_attr[i]
-static int mlxcpld_hotplug_attr_init(struct mlxcpld_hotplug_priv_data *priv)
+#define PRIV_ATTR(i) priv->mlxreg_hotplug_attr[i]
+#define PRIV_DEV_ATTR(i) priv->mlxreg_hotplug_dev_attr[i]
+static int mlxreg_hotplug_attr_init(struct mlxreg_hotplug_priv_data *priv)
 {
 	int num_attrs = priv->plat->psu_count + priv->plat->pwr_count +
 			priv->plat->fan_count;
@@ -152,17 +151,17 @@ static int mlxcpld_hotplug_attr_init(struct mlxcpld_hotplug_priv_data *priv)
 		if (i < priv->plat->psu_count) {
 			PRIV_ATTR(i)->name = devm_kasprintf(&priv->pdev->dev,
 						GFP_KERNEL, "psu%u", i + 1);
-			PRIV_DEV_ATTR(i).nr = MLXCPLD_HOTPLUG_ATTR_TYPE_PSU;
+			PRIV_DEV_ATTR(i).nr = MLXREG_HOTPLUG_ATTR_TYPE_PSU;
 		} else if (i < priv->plat->psu_count + priv->plat->pwr_count) {
 			PRIV_ATTR(i)->name = devm_kasprintf(&priv->pdev->dev,
 						GFP_KERNEL, "pwr%u", i %
 						priv->plat->pwr_count + 1);
-			PRIV_DEV_ATTR(i).nr = MLXCPLD_HOTPLUG_ATTR_TYPE_PWR;
+			PRIV_DEV_ATTR(i).nr = MLXREG_HOTPLUG_ATTR_TYPE_PWR;
 		} else {
 			PRIV_ATTR(i)->name = devm_kasprintf(&priv->pdev->dev,
 						GFP_KERNEL, "fan%u", i %
 						priv->plat->fan_count + 1);
-			PRIV_DEV_ATTR(i).nr = MLXCPLD_HOTPLUG_ATTR_TYPE_FAN;
+			PRIV_DEV_ATTR(i).nr = MLXREG_HOTPLUG_ATTR_TYPE_FAN;
 		}
 
 		if (!PRIV_ATTR(i)->name) {
@@ -173,20 +172,20 @@ static int mlxcpld_hotplug_attr_init(struct mlxcpld_hotplug_priv_data *priv)
 
 		PRIV_DEV_ATTR(i).dev_attr.attr.name = PRIV_ATTR(i)->name;
 		PRIV_DEV_ATTR(i).dev_attr.attr.mode = S_IRUGO;
-		PRIV_DEV_ATTR(i).dev_attr.show = mlxcpld_hotplug_attr_show;
+		PRIV_DEV_ATTR(i).dev_attr.show = mlxreg_hotplug_attr_show;
 		PRIV_DEV_ATTR(i).index = i;
 		sysfs_attr_init(&PRIV_DEV_ATTR(i).dev_attr.attr);
 	}
 
-	priv->group.attrs = priv->mlxcpld_hotplug_attr;
+	priv->group.attrs = priv->mlxreg_hotplug_attr;
 	priv->groups[0] = &priv->group;
 	priv->groups[1] = NULL;
 
 	return 0;
 }
 
-static int mlxcpld_hotplug_device_create(struct device *dev,
-					 struct mlxcpld_hotplug_device *item)
+static int mlxreg_hotplug_device_create(struct device *dev,
+					struct mlxreg_hotplug_device *item)
 {
 	item->adapter = i2c_get_adapter(item->bus);
 	if (!item->adapter) {
@@ -207,7 +206,7 @@ static int mlxcpld_hotplug_device_create(struct device *dev,
 	return 0;
 }
 
-static void mlxcpld_hotplug_device_destroy(struct mlxcpld_hotplug_device *item)
+static void mlxreg_hotplug_device_destroy(struct mlxreg_hotplug_device *item)
 {
 	if (item->client) {
 		i2c_unregister_device(item->client);
@@ -221,15 +220,15 @@ static void mlxcpld_hotplug_device_destroy(struct mlxcpld_hotplug_device *item)
 }
 
 static inline void
-mlxcpld_hotplug_work_helper(struct device *dev,
-			    struct mlxcpld_hotplug_device *item, u8 is_inverse,
-			    u16 offset, u8 mask, u8 *cache)
+mlxreg_hotplug_work_helper(struct device *dev,
+			   struct mlxreg_hotplug_device *item, u8 is_inverse,
+			   u16 offset, u8 mask, u8 *cache)
 {
 	u8 val, asserted;
 	int bit;
 
 	/* Mask event. */
-	outb(0, offset + MLXCPLD_HOTPLUG_MASK_OFF);
+	outb(0, offset + MLXREG_HOTPLUG_MASK_OFF);
 	/* Read status. */
 	val = inb(offset) & mask;
 	asserted = *cache ^ val;
@@ -251,25 +250,25 @@ mlxcpld_hotplug_work_helper(struct device *dev,
 	for_each_set_bit(bit, (unsigned long *)&asserted, 8) {
 		if (val & BIT(bit)) {
 			if (is_inverse)
-				mlxcpld_hotplug_device_destroy(item + bit);
+				mlxreg_hotplug_device_destroy(item + bit);
 			else
-				mlxcpld_hotplug_device_create(dev, item + bit);
+				mlxreg_hotplug_device_create(dev, item + bit);
 		} else {
 			if (is_inverse)
-				mlxcpld_hotplug_device_create(dev, item + bit);
+				mlxreg_hotplug_device_create(dev, item + bit);
 			else
-				mlxcpld_hotplug_device_destroy(item + bit);
+				mlxreg_hotplug_device_destroy(item + bit);
 		}
 	}
 
 	/* Acknowledge event. */
-	outb(0, offset + MLXCPLD_HOTPLUG_EVENT_OFF);
+	outb(0, offset + MLXREG_HOTPLUG_EVENT_OFF);
 	/* Unmask event. */
-	outb(mask, offset + MLXCPLD_HOTPLUG_MASK_OFF);
+	outb(mask, offset + MLXREG_HOTPLUG_MASK_OFF);
 }
 
 /*
- * mlxcpld_hotplug_work_handler - performs traversing of CPLD interrupt
+ * mlxreg_hotplug_work_handler - performs traversing of CPLD interrupt
  * registers according to the below hierarchy schema:
  *
  *                   Aggregation registers (status/mask)
@@ -289,15 +288,15 @@ mlxcpld_hotplug_work_helper(struct device *dev,
  * In case some system changed are detected: FAN in/out, PSU in/out, power
  * cable attached/detached, relevant device is created or destroyed.
  */
-static void mlxcpld_hotplug_work_handler(struct work_struct *work)
+static void mlxreg_hotplug_work_handler(struct work_struct *work)
 {
-	struct mlxcpld_hotplug_priv_data *priv = container_of(work,
-				struct mlxcpld_hotplug_priv_data, dwork.work);
+	struct mlxreg_hotplug_priv_data *priv = container_of(work,
+				struct mlxreg_hotplug_priv_data, dwork.work);
 	u8 val, aggr_asserted;
 	unsigned long flags;
 
 	/* Mask aggregation event. */
-	outb(0, priv->plat->top_aggr_offset + MLXCPLD_HOTPLUG_AGGR_MASK_OFF);
+	outb(0, priv->plat->top_aggr_offset + MLXREG_HOTPLUG_AGGR_MASK_OFF);
 	/* Read aggregation status. */
 	val = inb(priv->plat->top_aggr_offset) & priv->plat->top_aggr_mask;
 	aggr_asserted = priv->aggr_cache ^ val;
@@ -305,31 +304,31 @@ static void mlxcpld_hotplug_work_handler(struct work_struct *work)
 
 	/* Handle PSU configuration changes. */
 	if (aggr_asserted & priv->plat->top_aggr_psu_mask)
-		mlxcpld_hotplug_work_helper(&priv->pdev->dev, priv->plat->psu,
-					    1, priv->plat->psu_reg_offset,
-					    priv->plat->psu_mask,
-					    &priv->psu_cache);
+		mlxreg_hotplug_work_helper(&priv->pdev->dev, priv->plat->psu,
+					   1, priv->plat->psu_reg_offset,
+					   priv->plat->psu_mask,
+					   &priv->psu_cache);
 
 	/* Handle power cable configuration changes. */
 	if (aggr_asserted & priv->plat->top_aggr_pwr_mask)
-		mlxcpld_hotplug_work_helper(&priv->pdev->dev, priv->plat->pwr,
-					    0, priv->plat->pwr_reg_offset,
-					    priv->plat->pwr_mask,
-					    &priv->pwr_cache);
+		mlxreg_hotplug_work_helper(&priv->pdev->dev, priv->plat->pwr,
+					   0, priv->plat->pwr_reg_offset,
+					   priv->plat->pwr_mask,
+					   &priv->pwr_cache);
 
 	/* Handle FAN configuration changes. */
 	if (aggr_asserted & priv->plat->top_aggr_fan_mask)
-		mlxcpld_hotplug_work_helper(&priv->pdev->dev, priv->plat->fan,
-					    1, priv->plat->fan_reg_offset,
-					    priv->plat->fan_mask,
-					    &priv->fan_cache);
+		mlxreg_hotplug_work_helper(&priv->pdev->dev, priv->plat->fan,
+					   1, priv->plat->fan_reg_offset,
+					   priv->plat->fan_mask,
+					   &priv->fan_cache);
 
 	if (aggr_asserted) {
 		spin_lock_irqsave(&priv->lock, flags);
 
 		/*
 		 * It is possible, that some signals have been inserted, while
-		 * interrupt has been masked by mlxcpld_hotplug_work_handler.
+		 * interrupt has been masked by mlxreg_hotplug_work_handler.
 		 * In this case such signals will be missed. In order to handle
 		 * these signals delayed work is canceled and work task
 		 * re-scheduled for immediate execution. It allows to handle
@@ -347,42 +346,42 @@ static void mlxcpld_hotplug_work_handler(struct work_struct *work)
 
 	/* Unmask aggregation event (no need acknowledge). */
 	outb(priv->plat->top_aggr_mask, priv->plat->top_aggr_offset +
-						MLXCPLD_HOTPLUG_AGGR_MASK_OFF);
+						MLXREG_HOTPLUG_AGGR_MASK_OFF);
 }
 
-static void mlxcpld_hotplug_set_irq(struct mlxcpld_hotplug_priv_data *priv)
+static void mlxreg_hotplug_set_irq(struct mlxreg_hotplug_priv_data *priv)
 {
 	/* Clear psu presense event. */
-	outb(0, priv->plat->psu_reg_offset + MLXCPLD_HOTPLUG_EVENT_OFF);
+	outb(0, priv->plat->psu_reg_offset + MLXREG_HOTPLUG_EVENT_OFF);
 	/* Set psu initial status as mask and unmask psu event. */
 	priv->psu_cache = priv->plat->psu_mask;
 	outb(priv->plat->psu_mask, priv->plat->psu_reg_offset +
-						MLXCPLD_HOTPLUG_MASK_OFF);
+						MLXREG_HOTPLUG_MASK_OFF);
 
 	/* Clear power cable event. */
-	outb(0, priv->plat->pwr_reg_offset + MLXCPLD_HOTPLUG_EVENT_OFF);
+	outb(0, priv->plat->pwr_reg_offset + MLXREG_HOTPLUG_EVENT_OFF);
 	/* Keep power initial status as zero and unmask power event. */
 	outb(priv->plat->pwr_mask, priv->plat->pwr_reg_offset +
-						MLXCPLD_HOTPLUG_MASK_OFF);
+						MLXREG_HOTPLUG_MASK_OFF);
 
 	/* Clear fan presense event. */
-	outb(0, priv->plat->fan_reg_offset + MLXCPLD_HOTPLUG_EVENT_OFF);
+	outb(0, priv->plat->fan_reg_offset + MLXREG_HOTPLUG_EVENT_OFF);
 	/* Set fan initial status as mask and unmask fan event. */
 	priv->fan_cache = priv->plat->fan_mask;
 	outb(priv->plat->fan_mask, priv->plat->fan_reg_offset +
-						MLXCPLD_HOTPLUG_MASK_OFF);
+						MLXREG_HOTPLUG_MASK_OFF);
 
 	/* Keep aggregation initial status as zero and unmask events. */
 	outb(priv->plat->top_aggr_mask, priv->plat->top_aggr_offset +
-						MLXCPLD_HOTPLUG_AGGR_MASK_OFF);
+						MLXREG_HOTPLUG_AGGR_MASK_OFF);
 
 	/* Invoke work handler for initializing hot plug devices setting. */
-	mlxcpld_hotplug_work_handler(&priv->dwork.work);
+	mlxreg_hotplug_work_handler(&priv->dwork.work);
 
 	enable_irq(priv->irq);
 }
 
-static void mlxcpld_hotplug_unset_irq(struct mlxcpld_hotplug_priv_data *priv)
+static void mlxreg_hotplug_unset_irq(struct mlxreg_hotplug_priv_data *priv)
 {
 	int i;
 
@@ -390,38 +389,38 @@ static void mlxcpld_hotplug_unset_irq(struct mlxcpld_hotplug_priv_data *priv)
 	cancel_delayed_work_sync(&priv->dwork);
 
 	/* Mask aggregation event. */
-	outb(0, priv->plat->top_aggr_offset + MLXCPLD_HOTPLUG_AGGR_MASK_OFF);
+	outb(0, priv->plat->top_aggr_offset + MLXREG_HOTPLUG_AGGR_MASK_OFF);
 
 	/* Mask psu presense event. */
-	outb(0, priv->plat->psu_reg_offset + MLXCPLD_HOTPLUG_MASK_OFF);
+	outb(0, priv->plat->psu_reg_offset + MLXREG_HOTPLUG_MASK_OFF);
 	/* Clear psu presense event. */
-	outb(0, priv->plat->psu_reg_offset + MLXCPLD_HOTPLUG_EVENT_OFF);
+	outb(0, priv->plat->psu_reg_offset + MLXREG_HOTPLUG_EVENT_OFF);
 
 	/* Mask power cable event. */
-	outb(0, priv->plat->pwr_reg_offset + MLXCPLD_HOTPLUG_MASK_OFF);
+	outb(0, priv->plat->pwr_reg_offset + MLXREG_HOTPLUG_MASK_OFF);
 	/* Clear power cable event. */
-	outb(0, priv->plat->pwr_reg_offset + MLXCPLD_HOTPLUG_EVENT_OFF);
+	outb(0, priv->plat->pwr_reg_offset + MLXREG_HOTPLUG_EVENT_OFF);
 
 	/* Mask fan presense event. */
-	outb(0, priv->plat->fan_reg_offset + MLXCPLD_HOTPLUG_MASK_OFF);
+	outb(0, priv->plat->fan_reg_offset + MLXREG_HOTPLUG_MASK_OFF);
 	/* Clear fan presense event. */
-	outb(0, priv->plat->fan_reg_offset + MLXCPLD_HOTPLUG_EVENT_OFF);
+	outb(0, priv->plat->fan_reg_offset + MLXREG_HOTPLUG_EVENT_OFF);
 
 	/* Remove all the attached devices. */
 	for (i = 0; i < priv->plat->psu_count; i++)
-		mlxcpld_hotplug_device_destroy(priv->plat->psu + i);
+		mlxreg_hotplug_device_destroy(priv->plat->psu + i);
 
 	for (i = 0; i < priv->plat->pwr_count; i++)
-		mlxcpld_hotplug_device_destroy(priv->plat->pwr + i);
+		mlxreg_hotplug_device_destroy(priv->plat->pwr + i);
 
 	for (i = 0; i < priv->plat->fan_count; i++)
-		mlxcpld_hotplug_device_destroy(priv->plat->fan + i);
+		mlxreg_hotplug_device_destroy(priv->plat->fan + i);
 }
 
-static irqreturn_t mlxcpld_hotplug_irq_handler(int irq, void *dev)
+static irqreturn_t mlxreg_hotplug_irq_handler(int irq, void *dev)
 {
-	struct mlxcpld_hotplug_priv_data *priv =
-				(struct mlxcpld_hotplug_priv_data *)dev;
+	struct mlxreg_hotplug_priv_data *priv =
+				(struct mlxreg_hotplug_priv_data *)dev;
 
 	/* Schedule work task for immediate execution.*/
 	schedule_delayed_work(&priv->dwork, 0);
@@ -429,10 +428,10 @@ static irqreturn_t mlxcpld_hotplug_irq_handler(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
-static int mlxcpld_hotplug_probe(struct platform_device *pdev)
+static int mlxreg_hotplug_probe(struct platform_device *pdev)
 {
-	struct mlxcpld_hotplug_platform_data *pdata;
-	struct mlxcpld_hotplug_priv_data *priv;
+	struct mlxreg_hotplug_platform_data *pdata;
+	struct mlxreg_hotplug_priv_data *priv;
 	int err;
 
 	pdata = dev_get_platdata(&pdev->dev);
@@ -456,25 +455,25 @@ static int mlxcpld_hotplug_probe(struct platform_device *pdev)
 	}
 
 	err = devm_request_irq(&pdev->dev, priv->irq,
-				mlxcpld_hotplug_irq_handler, 0, pdev->name,
-				priv);
+			       mlxreg_hotplug_irq_handler, 0, pdev->name,
+			       priv);
 	if (err) {
 		dev_err(&pdev->dev, "Failed to request irq: %d\n", err);
 		return err;
 	}
 	disable_irq(priv->irq);
 
-	INIT_DELAYED_WORK(&priv->dwork, mlxcpld_hotplug_work_handler);
+	INIT_DELAYED_WORK(&priv->dwork, mlxreg_hotplug_work_handler);
 	spin_lock_init(&priv->lock);
 
-	err = mlxcpld_hotplug_attr_init(priv);
+	err = mlxreg_hotplug_attr_init(priv);
 	if (err) {
 		dev_err(&pdev->dev, "Failed to allocate attributes: %d\n", err);
 		return err;
 	}
 
 	priv->hwmon = devm_hwmon_device_register_with_groups(&pdev->dev,
-					"mlxcpld_hotplug", priv, priv->groups);
+					"mlxreg_hotplug", priv, priv->groups);
 	if (IS_ERR(priv->hwmon)) {
 		dev_err(&pdev->dev, "Failed to register hwmon device %ld\n",
 			PTR_ERR(priv->hwmon));
@@ -484,32 +483,32 @@ static int mlxcpld_hotplug_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, priv);
 
 	/* Perform initial interrupts setup. */
-	mlxcpld_hotplug_set_irq(priv);
+	mlxreg_hotplug_set_irq(priv);
 
 	return 0;
 }
 
-static int mlxcpld_hotplug_remove(struct platform_device *pdev)
+static int mlxreg_hotplug_remove(struct platform_device *pdev)
 {
-	struct mlxcpld_hotplug_priv_data *priv = platform_get_drvdata(pdev);
+	struct mlxreg_hotplug_priv_data *priv = platform_get_drvdata(pdev);
 
 	/* Clean interrupts setup. */
-	mlxcpld_hotplug_unset_irq(priv);
+	mlxreg_hotplug_unset_irq(priv);
 
 	return 0;
 }
 
-static struct platform_driver mlxcpld_hotplug_driver = {
+static struct platform_driver mlxreg_hotplug_driver = {
 	.driver = {
-		.name = "mlxcpld-hotplug",
+		.name = "mlxreg-hotplug",
 	},
-	.probe = mlxcpld_hotplug_probe,
-	.remove = mlxcpld_hotplug_remove,
+	.probe = mlxreg_hotplug_probe,
+	.remove = mlxreg_hotplug_remove,
 };
 
-module_platform_driver(mlxcpld_hotplug_driver);
+module_platform_driver(mlxreg_hotplug_driver);
 
 MODULE_AUTHOR("Vadim Pasternak <vadimp@mellanox.com>");
-MODULE_DESCRIPTION("Mellanox CPLD hotplug platform driver");
+MODULE_DESCRIPTION("Mellanox regmap hotplug platform driver");
 MODULE_LICENSE("Dual BSD/GPL");
-MODULE_ALIAS("platform:mlxcpld-hotplug");
+MODULE_ALIAS("platform:mlxreg-hotplug");
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index b9b40e3..c442d5c 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1166,14 +1166,6 @@ config MLX_PLATFORM
 
 	  If you have a Mellanox system, say Y or M here.
 
-config MLX_CPLD_PLATFORM
-	tristate "Mellanox platform hotplug driver support"
-	select HWMON
-	select I2C
-	---help---
-	  This driver handles hot-plug events for the power suppliers, power
-	  cables and fans on the wide range Mellanox IB and Ethernet systems.
-
 config INTEL_TURBO_MAX_3
 	bool "Intel Turbo Boost Max Technology 3.0 enumeration driver"
 	depends on X86_64 && SCHED_MC_PRIO
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 57f37e5..c388608 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -88,6 +88,5 @@ obj-$(CONFIG_INTEL_TELEMETRY)	+= intel_telemetry_core.o \
 obj-$(CONFIG_INTEL_PMC_CORE)    += intel_pmc_core.o
 obj-$(CONFIG_PMC_ATOM)		+= pmc_atom.o
 obj-$(CONFIG_MLX_PLATFORM)	+= mlx-platform.o
-obj-$(CONFIG_MLX_CPLD_PLATFORM)	+= mlxcpld-hotplug.o
 obj-$(CONFIG_INTEL_TURBO_MAX_3) += intel_turbo_max_3.o
 obj-$(CONFIG_INTEL_CHTDC_TI_PWRBTN)	+= intel_chtdc_ti_pwrbtn.o
diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 504256c..0fbec1f 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -38,7 +38,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/platform_data/i2c-mux-reg.h>
-#include <linux/platform_data/mlxcpld-hotplug.h>
+#include <linux/platform_data/mlxreg.h>
 
 #define MLX_PLAT_DEVICE_NAME		"mlxplat"
 
@@ -138,7 +138,7 @@ static struct i2c_mux_reg_platform_data mlxplat_mux_data[] = {
 };
 
 /* Platform hotplug devices */
-static struct mlxcpld_hotplug_device mlxplat_mlxcpld_psu[] = {
+static struct mlxreg_hotplug_device mlxplat_mlxcpld_psu[] = {
 	{
 		.brdinfo = { I2C_BOARD_INFO("24c02", 0x51) },
 		.bus = 10,
@@ -149,7 +149,7 @@ static struct mlxcpld_hotplug_device mlxplat_mlxcpld_psu[] = {
 	},
 };
 
-static struct mlxcpld_hotplug_device mlxplat_mlxcpld_pwr[] = {
+static struct mlxreg_hotplug_device mlxplat_mlxcpld_pwr[] = {
 	{
 		.brdinfo = { I2C_BOARD_INFO("dps460", 0x59) },
 		.bus = 10,
@@ -160,7 +160,7 @@ static struct mlxcpld_hotplug_device mlxplat_mlxcpld_pwr[] = {
 	},
 };
 
-static struct mlxcpld_hotplug_device mlxplat_mlxcpld_fan[] = {
+static struct mlxreg_hotplug_device mlxplat_mlxcpld_fan[] = {
 	{
 		.brdinfo = { I2C_BOARD_INFO("24c32", 0x50) },
 		.bus = 11,
@@ -181,7 +181,7 @@ static struct mlxcpld_hotplug_device mlxplat_mlxcpld_fan[] = {
 
 /* Platform hotplug default data */
 static
-struct mlxcpld_hotplug_platform_data mlxplat_mlxcpld_default_data = {
+struct mlxreg_hotplug_platform_data mlxplat_mlxcpld_default_data = {
 	.top_aggr_offset = MLXPLAT_CPLD_LPC_REG_AGGR_ADRR,
 	.top_aggr_mask = MLXPLAT_CPLD_AGGR_MASK_DEF,
 	.top_aggr_psu_mask = MLXPLAT_CPLD_AGGR_PSU_MASK_DEF,
@@ -203,7 +203,7 @@ struct mlxcpld_hotplug_platform_data mlxplat_mlxcpld_default_data = {
 
 /* Platform hotplug MSN21xx system family data */
 static
-struct mlxcpld_hotplug_platform_data mlxplat_mlxcpld_msn21xx_data = {
+struct mlxreg_hotplug_platform_data mlxplat_mlxcpld_msn21xx_data = {
 	.top_aggr_offset = MLXPLAT_CPLD_LPC_REG_AGGR_ADRR,
 	.top_aggr_mask = MLXPLAT_CPLD_AGGR_MASK_MSN21XX,
 	.top_aggr_pwr_mask = MLXPLAT_CPLD_AGGR_MASK_MSN21XX,
@@ -213,11 +213,11 @@ struct mlxcpld_hotplug_platform_data mlxplat_mlxcpld_msn21xx_data = {
 };
 
 static struct resource mlxplat_mlxcpld_resources[] = {
-	[0] = DEFINE_RES_IRQ_NAMED(17, "mlxcpld-hotplug"),
+	[0] = DEFINE_RES_IRQ_NAMED(17, "mlxreg-hotplug"),
 };
 
 static struct platform_device *mlxplat_dev;
-static struct mlxcpld_hotplug_platform_data *mlxplat_hotplug;
+static struct mlxreg_hotplug_platform_data *mlxplat_hotplug;
 
 static int __init mlxplat_dmi_default_matched(const struct dmi_system_id *dmi)
 {
@@ -329,7 +329,7 @@ static int __init mlxplat_init(void)
 	}
 
 	priv->pdev_hotplug = platform_device_register_resndata(
-				&mlxplat_dev->dev, "mlxcpld-hotplug",
+				&mlxplat_dev->dev, "mlxreg-hotplug",
 				PLATFORM_DEVID_NONE,
 				mlxplat_mlxcpld_resources,
 				ARRAY_SIZE(mlxplat_mlxcpld_resources),
diff --git a/include/linux/platform_data/mlxcpld-hotplug.h b/include/linux/platform_data/mlxreg.h
similarity index 84%
rename from include/linux/platform_data/mlxcpld-hotplug.h
rename to include/linux/platform_data/mlxreg.h
index e4cfcff..8dcbb8e 100644
--- a/include/linux/platform_data/mlxcpld-hotplug.h
+++ b/include/linux/platform_data/mlxreg.h
@@ -1,7 +1,6 @@
 /*
- * include/linux/platform_data/mlxcpld-hotplug.h
- * Copyright (c) 2016 Mellanox Technologies. All rights reserved.
- * Copyright (c) 2016 Vadim Pasternak <vadimp@mellanox.com>
+ * Copyright (c) 2017 Mellanox Technologies. All rights reserved.
+ * Copyright (c) 2017 Vadim Pasternak <vadimp@mellanox.com>
  *
  * Redistribution and use in source and binary forms, with or without
  * modification, are permitted provided that the following conditions are met:
@@ -32,11 +31,11 @@
  * POSSIBILITY OF SUCH DAMAGE.
  */
 
-#ifndef __LINUX_PLATFORM_DATA_MLXCPLD_HOTPLUG_H
-#define __LINUX_PLATFORM_DATA_MLXCPLD_HOTPLUG_H
+#ifndef __LINUX_PLATFORM_DATA_MLXREG_H
+#define __LINUX_PLATFORM_DATA_MLXREG_H
 
 /**
- * struct mlxcpld_hotplug_device - I2C device data:
+ * struct mlxreg_hotplug_device - I2C device data:
  * @adapter: I2C device adapter;
  * @client: I2C device client;
  * @brdinfo: device board information;
@@ -45,7 +44,7 @@
  * Structure represents I2C hotplug device static data (board topology) and
  * dynamic data (related kernel objects handles).
  */
-struct mlxcpld_hotplug_device {
+struct mlxreg_hotplug_device {
 	struct i2c_adapter *adapter;
 	struct i2c_client *client;
 	struct i2c_board_info brdinfo;
@@ -53,7 +52,7 @@ struct mlxcpld_hotplug_device {
 };
 
 /**
- * struct mlxcpld_hotplug_platform_data - device platform data:
+ * struct mlxreg_hotplug_platform_data - device platform data:
  * @top_aggr_offset: offset of top aggregation interrupt register;
  * @top_aggr_mask: top aggregation interrupt common mask;
  * @top_aggr_psu_mask: top aggregation interrupt PSU mask;
@@ -76,24 +75,24 @@ struct mlxcpld_hotplug_device {
  * like FAN, PSU, power cable insertion and removing. This data provides the
  * number of hot-pluggable devices and hardware description for event handling.
  */
-struct mlxcpld_hotplug_platform_data {
+struct mlxreg_hotplug_platform_data {
 	u16 top_aggr_offset;
 	u8 top_aggr_mask;
 	u8 top_aggr_psu_mask;
 	u16 psu_reg_offset;
 	u8 psu_mask;
 	u8 psu_count;
-	struct mlxcpld_hotplug_device *psu;
+	struct mlxreg_hotplug_device *psu;
 	u8 top_aggr_pwr_mask;
 	u16 pwr_reg_offset;
 	u8 pwr_mask;
 	u8 pwr_count;
-	struct mlxcpld_hotplug_device *pwr;
+	struct mlxreg_hotplug_device *pwr;
 	u8 top_aggr_fan_mask;
 	u16 fan_reg_offset;
 	u8 fan_mask;
 	u8 fan_count;
-	struct mlxcpld_hotplug_device *fan;
+	struct mlxreg_hotplug_device *fan;
 };
 
-#endif /* __LINUX_PLATFORM_DATA_MLXCPLD_HOTPLUG_H */
+#endif /* __LINUX_PLATFORM_DATA_MLXREG_H */
-- 
2.1.4
