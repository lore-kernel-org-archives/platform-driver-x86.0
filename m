Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161BB541E61;
	Tue, 13 Oct 2026 19:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791919801; cv=none; b=hImmQGE+Z1Ghf/3vheqi5Z27Pb0AtLRmeQrsCYO82XwXze2lV9fQh7IgLOI4V4KnjdmP2uMTEnQaZNBJawVeCNNoAj9UQBxA8xN6e7fidPymxgo/hoQWTwUdiZOYo1xh+Zdm+KKRxnoiyMiF5ZWtAbcS3eR96Ud6PX78/Zb0qpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791919801; c=relaxed/simple;
	bh=qczTg7GjWnxGdZ8gTIElaBsCzVknAhCBjadcl+ID/oE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O9awgHKnZNPQBpocUM4qmUGpOc6rY/j65jNMf0snleq2H0xodOfz33d8yoJkpzAav8RFfN4GHKUJNsI3SKXzjLW0dqFYYK5HSu62DRDmLgQn27tvUNoqjstYQkYKNMpGVm9LZkRx5nM80/bM5Lhlq9ie9Y18Gn1BtbqXwO18MVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z03k4UhP; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z03k4UhP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791919799; x=1823455799;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qczTg7GjWnxGdZ8gTIElaBsCzVknAhCBjadcl+ID/oE=;
  b=Z03k4UhPpdEOB1P7enu3A/EcYZtD+TPNTCIXYgGFXbuf54oc9hyAFPty
   XqP5D9W1TVT82fUwUBI7dZwDZvi8IENw2Spcz9OUEx1q8p4ZOqlthP+o/
   WbYPzM/nYxWg0Q7Nqf8xhh+aQVSVpgBHGD020kAi3V4xWM45z4XxhLKIb
   ZPGrgimufS3pbxRMgEJGwT/1m6LD5MWy8lHFm41/3Aj12d2igthZfRYh2
   Wdw9CzyQRPzqe4btdMXEqMSBtfimIgHu6DNu3+GhPdQZCwz+CQvOD1+/B
   o6zTnTrgyJZqVDChXE+zSOdK73nUrD3jcWuOUeElLdskJf3IJEHW6SHl+
   A==;
X-CSE-ConnectionGUID: 24DAHdORT6GhoPLO3x8o6A==
X-CSE-MsgGUID: obqtJhb3ThK0DnQPVXRoRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="544122"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="544122"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 12:29:49 -0700
X-CSE-ConnectionGUID: S5ic9OpzTn6Rry4Dfrk4lw==
X-CSE-MsgGUID: r3Jo0HGjTqmKY/HXrDh9Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1167676"
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
Subject: [PATCH v5 07/20] platform/x86/intel/tpmi: Drop unused arg from tpmi_set_control_base()
Date: Tue, 13 Oct 2026 12:29:22 -0700
Message-ID: <20261013192935.2243291-8-sathyanarayanan.kuppuswamy@linux.intel.com>
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

