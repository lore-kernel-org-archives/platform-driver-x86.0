Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8602750FB
	for <platform-driver-x86@vger.kernel.org>; Fri, 30 May 2025 20:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748637514; cv=none; b=ucS4JCM+sV0FBubP88VFbYOeK7RIGQi4O74rRaWgRHngUYrMkgeaVnQ1aO92XDuMVvNtFI5LOVAXFs9WHgyRi2rNNmis+k0YSy9J3uXuZV2mOBuKP1QOsJwcKkllsMWc73uLfGMZrlh6aI1vw7eonrVFCqWdNlCeFjIxVWmJopo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748637514; c=relaxed/simple;
	bh=FhETGqZK/o/IpajkEyR8lhlLYwgsxtEH84kQumANRrY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CqdonxhdoXatQ95Cvk1BjMmjYwfCWPSY4i4XZqh0YO78zNT3oQFGvB3KcPVvX8yJOlq3EXubw5SdgGnFMISGZB2UCehNfDA5L/MiOB/wPyBfimL4L/UMghWZaZr+6Xtp0lqLvayuTelzenqGJB6LNawanTjX1VpKU4m6+Z+RW9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cYxRh6wK; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cYxRh6wK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748637512; x=1780173512;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FhETGqZK/o/IpajkEyR8lhlLYwgsxtEH84kQumANRrY=;
  b=cYxRh6wKjOPtK2BlCJlImAwDJMNQ1dMfoOWgj6o/SNLeT46rLz4U7H7J
   dcN4y2rKcCMg3lgeSxnUtu4wfWf1XBsNPn9A3PEys4zC2w/E+c4vfqkbH
   kPmktT7qIXIBxS3Blm4kZHJTo7Duigph0RJJcL/HBa1sL7WpLvmDqUWMJ
   0yye6neFGxMqEtk3voCV02fm6W93BqRVdKErmc8Y7kcKQqekTuTGcrny6
   14Rnm85/GToOk/Qb9RqhTcxNB44Sufe3NbpOg6UH7X0kdaoRpAlx0vID6
   DSePoQi1ji++7QWea+HNOWV2TzeP84+9z9hnSkxprLpWFyvgz38smCyCe
   Q==;
X-CSE-ConnectionGUID: Qc/86MawRJKWqyA1691ZHg==
X-CSE-MsgGUID: yhFpx280RuSkVI4YjQ/nlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="54406027"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="54406027"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 13:38:32 -0700
X-CSE-ConnectionGUID: TPhbc1JmSxmc3huF4SkxkA==
X-CSE-MsgGUID: 402fEEjfS4KaTZtjBiHqcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="143824284"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.223.23])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 13:38:31 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org,
	intel-xe@lists.freedesktop.org,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH v2 8/8] platform/x86/intel/pmt: support BMG crashlog
Date: Fri, 30 May 2025 16:37:57 -0400
Message-ID: <20250530203757.190853-9-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530203757.190853-1-michael.j.ruhl@intel.com>
References: <20250530203757.190853-1-michael.j.ruhl@intel.com>
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
 drivers/platform/x86/intel/pmt/crashlog.c | 282 ++++++++++++++++++++--
 1 file changed, 263 insertions(+), 19 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index e6eea8809a56..7291c93d71df 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -51,20 +51,53 @@
 #define TYPE1_VER0_COMPLETE		BIT(31)
 #define TYPE1_VER0_TRIGGER_MASK		GENMASK(31, 28)
 
