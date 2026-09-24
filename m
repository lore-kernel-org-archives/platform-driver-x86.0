Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EC44AEBDA;
	Thu, 24 Sep 2026 18:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790274246; cv=none; b=g8n6ky/YOuXOkhhaluhs776CROQDdxpZXnggBBu73c1miqkcIEFKbA48c1phr3UIoWDTQFCq2qsSziP2f9juh7igLcNOGQ/6m8gK5N1PCxfCaEeWoTJ+5HkqvLQyDpIKwHJOeeKZkcH+h7bIAZ9iksJ6NZpU2J/dqSOFur36M6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790274246; c=relaxed/simple;
	bh=TKLJqwOdfqdczTZY63mKSLHqDkP1wnzAjiDjiaAxGBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PgxafzXJW26ysGibtZwWmqvTchMoMPZ8h7UKxKgyB87V/+isJE8kNQImpN5MLUxGAZwvW1u54MdjkiKRa6PQKX8oBI6B8uizkTdR0FB0KBYyG3LTIQATXgvme2SP/O4WstTDwS20zNONjt9ruBVX7PmCpxjMvNpBhY23/FMxeiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IJfB4oT9; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IJfB4oT9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790274244; x=1821810244;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TKLJqwOdfqdczTZY63mKSLHqDkP1wnzAjiDjiaAxGBc=;
  b=IJfB4oT9Gin+OdLh3YqdwBf9YzeWxjUPebMF4l5vTROG5Y+of5qQBDpq
   ybXLTDFbb/sBddFMfKZ+i0AWFahrvg2Lu5f3ep0YxuSA9iISpkr/HVd1v
   ZlZDH7h2dvH72ogjtdzHPxy4ZBzp7JYVDF49sXb121Aw0K1QfGU0LmR5H
   JISAErjngKIskmN6MnrDbXWpXPavhg77ALjB/nj2lXqjEj9Ab2MitUsXI
   bQmedb1tx+IA36ZN2rgFDFc0Eaz92OsMEw/Jm0bl8Yl+1AQWgSikDrrZ0
   UucJkHa7JlYWO8EbHc8tSRoGuZf44oRPGT3IFPN8QNculbkBYVXhfepG4
   Q==;
X-CSE-ConnectionGUID: 6np00RRCR+6xigqLcMaOrg==
X-CSE-MsgGUID: SVrFVbQtTQKP6SbM+9J2Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="91164268"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="91164268"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 11:23:45 -0700
X-CSE-ConnectionGUID: ivim3CNTSDCb+01Wh6O+bA==
X-CSE-MsgGUID: j1Q0Z7tTSVu4PspSHtvpmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="272229928"
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
Subject: [PATCH v2 07/19] platform/x86/intel/tpmi: Drop unused arg from tpmi_set_control_base()
Date: Thu, 24 Sep 2026 11:23:29 -0700
Message-ID: <20260924182342.212709-8-sathyanarayanan.kuppuswamy@linux.intel.com>
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

tpmi_set_control_base() takes the device for its devm_ioremap() from
tpmi_info->tpmi_dev, so the auxiliary device argument is unused. Remove
it.

No functional change.

Co-developed-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
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

