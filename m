Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA203914FE
	for <platform-driver-x86@vger.kernel.org>; Tue,  1 Sep 2026 19:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788290872; cv=none; b=p/TBmeywcT0hKuH5wgI/1Bdkx9s51EBqOiq1AQvfz36gj+SxjwRobBbv3F/t76YcIGkZJkGDK4O7z6yi6G4UZRyiI2H9td7hC96qpDnqOqTjmQWo2zgYQ4wouV98HrILUzZN13M+eWEF1IRz8lr2UF5RJN7hJ8ulCvPXkC+oOzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788290872; c=relaxed/simple;
	bh=C6bJVzHM5aj7Ptf7m8b019ekQ7TBQrOGZXR82LWTcNc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nlyy0EY0gPywFOmdnvxGrNk+ym7qOdLcoG4u4N918vpTyG1PPyHv3tSlqbvneidyJFAgT9LsnPQjXZTn+SFUhKvyNJMwlthLeP9ZuibAPMAJXAuGbEEM5cXIcUPsd4g2mmyYGlULby3YMq9LEaroAIZt8OHi3A9/a7HHrETS7uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RHGLDZru; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RHGLDZru"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788290871; x=1819826871;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=C6bJVzHM5aj7Ptf7m8b019ekQ7TBQrOGZXR82LWTcNc=;
  b=RHGLDZruw1iTOq++kDsw7Ew66hn7bV46LE/PoPvTUoh9G9MEv2DLbNIG
   POQt1U3U/i2M/h7Zn2lAsiuRNs4EYtUuBj+5Lp8wIOcltcQA0XXZd5BRk
   QzAkWHL3JMv2ikJSlEKTWZPMVDQ9KMRhsGEsw0xP167oFlmHP4AOQb0iy
   llNHW0n804Onfiu+vxBry2hafr2MX54rWx7WWtcKxlKuMou5J2T8bDUqH
   aBoBjRu3x7ttQpQxTBvuzaOIbPelcTvlTsCmtOUxGsvvEglRSqWyR4s7R
   IRS7wVxkGtOVWdusZwyC3xg2wif0ofsfwxV8AGyMq8pRbDRR+AUjNN8ES
   A==;
X-CSE-ConnectionGUID: 4v8OXZtrQvSJFumBQXnrPg==
X-CSE-MsgGUID: 551w4LPQTL2XFjVguyXNoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88762455"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="88762455"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 12:27:51 -0700
X-CSE-ConnectionGUID: dldWWnSOR+CmByyr2MaUug==
X-CSE-MsgGUID: ouQeMSUWQZKp/SZifcqQFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="269776713"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 12:27:51 -0700
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
Subject: [PATCH v4 02/18] platform/x86/intel/pmt: refactor rmw with a return value
Date: Tue,  1 Sep 2026 12:27:37 -0700
Message-ID: <20260901192736.626777-22-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901192736.626777-20-michael.j.ruhl@intel.com>
References: <20260901192736.626777-20-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Upcoming changes will include possible failures from HW
accesses.

Refactor pmt_crashlog_rwm with a return value.

Update all necessary usage to use the return code.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/crashlog.c | 88 ++++++++++++-----------
 1 file changed, 45 insertions(+), 43 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index f936daf99e4d..ebc7880d95bd 100644
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
+static int pmt_crashlog_set_disable(struct crashlog_entry *crashlog,
 				     bool disable)
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
+	return ret ? ret : count;
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
+	return ret ? ret : count;
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
+	return ret ? ret : count;
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
+	return ret ? ret : count;
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
+		return ret ? ret : count;
 	}
 
 	/* we cannot trigger a new crash if one is still pending */
 	if (pmt_crashlog_complete(crashlog))
 		return -EEXIST;
 
-	pmt_crashlog_set_execute(crashlog);
+	ret = pmt_crashlog_set_execute(crashlog);
 
-	return count;
+	return ret ? ret : count;
 }
 static DEVICE_ATTR_RW(trigger);
 
-- 
2.43.0

