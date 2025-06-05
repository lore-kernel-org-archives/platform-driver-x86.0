Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F29327B4EB
	for <platform-driver-x86@vger.kernel.org>; Thu,  5 Jun 2025 18:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749149152; cv=none; b=GBo4bNFW5r54C3PJIcf8UFHRC0X4R2vowT7ILY54130hlPa5BMFYKWSwVS6iZfemfjlXvciC+vBMrHBsKLS7uvVGLOym9jDLg0qbV2CojY8Sma3cAoPw0/C6x5h8JsPMRUtG+cVqUCY8CWvmI4u1Q9QBYhRjVkSZttPUypBbZ8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749149152; c=relaxed/simple;
	bh=qxnvXV31lRQDVCZcs8j00AzmRi1+00o8S8B5/kfyxs4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nFPT8AYEXqtX+kBaxVSOXrVb6FH+tCRLHOwq6PeW0FjHLs38hBeIUFHFdAfITFsDdVy8CXOJaPiDz6JDosh0rtOPEl3OvFiqOGoHXU/Fp1zFAzhPasb03Xj0gtLmNCzLJV0trbHEsBWhZCGtH9Q1e0o/4GafPYSbh4y44Y2fyXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=haCCBDj1; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="haCCBDj1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749149150; x=1780685150;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qxnvXV31lRQDVCZcs8j00AzmRi1+00o8S8B5/kfyxs4=;
  b=haCCBDj1h4nyBZRxzMHerSZ0qKb2edTBzGIqCiFvmfnINtMHsr89pkE2
   xAre66J+z8/KoC8MGSE4aNI7Sr5I1kW1tJmm+qze3x9GfRwayuWL+2732
   WCO0ZYfQq7OsOB9IlgACn4XoJL4JBhNPthghC8NaxjN4eJ0WJNByETCNB
   OWzaQ36CnrMCinmRyt9uOMCVrnGcrKaJ206pLLbBXNZKXp8VC8CDxEiE6
   kjxNtZA7nS3wyvSHZLSWBkjMWT+4YPxfBarDRI4OYaSJTvRsx75gXoZVl
   u5VTRAFbp5xkcHJzJVqveSF6iL29ZxuIe/EAVuY7+evLZNKfqGFOStAwJ
   Q==;
X-CSE-ConnectionGUID: aKKBFkSfQVKy1tPz4Qmj0A==
X-CSE-MsgGUID: xOiPqhrVRdOQ9Lv3aV4OWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="38916695"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; 
   d="scan'208";a="38916695"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 11:45:50 -0700
X-CSE-ConnectionGUID: 9qudXdI0R6+j+CfeF2+54Q==
X-CSE-MsgGUID: DZV2FV8pQ4iUxBxst30OCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; 
   d="scan'208";a="182782648"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.222.42])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 11:45:48 -0700
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
Subject: [PATCH v3 11/11] platform/x86/intel/pmt: support BMG crashlog
Date: Thu,  5 Jun 2025 14:44:44 -0400
Message-ID: <20250605184444.515556-12-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605184444.515556-1-michael.j.ruhl@intel.com>
References: <20250605184444.515556-1-michael.j.ruhl@intel.com>
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
 drivers/platform/x86/intel/pmt/crashlog.c | 283 ++++++++++++++++++++--
 1 file changed, 264 insertions(+), 19 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index fe6563721886..0fb60036a9bb 100644
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
@@ -74,9 +107,9 @@ struct crashlog_info {
 
 const struct crashlog_info crashlog_type1_ver0 = {
 	.status.offset = TYPE1_VER0_STATUS_OFFSET,
-	.status.clear = TYPE1_VER0_CLEAR,
+	.status.cleared = TYPE1_VER0_CLEAR,
 	.status.complete = TYPE1_VER0_COMPLETE,
-	.status.disable = TYPE1_VER0_DISABLE,
+	.status.disabled = TYPE1_VER0_DISABLE,
 
 	.control.offset = TYPE1_VER0_CONTROL_OFFSET,
 	.control.trigger_mask = TYPE1_VER0_TRIGGER_MASK,
@@ -85,6 +118,26 @@ const struct crashlog_info crashlog_type1_ver0 = {
 	.control.manual = TYPE1_VER0_EXECUTE,
 };
 
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
+};
+
 struct crashlog_entry {
 	/* entry must be first member of struct */
 	struct intel_pmt_entry		entry;
@@ -99,30 +152,35 @@ struct pmt_crashlog_priv {
 
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
  * I/O
  */
 
-#define SET     true
-#define CLEAR   false
+#define SET	true
+#define CLEAR	false
 
 static void read_modify_write(struct crashlog_entry *crashlog, u32 bit, bool set)
 {
@@ -157,7 +215,7 @@ static bool pmt_crashlog_complete(struct crashlog_entry *crashlog)
 static bool pmt_crashlog_disabled(struct crashlog_entry *crashlog)
 {
 	/* return current value of the crashlog disabled flag */
-	return read_check(crashlog, crashlog->info->status.disable);
+	return read_check(crashlog, crashlog->info->status.disabled);
 }
 
 static void pmt_crashlog_set_disable(struct crashlog_entry *crashlog, bool disable)
@@ -175,9 +233,119 @@ static void pmt_crashlog_set_execute(struct crashlog_entry *crashlog)
 	read_modify_write(crashlog, crashlog->info->control.manual, SET);
 }
 
+/* version 2 support */
+static bool pmt_crashlog_cleared(struct crashlog_entry *crashlog)
+{
+	/* return current value of the crashlog cleared flag */
+	return read_check(crashlog, crashlog->info->status.cleared);
+}
+
+static bool pmt_crashlog_consumed(struct crashlog_entry *crashlog)
+{
+	/* return current value of the crashlog consumedflag */
+	return read_check(crashlog, crashlog->info->status.consumed);
+}
+
+static void pmt_crashlog_set_consumed(struct crashlog_entry *crashlog)
+{
+	read_modify_write(crashlog, crashlog->info->control.consume, SET);
+}
+
+static bool pmt_crashlog_error(struct crashlog_entry *crashlog)
+{
+	/* return current value of the crashlog error flag */
+	return read_check(crashlog, crashlog->info->status.error);
+}
+
+static bool pmt_crashlog_rearm(struct crashlog_entry *crashlog)
+{
+	/* return current value of the crashlog reamed flag */
+	return read_check(crashlog, crashlog->info->status.rearmed);
+}
+
+static void pmt_crashlog_set_rearm(struct crashlog_entry *crashlog)
+{
+	read_modify_write(crashlog, crashlog->info->control.rearm, SET);
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
@@ -209,6 +377,50 @@ enable_store(struct device *dev, struct device_attribute *attr,
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
+	pmt_crashlog_set_rearm(crashlog);
+
+	return count;
+}
+static DEVICE_ATTR_RW(rearm);
+
 static ssize_t
 trigger_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
@@ -263,24 +475,57 @@ static struct attribute *pmt_crashlog_attrs[] = {
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
@@ -289,7 +534,7 @@ static int pmt_crashlog_header_decode(struct intel_pmt_entry *entry,
 	/* Size is measured in DWORDS, but accessor returns bytes */
 	header->size = GET_SIZE(readl(disc_table + SIZE_OFFSET));
 
-	entry->attr_grp = &pmt_crashlog_group;
+	entry->attr_grp = select_sysfs_grp(type, version);
 
 	return 0;
 }
-- 
2.49.0

