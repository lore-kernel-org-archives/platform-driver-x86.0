Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB1115990C
	for <platform-driver-x86@vger.kernel.org>; Fri, 30 May 2025 20:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748637275; cv=none; b=Bv5fNRYzrPhykR+Ss6/PQdbRJNdgVAfvF/IUUCr4DD3W4UZoX9rSNwNG1ajB4n5ucJ0dc4qusd2I+htlF+ypjZw6kJ4XwokyeMfF1djyWDIu04CxL1zVZ0LQ5E6iZaAVepgCunJXnhVK8FaZ665h2gESgcA017yLOuk0N4cFlAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748637275; c=relaxed/simple;
	bh=vQcJkCtHo2tfr2BhwkHbhJQ614nh7MqrF/KwkHrEFwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QoIrb3lzGk8WQi0mGoemKRWjpuCWq+LmQWB7ji399bXoBpCgOGsEd6fj/ubZYBdzC4C5Y3m2uNYuhqRJ1tBr8xGYCf5+k4Bun2XS9/osbcN80wjmL358xXMEf66stRBXpqKbrekvkh0zPLFoqo3buxptnSTfBcH+GSBfJPAdj7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a8EIfqu1; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a8EIfqu1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748637273; x=1780173273;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vQcJkCtHo2tfr2BhwkHbhJQ614nh7MqrF/KwkHrEFwk=;
  b=a8EIfqu1B0Y0vbxnRYkDzOFV9/aWIAD014M2z/8aFJV9xpyn/FVwn7tg
   h7GWHAcX1mDlyGGndtTRb/vUkM80M4nl6NCMrhfjZKwKVITSZ39lIq8Vz
   1szhGFUhsUAdEXY7UO78blsfhq6uFApb9ywhoLQXVYEg8gtfokY+Tm11F
   7tpiqWnWUIy+Kca3VLPoB8m6H/uZvNBdqwUCr84b/WivEA81pqIURnOv+
   iJuqbXgzCHUi3FZnK977n96FUftFlKlRf9F06OI5hyFdd2tU1gLiwGcFP
   ukyexNMCn/BIzGP9nKV6qi73geWID6Obm9ia+m8l+yzQnZQat3s+UT6i2
   A==;
X-CSE-ConnectionGUID: yj6n7Qx5TX+/foAPT8xK8A==
X-CSE-MsgGUID: D9F5NaQNS62wa7nlYs1Rnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="54405788"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="54405788"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 13:34:33 -0700
X-CSE-ConnectionGUID: Dj06fDl5TVC+5T9v7yWsnQ==
X-CSE-MsgGUID: 6B5P1qnTRbexe4vLgpbZPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="149246683"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.223.23])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 13:34:33 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org,
	intel-xe@lists.freedesktop.org,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH 07/10] platform/x86/intel/pmt: use a version struct
Date: Fri, 30 May 2025 16:33:44 -0400
Message-ID: <20250530203356.190234-7-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530203356.190234-1-michael.j.ruhl@intel.com>
References: <20250530203356.190234-1-michael.j.ruhl@intel.com>
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

