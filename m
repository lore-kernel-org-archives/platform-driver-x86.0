Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0BD2ECEAE
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Jun 2025 20:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751057042; cv=none; b=WajNH+T/cZ3pacFC9gMkuP38zthxDt4CIX1jSRhmJldl/gOTmZmWRH619DZsCorzUXyt+GSC9dgecdD2cmf1ZAloqYKXRBzBQWpVfuuiN543ffHHv4Oibhe+jNK2p1105NG6yceZ2XPSXCnKkX9q5g0oIyrw8cNpwVRfTg4B+NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751057042; c=relaxed/simple;
	bh=kd7JMfkJbXJD6b277V8aumii4b25ONEAOo9SA0gbWjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QJqu5TCZsmw2b/4pVdqvgpALEaq/cu7CUCU4PfyhdpAr4oWb9JDeLDXp83ZL+1do/x9ZwGMavf39/z0BWGS5fcTl4Kyj68kmFXAOPGlFMeGQMYq2lm0H3kmLEPnetID5C0tEAASQAtutqABQuDVDGTpNLv/mVlO8llIKYuE3yN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pb5Oe8He; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pb5Oe8He"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751057041; x=1782593041;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kd7JMfkJbXJD6b277V8aumii4b25ONEAOo9SA0gbWjY=;
  b=Pb5Oe8HePRaQ29pmJKVtRCvaaRixuzpu0Son2TFWJ8AHArHVZ/ExyoEd
   AeFrHHBxVB7r70LRoX6509PPIJxRllcowJ6XZ21R13pte1HrV+sbTb17x
   BA2kOqHitGm8DG1vuOFpSM2sKK9Z4NPufjYkOznuOUhMAnM0ohf1c9O2j
   9MWzGvOj7A+vhBY64Zr1uYU9c9kH7Pg+lKeoXA7zptOLru5bW4qykK3P/
   DIMKxSnFTjgAMXu4EGFu4DP1IN+NfSQQMptYZa/WhcJ/GsNl/GHSAx73o
   B/Ga6xWW4ukLiKVhPsdHhQtctop5ILF0yoqSqSolkfU1Q5ubYtSYTbuqv
   w==;
X-CSE-ConnectionGUID: 7OF29BpfSeutx/1oLxVpcA==
X-CSE-MsgGUID: H68k2F4MS2SZJmu3EmwDSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="41003235"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="41003235"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 13:44:00 -0700
X-CSE-ConnectionGUID: TVAdHL6gQganBg9OZVV7JA==
X-CSE-MsgGUID: n005krcZSMeN2PRAzslREQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="156939090"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.220.252])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 13:43:59 -0700
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
Subject: [PATCH v5 12/12] platform/x86/intel/pmt: support BMG crashlog
Date: Fri, 27 Jun 2025 16:43:21 -0400
Message-ID: <20250627204321.521628-13-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627204321.521628-1-michael.j.ruhl@intel.com>
References: <20250627204321.521628-1-michael.j.ruhl@intel.com>
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
 drivers/platform/x86/intel/pmt/crashlog.c | 268 ++++++++++++++++++++--
 1 file changed, 255 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index d109f307f110..6dfd6ce07599 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -53,20 +53,52 @@
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
+#define TYPE1_VER2_TRIGGER_MASK		(TYPE1_VER2_EXECUTE | TYPE1_VER2_CLEAR | TYPE1_VER2_DISABLE)
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
@@ -87,6 +119,26 @@ static const struct crashlog_info crashlog_type1_ver0 = {
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
@@ -143,19 +195,23 @@ static bool pmt_crashlog_disabled(struct crashlog_entry *crashlog)
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
 
 static void pmt_crashlog_set_disable(struct crashlog_entry *crashlog, bool disable)
@@ -173,9 +229,118 @@ static void pmt_crashlog_set_execute(struct crashlog_entry *crashlog)
 	pmt_crashlog_rmw(crashlog, crashlog->info->control.manual, CRASHLOG_SET_BIT);
 }
 
+static bool pmt_crashlog_cleared(struct crashlog_entry *crashlog)
+{
+	/* return current value of the crashlog cleared flag */
+	return pmt_crashlog_rc(crashlog, crashlog->info->status.cleared);
+}
+
+static bool pmt_crashlog_consumed(struct crashlog_entry *crashlog)
+{
+	/* return current value of the crashlog consumedflag */
+	return pmt_crashlog_rc(crashlog, crashlog->info->status.consumed);
+}
+
+static void pmt_crashlog_set_consumed(struct crashlog_entry *crashlog)
+{
+	pmt_crashlog_rmw(crashlog, crashlog->info->control.consume, CRASHLOG_SET_BIT);
+}
+
+static bool pmt_crashlog_error(struct crashlog_entry *crashlog)
+{
+	/* return current value of the crashlog error flag */
+	return pmt_crashlog_rc(crashlog, crashlog->info->status.error);
+}
+
+static bool pmt_crashlog_rearm(struct crashlog_entry *crashlog)
+{
+	/* return current value of the crashlog reamed flag */
+	return pmt_crashlog_rc(crashlog, crashlog->info->status.rearmed);
+}
+
+static void pmt_crashlog_set_rearm(struct crashlog_entry *crashlog)
+{
+	pmt_crashlog_rmw(crashlog, crashlog->info->control.rearm, CRASHLOG_SET_BIT);
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
@@ -207,6 +372,50 @@ enable_store(struct device *dev, struct device_attribute *attr,
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
@@ -254,30 +463,63 @@ trigger_store(struct device *dev, struct device_attribute *attr,
 }
 static DEVICE_ATTR_RW(trigger);
 
-static struct attribute *pmt_crashlog_attrs[] = {
+static struct attribute *pmt_crashlog_type1_ver0_attrs[] = {
 	&dev_attr_enable.attr,
 	&dev_attr_trigger.attr,
 	NULL
 };
 
-static const struct attribute_group pmt_crashlog_group = {
-	.attrs	= pmt_crashlog_attrs,
+static struct attribute *pmt_crashlog_type1_ver2_attrs[] = {
+	&dev_attr_clear.attr,
+	&dev_attr_consumed.attr,
+	&dev_attr_enable.attr,
+	&dev_attr_error.attr,
+	&dev_attr_rearm.attr,
+	&dev_attr_trigger.attr,
+	NULL
+};
+
+static const struct attribute_group pmt_crashlog_type1_ver0_group = {
+	.attrs	= pmt_crashlog_type1_ver0_attrs,
 };
 
+static const struct attribute_group pmt_crashlog_type1_ver2_group = {
+	.attrs = pmt_crashlog_type1_ver2_attrs,
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
+		return &pmt_crashlog_type1_ver2_group;
+
+	return &pmt_crashlog_type1_ver2_group;
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
@@ -286,7 +528,7 @@ static int pmt_crashlog_header_decode(struct intel_pmt_entry *entry,
 	/* Size is measured in DWORDS, but accessor returns bytes */
 	header->size = GET_SIZE(readl(disc_table + SIZE_OFFSET));
 
-	entry->attr_grp = &pmt_crashlog_group;
+	entry->attr_grp = select_sysfs_grp(type, version);
 
 	return 0;
 }
-- 
2.49.0

