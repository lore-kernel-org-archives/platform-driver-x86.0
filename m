Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33D44FC8C9
	for <platform-driver-x86@vger.kernel.org>; Fri,  4 Sep 2026 18:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788546308; cv=none; b=TYalsFS0UHz8HwHyefgkqi16Tu1SQHDEM7tLRcvhDTuiGETINgYK8TXzXrLR6VXzr8AUkZUCVr0uKBMHcOrZpYxLKqmo0pZjbv1lZcm+/QOZq132LpQCxdP74rKx4lXT5hY0srj4XeLE6VhF5lr9X4jhgHpdxWKelFcm5TgqhPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788546308; c=relaxed/simple;
	bh=Rp4g8oN3x0UwZTfBB9wSekg1drC0VcTt9wF4zwhGloM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YPuPwhsgPY8AEyI0OLOOswPFT7OF0PJGh50wju2w8MLBudXNx3y0eeqCut+7pXxojX10UBciWnROw+v8fVietlMnvSniRo21N29yAu9H4cNC+/WYrOoaR6x2kUcB/+x0wwRM6VsZIRzlCn+6CB92CzXvl9nXHJgnPm9MZnjDsN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eK4rYixw; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eK4rYixw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788546306; x=1820082306;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Rp4g8oN3x0UwZTfBB9wSekg1drC0VcTt9wF4zwhGloM=;
  b=eK4rYixwHj48wEm83qfL31TGjzDWs2YQxZmOJiYwJk8WYaSd5zccqvlS
   aLkshKKBGEjNMQNjWpMIjRoxnmRTXhh+Fe/4L4dbZ9szmxflejM8dzhxt
   tYM8yKNWe2byBbj98N4j5tUHynIlA0DlMgco7NEWk7k60K1fiMdJq0w0U
   k5y3bQLu+T/Bl1KtOwf3M0pCGwNg5CKvY4ZgJJXFl7R4IysZTErM5YGm2
   /h18BcXuXWOG5xVheYHHG5pKZvl0nzzfJfrPXvN7gGgRMlNSG5wWnPGeG
   hcF5dHnLESe8BB9fOYeaMghElR9okJ1nyLwoxt0zlnF5XagekSMVRKXR9
   Q==;
X-CSE-ConnectionGUID: Mi7Xl6E6QZmCCpEKrtVnzw==
X-CSE-MsgGUID: awmKNKkXQUKVH4r9vs83lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="88932184"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="88932184"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 11:25:04 -0700
X-CSE-ConnectionGUID: 6lbW1zBsRae32P/eZ7VT5Q==
X-CSE-MsgGUID: c1kx5ap1RwCKPqLUR4SZKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="294992459"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 11:25:04 -0700
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
Subject: [PATCH v6 02/18] platform/x86/intel/pmt: refactor rmw with a return value
Date: Fri,  4 Sep 2026 11:24:52 -0700
Message-ID: <20260904182451.1164868-22-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904182451.1164868-20-michael.j.ruhl@intel.com>
References: <20260904182451.1164868-20-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Upcoming changes will include possible failures from HW accesses.

Refactor pmt_crashlog_rwm() with a return value.

