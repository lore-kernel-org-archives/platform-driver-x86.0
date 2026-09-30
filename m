Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F2F52120B;
	Wed, 30 Sep 2026 17:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790789391; cv=none; b=J1f69jUqSqazzQ92ltfic016sNK26h707jus9Az+aqaKAiHu4yK2uJP7hCniBxuvRoyptBVK4FKJ32sRhPf5GIB561/9tDVWcVBMNgNPQ9MUfL7tE92nzOEKnAs+IndM3sJxdBDZD5xONuy98A+KFrVQQ6sp9f6frjvISM9tJiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790789391; c=relaxed/simple;
	bh=6piNYR6VLVJCvaU0wFzwdmNOOj8z8qtZ5fcuLNAyMNo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qJgnOFE3WaCm3V0/rLeqMvmRt0fiQOEBhYyGsms55xdxsyotZY7FwcTYEmA8yu58S3xgZ0EfoOcQ1+oYQfh/Q1R4b0zQKtQjlJp25/e0GABhFBsGc766j9GCxe3SZR09na591ZeK80yHZYZ2OFR8+1SoETaou65vFeqfi4qq9v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dsCQOQD+; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dsCQOQD+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790789390; x=1822325390;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6piNYR6VLVJCvaU0wFzwdmNOOj8z8qtZ5fcuLNAyMNo=;
  b=dsCQOQD+i5F6ELnSabvgawLhuq5ch+7U6X6QlmQd546qeXiW1ybAutRh
   c3Sd/IecZFIRG8kzJdTXpzI3G+RDDqw26rIlBVQFcsx7SzzW8wfUqGyVS
   NaS+CF9b9p7h5jmMl2gVTT8Gznp2XtCOVDaIdHUGc1I8oVlOrcPIrQ3ez
   Ri5xr0fVyYrzRTEpMTUW3LQAuPn1tH0uHU1Y/a+WNovPqx2p2ogws+k88
   OSEe8SZnyqMaPqXE7L4FNFPdSjHXRD/DTwE2oHXHR4o03Ex5+qow5KSb/
   UWmRP9RbdF9JPqoVv2j1P8lgRc5kFCTxLK6dLIkrcwXd9ysTI/jr7dMq1
   w==;
X-CSE-ConnectionGUID: SBGWN4EeTL6VSy/Veir7+g==
X-CSE-MsgGUID: WW3gt/eSR9SoxgGUGmXLfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="91632088"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="91632088"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 10:29:35 -0700
X-CSE-ConnectionGUID: Ns5HbGTrRrqNvZ9Ow6MQmA==
X-CSE-MsgGUID: hc5yfI7WQ1yFUIRF749TxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="278959441"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 10:29:35 -0700
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 18/20] platform/x86/intel/tpmi: Use DEFINE_RES_MEM() for the feature resources
Date: Wed, 30 Sep 2026 10:29:15 -0700
Message-ID: <20260930172918.743656-19-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930172918.743656-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20260930172918.743656-1-sathyanarayanan.kuppuswamy@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tpmi_create_device() fills in each feature resource field by field,
deriving the end from the start and setting IORESOURCE_MEM by hand.
That is what DEFINE_RES_MEM() exists for, so use it.

The resources come from kzalloc_flex(), so the fields the macro sets
that the open coded version left alone, name and desc, were already
zero.

No functional change intended.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 drivers/platform/x86/intel/tpmi_common.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel/tpmi_common.c b/drivers/platform/x86/intel/tpmi_common.c
index 097754365897..91d8083fecc0 100644
--- a/drivers/platform/x86/intel/tpmi_common.c
+++ b/drivers/platform/x86/intel/tpmi_common.c
@@ -583,9 +583,7 @@ static int tpmi_create_device(struct intel_tpmi_info *tpmi_info,
 	for (i = 0, tmp = res; i < pfs->pfs_header.num_entries; i++, tmp++) {
 		u64 entry_size_bytes = pfs->pfs_header.entry_size * sizeof(u32);
 
-		tmp->start = pfs->vsec_offset + entry_size_bytes * i;
-		tmp->end = tmp->start + entry_size_bytes - 1;
-		tmp->flags = IORESOURCE_MEM;
+		*tmp = DEFINE_RES_MEM(pfs->vsec_offset + entry_size_bytes * i, entry_size_bytes);
 	}
 
 	feature_vsec_dev->dev = tpmi_info->parent;
-- 
2.43.0

