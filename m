Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1713E21B908
	for <platform-driver-x86@vger.kernel.org>; Wed,  9 Jul 2025 18:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752086729; cv=none; b=uiJ9NJ+YSau751T5V4L3z7edZ2zb2tO3v9/CLtQdyfgy12IiIe78GKqpBASeIC5pGX69YyS0MGC9FdrOSPTrUvOk/sMKZwaBVzBwAemvr4NsuMNwgMSGuiVSgEO+Kzr75JLPnim2lD3jgdil4wk5tX4t3G46d6qcwdGLYe3z7zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752086729; c=relaxed/simple;
	bh=oT3Jm2YcLIrEEoTNBNUIreW51zAojhlRHEqzz+kiMug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GrIiRLvZMzfmiVzFCkRZ83liCss3/NHFE2kgnPF/MvFFt2pK7sMUZUzBe5CFCu8hKhWOM64lgtcfN1T+9firHE0+b/Nghdo3EMUu132MqSTkxihKyCOqQCbEflUF+CEaPeqXrgu8LrjEqUax77CRMg6HJ8JDIQYUBXV3rfMo8zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cb3QwglY; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cb3QwglY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752086728; x=1783622728;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oT3Jm2YcLIrEEoTNBNUIreW51zAojhlRHEqzz+kiMug=;
  b=cb3QwglYpDnTxi/YWm6m8nAj8xFds57UDEcabcE0zFyZjFBzV46BUAh2
   cnCNoLagcvYv6VaoOBa7/4U7FbKwu7wcdw/krSuZxQWeyh5jukZYP96Qz
   vMbf5xCHjDHqmdOvaLGOf0mCQC8h4fP08UcpMncqmvwz2A28pW2AFJk90
   tR7LixeG2oKrwv9yLxyLrAscsv6HN+CrjSZF4dmR8q7qVsZriKwOPdhFu
   1VMTOLgWkrGEE08cKeu1ddK8kEugT+M9hIEBPxtUGzPHTGmBsvBEFEA2Z
   ZtVTJq4QHZe3yO/VPgZ08eVazeEGICJ9nUe55w4nUe04F7sruKOdIvCTI
   A==;
X-CSE-ConnectionGUID: 6u02OroVRcyAKlr+q5JL5Q==
X-CSE-MsgGUID: 1K9zC/sQQZurLJmO1gL8YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54451050"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="54451050"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 11:45:27 -0700
X-CSE-ConnectionGUID: CquQCLIkSyyk8DG1z02rmw==
X-CSE-MsgGUID: DaccBxN4Qvm28r7lQS4iOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="161404867"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.221.121])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 11:45:26 -0700
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
Subject: [PATCH v7 05/12] platform/x86/intel/pmt: use guard(mutex)
Date: Wed,  9 Jul 2025 14:44:51 -0400
Message-ID: <20250709184458.298283-6-michael.j.ruhl@intel.com>
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
2.50.0