+/*
+ * Type 1 Version 2
+ * status and control are two different registers
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
+#define TYPE1_VER2_TRIGGER_MASK		(TYPE1_VER2_CONSUME | TYPE1_VER2_EXECUTE | \
+					 TYPE1_VER2_CLEAR | TYPE1_VER2_DISABLE)
+
 /* After offset, order alphabetically, not bit ordered */
 struct crashlog_status {
 	u32 offset;
-	u32 clear;
+	u32 clear_supported;
+	u32 cleared;
 	u32 complete;
-	u32 disable;
+	u32 consumed;
+	u32 disabled;
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
@@ -73,18 +106,38 @@ struct crashlog_info {
 };
 
 const struct crashlog_info crashlog_type1_ver0 = {
-	.status.offset = CONTROL_OFFSET,
-	.status.clear = TYPE1_VER0_CLEAR,
+	.status.offset = TYPE1_VER0_STATUS_OFFSET,
+	.status.cleared = TYPE1_VER0_CLEAR,
 	.status.complete = TYPE1_VER0_COMPLETE,
-	.status.disable = TYPE1_VER0_DISABLE,
+	.status.disabled = TYPE1_VER0_DISABLE,
+
 
-	.control.offset = CONTROL_OFFSET,
+	.control.offset = TYPE1_VER0_CONTROL_OFFSET,
 	.control.trigger_mask = TYPE1_VER0_TRIGGER_MASK,
 	.control.clear = TYPE1_VER0_CLEAR,
 	.control.disable = TYPE1_VER0_DISABLE,
 	.control.manual = TYPE1_VER0_EXECUTE,
 };
 
+const struct crashlog_info crashlog_type1_ver2 = {
+	.status.offset = TYPE1_VER2_STATUS_OFFSET,
+	.status.clear_supported = TYPE1_VER2_CLEAR_SUPPORT,
+	.status.disabled = TYPE1_VER2_DISABLED,
+	.status.cleared = TYPE1_VER2_CLEARED,
+	.status.complete = TYPE1_VER2_COMPLETE,
+	.status.rearmed = TYPE1_VER2_REARMED,
+	.status.error = TYPE1_VER2_ERROR,
+	.status.in_progress = TYPE1_VER2_IN_PROGRESS,
+
+	.control.offset = TYPE1_VER2_CONTROL_OFFSET,
+	.control.trigger_mask = TYPE1_VER2_TRIGGER_MASK,
+	.control.clear = TYPE1_VER2_CLEAR,
+	.control.consume = TYPE1_VER2_CONSUME,
+	.control.disable = TYPE1_VER2_DISABLE,
+	.control.manual = TYPE1_VER2_EXECUTE,
+	.control.rearm = TYPE1_VER2_REARM,
+};
+
 struct crashlog_entry {
 	/* entry must be first member of struct */
 	struct intel_pmt_entry		entry;
@@ -99,22 +152,27 @@ struct pmt_crashlog_priv {
 
 /*
  * This is the generic access to a PMT struct. So the use of
- * struct crashlog_entry
- * doesn't "make sense" here.
+ *   struct crashlog_entry
+ * doesn't "make sense" here, i.e. use:
+ *   struct intel_pmt_entry
  */
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
 
 /*
@@ -135,7 +193,7 @@ static bool pmt_crashlog_disabled(struct intel_pmt_entry *entry,
 	u32 reg = readl(entry->disc_table + status->offset);
 
 	/* return current value of the crashlog disabled flag */
-	return !!(reg & status->disable);
+	return !!(reg & status->disabled);
 }
 
 static void pmt_crashlog_set_disable(struct intel_pmt_entry *entry,
@@ -177,9 +235,78 @@ static void pmt_crashlog_set_execute(struct intel_pmt_entry *entry,
 	writel(reg, entry->disc_table + control->offset);
 }
 
+/* version 2 support */
+static bool pmt_crashlog_cleared(struct intel_pmt_entry *entry,
+				 const struct crashlog_status *status)
+{
+	u32 reg = readl(entry->disc_table + status->offset);
+
+	/* return current value of the crashlog cleared flag */
+	return !!(reg & status->cleared);
+}
+
+static bool pmt_crashlog_consumed(struct intel_pmt_entry *entry,
+				  const struct crashlog_status *status)
+{
+	u32 reg = readl(entry->disc_table + status->offset);
+
+	/* return current value of the crashlog consumedflag */
+	return !!(reg & status->cleared);
+}
+
+static void pmt_crashlog_set_consumed(struct intel_pmt_entry *entry,
+				      const struct crashlog_control *control)
+{
+	u32 reg = readl(entry->disc_table + control->offset);
+
+	reg &= ~control->trigger_mask;
+	reg |= control->consume;
+
+	writel(reg, entry->disc_table + control->offset);
+}
+
+static bool pmt_crashlog_error(struct intel_pmt_entry *entry,
+			       const struct crashlog_status *status)
+{
+	u32 reg = readl(entry->disc_table + status->offset);
+
+	/* return current value of the crashlog error flag */
+	return !!(reg & status->error);
+}
+
+static bool pmt_crashlog_rearm(struct intel_pmt_entry *entry,
+			       const struct crashlog_status *status)
+{
+	u32 reg = readl(entry->disc_table + status->offset);
+
+	/* return current value of the crashlog reamed flag */
+	return !!(reg & status->rearmed);
+}
+
+static void pmt_crashlog_set_rearm(struct intel_pmt_entry *entry,
+				   const struct crashlog_control *control)
+{
+	u32 reg = readl(entry->disc_table + control->offset);
+
+	reg &= ~control->trigger_mask;
+	reg |= control->rearm;
+
+	writel(reg, entry->disc_table + control->offset);
+}
+
 /*
  * sysfs
  */
+static ssize_t
+clear_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct crashlog_entry *crashlog = dev_get_drvdata(dev);
+	int cleared = pmt_crashlog_cleared(&crashlog->entry, &crashlog->info->status);
+
+	return sysfs_emit(buf, "%d\n", cleared);
+}
+static DEVICE_ATTR_RO(clear);
+
 static ssize_t
 enable_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
@@ -189,6 +316,46 @@ enable_show(struct device *dev, struct device_attribute *attr, char *buf)
 	return sprintf(buf, "%d\n", enabled);
 }
 
+static ssize_t
+consumed_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct crashlog_entry *crashlog = dev_get_drvdata(dev);
+	int consumed = pmt_crashlog_consumed(&crashlog->entry, &crashlog->info->status);
+
+	return sysfs_emit(buf, "%d\n", consumed);
+}
+
+static ssize_t consumed_store(struct device *dev, struct device_attribute *attr,
+			      const char *buf, size_t count)
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
+	if (pmt_crashlog_disabled(&crashlog->entry, &crashlog->info->status))
+		return -EBUSY;
+
+	if (!pmt_crashlog_complete(&crashlog->entry, &crashlog->info->status))
+		return -EEXIST;
+
+	pmt_crashlog_set_consumed(&crashlog->entry, &crashlog->info->control);
+
+	return count;
+}
+static DEVICE_ATTR_RW(consumed);
+
 static ssize_t
 enable_store(struct device *dev, struct device_attribute *attr,
 	     const char *buf, size_t count)
