Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DC455D878
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 Oct 2026 21:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791928034; cv=none; b=UHZ3GdQFely57crMajXl0QuPyzIN9GazFet6dQsnQiANl80H1bhnZNElNQQ4PODL4eWoDB5NS0e3uuoSyJjUqL1ooMKS8eupBseDoDcrA4VBIjsFsGASBkaZmTa8+DcIl2DJplTKyV001Y9u5qc6N/mk2AZzfgm7OkSZZSx8mc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791928034; c=relaxed/simple;
	bh=4+KDGxluOGzdwFY/ygBbnWepF+nMhU7F6UcBtx6GeLA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o7+SimTdw4ccvWWDH6c8Iuz/xY6SN/zFr/GqhGUVpmtR8Ztk7QfSMeTRO6wEePw8clkqjfZbsEP/cY8g8+CqxuNM5kcWuSYpBXJf75cKyQhDry6q7L3RKdKSihGjf9VsxjJXiwH3N3q16/zTBmegyHBppFSpnloGPF52AryCCYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nk7AUa2q; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nk7AUa2q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791928033; x=1823464033;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=4+KDGxluOGzdwFY/ygBbnWepF+nMhU7F6UcBtx6GeLA=;
  b=nk7AUa2qelFVgQH6z70bCw47gSiPhNKZZ2FbVoEN5OU9XyCm5wMopzLg
   zJQPx9xVzU30YCBAM26D48JHl/0RfYWycVL++8cJ8w7mXgKMmQ5zVV6EI
   xBgZUBnD5y4UAbLkyHpWzNuLKrBetOvZe0pc0OdoKcv9QaCEyC5LzjfNl
   Z6wsRCATVTrwaNN2V92pyT8vJAnLnbs45U3GA1kAvpvKv640eRMxiJOHK
   OTSexTc1E1SO9gK3UsupvFj1N8OSTS6Jj8/kCEd9ukGVhFMK1twJnnZoU
   m7D/u1WQRMlBVBdVq/Kkq7fU6luiKr/0mVaolFbeyFq3YWrtnrMyBttA7
   Q==;
X-CSE-ConnectionGUID: 9JL3p7aEQMGrVHsprvKPsA==
X-CSE-MsgGUID: 1/ya7O78QEOHxQF2fyY3oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="569424"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="569424"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 14:47:08 -0700
X-CSE-ConnectionGUID: V08sWT8oSPu4uQlCmy5NGQ==
X-CSE-MsgGUID: 4x9ZHSSfRqmHgybGqhxDcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1629831"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 14:47:08 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org,
	intel-xe@lists.freedesktop.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	matthew.brost@intel.com,
	rodrigo.vivi@intel.com,
	thomas.hellstrom@linux.intel.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	david.e.box@linux.intel.com,
	anoop.c.vijay@intel.com,
	badal.nilawar@intel.com,
	matthew.d.roper@intel.com,
	james.ausmus@intel.com,
	karthik.poosa@intel.com
Subject: [PATCH v12 04/21] platform/x86/intel/pmt: Add register access callbacks
Date: Tue, 13 Oct 2026 14:46:57 -0700
Message-ID: <20261013214655.3502964-27-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013214655.3502964-23-michael.j.ruhl@intel.com>
References: <20261013214655.3502964-23-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some HW does not have direct MMIO access to PMT control and data
features.

Augment the current callback infrastructure (data access) to allow
a registered driver to customize read/write access to the control
paths for PMT usage.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/crashlog.c | 46 +++++++++++++++++++++--
 include/linux/intel_vsec.h                | 14 ++++++-
 2 files changed, 56 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index 200373cbb020..d7018b495217 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -11,10 +11,12 @@
 #include <linux/auxiliary_bus.h>
 #include <linux/cleanup.h>
 #include <linux/intel_vsec.h>
+#include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/pci.h>
+#include <linux/printk.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
 #include <linux/overflow.h>
