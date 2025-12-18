Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3451A19D8A8
	for <platform-driver-x86@vger.kernel.org>; Thu, 18 Dec 2025 07:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766044273; cv=none; b=DePOEI7/2dYSQFwsmTIzo5mvg2fkc2lUsn92Idpeu48RqqpY7pe9Aw+2rx7R7cTMGRyvqZ9vxnvbyrvVq/fI0BoQrXnwaiRkvR/AyZ9dQtWSmy/uywNUt5Ges1LdtQYjO9sJHWypRAyLW9iGvTYt0+Jm7PeWJb5TF1zok6gn8yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766044273; c=relaxed/simple;
	bh=I20OF+e/HAWb7PCnGHwO0cmMpDQMtQQd+2rc1GuGpGg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IGG093/B2uSCSg1XKzVQrCXzvLHr2XWstXz5VyjFCROhwVwRYBmFyPdmDb7M7nkqryrOVo6mCE0k4jvN/mAeuHGee2IYQMdw1DF72zc5rf2PwJrFZVB19n7hNUdPNN5zHNDJzXBDKsKhQIpMEUyDp4s+i8dZl23bWlWQc2TQ4H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mNfb4WrR; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mNfb4WrR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766044271; x=1797580271;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=I20OF+e/HAWb7PCnGHwO0cmMpDQMtQQd+2rc1GuGpGg=;
  b=mNfb4WrROm0P8aQwq9L772jZJ37oG6z7ZIuD7xrpmMo7rTBT2CbkJt35
   BBVJgiE52bZwhy6zjo1TCHOb/2TdzDNO0P6aSXqizcfjvVA4jbLtPkNij
   zQ54tkAcDKzCeWJn32catbnJM2FGMMR3pg97PuJpTm/HWcxT+/7Wtv1Ck
   OQTJVujVM8vFebm0gRg+s98KueFdSSP4LiixWRq4inpqGacsmGMrfzgSE
   Ewk3BR4DEq+dIZPdvzbzZICZgsgYQ8Fo9PM2fUJSVJS1ReB23IJH9EuUX
   gi+VDpjLT41LmhodpH9bP2VaGGbA3/xZk6fIhfvHLT6qgGlijAKBt8CvD
   w==;
X-CSE-ConnectionGUID: c8T00CntRcWKXePLSjajDA==
X-CSE-MsgGUID: 4mJYkf4TTVGo+/v01IYMlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="79114235"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="79114235"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 23:51:09 -0800
X-CSE-ConnectionGUID: 7NXtntJgRKubZl/4lqfQqg==
X-CSE-MsgGUID: UvyV2qGwT0elEkB7PY1nHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="198769439"
Received: from baandr0id001.iind.intel.com ([10.66.253.151])
  by fmviesa008.fm.intel.com with ESMTP; 17 Dec 2025 23:51:07 -0800
From: Kaushlendra Kumar <kaushlendra.kumar@intel.com>
To: david.e.box@linux.intel.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	Kaushlendra Kumar <kaushlendra.kumar@intel.com>
Subject: [PATCH] platform/x86: intel/pmt: Replace sprintf() with sysfs_emit()
Date: Thu, 18 Dec 2025 13:18:33 +0530
Message-Id: <20251218074833.2948801-1-kaushlendra.kumar@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace sprintf() calls with sysfs_emit() in guid_show(), size_show(),
and offset_show() sysfs attribute handlers. The sysfs_emit() function
provides automatic buffer bounds checking and is the preferred method
for formatting sysfs output per Documentation/filesystems/sysfs.rst.

This improves safety by preventing potential buffer overflows and aligns
with current kernel coding standards for sysfs attribute implementation.

Signed-off-by: Kaushlendra Kumar <kaushlendra.kumar@intel.com>
---
 drivers/platform/x86/intel/pmt/class.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
index 7c3023d5d91d..be3c8d9e4fff 100644
--- a/drivers/platform/x86/intel/pmt/class.c
+++ b/drivers/platform/x86/intel/pmt/class.c
@@ -140,7 +140,7 @@ guid_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct intel_pmt_entry *entry = dev_get_drvdata(dev);
 
-	return sprintf(buf, "0x%x\n", entry->guid);
+	return sysfs_emit(buf, "0x%x\n", entry->guid);
 }
 static DEVICE_ATTR_RO(guid);
 
@@ -149,7 +149,7 @@ static ssize_t size_show(struct device *dev, struct device_attribute *attr,
 {
 	struct intel_pmt_entry *entry = dev_get_drvdata(dev);
 
-	return sprintf(buf, "%zu\n", entry->size);
+	return sysfs_emit(buf, "%zu\n", entry->size);
 }
 static DEVICE_ATTR_RO(size);
 
@@ -158,7 +158,7 @@ offset_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct intel_pmt_entry *entry = dev_get_drvdata(dev);
 
-	return sprintf(buf, "%lu\n", offset_in_page(entry->base_addr));
+	return sysfs_emit(buf, "%lu\n", offset_in_page(entry->base_addr));
 }
 static DEVICE_ATTR_RO(offset);
 
-- 
2.34.1

