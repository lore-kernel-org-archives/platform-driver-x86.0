Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EC24A4F16;
	Tue,  6 Oct 2026 18:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791311461; cv=none; b=J0yrZQQ77ldRIlWu4qed2Gzih8S8dfNybuMtrAH838YraUU72sNtpRDmNggVXIRHARqc3oRIBndMbbtwb9Rh4jD85BkMTqtp2zoFTQFM7gf4uWUQLp6qPXsg1A1b7W9vY5VvXROZ0u5Cd0bcUq9xWxSJMBqXkoET8SXL0kzAO5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791311461; c=relaxed/simple;
	bh=qczTg7GjWnxGdZ8gTIElaBsCzVknAhCBjadcl+ID/oE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KMpBvpyOTVX+//SxKtJPaZEnoXGCB98K+Euk5q1nQr/EACm6LiZz2l3APkavH430jr38iI+B6Frkowa8zbhlNKJiLwQdfjtLzhKiozpmgNT3OukQJALi7krmFLVgC/L+DUJDChuSx9pw84vBwRUrvAdRl9AqwH0FYCD3frswHUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fHyf44KX; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fHyf44KX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791311459; x=1822847459;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qczTg7GjWnxGdZ8gTIElaBsCzVknAhCBjadcl+ID/oE=;
  b=fHyf44KX8qPqirpXwEGqsajtCTAcGBSaLRO+SsLnhLPy4f2cbe2MciRQ
   DspwZPaeS+XnA7RIw6j4F8fVnmXaSIErcqqBJB7DzJwwDQp2f2IJBzXAt
   hBodgolPaDsfDONfHnPZZcjVjEuAUb3iZwpk1ZYW/lV8ZjCUzPnsZFnb3
   QJg2CYXQMhxFT6Vau90Psh6oTB4uCqnlUxg35eCefO57Glg5FgaIzCr1H
   oP3xdVTpwPWuWO9heunChqwKC6ZfR7157qJcnEMMaX7nliSNaJh+5kqmF
   rfeFev18iELORToPvjNz9yKebG7V7YAE0P4XeaLn+3jYUs+upbbvkSm4u
   g==;
X-CSE-ConnectionGUID: cydmnu3hSZmHPmOQXAQXKA==
X-CSE-MsgGUID: j21lo8nQR7mE9iFawUO/ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="102591600"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="102591600"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 11:30:55 -0700
X-CSE-ConnectionGUID: IJERSu8OSkmkOPFGUCgG2Q==
X-CSE-MsgGUID: fhf0jLozQhiyQoFMCLGfFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="303500264"
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
Subject: [PATCH v4 07/20] platform/x86/intel/tpmi: Drop unused arg from tpmi_set_control_base()
Date: Tue,  6 Oct 2026 11:30:24 -0700
Message-ID: <20261006183037.1507007-8-sathyanarayanan.kuppuswamy@linux.intel.com>
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

tpmi_set_control_base() takes the device for its devm_ioremap() from
tpmi_info->tpmi_dev, so the auxiliary device argument is unused. Remove
it.

No functional change.

Co-developed-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 drivers/platform/x86/intel/vsec_tpmi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel/vsec_tpmi.c b/drivers/platform/x86/intel/vsec_tpmi.c
index f3cd8aa30af0..f1dfe2b23c9c 100644
--- a/drivers/platform/x86/intel/vsec_tpmi.c
+++ b/drivers/platform/x86/intel/vsec_tpmi.c
@@ -565,8 +565,7 @@ static void tpmi_dbgfs_register(struct intel_tpmi_info *tpmi_info)
 	}
 }
 
-static void tpmi_set_control_base(struct auxiliary_device *auxdev,
-				  struct intel_tpmi_info *tpmi_info,
+static void tpmi_set_control_base(struct intel_tpmi_info *tpmi_info,
 				  struct intel_tpmi_pm_feature *pfs)
 {
 	void __iomem *mem;
@@ -809,7 +808,7 @@ static int intel_vsec_tpmi_init(struct auxiliary_device *auxdev)
 		}
 
 		if (pfs->pfs_header.tpmi_id == TPMI_CONTROL_ID)
-			tpmi_set_control_base(auxdev, tpmi_info, pfs);
+			tpmi_set_control_base(tpmi_info, pfs);
 	}
 
 	tpmi_info->pfs_start = pfs_start;
-- 
2.43.0

