Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB0E3EFFA9;
	Tue, 22 Sep 2026 18:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790101998; cv=none; b=g+8BdA2ZKXrPWf+chs7vqYwrrs8T4a35Hm6SIdMjQk1ITwGoX+k87PxVvShdDjROeuN+fhB82pbYs9FJsCyPiwaon0XaTJLa3mLLcN3KLG+bGsZQFgNxrR4no7V/UQ7Ghrj/uxFCRWVjBZqS8OLrDVfaxHPcZW9RXAN8edm+Eik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790101998; c=relaxed/simple;
	bh=1YKJlmNEPCE2F3n+VhEhSB9oLunKLzhg22mwoRQ9ck4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SDYWwSqqpQ5h7LhLxysS3NIbh59fUy4F6BbjtP+Iz2occU2lVOTc3K12uAmOLMljWjplGDwRt6/GwJk73MxNXSAnmY0dLl7GyMK0CUGtBZzoo5eZ+OiPcyTLXkQ4VL93PtGcSneCrxZb4kp4ZsD7s8dPQDuyUDLp64pH8OnLK4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jw0DWSfq; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jw0DWSfq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790101997; x=1821637997;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1YKJlmNEPCE2F3n+VhEhSB9oLunKLzhg22mwoRQ9ck4=;
  b=jw0DWSfqJx3S3+k7g6ev/eRowj4Rpn+wykHVMNYVxZEi3kDsrf3qY+5z
   lre4MY4iMSUj5VGuLhBpS68F6Eg2NfsGrWjvA8it0enyYLXvoHbmkAO8o
   IQO2vVS51yryNl1OVTDZyIbA2ItkkeJ8Grc6H4dk2kWqusbbLu4OwjWCn
   jHhTIzidhonceL+WdQYQ2oVZ/bqM3pbdDD68UWfzQnS9W3tkPdyR7g2q7
   Ug83Yk0UTw6YXWTibliAB25aASFLSo/DKHbbnzSd+uankpUWHs5qAc1kw
   qkk3BAnlpLdHboh4Y6YO1iF23bALm2afSXxhW0yD/XkLGg/ISFuHOC416
   w==;
X-CSE-ConnectionGUID: dJXlvRxJSEWuJLZt3wT3ww==
X-CSE-MsgGUID: 6Qkzt37ZRuKZxGSehDluRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="94564888"
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="94564888"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 11:33:15 -0700
X-CSE-ConnectionGUID: qBmUHQIdT/GiByPIpNcVVQ==
X-CSE-MsgGUID: VLOg46PzS1iNVaYE3mTaRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,117,1787036400"; 
   d="scan'208";a="271827970"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 11:33:14 -0700
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 03/10] platform/x86/intel/tpmi: Remove unused vsec_dev from intel_tpmi_pm_feature
Date: Tue, 22 Sep 2026 11:33:04 -0700
Message-ID: <20260922183311.3783010-4-sathyanarayanan.kuppuswamy@linux.intel.com>
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

