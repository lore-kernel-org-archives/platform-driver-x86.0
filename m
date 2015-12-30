From: "Chakravarty, Souvik K" <souvik.k.chakravarty@intel.com>
Subject: RE: [PATCH v3 1/5] platform:x86: Add Intel Telemetry Core Driver
Date: Wed, 30 Dec 2015 02:54:14 +0000
Message-ID: <5F7315E704FA0841B5DFCE90329B2BB42B74AD4E@BGSMSX105.gar.corp.intel.com>
References: <1450867350-11253-1-git-send-email-souvik.k.chakravarty@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:15190 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752158AbbL3CyT convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 29 Dec 2015 21:54:19 -0500
In-Reply-To: <1450867350-11253-1-git-send-email-souvik.k.chakravarty@intel.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Cc: "dvhart@infradead.org" <dvhart@infradead.org>, "Kasagar, Srinidhi" <srinidhi.kasagar@intel.com>, "Zha, Qipeng" <qipeng.zha@intel.com>, "Muralidhar, Rajeev D" <rajeev.d.muralidhar@intel.com>, "Ghorai, Sukumar" <sukumar.ghorai@intel.com>, "Yu, Ong Hock" <ong.hock.yu@intel.com>, "Li, Aubrey" <aubrey.li@intel.com>, "rjw@rjwysocki.net" <rjw@rjwysocki.net>

+ Rafael

-----Original Message-----
From: Chakravarty, Souvik K 
Sent: Wednesday, December 23, 2015 4:13 PM
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org; Kasagar, Srinidhi <srinidhi.kasagar@intel.com>; Zha, Qipeng <qipeng.zha@intel.com>; Muralidhar, Rajeev D <rajeev.d.muralidhar@intel.com>; Ghorai, Sukumar <sukumar.ghorai@intel.com>; Yu, Ong Hock <ong.hock.yu@intel.com>; Li, Aubrey <aubrey.li@intel.com>; Chakravarty, Souvik K <souvik.k.chakravarty@intel.com>
Subject: [PATCH v3 1/5] platform:x86: Add Intel Telemetry Core Driver

Intel PM Telemetry is a software mechanism via which various SoC PM and performance related parameters like PM counters, firmware trace verbosity, the status of different devices inside the SoC, etc can be monitored and analyzed. The different samples that may be monitored can be configured at runtime via exported APIs.

This patch adds the telemetry core driver that implements basic exported APIs.

Signed-off-by: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>

---
Changes in v3:
* Clean code using checkpatch.pl from Kernel v4.3-rc4
---
Changes in v2:
* Fix issues in code style, indentation & comments
* Follow kernel-doc sytle comments
* Changed Banner to include "All Rights Reserved"
* Change telemetry_plt_config.telem_in_use type to bool
* Introduce Default empty platform specific callbacks to remove NULL checks
* Use pr_fmt in init
* Change to MODULE_LICENSE to GPL
---
 arch/x86/include/asm/intel_telemetry.h      |  147 +++++++++
 drivers/platform/x86/intel_telemetry_core.c |  464 +++++++++++++++++++++++++++
 2 files changed, 611 insertions(+)
 create mode 100644 arch/x86/include/asm/intel_telemetry.h
 create mode 100644 drivers/platform/x86/intel_telemetry_core.c

