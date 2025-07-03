Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5B32BE7B2
	for <platform-driver-x86@vger.kernel.org>; Thu,  3 Jul 2025 21:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751577146; cv=none; b=STcQrYAPdHHJ6kTk2GhxXYALe3oqh02mEl3GpFXMc2i1wTXqrlfwrWkCWTvCzp5vEBiiCI7xPFE6T46AibMT9lTc0L1i9JzZd5FLGcRRQiO6o6liVlAlPSz5uK3oTZOuHyTB3E08s5i5XdhueSSA1kbw/65f21hPAz236UIiiKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751577146; c=relaxed/simple;
	bh=ij6/LHo6M7yqDlDFtGZ4zxvdi1dUgj2wcGHmHie0mNo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l7E95BWQt4wQ2twy2kEFA8Mvby9Il9dgDnZCL5dY5WOjmanglxmaxREwHiMgWHuMf7PvLYg+OE9mzrwQHIHc6BWab84r0tPV0+4s2W3StZ/J1mkEJ1BDSxexxBfp1rP+fHNcY4ldqRhmtaZZtL8S/OTRt8/7AAGaM4O84JDHVKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vwf6jgEz; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vwf6jgEz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751577145; x=1783113145;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ij6/LHo6M7yqDlDFtGZ4zxvdi1dUgj2wcGHmHie0mNo=;
  b=Vwf6jgEzvzPK6nvHm1peVmFEPZzOGBeIZVL9Wdn8hNhFVPoUtGXOxz5Y
   AOOCb31rweUKhclsQrAprn6C1xz5xCnr1+trMd094shI5vfQcOL/Q+QQn
   AIJUZXdef5HTDZFrQAJKFad1/AX+SKYxqQnGXd81yhB90UsRStQy0dNrl
   oCSqdKWSc5x5usUTUTCXq5gz9jNWTI9Fc6pcC2QixnmZqQXlEeSaXewhz
   T9PWYBwNquJe6hR93l8DCheMeVvXSNYmEk1PbKvagY0uXy6etdq3somQn
   smKQKuHIgSfHn6lOnRfm7KGssWo5AnfJTzEw8eGRbCgNuu5FXPfAbB2YU
   w==;
X-CSE-ConnectionGUID: tuTG3p2XRHmaZeXy2ZnRlg==
X-CSE-MsgGUID: Q9JpcZm+SbmdaSALDoCkOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="79353019"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="79353019"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 14:12:25 -0700
X-CSE-ConnectionGUID: ycuBr/ezQpCluYr7U49HBA==
X-CSE-MsgGUID: kt07oaU/SEK6c3mQQD1XXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="154240060"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.223.97])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 14:12:23 -0700
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
Subject: [PATCH v6 05/12] platform/x86/intel/pmt: use guard(mutex)
Date: Thu,  3 Jul 2025 17:11:43 -0400
Message-ID: <20250703211150.135320-6-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703211150.135320-1-michael.j.ruhl@intel.com>
References: <20250703211150.135320-1-michael.j.ruhl@intel.com>
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

