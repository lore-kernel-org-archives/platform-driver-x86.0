Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE271D54D1
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 May 2025 15:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747407875; cv=none; b=tdUIItuSM7Zx7UdmXj5jlpP68B9YeC+LHjGHWR9UJY74woF1iH/DLL4mZCAtZi7q7kDdyWEqxWe4lJWPgaZeZ18+IosL8m3gyN7yRjeMS1/bKDAox34U/i6O1AL4Ue4sDWmKlzEXYuLj4zwWNyuxb6OV9A4EYBdo/2NnNzVGFQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747407875; c=relaxed/simple;
	bh=wKDMOpMGmkrERQ7Ax5b1Z9N9YzYEeSgeWlvS8eCNe00=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DMPaf3HzmZ9UWejqVf2Zfkum1zGv/35v9Z1p6vwVAcjgCQfsKonoj/Kmu/4lQo017YzBvixVi1BGD4Q9EV7/IP8AsCRPJIbN/n2QeyPDQmSSwyeiTLEJlRX/sPfpm61MLFrV53NqbKODC+pDaAJjl5Y9UgPwpnvgxXfOa0XrtRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y1DmKcZ/; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y1DmKcZ/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747407874; x=1778943874;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wKDMOpMGmkrERQ7Ax5b1Z9N9YzYEeSgeWlvS8eCNe00=;
  b=Y1DmKcZ/KDtr4J3CtYYlOzMMLmGMP+8tjooCujK6bNWg1qsn1q/PInii
   ooMXfp8tt2vtPSdogwvWckWW0vfqNe8AZfuAq8oCnPJLrYzhyxWlipMPI
   rjT9u550caLQUGQWYv9RE6yuZ7gm3/zaJBiAqnyLOglJaLmO9jxidbt0R
   tXFNId28R2JiAJjn1UQMy6Tz5UwjuuZHZzsF43Wt05mJ8XJr95Cx9Artv
   daPIUmfg6dg+BlO+dGnRsx0BSw7fmOVFBXkhOZMoIPAi1CGEjkDN2EKYe
   hBps3ksb2SzlcFz35STO2S0tJ12tI+ZM7Q11jyXn3MFQcHTZqrVRGFagm
   w==;
X-CSE-ConnectionGUID: 9t7aFn5ER6q20s4J6epxVQ==
X-CSE-MsgGUID: +UWhoWgKRTmV2QdirYYIEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="59612951"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="59612951"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 08:04:31 -0700
X-CSE-ConnectionGUID: 4gU5wXg7RkmicswKtFHI9Q==
X-CSE-MsgGUID: v0zTLxlRR7yMqTFY5ICfYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="139202935"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.223.225])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 08:04:30 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH 4/4] platform/x86/intel/pmt: support BMG crashlog
Date: Fri, 16 May 2025 11:04:16 -0400
Message-ID: <20250516150416.210625-5-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250516150416.210625-1-michael.j.ruhl@intel.com>
References: <20250516150416.210625-1-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Battlemage GPU has the type 1 version 2 crashlog
feature.

Update the crashlog driver to support this crashlog
version.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/class.h    |   2 +
 drivers/platform/x86/intel/pmt/crashlog.c | 328 +++++++++++++++++++---
 2 files changed, 288 insertions(+), 42 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x86/intel/pmt/class.h
