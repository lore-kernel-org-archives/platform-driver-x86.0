Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51E5284665
	for <platform-driver-x86@vger.kernel.org>; Sun, 13 Jul 2025 17:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752427820; cv=none; b=Kq4feEEIXMSDuNWhxjHuHOwKp1TKOiEIdRbmV4CzJGP63K/ZVwAYeWXB3sUREf9X1UHdqY0JsKZPAiRzBnpeyfQ1NpQkftQCSPoQ/OhlenDKcxpRuriYwXwBwOohSgX1j3hoGC3oe1O1NTFbyhQSRFjqHL8MrmgwP5GEBjGsSzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752427820; c=relaxed/simple;
	bh=tXOcI6IfN830BuVNvIA1Rh6VfqL/8km47GvFOe5dIyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JXw0fNSeDvnairak+YeDey0Kh9jYEysU7vP8JSGahAZRqdtIDTHp4OqXb9Ns90X89p90YyCTVAc8ntnM6DZ/x5wWh3JmmE6QPH0+TJ9oFI82a6fQ2Xq4qSY7778bDsngtz8spTHHfyPN33FAlV5Eojmv4BDg2/kobz/+TDqkYrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k37uthRp; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k37uthRp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752427819; x=1783963819;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tXOcI6IfN830BuVNvIA1Rh6VfqL/8km47GvFOe5dIyY=;
  b=k37uthRpR3gtuhJl74jIxo0+7/4UgDCYp4WZgkIYiovqbPBQlmbLdOmj
   DSE0MAoCqJDRt24sDFqMoXbYKKzpXSrJsypoPwwst3jSgHscm1B0M2sZP
   7Doll0v09KVpxRkhy+c07Yjvfw0WEYKBcYsq63cVGIEdaqHZALiIZqEIm
   XvoYLva4H63iyJF1mHNB3d6zueGjqGEBSI05OswN2juq8/vHmM//oI4Xy
   c8k4i31/KLEcWn2rYlAvcMqh4OS9Ygy1K2SWFktKXPjsX5uLTuQiabMIS
   hwg1wAM8qxnfiaSll5Wj4IdyQs6+XADxFQtMetu+2QXx9L4XsIHLXPOhL
   w==;
X-CSE-ConnectionGUID: uZ2scbnIS3OMXSc3QL0kQw==
X-CSE-MsgGUID: DZVzy9WISsCNqkTXmX2+bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65334168"
X-IronPort-AV: E=Sophos;i="6.16,309,1744095600"; 
   d="scan'208";a="65334168"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 10:30:19 -0700
X-CSE-ConnectionGUID: hQ1qYygqRmCHtowwxFL5Og==
X-CSE-MsgGUID: DFY1avurQPCpCFOW/PXpWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,309,1744095600"; 
   d="scan'208";a="161069367"
Received: from mgoodin-mobl3.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.223.19])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 10:30:17 -0700
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
Subject: [PATCH v8 11/13] platform/x86/intel/pmt: refactor base parameter
Date: Sun, 13 Jul 2025 13:29:41 -0400
Message-ID: <20250713172943.7335-12-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250713172943.7335-1-michael.j.ruhl@intel.com>
References: <20250713172943.7335-1-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

To support an upcoming crashlog change, use the parent of
struct intel_pmt_entry, struct crashlog_entry, as a main parameter.

Using struct crashlog_entry will allow for a more flexible interface
to control the crashlog feature.

- Refactor to use struct crashlog_entry in place of
  struct intel_pmt_entry
- Rename variables from "entry" to "crashlog"

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/crashlog.c | 58 ++++++++++++-----------
 1 file changed, 30 insertions(+), 28 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index ed781548e59d..087b7110ddd2 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -66,8 +66,9 @@ struct pmt_crashlog_priv {
  */
 
 /* Read, modify, write the control register, setting or clearing @bit based on @set */
-static void pmt_crashlog_rmw(struct intel_pmt_entry *entry, u32 bit, bool set)
+static void pmt_crashlog_rmw(struct crashlog_entry *crashlog, u32 bit, bool set)
 {
+	struct intel_pmt_entry *entry = &crashlog->entry;
 	u32 reg = readl(entry->disc_table + CONTROL_OFFSET);
 
 	reg &= ~CRASHLOG_FLAG_TRIGGER_MASK;
@@ -81,23 +82,24 @@ static void pmt_crashlog_rmw(struct intel_pmt_entry *entry, u32 bit, bool set)
 }
 
 /* Read the status register and see if the specified @bit is set */
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
@@ -115,20 +117,20 @@ static bool pmt_crashlog_supported(struct intel_pmt_entry *entry)
 	return crash_type == CRASH_TYPE_OOBMSM && version == 0;
 }
 
-static void pmt_crashlog_set_disable(struct intel_pmt_entry *entry,
+static void pmt_crashlog_set_disable(struct crashlog_entry *crashlog,
 				     bool disable)
 {
-	pmt_crashlog_rmw(entry, CRASHLOG_FLAG_DISABLE, disable);
+	pmt_crashlog_rmw(crashlog, CRASHLOG_FLAG_DISABLE, disable);
 }
 
-static void pmt_crashlog_set_clear(struct intel_pmt_entry *entry)
+static void pmt_crashlog_set_clear(struct crashlog_entry *crashlog)
 {
-	pmt_crashlog_rmw(entry, CRASHLOG_FLAG_TRIGGER_CLEAR, true);
+	pmt_crashlog_rmw(crashlog, CRASHLOG_FLAG_TRIGGER_CLEAR, true);
 }
 
-static void pmt_crashlog_set_execute(struct intel_pmt_entry *entry)
+static void pmt_crashlog_set_execute(struct crashlog_entry *crashlog)
 {
-	pmt_crashlog_rmw(entry, CRASHLOG_FLAG_TRIGGER_EXECUTE, true);
+	pmt_crashlog_rmw(crashlog, CRASHLOG_FLAG_TRIGGER_EXECUTE, true);
 }
 
 /*
@@ -137,8 +139,8 @@ static void pmt_crashlog_set_execute(struct intel_pmt_entry *entry)
 static ssize_t
 enable_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
-	struct intel_pmt_entry *entry = dev_get_drvdata(dev);
-	bool enabled = !pmt_crashlog_disabled(entry);
+	struct crashlog_entry *crashlog = dev_get_drvdata(dev);
+	bool enabled = !pmt_crashlog_disabled(crashlog);
 
 	return sprintf(buf, "%d\n", enabled);
 }
@@ -147,19 +149,19 @@ static ssize_t
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
@@ -168,11 +170,11 @@ static DEVICE_ATTR_RW(enable);
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
@@ -181,32 +183,32 @@ static ssize_t
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
2.50.0

