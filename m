Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A145B38DF9
	for <platform-driver-x86@vger.kernel.org>; Fri, 30 Jan 2026 13:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769780217; cv=none; b=SDKH7Sab3d0/P9AHeA7EHzxnTuLpcIEfcJjGstSi/7NUb3A0RzR1ZHILUdET8IyjYNRAWVpuD2iboh7WvPkdw2l5t67Us4SUWmOO/lgTeRn6rplTRbPgrrgdgQHos2Y7QW+f/mvEDPTX4C5zjnrDumaym3nojz2q1A0QLgbgGUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769780217; c=relaxed/simple;
	bh=AR32O/h6M3UdIfMQuyB948U5NYKFOUSzOA5BtqcCJrI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mEJOtCaoUxWjcGRRLBPn/L7iMhh0dj2TuXWvVwk5G28s0j6jkAqoXfsqcOT+OXuaxuIFT896Eistq/OE+/w5Xfjc71nL1wYG0Mm1VmRZM3BXHCVFYytACPGVr+FR87NBTI4lkRy5yktYhIbeP367QWSfeIkP8ZgRrqiROZlNSKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m5Ool+UT; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m5Ool+UT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769780216; x=1801316216;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AR32O/h6M3UdIfMQuyB948U5NYKFOUSzOA5BtqcCJrI=;
  b=m5Ool+UT4noTVe5K0unD9V8KZX3lI19DX53YSyea7OWq1tqjxVu2/DbD
   RhYgjhNV30gID5vPhDQaxDzUpW4f8Ya5xEsvCFgZUTdSalbFQY9qoZSma
   s541nAwZBP1yFedNXyulZ0eILCMH57nIcYfMxP4xiuzf3TvGK8ldMlDGx
   jTFBPkxTzeyv38MHbYsfNrB1pU8h5h9MR9cPPzogVMV/TiSExVR0EpUKR
   rxtDmJOcF0N7iCqxuZmQ0pJ4T91NQEG1mz1l7q2mRuvrQyCbP1Wk5rjp2
   xETUdJ66RONG1nlgFNsbjBV29Oh1n6Couvpc/nAHVaLOmt38lGIojZide
   g==;
X-CSE-ConnectionGUID: dbp1uYxtQt267DTw06t4NQ==
X-CSE-MsgGUID: GpkPUAW3QEm4zUg6rdHgoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="71194382"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="71194382"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 05:36:56 -0800
X-CSE-ConnectionGUID: ekoZIEvHRd+NPjQ/ZxwpDQ==
X-CSE-MsgGUID: gvztTrxfTjGmOluZE7lDTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="207983233"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.220.170])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 05:36:54 -0800
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
	david.e.box@linux.intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH v2 1/5] pmt: Add register access callbacks
Date: Fri, 30 Jan 2026 08:36:41 -0500
Message-ID: <20260130133639.765378-8-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260130133639.765378-7-michael.j.ruhl@intel.com>
References: <20260130133639.765378-7-michael.j.ruhl@intel.com>
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
 drivers/platform/x86/intel/pmt/crashlog.c | 39 +++++++++++++++++++++--
 include/linux/intel_vsec.h                | 26 +++++++++++----
 2 files changed, 55 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index b0393c9c5b4b..e4778068b068 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -129,7 +129,19 @@ static void pmt_crashlog_rmw(struct crashlog_entry *crashlog, u32 bit, bool set)
 {
 	const struct crashlog_control *control = &crashlog->info->control;
 	struct intel_pmt_entry *entry = &crashlog->entry;
-	u32 reg = readl(entry->disc_table + control->offset);
+	u32 guid = entry->header.guid;
+	u32 reg;
+	int err;
+
+	if (entry->cb->read_reg) {
+		err = entry->cb->read_reg(entry->pcidev, guid, &reg, control->offset);
+		if (err) {
+			pr_err("failed to read reg: %d\n", err);
+			return;
+		}
+	} else {
+		reg = readl(entry->disc_table + control->offset);
+	}
 
 	reg &= ~control->trigger_mask;
 
@@ -138,14 +150,35 @@ static void pmt_crashlog_rmw(struct crashlog_entry *crashlog, u32 bit, bool set)
 	else
 		reg &= ~bit;
 
-	writel(reg, entry->disc_table + control->offset);
+	if (entry->cb->write_reg) {
+		err = entry->cb->write_reg(entry->pcidev, guid, reg, control->offset);
+		if (err) {
+			pr_err("failed to write reg: %d\n", err);
+			return;
+		}
+	} else {
+		writel(reg, entry->disc_table + control->offset);
+	}
 }
 
 /* Read the status register and see if the specified @bit is set */
 static bool pmt_crashlog_rc(struct crashlog_entry *crashlog, u32 bit)
 {
 	const struct crashlog_status *status = &crashlog->info->status;
-	u32 reg = readl(crashlog->entry.disc_table + status->offset);
+	struct intel_pmt_entry *entry = &crashlog->entry;
+	u32 guid = entry->header.guid;
+	u32 reg;
+	int err;
+
+	if (entry->cb->read_reg) {
+		err = entry->cb->read_reg(entry->pcidev, guid, &reg, status->offset);
+		if (err) {
+			pr_err("failed to read reg: %d\n", err);
+			return false;
+		}
+	} else {
+		reg = readl(crashlog->entry.disc_table + status->offset);
+	}
 
 	return !!(reg & bit);
 }
diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
index 1a0f357c2427..c9b7aa860d0b 100644
--- a/include/linux/intel_vsec.h
+++ b/include/linux/intel_vsec.h
@@ -80,16 +80,28 @@ enum intel_vsec_quirks {
 
 /**
  * struct pmt_callbacks - Callback infrastructure for PMT devices
- * @read_telem: when specified, called by client driver to access PMT
- * data (instead of direct copy).
- * * pdev:  PCI device reference for the callback's use
- * * guid:  ID of data to acccss
- * * data:  buffer for the data to be copied
- * * off:   offset into the requested buffer
- * * count: size of buffer
+ * @read_telem: when specified, called by client driver to access PMT data (instead
+ * of direct copy).
+ * @pdev:  PCI device reference for the callback's use
+ * @guid:  ID of data to access
+ * @data:  buffer for the data to be copied
+ * @off:   offset into the requested buffer
+ * @count: size of buffer
+ * @read_reg: when specified called by client driver to read PMT state
+ * @pdev: PCI device reference for the callback's use
+ * @guid: ID of data to access
+ * @data: buffer for the register data to be read
+ * @offset: offset of control register to access
+ * @write_reg: when specified called by client driver to write PMT state
+ * @pdev: PCI device reference for the callback's use
+ * @guid: ID of data to access
+ * @data: buffer data to be written to the register
+ * @offset: offset of control register to access
  */
 struct pmt_callbacks {
 	int (*read_telem)(struct pci_dev *pdev, u32 guid, u64 *data, loff_t off, u32 count);
+	int (*read_reg)(struct pci_dev *pdev, u32 guid, u32 *data, u32 offset);
+	int (*write_reg)(struct pci_dev *pdev, u32 guid, u32 data, u32 offset);
 };
 
 struct vsec_feature_dependency {
-- 
2.52.0

