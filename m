Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5163615990C
	for <platform-driver-x86@vger.kernel.org>; Fri, 30 May 2025 20:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748637262; cv=none; b=Jh+Sd+Z9M2OmW8/Gbr52Y2Y/UqKmvyl8V3fB5wp69+iFJ9m10GijohuSOtEgjhzCfTmtUrkwjmQHDwgXC2PCtG9P7FYrlfgKYmFGDSps5qKmMuZezXw1wkD+fCFPJkVbmwPwBqBaNqc3ZNdgDnEJysj7pQ7wm3yWDU5jfR3lGaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748637262; c=relaxed/simple;
	bh=anO5uSxXGHeVN2wZdaUxm+8Bhoy2yyCKRXoSKuFsiLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oU4uuqixGxeWxR4q3qX3fUjnn9tj67D5IM2yglVaFwfO4Ubz/Y5D3gFjekCszLoor8lXCxP1jH9kOxcwTKjsMp9LqqPUH4g1y4vKKTXEcLUBmQfKBSDGmgmafkaYpohvg1K79tpBRy1kzu+b9tvWqhCyEI/paOrbkRJEYhrBiiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nGRvQ2Er; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nGRvQ2Er"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748637262; x=1780173262;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=anO5uSxXGHeVN2wZdaUxm+8Bhoy2yyCKRXoSKuFsiLI=;
  b=nGRvQ2Erh5y+Xi3I0s37qOZwMbnXjDK/p4mafw8w65Kj2ip+5gexBIbd
   u9DMQNp6Xwi1UnHXvUwbId4xXltFTJ/0VZBRvj/aRJILX1hmz9Xumw2BI
   96AHheQAX8q7pOFKZRVGIzcb9R5oflfhoaXnq69X1eDx1V4nm2Mhw1v3M
   bxSmabJx1dblx6ui0ZO6B0OYbOagwitrYYGcxw5h6YvOOgsR/9uUmUR0D
   oLcUZWyrkhjqopXRkxDv+3rR7diPSzeWTLvi5H0y5y3m7nj0fzbFBf+sU
   W3L586zEeCgq55mduuBVoQRcJ7jtKwm2ubEm2HMX8Pp6n4xawFjWnIJQd
   w==;
X-CSE-ConnectionGUID: Bw1lvkj5TFCHBQBFg63L/g==
X-CSE-MsgGUID: /oQLo/ixQ0qHmQeGZGXphQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="54405771"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="54405771"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 13:34:22 -0700
X-CSE-ConnectionGUID: /2ibRHgTQeq4Q8bUzQwUmQ==
X-CSE-MsgGUID: BXigwwfaSOuRmXOqHmJPAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="149246649"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.223.23])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 13:34:20 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org,
	intel-xe@lists.freedesktop.org,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH 03/10] platform/x86/intel/pmt: use guard(mutex)
Date: Fri, 30 May 2025 16:33:40 -0400
Message-ID: <20250530203356.190234-3-michael.j.ruhl@intel.com>
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

Update the mutex paths to use the new guard() mechanism.

With the removal of goto, do some minor cleanup of the current
logic path.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/crashlog.c | 32 +++++++++++------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index d40c8e212733..c6d8a7a61d39 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -155,9 +155,9 @@ enable_store(struct device *dev, struct device_attribute *attr,
 	if (result)
 		return result;
 
-	mutex_lock(&entry->control_mutex);
+	guard(mutex)(&entry->control_mutex);
+
 	pmt_crashlog_set_disable(&entry->entry, !enabled);
-	mutex_unlock(&entry->control_mutex);
 
 	return count;
 }
@@ -189,26 +189,24 @@ trigger_store(struct device *dev, struct device_attribute *attr,
 	if (result)
 		return result;
 
-	mutex_lock(&entry->control_mutex);
+	guard(mutex)(&entry->control_mutex);
 
 	if (!trigger) {
 		pmt_crashlog_set_clear(&entry->entry);
-	} else if (pmt_crashlog_complete(&entry->entry)) {
-		/* we cannot trigger a new crash if one is still pending */
-		result = -EEXIST;
-		goto err;
-	} else if (pmt_crashlog_disabled(&entry->entry)) {
-		/* if device is currently disabled, return busy */
-		result = -EBUSY;
-		goto err;
-	} else {
-		pmt_crashlog_set_execute(&entry->entry);
+		return count;
 	}
 
-	result = count;
-err:
-	mutex_unlock(&entry->control_mutex);
-	return result;
+	/* we cannot trigger a new crash if one is still pending */
+	if (pmt_crashlog_complete(&entry->entry))
+		return -EEXIST;
+
+	/* if device is currently disabled, return busy */
+	if (pmt_crashlog_disabled(&entry->entry))
+		return -EBUSY;
+
+	pmt_crashlog_set_execute(&entry->entry);
+
+	return count;
 }
 static DEVICE_ATTR_RW(trigger);
 
-- 
2.49.0

