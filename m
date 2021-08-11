Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08312C432BE
	for <platform-driver-x86@archiver.kernel.org>; Wed, 11 Aug 2021 12:37:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD19B610A2
	for <platform-driver-x86@archiver.kernel.org>; Wed, 11 Aug 2021 12:37:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230054AbhHKMhi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 11 Aug 2021 08:37:38 -0400
Received: from mga05.intel.com ([192.55.52.43]:39987 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230101AbhHKMhi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 11 Aug 2021 08:37:38 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10072"; a="300702506"
X-IronPort-AV: E=Sophos;i="5.84,311,1620716400"; 
   d="scan'208";a="300702506"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2021 05:37:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,311,1620716400"; 
   d="scan'208";a="484850633"
Received: from intel-tiger-lake-client-platform.iind.intel.com ([10.224.178.120])
  by fmsmga008.fm.intel.com with ESMTP; 11 Aug 2021 05:37:12 -0700
From:   Shravan S <s.shravan@intel.com>
To:     hdegoede@redhat.com, mgross@linux.intel.com,
        platform-driver-x86@vger.kernel.org
Cc:     sudhakar.an@intel.com, s.shravan@intel.com
Subject: [PATCH V5 1/1] platform/x86: BIOS SAR driver for Intel M.2 Modem
Date:   Wed, 11 Aug 2021 18:06:07 +0530
Message-Id: <20210811123607.14169-2-s.shravan@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210811123607.14169-1-s.shravan@intel.com>
References: <20210811123607.14169-1-s.shravan@intel.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Dynamic BIOS SAR driver exposing dynamic SAR information from BIOS

The Dynamic SAR (Specific Absorption Rate) driver uses ACPI DSM
(Device Specific Method) to communicate with BIOS and retrieve
dynamic SAR information and change notifications. The driver uses
sysfs to expose this data to userspace via read and notify.

Sysfs interface is documented in detail under:
Documentation/ABI/testing/sysfs-driver-intc_sar

Signed-off-by: Shravan S <s.shravan@intel.com>
---
V5 :
* Code changes based on review comments.
* Location of file moved to intel folder.

---
 .../ABI/testing/sysfs-driver-intc_sar         |  57 ++++
 MAINTAINERS                                   |   7 +
 drivers/platform/x86/intel/Kconfig            |   1 +
 drivers/platform/x86/intel/Makefile           |   1 +
 drivers/platform/x86/intel/int1092/Kconfig    |  14 +
 drivers/platform/x86/intel/int1092/Makefile   |   1 +
 .../platform/x86/intel/int1092/intel_sar.c    | 319 ++++++++++++++++++
 .../platform/x86/intel/int1092/intel_sar.h    |  86 +++++
 8 files changed, 486 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-intc_sar
 create mode 100644 drivers/platform/x86/intel/int1092/Kconfig
 create mode 100644 drivers/platform/x86/intel/int1092/Makefile
 create mode 100644 drivers/platform/x86/intel/int1092/intel_sar.c
 create mode 100644 drivers/platform/x86/intel/int1092/intel_sar.h

diff --git a/Documentation/ABI/testing/sysfs-driver-intc_sar b/Documentation/ABI/testing/sysfs-driver-intc_sar
new file mode 100644
index 000000000000..111bc33975ec
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-intc_sar
@@ -0,0 +1,57 @@
+What:		/sys/bus/platform/devices/INTC1092:00/intc_reg
+Date:		August 2021
+KernelVersion:	5.13.8
+Contact:	Shravan S <s.shravan@intel.com>,
+		An Sudhakar <sudhakar.an@intel.com>
+Description:
+		Specific Absorption Rate (SAR) regulatory mode is typically
+		derived based on information like mcc (Mobile Country Code) and
+		mnc (Mobile Network Code) that is available for the currently 
+		attached LTE network. A userspace application is required to set
+		the current SAR regulatory mode on the Dynamic SAR driver using
+		this sysfs node. Such an application can also read back using
+		this sysfs node, the currently configured regulatory mode value
+		from the Dynamic SAR driver.
+
+		Acceptable regulatory modes are:
+			==	====
+			0	FCC
+			1	CE
+			2	ISED
+			==	====
+
+		- The regulatory mode value has one of the above values. 
+		- The default regulatory mode used in the driver is 0.
+
+What:		/sys/bus/platform/devices/INTC1092:00/intc_data
+Date:		August 2021
+KernelVersion:	5.13.8
+Contact:	Shravan S <s.shravan@intel.com>,
+		An Sudhakar <sudhakar.an@intel.com>
+Description:
+		This sysfs entry is used to retrieve Dynamic SAR information 
+		emitted/maintained by a BIOS that supports Dynamic SAR.
+
+		The retrieved information is in the order given below:
+		- device_mode
+		- bandtable_index
+		- antennatable_index
+		- sartable_index
+		
+		The above information is sent as integer values separated
+		by a single space. This information can then be pushed to a
+		WWAN modem that uses this to control the transmit signal
+		level using the Band/Antenna/SAR table index information.
+		These parameters are derived/decided by aggregating
+		device-mode like laptop/tablet/clamshell etc. and the
+		proximity-sensor data available to the embedded controller on
+		given host. The regulatory mode configured on Dynamic SAR
+		driver also influences these values.
+		
+		The above information is communicated to a userspace
+		application using EPOLLPRI event on file-descriptor (fd)
+		obtained by opening this sysfs entry. This event is received
+		using the epoll() system call with EPOLLET flag to get only
+		edge triggered events. On getting such an event, application
+		can then read this information from the sysfs node and
+		consume the given information.
diff --git a/MAINTAINERS b/MAINTAINERS
index bbaecde94aa0..155c7b1dc7e7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9221,6 +9221,13 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/intel_atomisp2_led.c
 
+INTEL BIOS SAR INT1092 DRIVER
+M:	Shravan S <s.shravan@intel.com>
+M:	Intel Corporation <linuxwwan@intel.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/intel/int1092/
+
 INTEL BROXTON PMC DRIVER
 M:	Mika Westerberg <mika.westerberg@linux.intel.com>
 M:	Zha Qipeng <qipeng.zha@intel.com>
diff --git a/drivers/platform/x86/intel/Kconfig b/drivers/platform/x86/intel/Kconfig
index f2eef337eb98..9ff91068becd 100644
--- a/drivers/platform/x86/intel/Kconfig
+++ b/drivers/platform/x86/intel/Kconfig
@@ -18,5 +18,6 @@ if X86_PLATFORM_DRIVERS_INTEL
 
 source "drivers/platform/x86/intel/int33fe/Kconfig"
 source "drivers/platform/x86/intel/int3472/Kconfig"
+source "drivers/platform/x86/intel/int1092/Kconfig"
 
 endif # X86_PLATFORM_DRIVERS_INTEL
diff --git a/drivers/platform/x86/intel/Makefile b/drivers/platform/x86/intel/Makefile
index 0653055942d5..c0f342316d8f 100644
--- a/drivers/platform/x86/intel/Makefile
+++ b/drivers/platform/x86/intel/Makefile
@@ -6,3 +6,4 @@
 
 obj-$(CONFIG_INTEL_CHT_INT33FE)		+= int33fe/
 obj-$(CONFIG_INTEL_SKL_INT3472)		+= int3472/
+obj-$(CONFIG_INTEL_SAR_INT1092)		+= int1092/
diff --git a/drivers/platform/x86/intel/int1092/Kconfig b/drivers/platform/x86/intel/int1092/Kconfig
new file mode 100644
index 000000000000..2e9a177241aa
--- /dev/null
+++ b/drivers/platform/x86/intel/int1092/Kconfig
@@ -0,0 +1,14 @@
+config INTEL_SAR_INT1092
+	tristate "Intel Specific Absorption Rate Driver"
+	depends on ACPI
+	help
+	  This driver helps to limit the exposure of human body to RF frequency by
+	  providing information to userspace application that will inform the Intel
+	  M.2 modem to regulate the RF power based on SAR data obtained from the
+	  sensors captured in the BIOS. ACPI interface exposes this data from the BIOS
+	  to SAR driver. The front end application in userspace will interact with SAR
+	  driver to obtain information like the device mode, Antenna index, baseband index,
+	  SAR table index and use available communication like MBIM interface to enable
+	  data communication to modem for RF power regulation. Enable this config when
+	  given platform needs to support "Dynamic SAR" configuration for a modem available
+	  on the platform.
diff --git a/drivers/platform/x86/intel/int1092/Makefile b/drivers/platform/x86/intel/int1092/Makefile
new file mode 100644
index 000000000000..4ab94e541de3
--- /dev/null
+++ b/drivers/platform/x86/intel/int1092/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_INTEL_SAR_INT1092)		+= intel_sar.o
diff --git a/drivers/platform/x86/intel/int1092/intel_sar.c b/drivers/platform/x86/intel/int1092/intel_sar.c
new file mode 100644
index 000000000000..396361798b0a
--- /dev/null
+++ b/drivers/platform/x86/intel/int1092/intel_sar.c
@@ -0,0 +1,319 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021, Intel Corporation.
+ */
+
+#include <linux/acpi.h>
+#include <linux/kobject.h>
+#include <linux/platform_device.h>
+#include <linux/sysfs.h>
+#include "intel_sar.h"
+
+/**
+ * get_int_value: Retrieve integer values from ACPI Object
+ * @obj: acpi_object pointer which has the integer value
+ * @out: output pointer will get integer value
+ *
+ * Function is used to retrieve integer value from acpi object.
+ *
+ * Return:
+ * * 0 on success
+ * * -EIO if there is an issue in acpi_object passed.
+ */
+static int get_int_value(union acpi_object *obj, int *out)
+{
+	if (!obj || obj->type != ACPI_TYPE_INTEGER)
+		return -EIO;
+	*out = (int)obj->integer.value;
+	return 0;
+}
+
+/**
+ * update_sar_data: sar data is updated based on regulatory mode
+ * @context: pointer to driver context structure
+ *
+ * sar_data is updated based on regulatory value
+ * context->reg_value will never exceed MAX_REGULATORY
+ */
+static void update_sar_data(struct wwan_sar_context *context)
+{
+	struct wwan_device_mode_configuration *config =
+		&context->config_data[context->reg_value];
+
+	if (config->device_mode_info &&
+	    context->sar_data.device_mode < config->total_dev_mode) {
+		struct wwan_device_mode_info *dev_mode =
+			&config->device_mode_info[context->sar_data.device_mode];
+
+		context->sar_data.antennatable_index = dev_mode->antennatable_index;
+		context->sar_data.bandtable_index = dev_mode->bandtable_index;
+		context->sar_data.sartable_index = dev_mode->sartable_index;
+	}
+}
+
+/**
+ * parse_package: parse acpi package for retrieving SAR information
+ * @context: pointer to driver context structure
+ * @item : acpi_object pointer
+ *
+ * Given acpi_object is iterated to retrieve information for each device mode.
+ * If a given package corresponding to a specific device mode is faulty, it is
+ * skipped and the specific entry in context structure will have the default value
+ * of zero. Decoding of subsequent device modes is realized by having "continue"
+ * statements in the for loop on encountering error in parsing given device mode.
+ *
+ * Return:
+ * AE_OK if success
+ * AE_ERROR on error
+ */
+static acpi_status parse_package(struct wwan_sar_context *context, union acpi_object *item)
+{
+	struct wwan_device_mode_configuration *data;
+	int value, itr, reg, count;
+	union acpi_object *num;
+
+	num = &item->package.elements[0];
+	if (get_int_value(num, &value) || value < 0 || value >= MAX_REGULATORY)
+		return AE_ERROR;
+
+	reg = value;
+
+	data = &context->config_data[reg];
+	if (data->total_dev_mode > MAX_DEV_MODES || data->total_dev_mode == 0)
+		return AE_ERROR;
+	count = (data->total_dev_mode < item->package.count) ?
+			 data->total_dev_mode : item->package.count;
+	data->device_mode_info = kmalloc_array(data->total_dev_mode,
+					       sizeof(struct wwan_device_mode_info), GFP_KERNEL);
+	if (!data->device_mode_info)
+		return AE_ERROR;
+	for (itr = 0; itr < count; itr++) {
+		struct wwan_device_mode_info temp = { 0 };
+
+		num = &item->package.elements[itr + 1];
+		if (num->type != ACPI_TYPE_PACKAGE || num->package.count < TOTAL_DATA)
+			continue;
+		if (get_int_value(&num->package.elements[0], &temp.device_mode))
+			continue;
+		if (get_int_value(&num->package.elements[1], &temp.bandtable_index))
+			continue;
+		if (get_int_value(&num->package.elements[2], &temp.antennatable_index))
+			continue;
+		if (get_int_value(&num->package.elements[3], &temp.sartable_index))
+			continue;
+		data->device_mode_info[itr] = temp;
+	}
+	return AE_OK;
+}
+
+/**
+ * sar_get_device_mode: Extraction of information from BIOS via DSM calls
+ * @device: ACPI device for which to retrieve the data
+ *
+ * Retrieve the current device mode information from the BIOS.
+ *
+ * Return:
+ * AE_OK on success
+ * AE_ERROR on error
+ */
+static acpi_status sar_get_device_mode(struct platform_device *device)
+{
+	struct wwan_sar_context *context = dev_get_drvdata(&device->dev);
+	acpi_status status = AE_OK;
+	union acpi_object *out;
+	u32 rev = 0;
+	int value;
+
+	out = acpi_evaluate_dsm(context->handle, &context->guid, rev,
+				COMMAND_ID_DEV_MODE, NULL);
+	if (get_int_value(out, &value)) {
+		dev_err(&device->dev, "DSM cmd:%d Failed to retrieve value\n", COMMAND_ID_DEV_MODE);
+		status = AE_ERROR;
+		goto dev_mode_error;
+	}
+	context->sar_data.device_mode = value;
+	sysfs_notify(&device->dev.kobj, NULL, SYSFS_DATANAME);
+
+dev_mode_error:
+	ACPI_FREE(out);
+	return status;
+}
+
+static const struct acpi_device_id sar_device_ids[] = {
+	{ "INTC1092", 0},
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, sar_device_ids);
+
+static ssize_t intc_data_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct wwan_sar_context *context = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%d %d %d %d\n", context->sar_data.device_mode,
+		      context->sar_data.bandtable_index,
+		      context->sar_data.antennatable_index,
+		      context->sar_data.sartable_index);
+}
+static DEVICE_ATTR_RO(intc_data);
+
+static ssize_t intc_reg_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct wwan_sar_context *context = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%d\n", context->reg_value);
+}
+
+static ssize_t intc_reg_store(struct device *dev, struct device_attribute *attr,
+			      const char *buf, size_t count)
+{
+	struct wwan_sar_context *context = dev_get_drvdata(dev);
+	unsigned int value;
+	int read;
+
+	if (!count)
+		return -EFAULT;
+	read = kstrtouint(buf, 0, &value);
+	if (read <= 0)
+		return read;
+	if (value >= MAX_REGULATORY)
+		return -EOVERFLOW;
+	context->reg_value = value;
+	update_sar_data(context);
+	sysfs_notify(&dev->kobj, NULL, SYSFS_DATANAME);
+	return count;
+}
+static DEVICE_ATTR_RW(intc_reg);
+
+static struct attribute *intcsar_attrs[] = {
+	&dev_attr_intc_data.attr,
+	&dev_attr_intc_reg.attr,
+	NULL
+};
+
+static struct attribute_group intcsar_group = {
+	.attrs = intcsar_attrs,
+};
+
+static void sar_notify(acpi_handle handle, u32 event, void *data)
+{
+	struct platform_device *device = data;
+
+	if (event == SAR_EVENT) {
+		if (sar_get_device_mode(device) != AE_OK)
+			dev_err(&device->dev, "sar_get_device_mode error");
+	}
+}
+
+static void sar_get_data(int reg, struct wwan_sar_context *context)
+{
+	union acpi_object *out, *item, req;
+	acpi_status status = AE_OK;
+	u32 rev = 0;
+
+	req.type = ACPI_TYPE_INTEGER;
+	req.integer.value = reg;
+	out = acpi_evaluate_dsm(context->handle, &context->guid, rev,
+				COMMAND_ID_CONFIG_TABLE, &req);
+	if (!out)
+		return;
+	if (out->type == ACPI_TYPE_PACKAGE && out->package.count >= 3 &&
+	    out->package.elements[0].type == ACPI_TYPE_INTEGER &&
+	    out->package.elements[1].type == ACPI_TYPE_INTEGER &&
+	    out->package.elements[2].type == ACPI_TYPE_PACKAGE) {
+		context->config_data[reg].version = out->package.elements[0].integer.value;
+		context->config_data[reg].total_dev_mode =
+			out->package.elements[1].integer.value;
+		if (context->config_data[reg].total_dev_mode <= 0 ||
+		    context->config_data[reg].total_dev_mode > MAX_DEV_MODES) {
+			ACPI_FREE(out);
+			return;
+		}
+		item = &out->package.elements[2];
+		if (item->package.count > 0)
+			status = parse_package(context, item);
+		else
+			status = AE_ERROR;
+		if (status != AE_OK) {
+			ACPI_FREE(out);
+			return;
+		}
+	}
+	ACPI_FREE(out);
+}
+
+static int sar_probe(struct platform_device *device)
+{
+	struct wwan_sar_context *context;
+	int reg;
+	int result;
+
+	context = kzalloc(sizeof(*context), GFP_KERNEL);
+	if (!context)
+		return -ENOMEM;
+	context->sar_device = device;
+	dev_set_drvdata(&device->dev, context);
+	result = guid_parse(SAR_DSM_UUID, &context->guid);
+	if (result) {
+		dev_err(&device->dev, "SAR UUID parse error: %d\n", result);
+		goto r_free;
+	}
+	context->handle = ACPI_HANDLE(&device->dev);
+	for (reg = 0; reg < MAX_REGULATORY; reg++)
+		sar_get_data(reg, context);
+	update_sar_data(context);
+	result = sysfs_create_group(&device->dev.kobj, &intcsar_group);
+	if (result) {
+		dev_err(&device->dev, "sysfs creation failed\n");
+		goto r_free;
+	}
+	if (sar_get_device_mode(device) != AE_OK) {
+		dev_err(&device->dev, "Failed to get device mode\n");
+		result = -EFAULT;
+		goto r_sys;
+	}
+	if (acpi_install_notify_handler(ACPI_HANDLE(&device->dev), ACPI_DEVICE_NOTIFY,
+					sar_notify, (void *)device) != AE_OK) {
+		dev_err(&device->dev, "Failed acpi_install_notify_handler\n");
+		result = -EFAULT;
+		goto r_sys;
+	}
+	return 0;
+
+r_sys:
+	sysfs_remove_group(&device->dev.kobj, &intcsar_group);
+r_free:
+	kfree(context);
+	dev_set_drvdata(&device->dev, NULL);
+	return result;
+}
+
+static int sar_remove(struct platform_device *device)
+{
+	struct wwan_sar_context *context = dev_get_drvdata(&device->dev);
+	int reg;
+
+	acpi_remove_notify_handler(ACPI_HANDLE(&device->dev),
+				   ACPI_DEVICE_NOTIFY, sar_notify);
+	sysfs_remove_group(&device->dev.kobj, &intcsar_group);
+	for (reg = 0; reg < MAX_REGULATORY; reg++) {
+		kfree(context->config_data[reg].device_mode_info);
+		context->config_data[reg].device_mode_info = NULL;
+	}
+	kfree(context);
+	return 0;
+}
+
+static struct platform_driver sar_driver = {
+	.probe = sar_probe,
+	.remove = sar_remove,
+	.driver = {
+			.name = DRVNAME,
+			.owner = THIS_MODULE,
+			.acpi_match_table = ACPI_PTR(sar_device_ids)
+			}
+};
+module_platform_driver(sar_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Platform device driver for INTEL MODEM BIOS SAR");
+MODULE_AUTHOR("Shravan S <s.shravan@intel.com>");
diff --git a/drivers/platform/x86/intel/int1092/intel_sar.h b/drivers/platform/x86/intel/int1092/intel_sar.h
new file mode 100644
index 000000000000..dfadb243ecb3
--- /dev/null
+++ b/drivers/platform/x86/intel/int1092/intel_sar.h
@@ -0,0 +1,86 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2021, Intel Corporation.
+ */
+#ifndef INTEL_SAR_H
+#define INTEL_SAR_H
+
+#define COMMAND_ID_DEV_MODE 1
+#define COMMAND_ID_CONFIG_TABLE 2
+#define DRVNAME "intc_sar"
+#define MAX_DEV_MODES 50
+#define MAX_REGULATORY 3
+#define SAR_DSM_UUID "82737E72-3A33-4C45-A9C7-57C0411A5F13"
+#define SAR_EVENT 0x80
+#define SYSFS_DATANAME "intc_data"
+#define TOTAL_DATA 4
+
+/**
+ * Structure wwan_device_mode_info - device mode information
+ * Holds the data that needs to be passed to userspace.
+ * The data is updated from the BIOS sensor information.
+ * @device_mode: Specific mode of the device
+ * @bandtable_index: Index of RF band
+ * @antennatable_index: Index of antenna
+ * @sartable_index: Index of SAR
+ */
+struct wwan_device_mode_info {
+		int device_mode;
+		int bandtable_index;
+		int antennatable_index;
+		int sartable_index;
+};
+
+/**
+ * Structure wwan_device_mode_configuration - device configuration
+ * Holds the data that is configured and obtained on probe event.
+ * The data is updated from the BIOS sensor information.
+ * @version: Mode configuration version
+ * @total_dev_mode: Total number of device modes
+ * @device_mode_info: pointer to structure wwan_device_mode_info
+ */
+struct wwan_device_mode_configuration {
+		int version;
+		int total_dev_mode;
+		struct wwan_device_mode_info *device_mode_info;
+};
+
+/**
+ * Structure wwan_supported_info - userspace datastore
+ * Holds the data that is obtained from userspace
+ * The data is updated from the userspace and send value back in the
+ * structure format that is mentioned here.
+ * @reg_mode_needed: regulatory mode set by user for tests
+ * @bios_table_revision: Version of SAR table
+ * @num_supported_modes: Total supported modes based on reg_mode
+ */
+struct wwan_supported_info {
+		int reg_mode_needed;
+		int bios_table_revision;
+		int num_supported_modes;
+};
+
+/**
+ * Structure wwan_sar_context - context of SAR
+ * Holds the complete context as long as the driver is in existence
+ * The context holds instance of the data used for different cases.
+ * @guid: Group id
+ * @handle: store acpi handle
+ * @reg_value: regulatory value
+ * Regulatory 0: FCC, 1: CE, 2: ISED
+ * @sar_device: platform_device type
+ * @sar_kobject: kobject for sysfs
+ * @supported_data: wwan_supported_info struct
+ * @sar_data: wwan_device_mode_info struct
+ * @config_data: wwan_device_mode_configuration array struct
+ */
+struct wwan_sar_context {
+		guid_t guid;
+		acpi_handle handle;
+		int reg_value;
+		struct platform_device *sar_device;
+		struct wwan_supported_info supported_data;
+		struct wwan_device_mode_info sar_data;
+		struct wwan_device_mode_configuration config_data[MAX_REGULATORY];
+};
+#endif /* INTEL_SAR_H */
-- 
2.17.1

