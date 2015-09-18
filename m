From: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
Subject: [PATCH 2/4] platform:x86: Add Intel telemetry platform device & driver
Date: Fri, 18 Sep 2015 10:15:03 +0530
Message-ID: <1442551503-24839-1-git-send-email-souvik.k.chakravarty@intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:40072 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751422AbbIREdP (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 18 Sep 2015 00:33:15 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: srinidhi.kasagar@intel.com, qipeng.zha@intel.com, dvhart@infradead.org, Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>

Telemetry Device is created by the pmc_ipc driver. Resources
are populated according to the BIOS tables.
Telemetry platform driver implements the telemetry interfaces.
Currently it supports ApolloLake. It uses the PUNIT and PMC IPC
interfaces to configure the telemetry samples to read.
The samples are read from a Secure SRAM region.

Signed-off-by: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
---
 drivers/platform/x86/intel_pmc_ipc.c          |   96 ++
 drivers/platform/x86/intel_telemetry_pltdrv.c | 1180 +++++++++++++++++++++++++
 2 files changed, 1276 insertions(+)
 create mode 100644 drivers/platform/x86/intel_telemetry_pltdrv.c

diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
index 28b2a12..a24f2c4 100644
--- a/drivers/platform/x86/intel_pmc_ipc.c
+++ b/drivers/platform/x86/intel_pmc_ipc.c
@@ -70,6 +70,7 @@
 #define PLAT_RESOURCE_GCR_SIZE		0x1000
 #define PLAT_RESOURCE_PUNIT_DATA_INDEX	1
 #define PLAT_RESOURCE_PUNIT_INTER_INDEX	2
+#define PLAT_RESOURCE_TELEM_SSRAM_INDEX	3
 #define PLAT_RESOURCE_ACPI_IO_INDEX	0
 
 /*
@@ -84,6 +85,10 @@
 #define TCO_BASE_OFFSET			0x60
 #define TCO_REGS_SIZE			16
 #define PUNIT_DEVICE_NAME		"intel_punit_ipc"
+#define TELEMETRY_DEVICE_NAME		"intel_telemetry"
+#define TELEM_SSRAM_SIZE		240
+#define TELEM_PMC_SSRAM_OFFSET		0x1B00
+#define TELEM_PUNIT_SSRAM_OFFSET	0x1A00
 
 static const int iTCO_version = 3;
 
@@ -110,6 +115,14 @@ static struct intel_pmc_ipc_dev {
 	resource_size_t punit_base2;
 	int punit_size2;
 	struct platform_device *punit_dev;
+
+	/* Telemetry */
+	void *telem_pmc_ssram_base;
+	void *telem_punit_ssram_base;
+	int telem_pmc_ssram_size;
+	int telem_punit_ssram_size;
+	u8 telem_res_inval;
+	struct platform_device *telemetry_dev;
 } ipcdev;
 
 static char *ipc_err_sources[] = {
@@ -478,6 +491,18 @@ static struct itco_wdt_platform_data tco_info = {
 	.version = 3,
 };
 
+#define TELEMETRY_RESOURCE_PUNIT_SSRAM	0
+#define TELEMETRY_RESOURCE_PMC_SSRAM	1
+static struct resource telemetry_res[] = {
+	/*Telemetry*/
+	{
+		.flags = IORESOURCE_MEM,
+	},
+	{
+		.flags = IORESOURCE_MEM,
+	},
+};
+
 static int ipc_create_punit_device(void)
 {
 	struct platform_device *pdev;
@@ -571,6 +596,48 @@ err:
 	return ret;
 }
 
+static int ipc_create_telemetry_device(void)
+{
+	int ret;
+	struct resource *res;
+	struct platform_device *pdev;
+
+	pdev = platform_device_alloc(TELEMETRY_DEVICE_NAME, -1);
+	if (!pdev) {
+		dev_err(ipcdev.dev, "Fail to alloc telemetry platform device\n");
+		return -ENOMEM;
+	}
+
+	pdev->dev.parent = ipcdev.dev;
+
+	res = telemetry_res + TELEMETRY_RESOURCE_PUNIT_SSRAM;
+	res->start = (resource_size_t)ipcdev.telem_punit_ssram_base;
+	res->end = res->start + ipcdev.telem_punit_ssram_size - 1;
+
+	res = telemetry_res + TELEMETRY_RESOURCE_PMC_SSRAM;
+	res->start = (resource_size_t)ipcdev.telem_pmc_ssram_base;
+	res->end = res->start + ipcdev.telem_pmc_ssram_size - 1;
+
+	ret = platform_device_add_resources(pdev, telemetry_res,
+					ARRAY_SIZE(telemetry_res));
+	if (ret) {
+		dev_err(ipcdev.dev, "Failed to add telemetry plt resources\n");
+		goto err;
+	}
+
+	ret = platform_device_add(pdev);
+	if (ret) {
+		dev_err(ipcdev.dev, "Fail to add telemetry platform device\n");
+		goto err;
+	}
+	ipcdev.telemetry_dev = pdev;
+
+	return 0;
+err:
+	platform_device_put(pdev);
+	return ret;
+}
+
 static int ipc_create_pmc_devices(void)
 {
 	int ret;
@@ -585,6 +652,16 @@ static int ipc_create_pmc_devices(void)
 		dev_err(ipcdev.dev, "Failed to add punit platform device\n");
 		platform_device_unregister(ipcdev.tco_dev);
 	}
+
+	if (!ipcdev.telem_res_inval) {
+		ret = ipc_create_telemetry_device();
+		if (ret) {
+			dev_err(ipcdev.dev,
+				"Fail to add telemetry platform device\n");
+			ret = 0; /* Telemetry Fail is not non-recoverable */
+		}
+	}
+
 	return ret;
 }
 
@@ -654,6 +731,23 @@ static int ipc_plat_get_res(struct platform_device *pdev)
 	dev_info(&pdev->dev, "ipc res: %llx %x\n",
 		 (long long)res->start, (int)resource_size(res));
 
+	ipcdev.telem_res_inval = 0;
+	res = platform_get_resource(pdev, IORESOURCE_MEM,
+				PLAT_RESOURCE_TELEM_SSRAM_INDEX);
+	if (!res) {
+		dev_err(&pdev->dev, "Fail to get telemetry ssram resource\n");
+		ipcdev.telem_res_inval = 1;
+	} else {
+		ipcdev.telem_punit_ssram_base = (void *)(res->start +
+						TELEM_PUNIT_SSRAM_OFFSET);
+		ipcdev.telem_punit_ssram_size = TELEM_SSRAM_SIZE;
+		ipcdev.telem_pmc_ssram_base = (void *)(res->start +
+						TELEM_PMC_SSRAM_OFFSET);
+		ipcdev.telem_pmc_ssram_size = TELEM_SSRAM_SIZE;
+		dev_info(&pdev->dev, "telemetry ssram res: %llx %x\n",
+			res->start, (int)resource_size(res));
+	}
+
 	return 0;
 }
 
