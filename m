Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BEA599A34
	for <platform-driver-x86@vger.kernel.org>; Fri, 11 Sep 2026 20:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789157527; cv=none; b=DX9cKubh928jrVN4y42KVdAGphLBgP0GNOfJJLel3PmS50DrNOLf2dKfW7SJxOEFk7No7HhhCN1W6vj3Qfs000qFC7nR+1P2wMEl//xefT51NGWDKfV6wDJDcY6wg9DI6p2q3kk33ftDas/z30DDyNXQioZCsKuICEHitOtuUko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789157527; c=relaxed/simple;
	bh=c13m+bMyzAXIiX7EPlEQon2O3s1IvHEEc2Fd25DUkh8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z5YT98Po56Z46N0Uv6AB/X7ie7QH7hUlsoQrQEsw3wc4n+E8T+gu6N8FNPRZLomgCcLniyVubHKOeidBOQV6/9kgEFq8Bb/gDoovIZuF5yr0eOTyLURZVGM607bSNIqvCMXGajZa39qytx5OrDhkBBoJcEcKLz4pqp54Fg+pjWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V4zUq/pf; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V4zUq/pf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789157523; x=1820693523;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=c13m+bMyzAXIiX7EPlEQon2O3s1IvHEEc2Fd25DUkh8=;
  b=V4zUq/pfIG9jLypaOt2FhMT7aS/CNi5xQ75tby7XvlyhPv4LW2YbTiMa
   6NrWGgqf3GMoAtJd4CXnKIEbiDjMeN36iq4/MJJ9ZBEUcWs4sXtBZedBh
   kzZKqt2hbiEPo16EvZ/GyGmPJAUmJLQWQUlkH6j7p8Qe3/xKcQv2JUWKt
   9k15eNrNaB9BRw71gb7iCQ/iKobwQ/wldlJYxnMIZOyzyNa/JKC8c+dTj
   D0zVL9xzQT9mC6/1AUfXOGt53flnCVvaOnDoO05TZVuEV8IzgbwhXmtSa
   8vLMukMGyzpsG779bX0DA6S7b6Xi2TOV9mjJEDRlwrXqcL/gNw7L/ai7f
   w==;
X-CSE-ConnectionGUID: Ty2jBJUsRHqJ3NCeDVBRKQ==
X-CSE-MsgGUID: G9tmYOaGQsaHcYaE4kHzOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="115162371"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="115162371"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 13:11:59 -0700
X-CSE-ConnectionGUID: VZOg1YtTSkOy1AAfalE2hA==
X-CSE-MsgGUID: MjRZ2JB/SQaZTLL74qprZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="277272078"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 13:11:59 -0700
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
Subject: [PATCH v8 04/20] platform/x86/intel/pmt: Add register access callbacks
Date: Fri, 11 Sep 2026 13:11:52 -0700
Message-ID: <20260911201148.1610547-26-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911201148.1610547-22-michael.j.ruhl@intel.com>
References: <20260911201148.1610547-22-michael.j.ruhl@intel.com>
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
index b6540f3a9a17..912b61c334a6 100644
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
+			pr_err_ratelimited("failed to read reg: %d\n", ret);
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
+			pr_err_ratelimited("failed to write reg: %d\n", ret);
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

