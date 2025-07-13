Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A8A189B8C
	for <platform-driver-x86@vger.kernel.org>; Sun, 13 Jul 2025 17:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752427825; cv=none; b=gl63vcpBPwftRltehyvWOrrTmo9nagf9FPaks2405Csyw40eAoe7XAOK8QN6s7LFTwCx3YnVYWymnsJX4ugOvmgKrCjLv0u5qTm1R06G2MydyTEx/DyF61cMQeV9sX1sjhgmgQHyhsOg8AX3Hjh1WDhATJwh1TN5eZDIUY2z7jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752427825; c=relaxed/simple;
	bh=XYQD54mAUZyaa1e3o248AW8PcKJ0A/dTtE4HKXayWzw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PUHo9s3bnq+yfBU1wQruoBjje34inWbUztmbUDdm4sCFQaQAqjP6RstjMdXmk3IQz3Z8gmVxtWg7RkGoS4nyhclgu/O52inPVJujDMtgUndAGwNRQwLGOhiBVV+GgLyH46jHvJR0PFJZrtKmG8p80Q2qsbTNoR7mZ/MPYnYE1AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AOjV9kWp; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AOjV9kWp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752427824; x=1783963824;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XYQD54mAUZyaa1e3o248AW8PcKJ0A/dTtE4HKXayWzw=;
  b=AOjV9kWpvxV2rejN7eKxFcwrddJvJQ/FIVl37ebpUUNDakAPLmyOLK+c
   4px2HtGWEnIma6o4derD1jwGvPRj17tKZK3sJQ3C78txqUvrE5egqXdHF
   M1KfrvOj60xgnUIAIAX/rg3sZbV5JhcYVKzPFgX6pQEz/w4ByZvLnZnpm
   haIU8W9sn+TO+1+5VHiy7UsWX/F2qgtxPFrAj6iCevc4CZFp/OC1ogZib
   mbWHVgK4nyuHFhL32kKCpojtw4n93/7T0/LvK8PiSLGa73TkwqkvCpKXd
   isI6Wk444zOtxecdzDw52eHw8Mnh1+mL4IBXRsiBm2rMf31AmawiGoJIR
   w==;
X-CSE-ConnectionGUID: KWhLgE7NTquVToIL7hL98A==
X-CSE-MsgGUID: oNIF4MpUTfOIzdMOzevBKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65334189"
X-IronPort-AV: E=Sophos;i="6.16,309,1744095600"; 
   d="scan'208";a="65334189"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 10:30:24 -0700
X-CSE-ConnectionGUID: WeHTUJ3iRC20r65MqyZA0A==
X-CSE-MsgGUID: J0s9eJJIQF2xSlCuErb5Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,309,1744095600"; 
   d="scan'208";a="161069387"
Received: from mgoodin-mobl3.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.223.19])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 10:30:22 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org,
	intel-xe@lists.freedesktop.org,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com,
	thomas.hellstrom@linux.intel.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	david.e.box@linux.intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH v8 13/13] platform/x86/intel/pmt: support BMG crashlog
Date: Sun, 13 Jul 2025 13:29:43 -0400
Message-ID: <20250713172943.7335-14-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250713172943.7335-1-michael.j.ruhl@intel.com>
References: <20250713172943.7335-1-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Battlemage GPU has the type 1 version 2 crashlog feature.

Update the crashlog driver to support this crashlog version.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/crashlog.c | 292 +++++++++++++++++++---
 1 file changed, 264 insertions(+), 28 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index 91c7ff123e01..17121baf9e81 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -53,38 +53,59 @@
 #define TYPE1_VER0_COMPLETE		BIT(31)
 #define TYPE1_VER0_TRIGGER_MASK		GENMASK(31, 28)
 
