Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A722D4C6503
	for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2026 20:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789589541; cv=none; b=nZAPW0ms1Gd33ghGKdwBkTluTaodIo3Pp98opBAw65c9RgSj+r6zX15aHqB0nBZerrqcQHtzZDF7GlaSrplZRhYyng3If/w9wnm3NT0dVQLBXTHIWFjd1MFLwo08RU+K6Ceqbr7rTMMe7r/LAFqkGi9B+r5JpdtaF5J6y+Z6Kp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789589541; c=relaxed/simple;
	bh=BJKVaAfoI905xAprHH6cb/8yW4bOhaQyU49B6BP/W1U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c5ZihUr0dofGe0K6h+Me/LQWTuvxF6uSq8osSi1OgkVi9MJkGFnwXOs0BXzqOaMON898HLiJ8aV7qdqR818VT7e7qtJV7/cOnXoiD+p5berj+gOKZJDxuIkQkTkQAql/jsRlLvCa6ECUAavnW82jG/Jhv5VlvOKxkyoC+2kBCz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S/HDyH5x; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S/HDyH5x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789589527; x=1821125527;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=BJKVaAfoI905xAprHH6cb/8yW4bOhaQyU49B6BP/W1U=;
  b=S/HDyH5xPyblBKIZM+rF0EAQvKWbmy+FPY6rJ3LR9jnUfvc4yAHI/e2U
   WMpo4tNgDG+WLGVtDjAlbgrHhSQdj76PYlYevvlJd5jfXHxnDnyzjTF2Q
   ovEG4Yvs99Slzg+nHMKm27SHPE6gMyHJgYkkVXX3ac/2EqJ/HIEA85gDk
   ATAFFkEXUn2I5aVCC+549pMioaiPV0EaMVaBr2FPtJH1A0SxfUn6sCXDK
   hiwAW/hXXchsfp4nfA4SIdT9xazD95u/oALFuMawfMQcgZjlGpgFYNuRC
   plADhc4tLF4Lb9HEIRKhS3KnxctHyWYSLhGSY9pGkz8ggX+dIzdnQtA1i
   g==;
X-CSE-ConnectionGUID: Q+BQc2vwSomhCHF120LoXw==
X-CSE-MsgGUID: DIjJm2lfTxG6ee+ZhrG1ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100296143"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100296143"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 13:11:58 -0700
X-CSE-ConnectionGUID: okyCBXL5Rze4XL+p4fqcdQ==
X-CSE-MsgGUID: V56GtRFvTOOrsxHWjJrZ4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="277573993"
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
Subject: [PATCH v9 03/20] platform/x86/intel/pmt: refactor rc with a return value
Date: Wed, 16 Sep 2026 13:11:41 -0700
Message-ID: <20260916201139.2374531-25-michael.j.ruhl@intel.com>
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

Upcoming changes will include possible failures from HW accesses.

Refactor pmt_crashlog_rw() with a return value.

Update all necessary usage to use the return code.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/crashlog.c | 101 ++++++++++++++++------
 1 file changed, 74 insertions(+), 27 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index 831cff743803..b6540f3a9a17 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -144,27 +144,29 @@ static int pmt_crashlog_rmw(struct crashlog_entry *crashlog, u32 bit, bool set)
 }
 
 /* Read the status register and see if the specified @bit is set */
-static bool pmt_crashlog_rc(struct crashlog_entry *crashlog, u32 bit)
+static int pmt_crashlog_rc(struct crashlog_entry *crashlog, u32 bit, bool *state)
 {
 	const struct crashlog_status *status = &crashlog->info->status;
 	u32 reg = readl(crashlog->entry.disc_table + status->offset);
 
-	return !!(reg & bit);
+	*state = !!(reg & bit);
+
+	return 0;
 }
 
-static bool pmt_crashlog_complete(struct crashlog_entry *crashlog)
+static int pmt_crashlog_complete(struct crashlog_entry *crashlog, bool *state)
 {
 	/* return current value of the crashlog complete flag */
-	return pmt_crashlog_rc(crashlog, crashlog->info->status.complete);
+	return pmt_crashlog_rc(crashlog, crashlog->info->status.complete, state);
 }
 
