Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714952BD5BF
	for <platform-driver-x86@vger.kernel.org>; Thu,  3 Jul 2025 21:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751577159; cv=none; b=rB1OopHE3wb/nQyza90fMtc+3C/vefV1NjlFBWsdA8/9tCL0uIXTQs6kPgOGoUp1GZn0EGaGwseqJ23C3g2OGIAfMu2xlvzfEggYKCQj7HKH84HNOyrq4XOlvc4Th8FADkE1GiQRDpctBKc31txl2nGwAraBzpggB1IO4DVtW58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751577159; c=relaxed/simple;
	bh=ttESRm0qSD+CWsGr9oe9suHhbxW38LYluvM+xXcf7ts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tFoEdvV8xROcY03/UOTxlOS8QSJ68i2MDBb0Ml5v61hEUF4cNtElENjKs0VZeb+CiZgYJw4sczd2LFcd9LPRcUBQRmcanWKda/5e3vJARbwzCHMjo7oDsfmqjFSgWMKbqvoYYFzZDh2pwSpsceNIP0pUtf09gMT62U8Rgqd3SkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RomVsctW; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RomVsctW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751577158; x=1783113158;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ttESRm0qSD+CWsGr9oe9suHhbxW38LYluvM+xXcf7ts=;
  b=RomVsctWbFsuc9LaGY2eSFlt56wtG0hu4umqyMjnzTPY7jG5fVy27Jnj
   sbFOoPs7t8vCYChZW5ob/xW0I9EKRhRwVZFYEljxlexuAavCqp23MJlXU
   MkHb1XK6qEzEt9Y2uG3pdTEMi+braQI+wb6v7ez1rUT0ZE7pJJViHt8PO
   f9kJimCFFFlYA8eizBVqcYq+h0U5MuD7CH5ePGW2my/Vn7NbFfGZdVIsZ
   heyviYFNFY5PJKd7J/zVet5WUSMeJpITKdRwy6IEDZDAq3dZcM07gO98D
   ghF9daFHNqK5FiW/UAS6y6bCwKFHxGmqc2GOfoGxUOom8Mb2MwKbySwfM
   g==;
X-CSE-ConnectionGUID: fn4CVCl2RYCnEbhvpZ/cQg==
X-CSE-MsgGUID: bpnX+QDcQJ2X0sKJ2jd7Vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="79353053"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="79353053"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 14:12:38 -0700
X-CSE-ConnectionGUID: XHlcldNzQMOhZvr858rtUw==
X-CSE-MsgGUID: RqwR35k1Tb6SHqyZ2sI2wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="154240121"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.223.97])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 14:12:36 -0700
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
Subject: [PATCH v6 10/12] platform/x86/intel/pmt: refactor base parameter
Date: Thu,  3 Jul 2025 17:11:48 -0400
Message-ID: <20250703211150.135320-11-michael.j.ruhl@intel.com>
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

For the crashlog driver, struct crashlog_entry is the parent of
struct intel_pmt_entry. To support multiple crashlog versions, most
accesses will be to the struct crashlog_entry.

- Refactor to use struct crashlog_entry in place of
  struct intel_pmt_entry
- Rename some usages (auto-variables) from entry to crashlog

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/crashlog.c | 59 ++++++++++++-----------
 1 file changed, 30 insertions(+), 29 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index 888946a8ba46..8cca520c5a1c 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -68,8 +68,9 @@ struct pmt_crashlog_priv {
 #define CRASHLOG_CLEAR_BIT	false
 
 /* read/modify/write */
-static void pmt_crashlog_rmw(struct intel_pmt_entry *entry, u32 bit, bool set)
+static void pmt_crashlog_rmw(struct crashlog_entry *crashlog, u32 bit, bool set)
 {
+	struct intel_pmt_entry *entry = &crashlog->entry;
 	u32 reg = readl(entry->disc_table + CONTROL_OFFSET);
 
 	reg &= ~CRASHLOG_FLAG_TRIGGER_MASK;
@@ -83,23 +84,24 @@ static void pmt_crashlog_rmw(struct intel_pmt_entry *entry, u32 bit, bool set)
 }
 
 /* read/check */
-static bool pmt_crashlog_rc(struct intel_pmt_entry *entry, u32 bit)
+static bool pmt_crashlog_rc(struct crashlog_entry *crashlog, u32 bit)
 {
+	struct intel_pmt_entry *entry = &crashlog->entry;
 	u32 reg = readl(entry->disc_table + CONTROL_OFFSET);
 
 	return !!(reg & bit);
 }
 
-static bool pmt_crashlog_complete(struct intel_pmt_entry *entry)
+static bool pmt_crashlog_complete(struct crashlog_entry *crashlog)
 {
 	/* return current value of the crashlog complete flag */
-	return pmt_crashlog_rc(entry, CRASHLOG_FLAG_TRIGGER_COMPLETE);
+	return pmt_crashlog_rc(crashlog, CRASHLOG_FLAG_TRIGGER_COMPLETE);
 }
 
-static bool pmt_crashlog_disabled(struct intel_pmt_entry *entry)
+static bool pmt_crashlog_disabled(struct crashlog_entry *crashlog)
 {
 	/* return current value of the crashlog disabled flag */
-	return pmt_crashlog_rc(entry, CRASHLOG_FLAG_DISABLE);
+	return pmt_crashlog_rc(crashlog, CRASHLOG_FLAG_DISABLE);
 }
 
 static bool pmt_crashlog_supported(struct intel_pmt_entry *entry)
@@ -117,20 +119,19 @@ static bool pmt_crashlog_supported(struct intel_pmt_entry *entry)
 	return crash_type == CRASH_TYPE_OOBMSM && version == 0;
 }
 
