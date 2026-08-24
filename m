Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF8B45D1AB
	for <platform-driver-x86@vger.kernel.org>; Mon, 24 Aug 2026 16:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787588612; cv=none; b=R3iSzWNHSGNKpZlgwuDQJHO9FE0MTLb9YMdf3wrbrl9MrJ14/1oxaayJHjvCnJoADueB2TDpnbcR8DyRZoxX9KWhlrGTJ5xwpL3PBV/KN/DWDYii/sFb18tBJytD25cJTXComHI3Rg9PLPlUtNxrFYlBVYfOB3BPvEujckH0WxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787588612; c=relaxed/simple;
	bh=XgFbU8+3ZPyo+sjJGGy/O/0cskbOKQVB9pcPDtYkBQA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RP+4Vpy7LJnVx3mQsvUuUHid2DEa8Qff9PxGvj3PxHB4WhJCWwl61QqfV/yxfPb0CODi8/mI4LzihOTJiCVHjJ21Uhpa/faW+2QrycFP9zZR3S1jQ5uxYZDVKJhfWAtVsDGUUZoc/jY4wj9GTYAQ7YQ0qNVbX/mFiw3v6sap328=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DJdPiV3N; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DJdPiV3N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787588610; x=1819124610;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=XgFbU8+3ZPyo+sjJGGy/O/0cskbOKQVB9pcPDtYkBQA=;
  b=DJdPiV3Nu7Vx6JMCTrw5YDtaAtXtb992Oa3Jqim1Rsac2n4JwTw6Oqfg
   YgESznJ720py/hKQ0ZYG55T5zaZlMdiTZZ0tv5Hqo3DHwyGoPsbXX3Zxf
   qdWDNAToc2t7UWtZGsbVKE0L/rpVJWe691tgnK6li2G82yM6GuPfIVMx6
   t0aFgBnctc4fclx/QtoK8DlW78vcPeUt1hdG+twh04Whez+K87lJ3tXGL
   Nt3RcKm73oqZNznnf7sBXIp5r678Jlxa1JzOVe2B2pyMNg8Ef/gi0Zhor
   SZxn4chHStua3dnOPj7hb9sCGTk+HZ8J8LWVOOb1Qp2EkEI7OlI3MRF6u
   g==;
X-CSE-ConnectionGUID: 1WTxQTMBSrW/EUlZSDIBQA==
X-CSE-MsgGUID: GLc5JefSQ5eeDfP43xuLVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="91858060"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="91858060"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 09:23:29 -0700
X-CSE-ConnectionGUID: 5eI1V1IPT42cIJuJN3K1Zw==
X-CSE-MsgGUID: k/JLbmOsRt2cdQHOW13O0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="267088128"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 09:23:30 -0700
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
Subject: [PATCH v3 02/10] platform/x86/intel/pmt: Add register access callbacks
Date: Mon, 24 Aug 2026 09:23:18 -0700
Message-ID: <20260824162317.2450380-14-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824162317.2450380-12-michael.j.ruhl@intel.com>
References: <20260824162317.2450380-12-michael.j.ruhl@intel.com>
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
 include/linux/intel_vsec.h                | 14 +++++++-
 2 files changed, 49 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index f936daf99e4d..5923ad7abbd9 100644
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
+	if (entry->cb && entry->cb->read_reg) {
+		err = entry->cb->read_reg(entry->dev, guid, &reg, control->offset);
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
+	if (entry->cb && entry->cb->write_reg) {
+		err = entry->cb->write_reg(entry->dev, guid, reg, control->offset);
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
+	if (entry->cb && entry->cb->read_reg) {
+		err = entry->cb->read_reg(entry->dev, guid, &reg, status->offset);
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