+/*
+ * Type 1 Version 2
+ * status and control are different registers
+ */
+#define TYPE1_VER2_STATUS_OFFSET	0x00
+#define TYPE1_VER2_CONTROL_OFFSET	0x14
+
+/* status register */
+#define TYPE1_VER2_CLEAR_SUPPORT	BIT(20)
+#define TYPE1_VER2_REARMED		BIT(25)
+#define TYPE1_VER2_ERROR		BIT(26)
+#define TYPE1_VER2_CONSUMED		BIT(27)
+#define TYPE1_VER2_DISABLED		BIT(28)
+#define TYPE1_VER2_CLEARED		BIT(29)
+#define TYPE1_VER2_IN_PROGRESS		BIT(30)
+#define TYPE1_VER2_COMPLETE		BIT(31)
+
+/* control register */
+#define TYPE1_VER2_CONSUME		BIT(25)
+#define TYPE1_VER2_REARM		BIT(28)
+#define TYPE1_VER2_EXECUTE		BIT(29)
+#define TYPE1_VER2_CLEAR		BIT(30)
+#define TYPE1_VER2_DISABLE		BIT(31)
+#define TYPE1_VER2_TRIGGER_MASK	\
+	(TYPE1_VER2_EXECUTE | TYPE1_VER2_CLEAR | TYPE1_VER2_DISABLE)
+
 /* After offset, order alphabetically, not bit ordered */
 struct crashlog_status {
 	u32 offset;
+	u32 clear_supported;
 	u32 cleared;
 	u32 complete;
+	u32 consumed;
 	u32 disabled;
+	u32 error;
+	u32 in_progress;
+	u32 rearmed;
 };
 
 struct crashlog_control {
 	u32 offset;
 	u32 trigger_mask;
 	u32 clear;
+	u32 consume;
 	u32 disable;
 	u32 manual;
+	u32 rearm;
 };
 
 struct crashlog_info {
-	struct crashlog_status status;
-	struct crashlog_control control;
-};
-
-static const struct crashlog_info crashlog_type1_ver0 = {
-	.status.offset = TYPE1_VER0_STATUS_OFFSET,
-	.status.cleared = TYPE1_VER0_CLEAR,
-	.status.complete = TYPE1_VER0_COMPLETE,
-	.status.disabled = TYPE1_VER0_DISABLE,
-
-	.control.offset = TYPE1_VER0_CONTROL_OFFSET,
-	.control.trigger_mask = TYPE1_VER0_TRIGGER_MASK,
-	.control.clear = TYPE1_VER0_CLEAR,
-	.control.disable = TYPE1_VER0_DISABLE,
-	.control.manual = TYPE1_VER0_EXECUTE,
+	const struct crashlog_status status;
+	const struct crashlog_control control;
+	const struct attribute_group *attr_grp;
 };
 
 struct crashlog_entry {
@@ -141,19 +162,23 @@ static bool pmt_crashlog_disabled(struct crashlog_entry *crashlog)
 	return pmt_crashlog_rc(crashlog, crashlog->info->status.disabled);
 }
 
-static bool pmt_crashlog_supported(struct intel_pmt_entry *entry)
+static bool pmt_crashlog_supported(struct intel_pmt_entry *entry, u32 *crash_type, u32 *version)
 {
 	u32 discovery_header = readl(entry->disc_table + CONTROL_OFFSET);
-	u32 crash_type, version;
 
-	crash_type = GET_TYPE(discovery_header);
-	version = GET_VERSION(discovery_header);
+	*crash_type = GET_TYPE(discovery_header);
+	*version = GET_VERSION(discovery_header);
 
 	/*
-	 * Currently we only recognize OOBMSM version 0 devices.
-	 * We can ignore all other crashlog devices in the system.
+	 * Currently we only recognize OOBMSM (type 1) and version 0 or 2
+	 * devices.
+	 *
+	 * Ignore all other crashlog devices in the system.
 	 */
-	return crash_type == CRASH_TYPE_OOBMSM && version == 0;
+	if (*crash_type == CRASH_TYPE_OOBMSM && (*version == 0 || *version == 2))
+		return true;
+
+	return false;
 }
 
 static void pmt_crashlog_set_disable(struct crashlog_entry *crashlog,
@@ -172,9 +197,115 @@ static void pmt_crashlog_set_execute(struct crashlog_entry *crashlog)
 	pmt_crashlog_rmw(crashlog, crashlog->info->control.manual, true);
 }
 
+static bool pmt_crashlog_cleared(struct crashlog_entry *crashlog)
+{
+	return pmt_crashlog_rc(crashlog, crashlog->info->status.cleared);
+}
+
+static bool pmt_crashlog_consumed(struct crashlog_entry *crashlog)
+{
+	return pmt_crashlog_rc(crashlog, crashlog->info->status.consumed);
+}
+
+static void pmt_crashlog_set_consumed(struct crashlog_entry *crashlog)
+{
+	pmt_crashlog_rmw(crashlog, crashlog->info->control.consume, true);
+}
+
+static bool pmt_crashlog_error(struct crashlog_entry *crashlog)
+{
+	return pmt_crashlog_rc(crashlog, crashlog->info->status.error);
+}
+
+static bool pmt_crashlog_rearm(struct crashlog_entry *crashlog)
+{
+	return pmt_crashlog_rc(crashlog, crashlog->info->status.rearmed);
+}
+
+static void pmt_crashlog_set_rearm(struct crashlog_entry *crashlog)
+{
+	pmt_crashlog_rmw(crashlog, crashlog->info->control.rearm, true);
+}
+
 /*
  * sysfs
  */
