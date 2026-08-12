Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C72A379996
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Aug 2026 19:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786563478; cv=none; b=bQ7FvwaSrZxPLSqHx3s39bUsKvlf7FrY2lzg4Flq1APWqgW9cXjDYoqjPvH5PIPzDT+NTK4o9O+Ng5zlsSF4mhP8NJTEoFVCDIZbssl25EtjHHLu2zOSwCPcFDcMl6BQmTn9ym/Zrfrl4YvC3M830ePFaRy4Nty1Zd0Et4u1a8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786563478; c=relaxed/simple;
	bh=XgFbU8+3ZPyo+sjJGGy/O/0cskbOKQVB9pcPDtYkBQA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PMo7PH5oWTe2zERyy4MIMyBPQG5qAZReEaBipUNyTvU5M1D778UyURiypv/3BZCURVwCKZxGd1bQn7tUUJrwkf9GkjD+ELtwg4GvUBlRp7a8vozcJzXZ9FUMnhErMVtTCAJTSOUIbAUGDew8MF/6GhAx9IN3itFRlpQYRdOjrys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xf2K4yjW; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xf2K4yjW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786563477; x=1818099477;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=XgFbU8+3ZPyo+sjJGGy/O/0cskbOKQVB9pcPDtYkBQA=;
  b=Xf2K4yjWpAeIknydlTCv7F0OW8PzOM63/nXrQ0b6Zq2WQlRBoKiyNKbJ
   pozGkW0J+iyLiadi5stNUbI2G2trvqzIDy1NudC3Q6Wb39yCMJwb178TS
   BT0egs16ciuA1YZxoyjgMHtb/73b8VwSwam7kEt9pHdYh5JDvKTrvhNx+
   40/CY8J+9aMOI1/7IMdFo3suX38N9OogrDaeMXDMHW6LqnSPkmzznU6Je
   RcRDJaDDdt3GVDSWhMzH88ns5J3QVpue1fV0kqLeURQj40dNQYyllQAUU
   WC1xo3G8fI2oWLvixzEstb3VIbfWnzmJkOPhiyHv+4vRtjRNt9RLqcT8W
   A==;
X-CSE-ConnectionGUID: k4WaImE5Sdu5J0YAl9pU6w==
X-CSE-MsgGUID: O7f0eWQ4Tz2pe9Cjsh9TDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="104515370"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="104515370"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 12:37:56 -0700
X-CSE-ConnectionGUID: 9eqRYOizTluCYNMt6qgUVA==
X-CSE-MsgGUID: Z/tMNqwnRKaiji6TFdEBcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="263779917"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 12:37:56 -0700
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
	james.ausmus@intel.com
Subject: [PATCH v2 02/10] platform/x86/intel/pmt: Add register access callbacks
Date: Wed, 12 Aug 2026 12:37:43 -0700
Message-ID: <20260812193742.2170188-14-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812193742.2170188-12-michael.j.ruhl@intel.com>
References: <20260812193742.2170188-12-michael.j.ruhl@intel.com>
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

