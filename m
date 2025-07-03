Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260E52BD5BF
	for <platform-driver-x86@vger.kernel.org>; Thu,  3 Jul 2025 21:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751577163; cv=none; b=AoxU15Zrl3dySU43aDKkp59d97yev54VE7LPztV6vUQ/zdAkTH9x8H+T+0+cRow3i37RABU8+FCCfcLMLrSgLFKCbnvL+jEPgbS8ftNuqk4M3LSM3rG2l+73iRHVW+3K5ik/WDvQmGWuhhcPHKYdcUvSwJ0PN935eitCjydnKX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751577163; c=relaxed/simple;
	bh=8C12yzxrXryH3eOJFE6TnHAYmKJ/yPdYQvNtRp0/HTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M0/s1DRezKrjW+9Ck0IBqiN6Ap43sGNF8EDPdYkEOKIJW9mZUCCsVliNzrlnVNImkJfVrTbw854BpfCrSlsOvncZvd2LQJxqaTYifKt7gRgL6RWSc2eFYKCYQRukXicFDL9s6sUwH/L7nBNygiW8Vi38UDtaOIaarh/wVF14zlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QDE/HgI9; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QDE/HgI9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751577162; x=1783113162;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8C12yzxrXryH3eOJFE6TnHAYmKJ/yPdYQvNtRp0/HTA=;
  b=QDE/HgI9lAYpRCTGqLzAmEb1xgXHqWObxbyN9L99NTbKs/DuZlcHvfXt
   1rkPzbp0ofwJ1OkpehgHPMVbJS2eMNyhjvHHRkuKYd2pKEHYEXlceFJ/L
   9Gc4yQL4QShSeX1gQAIqFGxv8N1B30DwkjfdXLav7uBuhI8YVbQacl2nT
   y3FZaKogsR/f7L/SF6mne261G54DZqv9eHnXFCPQ+q9iKp8s4bvgyYAZU
   eu/NkBJLNyiTf0s0P8iN0sb0K9HWXPXguln/CvAgQhWMVhCqwjqdVmyvs
   s/qGqWNWYBcfs1Vnu1jcl46wqDcS+PznNJesEuVEAofG5U07ykYbBOgZd
   Q==;
X-CSE-ConnectionGUID: +0Rhf7OqRsuj2YpGqgwGdw==
X-CSE-MsgGUID: o9wsjutQQeKG0PptWPunfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="79353066"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="79353066"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 14:12:42 -0700
X-CSE-ConnectionGUID: YY4P/LHUQdS6SQywbsiS3A==
X-CSE-MsgGUID: uSmIGzM7RKWcNaxBcLHmfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="154240151"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.223.97])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 14:12:39 -0700
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
Subject: [PATCH v6 11/12] platform/x86/intel/pmt: use a version struct
Date: Thu,  3 Jul 2025 17:11:49 -0400
Message-ID: <20250703211150.135320-12-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703211150.135320-1-michael.j.ruhl@intel.com>
References: <20250703211150.135320-1-michael.j.ruhl@intel.com>
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
 drivers/platform/x86/intel/pmt/crashlog.c | 92 ++++++++++++++++-------
 1 file changed, 66 insertions(+), 26 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index 8cca520c5a1c..edc41144909c 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -24,21 +24,6 @@
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
@@ -50,10 +35,63 @@
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
@@ -70,24 +108,25 @@ struct pmt_crashlog_priv {
 /* read/modify/write */
 static void pmt_crashlog_rmw(struct crashlog_entry *crashlog, u32 bit, bool set)
 {
+	const struct crashlog_control *control = &crashlog->info->control;
 	struct intel_pmt_entry *entry = &crashlog->entry;
-	u32 reg = readl(entry->disc_table + CONTROL_OFFSET);
+	u32 reg = readl(entry->disc_table + control->offset);
 
-	reg &= ~CRASHLOG_FLAG_TRIGGER_MASK;
+	reg &= ~control->trigger_mask;
 
 	if (set)
 		reg |= bit;
 	else
 		reg &= ~bit;
 
-	writel(reg, entry->disc_table + CONTROL_OFFSET);
+	writel(reg, entry->disc_table + control->offset);
 }
 
 /* read/check */
 static bool pmt_crashlog_rc(struct crashlog_entry *crashlog, u32 bit)
 {
-	struct intel_pmt_entry *entry = &crashlog->entry;
-	u32 reg = readl(entry->disc_table + CONTROL_OFFSET);
+	const struct crashlog_status *status = &crashlog->info->status;
+	u32 reg = readl(crashlog->entry.disc_table + status->offset);
 
 	return !!(reg & bit);
 }
@@ -95,13 +134,13 @@ static bool pmt_crashlog_rc(struct crashlog_entry *crashlog, u32 bit)
 static bool pmt_crashlog_complete(struct crashlog_entry *crashlog)
 {
 	/* return current value of the crashlog complete flag */
-	return pmt_crashlog_rc(crashlog, CRASHLOG_FLAG_TRIGGER_COMPLETE);
+	return pmt_crashlog_rc(crashlog, crashlog->info->status.complete);
 }
 
 static bool pmt_crashlog_disabled(struct crashlog_entry *crashlog)
 {
 	/* return current value of the crashlog disabled flag */
-	return pmt_crashlog_rc(crashlog, CRASHLOG_FLAG_DISABLE);
+	return pmt_crashlog_rc(crashlog, crashlog->info->status.disabled);
 }
 
 static bool pmt_crashlog_supported(struct intel_pmt_entry *entry)
@@ -121,17 +160,17 @@ static bool pmt_crashlog_supported(struct intel_pmt_entry *entry)
 
 static void pmt_crashlog_set_disable(struct crashlog_entry *crashlog, bool disable)
 {
-	pmt_crashlog_rmw(crashlog, CRASHLOG_FLAG_DISABLE, disable);
+	pmt_crashlog_rmw(crashlog, crashlog->info->control.disable, disable);
 }
 
 static void pmt_crashlog_set_clear(struct crashlog_entry *crashlog)
 {
-	pmt_crashlog_rmw(crashlog, CRASHLOG_FLAG_TRIGGER_CLEAR, CRASHLOG_SET_BIT);
+	pmt_crashlog_rmw(crashlog, crashlog->info->control.clear, CRASHLOG_SET_BIT);
 }
 
 static void pmt_crashlog_set_execute(struct crashlog_entry *crashlog)
 {
-	pmt_crashlog_rmw(crashlog, CRASHLOG_FLAG_TRIGGER_EXECUTE, CRASHLOG_SET_BIT);
+	pmt_crashlog_rmw(crashlog, crashlog->info->control.manual, CRASHLOG_SET_BIT);
 }
 
 /*
@@ -235,9 +274,10 @@ static int pmt_crashlog_header_decode(struct intel_pmt_entry *entry,
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