+static ssize_t
+clear_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct crashlog_entry *crashlog = dev_get_drvdata(dev);
+	bool cleared = pmt_crashlog_cleared(crashlog);
+
+	return sysfs_emit(buf, "%d\n", cleared);
+}
+
+static ssize_t
+clear_store(struct device *dev, struct device_attribute *attr,
+	    const char *buf, size_t count)
+{
+	struct crashlog_entry *crashlog;
+	bool clear;
+	int result;
+
+	crashlog = dev_get_drvdata(dev);
+
+	result = kstrtobool(buf, &clear);
+	if (result)
+		return result;
+
+	/* set bit only */
+	if (!clear)
+		return -EINVAL;
+
+	guard(mutex)(&crashlog->control_mutex);
+
+	pmt_crashlog_set_clear(crashlog);
+
+	return count;
+}
+static DEVICE_ATTR_RW(clear);
+
+static ssize_t
+consumed_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct crashlog_entry *crashlog = dev_get_drvdata(dev);
+	bool consumed = pmt_crashlog_consumed(crashlog);
+
+	return sysfs_emit(buf, "%d\n", consumed);
+}
+
+static ssize_t
+consumed_store(struct device *dev, struct device_attribute *attr, const char *buf,
+	       size_t count)
+{
+	struct crashlog_entry *crashlog;
+	bool consumed;
+	int result;
+
+	crashlog = dev_get_drvdata(dev);
+
+	result = kstrtobool(buf, &consumed);
+	if (result)
+		return result;
+
+	/* set bit only */
+	if (!consumed)
+		return -EINVAL;
+
+	guard(mutex)(&crashlog->control_mutex);
+
+	if (pmt_crashlog_disabled(crashlog))
+		return -EBUSY;
+
+	if (!pmt_crashlog_complete(crashlog))
+		return -EEXIST;
+
+	pmt_crashlog_set_consumed(crashlog);
+
+	return count;
+}
+static DEVICE_ATTR_RW(consumed);
+
 static ssize_t
 enable_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
@@ -206,6 +337,51 @@ enable_store(struct device *dev, struct device_attribute *attr,
 }
 static DEVICE_ATTR_RW(enable);
 
+static ssize_t
+error_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct crashlog_entry *crashlog = dev_get_drvdata(dev);
+	bool error = pmt_crashlog_error(crashlog);
+
+	return sysfs_emit(buf, "%d\n", error);
+}
+static DEVICE_ATTR_RO(error);
+
+static ssize_t
+rearm_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct crashlog_entry *crashlog = dev_get_drvdata(dev);
+	int rearmed = pmt_crashlog_rearm(crashlog);
+
+	return sysfs_emit(buf, "%d\n", rearmed);
+}
+
+static ssize_t
+rearm_store(struct device *dev, struct device_attribute *attr, const char *buf,
+	    size_t count)
+{
+	struct crashlog_entry *crashlog;
+	bool rearm;
+	int result;
+
+	crashlog = dev_get_drvdata(dev);
+
+	result = kstrtobool(buf, &rearm);
+	if (result)
+		return result;
+
+	/* set only */
+	if (!rearm)
+		return -EINVAL;
+
+	guard(mutex)(&crashlog->control_mutex);
+
+	pmt_crashlog_set_rearm(crashlog);
+
+	return count;
+}
+static DEVICE_ATTR_RW(rearm);
+
 static ssize_t
 trigger_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
@@ -253,30 +429,90 @@ trigger_store(struct device *dev, struct device_attribute *attr,
 }
 static DEVICE_ATTR_RW(trigger);
 