-static bool pmt_crashlog_disabled(struct crashlog_entry *crashlog)
+static int pmt_crashlog_disabled(struct crashlog_entry *crashlog, bool *state)
 {
 	/* return current value of the crashlog disabled flag */
-	return pmt_crashlog_rc(crashlog, crashlog->info->status.disabled);
+	return pmt_crashlog_rc(crashlog, crashlog->info->status.disabled, state);
 }
 
-static bool pmt_crashlog_supported(struct intel_pmt_entry *entry, u32 *crash_type, u32 *version)
+static int pmt_crashlog_supported(struct intel_pmt_entry *entry, u32 *crash_type, u32 *version)
 {
 	u32 discovery_header = readl(entry->disc_table + CONTROL_OFFSET);
 
@@ -199,14 +201,14 @@ static int pmt_crashlog_set_execute(struct crashlog_entry *crashlog)
 	return pmt_crashlog_rmw(crashlog, crashlog->info->control.manual, true);
 }
 
-static bool pmt_crashlog_cleared(struct crashlog_entry *crashlog)
+static int pmt_crashlog_cleared(struct crashlog_entry *crashlog, bool *state)
 {
-	return pmt_crashlog_rc(crashlog, crashlog->info->status.cleared);
+	return pmt_crashlog_rc(crashlog, crashlog->info->status.cleared, state);
 }
 
-static bool pmt_crashlog_consumed(struct crashlog_entry *crashlog)
+static int pmt_crashlog_consumed(struct crashlog_entry *crashlog, bool *state)
 {
-	return pmt_crashlog_rc(crashlog, crashlog->info->status.consumed);
+	return pmt_crashlog_rc(crashlog, crashlog->info->status.consumed, state);
 }
 
 static int pmt_crashlog_set_consumed(struct crashlog_entry *crashlog)
@@ -214,14 +216,14 @@ static int pmt_crashlog_set_consumed(struct crashlog_entry *crashlog)
 	return pmt_crashlog_rmw(crashlog, crashlog->info->control.consume, true);
 }
 
-static bool pmt_crashlog_error(struct crashlog_entry *crashlog)
+static int pmt_crashlog_error(struct crashlog_entry *crashlog, bool *state)
 {
-	return pmt_crashlog_rc(crashlog, crashlog->info->status.error);
+	return pmt_crashlog_rc(crashlog, crashlog->info->status.error, state);
 }
 
-static bool pmt_crashlog_rearm(struct crashlog_entry *crashlog)
+static int pmt_crashlog_rearm(struct crashlog_entry *crashlog, bool *state)
 {
-	return pmt_crashlog_rc(crashlog, crashlog->info->status.rearmed);
+	return pmt_crashlog_rc(crashlog, crashlog->info->status.rearmed, state);
 }
 
 static int pmt_crashlog_set_rearm(struct crashlog_entry *crashlog)
@@ -236,7 +238,12 @@ static ssize_t
 clear_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct crashlog_entry *crashlog = dev_get_drvdata(dev);
-	bool cleared = pmt_crashlog_cleared(crashlog);
+	bool cleared;
+	int ret;
+
+	ret = pmt_crashlog_cleared(crashlog, &cleared);
+	if (ret)
+		return ret;
 
 	return sysfs_emit(buf, "%d\n", cleared);
 }
@@ -271,7 +278,12 @@ static ssize_t
 consumed_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct crashlog_entry *crashlog = dev_get_drvdata(dev);
-	bool consumed = pmt_crashlog_consumed(crashlog);
+	bool consumed;
+	int ret;
+
+	ret = pmt_crashlog_consumed(crashlog, &consumed);
+	if (ret)
+		return ret;
 
 	return sysfs_emit(buf, "%d\n", consumed);
 }
