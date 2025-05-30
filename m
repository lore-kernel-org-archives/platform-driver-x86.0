Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC21528313F
	for <platform-driver-x86@vger.kernel.org>; Fri, 30 May 2025 20:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748637512; cv=none; b=TqYxFIxoWyiZILFf/CrLHCT9FXH7dSa/c92lES+4EM6aMQ1APXu35r/VDXAxO4Gsgj00gMxaBt5tsQURRZeBtbNsRyyp5I4PAv+HoTO5H79sn2jZDhRRQxHaT9L/BpX0VH9Y2RMWEDPVr+0HhwlyzVZ9fGLTlRio66o01YbNPng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748637512; c=relaxed/simple;
	bh=vQcJkCtHo2tfr2BhwkHbhJQ614nh7MqrF/KwkHrEFwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JYCfmtM96fmusTRy0/XJqwiUYhWUAcGmeVMefmb0f+gErHtG/2UeERQNOU53rM4ux3Owb1gugXiU/zvxldgFeUoVqDHepkKWqQDk0+tDWrBHixMocaNz+BTKgjg8Cfz52XwHx7oSHVXYIICLAnnIGNESQ9cuf7bkUdRAQia6SlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZAqblGE9; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZAqblGE9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748637510; x=1780173510;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vQcJkCtHo2tfr2BhwkHbhJQ614nh7MqrF/KwkHrEFwk=;
  b=ZAqblGE9J/cRLYvDqttk1D7+DmlxMkkIIdqGX3xcnQ7NtyfOksyRIiv0
   5awFV2pUDoSI3otY+1/OR5dR9MXD2FHsycHxmK30AOuDme9yfNjoSebSw
   pBbbhP3r+YZ/DWtWIEbaXW9wNhlprOmnH4A5TNW7jzNN3+ABV4THcodlL
   fjkGik1sAkiy7JPCQgoFCGzd/8ag65Iy1M8r6yppKxiyOQSCmzJ0kQ9w5
   Lu6a7O3vMikZ4cVgYsc68IMZE4Jqq71I/oaOzBkkXSJUtZ92dSCtLM0mg
   rCnFy79q4MfQE/YRqKUxF5Uqn+phYzLUoKolEplrSzyRPt09Q5hwwaP9u
   A==;
X-CSE-ConnectionGUID: 9qFwK43GRSaCZSwP1N9DzQ==
X-CSE-MsgGUID: p1FaxattR3qNu8+qYRzpig==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="54406024"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="54406024"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 13:38:30 -0700
X-CSE-ConnectionGUID: oW2C4mlbQEKyt7T0kB+TVQ==
X-CSE-MsgGUID: 4AcIo2j5QJmoqe8/m8wkzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="143824276"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.223.23])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 13:38:29 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org,
	intel-xe@lists.freedesktop.org,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH v2 7/8] platform/x86/intel/pmt: use a version struct
Date: Fri, 30 May 2025 16:37:56 -0400
Message-ID: <20250530203757.190853-8-michael.j.ruhl@intel.com>
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

In preparation for supporting multiple crashlog versions, use
a struct to keep bit offset info for the status and control
bits.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/crashlog.c | 177 ++++++++++++++--------
 1 file changed, 113 insertions(+), 64 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index 09cd0a1346f3..e6eea8809a56 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -22,21 +22,6 @@
 /* Crashlog discovery header types */
 #define CRASH_TYPE_OOBMSM	1
 
-/* Control Flags */
-#define CRASHLOG_FLAG_DISABLE		BIT(28)
-
-/*
- * Bits 29 and 30 control the state of bit 31.
- *
- * Bit 29 will clear bit 31, if set, allowing a new crashlog to be captured.
- * Bit 30 will immediately trigger a crashlog to be generated, setting bit 31.
- * Bit 31 is the read-only status with a 1 indicating log is complete.
- */
-#define CRASHLOG_FLAG_TRIGGER_CLEAR	BIT(29)
-#define CRASHLOG_FLAG_TRIGGER_EXECUTE	BIT(30)
-#define CRASHLOG_FLAG_TRIGGER_COMPLETE	BIT(31)
-#define CRASHLOG_FLAG_TRIGGER_MASK	GENMASK(31, 28)
-
 /* Crashlog Discovery Header */
 #define CONTROL_OFFSET		0x0
 #define GUID_OFFSET		0x4
@@ -48,10 +33,63 @@
 /* size is in bytes */
 #define GET_SIZE(v)		((v) * sizeof(u32))
 
