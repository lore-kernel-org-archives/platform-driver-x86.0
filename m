Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C399F18A6DB
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Dec 2025 12:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767098888; cv=none; b=DsVxYC6oVaFQmE9pq7BkxmjWN+NLU0i9KIkVTsoDY+OVsQCtEI4ZEbBPLARA/zvxxgQQym+/aCz3WeIdTHPN4wdWVjtJRhOVheOLLGNK7hpgtVIZGHx4dzBq7Sk9UfeztFLh8jxFnV0RLkO6o4gn46igRsyGnLpuuDLW1EQQKv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767098888; c=relaxed/simple;
	bh=RE7MoiEcbup4ctBW5uOHcwo+3LogTDjYohC/zvPLppY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YUviBDO67tZArSAhE3MJRFj/lwFh8XQUQCQ6rSJ41871iW1V1PglNUcY3eibdmBOQP1BbiMV5NYwGa8bh/bYybo5fWz3Zt1ATBt0yl/e/iHmpdN8s2stEFolIc0fiDv+q6ozgD234r2G0veXX+l2D7tEARqRRCKIePP0SnNbY04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XsqqCqSd; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XsqqCqSd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767098887; x=1798634887;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RE7MoiEcbup4ctBW5uOHcwo+3LogTDjYohC/zvPLppY=;
  b=XsqqCqSdiGq8nvSL7bXvocbX0DQSrMDU9pNH+gPUICoEyRgb03BoQegB
   BWfZVnimEcMXyfqfUAqetNG3ouD/tvY1h3Qn70afBsqk4Frl0Pm9JlPB2
   lSJm0fJW+XXLfPVdfpTvx63zODN7JgIGStnViGy4I8AhjWuHycIUniu+l
   K55F8nCkAfKzFyRkdGG9L6tAoUvOEil46HXlXsqfCZ54A+cAMPGHu2Mpu
   nqy5RJ/GiYCV3OOKUdc1CZgpkvK17tZpjFwGHNwDw2WyPiFpHZMPHvWW8
   ZVyGhDXfM2xE6JC62XsKVFWKVd4dKw2GPjcsZfQVQ2FHCwnRPFDc2loRW
   Q==;
X-CSE-ConnectionGUID: ctx6JqQcRM29wr4Ob2W2iQ==
X-CSE-MsgGUID: VmDOJtpNRT2w5KPptJcU8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="79319827"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="79319827"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 04:48:07 -0800
X-CSE-ConnectionGUID: /JwB7N2hQ4aSVrgbH5IR+Q==
X-CSE-MsgGUID: s0+eudS/QLuYyjz+Ax/WXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="206266990"
Received: from baandr0id001.iind.intel.com ([10.66.253.151])
  by orviesa005.jf.intel.com with ESMTP; 30 Dec 2025 04:48:05 -0800
From: Kaushlendra Kumar <kaushlendra.kumar@intel.com>
To: srinivas.pandruvada@linux.intel.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	Kaushlendra Kumar <kaushlendra.kumar@intel.com>
Subject: [PATCH v2 2/2] platform/x86/intel/uncore-freq: Replace sprintf() with sysfs_emit()
Date: Tue, 30 Dec 2025 18:15:16 +0530
Message-Id: <20251230124516.229125-3-kaushlendra.kumar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251230124516.229125-1-kaushlendra.kumar@intel.com>
References: <20251230124516.229125-1-kaushlendra.kumar@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace sprintf() with sysfs_emit() in sysfs show functions. The
sysfs_emit() function is the preferred way to format sysfs output as
it ensures proper buffer bounds checking and correct return values.

Signed-off-by: Kaushlendra Kumar <kaushlendra.kumar@intel.com>
---
 .../x86/intel/uncore-frequency/uncore-frequency-common.c  | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
index e9495ac5ecd0..7070c94324e0 100644
--- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
@@ -26,21 +26,21 @@ static ssize_t show_domain_id(struct kobject *kobj, struct kobj_attribute *attr,
 {
 	struct uncore_data *data = container_of(attr, struct uncore_data, domain_id_kobj_attr);
 
-	return sprintf(buf, "%u\n", data->domain_id);
+	return sysfs_emit(buf, "%u\n", data->domain_id);
 }
 
 static ssize_t show_fabric_cluster_id(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
 {
 	struct uncore_data *data = container_of(attr, struct uncore_data, fabric_cluster_id_kobj_attr);
 
-	return sprintf(buf, "%u\n", data->cluster_id);
+	return sysfs_emit(buf, "%u\n", data->cluster_id);
 }
 
 static ssize_t show_package_id(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
 {
 	struct uncore_data *data = container_of(attr, struct uncore_data, package_id_kobj_attr);
 
-	return sprintf(buf, "%u\n", data->package_id);
+	return sysfs_emit(buf, "%u\n", data->package_id);
 }
 
 #define MAX_UNCORE_AGENT_TYPES	4
@@ -77,7 +77,7 @@ static ssize_t show_attr(struct uncore_data *data, char *buf, enum uncore_index
 	if (ret)
 		return ret;
 
-	return sprintf(buf, "%u\n", value);
+	return sysfs_emit(buf, "%u\n", value);
 }
 
 static ssize_t store_attr(struct uncore_data *data, const char *buf, ssize_t count,
-- 
2.34.1

