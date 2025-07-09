Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FAB23B629
	for <platform-driver-x86@vger.kernel.org>; Wed,  9 Jul 2025 18:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752086742; cv=none; b=X+W38q7wrw/EhmL+pAS3c5p+9jPIYHXs4sFgFTCZJsXsUQjCXM9cJEWPc6uPk7d/dnkXSpSRZ/3D/J+PDqq+MKOr/GeMzthrfpM6MTgW2ons3kZLEjPZ3K1OAfMhyvMpLKonlZC5ThYq3ZSlutrQNDVlGCdJSwuOrRImF1u/JTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752086742; c=relaxed/simple;
	bh=tXOcI6IfN830BuVNvIA1Rh6VfqL/8km47GvFOe5dIyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CA9QAX2Dg488yHMQvhJfquZBqupi8FORirq59IdmSA2yPgjySJ2GVEAVWVJIA9UCrewT/b0V73822YGUca/a7RdaieNS+b/YeHEwLgZg5Gd9OVW6meCZ6Xyi7K4WoYAsM8f85abr8eEOE/Y5a9iOGYMa11r8yMA4b/uuAtXoEw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ep0NwkOc; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ep0NwkOc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752086741; x=1783622741;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tXOcI6IfN830BuVNvIA1Rh6VfqL/8km47GvFOe5dIyY=;
  b=ep0NwkOcZtE0xTLQ7YojeY76DetdymCB+bYIVYKd+bYON4rHSGBiKXZ0
   jyBOHCD/bDQtC6GtH3HpUwTX4zi9erHmp5h24bzLu65GqL7ed0Kkl07RI
   PcnR49dcd02JPrI3b5+V/nyXzI10dGfFpW9T4CHJO27frJevmk60oVWWN
   rJKpYzEeeexX+NMTgH7sDlMeuXvp7JIlnpocYwkKgXk0bfLvsLJyyAyC8
   tc1s6tVkAzF59fILiZPDQAbaBbXOW/Dmmbc4iZY5Gu38V3ez4FKZ7X+OO
   omTCLIRVbg287CvGhv505MmLNAWHDMatIyUNhXKXH7X4nRKPomEcL29oZ
   g==;
X-CSE-ConnectionGUID: CF5LiepFTzCYCvWMoGs7DA==
X-CSE-MsgGUID: rpdmNpH0RaOqyWn8jNZViA==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54451091"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="54451091"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 11:45:41 -0700
X-CSE-ConnectionGUID: JGPh9LcEQlm3FBQPFDdFgA==
X-CSE-MsgGUID: w+K1PBaySbeux5GNlYKEFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="161404889"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.221.121])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 11:45:39 -0700
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
Subject: [PATCH v7 10/12] platform/x86/intel/pmt: refactor base parameter
Date: Wed,  9 Jul 2025 14:44:56 -0400
Message-ID: <20250709184458.298283-11-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250709184458.298283-1-michael.j.ruhl@intel.com>
References: <20250709184458.298283-1-michael.j.ruhl@intel.com>
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