+/*
+ * Type 1 Version 0
+ * status and control registers are combined.
+ *
+ * Bits 29 and 30 control the state of bit 31.
+ * Bit 29 will clear bit 31, if set, allowing a new crashlog to be captured.
+ * Bit 30 will immediately trigger a crashlog to be generated, setting bit 31.
+ * Bit 31 is the read-only status with a 1 indicating log is complete.
+ */
+#define TYPE1_VER0_STATUS_OFFSET	0x00
+#define TYPE1_VER0_CONTROL_OFFSET	0x00
+
+#define TYPE1_VER0_DISABLE		BIT(28)
+#define TYPE1_VER0_CLEAR		BIT(29)
+#define TYPE1_VER0_EXECUTE		BIT(30)
+#define TYPE1_VER0_COMPLETE		BIT(31)
+#define TYPE1_VER0_TRIGGER_MASK		GENMASK(31, 28)
+
+/* After offset, order alphabetically, not bit ordered */
+struct crashlog_status {
+	u32 offset;
+	u32 clear;
+	u32 complete;
+	u32 disable;
+};
+
+struct crashlog_control {
+	u32 offset;
+	u32 trigger_mask;
+	u32 clear;
+	u32 disable;
+	u32 manual;
+};
+
+struct crashlog_info {
+	struct crashlog_status status;
+	struct crashlog_control control;
+};
+
+const struct crashlog_info crashlog_type1_ver0 = {
+	.status.offset = CONTROL_OFFSET,
+	.status.clear = TYPE1_VER0_CLEAR,
+	.status.complete = TYPE1_VER0_COMPLETE,
+	.status.disable = TYPE1_VER0_DISABLE,
+
+	.control.offset = CONTROL_OFFSET,
+	.control.trigger_mask = TYPE1_VER0_TRIGGER_MASK,
+	.control.clear = TYPE1_VER0_CLEAR,
+	.control.disable = TYPE1_VER0_DISABLE,
+	.control.manual = TYPE1_VER0_EXECUTE,
+};
+
 struct crashlog_entry {
 	/* entry must be first member of struct */
 	struct intel_pmt_entry		entry;
 	struct mutex			control_mutex;
+	const struct crashlog_info	*info;
 };
 
 struct pmt_crashlog_priv {
@@ -60,24 +98,10 @@ struct pmt_crashlog_priv {
 };
 
 /*
- * I/O
+ * This is the generic access to a PMT struct. So the use of
+ * struct crashlog_entry
+ * doesn't "make sense" here.
  */
-static bool pmt_crashlog_complete(struct intel_pmt_entry *entry)
-{
-	u32 control = readl(entry->disc_table + CONTROL_OFFSET);
-
-	/* return current value of the crashlog complete flag */
-	return !!(control & CRASHLOG_FLAG_TRIGGER_COMPLETE);
-}
-
-static bool pmt_crashlog_disabled(struct intel_pmt_entry *entry)
-{
-	u32 control = readl(entry->disc_table + CONTROL_OFFSET);
-
-	/* return current value of the crashlog disabled flag */
-	return !!(control & CRASHLOG_FLAG_DISABLE);
-}
-
 static bool pmt_crashlog_supported(struct intel_pmt_entry *entry)
 {
 	u32 discovery_header = readl(entry->disc_table + CONTROL_OFFSET);
@@ -93,40 +117,64 @@ static bool pmt_crashlog_supported(struct intel_pmt_entry *entry)
 	return crash_type == CRASH_TYPE_OOBMSM && version == 0;
 }
 
+/*
+ * I/O
+ */
+static bool pmt_crashlog_complete(struct intel_pmt_entry *entry,
+				  const struct crashlog_status *status)
+{
+	u32 reg = readl(entry->disc_table + status->offset);
+
+	/* return current value of the crashlog complete flag */
+	return !!(reg & status->complete);
+}
+
+static bool pmt_crashlog_disabled(struct intel_pmt_entry *entry,
+				  const struct crashlog_status *status)
+{
+	u32 reg = readl(entry->disc_table + status->offset);
+
+	/* return current value of the crashlog disabled flag */
+	return !!(reg & status->disable);
+}
+
 static void pmt_crashlog_set_disable(struct intel_pmt_entry *entry,
+				     const struct crashlog_control *control,
 				     bool disable)
 {
-	u32 control = readl(entry->disc_table + CONTROL_OFFSET);
+	u32 reg = readl(entry->disc_table + control->offset);
 
 	/* clear trigger bits so we are only modifying disable flag */
-	control &= ~CRASHLOG_FLAG_TRIGGER_MASK;
+	reg &= ~control->trigger_mask;
 
 	if (disable)
-		control |= CRASHLOG_FLAG_DISABLE;
+		reg |= control->disable;
 	else
-		control &= ~CRASHLOG_FLAG_DISABLE;
+		reg &= ~control->disable;
 
-	writel(control, entry->disc_table + CONTROL_OFFSET);
+	writel(reg, entry->disc_table + control->offset);
 }
 
-static void pmt_crashlog_set_clear(struct intel_pmt_entry *entry)
+static void pmt_crashlog_set_clear(struct intel_pmt_entry *entry,
+				   const struct crashlog_control *control)
 {
-	u32 control = readl(entry->disc_table + CONTROL_OFFSET);
+	u32 reg = readl(entry->disc_table + control->offset);
 
-	control &= ~CRASHLOG_FLAG_TRIGGER_MASK;
-	control |= CRASHLOG_FLAG_TRIGGER_CLEAR;
+	reg &= ~control->trigger_mask;
+	reg |= control->clear;
 
-	writel(control, entry->disc_table + CONTROL_OFFSET);
+	writel(reg, entry->disc_table + control->offset);
 }
 
-static void pmt_crashlog_set_execute(struct intel_pmt_entry *entry)
+static void pmt_crashlog_set_execute(struct intel_pmt_entry *entry,
+				     const struct crashlog_control *control)
 {
-	u32 control = readl(entry->disc_table + CONTROL_OFFSET);
+	u32 reg = readl(entry->disc_table + control->offset);
 
-	control &= ~CRASHLOG_FLAG_TRIGGER_MASK;
-	control |= CRASHLOG_FLAG_TRIGGER_EXECUTE;
+	reg &= ~control->trigger_mask;
+	reg |= control->manual;
 
-	writel(control, entry->disc_table + CONTROL_OFFSET);
+	writel(reg, entry->disc_table + control->offset);
 }
 
 /*
@@ -135,8 +183,8 @@ static void pmt_crashlog_set_execute(struct intel_pmt_entry *entry)
 static ssize_t
 enable_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
-	struct intel_pmt_entry *entry = dev_get_drvdata(dev);
-	int enabled = !pmt_crashlog_disabled(entry);
+	struct crashlog_entry *crashlog = dev_get_drvdata(dev);
+	int enabled = !pmt_crashlog_disabled(&crashlog->entry, &crashlog->info->status);
 
 	return sprintf(buf, "%d\n", enabled);
 }
@@ -145,19 +193,19 @@ static ssize_t
 enable_store(struct device *dev, struct device_attribute *attr,
 	     const char *buf, size_t count)
 {
-	struct crashlog_entry *entry;
+	struct crashlog_entry *crashlog;
 	bool enabled;
 	int result;
 
-	entry = dev_get_drvdata(dev);
+	crashlog = dev_get_drvdata(dev);
 
 	result = kstrtobool(buf, &enabled);
 	if (result)
 		return result;
 
-	guard(mutex)(&entry->control_mutex);
+	guard(mutex)(&crashlog->control_mutex);
 
-	pmt_crashlog_set_disable(&entry->entry, !enabled);
+	pmt_crashlog_set_disable(&crashlog->entry, &crashlog->info->control, !enabled);
 
 	return count;
 }
@@ -166,11 +214,11 @@ static DEVICE_ATTR_RW(enable);
 static ssize_t
 trigger_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
-	struct intel_pmt_entry *entry;
+	struct crashlog_entry *crashlog;
 	int trigger;
 
-	entry = dev_get_drvdata(dev);
-	trigger = pmt_crashlog_complete(entry);
+	crashlog = dev_get_drvdata(dev);
+	trigger = pmt_crashlog_complete(&crashlog->entry, &crashlog->info->status);
 
 	return sprintf(buf, "%d\n", trigger);
 }
@@ -179,32 +227,32 @@ static ssize_t
 trigger_store(struct device *dev, struct device_attribute *attr,
 	      const char *buf, size_t count)
 {
-	struct crashlog_entry *entry;
+	struct crashlog_entry *crashlog;
 	bool trigger;
 	int result;
 
-	entry = dev_get_drvdata(dev);
+	crashlog = dev_get_drvdata(dev);
 
 	result = kstrtobool(buf, &trigger);
 	if (result)
 		return result;
 
-	guard(mutex)(&entry->control_mutex);
+	guard(mutex)(&crashlog->control_mutex);
 
 	if (!trigger) {
-		pmt_crashlog_set_clear(&entry->entry);
+		pmt_crashlog_set_clear(&crashlog->entry, &crashlog->info->control);
 		return count;
 	}
 
 	/* we cannot trigger a new crash if one is still pending */
-	if (pmt_crashlog_complete(&entry->entry))
+	if (pmt_crashlog_complete(&crashlog->entry, &crashlog->info->status))
 		return -EEXIST;
 
 	/* if device is currently disabled, return busy */
-	if (pmt_crashlog_disabled(&entry->entry))
+	if (pmt_crashlog_disabled(&crashlog->entry, &crashlog->info->status))
 		return -EBUSY;
 
-	pmt_crashlog_set_execute(&entry->entry);
+	pmt_crashlog_set_execute(&crashlog->entry, &crashlog->info->control);
 
 	return count;
 }
@@ -230,9 +278,10 @@ static int pmt_crashlog_header_decode(struct intel_pmt_entry *entry,
 	if (!pmt_crashlog_supported(entry))
 		return 1;
 
-	/* initialize control mutex */
+	/* initialize the crashlog struct */
 	crashlog = container_of(entry, struct crashlog_entry, entry);
 	mutex_init(&crashlog->control_mutex);
+	crashlog->info = &crashlog_type1_ver0;
 
 	header->access_type = GET_ACCESS(readl(disc_table));
 	header->guid = readl(disc_table + GUID_OFFSET);
-- 
2.49.0