Update all necessary usage to use the return code.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/crashlog.c | 90 ++++++++++++-----------
 1 file changed, 46 insertions(+), 44 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index f936daf99e4d..831cff743803 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -125,7 +125,7 @@ struct pmt_crashlog_priv {
  */
 
 /* Read, modify, write the control register, setting or clearing @bit based on @set */
-static void pmt_crashlog_rmw(struct crashlog_entry *crashlog, u32 bit, bool set)
+static int pmt_crashlog_rmw(struct crashlog_entry *crashlog, u32 bit, bool set)
 {
 	const struct crashlog_control *control = &crashlog->info->control;
 	struct intel_pmt_entry *entry = &crashlog->entry;
@@ -139,6 +139,8 @@ static void pmt_crashlog_rmw(struct crashlog_entry *crashlog, u32 bit, bool set)
 		reg &= ~bit;
 
 	writel(reg, entry->disc_table + control->offset);
+
+	return 0;
 }
 
 /* Read the status register and see if the specified @bit is set */
@@ -181,20 +183,20 @@ static bool pmt_crashlog_supported(struct intel_pmt_entry *entry, u32 *crash_typ
 	return false;
 }
 
-static void pmt_crashlog_set_disable(struct crashlog_entry *crashlog,
-				     bool disable)
+static int pmt_crashlog_set_disable(struct crashlog_entry *crashlog,
+				    bool disable)
 {
-	pmt_crashlog_rmw(crashlog, crashlog->info->control.disable, disable);
+	return pmt_crashlog_rmw(crashlog, crashlog->info->control.disable, disable);
 }
 
-static void pmt_crashlog_set_clear(struct crashlog_entry *crashlog)
+static int pmt_crashlog_set_clear(struct crashlog_entry *crashlog)
 {
-	pmt_crashlog_rmw(crashlog, crashlog->info->control.clear, true);
+	return pmt_crashlog_rmw(crashlog, crashlog->info->control.clear, true);
 }
 
-static void pmt_crashlog_set_execute(struct crashlog_entry *crashlog)
+static int pmt_crashlog_set_execute(struct crashlog_entry *crashlog)
 {
-	pmt_crashlog_rmw(crashlog, crashlog->info->control.manual, true);
+	return pmt_crashlog_rmw(crashlog, crashlog->info->control.manual, true);
 }
 
 static bool pmt_crashlog_cleared(struct crashlog_entry *crashlog)
@@ -207,9 +209,9 @@ static bool pmt_crashlog_consumed(struct crashlog_entry *crashlog)
 	return pmt_crashlog_rc(crashlog, crashlog->info->status.consumed);
 }
 
-static void pmt_crashlog_set_consumed(struct crashlog_entry *crashlog)
+static int pmt_crashlog_set_consumed(struct crashlog_entry *crashlog)
 {
-	pmt_crashlog_rmw(crashlog, crashlog->info->control.consume, true);
+	return pmt_crashlog_rmw(crashlog, crashlog->info->control.consume, true);
 }
 
 static bool pmt_crashlog_error(struct crashlog_entry *crashlog)
@@ -222,9 +224,9 @@ static bool pmt_crashlog_rearm(struct crashlog_entry *crashlog)
 	return pmt_crashlog_rc(crashlog, crashlog->info->status.rearmed);
 }
 
-static void pmt_crashlog_set_rearm(struct crashlog_entry *crashlog)
+static int pmt_crashlog_set_rearm(struct crashlog_entry *crashlog)
 {
-	pmt_crashlog_rmw(crashlog, crashlog->info->control.rearm, true);
+	return pmt_crashlog_rmw(crashlog, crashlog->info->control.rearm, true);
 }
 
 /*
@@ -245,13 +247,13 @@ clear_store(struct device *dev, struct device_attribute *attr,
 {
 	struct crashlog_entry *crashlog;
 	bool clear;
-	int result;
+	int ret;
 
 	crashlog = dev_get_drvdata(dev);
 
-	result = kstrtobool(buf, &clear);
-	if (result)
-		return result;
+	ret = kstrtobool(buf, &clear);
+	if (ret)
+		return ret;
 
 	/* set bit only */
 	if (!clear)
@@ -259,9 +261,9 @@ clear_store(struct device *dev, struct device_attribute *attr,
 
 	guard(mutex)(&crashlog->control_mutex);
 
-	pmt_crashlog_set_clear(crashlog);
+	ret = pmt_crashlog_set_clear(crashlog);
 
-	return count;
+	return ret ?: count;
 }
 static DEVICE_ATTR_RW(clear);
 
