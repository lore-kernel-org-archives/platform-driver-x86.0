Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8380115990C
	for <platform-driver-x86@vger.kernel.org>; Fri, 30 May 2025 20:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748637280; cv=none; b=pleN9c4xT9qLXEMQfTwhowDj20USTJ1XFqL94kQxul0jy3M67q5t9QLXthDoAu83JqKN86USNrQ+oEFDiI7z2G9KwVLJuckiQ79jVf6u8L41sDHAZPUPAvOIAXI9apE9Kic5dpzY3gc5s7u9sbjvMeL0kuBJL0FRc8uP8E3Fm/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748637280; c=relaxed/simple;
	bh=Jav3HndAgFtm0Gwf3otH4ki5eiu8VemhgpEIgq/H1sc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pteD6a4C6C0Bz/zC1UQselFRuCO4p7BVv7AZf9aS2sQ5tHDHZA1q6On+ggyJCnOU4WN+vYAy+NUEGRKDf3DDPLYn+b4XzzVvwkK9mYi6TBYktDNBwPGctAbbQpFKIv3+ACNjFGrxPLsbCOm/621udklrZe0NYFIAmOwsF3Qeml0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WS1Jtn2r; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WS1Jtn2r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748637278; x=1780173278;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Jav3HndAgFtm0Gwf3otH4ki5eiu8VemhgpEIgq/H1sc=;
  b=WS1Jtn2rV+G2jPYYDrX5KYGi1S9HQWb/FicfnVSSPTh2RYJtWG/xJUiw
   ytoVCbiSAgirgcxCVTPA8VjIsCKmQ+SFBtXsLN0kyYj3pZh5yzt3Jy9k2
   CbYztG/9bdo4G9nq6LLkpufEWYIO+MldaMRRVogBAD5LhyEehLkRKzvfr
   t0a7ZPSOtCw2NC2exiROi/tohkdinmQiLhlyfIs2/7lWMchaozpbepWIA
   K68CGHxywbjF1TpF93sv0elfO+1zycUn396qulzfFSvK2X2jcgrUuwFTI
   5d4kELKvEpf2xEkUNShU/yKW3rVPSt9UfGGBx/wZGCRQJ+RcAVo08XGqQ
   Q==;
X-CSE-ConnectionGUID: yRzDPlAURTqvhs8AQaC5HQ==
X-CSE-MsgGUID: qCAWlO9QQumKMqyPOL3Omw==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="54405796"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="54405796"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 13:34:38 -0700
X-CSE-ConnectionGUID: yx6G/tQZQ7u9hWKUbO98SA==
X-CSE-MsgGUID: b30sPzSySVawIcdgRuXwvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="149246691"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.223.23])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 13:34:37 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org,
	intel-xe@lists.freedesktop.org,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH 09/10] sysfs debug
Date: Fri, 30 May 2025 16:33:46 -0400
Message-ID: <20250530203356.190234-9-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530203356.190234-1-michael.j.ruhl@intel.com>
References: <20250530203356.190234-1-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/crashlog.c | 31 +++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index 7291c93d71df..985f2c685841 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -469,6 +469,34 @@ trigger_store(struct device *dev, struct device_attribute *attr,
 }
 static DEVICE_ATTR_RW(trigger);
 
+#define DEBUG_REGISTER_INFO
+#ifdef DEBUG_REGISTER_INFO
+static ssize_t
+status_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct crashlog_entry *crashlog = dev_get_drvdata(dev);
+	u32 status = readl(crashlog->entry.disc_table + crashlog->info->status.offset);
+	u32 control = readl(crashlog->entry.disc_table + crashlog->info->control.offset);
+	int len = 0;
+
+	len += sysfs_emit_at(buf, len, "clear_support: 0x%08x\n", status & crashlog->info->status.clear_supported);
+	len += sysfs_emit_at(buf, len, "rearmed: 0x%08x\n", status & crashlog->info->status.rearmed);
+	len += sysfs_emit_at(buf, len, "error: 0x%08x\n", status & crashlog->info->status.error);
+	len += sysfs_emit_at(buf, len, "consumed: 0x%08x\n", status & crashlog->info->status.consumed);
+	len += sysfs_emit_at(buf, len, "disable: 0x%08x\n", status & crashlog->info->status.disabled);
+	len += sysfs_emit_at(buf, len, "cleared: 0x%08x\n", status & crashlog->info->status.cleared);
+	len += sysfs_emit_at(buf, len, "in_progress: 0x%08x\n", status & crashlog->info->status.in_progress);
+	len += sysfs_emit_at(buf, len, "complete: 0x%08x\n", status & crashlog->info->status.complete);
+	len += sysfs_emit_at(buf, len, "sts_off: 0x%02x  ctl_off: 0x%02x\n", crashlog->info->status.offset,
+			     crashlog->info->control.offset);
+	len += sysfs_emit_at(buf, len, "status:  0x%08x\n", status);
+	len += sysfs_emit_at(buf, len, "control: 0x%08x\n", control);
+
+	return len;
+}
+static DEVICE_ATTR_RO(status);
+#endif
+
 static struct attribute *pmt_crashlog_attrs[] = {
 	&dev_attr_enable.attr,
 	&dev_attr_trigger.attr,
@@ -482,6 +510,9 @@ static struct attribute *pmt_crashlog_ver2_attrs[] = {
 	&dev_attr_error.attr,
 	&dev_attr_rearm.attr,
 	&dev_attr_trigger.attr,
+#ifdef DEBUG_REGISTER_INFO
+	&dev_attr_status.attr,
+#endif
 	NULL
 };
 
-- 
2.49.0