-static struct attribute *pmt_crashlog_attrs[] = {
+static struct attribute *pmt_crashlog_type1_ver0_attrs[] = {
+	&dev_attr_enable.attr,
+	&dev_attr_trigger.attr,
+	NULL
+};
+
+static struct attribute *pmt_crashlog_type1_ver2_attrs[] = {
+	&dev_attr_clear.attr,
+	&dev_attr_consumed.attr,
 	&dev_attr_enable.attr,
+	&dev_attr_error.attr,
+	&dev_attr_rearm.attr,
 	&dev_attr_trigger.attr,
 	NULL
 };
 
-static const struct attribute_group pmt_crashlog_group = {
-	.attrs	= pmt_crashlog_attrs,
+static const struct attribute_group pmt_crashlog_type1_ver0_group = {
+	.attrs	= pmt_crashlog_type1_ver0_attrs,
 };
 
+static const struct attribute_group pmt_crashlog_type1_ver2_group = {
+	.attrs = pmt_crashlog_type1_ver2_attrs,
+};
+
+static const struct crashlog_info crashlog_type1_ver0 = {
+	.status.offset = TYPE1_VER0_STATUS_OFFSET,
+	.status.cleared = TYPE1_VER0_CLEAR,
+	.status.complete = TYPE1_VER0_COMPLETE,
+	.status.disabled = TYPE1_VER0_DISABLE,
+
+	.control.offset = TYPE1_VER0_CONTROL_OFFSET,
+	.control.trigger_mask = TYPE1_VER0_TRIGGER_MASK,
+	.control.clear = TYPE1_VER0_CLEAR,
+	.control.disable = TYPE1_VER0_DISABLE,
+	.control.manual = TYPE1_VER0_EXECUTE,
+	.attr_grp = &pmt_crashlog_type1_ver0_group,
+};
+
+const struct crashlog_info crashlog_type1_ver2 = {
+	.status.offset = TYPE1_VER2_STATUS_OFFSET,
+	.status.clear_supported = TYPE1_VER2_CLEAR_SUPPORT,
+	.status.cleared = TYPE1_VER2_CLEARED,
+	.status.complete = TYPE1_VER2_COMPLETE,
+	.status.consumed = TYPE1_VER2_CONSUMED,
+	.status.disabled = TYPE1_VER2_DISABLED,
+	.status.error = TYPE1_VER2_ERROR,
+	.status.in_progress = TYPE1_VER2_IN_PROGRESS,
+	.status.rearmed = TYPE1_VER2_REARMED,
+
+	.control.offset = TYPE1_VER2_CONTROL_OFFSET,
+	.control.trigger_mask = TYPE1_VER2_TRIGGER_MASK,
+	.control.clear = TYPE1_VER2_CLEAR,
+	.control.consume = TYPE1_VER2_CONSUME,
+	.control.disable = TYPE1_VER2_DISABLE,
+	.control.manual = TYPE1_VER2_EXECUTE,
+	.control.rearm = TYPE1_VER2_REARM,
+	.attr_grp = &pmt_crashlog_type1_ver2_group,
+};
+
+static const struct crashlog_info *select_crashlog_info(u32 type, u32 version)
+{
+	if (version == 0)
+		return &crashlog_type1_ver0;
+
+	return &crashlog_type1_ver2;
+}
+
 static int pmt_crashlog_header_decode(struct intel_pmt_entry *entry,
 				      struct device *dev)
 {
 	void __iomem *disc_table = entry->disc_table;
 	struct intel_pmt_header *header = &entry->header;
 	struct crashlog_entry *crashlog;
+	u32 version;
+	u32 type;
 
-	if (!pmt_crashlog_supported(entry))
+	if (!pmt_crashlog_supported(entry, &type, &version))
 		return 1;
 
 	/* initialize the crashlog struct */
 	crashlog = container_of(entry, struct crashlog_entry, entry);
 	mutex_init(&crashlog->control_mutex);
-	crashlog->info = &crashlog_type1_ver0;
+
+	crashlog->info = select_crashlog_info(type, version);
 
 	header->access_type = GET_ACCESS(readl(disc_table));
 	header->guid = readl(disc_table + GUID_OFFSET);
@@ -285,7 +521,7 @@ static int pmt_crashlog_header_decode(struct intel_pmt_entry *entry,
 	/* Size is measured in DWORDS, but accessor returns bytes */
 	header->size = GET_SIZE(readl(disc_table + SIZE_OFFSET));
 
-	entry->attr_grp = &pmt_crashlog_group;
+	entry->attr_grp = crashlog->info->attr_grp;
 
 	return 0;
 }
-- 
2.50.0

