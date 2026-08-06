Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E90B2949E0
	for <platform-driver-x86@vger.kernel.org>; Thu,  6 Aug 2026 13:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786024718; cv=none; b=s6U5u336N/Ra2KQGnhimux1t9U7jLc/nKCz8Tj3790c8X2sxJcO4hrF2+vCmq/GtMVTGML6/yarfq2FaABu94hZm10Me0fIYA0uh+ZW4Z/j/mKkzVG6NpTFoBgiQznFG+JiCaCx4sY1lXXi52sHhJDw4YYMxz1o9l7OexCaHtkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786024718; c=relaxed/simple;
	bh=/DNrqYihL9uslF5Ki/DFLsOqE52ARtW4/jbMD5aotOk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oKaHi2LP/tpxNwPqKkebcc2LmNppF8Z5SdiqrEfOENBK2wnx47EfVg5Z3ddMB35yoCHYOaFV6uGkjSS0QThU+ExXRtHvcCYjTVn77D4yebwq6d6bunYRVKhxrAtswldUbz4A+kS+8hCGtXQ5ESStuqJIDHs3IPk/Sw9wTxk7fvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MRTEmv5A; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MRTEmv5A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786024716; x=1817560716;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=/DNrqYihL9uslF5Ki/DFLsOqE52ARtW4/jbMD5aotOk=;
  b=MRTEmv5AZLK9+tiTl3LbCV2ejnNy0CQZE09+yhQfskEKaPqIIOCt14fm
   M8remgK62qYAP1p0HkDXyYZnuzFoIKTcmStdcCk6yOHUYXAt/HwUuco54
   EefBikfE4Mus3RS3q61a+Al39a+AtgIJsugiQquWGgTGLnc9PJD5xJEht
   Jz48QRoq4nGPsh8CuNacGuOpcBFJ8VVFRCfFLnDZwtDsPLbg5MMSdODsl
   AGf9aCv6Y/XM3IBjHyN3j/kIXQd0OoCYz9XRZuoq5DkeyBMCMq3ilLQYw
   KAmrTjfI6Vzuwa8A8N6suN3sB4eKmqm/47X+0K7k+my8g/0S5ggXGlhzZ
   A==;
X-CSE-ConnectionGUID: NLlNL1HiT9+cEHZQxWAQZw==
X-CSE-MsgGUID: Vx0DjfidTJa7ZOjSjp1GPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="89141316"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="89141316"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 06:58:35 -0700
X-CSE-ConnectionGUID: 4bmq4bRaTF6ZaKL6Qpxgcg==
X-CSE-MsgGUID: PI57R5nmQfCfnL0KXev7Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="265594911"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 06:58:34 -0700
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
Subject: [PATCH 2/7] platform/x86/intel/pmt: Add register access callbacks
Date: Thu,  6 Aug 2026 06:58:22 -0700
Message-ID: <20260806135820.1422040-11-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806135820.1422040-9-michael.j.ruhl@intel.com>
References: <20260806135820.1422040-9-michael.j.ruhl@intel.com>
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
 include/linux/intel_vsec.h                | 12 +++++++
 2 files changed, 48 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index f936daf99e4d..033c736e1bc8 100644
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
+	if (entry->cb->write_reg) {
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
+	if (entry->cb->read_reg) {
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
index 843cda8f8644..3ef218cd610f 100644
--- a/include/linux/intel_vsec.h
+++ b/include/linux/intel_vsec.h
@@ -94,9 +94,21 @@ enum intel_vsec_quirks {
  * * data:  buffer for the data to be copied
  * * off:   offset into the requested buffer
  * * count: size of buffer
+ * @read_reg: when specified called by client driver to read PMT state
+ * * dev:      device reference for the callback's use
+ * * guid:     ID of data to acccss
+ * * reg_data: register data
+ * * off:      offset of register to read
+ * @write_reg: when specified called by client driver to write PMT state
+ * * dev:      device reference for the callback's use
+ * * guid:     ID of data to acccss
+ * * reg_data: register data
+ * * off:      offset of register to write
  */
 struct pmt_callbacks {
 	int (*read_telem)(struct device *dev, u32 guid, u64 *data, loff_t off, u32 count);
+	int (*read_reg)(struct device *dev, u32 guid, u32 *reg_data, u32 offset);
+	int (*write_reg)(struct device *dev, u32 guid, u32 reg_data, u32 offset);
 };
 
 struct vsec_feature_dependency {
-- 
2.43.0