diff --git a/arch/x86/include/asm/intel_telemetry.h b/arch/x86/include/asm/intel_telemetry.h
new file mode 100644
index 0000000..ed65fe7
--- /dev/null
+++ b/arch/x86/include/asm/intel_telemetry.h
@@ -0,0 +1,147 @@
+/*
+ * Intel SOC Telemetry Driver Header File
+ * Copyright (C) 2015, Intel Corporation.
+ * All Rights Reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify 
+it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but 
+WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
+or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public 
+License for
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
+	/* Array of Event-IDs to Enable */
+	u32 *evtmap;
+
+	/* Number of Events (<29) in evtmap */
+	u8 num_evts;
+
+	/* Sampling period */
+	u8 period;
+};
+
+struct telemetry_evtmap {
+	const char *name;
+	u32 evt_id;
+};
+
+struct telemetry_unit_config {
+	struct telemetry_evtmap *telem_evts;
+	void __iomem *regmap;
+	u32 ssram_base_addr;
+	u8 ssram_evts_used;
+	u8 curr_period;
+	u8 max_period;
+	u8 min_period;
+	u32 ssram_size;
+
+};
+
+struct telemetry_plt_config {
+	struct telemetry_unit_config pss_config;
+	struct telemetry_unit_config ioss_config;
+	struct mutex telem_trace_lock;
+	struct mutex telem_lock;
+	bool telem_in_use;
+};
+
+struct telemetry_core_ops {
+	int (*get_sampling_period)(u8 *pss_min_period, u8 *pss_max_period,
+				   u8 *ioss_min_period, u8 *ioss_max_period);
+
+	int (*get_eventconfig)(struct telemetry_evtconfig *pss_evtconfig,
+			       struct telemetry_evtconfig *ioss_evtconfig,
+			       int pss_len, int ioss_len);
+
+	int (*update_events)(struct telemetry_evtconfig pss_evtconfig,
+			     struct telemetry_evtconfig ioss_evtconfig);
+
+	int (*set_sampling_period)(u8 pss_period, u8 ioss_period);
+
+	int (*get_trace_verbosity)(enum telemetry_unit telem_unit,
+				   u32 *verbosity);
+
+	int (*set_trace_verbosity)(enum telemetry_unit telem_unit,
+				   u32 verbosity);
+
+	int (*raw_read_eventlog)(enum telemetry_unit telem_unit,
+				 struct telemetry_evtlog *evtlog,
+				 int len, int log_all_evts);
+
+	int (*read_eventlog)(enum telemetry_unit telem_unit,
+			     struct telemetry_evtlog *evtlog,
+			     int len, int log_all_evts);
+
+	int (*add_events)(u8 num_pss_evts, u8 num_ioss_evts,
+			  u32 *pss_evtmap, u32 *ioss_evtmap);
+
+	int (*reset_events)(void);
+};
+
+int telemetry_set_pltdata(struct telemetry_core_ops *ops,
+			  struct telemetry_plt_config *pltconfig);
+
+int telemetry_clear_pltdata(void);
+
+int telemetry_pltconfig_valid(void);
+
+int telemetry_get_evtname(enum telemetry_unit telem_unit,
+			  const char **name, int len);
+
+int telemetry_update_events(struct telemetry_evtconfig pss_evtconfig,
+			    struct telemetry_evtconfig ioss_evtconfig);
+
+int telemetry_add_events(u8 num_pss_evts, u8 num_ioss_evts,
+			 u32 *pss_evtmap, u32 *ioss_evtmap);
+
+int telemetry_reset_events(void);
+
+int telemetry_get_eventconfig(struct telemetry_evtconfig *pss_config,
+			      struct telemetry_evtconfig *ioss_config,
+			      int pss_len, int ioss_len);
+
+int telemetry_read_events(enum telemetry_unit telem_unit,
+			  struct telemetry_evtlog *evtlog, int len);
+
+int telemetry_raw_read_events(enum telemetry_unit telem_unit,
+			      struct telemetry_evtlog *evtlog, int len);
+
+int telemetry_read_eventlog(enum telemetry_unit telem_unit,
+			    struct telemetry_evtlog *evtlog, int len);
+
+int telemetry_raw_read_eventlog(enum telemetry_unit telem_unit,
+				struct telemetry_evtlog *evtlog, int len);
+
+int telemetry_get_sampling_period(u8 *pss_min_period, u8 *pss_max_period,
+				  u8 *ioss_min_period, u8 *ioss_max_period);
+
+int telemetry_set_sampling_period(u8 pss_period, u8 ioss_period);
+
+int telemetry_set_trace_verbosity(enum telemetry_unit telem_unit,
+				  u32 verbosity);
+
+int telemetry_get_trace_verbosity(enum telemetry_unit telem_unit,
+				  u32 *verbosity);
+
+#endif /* INTEL_TELEMETRY_H */
diff --git a/drivers/platform/x86/intel_telemetry_core.c b/drivers/platform/x86/intel_telemetry_core.c
new file mode 100644
index 0000000..322c4c8
--- /dev/null
+++ b/drivers/platform/x86/intel_telemetry_core.c
@@ -0,0 +1,464 @@
+/*
+ * Intel SoC Core Telemetry Driver
+ * Copyright (C) 2015, Intel Corporation.
+ * All Rights Reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify 
+it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but 
+WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
+or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public 
+License for
+ * more details.
+ *
+ * Telemetry Framework provides platform related PM and performance statistics.
+ * This file provides the core telemetry API implementation.
+ */
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/device.h>
+
+#include <asm/intel_telemetry.h>
+
+#define DRIVER_NAME "intel_telemetry_core"
+
+struct telemetry_core_config {
+	struct telemetry_plt_config *plt_config;
+	struct telemetry_core_ops *telem_ops;
+};
+
+static struct telemetry_core_config telm_core_conf;
+
+static int telemetry_def_update_events(struct telemetry_evtconfig pss_evtconfig,
+				      struct telemetry_evtconfig ioss_evtconfig) {
+	return 0;
+}
+
+static int telemetry_def_set_sampling_period(u8 pss_period, u8 
+ioss_period) {
+	return 0;
+}
+
+static int telemetry_def_get_sampling_period(u8 *pss_min_period,
+					     u8 *pss_max_period,
+					     u8 *ioss_min_period,
+					     u8 *ioss_max_period)
+{
+	return 0;
+}
+
+static int telemetry_def_get_eventconfig(
+			struct telemetry_evtconfig *pss_evtconfig,
+			struct telemetry_evtconfig *ioss_evtconfig,
+			int pss_len, int ioss_len)
+{
+	return 0;
+}
+
+static int telemetry_def_get_trace_verbosity(enum telemetry_unit telem_unit,
+					     u32 *verbosity)
+{
+	return 0;
+}
+
+
+static int telemetry_def_set_trace_verbosity(enum telemetry_unit telem_unit,
+					     u32 verbosity)
+{
+	return 0;
+}
+
+static int telemetry_def_raw_read_eventlog(enum telemetry_unit telem_unit,
+					   struct telemetry_evtlog *evtlog,
+					   int len, int log_all_evts)
+{
+	return 0;
+}
+
+static int telemetry_def_read_eventlog(enum telemetry_unit telem_unit,
+				       struct telemetry_evtlog *evtlog,
+				       int len, int log_all_evts)
+{
+	return 0;
+}
+
+static int telemetry_def_add_events(u8 num_pss_evts, u8 num_ioss_evts,
+				    u32 *pss_evtmap, u32 *ioss_evtmap) {
+	return 0;
+}
+
+static int telemetry_def_reset_events(void) {
+	return 0;
+}
+
+static struct telemetry_core_ops telm_defpltops = {
+	.set_sampling_period = telemetry_def_set_sampling_period,
+	.get_sampling_period = telemetry_def_get_sampling_period,
+	.get_trace_verbosity = telemetry_def_get_trace_verbosity,
+	.set_trace_verbosity = telemetry_def_set_trace_verbosity,
+	.raw_read_eventlog = telemetry_def_raw_read_eventlog,
+	.get_eventconfig = telemetry_def_get_eventconfig,
+	.read_eventlog = telemetry_def_read_eventlog,
+	.update_events = telemetry_def_update_events,
+	.reset_events = telemetry_def_reset_events,
+	.add_events = telemetry_def_add_events, };
+
+/**
+ * telemetry_update_events() - Update telemetry Configuration
+ * @pss_evtconfig: PSS related config. No change if num_evts = 0.
+ * @pss_evtconfig: IOSS related config. No change if num_evts = 0.
+ *
+ * This API updates the IOSS & PSS Telemetry configuration. Old config
+ * is overwritten. Call telemetry_reset_events when logging is over
+ * All sample period values should be in the form of:
+ * bits[6:3] -> value; bits [0:2]-> Exponent; Period = (Value 
+*16^Exponent)
+ *
+ * Return: 0 success, < 0 for failure
+ */
+int telemetry_update_events(struct telemetry_evtconfig pss_evtconfig,
+			    struct telemetry_evtconfig ioss_evtconfig) {
+	return telm_core_conf.telem_ops->update_events(pss_evtconfig,
+						       ioss_evtconfig);
+}
+EXPORT_SYMBOL_GPL(telemetry_update_events);
+
+
+/**
+ * telemetry_set_sampling_period() - Sets the IOSS & PSS sampling 
+period
+ * @pss_period:  placeholder for PSS Period to be set.
+ *		 Set to 0 if not required to be updated
+ * @ioss_period: placeholder for IOSS Period to be set
+ *		 Set to 0 if not required to be updated
+ *
+ * All values should be in the form of:
+ * bits[6:3] -> value; bits [0:2]-> Exponent; Period = (Value 
+*16^Exponent)
+ *
+ * Return: 0 success, < 0 for failure
+ */
+int telemetry_set_sampling_period(u8 pss_period, u8 ioss_period) {
+	return telm_core_conf.telem_ops->set_sampling_period(pss_period,
+							     ioss_period);
+}
+EXPORT_SYMBOL_GPL(telemetry_set_sampling_period);
+
+/**
+ * telemetry_get_sampling_period() - Get IOSS & PSS min & max sampling 
+period
+ * @pss_min_period:  placeholder for PSS Min Period supported
+ * @pss_max_period:  placeholder for PSS Max Period supported
+ * @ioss_min_period: placeholder for IOSS Min Period supported
+ * @ioss_max_period: placeholder for IOSS Max Period supported
+ *
+ * All values should be in the form of:
+ * bits[6:3] -> value; bits [0:2]-> Exponent; Period = (Value 
+*16^Exponent)
+ *
+ * Return: 0 success, < 0 for failure
+ */
+int telemetry_get_sampling_period(u8 *pss_min_period, u8 *pss_max_period,
+				  u8 *ioss_min_period, u8 *ioss_max_period) {
+	return telm_core_conf.telem_ops->get_sampling_period(pss_min_period,
+							     pss_max_period,
+							     ioss_min_period,
+							     ioss_max_period);
+}
+EXPORT_SYMBOL_GPL(telemetry_get_sampling_period);
+
+
+/**
+ * telemetry_reset_events() - Restore the IOSS & PSS configuration to 
+default
+ *
+ * Return: 0 success, < 0 for failure
+ */
+int telemetry_reset_events(void)
+{
+	return telm_core_conf.telem_ops->reset_events();
+}
+EXPORT_SYMBOL_GPL(telemetry_reset_events);
+
+/**
+ * telemetry_get_eventconfig() - Returns the pss and ioss events 
+enabled
+ * @pss_evtconfig: Pointer to PSS related configuration.
+ * @pss_evtconfig: Pointer to IOSS related configuration.
+ * @pss_len:	   Number of u32 elements allocated for pss_evtconfig array
+ * @ioss_len:	   Number of u32 elements allocated for ioss_evtconfig array
+ *
+ * Return: 0 success, < 0 for failure
+ */
+int telemetry_get_eventconfig(struct telemetry_evtconfig *pss_evtconfig,
+			      struct telemetry_evtconfig *ioss_evtconfig,
+			      int pss_len, int ioss_len)
+{
+	return telm_core_conf.telem_ops->get_eventconfig(pss_evtconfig,
+							 ioss_evtconfig,
+							 pss_len, ioss_len);
+}
+EXPORT_SYMBOL_GPL(telemetry_get_eventconfig);
+
+/**
+ * telemetry_add_events() - Add IOSS & PSS configuration to existing settings.
+ * @num_pss_evts:  Number of PSS Events (<29) in pss_evtmap. Can be 0.
+ * @num_ioss_evts: Number of IOSS Events (<29) in ioss_evtmap. Can be 0.
+ * @pss_evtmap:    Array of PSS Event-IDs to Enable
+ * @ioss_evtmap:   Array of PSS Event-IDs to Enable
+ *
+ * Events are appended to Old Configuration. In case of total events > 
+28, it
+ * returns error. Call telemetry_reset_events to reset after eventlog 
+done
+ *
+ * Return: 0 success, < 0 for failure
+ */
+int telemetry_add_events(u8 num_pss_evts, u8 num_ioss_evts,
+			 u32 *pss_evtmap, u32 *ioss_evtmap)
+{
+	return telm_core_conf.telem_ops->add_events(num_pss_evts,
+						    num_ioss_evts, pss_evtmap,
+						    ioss_evtmap);
+}
+EXPORT_SYMBOL_GPL(telemetry_add_events);
+
+/**
+ * telemetry_read_events() - Fetches samples as specified by 
+evtlog.telem_evt_id
+ * @telem_unit: Specify whether IOSS or PSS Read
+ * @evtlog:     Array of telemetry_evtlog structs to fill data
+ *		evtlog.telem_evt_id specifies the ids to read
+ * @len:	Length of array of evtlog
+ *
+ * Return: number of eventlogs read for success, < 0 for failure  */ 
+int telemetry_read_events(enum telemetry_unit telem_unit,
+			  struct telemetry_evtlog *evtlog, int len) {
+	return telm_core_conf.telem_ops->read_eventlog(telem_unit, evtlog,
+						       len, 0);
+}
+EXPORT_SYMBOL_GPL(telemetry_read_events);
+
+/**
+ * telemetry_raw_read_events() - Fetch samples specified by 
+evtlog.telem_evt_id
+ * @telem_unit: Specify whether IOSS or PSS Read
+ * @evtlog:	Array of telemetry_evtlog structs to fill data
+ *		evtlog.telem_evt_id specifies the ids to read
+ * @len:	Length of array of evtlog
+ *
+ * The caller must take care of locking in this case.
+ *
+ * Return: number of eventlogs read for success, < 0 for failure  */ 
+int telemetry_raw_read_events(enum telemetry_unit telem_unit,
+			      struct telemetry_evtlog *evtlog, int len) {
+	return telm_core_conf.telem_ops->raw_read_eventlog(telem_unit, evtlog,
+							   len, 0);
+}
+EXPORT_SYMBOL_GPL(telemetry_raw_read_events);
+
+/**
+ * telemetry_read_eventlog() - Fetch the Telemetry log from PSS or IOSS
+ * @telem_unit: Specify whether IOSS or PSS Read
+ * @evtlog:	Array of telemetry_evtlog structs to fill data
+ * @len:	Length of array of evtlog
+ *
+ * Return: number of eventlogs read for success, < 0 for failure  */ 
+int telemetry_read_eventlog(enum telemetry_unit telem_unit,
+			    struct telemetry_evtlog *evtlog, int len) {
+	return telm_core_conf.telem_ops->read_eventlog(telem_unit, evtlog,
+						       len, 1);
+}
+EXPORT_SYMBOL_GPL(telemetry_read_eventlog);
+
+/**
+ * telemetry_raw_read_eventlog() - Fetch the Telemetry log from PSS or 
+IOSS
+ * @telem_unit: Specify whether IOSS or PSS Read
+ * @evtlog:	Array of telemetry_evtlog structs to fill data
+ * @len:	Length of array of evtlog
+ *
+ * The caller must take care of locking in this case.
+ *
+ * Return: number of eventlogs read for success, < 0 for failure  */ 
+int telemetry_raw_read_eventlog(enum telemetry_unit telem_unit,
+				struct telemetry_evtlog *evtlog, int len) {
+	return telm_core_conf.telem_ops->raw_read_eventlog(telem_unit, evtlog,
+							   len, 1);
+}
+EXPORT_SYMBOL_GPL(telemetry_raw_read_eventlog);
+
+
+/**
+ * telemetry_get_trace_verbosity() - Get the IOSS & PSS Trace verbosity
+ * @telem_unit: Specify whether IOSS or PSS Read
+ * @verbosity:	Pointer to return Verbosity
+ *
+ * Return: 0 success, < 0 for failure
+ */
+int telemetry_get_trace_verbosity(enum telemetry_unit telem_unit,
+				  u32 *verbosity)
+{
+	return telm_core_conf.telem_ops->get_trace_verbosity(telem_unit,
+							     verbosity);
+}
+EXPORT_SYMBOL_GPL(telemetry_get_trace_verbosity);
+
+
+/**
+ * telemetry_set_trace_verbosity() - Update the IOSS & PSS Trace 
+verbosity
+ * @telem_unit: Specify whether IOSS or PSS Read
+ * @verbosity:	Verbosity to set
+ *
+ * Return: 0 success, < 0 for failure
+ */
+int telemetry_set_trace_verbosity(enum telemetry_unit telem_unit, u32 
+verbosity) {
+	return telm_core_conf.telem_ops->set_trace_verbosity(telem_unit,
+							     verbosity);
+}
+EXPORT_SYMBOL_GPL(telemetry_set_trace_verbosity);
+
+/**
+ * telemetry_set_pltdata() - Set the platform specific Data
+ * @ops:	Pointer to ops structure
+ * @pltconfig:	Platform config data
+ *
+ * Usage by other than telemetry pltdrv module is invalid
+ *
+ * Return: 0 success, < 0 for failure
+ */
+int telemetry_set_pltdata(struct telemetry_core_ops *ops,
+			  struct telemetry_plt_config *pltconfig) {
+	if (ops)
+		telm_core_conf.telem_ops = ops;
+
+	if (pltconfig)
+		telm_core_conf.plt_config = pltconfig;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(telemetry_set_pltdata);
+
+/**
+ * telemetry_clear_pltdata() - Clear the platform specific Data
+ *
+ * Usage by other than telemetry pltdrv module is invalid
+ *
+ * Return: 0 success, < 0 for failure
+ */
+int telemetry_clear_pltdata(void)
+{
+	telm_core_conf.telem_ops = &telm_defpltops;
+	telm_core_conf.plt_config = NULL;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(telemetry_clear_pltdata);
+
+/**
+ * telemetry_pltconfig_valid() - Checkif platform config is valid
+ *
+ * Usage by other than telemetry module is invalid
+ *
+ * Return: 0 success, < 0 for failure
+ */
+int telemetry_pltconfig_valid(void)
+{
+	if (telm_core_conf.plt_config)
+		return 0;
+
+	else
+		return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(telemetry_pltconfig_valid);
+
+static inline int telemetry_get_pssevtname(enum telemetry_unit telem_unit,
+					   const char **name, int len)
+{
+	struct telemetry_unit_config psscfg;
+	int i = 0;
+
+	if (!telm_core_conf.plt_config)
+		return -EINVAL;
+
+	psscfg = telm_core_conf.plt_config->pss_config;
+
+	if (len > psscfg.ssram_evts_used)
+		len = psscfg.ssram_evts_used;
+
+	for (i = 0; i < len; i++)
+		name[i] = psscfg.telem_evts[i].name;
+
+	return 0;
+}
+
+static inline int telemetry_get_iossevtname(enum telemetry_unit telem_unit,
+					    const char **name, int len)
+{
+	struct telemetry_unit_config iosscfg;
+	int i = 0;
+
+	if (!(telm_core_conf.plt_config))
+		return -EINVAL;
+
+	iosscfg = telm_core_conf.plt_config->ioss_config;
+
+	if (len > iosscfg.ssram_evts_used)
+		len = iosscfg.ssram_evts_used;
+
+	for (i = 0; i < len; i++)
+		name[i] = iosscfg.telem_evts[i].name;
+
+	return 0;
+
+}
+
+/**
+ * telemetry_get_evtname() - Checkif platform config is valid
+ * @telem_unit:	Telemetry Unit to check
+ * @name:	Array of character pointers to contain name
+ * @len:	length of array name provided by user
+ *
+ * Usage by other than telemetry debugfs module is invalid
+ *
+ * Return: 0 success, < 0 for failure
+ */
+int telemetry_get_evtname(enum telemetry_unit telem_unit,
+			  const char **name, int len)
+{
+	int ret = -EINVAL;
+
+	if (telem_unit == TELEM_PSS)
+		ret = telemetry_get_pssevtname(telem_unit, name, len);
+
+	else if (telem_unit == TELEM_IOSS)
+		ret = telemetry_get_iossevtname(telem_unit, name, len);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(telemetry_get_evtname);
+
+static int __init telemetry_module_init(void) {
+	pr_info(pr_fmt(DRIVER_NAME) " Init\n");
+
+	telm_core_conf.telem_ops = &telm_defpltops;
+	return 0;
+}
+
+static void __exit telemetry_module_exit(void) { }
+
+module_init(telemetry_module_init);
+module_exit(telemetry_module_exit);
+
+MODULE_AUTHOR("Souvik Kumar Chakravarty 
+<souvik.k.chakravarty@intel.com>");
+MODULE_DESCRIPTION("Intel SoC Telemetry Interface"); 
+MODULE_LICENSE("GPL");
--
1.7.9.5
