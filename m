Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26A72F7AD0
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Dec 2025 08:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767082284; cv=none; b=J2F8RCryQBDrZadTG5t0/hAxuktCUbLPl1YkjVipkNMGm5FkKA8BlOpt3SLy/LQVPlewgjU4XvGw+rFkIZY5KNKOnQg/XLVmivcsdZErmxRnd2eBJV3+Xy2jI0Z6akJuR34s2rhxdceE50KiS9QJ7X/jRSJetAIAiOcFlIJQX5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767082284; c=relaxed/simple;
	bh=8VUv4Bi6D93Br3Bxivo4ykhT1a5WQYiS49xZL7O7lYI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NacocFaGWUbP+VT4qZQvzHM9clH4kC6NPC+diJQFcd8AYGAX7D6xkyMlsrIdFBRAwrTaNo1jN2bD9tPgz49u6b8dloPKluK5LH+J5R0l9XvHWnu29m/Ka3/UrSGLfA8BJ+XZ5Fctt/lVFhwZi54v0xpQzpZNqHh/YWs/Fxggs1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dhsIIv8q; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dhsIIv8q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767082282; x=1798618282;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8VUv4Bi6D93Br3Bxivo4ykhT1a5WQYiS49xZL7O7lYI=;
  b=dhsIIv8q/BvfSaLxDyWAhWgQSheaAIZ6LWfvAwCAWYusPoydPNhboqy7
   JgIGjVvWLp21B2n4SAVbZMIfBwFhpWnSMcKJK4YtjdyGRqkRwAVUJdFNE
   9IHmt4C0cMzz3RwN/hLQ/o03KdWqnb+OFQAnh7JGMlc4Zsk8YB4nB1IIG
   cCNJwCwnPPcXjJQhTR5+7bCcdVWmrdLpyMNNS39xE47maCeFZUUMyY+na
   yZ+CHpUCh6hM0vJ6mxokiznkmwEaR93xODOzUG+q9wHQ2vjHKQGCzysvC
   1G/bmDtXTTUtTZY87dDf7GYmaQqGASVyaOodrZi6ISR4BRBDxSC0xm/bS
   A==;
X-CSE-ConnectionGUID: yPrfOMSkSGq6mD7DGwxFkw==
X-CSE-MsgGUID: WPhEFEe+TLW0u8HEnCwqaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="80044205"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="80044205"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 00:11:22 -0800
X-CSE-ConnectionGUID: LQrvjIlDScevEOga4hWICw==
X-CSE-MsgGUID: 7VYKOkgYRH2YLqaKs2yjgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="206050904"
Received: from baandr0id001.iind.intel.com ([10.66.253.151])
  by fmviesa004.fm.intel.com with ESMTP; 30 Dec 2025 00:11:21 -0800
From: Kaushlendra Kumar <kaushlendra.kumar@intel.com>
To: srinivas.pandruvada@linux.intel.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	Kaushlendra Kumar <kaushlendra.kumar@intel.com>
Subject: [PATCH 2/2] platform/x86/intel/uncore-freq: Replace sprintf() with sysfs_emit()
Date: Tue, 30 Dec 2025 13:35:45 +0530
Message-Id: <20251230080545.224954-3-kaushlendra.kumar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251230080545.224954-1-kaushlendra.kumar@intel.com>
References: <20251230080545.224954-1-kaushlendra.kumar@intel.com>
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
index c129dd450360..ff97e3d210ab 100644
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

