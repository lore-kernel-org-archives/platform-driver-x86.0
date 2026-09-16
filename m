Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6139C4C9E17
	for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2026 20:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789589545; cv=none; b=Q7IKePMQ203sAD7N0+3QwSHXpzXCMVhPN6j+iXVym49tzV6mxtaDoEV+Lrm3Pn7R6PR6AsA7FEkjOYfw3HUOu2y05NugB1AiTjCZ1MuN5kpFUrrXFjUCbE06IjQRPS5Lz629ZoGmMgwT1woMTP8ysZlAAnDZ9n+N5SJ78N/3B8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789589545; c=relaxed/simple;
	bh=BkEZxXcrz+5ouVf6G50PzXn1yBM91NyNjIYcp4vh60Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bBZ8uZM3yIUVceWi6+hWs3lFA/B82DW/uAgbnQ3AG+kdWd/46t68f3UvApRTO8BI5Gb5/QpuLuUvGOt0lYRmxvF5MFp+/8Ca64jYoPvmeluse0stYL3qnTryFFfv2Q29HiYoZ0TQ/0D+LjGw25aGORgbEV9pCVzWeI2KuelDxLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DO3x99c7; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DO3x99c7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789589539; x=1821125539;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=BkEZxXcrz+5ouVf6G50PzXn1yBM91NyNjIYcp4vh60Y=;
  b=DO3x99c7CLAEwgGZS8rmXWTziNlCzQY6MEJ3skvFpyfn1O9vBhQmX6gM
   4198Iei1beYXEn/syHUmg0V7glW67LXP47hxul374bEo4j66z83KAgINl
   y3Ut1OfRe0p/dk47itBJGnbXhCS5M6lgdtYHeqkPnJY4zv4mM7VIYq5uQ
   ifL80e+xehH2OP2rfFfNylr9dX22mXB8w5z49inXmwmsxd5Y1ePBRoLso
   fROgpzG+FIRNXJ4jgvGYTHvxvDSPLO4J4CUStZpAyNfUbHGQlBBAQLVdZ
   0DSYLogYmNGaIRrO5R8ok8/mqQf/318Mk0MLt9PfBKFOBDmf5kIJ+sBoz
   g==;
X-CSE-ConnectionGUID: cPFh2NPwRVG0sI2XHW3myQ==
X-CSE-MsgGUID: Tw/YvLcbSk2qDMACaTGhBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100296148"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100296148"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 13:11:58 -0700
X-CSE-ConnectionGUID: TOTgSWHnROWjO/eM0lP0Bw==
X-CSE-MsgGUID: UkHkHHKRRjKJil6mfZRGnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="277573997"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 13:11:59 -0700
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
Subject: [PATCH v9 04/20] platform/x86/intel/pmt: Add register access callbacks
Date: Wed, 16 Sep 2026 13:11:42 -0700
Message-ID: <20260916201139.2374531-26-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916201139.2374531-22-michael.j.ruhl@intel.com>
References: <20260916201139.2374531-22-michael.j.ruhl@intel.com>
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
index b6540f3a9a17..a69ee397e529 100644
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

