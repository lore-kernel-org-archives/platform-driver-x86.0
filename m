Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BA3269CED
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Jun 2025 21:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749589986; cv=none; b=ALBIlSNeeGQngNyTSJp23F72sRtEnNXK+4SekN+9zcC8hQPY46zJEMQXXOm1VdggOPzgrJmUWpGljPwd9pjz2lJ9ojDJdlRy0JH5ZUDmBUVqKfoFfem8W8vTLG9BHYrBZcIKLpF2m41f4OPT0pb+TSFpEZDnbLXuQK4dFNCOdKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749589986; c=relaxed/simple;
	bh=pSQcJiqh17/DZH0gllgI5mFjVxpS907sIY3Ak6I783I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TzUuTQEcj0K3rOmJlq9o2GiG8FaoXkCwtT7WN+s2zD/cIlsPo/wI/+0SfW/UNsulaVrZPV7ldeoO3bVHWcmj/MugnUQXuvmUJWyACvRIOzplevpPhKxElXP08WYtZDNW4a/r1QeDGqE9UvtiptfXHKSPMVDGejIuJ7jwtlYyZEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l1TcuUuK; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l1TcuUuK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749589985; x=1781125985;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pSQcJiqh17/DZH0gllgI5mFjVxpS907sIY3Ak6I783I=;
  b=l1TcuUuKvWShM0prk1A8zqNk6HklS1oKtqF6fqZEK+fycJx5ur3l+lzd
   w911xB2lgzWHkd7GSqKc0sFBDrUBSCrJEKLEVEzRACuP5T3vZtfjPiWGi
   wioi5nljcG8zkct1LYQQp0+XGgbL48fwUJvxRlxc5cm74P3uvcyNQhn5y
   AsPzVIzn8ZMcnIHgBzhIeQEa5k9UwykS4cS/CvBv+GeQd8eCmDdIWNRwb
   EL/8TydbAtiKOTyDvAg2h7ZiEMBDZZ7NlTMQ2AVFsy0C8mM5LBh9Lc6TK
   KceS7yrhXYzf27Kl8cGdaWu6shx2aQbpau0FPVRYeanU0tKxUZf9u9CA2
   A==;
X-CSE-ConnectionGUID: eKwF5R5JTIGYkGf2Q80GlQ==
X-CSE-MsgGUID: +4PtDq2YQnGIAjO1HWsVGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51816964"
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; 
   d="scan'208";a="51816964"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 14:13:04 -0700
