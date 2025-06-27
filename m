Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E6822D9E6
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Jun 2025 20:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751057024; cv=none; b=ZdHsg7bq20Cer65/G58365YnCeTrgWFzfRmrsgp74NjoEEcH7gHAkt1SGqfowwZHqy+kiVkfTrh1npS+7KD9HnnUWCWS1qsD0A2S/Ak0mIZ9ZkyiYCfhGlsGhEy1s/0vlztIQbTPglu7QIo+BZ5g5dACIUk/dk1lby5ggTnaqV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751057024; c=relaxed/simple;
	bh=SYAl1u/XRegt0ncYA3mE4OZP0Ai5tpa2Z4Lzp5d+OrA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=opbgbIeC5KTxGoTYfDREfLSj6O5pyw9V4Szkz5VGIMvaeasggkIhKxOF/em9/Ylz14/TNuo/FdB2m7LPf+X5dpmXWtU0TOtbw3Zfqu6ZqQ5Fr6NtWaA768TIh7IFTdxrM1lnHW3MO4XMdj1oriMyP4218rz1YtT2IxlyO9Zw9Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l0A8aLGv; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l0A8aLGv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751057023; x=1782593023;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SYAl1u/XRegt0ncYA3mE4OZP0Ai5tpa2Z4Lzp5d+OrA=;
  b=l0A8aLGvm/Aq1eDQv2+QnwG/YT96MwuOEDIxrhy4rDPmL6K0AaNw+HSP
   k2KEB73L6or/5Xfl8ca1TtuGa+9xYb3KcryVLnD2G7mdjvzo4axV1H6sL
   u+/lgmTHCiLbKHlUEbhjXE/FeiRpXJCSsuYVPVYZBnq4HkbfzH9HxRbZp
   5qeRPvvWZeVkA92Evsc7rMqBewIOIDWw2HV5izt5Nvmog2OAWKskWvvhT
   uulI252yvlsW/3EC2Rw5UeTJViNpbcyiYoz8oMqYH9tHNisSv9pb+bTHL
   myLmq6nvUSOxylN9OaX1C/RxfZva8sYpqE99O1Sww5Xpy10ielkH37QR5
   w==;
X-CSE-ConnectionGUID: hIpjKu2nRtetn52WZjtJPw==
X-CSE-MsgGUID: lHn4yKRkTnqutv8hwKfQlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="41003182"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="41003182"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 13:43:42 -0700
X-CSE-ConnectionGUID: Sxfy+H/lRguqGxyd/lZU+A==
X-CSE-MsgGUID: q12BhVtUQh+WLqqbMtz+Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="156938997"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.220.252])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 13:43:42 -0700
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
Subject: [PATCH v5 04/12] platform/x86/intel/pmt: mutex clean up
Date: Fri, 27 Jun 2025 16:43:13 -0400
Message-ID: <20250627204321.521628-5-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627204321.521628-1-michael.j.ruhl@intel.com>
References: <20250627204321.521628-1-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The header file for mutex usage and mutex_remove() cleanup code is
absent from this module.

Add the header file and mutex_revove().

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/crashlog.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index d40c8e212733..6e32fc1f8f1d 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -12,6 +12,7 @@
 #include <linux/intel_vsec.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/pci.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
@@ -262,8 +263,12 @@ static void pmt_crashlog_remove(struct auxiliary_device *auxdev)
 	struct pmt_crashlog_priv *priv = auxiliary_get_drvdata(auxdev);
 	int i;
 
-	for (i = 0; i < priv->num_entries; i++)
-		intel_pmt_dev_destroy(&priv->entry[i].entry, &pmt_crashlog_ns);
+	for (i = 0; i < priv->num_entries; i++) {
+		struct crashlog_entry *crashlog = &priv->entry[i];
+
+		intel_pmt_dev_destroy(&crashlog->entry, &pmt_crashlog_ns);
+		mutex_destroy(&crashlog->control_mutex);
+	}
 }
 
 static int pmt_crashlog_probe(struct auxiliary_device *auxdev,
-- 
2.49.0