@@ -124,12 +126,36 @@ struct pmt_crashlog_priv {
  * I/O
  */
 
+static int pmt_crashlog_read_reg(struct intel_pmt_entry *entry, u32 *reg, u32 offset)
+{
+	int ret;
+
+	*reg = 0;
+
+	if (entry->cb && entry->cb->read_reg) {
+		ret = entry->cb->read_reg(entry->dev, entry->header.guid, reg, offset);
+		if (ret) {
+			dev_err_ratelimited(entry->dev, "failed to read reg: %d\n", ret);
+			return ret;
+		}
+	} else {
+		*reg = readl(entry->disc_table + offset);
+	}
+
+	return 0;
+}
+
 /* Read, modify, write the control register, setting or clearing @bit based on @set */
 static int pmt_crashlog_rmw(struct crashlog_entry *crashlog, u32 bit, bool set)
 {
 	const struct crashlog_control *control = &crashlog->info->control;
 	struct intel_pmt_entry *entry = &crashlog->entry;
-	u32 reg = readl(entry->disc_table + control->offset);
+	u32 reg;
+	int ret;
+
+	ret = pmt_crashlog_read_reg(entry, &reg, control->offset);
+	if (ret)
+		return ret;
 
 	reg &= ~control->trigger_mask;
 
@@ -138,7 +164,15 @@ static int pmt_crashlog_rmw(struct crashlog_entry *crashlog, u32 bit, bool set)
 	else
 		reg &= ~bit;
 
-	writel(reg, entry->disc_table + control->offset);
+	if (entry->cb && entry->cb->write_reg) {
+		ret = entry->cb->write_reg(entry->dev, entry->header.guid, reg, control->offset);
+		if (ret) {
+			dev_err_ratelimited(entry->dev, "failed to write reg: %d\n", ret);
+			return ret;
+		}
+	} else {
+		writel(reg, entry->disc_table + control->offset);
+	}
 
 	return 0;
 }
@@ -147,7 +181,13 @@ static int pmt_crashlog_rmw(struct crashlog_entry *crashlog, u32 bit, bool set)
 static int pmt_crashlog_rc(struct crashlog_entry *crashlog, u32 bit, bool *state)
 {
 	const struct crashlog_status *status = &crashlog->info->status;
-	u32 reg = readl(crashlog->entry.disc_table + status->offset);
+	struct intel_pmt_entry *entry = &crashlog->entry;
+	u32 reg;
+	int ret;
+
+	ret = pmt_crashlog_read_reg(entry, &reg, status->offset);
+	if (ret)
+		return ret;
 
 	*state = !!(reg & bit);
 
diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
index 843cda8f8644..917d9397a993 100644
--- a/include/linux/intel_vsec.h
+++ b/include/linux/intel_vsec.h
@@ -90,13 +90,25 @@ enum intel_vsec_quirks {
  * @read_telem: when specified, called by client driver to access PMT
  * data (instead of direct copy).
  * * dev:   device reference for the callback's use
- * * guid:  ID of data to acccss
+ * * guid:  ID of data to access
  * * data:  buffer for the data to be copied
  * * off:   offset into the requested buffer
  * * count: size of buffer
+ * @read_reg: when specified called by client driver to read PMT state
+ * * dev:      device reference for the callback's use
+ * * guid:     ID of data to access
+ * * reg_data: register data
+ * * offset:   offset of register to read
+ * @write_reg: when specified called by client driver to write PMT state
+ * * dev:      device reference for the callback's use
+ * * guid:     ID of data to access
+ * * reg_data: register data
+ * * offset:   offset of register to write
  */
 struct pmt_callbacks {
 	int (*read_telem)(struct device *dev, u32 guid, u64 *data, loff_t off, u32 count);
+	int (*read_reg)(struct device *dev, u32 guid, u32 *reg_data, u32 offset);
+	int (*write_reg)(struct device *dev, u32 guid, u32 reg_data, u32 offset);
 };
 
 struct vsec_feature_dependency {
-- 
2.43.0

