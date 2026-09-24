Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D684AD7E1;
	Thu, 24 Sep 2026 18:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790274243; cv=none; b=f36cNiyjjIXuJlhZJjQtr4WVxAnPMOMEVPhUuO9X7D5OoU02qcWjJLWaWc4pyoNZA4qFNNZ8ySeB/SU2OsM7QFmfUNxoRdOtlWE3oGhT19y3yphgnH/vMGI+Z9PAT4OL/holB8xyirnQnGcQPar6zdZzB93jqiqeq3DBMG77upo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790274243; c=relaxed/simple;
	bh=1YKJlmNEPCE2F3n+VhEhSB9oLunKLzhg22mwoRQ9ck4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cxUhJV8C7zRUmdcZ5UX45k7h6vixcRtElB0FLtNpcBSPOy2BiRESIhzUkwKLIhjRJNBSmYmldkPXTsdsAFoz5qYepT7SWYbxbLL1owNmcAeHpFI8YUueTHdOt5CBordhWwY/lYfmgfK/l5zGX/1kxXaNWarv/qaOEUa1XW/fnAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j4O5zBNG; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j4O5zBNG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790274242; x=1821810242;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1YKJlmNEPCE2F3n+VhEhSB9oLunKLzhg22mwoRQ9ck4=;
  b=j4O5zBNGXOpidF2mZ1brNXh8VfonlnU/BucnTTdp8MyD3JQY7QuA0eRn
   YSWcY3XS3KbecBRz+LgXklJxh6uwL/ZD0MofsBLa7Rao3F5FM1oPCJ6I4
   VstPb/cpcQ35RIMUnh8cZV08f/qlhIdumYcMgXGru9a6HT/OGI+UAU6gd
   YumjQkgIOd0O7f4h6WZahnkJ6sKM2lfoogoLctOVi+aIw6ia5+9Cl5Nwi
   ktTzw1T/1uXjvgjqBX3lEEDgorytAC7m6UpHQIYV2ByP2aI7g48tCm5pb
   5RJBMJYGAPynG4gjva0Ft7U15c8KMvlCQixGGJgl7Smt7Y0nP1vPQWwP4
   w==;
X-CSE-ConnectionGUID: FoHYqFu/QSm6CdEerFbCQQ==
X-CSE-MsgGUID: oWwmRx3GS7OkGJWdHsELHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="91164259"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="91164259"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 11:23:45 -0700
X-CSE-ConnectionGUID: 0DHdox4NRjikF2vRZ8DXsA==
X-CSE-MsgGUID: QsArMAiMRg2f/fnIOURGdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="272229916"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 11:23:45 -0700
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/19] platform/x86/intel/tpmi: Remove unused vsec_dev from intel_tpmi_pm_feature
Date: Thu, 24 Sep 2026 11:23:25 -0700
Message-ID: <20260924182342.212709-4-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924182342.212709-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20260924182342.212709-1-sathyanarayanan.kuppuswamy@linux.intel.com>
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

Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
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

