Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510292E2663
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Jun 2025 20:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751057037; cv=none; b=BC6i/vwerAnYAA3Kj7KXFTY8yCa+7hGpxu94QFv52vaHche0yJvSFTxKK7zv62KfehIpud6vv9QsLln4SSblX0Oren8/eRuBpl6CSbZMIoet5vAOx4yDIPhC9roExpdAIK15avqSXZ/+sxVGyiRvvYeIjVY0ObD2T1hyEhpbkI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751057037; c=relaxed/simple;
	bh=7XfL8orB1JIjtKAJoX5zAE2kYqWynqvT+GXNC63OK60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LsF0xbSfbVooA1EWFbvo/b3djrHqA07j+18xIHt4qjge30ilzvHpNFReP2esN+s7ZLE8GSYXyM+9dtONIxnWJmYeNZgeG3P8lJSos04lIQGLSmKwvSfz3RkxthlkFrBf4CDP4zR5BmXctZMyqOdU4ozC71N5TJikFtpLUcciECw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qqw8+6yI; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qqw8+6yI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751057036; x=1782593036;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7XfL8orB1JIjtKAJoX5zAE2kYqWynqvT+GXNC63OK60=;
  b=Qqw8+6yIIm6p14NvyWWIfI+dGuONBD2/CgO1UxZEoF9fbw6IrFgyHPoT
   kTrrXICYVJjm1wjkXAu9CnMFnK/LCSOmkVMSZU/audrPsWJh207U6XpL/
   b//wlSXfgYUNZD3I1H3i20amvPDS+AzIEOouMiG39+4lyCjFImk+PKpAL
   tQwmQ0KSBmHO2tH/gCM8d8wdMx64ojSOt4tCE/eyPQyRQRcmiOWAtRXft
   gTBHR7i7NNIhuc+7FzXwe64xtRGvi2XTXbNSLBD6DeTZ9RuMGGg7a/lWt
   k0wJa5yGO8NAzOo6CXvNEr9dgMCl5qU3PKkc/N7Hq5XA+S0Vqy+ljOG83
   Q==;
X-CSE-ConnectionGUID: tEZI2H7LQduR6AZXPsUS8A==
X-CSE-MsgGUID: iI4pnrUbRHeRS6sMGOZvUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="41003225"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="41003225"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 13:43:56 -0700
X-CSE-ConnectionGUID: wxguYj8kShmpD2tU9PZ+Ig==
X-CSE-MsgGUID: ssutwG46Q9mGfwHLN5jvLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="156939070"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.220.252])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 13:43:55 -0700
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
Subject: [PATCH v5 10/12] platform/x86/intel/pmt: refactor base parameter
Date: Fri, 27 Jun 2025 16:43:19 -0400
Message-ID: <20250627204321.521628-11-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627204321.521628-1-michael.j.ruhl@intel.com>
References: <20250627204321.521628-1-michael.j.ruhl@intel.com>
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
index adaca7ce1ba5..7975abb3c21b 100644
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

