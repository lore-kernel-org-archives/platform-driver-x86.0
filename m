Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE38BC48BE5
	for <platform-driver-x86@archiver.kernel.org>; Fri, 11 Jun 2021 09:45:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A4F8F613D3
	for <platform-driver-x86@archiver.kernel.org>; Fri, 11 Jun 2021 09:45:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231210AbhFKJrU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 11 Jun 2021 05:47:20 -0400
Received: from mga05.intel.com ([192.55.52.43]:40419 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230212AbhFKJrU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 11 Jun 2021 05:47:20 -0400
IronPort-SDR: 693BG5J57jGp7VKrn2HShk+qL0/TZSExguigwJHiQPagklVTHJdTGmKDGE1H73jikOSuQ5Yvzm
 2U2w9TPqzaGw==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="291127885"
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="291127885"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2021 02:45:22 -0700
IronPort-SDR: RaBxnAATncaKvRqRf5hUkmeJZYWpRgwWUERdvHwaH0zJFLGCt5+z8y8kkJ2nXmlVF8Vf3gziVp
 h9aEjXIybqrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="402966957"
Received: from intel-tiger-lake-client-platform.iind.intel.com ([10.224.178.120])
  by orsmga006.jf.intel.com with ESMTP; 11 Jun 2021 02:45:20 -0700
From:   Shravan S <s.shravan@intel.com>
To:     hdegoede@redhat.com, mgross@linux.intel.com,
        platform-driver-x86@vger.kernel.org
Cc:     sudhakar.an@intel.com
Subject: [PATCH 1/1] [x86]: BIOS Dynamic SAR driver for Intel M.2 Modem
Date:   Wed, 28 Apr 2021 08:52:24 +0530
Message-Id: <20210428032224.8299-2-s.shravan@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210428032224.8299-1-s.shravan@intel.com>
References: <20210428032224.8299-1-s.shravan@intel.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

---
 drivers/platform/x86/Kconfig                |  12 +
 drivers/platform/x86/Makefile               |   1 +
 drivers/platform/x86/intel-sar.c            | 589 ++++++++++++++++++++
 include/linux/platform_data/x86/intel-sar.h | 118 ++++
 4 files changed, 720 insertions(+)
 create mode 100644 drivers/platform/x86/intel-sar.c
 create mode 100644 include/linux/platform_data/x86/intel-sar.h

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 60592fb88e7a..6dfa89310677 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1313,6 +1313,18 @@ config INTEL_TELEMETRY
 	  directly via debugfs files. Various tools may use
 	  this interface for SoC state monitoring.
 
+config INTEL_SAR
+	tristate "Intel Specific Absorption Rate Driver"
+	depends on ACPI
+	help
+	  This driver limit the exposure of human body to RF frequency by informing
+	  the Intel M.2 modem to regulate the RF power based on SAR data obtained
+	  from the sensorscaptured in the BIOS. ACPI interface exposes this data
+	  from the BIOS to SAR driver. The front end application in userspace
+	  will interact with SAR driver to obtain information like the device mode,
+	  Antenna index,baseband index, SAR table index and use available communication
+	  like MBIM interface to enable data communication to modem for RF power regulation.
+
 endif # X86_PLATFORM_DEVICES
 
 config PMC_ATOM
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index dcc8cdb95b4d..548ff663c4af 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -123,6 +123,7 @@ obj-$(CONFIG_INTEL_SMARTCONNECT)		+= intel-smartconnect.o
 obj-$(CONFIG_INTEL_SPEED_SELECT_INTERFACE)	+= intel_speed_select_if/
 obj-$(CONFIG_INTEL_TURBO_MAX_3)			+= intel_turbo_max_3.o
 obj-$(CONFIG_INTEL_UNCORE_FREQ_CONTROL)		+= intel-uncore-frequency.o
+obj-$(CONFIG_INTEL_SAR)				+= intel-sar.o
 
 # Intel PMIC / PMC / P-Unit devices
 obj-$(CONFIG_INTEL_BXTWC_PMIC_TMU)	+= intel_bxtwc_tmu.o
diff --git a/drivers/platform/x86/intel-sar.c b/drivers/platform/x86/intel-sar.c
new file mode 100644
index 000000000000..dd3056b11e53
--- /dev/null
+++ b/drivers/platform/x86/intel-sar.c
@@ -0,0 +1,589 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Intel Corporation - ACPI for Specific Absorption Rate
+ * Copyright (c) 2021, Intel Corporation.
+ */
+
+#include <linux/platform_device.h>
+#include <net/netlink.h>
+#include <net/net_namespace.h>
+#include <linux/acpi.h>
+#include <uapi/linux/errno.h>
+#include <linux/platform_data/x86/intel-sar.h>
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Platform device driver for INTEL MODEM BIOS SAR");
+MODULE_AUTHOR("Shravan S <s.shravan@intel.com>");
+
+static struct WWAN_SAR_CONTEXT *context;
+
+static long sar_dev_ioctl(struct file *file, unsigned int cmd, unsigned long arg);
+
+static const struct file_operations fops = {
+		.owner      = THIS_MODULE,
+		.unlocked_ioctl = sar_dev_ioctl,
+};
+
+static int sar_add(struct platform_device *device);
+static int sar_remove(struct platform_device *device);
+static void sar_shutdown(struct platform_device *device);
+static void sar_notify(acpi_handle handle, u32 event, void *data);
+
+/**
+ * sar_send_notify - Send Device SAR information to userspace
+ *
+ * Send the sar data and device information to the userspace and later sent to modem
+ * by the userspace application. The data sent is collected from the BIOS.
+ * This data is used by userspace for further handling of the modem output.
+ */
+static void sar_send_notify(void)
+{
+		int result = 0;
+		struct sk_buff *skb;
+		struct nlmsghdr *nlh = NULL;
+
+		pr_debug("Entering: %s\n", __func__);
+		if (!context->socket) {
+			pr_err("Socket is not valid\n");
+			return;
+		}
+		skb = nlmsg_new(NLMSG_ALIGN(sizeof(struct WWAN_DEVICE_MODE_INFO)), GFP_KERNEL);
+		if (!skb) {
+			pr_err("Failed to allocate a new skb\n");
+			return;
+		}
+		nlh = nlmsg_put(skb, 0, 1, NLMSG_DONE, sizeof(struct WWAN_DEVICE_MODE_INFO), 0);
+		if (!nlh) {
+			pr_err("Error while nlmsg_put netlink is triggered\n");
+			nlmsg_free(skb);
+			return;
+		}
+		memcpy(nlmsg_data(nlh), (const char *)&context->sar_data,
+		       sizeof(context->sar_data));
+		pr_debug("Device_mode: %d\n", context->sar_data.device_mode);
+		pr_debug("bandtable_index: %d\n", context->sar_data.bandtable_index);
+		pr_debug("antennatable_index : %d\n", context->sar_data.antennatable_index);
+		pr_debug("sartable_index: %d\n", context->sar_data.sartable_index);
+
+		result = nlmsg_multicast(context->socket, skb, 0, NETLINK_SAR_GROUP, GFP_KERNEL);
+		if (result < 0)
+			pr_err("Error while sending bak to user: %d\n", result);
+}
+
+/**
+ * clear_sar_dev_mode - Clear Device Mode by freeing the allocated data
+ *
+ * If the Device Mode Info is present and allocated, clear it. This is for
+ * dynamic allocated memory of device_mode_info
+ */
+static void clear_sar_dev_mode(void)
+{
+		int reg = 0;
+
+		for (reg = 0; reg < MAX_REGULATORY; reg++) {
+			kfree(context->config_data[reg].device_mode_info);
+			context->config_data[reg].device_mode_info = NULL;
+		}
+}
+
+/**
+ * get_int_value - Retrieve Integer values from ACPI Object
+ * @obj: acpi_object pointer which gets the integer value
+ * @out: output pointer for integer
+ *
+ * Value of the integer from the object of ACPI is obtained.
+ * returns 0 on success
+ */
+static int get_int_value(union acpi_object *obj, int *out)
+{
+		if (obj && obj->type == ACPI_TYPE_INTEGER) {
+			*out = (int)obj->integer.value;
+			return 0;
+		} else {
+			return -1;
+		}
+}
+
+/**
+ * update_sar_data - sar data is updated based on reg_value
+ *
+ * sar_data is updated based on regulatory value
+ */
+static void update_sar_data(void)
+{
+		pr_debug("%s: Update SAR data\n", __func__);
+		if (context->config_data[context->reg_value].device_mode_info &&
+		    context->sar_data.device_mode <=
+		    context->config_data[context->reg_value].total_dev_mode) {
+			context->sar_data.antennatable_index =
+			context->config_data[context->reg_value]
+			.device_mode_info[context->sar_data.device_mode].antennatable_index;
+			context->sar_data.bandtable_index =
+			context->config_data[context->reg_value]
+			.device_mode_info[context->sar_data.device_mode].bandtable_index;
+			context->sar_data.sartable_index =
+			context->config_data[context->reg_value]
+			.device_mode_info[context->sar_data.device_mode].sartable_index;
+			pr_debug("bandtable_index: %d\n", context->sar_data.bandtable_index);
+			pr_debug("antennatable_index : %d\n", context->sar_data.antennatable_index);
+			pr_debug("sartable_index: %d\n", context->sar_data.sartable_index);
+		} else {
+			pr_err("%s: sar data not assigned! Dev mode: %d, total_dev_mode: %d\n",
+			       __func__, context->sar_data.device_mode,
+			       context->config_data[context->reg_value].total_dev_mode);
+		}
+}
+
+/**
+ * parse_guid - parse guid based on DSM UUID
+ *
+ * returns if success or error
+ */
+static acpi_status parse_guid(void)
+{
+		if (guid_parse(SAR_DSM_UUID, &context->guid)) {
+			pr_err("%s: UUID error\n", __func__);
+			return AE_ERROR;
+		}
+		context->parse = true;
+		return AE_OK;
+}
+
+/**
+ * parse_package - parse package for SAR
+ *
+ * @item : acpi_object ptr
+ * @reg : integer - regulatory modes
+ *
+ * returns if success or error
+ */
+static acpi_status parse_package(union acpi_object *item, int reg)
+{
+	int value = 0, itr = 0;
+	union acpi_object *num;
+
+	if (context->config_data[reg].total_dev_mode == 0) {
+		pr_err("Dev Mode count is zero, return\n");
+		return AE_ERROR;
+	}
+	context->config_data[reg].device_mode_info =
+	kmalloc_array(context->config_data[reg].total_dev_mode,
+		      sizeof(struct WWAN_DEVICE_MODE_INFO), GFP_KERNEL);
+	if (!context->config_data[reg].device_mode_info) {
+		pr_err("Cannot allocate memory in kernel\n");
+		return AE_ERROR;
+	}
+	num = &item->package.elements[0];
+	if (get_int_value(num, &value) == 0)
+		pr_debug("%s: Regulatory value : %d\n", __func__, value);
+	for (itr = 0; itr < context->config_data[reg].total_dev_mode; itr++) {
+		num = &item->package.elements[1];
+		if (num && num->type == ACPI_TYPE_PACKAGE) {
+			if (get_int_value(&num->package.elements[0], &value) == 0) {
+				pr_debug("%s: Device Mode for mode %d: %d\n", __func__, itr, value);
+				context->config_data[reg].device_mode_info[itr].device_mode = value;
+			}
+			if (get_int_value(&num->package.elements[1], &value) == 0) {
+				pr_debug("%s: band_index mode %d: %d\n", __func__, itr, value);
+				context->config_data[reg].device_mode_info[itr].bandtable_index =
+				value;
+			}
+			if (get_int_value(&num->package.elements[2], &value) == 0) {
+				pr_debug("%s: antenna_index mode %d: %d\n", __func__, itr, value);
+				context->config_data[reg].device_mode_info[itr].antennatable_index =
+				value;
+			}
+			if (get_int_value(&num->package.elements[3], &value) == 0) {
+				pr_debug("%s: sar_index for mode %d: %d\n", __func__, itr, value);
+				context->config_data[reg].device_mode_info[itr].sartable_index =
+				value;
+			}
+		}
+	}
+	return AE_OK;
+}
+
+/**
+ * sar_module_probe - Extraction of information from BIOS via DSM calls
+ * @device: ACPI device for which to retrieve the data
+ *
+ * Retrieve all values related to device mode and SAR Table index,
+ * Antenna Table index, Band Table index
+ * Returns AE_OK on success
+ */
+static acpi_status sar_module_probe(struct platform_device *device)
+{
+		acpi_status status = AE_OK;
+		union acpi_object *out, *item, req;
+		u32 rev = 0, reg = 0;
+		int value = 0;
+
+		pr_alert("%s Triggered\n", __func__);
+		if (!device) {
+			pr_err("%s: platform driver is null\n", __func__);
+			return AE_ERROR;
+		}
+		if (!context) {
+			pr_err("%s: context is null\n", __func__);
+			return AE_ERROR;
+		}
+		pr_debug("ACPI_HANDLE : %p\n", ACPI_HANDLE(&device->dev));
+		status = acpi_install_notify_handler(ACPI_HANDLE(&device->dev), ACPI_DEVICE_NOTIFY,
+						     sar_notify, (void *)device);
+		if (!(context->parse)) {
+			status = parse_guid();
+			if (status != AE_OK)
+				return status;
+		}
+		context->handle = ACPI_HANDLE(&device->dev);
+		out = acpi_evaluate_dsm(context->handle, &context->guid, rev,
+					COMMAND_ID_DEV_MODE, NULL);
+		pr_debug("%s: acpi_evaluate_dsm completed %d\n", __func__, out->type);
+		if (get_int_value(out, &value) == 0) {
+			pr_debug("%s: Device Mode is : %d\n", __func__, value);
+			context->sar_data.device_mode = value;
+		} else {
+			pr_err("%s: Cmd:%d Failed\n", __func__, COMMAND_ID_DEV_MODE);
+			return AE_ERROR;
+		}
+		ACPI_FREE(out);
+		if (!(context->data_read)) {
+			for (reg = 0; reg < MAX_REGULATORY; reg++) {
+				req.type = ACPI_TYPE_INTEGER;
+				req.integer.value = reg;
+				out = acpi_evaluate_dsm(context->handle, &context->guid, rev,
+							COMMAND_ID_CONFIG_TABLE, &req);
+				if (!out) {
+					pr_err("%s: Cmd:%d Failed\n", __func__,
+					       COMMAND_ID_CONFIG_TABLE);
+					continue;
+				}
+				pr_debug("%s: acpi_evaluate_dsm  for regulatory %d completed %d\n",
+					 __func__, reg, out->type);
+				if (out->type == ACPI_TYPE_PACKAGE) {
+					pr_debug("%s: ACPI_TYPE_PACKAGE, count: %d, type: %d\n",
+						 __func__, out->package.count, out->package.type);
+					item = &out->package.elements[0];
+					if (get_int_value(item, &value) == 0) {
+						pr_debug("%s: version : %d\n", __func__, value);
+						context->config_data[reg].version = value;
+					}
+					item = &out->package.elements[1];
+					if (get_int_value(item, &value) == 0) {
+						pr_debug("%s: No of Modes: %d\n", __func__, value);
+						context->config_data[reg].total_dev_mode = value;
+					}
+					if (context->config_data[reg].total_dev_mode <= 0 &&
+					    context->config_data[reg].total_dev_mode >
+					    MAX_DEV_MODES) {
+						pr_err("total_dev_mode is not within range : %d\n",
+						       context->config_data[reg].total_dev_mode);
+						ACPI_FREE(out);
+						return AE_ERROR;
+					}
+					item = &out->package.elements[2];
+					if (item)
+						status = parse_package(item, reg);
+					else
+						status = AE_ERROR;
+					if (status != AE_OK)
+						return status;
+				}
+				ACPI_FREE(out);
+			}
+			update_sar_data();
+			context->data_read = true;
+		}
+		sar_send_notify();
+		return status;
+}
+
+/**
+ * sar_set_device_mode - To set the device mode as BIOS handling test
+ * @device: ACPI device for which to retrieve the data
+ * @mode: Device Mode to be set
+ *
+ * Test Function call to BIOS for device mode handling of data sent via
+ * DSM calls.
+ */
+static acpi_status sar_set_device_mode(struct platform_device *device, int mode)
+{
+		union acpi_object *out, req;
+		u32 rev = 0;
+		int value = 0;
+		acpi_status status = AE_OK;
+
+		pr_alert("%s Triggered : mode : %d\n", __func__, mode);
+		if (!device) {
+			pr_err("%s: Device is null\n", __func__);
+			return AE_ERROR;
+		}
+		if (!context->handle) {
+			pr_err("%s: Handle is null\n", __func__);
+			return AE_ERROR;
+		}
+		if (!(context->parse)) {
+			status = parse_guid();
+			if (status != AE_OK)
+				return status;
+		}
+
+		req.type = ACPI_TYPE_INTEGER;
+		req.integer.value = mode;
+		out = acpi_evaluate_dsm(context->handle, &context->guid,
+					rev, COMMAND_TEST_SET, &req);
+		if (get_int_value(out, &value) != 0) {
+			pr_err("%s: Cmd:%d Failed\n", __func__, COMMAND_ID_DEV_MODE);
+			return AE_ERROR;
+		}
+		pr_debug("%s: return value is : %d\n", __func__, value);
+		ACPI_FREE(out);
+		return status;
+}
+
+/**
+ * sar_dev_ioctl - This function will be called when we perform ioctl calls to driver
+ * @file: file pointer
+ * @cmd: the command passed for action
+ * @arg: argument used in the commands
+ *
+ * Based on command this function
+ * WR_VALUE: writes specific Regulatory value,
+ * MODE_VALUE: changes device modes sent by userspace
+ * SUPPORT_VALUE: Sends the supported data back to userspace
+ * RD_VALUE: Get sar_data value from userspace
+ * Errors if not 0 is obtained from errno.h
+ */
+static long sar_dev_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
+{
+		int value = 0;
+		unsigned long ret = 0;
+		acpi_status status = AE_OK;
+
+		if (!context) {
+			pr_err("%s context is null\n", __func__);
+			return -EINVAL;
+		}
+		switch (cmd) {
+		case WR_VALUE:
+				ret = copy_from_user(&value, (void __user *)arg, sizeof(int32_t));
+				if (ret != 0) {
+					pr_err("copy_from_user for %d fails = %ld\n", cmd, ret);
+					return -EFAULT;
+				}
+				pr_debug("Regulatory Value Set by User = %d\n", value);
+				if (value >= 0 && value < MAX_REGULATORY) {
+					context->reg_value = value;
+					update_sar_data();
+					sar_send_notify();
+				}
+				break;
+		case MODE_VALUE:
+				ret = copy_from_user(&value, (void __user *)arg, sizeof(int32_t));
+				if (ret != 0) {
+					pr_err("copy_from_user for %d fails = %ld\n", cmd, ret);
+					return -EFAULT;
+				}
+				pr_debug("Change Device Mode from %d to %d\n",
+					 context->sar_data.device_mode, value);
+				status = sar_set_device_mode(context->sar_device, value);
+				if (status != AE_OK) {
+					pr_err("sar_set_device_mode for %d failed\n", cmd);
+					return -EINVAL;
+				}
+				break;
+		case SUPPORT_VALUE:
+				ret = copy_from_user(&context->supported_data, (void __user *)arg,
+						     sizeof(struct WWAN_SUPPORTED_INFO));
+				if (ret != 0) {
+					pr_err("copy_from_user for %d fails = %ld\n", cmd, ret);
+					return -EFAULT;
+				}
+				pr_debug("reg set= %d\n", context->supported_data.reg_mode_needed);
+				if (context->supported_data.reg_mode_needed < 0 &&
+				    context->supported_data.reg_mode_needed > MAX_REGULATORY) {
+					context->supported_data.reg_mode_needed = 0;
+					return -EINVAL;
+				}
+				context->supported_data.bios_table_revision =
+				context->config_data[context->supported_data.reg_mode_needed]
+				.version;
+				context->supported_data.num_supported_modes =
+				context->config_data[context->supported_data.reg_mode_needed]
+				.total_dev_mode;
+				pr_debug("ver=%d, modes = %d",
+					 context->supported_data.bios_table_revision,
+					 context->supported_data.num_supported_modes);
+				ret = copy_to_user((void __user *)arg, &context->supported_data,
+						   sizeof(context->supported_data));
+				if (ret != 0) {
+					pr_err("copy_to_user for %d fails = %ld\n", cmd, ret);
+					return -EFAULT;
+				}
+				break;
+		case RD_VALUE:
+				ret = copy_to_user((void __user *)arg, &context->sar_data,
+						   sizeof(context->sar_data));
+				if (ret != 0) {
+					pr_err("copy_to_user for %d fails = %ld\n", cmd, ret);
+					return -EFAULT;
+				}
+				break;
+		default:
+				pr_err("%s command not handled = %d\n", __func__, cmd);
+				return -EINVAL;
+		}
+		return ret;
+}
+
+static const struct acpi_device_id sar_device_ids[] = {
+		{ "INTC1092", 0},
+		{ "", 0},
+};
+
+MODULE_DEVICE_TABLE(acpi, sar_device_ids);
+
+static const struct platform_device_id sar_device_table[] = {
+	{"sar", 0},
+	{},
+};
+
+MODULE_DEVICE_TABLE(platform, sar_device_table);
+
+static struct platform_driver sar_driver = {
+	.probe = sar_add,
+	.remove = sar_remove,
+	.shutdown = sar_shutdown,
+	.driver = {
+			.name = DRVNAME,
+			.owner = THIS_MODULE,
+			/* FOR ACPI HANDLING */
+			.acpi_match_table = ACPI_PTR(sar_device_ids),
+			},
+	.id_table = sar_device_table,
+};
+
+static int sar_add(struct platform_device *device)
+{
+		pr_debug("%s Triggered\n", __func__);
+		context->sar_device = device;
+		if (sar_module_probe(device) != AE_OK)
+			return -1;
+		return 0;
+}
+
+static int sar_remove(struct platform_device *device)
+{
+		pr_debug("%s Triggered\n", __func__);
+		acpi_remove_notify_handler(ACPI_HANDLE(&device->dev),
+					   ACPI_DEVICE_NOTIFY, sar_notify);
+		context->sar_device = NULL;
+		memset(&context->sar_data, 0, sizeof(context->sar_data));
+		return 0;
+}
+
+static void sar_shutdown(struct platform_device *device)
+{
+		sar_remove(device);
+		return;
+}
+
+static void sar_notify(acpi_handle handle, u32 event, void *data)
+{
+		struct platform_device *device = data;
+
+		pr_alert("%s Triggered: event: %d\n", __func__, event);
+		if (event == SAR_EVENT) {
+			pr_debug("%s event matched\n", __func__);
+			if (sar_module_probe(device) != AE_OK)
+				pr_err("sar_module_probe error");
+		}
+}
+
+static int sar_init(void)
+{
+		int result = 0;
+
+		pr_alert("SAR Init Triggered\n");
+		context = kmalloc(sizeof(*context), GFP_KERNEL);
+		if (!context) {
+			pr_err("Cannot allocate memory in kernel for WWAN_SAR_CONTEXT\n");
+			return -1;
+		}
+		memset(context, 0, sizeof(struct WWAN_SAR_CONTEXT));
+		if ((alloc_chrdev_region(&context->dev, 0, 1, DRVNAME)) < 0) {
+			pr_err("Cannot allocate major number for device\n");
+			goto r_free;
+		}
+		pr_debug("Major = %d Minor = %d\n", MAJOR(context->dev), MINOR(context->dev));
+
+		/*Creating cdev structure*/
+		cdev_init(&context->dev_cdev, &fops);
+
+		/*Adding character device to the system*/
+		if ((cdev_add(&context->dev_cdev, context->dev, 1)) < 0) {
+			pr_err("Cannot add the device to the system\n");
+			goto r_char;
+		}
+
+		/*Creating struct class*/
+		context->dev_class = class_create(THIS_MODULE, DRVCLASS);
+		if (!context->dev_class) {
+			pr_err("Cannot create the struct class for device\n");
+			goto r_cdev;
+		}
+
+		/*Creating device*/
+		if (!device_create(context->dev_class, NULL, context->dev, NULL, DRVNAME)) {
+			pr_err("Cannot create the Device\n");
+			goto r_dev;
+		}
+
+		pr_debug("created dev entry\n");
+		context->socket = netlink_kernel_create(&init_net, NETLINK_SAR, NULL);
+		if (!context->socket) {
+			pr_err("Error creating socket\n");
+			goto r_dev_class;
+		}
+
+		result = platform_driver_register(&sar_driver);
+		if (result < 0) {
+			pr_err("Error registering driver\n");
+			goto r_sock;
+		}
+		pr_debug("device registered\n");
+
+		return 0;
+
+r_sock:
+		netlink_kernel_release(context->socket);
+r_dev_class:
+		device_destroy(context->dev_class, context->dev);
+r_dev:
+		class_destroy(context->dev_class);
+r_cdev:
+		cdev_del(&context->dev_cdev);
+r_char:
+		unregister_chrdev_region(context->dev, 1);
+r_free:
+		kfree(context);
+		return -1;
+}
+
+static void sar_exit(void)
+{
+		pr_alert("SAR EXIT Triggered\n");
+		if (context->socket)
+			netlink_kernel_release(context->socket);
+		platform_driver_unregister(&sar_driver);
+		device_destroy(context->dev_class, context->dev);
+		class_destroy(context->dev_class);
+		cdev_del(&context->dev_cdev);
+		unregister_chrdev_region(context->dev, 1);
+		clear_sar_dev_mode();
+		kfree(context);
+		pr_debug("Kernel Module Removed Successfully.\n");
+}
+
+module_init(sar_init);
+module_exit(sar_exit);
diff --git a/include/linux/platform_data/x86/intel-sar.h b/include/linux/platform_data/x86/intel-sar.h
new file mode 100644
index 000000000000..437a9774589b
--- /dev/null
+++ b/include/linux/platform_data/x86/intel-sar.h
@@ -0,0 +1,118 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Intel Corporation Header File for Specific Absorption Rate
+ * Copyright (c) 2021, Intel Corporation.
+ */
+#ifndef INTEL_SAR_H
+#define INTEL_SAR_H
+
+#include <linux/cdev.h>
+
+#define DRVNAME   "sar"
+#define DRVCLASS   "sar_class"
+#define SAR_DSM_UUID "82737E72-3A33-4C45-A9C7-57C0411A5F13"
+#define COMMAND_ID_DEV_MODE 1
+#define COMMAND_ID_CONFIG_TABLE 2
+#define COMMAND_TEST_SET 31
+#define MAX_REGULATORY 3
+#define SAR_EVENT 0x80
+#define MAJOR_VER 1
+#define MINOR_VER 0
+
+#define BUFFER_SIZE 256
+#define WR_VALUE _IOW('a', 'a', int32_t*)
+#define RD_VALUE _IOR('a', 'b', int32_t*)
+#define MODE_VALUE _IOW('a', 'd', int32_t*)
+#define SUPPORT_VALUE _IOWR('a', 'e', struct WWAN_SUPPORTED_INFO*)
+#define MAX_DEV_MODES 50
+#define NETLINK_SAR 25
+#define NETLINK_SAR_GROUP 2
+
+/**
+ * Structure WWAN_DEVICE_MODE_INFO
+ *
+ * Holds the data that needs to be passed to userspace.
+ * The data is updated from the BIOS sensor information.
+ *
+ * @device_mode: Specific mode of the device
+ * @bandtable_index: Index of RF band
+ * @antennatable_index: Index of antenna
+ * @sartable_index: Index of SAR
+ */
+struct WWAN_DEVICE_MODE_INFO {
+		int device_mode;
+		int bandtable_index;
+		int antennatable_index;
+		int sartable_index;
+};
+
+/**
+ * Structure WWAN_DEVICE_MODE_CONFIGURATION
+ *
+ * Holds the data that is configured and obtained on probe event.
+ * The data is updated from the BIOS sensor information.
+ *
+ * @version: Mode configuration version
+ * @total_dev_mode: Total number of device modes
+ * @device_mode_info: pointer to structure WWAN_DEVICE_MODE_INFO
+ */
+struct WWAN_DEVICE_MODE_CONFIGURATION {
+		int version;
+		int total_dev_mode;
+		struct WWAN_DEVICE_MODE_INFO *device_mode_info;
+};
+
+/**
+ * Structure WWAN_SUPPORTED_INFO
+ *
+ * Holds the data that is obtained from userspace
+ * The data is updated from the userspace and send value back in the
+ * structure format that is mentioned here.
+ *
+ * @reg_mode_needed: regulatory mode set by user for tests
+ * @bios_table_revision: Version of SAR table
+ * @num_supported_modes: Total supported modes based on reg_mode
+ */
+struct WWAN_SUPPORTED_INFO {
+		int reg_mode_needed;
+		int bios_table_revision;
+		int num_supported_modes;
+};
+
+/**
+ * Structure WWAN_SAR_CONTEXT
+ *
+ * Holds the complete context as long as the driver is in existence
+ * The context holds instance of the data used for different cases.
+ *
+ * @dev: holds device data
+ * @parse: identifies if dsm is parsed
+ * @data_read: identifies if data is already read from BIOS
+ * @guid: Group id
+ * @handle: store acpi handle
+ * @dev_class: stores the dev_class context
+ * @dev_cdev: handle for device cdev type
+ * @socket: sock for netlink
+ * @reg_value: regulatory value
+ * Regulatory 0: FCC, 1: CE, 2: ISED
+ * @sar_device: platform_device type
+ * @supported_data: WWAN_SUPPORTED_INFO struct
+ * @sar_data: WWAN_DEVICE_MODE_INFO struct
+ * @config_data: WWAN_DEVICE_MODE_CONFIGURATION array struct
+ */
+struct WWAN_SAR_CONTEXT {
+		dev_t dev;
+		bool parse;
+		bool data_read;
+		guid_t guid;
+		acpi_handle handle;
+		struct class *dev_class;
+		struct cdev dev_cdev;
+		struct sock *socket;
+		int reg_value;
+		struct platform_device *sar_device;
+		struct WWAN_SUPPORTED_INFO supported_data;
+		struct WWAN_DEVICE_MODE_INFO sar_data;
+		struct WWAN_DEVICE_MODE_CONFIGURATION config_data[MAX_REGULATORY];
+};
+#endif /* INTEL_SAR_H */
-- 
2.17.1