@@ -211,6 +378,50 @@ enable_store(struct device *dev, struct device_attribute *attr,
 }
 static DEVICE_ATTR_RW(enable);
 
+static ssize_t
+error_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct crashlog_entry *crashlog = dev_get_drvdata(dev);
+	int error = pmt_crashlog_error(&crashlog->entry, &crashlog->info->status);
+
+	return sysfs_emit(buf, "%d\n", error);
+}
+static DEVICE_ATTR_RO(error);
+
+static ssize_t
+rearm_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct crashlog_entry *crashlog = dev_get_drvdata(dev);
+	int rearmed = pmt_crashlog_rearm(&crashlog->entry, &crashlog->info->status);
+
+	return sysfs_emit(buf, "%d\n", rearmed);
+}
+
+static ssize_t rearm_store(struct device *dev, struct device_attribute *attr,
+			   const char *buf, size_t count)
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
+	pmt_crashlog_set_rearm(&crashlog->entry, &crashlog->info->control);
+
+	return count;
+}
+static DEVICE_ATTR_RW(rearm);
+
 static ssize_t
 trigger_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
@@ -264,24 +475,57 @@ static struct attribute *pmt_crashlog_attrs[] = {
 	NULL
 };
 
+static struct attribute *pmt_crashlog_ver2_attrs[] = {
+	&dev_attr_clear.attr,
+	&dev_attr_consumed.attr,
+	&dev_attr_enable.attr,
+	&dev_attr_error.attr,
+	&dev_attr_rearm.attr,
+	&dev_attr_trigger.attr,
+	NULL
+};
+
 static const struct attribute_group pmt_crashlog_group = {
 	.attrs	= pmt_crashlog_attrs,
 };
 
+static const struct attribute_group pmt_crashlog_ver2_group = {
+	.attrs = pmt_crashlog_ver2_attrs,
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
+static const struct attribute_group *select_sysfs_grp(u32 type, u32 version)
+{
+	if (version == 0)
+		return &pmt_crashlog_group;
+
+	return &pmt_crashlog_ver2_group;
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
@@ -290,7 +534,7 @@ static int pmt_crashlog_header_decode(struct intel_pmt_entry *entry,
 	/* Size is measured in DWORDS, but accessor returns bytes */
 	header->size = GET_SIZE(readl(disc_table + SIZE_OFFSET));
 
-	entry->attr_grp = &pmt_crashlog_group;
+	entry->attr_grp = select_sysfs_grp(type, version);
 
 	return 0;
 }
-- 
2.49.0