X-CSE-ConnectionGUID: gmfIwZ8zRkmKJJSDyUxArQ==
X-CSE-MsgGUID: IvKEGhcQT7GqIdc4umqlAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; 
   d="scan'208";a="146939882"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.220.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 14:13:02 -0700
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
Subject: [PATCH v4 09/10] platform/x86/intel/pmt: use a version struct
Date: Tue, 10 Jun 2025 17:12:24 -0400
Message-ID: <20250610211225.1085901-10-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610211225.1085901-1-michael.j.ruhl@intel.com>
References: <20250610211225.1085901-1-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for supporting multiple crashlog versions, use a struct
to keep bit offset info for the status and control bits.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/crashlog.c | 174 ++++++++++++++--------
 1 file changed, 108 insertions(+), 66 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index e11865686f2a..7c259b1cf95b 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -23,21 +23,6 @@
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
@@ -49,10 +34,63 @@
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
+	u32 cleared;
+	u32 complete;
+	u32 disabled;
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
+};
+
 struct crashlog_entry {
 	/* entry must be first member of struct */
 	struct intel_pmt_entry		entry;
 	struct mutex			control_mutex;
+	const struct crashlog_info	*info;
 };
 
 struct pmt_crashlog_priv {
@@ -60,74 +98,76 @@ struct pmt_crashlog_priv {
 	struct crashlog_entry	entry[];
 };
 
+static bool pmt_crashlog_supported(struct intel_pmt_entry *entry)
+{
+	u32 discovery_header = readl(entry->disc_table + CONTROL_OFFSET);
+	u32 crash_type, version;
+
+	crash_type = GET_TYPE(discovery_header);
+	version = GET_VERSION(discovery_header);
+
+	/*
+	 * Currently we only recognize OOBMSM version 0 devices.
+	 * We can ignore all other crashlog devices in the system.
+	 */
+	return crash_type == CRASH_TYPE_OOBMSM && version == 0;
+}
+
 /*
  * I/O
  */
-#define SET	true
-#define CLEAR	false
+#define SET     true
+#define CLEAR   false
 
-static void read_modify_write(struct intel_pmt_entry *entry, u32 bit, bool set)
+static void read_modify_write(struct crashlog_entry *crashlog, u32 bit, bool set)
 {
-	u32 reg = readl(entry->disc_table + CONTROL_OFFSET);
+	const struct crashlog_control *control = &crashlog->info->control;
+	struct intel_pmt_entry *entry = &crashlog->entry;
+	u32 reg = readl(entry->disc_table + control->offset);
 
-	reg &= ~CRASHLOG_FLAG_TRIGGER_MASK;
+	reg &= ~control->trigger_mask;
 
 	if (set)
 		reg |= bit;
 	else
 		reg &= bit;
 
-	writel(reg, entry->disc_table + CONTROL_OFFSET);
+	writel(reg, entry->disc_table + control->offset);
 }
 
-static bool read_check(struct intel_pmt_entry *entry, u32 bit)
+static bool read_check(struct crashlog_entry *crashlog, u32 bit)
 {
-	u32 reg = readl(entry->disc_table + CONTROL_OFFSET);
+	const struct crashlog_status *status = &crashlog->info->status;
+	u32 reg = readl(crashlog->entry.disc_table + status->offset);
 
 	return !!(reg & bit);
 }
 
-static bool pmt_crashlog_complete(struct intel_pmt_entry *entry)
+static bool pmt_crashlog_complete(struct crashlog_entry *crashlog)
 {
 	/* return current value of the crashlog complete flag */
-	return read_check(entry, CRASHLOG_FLAG_TRIGGER_COMPLETE);
+	return read_check(crashlog, crashlog->info->status.complete);
 }
 
-static bool pmt_crashlog_disabled(struct intel_pmt_entry *entry)
+static bool pmt_crashlog_disabled(struct crashlog_entry *crashlog)
 {
 	/* return current value of the crashlog disabled flag */
-	return read_check(entry, CRASHLOG_FLAG_DISABLE);
+	return read_check(crashlog, crashlog->info->status.disabled);
 }
 
-static bool pmt_crashlog_supported(struct intel_pmt_entry *entry)
+static void pmt_crashlog_set_disable(struct crashlog_entry *crashlog, bool disable)
 {
-	u32 discovery_header = readl(entry->disc_table + CONTROL_OFFSET);
-	u32 crash_type, version;
-
-	crash_type = GET_TYPE(discovery_header);
-	version = GET_VERSION(discovery_header);
-
-	/*
-	 * Currently we only recognize OOBMSM version 0 devices.
-	 * We can ignore all other crashlog devices in the system.
-	 */
-	return crash_type == CRASH_TYPE_OOBMSM && version == 0;
+	read_modify_write(crashlog, crashlog->info->control.disable, disable);
 }
 
-static void pmt_crashlog_set_disable(struct intel_pmt_entry *entry,
-				     bool disable)
+static void pmt_crashlog_set_clear(struct crashlog_entry *crashlog)
 {
-	read_modify_write(entry, CRASHLOG_FLAG_DISABLE, disable);
+	read_modify_write(crashlog, crashlog->info->control.clear, SET);
 }
 
-static void pmt_crashlog_set_clear(struct intel_pmt_entry *entry)
+static void pmt_crashlog_set_execute(struct crashlog_entry *crashlog)
 {
-	read_modify_write(entry, CRASHLOG_FLAG_TRIGGER_CLEAR, SET);
-}
-
-static void pmt_crashlog_set_execute(struct intel_pmt_entry *entry)
-{
-	read_modify_write(entry, CRASHLOG_FLAG_TRIGGER_EXECUTE, SET);
+	read_modify_write(crashlog, crashlog->info->control.manual, SET);
 }
 
 /*
@@ -136,8 +176,8 @@ static void pmt_crashlog_set_execute(struct intel_pmt_entry *entry)
 static ssize_t
 enable_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
-	struct intel_pmt_entry *entry = dev_get_drvdata(dev);
-	bool enabled = !pmt_crashlog_disabled(entry);
+	struct crashlog_entry *crashlog = dev_get_drvdata(dev);
+	bool enabled = !pmt_crashlog_disabled(crashlog);
 
 	return sprintf(buf, "%d\n", enabled);
 }
@@ -146,19 +186,19 @@ static ssize_t
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
+	pmt_crashlog_set_disable(crashlog, !enabled);
 
 	return count;
 }
@@ -167,11 +207,11 @@ static DEVICE_ATTR_RW(enable);
 static ssize_t
 trigger_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
-	struct intel_pmt_entry *entry;
+	struct crashlog_entry *crashlog;
 	bool trigger;
 
-	entry = dev_get_drvdata(dev);
-	trigger = pmt_crashlog_complete(entry);
+	crashlog = dev_get_drvdata(dev);
+	trigger = pmt_crashlog_complete(crashlog);
 
 	return sprintf(buf, "%d\n", trigger);
 }
@@ -180,32 +220,33 @@ static ssize_t
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
 
 	/* if device is currently disabled, return busy */
-	if (pmt_crashlog_disabled(&entry->entry))
+	if (pmt_crashlog_disabled(crashlog))
 		return -EBUSY;
 
 	if (!trigger) {
-		pmt_crashlog_set_clear(&entry->entry);
+		pmt_crashlog_set_clear(crashlog);
 		return count;
 	}
 
 	/* we cannot trigger a new crash if one is still pending */
-	if (pmt_crashlog_complete(&entry->entry))
+	if (pmt_crashlog_complete(crashlog))
 		return -EEXIST;
 
-	pmt_crashlog_set_execute(&entry->entry);
+	pmt_crashlog_set_execute(crashlog);
+
 
 	return count;
 }
@@ -231,9 +272,10 @@ static int pmt_crashlog_header_decode(struct intel_pmt_entry *entry,
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