@@ -281,7 +293,9 @@ consumed_store(struct device *dev, struct device_attribute *attr, const char *bu
 	       size_t count)
 {
 	struct crashlog_entry *crashlog;
+	bool complete;
 	bool consumed;
+	bool disabled;
 	int ret;
 
 	crashlog = dev_get_drvdata(dev);
@@ -296,10 +310,16 @@ consumed_store(struct device *dev, struct device_attribute *attr, const char *bu
 
 	guard(mutex)(&crashlog->control_mutex);
 
-	if (pmt_crashlog_disabled(crashlog))
+	ret = pmt_crashlog_disabled(crashlog, &disabled);
+	if (ret)
+		return ret;
+	if (disabled)
 		return -EBUSY;
 
-	if (!pmt_crashlog_complete(crashlog))
+	ret = pmt_crashlog_complete(crashlog, &complete);
+	if (ret)
+		return ret;
+	if (!complete)
 		return -EEXIST;
 
 	ret = pmt_crashlog_set_consumed(crashlog);
@@ -312,9 +332,14 @@ static ssize_t
 enable_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct crashlog_entry *crashlog = dev_get_drvdata(dev);
-	bool enabled = !pmt_crashlog_disabled(crashlog);
+	bool disabled;
+	int ret;
 
-	return sprintf(buf, "%d\n", enabled);
+	ret = pmt_crashlog_disabled(crashlog, &disabled);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%d\n", !disabled);
 }
 
 static ssize_t
@@ -343,7 +368,12 @@ static ssize_t
 error_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct crashlog_entry *crashlog = dev_get_drvdata(dev);
-	bool error = pmt_crashlog_error(crashlog);
+	bool error;
+	int ret;
+
+	ret = pmt_crashlog_error(crashlog, &error);
+	if (ret)
+		return ret;
 
 	return sysfs_emit(buf, "%d\n", error);
 }
@@ -353,7 +383,12 @@ static ssize_t
 rearm_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct crashlog_entry *crashlog = dev_get_drvdata(dev);
-	int rearmed = pmt_crashlog_rearm(crashlog);
+	bool rearmed;
+	int ret;
+
+	ret = pmt_crashlog_rearm(crashlog, &rearmed);
+	if (ret)
+		return ret;
 
 	return sysfs_emit(buf, "%d\n", rearmed);
 }
@@ -389,11 +424,15 @@ trigger_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct crashlog_entry *crashlog;
 	bool trigger;
+	int ret;
 
 	crashlog = dev_get_drvdata(dev);
-	trigger = pmt_crashlog_complete(crashlog);
 
-	return sprintf(buf, "%d\n", trigger);
+	ret = pmt_crashlog_complete(crashlog, &trigger);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%d\n", trigger);
 }
 
 static ssize_t
@@ -401,6 +440,8 @@ trigger_store(struct device *dev, struct device_attribute *attr,
 	      const char *buf, size_t count)
 {
 	struct crashlog_entry *crashlog;
+	bool complete;
+	bool disabled;
 	bool trigger;
 	int ret;
 
@@ -413,7 +454,10 @@ trigger_store(struct device *dev, struct device_attribute *attr,
 	guard(mutex)(&crashlog->control_mutex);
 
 	/* if device is currently disabled, return busy */
-	if (pmt_crashlog_disabled(crashlog))
+	ret = pmt_crashlog_disabled(crashlog, &disabled);
+	if (ret)
+		return ret;
+	if (disabled)
 		return -EBUSY;
 
 	if (!trigger) {
@@ -422,7 +466,10 @@ trigger_store(struct device *dev, struct device_attribute *attr,
 	}
 
 	/* we cannot trigger a new crash if one is still pending */
-	if (pmt_crashlog_complete(crashlog))
+	ret = pmt_crashlog_complete(crashlog, &complete);
+	if (ret)
+		return ret;
+	if (complete)
 		return -EEXIST;
 
 	ret = pmt_crashlog_set_execute(crashlog);
-- 
2.43.0