@@ -280,13 +282,13 @@ consumed_store(struct device *dev, struct device_attribute *attr, const char *bu
 {
 	struct crashlog_entry *crashlog;
 	bool consumed;
-	int result;
+	int ret;
 
 	crashlog = dev_get_drvdata(dev);
 
-	result = kstrtobool(buf, &consumed);
-	if (result)
-		return result;
+	ret = kstrtobool(buf, &consumed);
+	if (ret)
+		return ret;
 
 	/* set bit only */
 	if (!consumed)
@@ -300,9 +302,9 @@ consumed_store(struct device *dev, struct device_attribute *attr, const char *bu
 	if (!pmt_crashlog_complete(crashlog))
 		return -EEXIST;
 
-	pmt_crashlog_set_consumed(crashlog);
+	ret = pmt_crashlog_set_consumed(crashlog);
 
-	return count;
+	return ret ?: count;
 }
 static DEVICE_ATTR_RW(consumed);
 
@@ -321,19 +323,19 @@ enable_store(struct device *dev, struct device_attribute *attr,
 {
 	struct crashlog_entry *crashlog;
 	bool enabled;
-	int result;
+	int ret;
 
 	crashlog = dev_get_drvdata(dev);
 
-	result = kstrtobool(buf, &enabled);
-	if (result)
-		return result;
+	ret = kstrtobool(buf, &enabled);
+	if (ret)
+		return ret;
 
 	guard(mutex)(&crashlog->control_mutex);
 
-	pmt_crashlog_set_disable(crashlog, !enabled);
+	ret = pmt_crashlog_set_disable(crashlog, !enabled);
 
-	return count;
+	return ret ?: count;
 }
 static DEVICE_ATTR_RW(enable);
 
@@ -362,13 +364,13 @@ rearm_store(struct device *dev, struct device_attribute *attr, const char *buf,
 {
 	struct crashlog_entry *crashlog;
 	bool rearm;
-	int result;
+	int ret;
 
 	crashlog = dev_get_drvdata(dev);
 
-	result = kstrtobool(buf, &rearm);
-	if (result)
-		return result;
+	ret = kstrtobool(buf, &rearm);
+	if (ret)
+		return ret;
 
 	/* set only */
 	if (!rearm)
@@ -376,9 +378,9 @@ rearm_store(struct device *dev, struct device_attribute *attr, const char *buf,
 
 	guard(mutex)(&crashlog->control_mutex);
 
-	pmt_crashlog_set_rearm(crashlog);
+	ret = pmt_crashlog_set_rearm(crashlog);
 
-	return count;
+	return ret ?: count;
 }
 static DEVICE_ATTR_RW(rearm);
 
@@ -400,13 +402,13 @@ trigger_store(struct device *dev, struct device_attribute *attr,
 {
 	struct crashlog_entry *crashlog;
 	bool trigger;
-	int result;
+	int ret;
 
 	crashlog = dev_get_drvdata(dev);
 
-	result = kstrtobool(buf, &trigger);
-	if (result)
-		return result;
+	ret = kstrtobool(buf, &trigger);
+	if (ret)
+		return ret;
 
 	guard(mutex)(&crashlog->control_mutex);
 
@@ -415,17 +417,17 @@ trigger_store(struct device *dev, struct device_attribute *attr,
 		return -EBUSY;
 
 	if (!trigger) {
-		pmt_crashlog_set_clear(crashlog);
-		return count;
+		ret = pmt_crashlog_set_clear(crashlog);
+		return ret ?: count;
 	}
 
 	/* we cannot trigger a new crash if one is still pending */
 	if (pmt_crashlog_complete(crashlog))
 		return -EEXIST;
 
-	pmt_crashlog_set_execute(crashlog);
+	ret = pmt_crashlog_set_execute(crashlog);
 
-	return count;
+	return ret ?: count;
 }
 static DEVICE_ATTR_RW(trigger);
 
-- 
2.43.0

