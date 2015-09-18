From: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
Subject: [PATCH 1/4] platform:x86: Add Intel Telemetry Core Driver
Date: Fri, 18 Sep 2015 10:14:45 +0530
Message-ID: <1442551485-24799-1-git-send-email-souvik.k.chakravarty@intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:34045 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751422AbbIREc4 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 18 Sep 2015 00:32:56 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: srinidhi.kasagar@intel.com, qipeng.zha@intel.com, dvhart@infradead.org, Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>

Intel PM Telemetry is a software mechanism via which various SoC
PM and performance related parameters like PM counters, firmware
trace verbosity, the status of different devices inside the SoC, etc
can be monitored and analyzed. The different samples that may be
monitored can be configured at runtime via exported APIs.

This patch adds the telemetry core driver that implements basic
exported APIs.

Signed-off-by: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
---
 arch/x86/include/asm/intel_telemetry.h      |  137 +++++++++
 drivers/platform/x86/intel_telemetry_core.c |  432 +++++++++++++++++++++++++++
 2 files changed, 569 insertions(+)
 create mode 100644 arch/x86/include/asm/intel_telemetry.h
 create mode 100644 drivers/platform/x86/intel_telemetry_core.c

diff --git a/arch/x86/include/asm/intel_telemetry.h b/arch/x86/include/asm/intel_telemetry.h
new file mode 100644
index 0000000..81e3405
--- /dev/null
+++ b/arch/x86/include/asm/intel_telemetry.h
@@ -0,0 +1,137 @@
+/*
+ * Intel SOC Telemetry Driver Header File
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
+ */
+#ifndef INTEL_TELEMETRY_H
+#define INTEL_TELEMETRY_H
+
+#define TELEM_MAX_EVENTS_SRAM		28
+#define TELEM_MAX_OS_ALLOCATED_EVENTS	20
+
+enum telemetry_unit {
+	TELEM_PSS = 0,
+	TELEM_IOSS,
+	TELEM_UNIT_NONE
+};
+
+struct telemetry_evtlog {
+	u32 telem_evtid;
+	u64 telem_evtlog;
+};
+
+struct telemetry_evtconfig {
+	u32 *evtmap;	/* Array of Event-IDs to Enable */
+	u8 num_evts;	/* Number of Events (<29) in evtmap. 0 for no update */
+	u8 period;	/* Sampling period to set */
+};
+
+struct telemetry_evtmap {
+	const char *name;
+	u32 evt_id;
+};
+
+struct telemetry_unit_config {
+	u8 ssram_evts_used;
+	u8 curr_period;
+	u8 max_period;
+	u8 min_period;
+	void __iomem *regmap;
+	u32 ssram_base_addr;
+	u32 ssram_size;
+	struct telemetry_evtmap *telem_evts;
+};
+
+struct telemetry_plt_config {
+	u8 telem_in_use;
+	struct mutex telem_lock;
+	struct mutex telem_trace_lock;
+	struct telemetry_unit_config pss_config;
+	struct telemetry_unit_config ioss_config;
+};
+
+struct telemetry_core_ops {
+	int (*update_events)(struct telemetry_evtconfig pss_evtconfig,
+				struct telemetry_evtconfig ioss_evtconfig);
+
+	int (*set_sampling_period)(u8 pss_period, u8 ioss_period);
+
+	int (*get_sampling_period)(u8 *pss_min_period, u8 *pss_max_period,
+				u8 *ioss_min_period, u8 *ioss_max_period);
+
+	int (*reset_events)(void);
+
+	int (*get_eventconfig)(struct telemetry_evtconfig *pss_evtconfig,
+				struct telemetry_evtconfig *ioss_evtconfig,
+					int pss_len, int ioss_len);
+
+	int (*add_events)(u8 num_pss_evts, u8 num_ioss_evts,
+					u32 *pss_evtmap, u32 *ioss_evtmap);
+
+	int (*read_eventlog)(enum telemetry_unit telem_unit,
+				struct telemetry_evtlog *evtlog,
+					int len, int log_all_evts);
+
+	int (*raw_read_eventlog)(enum telemetry_unit telem_unit,
+				struct telemetry_evtlog *evtlog,
+					int len, int log_all_evts);
+
+	int (*get_trace_verbosity)(enum telemetry_unit telem_unit,
+					u32 *verbosity);
+
+	int (*set_trace_verbosity)(enum telemetry_unit telem_unit,
+					u32 verbosity);
+};
+
+int telemetry_set_pltdata(struct telemetry_core_ops *ops,
+				struct telemetry_plt_config *pltconfig);
+int telemetry_clear_pltdata(void);
+int telemetry_pltconfig_valid(void);
+int telemetry_get_evtname(enum telemetry_unit telem_unit,
+				const char **name, int len);
+
+int telemetry_update_events(struct telemetry_evtconfig pss_evtconfig,
+				struct telemetry_evtconfig ioss_evtconfig);
+
+int telemetry_add_events(u8 num_pss_evts, u8 num_ioss_evts,
+				u32 *pss_evtmap, u32 *ioss_evtmap);
+
+int telemetry_reset_events(void);
+
+int telemetry_get_eventconfig(struct telemetry_evtconfig *pss_config,
+				struct telemetry_evtconfig *ioss_config,
+					int pss_len, int ioss_len);
+
+int telemetry_read_events(enum telemetry_unit telem_unit,
+				struct telemetry_evtlog *evtlog, int len);
+
+int telemetry_raw_read_events(enum telemetry_unit telem_unit,
+				struct telemetry_evtlog *evtlog, int len);
+
+int telemetry_read_eventlog(enum telemetry_unit telem_unit,
+				struct telemetry_evtlog *evtlog, int len);
+
+int telemetry_raw_read_eventlog(enum telemetry_unit telem_unit,
+				struct telemetry_evtlog *evtlog, int len);
+
+int telemetry_get_sampling_period(u8 *pss_min_period, u8 *pss_max_period,
+				u8 *ioss_min_period, u8 *ioss_max_period);
+
+int telemetry_set_sampling_period(u8 pss_period, u8 ioss_period);
+
+int telemetry_set_trace_verbosity(enum telemetry_unit telem_unit,
+							u32 verbosity);
+
+int telemetry_get_trace_verbosity(enum telemetry_unit telem_unit,
+							u32 *verbosity);
+
+#endif /* INTEL_TELEMETRY_H */
diff --git a/drivers/platform/x86/intel_telemetry_core.c b/drivers/platform/x86/intel_telemetry_core.c
new file mode 100644
index 0000000..687f523
--- /dev/null
+++ b/drivers/platform/x86/intel_telemetry_core.c
@@ -0,0 +1,432 @@
+/*
+ * Intel SoC Core Telemetry Driver
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
+ * Telemetry Framework provides platform related PM and performance stats.
+ * This file provides the core telemetry API implementation.
+ */
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/device.h>
+
+#include <asm/intel_telemetry.h>
+
+struct telemetry_core_config {
+	struct telemetry_core_ops *telem_ops;
+	struct telemetry_plt_config *plt_config;
+};
+
+static struct telemetry_core_config telm_core_conf;
+
+/*
+* telemetry_update_events() - This API updates the IOSS & PSS
+* Telemetry configuration to the provided config. Old config
+* is overwritten. Call telemetry_reset_events when logging is over
+* All sample period values should be in the form of:
+* bits[6:3] -> value; bits [0:2]-> Exponent; Period = (Value *16^Exponent)
+*
+* @pss_evtconfig: PSS related config. No change if num_evts = 0.
+* @pss_evtconfig: IOSS related config. No change if num_evts = 0.
+*
+* Return: 0 success, -ive for failure
+*/
+
+int telemetry_update_events(struct telemetry_evtconfig pss_evtconfig,
+				struct telemetry_evtconfig ioss_evtconfig)
+{
+	int ret = 0;
+
+	if (telm_core_conf.telem_ops &&
+		telm_core_conf.telem_ops->update_events)
+		ret = telm_core_conf.telem_ops->update_events(pss_evtconfig,
+								ioss_evtconfig);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(telemetry_update_events);
+
+
+/*
+* telemetry_set_sampling_period() - This API sets the IOSS & PSS sampling period
+* All values should be in the form of:
+* bits[6:3] -> value; bits [0:2]-> Exponent; Period = (Value *16^Exponent)
+*
+* @pss_period: placeholder for PSS Period to be set.
+*		Set to 0 if not required to be updated
+* @ioss_period: placeholder for IOSS Period to be set
+*		Set to 0 if not required to be updated
+* Return: 0 success, -ive for failure
+*/
+int telemetry_set_sampling_period(u8 pss_period, u8 ioss_period)
+{
+	int ret = 0;
+
+	if (telm_core_conf.telem_ops &&
+		telm_core_conf.telem_ops->set_sampling_period)
+		ret = telm_core_conf.telem_ops->set_sampling_period(pss_period,
+								ioss_period);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(telemetry_set_sampling_period);
+
+/*
+* telemetry_get_sampling_period() - This API gets the IOSS & PSS min and max
+* sampling period as supported by the Telemetry Hardware.
+* All values should be in the form of:
+* bits[6:3] -> value; bits [0:2]-> Exponent; Period = (Value *16^Exponent)
+*
+* @pss_min_period: placeholder for PSS Min Period supported
+* @pss_max_period: placeholder for PSS Max Period supported
+* @ioss_min_period: placeholder for IOSS Min Period supported
+* @ioss_max_period: placeholder for IOSS Max Period supported
+* Return: 0 success, -ive for failure
+*/
+
+int telemetry_get_sampling_period(u8 *pss_min_period, u8 *pss_max_period,
+				u8 *ioss_min_period, u8 *ioss_max_period)
+{
+	int ret = 0;
+
+	if (telm_core_conf.telem_ops &&
+		telm_core_conf.telem_ops->get_sampling_period)
+		ret = telm_core_conf.telem_ops->get_sampling_period(
+					pss_min_period,	pss_max_period,
+					ioss_min_period, ioss_max_period);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(telemetry_get_sampling_period);
+
+
+/*
+* telemetry_reset_events() - This API restores the IOSS & PSS
+* Telemetry configuration to the default config set at boot.
+*
+* Return: 0 success, -ive for failure
+*/
+
+int telemetry_reset_events(void)
+{
+	int ret = 0;
+
+	if (telm_core_conf.telem_ops &&
+		telm_core_conf.telem_ops->reset_events)
+		ret = telm_core_conf.telem_ops->reset_events();
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(telemetry_reset_events);
+
+/*
+* telemetry_get_eventconfig() - This API returns the pss
+* and ioss events enabled.
+*
+* @pss_evtconfig: Pointer to PSS related config.
+* @pss_evtconfig: Pointer to IOSS related config.
+* @pss_len: No of u32 elements allocated by caller for pss_evtconfig array
+* @ioss_len: No of u32 elements allocated for ioss_evtconfig array
+*
+* Return: 0 success, -ive for failure
+*/
+int telemetry_get_eventconfig(struct telemetry_evtconfig *pss_evtconfig,
+				struct telemetry_evtconfig *ioss_evtconfig,
+				int pss_len, int ioss_len)
+{
+	int ret = 0;
+
+	if (telm_core_conf.telem_ops &&
+		telm_core_conf.telem_ops->get_eventconfig)
+		ret = telm_core_conf.telem_ops->get_eventconfig(pss_evtconfig,
+					ioss_evtconfig, pss_len, ioss_len);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(telemetry_get_eventconfig);
+
+/*
+* telemetry_add_events() - This API adds the IOSS & PSS
+* telemetry configuration to the existing config. Old config
+* is appended. In case of total events > 28, it returns error
+* Call telemetry_reset_events to reset config after eventlog done
+*
+* @num_pss_evts: Number of PSS Events (<29) in pss_evtmap
+*		Can be 0
+* @num_ioss_evts: Number of IOSS Events (<29) in ioss_evtmap
+**		Can be 0
+* @pss_evtmap: Array of PSS Event-IDs to Enable
+* @ioss_evtmap: Array of PSS Event-IDs to Enable
+*
+* Return: 0 success, -ive for failure
+*/
+int telemetry_add_events(u8 num_pss_evts, u8 num_ioss_evts,
+		u32 *pss_evtmap, u32 *ioss_evtmap)
+{
+	int ret = 0;
+
+	if (telm_core_conf.telem_ops &&
+		telm_core_conf.telem_ops->add_events)
+		ret = telm_core_conf.telem_ops->add_events(num_pss_evts,
+					num_ioss_evts, pss_evtmap, ioss_evtmap);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(telemetry_add_events);
+
+/*
+* telemetry_read_events() - This API fetches the Telemetry samples
+* from PSS or IOSS as specified by evtlog.telem_evt_id.
+*
+* @telem_unit: Specify whether IOSS or PSS Read
+* @evtlog: Array of telemetry_evtlog structs to fill data
+*		evtlog.telem_evt_id specifies the ids to read
+* @len: Length of array of evtlog
+*
+* Return: number of eventlogs read for success, -ive for failure
+*/
+
+int telemetry_read_events(enum telemetry_unit telem_unit,
+		struct telemetry_evtlog *evtlog, int len)
+{
+	int ret = 0;
+
+	if (telm_core_conf.telem_ops &&
+		telm_core_conf.telem_ops->read_eventlog)
+		ret = telm_core_conf.telem_ops->read_eventlog(telem_unit,
+								evtlog, len, 0);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(telemetry_read_events);
+
+/*
+* telemetry_raw_read_events() - This API fetches the Telemetry log
+* from PSS or IOSS as specified by evtlog.telem_evt_id.
+* The caller must take care of locking in this case.
+*
+* @telem_unit: Specify whether IOSS or PSS Read
+* @evtlog: Array of telemetry_evtlog structs to fill data
+*		evtlog.telem_evt_id specifies the ids to read
+* @len: Length of array of evtlog
+*
+* Return: number of eventlogs read for success, -ive for failure
+*/
+
+int telemetry_raw_read_events(enum telemetry_unit telem_unit,
+		struct telemetry_evtlog *evtlog, int len)
+{
+	int ret = 0;
+
+	if (telm_core_conf.telem_ops &&
+		telm_core_conf.telem_ops->raw_read_eventlog)
+		ret = telm_core_conf.telem_ops->raw_read_eventlog(telem_unit,
+								evtlog, len, 0);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(telemetry_raw_read_events);
+
+/*
+* telemetry_read_eventlog() - This API fetches the Telemetry log
+* from PSS or IOSS.
+*
+* @telem_unit: Specify whether IOSS or PSS Read
+* @evtlog: Array of telemetry_evtlog structs to fill data
+* @len: Length of array of evtlog
+*
+* Return: number of eventlogs read for success, -ive for failure
+*/
+
+int telemetry_read_eventlog(enum telemetry_unit telem_unit,
+		struct telemetry_evtlog *evtlog, int len)
+{
+	int ret = 0;
+
+	if (telm_core_conf.telem_ops &&
+		telm_core_conf.telem_ops->read_eventlog)
+		ret = telm_core_conf.telem_ops->read_eventlog(telem_unit,
+								evtlog, len, 1);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(telemetry_read_eventlog);
+
+/*
+* telemetry_raw_read_eventlog() - This API fetches the Telemetry log
+* from PSS or IOSS. The caller must take care of
+* locking in this case.
+*
+* @telem_unit: Specify whether IOSS or PSS Read
+* @evtlog: Array of telemetry_evtlog structs to fill data
+* @len: Length of array of evtlog
+*
+* Return: number of eventlogs read for success, -ive for failure
+*/
+
+int telemetry_raw_read_eventlog(enum telemetry_unit telem_unit,
+		struct telemetry_evtlog *evtlog, int len)
+{
+	int ret = 0;
+
+	if (telm_core_conf.telem_ops &&
+		telm_core_conf.telem_ops->raw_read_eventlog)
+		ret = telm_core_conf.telem_ops->raw_read_eventlog(telem_unit,
+								evtlog, len, 1);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(telemetry_raw_read_eventlog);
+
+
+/*
+* telemetry_get_trace_verbosity() - This API gets the IOSS & PSS
+* Trace verbosity.
+*
+* @telem_unit: Specify whether IOSS or PSS Read
+* @verbosity: Pointer to return Verbosity
+*
+* Return: 0 success, -ive for failure
+*/
+int telemetry_get_trace_verbosity(enum telemetry_unit telem_unit,
+						u32 *verbosity)
+{
+	int ret = 0;
+
+	*verbosity = 0;
+	if (telm_core_conf.telem_ops &&
+		telm_core_conf.telem_ops->get_trace_verbosity)
+		ret = telm_core_conf.telem_ops->get_trace_verbosity(telem_unit,
+								verbosity);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(telemetry_get_trace_verbosity);
+
+
+/*
+* telemetry_set_trace_verbosity() - This API updates the IOSS & PSS
+* Trace verbosity.
+*
+* @telem_unit: Specify whether IOSS or PSS Read
+* @verbosity: Verbosity to set
+*
+* Return: 0 success, -ive for failure
+*/
+int telemetry_set_trace_verbosity(enum telemetry_unit telem_unit, u32 verbosity)
+{
+	int ret = 0;
+
+	if (telm_core_conf.telem_ops &&
+		telm_core_conf.telem_ops->set_trace_verbosity)
+		ret = telm_core_conf.telem_ops->set_trace_verbosity(telem_unit,
+								verbosity);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(telemetry_set_trace_verbosity);
+
+int telemetry_set_pltdata(struct telemetry_core_ops *ops,
+				struct telemetry_plt_config *pltconfig)
+{
+	telm_core_conf.telem_ops = ops;
+	telm_core_conf.plt_config = pltconfig;
+
+	return 0;
+}
+
+int telemetry_clear_pltdata(void)
+{
+	telm_core_conf.telem_ops = NULL;
+	telm_core_conf.plt_config = NULL;
+
+	return 0;
+}
+
+int telemetry_pltconfig_valid(void)
+{
+	if (telm_core_conf.plt_config)
+		return 0;
+
+	else
+		return -EINVAL;
+}
+
+static inline int telemetry_get_pssevtname(enum telemetry_unit telem_unit,
+					const char **name, int len)
+{
+	int i = 0;
+
+	if (!(telm_core_conf.plt_config))
+		return -EINVAL;
+
+	if (len > telm_core_conf.plt_config->pss_config.ssram_evts_used)
+		len = telm_core_conf.plt_config->pss_config.ssram_evts_used;
+
+	for (i = 0; i < len; i++)
+		name[i] =
+		telm_core_conf.plt_config->pss_config.telem_evts[i].name;
+
+	return 0;
+}
+
+static inline int telemetry_get_iossevtname(enum telemetry_unit telem_unit,
+					const char **name, int len)
+{
+	int i = 0;
+
+	if (!(telm_core_conf.plt_config))
+		return -EINVAL;
+
+	if (len > telm_core_conf.plt_config->ioss_config.ssram_evts_used)
+		len = telm_core_conf.plt_config->ioss_config.ssram_evts_used;
+
+	for (i = 0; i < len; i++)
+		name[i] =
+		telm_core_conf.plt_config->ioss_config.telem_evts[i].name;
+
+	return 0;
+
+}
+
+int telemetry_get_evtname(enum telemetry_unit telem_unit,
+				const char **name, int len)
+{
+	int ret;
+
+	if (TELEM_PSS == telem_unit)
+		ret = telemetry_get_pssevtname(telem_unit, name, len);
+
+	else if (TELEM_IOSS == telem_unit)
+		ret = telemetry_get_iossevtname(telem_unit, name, len);
+
+	else
+		ret = -EINVAL;
+
+	return ret;
+}
+
+
+static int __init telemetry_module_init(void)
+{
+	pr_info("[TELEM]::Core Init\n");
+	return 0;
+}
+
+static void __exit telemetry_module_exit(void)
+{
+}
+
+module_init(telemetry_module_init);
+module_exit(telemetry_module_exit);
+
+MODULE_AUTHOR("Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>");
+MODULE_DESCRIPTION("Intel SoC Telemetry Interface");
+MODULE_LICENSE("GPL v2");
-- 
1.7.9.5
