Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BB153FD40;
	Tue, 13 Oct 2026 19:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791919797; cv=none; b=e3oizF0Okf1Yh4dQwtPjZk6nF6xi20ZRiIBhxDFhtIcG5CW1oN4kO39iXERdSn01RD8s7giA5ywf9V8/UA5IDBJOYD3Lh+wFyOJ/HPcA7SXyydFQmcQROpArjWLgGOBH7dqo+Pj0shlCgJfMDhdkBqKLDbonogCse3UNaLgYnPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791919797; c=relaxed/simple;
	bh=7bt6GgaH22XHsrurKLDr1PCvL8fb5Dc0kwTEPoHgn60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vd3/5rsyN3JDHPzj7Lg5u7CaKxhgpAsu+nFdpIsqC2oZSrU4GHUd4o3bii8+f751LjBnXTOwX5YmyFhWb+5XHZPWwohiOVRuvFXoJnCXyUW0t8Zv/miLOApq6NB33i/duyzodNCb+Y/P4t0G9Bexjz/i+crToCkgu/ZOmVLrjes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xe5nHb5o; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xe5nHb5o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791919795; x=1823455795;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7bt6GgaH22XHsrurKLDr1PCvL8fb5Dc0kwTEPoHgn60=;
  b=Xe5nHb5oOOtiHe3PjvCOf50zY761mIDHtSB8kQ6wNXvIHDVrD4K09cMC
   7KbsHHywl+iMqA2BujdE9dKRL541fbLfOJARgD7V/P3W2wn43+9Lf8ZeJ
   Ig0vomJQGHC18qKZAL3XwrZgkaSeKYDNpsiFewFCA5ro/YQX68zubHO3A
   F+N+eA+ajYwUzAsGdkBZ7AZSdhaPZHjkIfhDKmQu1dBUaiXmfrekX8WUN
   YjPGEbyNaAULWQiOx3nrlc9Xarm/t8Ns2ARNUGK2WR5XDuB/yBteMBd0t
   6CZiP3YDFEtYlxg/mbb/ZVsClFWYMMW/WRAfZhXAR7jm+ywOLXoSVq4lF
   A==;
X-CSE-ConnectionGUID: fl9TNEoKQTK+r5ZkTswRpA==
X-CSE-MsgGUID: 7xfQbbuTQU+gRl1BkFmGEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="544113"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="544113"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 12:29:48 -0700
X-CSE-ConnectionGUID: xUUubSxfTASlKmnE9gQAAA==
X-CSE-MsgGUID: t5ay1jeOTheH+XjoUXv7mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1167661"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 12:29:49 -0700
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 03/20] platform/x86/intel/tpmi: Remove unused vsec_dev from intel_tpmi_pm_feature
Date: Tue, 13 Oct 2026 12:29:18 -0700
Message-ID: <20261013192935.2243291-4-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013192935.2243291-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20261013192935.2243291-1-sathyanarayanan.kuppuswamy@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The intel_vsec_device pointer stored in every PFS entry is never read
back. Remove the field and its assignment.

No functional change.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 drivers/platform/x86/intel/vsec_tpmi.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/platform/x86/intel/vsec_tpmi.c b/drivers/platform/x86/intel/vsec_tpmi.c
index edeae3fd23a1..fdca799f7cf9 100644
--- a/drivers/platform/x86/intel/vsec_tpmi.c
+++ b/drivers/platform/x86/intel/vsec_tpmi.c
@@ -93,14 +93,12 @@ struct intel_tpmi_pfs_entry {
  * @vsec_offset: Starting MMIO address for this feature in bytes. Essentially
  *		 this offset = "Address" from VSEC header + PFS Capability
  *		 offset for this feature entry.
- * @vsec_dev:	Pointer to intel_vsec_device structure for this TPMI device
  *
  * Represents TPMI instance information for one TPMI ID.
  */
 struct intel_tpmi_pm_feature {
 	struct intel_tpmi_pfs_entry pfs_header;
 	u64 vsec_offset;
-	struct intel_vsec_device *vsec_dev;
 };
 
 /**
@@ -767,7 +765,6 @@ static int intel_vsec_tpmi_init(struct auxiliary_device *auxdev)
 		int size, ret;
 
 		pfs = &tpmi_info->tpmi_features[i];
-		pfs->vsec_dev = vsec_dev;
 
 		res = &vsec_dev->resource[i];
 		if (!res)
-- 
2.43.0

