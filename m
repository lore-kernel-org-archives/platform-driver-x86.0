Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A4849CF43;
	Tue,  6 Oct 2026 18:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791311458; cv=none; b=jHwMtCJ8g+5W2X/BVkoTEqXH15A2TjQ3c5nu/lZzDckzLDasHfWGda2vgImM56G14aFn7P1Jjbo8AO8HJFgu6gtQlBIjsjBfbB2i2vbZ9HF70Lc2MYnSCEwXDXIMbOnl3vrywDLE/ucgf4B5O60wDpuLzPb7edRZdADWLkRAPD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791311458; c=relaxed/simple;
	bh=7bt6GgaH22XHsrurKLDr1PCvL8fb5Dc0kwTEPoHgn60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OOV/DSlARG+GDlpyqZcLFcHWlSe0XQX+QeVK1qkhDpbHXKXcriByLreOcLCBSKccgebdZQs92B3npu5BCUFnOPFZssqRdPaLL6HyxmirV8w+VDPGtORX40N4FpZFI1LXaX5PEUDfma0BAM64UjxX3Xaydn3KEFY1lxgBmpy8FAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JexwymiT; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JexwymiT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791311457; x=1822847457;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7bt6GgaH22XHsrurKLDr1PCvL8fb5Dc0kwTEPoHgn60=;
  b=JexwymiTVEk8VKOd3Q0Uk1PPw682/yOKvYLstqMueYMRDGP9zVo5Dt5f
   Ew/e5xtc92b37KqAk81nRBCA1diACmU7+MBDyA+yxqe8umo812di2g3p6
   fCitzp/6ej+8kWt5BJSItL8qmgvhyOim0xVbqLQJ9jc8V5KOwj7sbnDmL
   YYkk6rn/fKaSJjFAlWyaqJP8lYEpX1sKQ2t7AaDDCNelYfbz2ZRafgmp7
   sRFBUX/NxnUwWWXLg5GvXWSZ74I5A7Dl1jhzq2gFHASvIpLdHY2pZjigG
   Q3hL6J2Zhw1ADE009rXSxR/bVdrdBQdTQSKlXTNkVIBXRV13mKnMJBT8F
   w==;
X-CSE-ConnectionGUID: QHl3sf6HQVq3KfHgh/Y4CQ==
X-CSE-MsgGUID: NrdDWFrYQM6x9XNDoPZMPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="102591590"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="102591590"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 11:30:55 -0700
X-CSE-ConnectionGUID: 2meTCiRrRUq5f3yulaPRlA==
X-CSE-MsgGUID: Gs2EuWpdSB+4PuZpITmsbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="303500252"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 11:30:55 -0700
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 03/20] platform/x86/intel/tpmi: Remove unused vsec_dev from intel_tpmi_pm_feature
Date: Tue,  6 Oct 2026 11:30:20 -0700
Message-ID: <20261006183037.1507007-4-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261006183037.1507007-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20261006183037.1507007-1-sathyanarayanan.kuppuswamy@linux.intel.com>
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