index 6b3455a86471..9c0c7e2efecf 100644
--- a/drivers/platform/x86/intel/pmt/class.h
+++ b/drivers/platform/x86/intel/pmt/class.h
@@ -31,6 +31,8 @@ struct telem_endpoint {
 };
 
 struct intel_pmt_header {
+	u32	type;
+	u32	version;
 	u32	base_offset;
 	u32	size;
 	u32	guid;
diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index c9bfe1c26311..700a51d2563a 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -23,10 +23,17 @@
 #define CRASH_TYPE_OOBMSM	1
 
 /* Crashlog Discovery Header */
-#define CONTROL_OFFSET		0x0
-#define GUID_OFFSET		0x4
-#define BASE_OFFSET		0x8
-#define SIZE_OFFSET		0xC
+#define CONTROL_OFFSET		0x00
+#define GUID_OFFSET		0x04
+#define BASE_OFFSET		0x08
+#define SIZE_OFFSET		0x0C
+
+#define TYPE1_VER0_CONTROL_OFFSET	0x0
+#define TYPE1_VER0_STATUS_OFFSET	0x0
+
+#define TYPE1_VER2_CONTROL_OFFSET	0x14
+#define TYPE1_VER2_STATUS_OFFSET	0x0
+
 #define GET_ACCESS(v)		((v) & GENMASK(3, 0))
 /* size is in bytes */
 #define GET_SIZE(v)		((v) * sizeof(u32))
@@ -56,9 +63,37 @@ struct type1_ver0_base {
 	u32 complete:		1;  /* ro/v  31:31 */
 };
 
+struct type1_ver2_status {
+	u32 access_type:	4;  /* ro    0:3  */
+	u32 crash_type:		4;  /* ro    4:7  */
+	u32 count:		8;  /* ro    8:15 */
+	u32 version:		4;  /* ro   16:19 */
+	u32 clear_support:	1;  /* ro   20:20 */
+	u32 rsvd:		4;  /* ro   21:24 */
+	u32 rearmed:		1;  /* ro   25:25 */
+	u32 error:		1;  /* ro   26:26 */
+	u32 consumed:		1;  /* ro   27:27 */
+	u32 disable:		1;  /* ro   28:28 */
+	u32 cleared:		1;  /* ro   29:29 */
+	u32 in_progress:	1;  /* ro   30:30 */
+	u32 complete:		1;  /* ro   31:31 */
+};
+
+struct type1_ver2_control {
+	u32 rsvd0:		25; /* ro    0:24 */
+	u32 consumed:		1;  /* rw/v 25:25 */
+	u32 rsvd1:		1;  /* ro/v 26:26 */
+	u32 rsvd2:		1;  /* ro/v 27:27 */
+	u32 rearm:		1;  /* rw/v 28:28 */
+	u32 manual:		1;  /* rw/v 29:29 */
+	u32 clear:		1;  /* rw/v 30:30 */
+	u32 disable:		1;  /* rw/v 31:31 */
+};
+
 struct crashlog_status {
 	union {
 		struct type1_ver0_base stat;
+		struct type1_ver2_status stat2;
 		u32 status;
 	};
 };
@@ -66,6 +101,7 @@ struct crashlog_status {
 struct crashlog_control {
 	union {
 		struct type1_ver0_base ctrl;
+		struct type1_ver2_control ctrl2;
 		u32 control;
 	};
 };
@@ -75,97 +111,174 @@ struct pmt_crashlog_priv {
 	struct crashlog_entry	entry[];
 };
 
+static u32 get_control_offset(struct intel_pmt_header *hdr)
+{
+	return hdr->version == 0 ? TYPE1_VER0_CONTROL_OFFSET : TYPE1_VER2_CONTROL_OFFSET;
+}
+
+static u32 get_status_offset(struct intel_pmt_header *hdr)
+{
+	return hdr->version == 0 ? TYPE1_VER0_STATUS_OFFSET : TYPE1_VER2_STATUS_OFFSET;
+}
+
 /*
  * I/O
  */
 static bool pmt_crashlog_complete(struct intel_pmt_entry *entry)
 {
+	u32 offset = get_status_offset(&entry->header);
 	struct crashlog_status status = {
-		.status = readl(entry->disc_table + CONTROL_OFFSET),
+		.status = readl(entry->disc_table + offset),
 	};
 
 	/* return current value of the crashlog complete flag */
-	return status.stat.complete;
+	if (entry->header.version == 0)
+		return status.stat.complete;
 
+	return status.stat2.complete;
 }
 
 static bool pmt_crashlog_disabled(struct intel_pmt_entry *entry)
 {
+	u32 offset = get_status_offset(&entry->header);
 	struct crashlog_status status = {
-		.status = readl(entry->disc_table + CONTROL_OFFSET),
+		.status = readl(entry->disc_table + offset),
 	};
 
 	/* return current value of the crashlog disabled flag */
-	return status.stat.disable;
+	if (entry->header.version == 0)
+		return status.stat.disable;
+
+	return status.stat2.disable;
 }
 
-static bool pmt_crashlog_supported(struct intel_pmt_entry *entry)
+static bool pmt_crashlog_supported(struct intel_pmt_entry *entry, u32 *crash_type, u32 *version)
 {
 	struct crashlog_control discovery_header = {
 		.control = readl(entry->disc_table + CONTROL_OFFSET),
 	};
-	u32 crash_type, version;
 
-	crash_type = discovery_header.ctrl.crash_type;
-	version = discovery_header.ctrl.version;
+	*crash_type = discovery_header.ctrl.crash_type;
+	*version = discovery_header.ctrl.version;
 
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
 
 static void pmt_crashlog_set_disable(struct intel_pmt_entry *entry,
 				     bool disable)
 {
+	u32 offset = get_control_offset(&entry->header);
 	struct crashlog_control control = {
-		.control = readl(entry->disc_table + CONTROL_OFFSET),
+		.control = readl(entry->disc_table + offset),
 	};
 
-	/* clear trigger bits so we are only modifying disable flag */
-	control.ctrl.clear = 0;
-	control.ctrl.manual = 0;
-	control.ctrl.complete = 0;
+	if (entry->header.version == 0) {
+		/* clear trigger bits so we are only modifying disable flag */
+		control.ctrl.clear = 0;
+		control.ctrl.manual = 0;
+		control.ctrl.complete = 0;
 
-	if (disable)
-		control.ctrl.disable = 1;
-	else
-		control.ctrl.disable = 0;
+		control.ctrl.disable = disable;
+	} else {
+		control.ctrl2.manual = 0;
+		control.ctrl2.clear = 0;
 
-	writel(control.control, entry->disc_table + CONTROL_OFFSET);
+		control.ctrl2.disable = disable;
+	}
+
+	writel(control.control, entry->disc_table + offset);
 }
 
 static void pmt_crashlog_set_clear(struct intel_pmt_entry *entry)
 {
+	u32 offset = get_control_offset(&entry->header);
 	struct crashlog_control control = {
-		.control = readl(entry->disc_table + CONTROL_OFFSET),
+		.control = readl(entry->disc_table + offset),
 	};
 
-	/* clear trigger bits so we are only modifying disable flag */
-	control.ctrl.disable = 0;
-	control.ctrl.manual = 0;
-	control.ctrl.complete = 0;
+	if (entry->header.version == 0) {
+		/* clear trigger bits so we are only modifying disable flag */
+		control.ctrl.disable = 0;
+		control.ctrl.manual = 0;
+		control.ctrl.complete = 0;
+
+		control.ctrl.clear = 1;
+	} else {
+		control.ctrl2.disable = 0;
+		control.ctrl2.manual = 0;
 
-	control.ctrl.clear = 1;
+		control.ctrl2.clear = 1;
+	}
 
-	writel(control.control, entry->disc_table + CONTROL_OFFSET);
+	writel(control.control, entry->disc_table + offset);
 }
 
 static void pmt_crashlog_set_execute(struct intel_pmt_entry *entry)
 {
+	u32 offset = get_control_offset(&entry->header);
 	struct crashlog_control control = {
-		.control = readl(entry->disc_table + CONTROL_OFFSET),
+		.control = readl(entry->disc_table + offset),
+	};
+
+	if (entry->header.version == 0) {
+		/* clear trigger bits so we are only modifying disable flag */
+		control.ctrl.disable = 0;
+		control.ctrl.clear = 0;
+		control.ctrl.complete = 0;
+
+		control.ctrl.manual = 1;
+	} else {
+		control.ctrl2.disable = 0;
+		control.ctrl2.clear = 0;
+
+		control.ctrl2.manual = 1;
+	}
+
+	writel(control.control, entry->disc_table + offset);
+}
+
+/* version 2 support */
+static void pmt_crashlog_set_consumed(struct intel_pmt_entry *entry)
+{
+	u32 offset = get_control_offset(&entry->header);
+	struct crashlog_control control = {
+		.control = readl(entry->disc_table + offset),
 	};
 
-	/* clear trigger bits so we are only modifying disable flag */
-	control.ctrl.disable = 0;
-	control.ctrl.clear = 0;
-	control.ctrl.complete = 0;
+	control.ctrl2.consumed = 1;
+
+	writel(control.control, entry->disc_table + offset);
+}
 
-	control.ctrl.manual = 1;
+static bool pmt_crashlog_rearm(struct intel_pmt_entry *entry)
+{
+	u32 offset = get_status_offset(&entry->header);
+	struct crashlog_status status = {
+		.status = readl(entry->disc_table + offset),
+	};
 
-	writel(control.control, entry->disc_table + CONTROL_OFFSET);
+	return status.stat2.rearmed;
+}
+
+static void pmt_crashlog_set_rearm(struct intel_pmt_entry *entry)
+{
+	u32 offset = get_control_offset(&entry->header);
+	struct crashlog_control control = {
+		.control = readl(entry->disc_table + offset),
+	};
+
+	control.ctrl2.rearm = 1;
+
+	writel(control.control, entry->disc_table + offset);
 }
 
 /*
@@ -177,7 +290,7 @@ enable_show(struct device *dev, struct device_attribute *attr, char *buf)
 	struct intel_pmt_entry *entry = dev_get_drvdata(dev);
 	int enabled = !pmt_crashlog_disabled(entry);
 
-	return sprintf(buf, "%d\n", enabled);
+	return sysfs_emit(buf, "%d\n", enabled);
 }
 
 static ssize_t
@@ -251,16 +364,135 @@ trigger_store(struct device *dev, struct device_attribute *attr,
 }
 static DEVICE_ATTR_RW(trigger);
 
+static ssize_t consumed_store(struct device *dev, struct device_attribute *attr,
+			      const char *buf, size_t count)
+{
+	struct crashlog_entry *entry;
+	bool consumed;
+	int result;
+
+	entry = dev_get_drvdata(dev);
+
+	result = kstrtobool(buf, &consumed);
+	if (result)
+		return result;
+
+	/* set bit only */
+	if (!consumed)
+		return -EINVAL;
+
+	mutex_lock(&entry->control_mutex);
+
+	if (pmt_crashlog_disabled(&entry->entry)) {
+		result = -EBUSY;
+		goto err;
+	} else if (!pmt_crashlog_complete(&entry->entry)) {
+		result = -EEXIST;
+		goto err;
+	} else {
+		pmt_crashlog_set_consumed(&entry->entry);
+	}
+
+err:
+	mutex_unlock(&entry->control_mutex);
+	return count;
+}
+static DEVICE_ATTR_WO(consumed);
+
+static ssize_t
+rearm_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct intel_pmt_entry *entry = dev_get_drvdata(dev);
+	int rearmed = pmt_crashlog_rearm(entry);
+
+	return sysfs_emit(buf, "%d\n", rearmed);
+}
+
+static ssize_t rearm_store(struct device *dev, struct device_attribute *attr,
+			   const char *buf, size_t count)
+{
+	struct crashlog_entry *entry;
+	bool trigger;
+	int result;
+
+	entry = dev_get_drvdata(dev);
+
+	result = kstrtobool(buf, &trigger);
+	if (result)
+		return result;
+
+	/* set only */
+	if (!trigger)
+		return -EINVAL;
+
+	mutex_lock(&entry->control_mutex);
+	pmt_crashlog_set_rearm(&entry->entry);
+	mutex_unlock(&entry->control_mutex);
+
+	return count;
+}
+static DEVICE_ATTR_RW(rearm);
+
+#define DEBUG_REGISTER_INFO
+#ifdef DEBUG_REGISTER_INFO
+static ssize_t
+status_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+       struct intel_pmt_entry *entry = dev_get_drvdata(dev);
+       u32 sts_off = get_status_offset(&entry->header);
+       u32 ctl_off = get_control_offset(&entry->header);
+       struct crashlog_status status = {
+               .status = readl(entry->disc_table + sts_off),
+       };
+       struct crashlog_control control = {
+               .control = readl(entry->disc_table + ctl_off),
+       };
+       int len = 0;
+
+       len += sysfs_emit_at(buf, len, "clear_support: %d\n", status.stat2.clear_support);
+       len += sysfs_emit_at(buf, len, "rearmed: %d\n", status.stat2.rearmed);
+       len += sysfs_emit_at(buf, len, "error: %d\n", status.stat2.error);
+       len += sysfs_emit_at(buf, len, "consumed: %d\n", status.stat2.consumed);
+       len += sysfs_emit_at(buf, len, "disable: %d\n", status.stat2.disable);
+       len += sysfs_emit_at(buf, len, "cleared: %d\n", status.stat2.cleared);
+       len += sysfs_emit_at(buf, len, "in_progress: %d\n", status.stat2.in_progress);
+       len += sysfs_emit_at(buf, len, "complete: %d\n", status.stat2.complete);
+       len += sysfs_emit_at(buf, len, "sts_off: 0x%02x  ctl_off: 0x%02x\n", sts_off, ctl_off);
+       len += sysfs_emit_at(buf, len, "status:  0x%08x\n", status.status);
+       len += sysfs_emit_at(buf, len, "control: 0x%08x\n", control.control);
+
+       return len;
+}
+static DEVICE_ATTR_RO(status);
+#endif
+
 static struct attribute *pmt_crashlog_attrs[] = {
 	&dev_attr_enable.attr,
 	&dev_attr_trigger.attr,
 	NULL
 };
 
