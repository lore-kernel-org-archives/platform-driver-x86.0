Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF12B4915AF;
	Tue, 22 Sep 2026 18:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790102001; cv=none; b=sdtV8XQvXMCJM2xHbK3vfwwrRu4mLkbpuAgOX3Ah6qz7mT99pezJfYCm/5FYgrgmWguxkwty/1azkE7Cs77xyIecX2oVJm4rPKEu5xIY/2yfUoYjozW2b0zyR4aDuJJWM9riatrsu8xrR5wHRwrHdXqRj/yTkWmkFcvbZ6lTgDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790102001; c=relaxed/simple;
	bh=TKLJqwOdfqdczTZY63mKSLHqDkP1wnzAjiDjiaAxGBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pSVCYanveoY6dAb1SyvilT378R8jhdsaCIPH9fz70PyUGNhbpFXMxshyS/z9ukT4o2R7yFaywbpRJEk3b6rThx5c6qKQW9r2op4JP342Ixit97YXssGkemMMhHWyyXdAdIdvCOPaEoZ2PNtHSTgHFjilo/3tYUdcWWc9Y41FwKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hjosn7EI; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hjosn7EI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790102000; x=1821638000;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TKLJqwOdfqdczTZY63mKSLHqDkP1wnzAjiDjiaAxGBc=;
  b=Hjosn7EIm2RRZpSECkkEo9TWu99EXCV4SIUWoflmUhaOX5EH5JHVXbPO
   342ORCaZWm0/HYtDJvAW6O+hU65xtopPIg6HoO8b29+9jwpT3qGyzlCVC
   RFi35ZbFu8LHhULAicdKdURwrC9AzqLL71pLyO1ghMbceEE7vxupIzC15
   6C0WWt7ANNINKxj4H04ahTzibQKPD2wQHHxjq43MzQYW7Wy1PhwC08BE4
   x/Z0zpnFD5yne7di8YTQosvY2julh1qdwcJjXsUnv+drdY3/p/HlGiAZs
   ibebjqyHUw/2Zzld1fB2URGvicS4yC0XZTQ6AvZVstKCJItHyj4vt+HH0
   A==;
X-CSE-ConnectionGUID: neujAO7jRuinZ6/BwMJ7EA==
X-CSE-MsgGUID: SGWsfOngQYWHzX5HzRCAOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="94564897"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="94564897"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 11:33:16 -0700
X-CSE-ConnectionGUID: B0lNkeUbRPywwyFbxzT6nw==
X-CSE-MsgGUID: vEBiotfzQEOySuYus6PpnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="271827990"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 11:33:15 -0700
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 07/10] platform/x86/intel/tpmi: Drop unused arg from tpmi_set_control_base()
Date: Tue, 22 Sep 2026 11:33:08 -0700
Message-ID: <20260922183311.3783010-8-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922183311.3783010-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20260922183311.3783010-1-sathyanarayanan.kuppuswamy@linux.intel.com>
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