-static void pmt_crashlog_set_disable(struct intel_pmt_entry *entry,
-				     bool disable)
+static void pmt_crashlog_set_disable(struct crashlog_entry *crashlog, bool disable)
 {
-	pmt_crashlog_rmw(entry, CRASHLOG_FLAG_DISABLE, disable);
+	pmt_crashlog_rmw(crashlog, CRASHLOG_FLAG_DISABLE, disable);
 }
 
-static void pmt_crashlog_set_clear(struct intel_pmt_entry *entry)
+static void pmt_crashlog_set_clear(struct crashlog_entry *crashlog)
 {
-	pmt_crashlog_rmw(entry, CRASHLOG_FLAG_TRIGGER_CLEAR, CRASHLOG_SET_BIT);
+	pmt_crashlog_rmw(crashlog, CRASHLOG_FLAG_TRIGGER_CLEAR, CRASHLOG_SET_BIT);
 }
 
-static void pmt_crashlog_set_execute(struct intel_pmt_entry *entry)
+static void pmt_crashlog_set_execute(struct crashlog_entry *crashlog)
 {
-	pmt_crashlog_rmw(entry, CRASHLOG_FLAG_TRIGGER_EXECUTE, CRASHLOG_SET_BIT);
+	pmt_crashlog_rmw(crashlog, CRASHLOG_FLAG_TRIGGER_EXECUTE, CRASHLOG_SET_BIT);
 }
 
 /*
@@ -139,8 +140,8 @@ static void pmt_crashlog_set_execute(struct intel_pmt_entry *entry)
 static ssize_t
 enable_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
-	struct intel_pmt_entry *entry = dev_get_drvdata(dev);
-	bool enabled = !pmt_crashlog_disabled(entry);
+	struct crashlog_entry *crashlog = dev_get_drvdata(dev);
+	bool enabled = !pmt_crashlog_disabled(crashlog);
 
 	return sprintf(buf, "%d\n", enabled);
 }
@@ -149,19 +150,19 @@ static ssize_t
 enable_store(struct device *dev, struct device_attribute *attr,
 	     const char *buf, size_t count)
 {
-	struct crashlog_entry *entry;
+	struct crashlog_entry *crashlog;
 	bool enabled;
 	int result;
 
-	entry = dev_get_drvdata(dev);
+	crashlog = dev_get_drvdata(dev);
 
 	result = kstrtobool(buf, &enabled);
 	if (result)
 		return result;
 
-	guard(mutex)(&entry->control_mutex);
+	guard(mutex)(&crashlog->control_mutex);
 
-	pmt_crashlog_set_disable(&entry->entry, !enabled);
+	pmt_crashlog_set_disable(crashlog, !enabled);
 
 	return count;
 }
@@ -170,11 +171,11 @@ static DEVICE_ATTR_RW(enable);
 static ssize_t
 trigger_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
-	struct intel_pmt_entry *entry;
+	struct crashlog_entry *crashlog;
 	bool trigger;
 
-	entry = dev_get_drvdata(dev);
-	trigger = pmt_crashlog_complete(entry);
+	crashlog = dev_get_drvdata(dev);
+	trigger = pmt_crashlog_complete(crashlog);
 
 	return sprintf(buf, "%d\n", trigger);
 }
@@ -183,32 +184,32 @@ static ssize_t
 trigger_store(struct device *dev, struct device_attribute *attr,
 	      const char *buf, size_t count)
 {
-	struct crashlog_entry *entry;
+	struct crashlog_entry *crashlog;
 	bool trigger;
 	int result;
 
-	entry = dev_get_drvdata(dev);
+	crashlog = dev_get_drvdata(dev);
 
 	result = kstrtobool(buf, &trigger);
 	if (result)
 		return result;
 
-	guard(mutex)(&entry->control_mutex);
+	guard(mutex)(&crashlog->control_mutex);
 
 	/* if device is currently disabled, return busy */
-	if (pmt_crashlog_disabled(&entry->entry))
+	if (pmt_crashlog_disabled(crashlog))
 		return -EBUSY;
 
 	if (!trigger) {
-		pmt_crashlog_set_clear(&entry->entry);
+		pmt_crashlog_set_clear(crashlog);
 		return count;
 	}
 
 	/* we cannot trigger a new crash if one is still pending */
-	if (pmt_crashlog_complete(&entry->entry))
+	if (pmt_crashlog_complete(crashlog))
 		return -EEXIST;
 
-	pmt_crashlog_set_execute(&entry->entry);
+	pmt_crashlog_set_execute(crashlog);
 
 	return count;
 }
-- 
2.49.0