+static struct attribute *pmt_crashlog_ver2_attrs[] = {
+	&dev_attr_enable.attr,
+	&dev_attr_trigger.attr,
+	&dev_attr_consumed.attr,
+	&dev_attr_rearm.attr,
+#ifdef DEBUG_REGISTER_INFO
+	&dev_attr_status.attr,
+#endif
+	NULL
+};
+
 static const struct attribute_group pmt_crashlog_group = {
 	.attrs	= pmt_crashlog_attrs,
 };
 
+static const struct attribute_group pmt_crashlog_ver2_group = {
+	.attrs	= pmt_crashlog_ver2_attrs,
+};
+
+static int pmt_crashlog_header_decode(struct intel_pmt_entry *entry, struct device *dev);
+
 static int pmt_crashlog_add_endpoint(struct intel_vsec_device *ivdev,
 				     struct intel_pmt_entry *entry)
 {
@@ -286,14 +518,24 @@ static int pmt_crashlog_add_endpoint(struct intel_vsec_device *ivdev,
 	return 0;
 }
 
+static const struct attribute_group *select_sysfs_grp(struct intel_pmt_header *hdr)
+{
+	if (hdr->version == 0)
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
 
 	/* initialize control mutex */
@@ -303,11 +545,13 @@ static int pmt_crashlog_header_decode(struct intel_pmt_entry *entry,
 	header->access_type = GET_ACCESS(readl(disc_table));
 	header->guid = readl(disc_table + GUID_OFFSET);
 	header->base_offset = readl(disc_table + BASE_OFFSET);
+	header->type = type;
+	header->version = version;
 
 	/* Size is measured in DWORDS, but accessor returns bytes */
 	header->size = GET_SIZE(readl(disc_table + SIZE_OFFSET));
 
-	entry->attr_grp = &pmt_crashlog_group;
+	entry->attr_grp = select_sysfs_grp(header);
 
 	return 0;
 }
-- 
2.49.0

