Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DD12C0282
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 Jan 2026 18:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769538274; cv=none; b=iw+K+CO9+R5BxmE09Iph07zT81xVsTWgyuAIBVm+cLzXN40leG6X/drPfPgwXmpRL9PrwgdA+W+KPJF9U3CbOHXqgiztv5zu2aR39DSi18A93UT+3eNN+lqnaDezGfWQrgFPZeIxjBV/ZhZmOIJa9NDeltwEGZWlBNdb6nwPNGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769538274; c=relaxed/simple;
	bh=iDkzoyPgA3hPdntpxdbqoKyT3fRP+j6jfTdssbTW6jQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TicDltoyLIpi7qImf7osLYqwItdYXTtK2buRPRwwDYGAOSbbcgaLB2RdRCCEUdBxWvICHGrinaCQEGrHyNyxjXEWmGWUw/wDwFLpFqntJ3ceeQ1SldaeK8w2hRHZ5C1wNBc/JME4r0N2aQsre+nDFXi3y9ywYXs5mK5w5aw8grE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c+czz//r; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c+czz//r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769538273; x=1801074273;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iDkzoyPgA3hPdntpxdbqoKyT3fRP+j6jfTdssbTW6jQ=;
  b=c+czz//r6QrnazBrz53VSJK6MoOM7pEjmHSsVLmoFV588Kp92SH3RePt
   qdmudi7xcI/oVOxs0sPcjreb34f1ayCdnzVN2CORqjykHkI3R8U77LS9Z
   d+dIXnUWhZjvwXcT/oR9mYs1DWlDPuXx2QK5VjO2Xcnp8AOGJZ/k39KGN
   9uNwV8oVAEErrmFL6LpsLfOEe/aX7PWBw3APMXirWL0nJZGj0D1c8YC7b
   D+AxrNPGHWU+KwxPVB62JCS/nCpEDqLnJDhft8nW8vvqrwk/b8b8laELJ
   zEYh50DJ81W5ASaLe6Ezlcf1F4qOPMmRbpaHf0N3yideOkpHgc3NLIxRN
   w==;
X-CSE-ConnectionGUID: ytAyb/EeS3+fKX0Qow3Nlg==
X-CSE-MsgGUID: 7p4T2cxiTreYHfavHekBxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70644425"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="70644425"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 10:24:32 -0800
X-CSE-ConnectionGUID: 8ngIjrVFRGOkdmySLEmSvw==
X-CSE-MsgGUID: 9krPqdQzQPOd0NgCb16g7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="208491656"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.223.176])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 10:24:31 -0800
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
Subject: [PATCH 1/5] pmt: Add register access callbacks
Date: Tue, 27 Jan 2026 13:24:20 -0500
Message-ID: <20260127182418.640701-8-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127182418.640701-7-michael.j.ruhl@intel.com>
References: <20260127182418.640701-7-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some HW does not have the explicit access via MMIO.  Allow
for parent drivers to control access to the status/control
path.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/crashlog.c | 39 +++++++++++++++++++++--
 include/linux/intel_vsec.h                | 26 +++++++++++----
 2 files changed, 55 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index b0393c9c5b4b..978b35d56888 100644
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
+			pr_err("%s: failed to read reg: %d\n", __func__, err);
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
+			pr_err("%s: failed to write reg: %d\n", __func__, err);
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
+			pr_err("%s: failed to read reg: %d\n", __func__, err);
+			return false;
+		}
+	} else {
+		reg = readl(crashlog->entry.disc_table + status->offset);
+	}
 
 	return !!(reg & bit);
 }
diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
index 1a0f357c2427..5416f84aca40 100644
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
+ * ->read_telem() when specified, called by client driver to access PMT data (instead
+ * of direct copy).
+ * @pdev:  PCI device reference for the callback's use
+ * @guid:  ID of data to access
+ * @data:  buffer for the data to be copied
+ * @off:   offset into the requested buffer
+ * @count: size of buffer
+ * ->read_reg() when specified called by client driver to read PMT state
+ * @pdev: PCI device reference for the callback's use
+ * @guid: ID of data to access
+ * @data: buffer for the register data to be read
+ * @offset: offset of control register to access
+ * ->write_reg() when specified called by client driver to write PMT state
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