@@ -711,6 +805,7 @@ err_sys:
 err_irq:
 	platform_device_unregister(ipcdev.tco_dev);
 	platform_device_unregister(ipcdev.punit_dev);
+	platform_device_unregister(ipcdev.telemetry_dev);
 err_device:
 	iounmap(ipcdev.ipc_base);
 	res = platform_get_resource(pdev, IORESOURCE_MEM,
@@ -728,6 +823,7 @@ static int ipc_plat_remove(struct platform_device *pdev)
 	free_irq(ipcdev.irq, &ipcdev);
 	platform_device_unregister(ipcdev.tco_dev);
 	platform_device_unregister(ipcdev.punit_dev);
+	platform_device_unregister(ipcdev.telemetry_dev);
 	iounmap(ipcdev.ipc_base);
 	res = platform_get_resource(pdev, IORESOURCE_MEM,
 				    PLAT_RESOURCE_IPC_INDEX);
diff --git a/drivers/platform/x86/intel_telemetry_pltdrv.c b/drivers/platform/x86/intel_telemetry_pltdrv.c
new file mode 100644
index 0000000..965ef11
--- /dev/null
+++ b/drivers/platform/x86/intel_telemetry_pltdrv.c
@@ -0,0 +1,1180 @@
+/*
+ * Intel SOC Telemetry Platform Driver: Currently supports APL
+ * Copyright (c) 2015, Intel Corporation.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * This file provides the platform specific telemetry implementation for APL.
+ * It used the PUNIT and PMC IPC interfaces for configuring the counters.
+ * The accumulated results are fetched from SRAM.
+ */
+
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/device.h>
+#include <linux/debugfs.h>
+#include <linux/seq_file.h>
+#include <linux/io.h>
+#include <linux/uaccess.h>
+#include <linux/pci.h>
+#include <linux/suspend.h>
+#include <linux/platform_device.h>
+
+#include <asm/cpu_device_id.h>
+#include <asm/intel_pmc_ipc.h>
+#include <asm/intel_punit_ipc.h>
+#include <asm/intel_telemetry.h>
+
+#define	DRIVER_NAME	"intel_telemetry"
+#define DRIVER_VERSION	"1.0.0"
+
+#define TELEM_TRC_VERBOSITY_MASK	0x3
+
+#define TELEM_MIN_PERIOD(x)		((x) & 0x7F0000)
+#define TELEM_MAX_PERIOD(x)		((x) & 0x7F000000)
+#define TELEM_SAMPLE_PERIOD_INVALID(x)	((x) & (BIT(7)))
+#define TELEM_CLEAR_SAMPLE_PERIOD(x)	((x) &= ~0x7F)
+
+#define TELEM_SAMPLING_DEFAULT_PERIOD	0xD
+
+#define TELEM_MAX_EVENTS_SRAM		28
+#define TELEM_MAX_OS_ALLOCATED_EVENTS	20
+#define TELEM_SSRAM_STARTTIME_OFFSET	8
+#define TELEM_SSRAM_EVTLOG_OFFSET	16
+
+#define IOSS_TELEM_EVENT_READ		0x0
+#define IOSS_TELEM_EVENT_WRITE		0x1
+#define IOSS_TELEM_INFO_READ		0x2
+#define IOSS_TELEM_TRACE_CTL_READ	0x5
+#define IOSS_TELEM_TRACE_CTL_WRITE	0x6
+#define IOSS_TELEM_EVENT_CTL_READ	0x7
+#define IOSS_TELEM_EVENT_CTL_WRITE	0x8
+#define IOSS_TELEM_EVT_CTRL_WRITE_SIZE	0x4
+#define IOSS_TELEM_READ_WORD		0x1
+#define IOSS_TELEM_WRITE_FOURBYTES	0x4
+#define IOSS_TELEM_EVT_WRITE_SIZE	0x3
+
+#define TELEM_INFO_SRAMEVTS_MASK	0xFF00
+#define TELEM_INFO_SRAMEVTS_SHIFT	0x8
+#define TELEM_SSRAM_READ_TIMEOUT	10
+
+#define TELEM_INFO_NENABLES_MASK	0xFF
+#define TELEM_EVENT_ENABLE		0x8000
+
+#define TELEM_MASK_BIT			1
+#define TELEM_MASK_BYTE			0xFF
+#define BYTES_PER_LONG			8
+#define TELEM_MASK_PCS_STATE		0xF
+
+#define TELEM_DISABLE(x)		((x) &= ~(BIT(31)))
+#define TELEM_CLEAR_EVENTS(x)		((x) |= (BIT(30)))
+#define TELEM_ENABLE_SRAM_EVT_TRACE(x)	((x) &= ~(BIT(30) | BIT(24)))
+#define TELEM_ENABLE_PERIODIC(x)	((x) |= (BIT(23) | BIT(31) | BIT(7)))
+#define TELEM_EXTRACT_VERBOSITY(x, y)	((y) = (((x) >> 27) & 0x3))
+#define TELEM_CLEAR_VERBOSITY_BITS(x)	((x) &= ~(BIT(27) | BIT(28)))
+#define TELEM_SET_VERBOSITY_BITS(x, y)	((x) |= ((y) << 27))
+
+#define TELEM_CPU(model, data) \
+	{ X86_VENDOR_INTEL, 6, model, X86_FEATURE_MWAIT, (unsigned long)&data }
+
+enum telemetry_action {
+	TELEM_UPDATE = 0,
+	TELEM_ADD,
+	TELEM_RESET,
+	TELEM_ACTION_NONE
+};
+
+struct telem_ssram_region {
+	u64 timestamp;
+	u64 start_time;
+	u64 events[TELEM_MAX_EVENTS_SRAM];
+};
+
+static struct telemetry_plt_config *telm_conf;
+
+
+/* The following counters are programed by default during setup.
+   Only 20 allocated to kernel driver */
+static struct telemetry_evtmap
+	telemetry_apl_ioss_default_events[TELEM_MAX_OS_ALLOCATED_EVENTS] = {
+	{"SOC_S0IX_TOTAL_RES",			0x4800},
+	{"SOC_S0IX_TOTAL_OCC",			0x4000},
+	{"SOC_S0IX_SHALLOW_RES",		0x4801},
+	{"SOC_S0IX_SHALLOW_OCC",		0x4001},
+	{"SOC_S0IX_DEEP_RES",			0x4802},
+	{"SOC_S0IX_DEEP_OCC",			0x4002},
+	{"PMC_POWER_GATE",			0x5818},
+	{"PMC_D3_STATES",			0x5819},
+	{"PMC_D0I3_STATES",			0x581A},
+	{"PMC_S0IX_WAKE_REASON_GPIO",		0x6000},
+	{"PMC_S0IX_WAKE_REASON_TIMER",		0x6001},
+	{"PMC_S0IX_WAKE_REASON_VNNREQ",         0x6002},
+	{"PMC_S0IX_WAKE_REASON_LOWPOWER",       0x6003},
+	{"PMC_S0IX_WAKE_REASON_EXTERNAL",       0x6004},
+	{"PMC_S0IX_WAKE_REASON_MISC",           0x6005},
+	{"PMC_S0IX_BLOCKING_IPS_D3_D0I3",       0x6006},
+	{"PMC_S0IX_BLOCKING_IPS_PG",            0x6007},
+	{"PMC_S0IX_BLOCKING_MISC_IPS_PG",       0x6008},
+	{"PMC_S0IX_BLOCK_IPS_VNN_REQ",          0x6009},
+	{"PMC_S0IX_BLOCK_IPS_CLOCKS",           0x600B},
+};
+
+
+static struct telemetry_evtmap
+	telemetry_apl_pss_default_events[TELEM_MAX_OS_ALLOCATED_EVENTS] = {
+	{"IA_CORE_C6_RES",			0x0400},
+	{"IA_CORE_C6_CTR",			0x0000},
+	{"IA_MODULE_C7_RES",			0x0410},
+	{"IA_MODULE_C7_CTR",			0x000E},
+	{"IA_C0_RES",				0x0805},
+	{"PCS_LTR",				0x2801},
+	{"PSTATES",				0x2802},
+	{"SOC_S0I3_RES",			0x0409},
+	{"SOC_S0I3_CTR",			0x000A},
+	{"PCS_S0I3_CTR",			0x0009},
+	{"PCS_C1E_RES",				0x041A},
+	{"PCS_IDLE_STATUS",			0x2806},
+	{"IA_PERF_LIMITS",			0x280B},
+	{"GT_PERF_LIMITS",			0x280C},
+	{"PCS_WAKEUP_S0IX_CTR",			0x0030},
+	{"PCS_IDLE_BLOCKED",			0x2C00},
+	{"PCS_S0IX_BLOCKED",			0x2C01},
+	{"PCS_S0IX_WAKE_REASONS",		0x2C02},
+	{"PCS_LTR_BLOCKING",			0x2C03},
+	{"PC2_AND_MEM_SHALLOW_IDLE_RES",	0x1D40},
+};
+
+/* APL specific Data */
+static struct telemetry_plt_config telem_apl_config = {
+	.pss_config = {
+		.telem_evts = telemetry_apl_pss_default_events,
+	},
+	.ioss_config = {
+		.telem_evts = telemetry_apl_ioss_default_events,
+	},
+};
+
+static const struct x86_cpu_id telemetry_cpu_ids[] = {
+	TELEM_CPU(0x5c, telem_apl_config),
+	{}
+};
+
+MODULE_DEVICE_TABLE(x86cpu, telemetry_cpu_ids);
+
+static inline int telem_get_unitconfig(enum telemetry_unit telem_unit,
+			struct telemetry_unit_config **unit_config)
+{
+	if (TELEM_PSS == telem_unit)
+		*unit_config = &(telm_conf->pss_config);
+	else if (TELEM_IOSS == telem_unit)
+		*unit_config = &(telm_conf->ioss_config);
+	else
+		return -EINVAL;
+
+	return 0;
+
+}
+
+static int telemetry_check_evtid(enum telemetry_unit telem_unit,
+		u32 *evtmap, u8 len, enum telemetry_action action)
+{
+	int ret;
+	struct telemetry_unit_config *unit_config;
+
+	ret = telem_get_unitconfig(telem_unit, &unit_config);
+	if (ret < 0)
+		return ret;
+
+	switch (action) {
+	case TELEM_RESET:
+		if (len > TELEM_MAX_EVENTS_SRAM)
+			return -EINVAL;
+
+		break;
+
+	case TELEM_UPDATE:
+		if (len > TELEM_MAX_EVENTS_SRAM)
+			return -EINVAL;
+
+		if ((len > 0) && (NULL == evtmap))
+			return -EINVAL;
+
+		break;
+
+	case TELEM_ADD:
+		if ((len + (unit_config->ssram_evts_used))
+				> TELEM_MAX_EVENTS_SRAM) {
+			return -EINVAL;
+		}
+
+		if ((len > 0) && (NULL == evtmap))
+			return -EINVAL;
+
+		break;
+
+	default:
+		pr_err("No TELEM_ACTION Specified\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+
+static inline int telemetry_plt_config_ioss_event(u32 evt_id, int index)
+{
+	u32 write_buf;
+	int ret;
+
+	write_buf = evt_id | TELEM_EVENT_ENABLE; /* Event Enable */
+	write_buf <<= BITS_PER_BYTE;
+	write_buf |= index; /* Set the Index register */
+
+	ret = intel_pmc_ipc_command(PMC_IPC_PMC_TELEMTRY,
+				IOSS_TELEM_EVENT_WRITE, (u8 *)&write_buf,
+					IOSS_TELEM_EVT_WRITE_SIZE, NULL, 0);
+
+	return ret;
+}
+
+static inline int telemetry_plt_config_pss_event(u32 evt_id, int index)
+{
+	u32 write_buf;
+	int ret;
+
+	write_buf = evt_id | TELEM_EVENT_ENABLE; /* Event Enable */
+	ret = intel_punit_ipc_command(IPC_PUNIT_BIOS_CMD_WRITE_TELE_EVENT,
+					index, 0, &write_buf, NULL);
+
+	return ret;
+}
+
+static int telemetry_setup_evtconfig(struct telemetry_evtconfig pss_evtconfig,
+				struct telemetry_evtconfig ioss_evtconfig,
+				enum telemetry_action action)
+{
+	u8 num_pss_evts, num_ioss_evts, pss_period, ioss_period;
+	int ret = 0, index, idx, evts;
+	u32 telem_ctrl;
+	u32 *pss_evtmap, *ioss_evtmap;
+
+	num_pss_evts = pss_evtconfig.num_evts;
+	num_ioss_evts = ioss_evtconfig.num_evts;
+	pss_period = pss_evtconfig.period;
+	ioss_period = ioss_evtconfig.period;
+	pss_evtmap = pss_evtconfig.evtmap;
+	ioss_evtmap = ioss_evtconfig.evtmap;
+
+	mutex_lock(&(telm_conf->telem_lock));
+
+	if ((action == TELEM_UPDATE) && (telm_conf->telem_in_use)) {
+		ret = -EBUSY;
+		goto out;
+	}
+
+	ret = telemetry_check_evtid(TELEM_PSS, pss_evtmap,
+					num_pss_evts, action);
+	if (ret)
+		goto out;
+
+	ret = telemetry_check_evtid(TELEM_IOSS, ioss_evtmap,
+					num_ioss_evts, action);
+	if (ret)
+		goto out;
+
+	if (!num_ioss_evts)
+		goto pss_evt_set;
+
+	/* Get telemetry EVENT CTL */
+	ret = intel_pmc_ipc_command(PMC_IPC_PMC_TELEMTRY,
+			IOSS_TELEM_EVENT_CTL_READ, NULL, 0, &telem_ctrl,
+				IOSS_TELEM_READ_WORD);
+	if (ret) {
+		pr_err("IOSS TELEM_CTRL Read Failed\n");
+		goto out;
+	}
+
+	/* Disable Telemetry */
+	TELEM_DISABLE(telem_ctrl);
+
+	ret = intel_pmc_ipc_command(PMC_IPC_PMC_TELEMTRY,
+		IOSS_TELEM_EVENT_CTL_WRITE, (u8 *)&telem_ctrl,
+			IOSS_TELEM_EVT_CTRL_WRITE_SIZE, NULL, 0);
+	if (ret) {
+		pr_err("IOSS TELEM_CTRL Event Disable Write Failed\n");
+		goto out;
+	}
+
+
+	/* Reset Everything */
+	if (TELEM_RESET == action) {
+		/* Clear All Events */
+		TELEM_CLEAR_EVENTS(telem_ctrl);
+
+		ret = intel_pmc_ipc_command(PMC_IPC_PMC_TELEMTRY,
+			IOSS_TELEM_EVENT_CTL_WRITE, (u8 *)&telem_ctrl,
+				IOSS_TELEM_EVT_CTRL_WRITE_SIZE, NULL, 0);
+		if (ret) {
+			pr_err("IOSS TELEM_CTRL Event Disable Write Failed\n");
+			goto out;
+		}
+
+		/* Configure Events */
+		for (idx = 0, evts = 0; idx < num_ioss_evts; idx++) {
+			ret = telemetry_plt_config_ioss_event(
+				telm_conf->ioss_config.telem_evts[idx].evt_id,
+								idx);
+			if (ret) {
+				pr_err("IOSS TELEM_RESET Fail for data: %x\n",
+				telm_conf->ioss_config.telem_evts[idx].evt_id);
+			} else
+				evts++;
+		}
+		telm_conf->ioss_config.ssram_evts_used = evts;
+	}
+
+	/* Re-Configure Everything */
+	if (TELEM_UPDATE == action) {
+		/* Clear All Events */
+		TELEM_CLEAR_EVENTS(telem_ctrl);
+
+		ret = intel_pmc_ipc_command(PMC_IPC_PMC_TELEMTRY,
+			IOSS_TELEM_EVENT_CTL_WRITE, (u8 *)&telem_ctrl,
+			IOSS_TELEM_EVT_CTRL_WRITE_SIZE, NULL, 0);
+		if (ret) {
+			pr_err("IOSS TELEM_CTRL Event Disable Write Failed\n");
+			goto out;
+		}
+
+		/* Configure Events */
+		for (index = 0, evts = 0; index < num_ioss_evts; index++) {
+			telm_conf->ioss_config.telem_evts[index].evt_id
+				 = ioss_evtmap[index];
+
+			ret = telemetry_plt_config_ioss_event(
+				telm_conf->ioss_config.telem_evts[index].evt_id,
+					index);
+			if (ret) {
+				pr_err("IOSS TELEM_UPDATE Fail for Evt%x\n",
+					ioss_evtmap[index]);
+			} else
+				evts++;
+		}
+		telm_conf->ioss_config.ssram_evts_used = evts;
+	}
+
+	/* Add some Events */
+	if (TELEM_ADD == action) {
+		/* Configure Events */
+		for (index = telm_conf->ioss_config.ssram_evts_used, idx = 0,
+			evts = 0; idx < num_ioss_evts; index++, idx++) {
+			telm_conf->ioss_config.telem_evts[index].evt_id
+				 = ioss_evtmap[idx];
+
+			ret = telemetry_plt_config_ioss_event(
+				telm_conf->ioss_config.telem_evts[index].evt_id,
+					index);
+			if (ret) {
+				pr_err("IOSS TELEM_ADD Fail for Event %x\n",
+					ioss_evtmap[idx]);
+			} else
+				evts++;
+		}
+		telm_conf->ioss_config.ssram_evts_used += evts;
+	}
+
+	/* Enable Periodic Telemetry Events and enable SRAM trace */
+	TELEM_CLEAR_SAMPLE_PERIOD(telem_ctrl);
+	TELEM_ENABLE_SRAM_EVT_TRACE(telem_ctrl);
+	TELEM_ENABLE_PERIODIC(telem_ctrl);
+	telem_ctrl |= ioss_period;
+
+	ret = intel_pmc_ipc_command(PMC_IPC_PMC_TELEMTRY,
+		IOSS_TELEM_EVENT_CTL_WRITE, (u8 *)&telem_ctrl,
+			IOSS_TELEM_EVT_CTRL_WRITE_SIZE, NULL, 0);
+	if (ret) {
+		pr_err("IOSS TELEM_CTRL Event Enable Write Failed\n");
+		goto out;
+	}
+
+	telm_conf->ioss_config.curr_period = ioss_period;
+
+
+pss_evt_set:
+	if (!num_pss_evts)
+		goto out;
+
+	/* PSS Config */
+	/* Get telemetry EVENT CTL */
+	ret = intel_punit_ipc_command(IPC_PUNIT_BIOS_CMD_READ_TELE_EVENT_CTRL,
+			0, 0, NULL, &telem_ctrl);
+	if (ret) {
+		pr_err("PSS TELEM_CTRL Read Failed\n");
+		goto out;
+	}
+
+	/* Disable Telemetry */
+	TELEM_DISABLE(telem_ctrl);
+	ret = intel_punit_ipc_command(IPC_PUNIT_BIOS_CMD_WRITE_TELE_EVENT_CTRL,
+			0, 0, &telem_ctrl, NULL);
+	if (ret) {
+		pr_err("PSS TELEM_CTRL Event Disable Write Failed\n");
+		goto out;
+	}
+
+	/* Reset Everything */
+	if (TELEM_RESET == action) {
+		/* Clear All Events */
+		TELEM_CLEAR_EVENTS(telem_ctrl);
+
+		ret = intel_punit_ipc_command(
+			IPC_PUNIT_BIOS_CMD_WRITE_TELE_EVENT_CTRL,
+				0, 0, &telem_ctrl, NULL);
+		if (ret) {
+			pr_err("PSS TELEM_CTRL Event Disable Write Failed\n");
+			goto out;
+		}
+
+		/* Configure Events */
+		for (idx = 0, evts = 0; idx < num_pss_evts; idx++) {
+			ret = telemetry_plt_config_pss_event(
+				telm_conf->pss_config.telem_evts[idx].evt_id,
+								idx);
+			if (ret) {
+				pr_err("PSS TELEM_RESET Fail for Event %x\n",
+				telm_conf->pss_config.telem_evts[idx].evt_id);
+			} else
+				evts++;
+		}
+		telm_conf->pss_config.ssram_evts_used = evts;
+	}
+
+	/* Re-Configure Everything */
+	if (TELEM_UPDATE == action) {
+		/* Clear All Events */
+		TELEM_CLEAR_EVENTS(telem_ctrl);
+
+		ret = intel_punit_ipc_command(
+			IPC_PUNIT_BIOS_CMD_WRITE_TELE_EVENT_CTRL,
+				0, 0, &telem_ctrl, NULL);
+		if (ret) {
+			pr_err("PSS TELEM_CTRL Event Disable Write Failed\n");
+			goto out;
+		}
+
+		/* Configure Events */
+		for (index = 0, evts = 0; index < num_pss_evts; index++) {
+			telm_conf->pss_config.telem_evts[index].evt_id =
+				pss_evtmap[index];
+
+			ret = telemetry_plt_config_pss_event(
+				telm_conf->pss_config.telem_evts[index].evt_id,
+					index);
+			if (ret) {
+				pr_err("PSS TELEM_UPDATE Fail for Event %x\n",
+					pss_evtmap[index]);
+			} else
+				evts++;
+		}
+		telm_conf->pss_config.ssram_evts_used = evts;
+	}
+
+	/* Add some Events */
+	if (TELEM_ADD == action) {
+		/* Configure Events */
+		for (index = telm_conf->pss_config.ssram_evts_used, idx = 0,
+			evts = 0; idx < num_pss_evts; index++, idx++) {
+			telm_conf->pss_config.telem_evts[index].evt_id =
+				pss_evtmap[idx];
+
+			ret = telemetry_plt_config_pss_event(
+				telm_conf->pss_config.telem_evts[index].evt_id,
+					index);
+			if (ret) {
+				pr_err("PSS TELEM_ADD Fail for Event %x\n",
+					pss_evtmap[idx]);
+			} else
+				evts++;
+		}
+		telm_conf->pss_config.ssram_evts_used += evts;
+	}
+
+	/* Enable Periodic Telemetry Events and enable SRAM trace */
+	TELEM_CLEAR_SAMPLE_PERIOD(telem_ctrl);
+	TELEM_ENABLE_SRAM_EVT_TRACE(telem_ctrl);
+	TELEM_ENABLE_PERIODIC(telem_ctrl);
+	telem_ctrl |= pss_period;
+
+	ret = intel_punit_ipc_command(IPC_PUNIT_BIOS_CMD_WRITE_TELE_EVENT_CTRL,
+			0, 0, &telem_ctrl, NULL);
+	if (ret) {
+		pr_err("PSS TELEM_CTRL Event Enable Write Failed\n");
+		goto out;
+	}
+
+	telm_conf->pss_config.curr_period = pss_period;
+
+	if (action == TELEM_RESET)
+		telm_conf->telem_in_use = 0;
+	else if ((action == TELEM_UPDATE) || (action == TELEM_ADD))
+		telm_conf->telem_in_use = 1;
+
+out:
+	mutex_unlock(&(telm_conf->telem_lock));
+	return ret;
+}
+
+static int telemetry_setup(struct platform_device *pdev)
+{
+	int ret;
+	u32 read_buf, events, event_regs;
+	struct telemetry_evtconfig pss_evtconfig, ioss_evtconfig;
+
+	ret = intel_pmc_ipc_command(PMC_IPC_PMC_TELEMTRY, IOSS_TELEM_INFO_READ,
+			NULL, 0, &read_buf, IOSS_TELEM_READ_WORD);
+	if (ret) {
+		dev_err(&pdev->dev, "IOSS TELEM_INFO Read Failed\n");
+		return ret;
+	}
+
+	/* Get telemetry Info */
+	events = (read_buf & TELEM_INFO_SRAMEVTS_MASK) >>
+			TELEM_INFO_SRAMEVTS_SHIFT;
+	event_regs = read_buf & TELEM_INFO_NENABLES_MASK;
+	if ((events < TELEM_MAX_EVENTS_SRAM) ||
+			(event_regs < TELEM_MAX_EVENTS_SRAM)) {
+		dev_err(&pdev->dev, "IOSS:Insufficient Space for SRAM Trace\n");
+		dev_err(&pdev->dev, "SRAM Events %d; Event Regs %d\n",
+						events, event_regs);
+		return -ENOMEM;
+	}
+
+	telm_conf->ioss_config.min_period = TELEM_MIN_PERIOD(read_buf);
+	telm_conf->ioss_config.max_period = TELEM_MAX_PERIOD(read_buf);
+
+	/* PUNIT Mailbox Setup */
+	ret = intel_punit_ipc_command(IPC_PUNIT_BIOS_CMD_READ_TELE_INFO, 0, 0,
+			NULL, &read_buf);
+	if (ret) {
+		dev_err(&pdev->dev, "PSS TELEM_INFO Read Failed\n");
+		return ret;
+	}
+
+	/* Get telemetry Info */
+	events = (read_buf & TELEM_INFO_SRAMEVTS_MASK) >>
+					TELEM_INFO_SRAMEVTS_SHIFT;
+	event_regs = read_buf & TELEM_INFO_SRAMEVTS_MASK;
+	if ((events < TELEM_MAX_EVENTS_SRAM) ||
+		(event_regs < TELEM_MAX_EVENTS_SRAM)) {
+		dev_err(&pdev->dev, "PSS:Insufficient Space for SRAM Trace\n");
+		dev_err(&pdev->dev, "SRAM Events %d; Event Regs %d\n",
+					events, event_regs);
+		return -ENOMEM;
+	}
+
+	telm_conf->pss_config.min_period = TELEM_MIN_PERIOD(read_buf);
+	telm_conf->pss_config.max_period = TELEM_MAX_PERIOD(read_buf);
+
+	pss_evtconfig.evtmap = NULL;
+	pss_evtconfig.num_evts = TELEM_MAX_OS_ALLOCATED_EVENTS;
+	pss_evtconfig.period = TELEM_SAMPLING_DEFAULT_PERIOD;
+
+	ioss_evtconfig.evtmap = NULL;
+	ioss_evtconfig.num_evts = TELEM_MAX_OS_ALLOCATED_EVENTS;
+	ioss_evtconfig.period = TELEM_SAMPLING_DEFAULT_PERIOD;
+
+	ret = telemetry_setup_evtconfig(pss_evtconfig, ioss_evtconfig,
+					TELEM_RESET);
+	if (ret) {
+		dev_err(&pdev->dev, "TELEMTRY Setup Failed\n");
+		return ret;
+	}
+	return 0;
+}
+
+static int telemetry_plt_update_events(struct telemetry_evtconfig pss_evtconfig,
+				struct telemetry_evtconfig ioss_evtconfig)
+{
+	int err = 0;
+
+	if ((pss_evtconfig.num_evts > 0) &&
+		(TELEM_SAMPLE_PERIOD_INVALID(pss_evtconfig.period))) {
+		pr_err("PSS Sampling Period Out of Range\n");
+		return -EINVAL;
+	}
+
+	if ((ioss_evtconfig.num_evts > 0) &&
+		(TELEM_SAMPLE_PERIOD_INVALID(ioss_evtconfig.period))) {
+		pr_err("IOSS Sampling Period Out of Range\n");
+		return -EINVAL;
+	}
+
+	err = telemetry_setup_evtconfig(pss_evtconfig, ioss_evtconfig,
+					TELEM_UPDATE);
+	if (err)
+		pr_err("TELEMTRY Config Failed\n");
+
+	return err;
+}
+
+
+static int telemetry_plt_set_sampling_period(u8 pss_period, u8 ioss_period)
+{
+	int ret = 0;
+	u32 telem_ctrl = 0;
+
+	mutex_lock(&(telm_conf->telem_lock));
+	if (ioss_period) {
+		if (TELEM_SAMPLE_PERIOD_INVALID(ioss_period)) {
+			pr_err("IOSS Sampling Period Out of Range\n");
+			ret = -EINVAL;
+			goto out;
+		}
+
+		/* Get telemetry EVENT CTL */
+		ret = intel_pmc_ipc_command(PMC_IPC_PMC_TELEMTRY,
+			IOSS_TELEM_EVENT_CTL_READ, NULL, 0, &telem_ctrl,
+				IOSS_TELEM_READ_WORD);
+		if (ret) {
+			pr_err("IOSS TELEM_CTRL Read Failed\n");
+			goto out;
+		}
+
+		/* Disable Telemetry */
+		TELEM_DISABLE(telem_ctrl);
+
+		ret = intel_pmc_ipc_command(PMC_IPC_PMC_TELEMTRY,
+			IOSS_TELEM_EVENT_CTL_WRITE, (u8 *)&telem_ctrl,
+				IOSS_TELEM_EVT_CTRL_WRITE_SIZE, NULL, 0);
+		if (ret) {
+			pr_err("IOSS TELEM_CTRL Event Disable Write Failed\n");
+			goto out;
+		}
+
+		/* Enable Periodic Telemetry Events and enable SRAM trace */
+		TELEM_CLEAR_SAMPLE_PERIOD(telem_ctrl);
+		TELEM_ENABLE_SRAM_EVT_TRACE(telem_ctrl);
+		TELEM_ENABLE_PERIODIC(telem_ctrl);
+		telem_ctrl |= ioss_period;
+
+		ret = intel_pmc_ipc_command(PMC_IPC_PMC_TELEMTRY,
+			IOSS_TELEM_EVENT_CTL_WRITE, (u8 *)&telem_ctrl,
+				IOSS_TELEM_EVT_CTRL_WRITE_SIZE, NULL, 0);
+		if (ret) {
+			pr_err("IOSS TELEM_CTRL Event Enable Write Failed\n");
+			goto out;
+		}
+		telm_conf->ioss_config.curr_period = ioss_period;
+	}
+
+	if (pss_period) {
+		if (TELEM_SAMPLE_PERIOD_INVALID(pss_period)) {
+			pr_err("PSS Sampling Period Out of Range\n");
+			ret = -EINVAL;
+			goto out;
+		}
+
+		/* Get telemetry EVENT CTL */
+		ret = intel_punit_ipc_command(
+			IPC_PUNIT_BIOS_CMD_READ_TELE_EVENT_CTRL,
+				0, 0, NULL, &telem_ctrl);
+		if (ret) {
+			pr_err("PSS TELEM_CTRL Read Failed\n");
+			goto out;
+		}
+
+		/* Disable Telemetry */
+		TELEM_DISABLE(telem_ctrl);
+		ret = intel_punit_ipc_command(
+			IPC_PUNIT_BIOS_CMD_WRITE_TELE_EVENT_CTRL,
+				0, 0, &telem_ctrl, NULL);
+		if (ret) {
+			pr_err("PSS TELEM_CTRL Event Disable Write Failed\n");
+			goto out;
+		}
+
+		/* Enable Periodic Telemetry Events and enable SRAM trace */
+		TELEM_CLEAR_SAMPLE_PERIOD(telem_ctrl);
+		TELEM_ENABLE_SRAM_EVT_TRACE(telem_ctrl);
+		TELEM_ENABLE_PERIODIC(telem_ctrl);
+		telem_ctrl |= pss_period;
+
+		ret = intel_punit_ipc_command(
+			IPC_PUNIT_BIOS_CMD_WRITE_TELE_EVENT_CTRL,
+				0, 0, &telem_ctrl, NULL);
+		if (ret) {
+			pr_err("PSS TELEM_CTRL Event Enable Write Failed\n");
+			goto out;
+		}
+		telm_conf->pss_config.curr_period = pss_period;
+	}
+
+out:
+	mutex_unlock(&(telm_conf->telem_lock));
+	return ret;
+}
+
+
+static int telemetry_plt_get_sampling_period(u8 *pss_min_period,
+				u8 *pss_max_period, u8 *ioss_min_period,
+				u8 *ioss_max_period)
+{
+	struct telemetry_plt_config *telem_conf = telm_conf;
+
+	*pss_min_period = telem_conf->pss_config.min_period;
+	*pss_max_period = telem_conf->pss_config.max_period;
+	*ioss_min_period = telem_conf->ioss_config.min_period;
+	*ioss_max_period = telem_conf->ioss_config.max_period;
+
+	return 0;
+}
+
+
+static int telemetry_plt_reset_events(void)
+{
+	int err = 0;
+	struct telemetry_evtconfig pss_evtconfig, ioss_evtconfig;
+
+	pss_evtconfig.evtmap = NULL;
+	pss_evtconfig.num_evts = TELEM_MAX_OS_ALLOCATED_EVENTS;
+	pss_evtconfig.period = TELEM_SAMPLING_DEFAULT_PERIOD;
+
+	ioss_evtconfig.evtmap = NULL;
+	ioss_evtconfig.num_evts = TELEM_MAX_OS_ALLOCATED_EVENTS;
+	ioss_evtconfig.period = TELEM_SAMPLING_DEFAULT_PERIOD;
+
+	err = telemetry_setup_evtconfig(pss_evtconfig, ioss_evtconfig,
+					TELEM_RESET);
+	if (err)
+		pr_err("TELEMTRY Reset Failed\n");
+
+	return err;
+}
+
+
+static int telemetry_plt_get_eventconfig(struct telemetry_evtconfig *pss_config,
+				struct telemetry_evtconfig *ioss_config,
+				int pss_len, int ioss_len)
+{
+	u32 *pss_evtmap, *ioss_evtmap;
+	u32 index;
+	struct telemetry_plt_config *telem_conf = telm_conf;
+
+	pss_evtmap = pss_config->evtmap;
+	ioss_evtmap = ioss_config->evtmap;
+
+	mutex_lock(&(telm_conf->telem_lock));
+	pss_config->num_evts = telem_conf->pss_config.ssram_evts_used;
+	ioss_config->num_evts = telem_conf->ioss_config.ssram_evts_used;
+
+	pss_config->period = telm_conf->pss_config.curr_period;
+	ioss_config->period = telm_conf->ioss_config.curr_period;
+
+	if ((pss_len < telem_conf->pss_config.ssram_evts_used) ||
+		(ioss_len < telem_conf->ioss_config.ssram_evts_used)) {
+		mutex_unlock(&(telm_conf->telem_lock));
+		return -EINVAL;
+	}
+
+	for (index = 0; index < telem_conf->pss_config.ssram_evts_used;
+		index++) {
+		pss_evtmap[index] =
+			telem_conf->pss_config.telem_evts[index].evt_id;
+	}
+
+	for (index = 0; index < telem_conf->ioss_config.ssram_evts_used;
+		index++) {
+		ioss_evtmap[index] =
+			telem_conf->ioss_config.telem_evts[index].evt_id;
+	}
+
+	mutex_unlock(&(telm_conf->telem_lock));
+	return 0;
+}
+
+
+static int telemetry_plt_add_events(u8 num_pss_evts, u8 num_ioss_evts,
+		u32 *pss_evtmap, u32 *ioss_evtmap)
+{
+	int err = 0;
+	struct telemetry_plt_config *telem_conf = telm_conf;
+
+	struct telemetry_evtconfig pss_evtconfig, ioss_evtconfig;
+
+	pss_evtconfig.evtmap = pss_evtmap;
+	pss_evtconfig.num_evts = num_pss_evts;
+	pss_evtconfig.period = telem_conf->pss_config.curr_period;
+
+	ioss_evtconfig.evtmap = ioss_evtmap;
+	ioss_evtconfig.num_evts = num_ioss_evts;
+	ioss_evtconfig.period = telem_conf->ioss_config.curr_period;
+
+	err = telemetry_setup_evtconfig(pss_evtconfig, ioss_evtconfig,
+					TELEM_ADD);
+	if (err)
+		pr_err("TELEMTRY ADD Failed\n");
+
+	return err;
+}
+
+static int telem_evtlog_read(enum telemetry_unit telem_unit,
+		struct telem_ssram_region *ssram_region, u8 len)
+{
+	struct telemetry_unit_config *unit_config;
+	int ret, index, timeout = 0;
+	u64 timestamp_prev, timestamp_next;
+
+	ret = telem_get_unitconfig(telem_unit, &unit_config);
+	if (ret < 0)
+		return ret;
+
+	if (len > (unit_config->ssram_evts_used))
+		len = unit_config->ssram_evts_used;
+
+	do {
+		timestamp_prev = readq(unit_config->regmap);
+		if (!timestamp_prev) {
+			pr_err("SSRAM under update. Please Try Later!!\n");
+			return -EBUSY;
+		}
+
+		ssram_region->start_time = readq(unit_config->regmap +
+				TELEM_SSRAM_STARTTIME_OFFSET);
+
+		for (index = 0; index < len; index++) {
+			ssram_region->events[index] =
+				readq(unit_config->regmap +
+					TELEM_SSRAM_EVTLOG_OFFSET +
+						BYTES_PER_LONG*index);
+		}
+
+		timestamp_next = readq(unit_config->regmap);
+		if (!timestamp_next) {
+			pr_err("SSRAM under update. Please Try Later!!\n");
+			return -EBUSY;
+		}
+
+		if (timeout++ > TELEM_SSRAM_READ_TIMEOUT) {
+			pr_err("Timeout while reading Events!!\n");
+			return -EBUSY;
+		}
+
+	} while (timestamp_prev != timestamp_next);
+
+	ssram_region->timestamp = timestamp_next;
+
+	return len;
+}
+
+static int telemetry_plt_raw_read_eventlog(enum telemetry_unit telem_unit,
+		struct telemetry_evtlog *evtlog, int len, int log_all_evts)
+{
+	int index, idx1, ret = 0, readlen = len;
+	struct telemetry_plt_config *telem_conf = telm_conf;
+	struct telem_ssram_region ssram_region;
+	struct telemetry_evtmap *evtmap;
+
+	switch (telem_unit)	{
+	case TELEM_PSS:
+		evtmap = telem_conf->pss_config.telem_evts;
+		break;
+
+	case TELEM_IOSS:
+		evtmap = telem_conf->ioss_config.telem_evts;
+		break;
+
+	default:
+		pr_err("No Telemetry Unit Specified");
+		return -EINVAL;
+	}
+
+	if (!log_all_evts)
+		readlen = TELEM_MAX_EVENTS_SRAM;
+
+	ret = telem_evtlog_read(telem_unit, &ssram_region, readlen);
+	if (ret < 0)
+		return ret;
+
+	/* Invalid evt-id array specified via length mismatch */
+	if ((!log_all_evts) && (len > ret))
+		return -EINVAL;
+
+
+	if (log_all_evts)
+		for (index = 0; index < ret; index++) {
+			evtlog[index].telem_evtlog = ssram_region.events[index];
+			evtlog[index].telem_evtid = evtmap[index].evt_id;
+		}
+
+	else
+		for (index = 0, readlen = 0; (index < ret) && (readlen < len);
+								index++)
+			for (idx1 = 0; idx1 < len; idx1++)
+				if (evtmap[index].evt_id ==
+					evtlog[idx1].telem_evtid) {
+					evtlog[idx1].telem_evtlog =
+						ssram_region.events[index];
+					readlen++; /* Elements matched */
+					break;
+				}
+	return readlen;
+}
+
+static int telemetry_plt_read_eventlog(enum telemetry_unit telem_unit,
+		struct telemetry_evtlog *evtlog, int len, int log_all_evts)
+{
+	int ret;
+
+	mutex_lock(&(telm_conf->telem_lock));
+	ret = telemetry_plt_raw_read_eventlog(telem_unit, evtlog,
+						len, log_all_evts);
+	mutex_unlock(&(telm_conf->telem_lock));
+
+	return ret;
+}
+
+static int telemetry_plt_get_trace_verbosity(enum telemetry_unit telem_unit,
+						u32 *verbosity)
+{
+	int ret = 0;
+	u32 temp = 0;
+
+	if (NULL == verbosity)
+		return -EINVAL;
+
+	mutex_lock(&(telm_conf->telem_trace_lock));
+	switch (telem_unit) {
+	case TELEM_PSS:
+		ret = intel_punit_ipc_command(
+			IPC_PUNIT_BIOS_CMD_READ_TELE_TRACE_CTRL,
+				0, 0, NULL, &temp);
+		if (ret) {
+			pr_err("PSS TRACE_CTRL Read Failed\n");
+			goto err;
+		}
+
+		break;
+
+	case TELEM_IOSS:
+		ret = intel_pmc_ipc_command(PMC_IPC_PMC_TELEMTRY,
+			IOSS_TELEM_TRACE_CTL_READ, NULL, 0, &temp,
+				IOSS_TELEM_READ_WORD);
+		if (ret) {
+			pr_err("IOSS TRACE_CTL Read Failed\n");
+			goto err;
+		}
+
+		break;
+
+	default:
+		pr_err("No Telemetry Unit Specified");
+		ret = -EINVAL;
+		break;
+	}
+	TELEM_EXTRACT_VERBOSITY(temp, *verbosity);
+
+err:
+	mutex_unlock(&(telm_conf->telem_trace_lock));
+	return ret;
+}
+
+static int telemetry_plt_set_trace_verbosity(enum telemetry_unit telem_unit,
+						u32 verbosity)
+{
+	int ret = 0;
+	u32 temp = 0;
+
+	verbosity &= TELEM_TRC_VERBOSITY_MASK;
+
+	mutex_lock(&(telm_conf->telem_trace_lock));
+	switch (telem_unit) {
+	case TELEM_PSS:
+		ret = intel_punit_ipc_command(
+			IPC_PUNIT_BIOS_CMD_WRITE_TELE_TRACE_CTRL,
+				0, 0, &verbosity, NULL);
+		if (ret) {
+			pr_err("PSS TRACE_CTRL Verbosity Set Failed\n");
+			goto out;
+		}
+		break;
+
+	case TELEM_IOSS:
+		ret = intel_pmc_ipc_command(PMC_IPC_PMC_TELEMTRY,
+			IOSS_TELEM_TRACE_CTL_READ, NULL, 0, &temp,
+				IOSS_TELEM_READ_WORD);
+		if (ret) {
+			pr_err("IOSS TRACE_CTL Read Failed\n");
+			goto out;
+		}
+
+		TELEM_CLEAR_VERBOSITY_BITS(temp);
+		TELEM_SET_VERBOSITY_BITS(temp, verbosity);
+
+		ret = intel_pmc_ipc_command(PMC_IPC_PMC_TELEMTRY,
+			IOSS_TELEM_TRACE_CTL_WRITE, (u8 *)&temp,
+				IOSS_TELEM_WRITE_FOURBYTES, NULL, 0);
+		if (ret) {
+			pr_err("IOSS TRACE_CTL Verbosity Set Failed\n");
+			goto out;
+		}
+		break;
+
+	default:
+		pr_err("No Telemetry Unit Specified");
+		ret = -EINVAL;
+		break;
+	}
+
+out:
+	mutex_unlock(&(telm_conf->telem_trace_lock));
+	return ret;
+}
+
+static struct telemetry_core_ops telm_pltops = {
+	.update_events = telemetry_plt_update_events,
+	.set_sampling_period = telemetry_plt_set_sampling_period,
+	.get_sampling_period = telemetry_plt_get_sampling_period,
+	.reset_events = telemetry_plt_reset_events,
+	.get_eventconfig = telemetry_plt_get_eventconfig,
+	.add_events = telemetry_plt_add_events,
+	.read_eventlog = telemetry_plt_read_eventlog,
+	.raw_read_eventlog = telemetry_plt_raw_read_eventlog,
+	.get_trace_verbosity = telemetry_plt_get_trace_verbosity,
+	.set_trace_verbosity = telemetry_plt_set_trace_verbosity,
+};
+
+static int telemetry_pltdrv_probe(struct platform_device *pdev)
+{
+	int size, err = -ENOMEM;
+	const struct x86_cpu_id *id;
+	struct resource *res0 = NULL, *res1 = NULL;
+
+	id = x86_match_cpu(telemetry_cpu_ids);
+	if (!id)
+		return -ENODEV;
+
+	telm_conf = (struct telemetry_plt_config *)id->driver_data;
+
+	res0 = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res0) {
+		dev_err(&pdev->dev, "Fail to get iomem resource\n");
+		err = -EINVAL;
+		goto out;
+	}
+	size = resource_size(res0);
+	if (!devm_request_mem_region(&pdev->dev, res0->start, size,
+				pdev->name)) {
+		dev_err(&pdev->dev, "Fail to request iomem resouce\n");
+		err = -EBUSY;
+		goto out;
+	}
+	telm_conf->pss_config.ssram_base_addr = res0->start;
+	telm_conf->pss_config.ssram_size = size;
+
+	res1 = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	if (!res1) {
+		dev_err(&pdev->dev, "Fail to get iomem resource1\n");
+		err = -EINVAL;
+		goto out;
+	}
+	size = resource_size(res1);
+	if (!devm_request_mem_region(&pdev->dev, res1->start, size,
+				pdev->name)) {
+		dev_err(&pdev->dev, "Fail to request iomem resouce1\n");
+		err = -EBUSY;
+		goto out;
+	}
+
+	telm_conf->ioss_config.ssram_base_addr = res1->start;
+	telm_conf->ioss_config.ssram_size = size;
+
+	telm_conf->pss_config.regmap = ioremap_nocache(
+				(telm_conf->pss_config.ssram_base_addr),
+				telm_conf->pss_config.ssram_size);
+	if (!telm_conf->pss_config.regmap) {
+		dev_err(&pdev->dev, "TELEM::PSS-SSRAM ioremap failed\n");
+		err = -ENOMEM;
+		goto out;
+	}
+
+	telm_conf->ioss_config.regmap = ioremap_nocache(
+				(telm_conf->ioss_config.ssram_base_addr),
+				telm_conf->ioss_config.ssram_size);
+	if (!telm_conf->ioss_config.regmap) {
+		dev_err(&pdev->dev, "TELEM::IOSS-SSRAM ioremap failed\n");
+		err = -ENOMEM;
+		goto out;
+	}
+
+	mutex_init(&(telm_conf->telem_lock));
+	mutex_init(&(telm_conf->telem_trace_lock));
+
+	err = telemetry_setup(pdev);
+	if (err) {
+		dev_err(&pdev->dev, "TELEMTRY Setup Failed.\n");
+		goto out;
+	}
+
+	err = telemetry_set_pltdata(&telm_pltops, telm_conf);
+	if (err) {
+		dev_err(&pdev->dev, "TELEMTRY Set Pltops Failed.\n");
+		goto out;
+	}
+
+	return 0;
+
+out:
+	if (res0)
+		release_mem_region(res0->start, resource_size(res0));
+	if (res1)
+		release_mem_region(res1->start, resource_size(res1));
+	if (telm_conf->pss_config.regmap)
+		iounmap(telm_conf->pss_config.regmap);
+	if (telm_conf->ioss_config.regmap)
+		iounmap(telm_conf->ioss_config.regmap);
+
+	return err;
+}
+
+static int telemetry_pltdrv_remove(struct platform_device *pdev)
+{
+	telemetry_clear_pltdata();
+	iounmap(telm_conf->pss_config.regmap);
+	iounmap(telm_conf->ioss_config.regmap);
+
+	return 0;
+}
+
+static struct platform_driver telemetry_soc_driver = {
+	.probe		= telemetry_pltdrv_probe,
+	.remove		= telemetry_pltdrv_remove,
+	.driver		= {
+		.name	= DRIVER_NAME,
+	},
+};
+
+static int __init telemetry_module_init(void)
+{
+	pr_info(DRIVER_NAME ": version %s loaded\n", DRIVER_VERSION);
+	return platform_driver_register(&telemetry_soc_driver);
+}
+
+static void __exit telemetry_module_exit(void)
+{
+	platform_driver_unregister(&telemetry_soc_driver);
+}
+
+device_initcall(telemetry_module_init);
+module_exit(telemetry_module_exit);
+
+MODULE_AUTHOR("Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>");
+MODULE_DESCRIPTION("Intel SoC Telemetry Platform Driver");
+MODULE_VERSION(DRIVER_VERSION);
+MODULE_LICENSE("GPL v2");
-- 
1.7.9.5
