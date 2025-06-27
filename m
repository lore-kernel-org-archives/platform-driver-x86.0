Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278002ECE84
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Jun 2025 20:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751057026; cv=none; b=C9gGznPeE3Ev+ghKTNrFbBfHRWNCIWXgeX0WDiw1LwzU/VDiwO29o92k9Hp5XohIFbXe7GwyOB6UvStWTNIbIlfQocb/DFg7ROVgaTNSC8yR3WPOF9FfLo5CrH9uNLyKP+l+4bX9xUolCkIR2yZWZCqOl9VVvjaQgK1VU987Af0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751057026; c=relaxed/simple;
	bh=ij6/LHo6M7yqDlDFtGZ4zxvdi1dUgj2wcGHmHie0mNo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UPuUtStsm84FGuicjboUiuwNah7fwh6JaQGpFO45el8b9se7JeHuVu29X1Db9EZrOxwRgdnG+EmwpsziXqWt/SpZh5sLFq4UY2tszv/1CZb32HcHWFLJzGv6EDBa2Tj47xhESW1PzUl5nv5phCfAJglMuljQg3lLh+VtmYt6KOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ax+5biGn; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ax+5biGn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751057025; x=1782593025;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ij6/LHo6M7yqDlDFtGZ4zxvdi1dUgj2wcGHmHie0mNo=;
  b=Ax+5biGnGmw/Oh1kLmUdKiPTQ/sVJ+cuezMvMlP155kKzdAIewuaEKWg
   I6VNk72F5HJUA5BCTFeNOYcYHgRbuEam9Qe91e/W6yPdSgT3gWz6/g7uL
   /ntNikbN/Ueq/CmIOHIyLnNLlkAoKwgtY0mHRDwtA0wRoWsJOmE31NLyY
   BKMppljdFpEbc6hvhoiZd5w9f4aFIrYd84EFr/eTnOpEqTuEHDFjJp3Ej
   9uy4kGd052kRlBQlIYrY7beJoV7tLwPC9dPO2KhG4qylaoF3ID62aWcuG
   kdD/3or0shpVpb3oiFuWz03yfG98G3yaXhSMdIMC6740nWDFVHYbY1FsA
   Q==;
X-CSE-ConnectionGUID: +0WF/4BXQMeV4Dhd0wH2fA==
X-CSE-MsgGUID: hoVLdFJ3SUqolSSkhQ/MAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="41003196"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="41003196"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 13:43:45 -0700
X-CSE-ConnectionGUID: QcyJDiKMSTynuQyydLMK3w==
X-CSE-MsgGUID: LGUUBW6nSpau/T4b3KRlnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="156939010"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.220.252])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 13:43:44 -0700
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
Subject: [PATCH v5 05/12] platform/x86/intel/pmt: use guard(mutex)
Date: Fri, 27 Jun 2025 16:43:14 -0400
Message-ID: <20250627204321.521628-6-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627204321.521628-1-michael.j.ruhl@intel.com>
References: <20250627204321.521628-1-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Update the mutex paths to use the new guard() mechanism.

With the removal of goto, do some minor cleanup of the current logic
path.

Reviewed-by: David E. Box <david.e.box@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/crashlog.c | 33 +++++++++++------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index 6e32fc1f8f1d..c3ca95854aba 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/auxiliary_bus.h>
+#include <linux/cleanup.h>
 #include <linux/intel_vsec.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -156,9 +157,9 @@ enable_store(struct device *dev, struct device_attribute *attr,
 	if (result)
 		return result;
 
-	mutex_lock(&entry->control_mutex);
+	guard(mutex)(&entry->control_mutex);
+
 	pmt_crashlog_set_disable(&entry->entry, !enabled);
-	mutex_unlock(&entry->control_mutex);
 
 	return count;
 }
@@ -190,26 +191,24 @@ trigger_store(struct device *dev, struct device_attribute *attr,
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

