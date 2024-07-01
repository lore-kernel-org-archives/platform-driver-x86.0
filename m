Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547321607B6
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jul 2024 14:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719843469; cv=none; b=AbSPYYqF1h2m2iuQFoH3KgJJFm/xqASxvj2ownmGZeDGAv3hf3X2WR+kxqrzVUi1Gd14lhhvK6z2RzfXtR/5z3+S9fb0M6xNNmGfuZOZ9yUz+vUu6Avay4NQ7a8JAQ4t8jUdDRoy5uyPkS7YdTA938GXqHHi0Z71SOvAmPp4w8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719843469; c=relaxed/simple;
	bh=iWmBheQcG/fLfGZy16zrirUOv2wYieYGxwAmLOi5TOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iw3iGN0cjqIh6rsnx84G5kE/BqJunkGTYeyO/II2OL9ClLMcl8PD4y9AYyMiwZ0Te+U+JnxSEV0Ia8N1UBm7lj3mn0UGKuwQ0n+rmt46TbVyMaBOshx2tsNNcq4Z13HT0mumQ6Ak3P6j2kppBSWT/YIC4NqeR1nHkhUJbyF/C7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qf9nfZwx; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qf9nfZwx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719843468; x=1751379468;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iWmBheQcG/fLfGZy16zrirUOv2wYieYGxwAmLOi5TOQ=;
  b=Qf9nfZwxvJuDW6i1skNZgL8NWWjSKYktRQIcgNwoHdr1kOPzm2tqEeKG
   WOtCOqFrTyPeK6gpWoCzKE3bR42s3b4S5q6IpT0UiP40m2Bpt2wbptT6D
   97fx+5EGv27mviy0ba/JADtBgDLAHU6ujT3U0VqozwhpTeZE09vyE6OVk
   2r4NNK32uvEi9hTndZvw4rKAKaIWjPQ7t3h/BKtl54ohv5JiuogYr6bCB
   u+41+49u5hRB05hlv5OS94ktdpD5ozLJPHJEeAr/R4GqU6TXOtkjrAatu
   ZdmwX0y9DU8vEyl5KEzq8ksmeaNnuiMjihOYfoLOVPLbAhUcn+Ju6ip/i
   Q==;
X-CSE-ConnectionGUID: yx69F+vuS5m/OfKD4uoiAg==
X-CSE-MsgGUID: F59ObFlYSCq7Ii0FE6tVrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="27566460"
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; 
   d="scan'208";a="27566460"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2024 07:17:47 -0700
X-CSE-ConnectionGUID: lVQupNxTSiu0twdLXX20Ug==
X-CSE-MsgGUID: JSzfY79eRjKntUa2zY0zbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; 
   d="scan'208";a="49880742"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2024 07:17:46 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	david.e.box@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	matthew.brost@intel.com
Cc: michael.j.ruhl@intel.com
Subject: [PATCH v5 2/6] platform/x86/intel/vsec: Add PMT read callbacks
Date: Mon,  1 Jul 2024 10:17:23 -0400
Message-ID: <20240701141730.3585133-3-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240701141730.3585133-1-michael.j.ruhl@intel.com>
References: <20240701141730.3585133-1-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "David E. Box" <david.e.box@linux.intel.com>

Some PMT providers require device specific actions before their telemetry
can be read. Provide assignable PMT read callbacks to allow providers to
perform those actions.

Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 drivers/platform/x86/intel/vsec.c | 1 +
 include/linux/intel_vsec.h        | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel/vsec.c
index 2b46807f868b..7b5cc9993974 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -212,6 +212,7 @@ static int intel_vsec_add_dev(struct pci_dev *pdev, struct intel_vsec_header *he
 	intel_vsec_dev->num_resources = header->num_entries;
 	intel_vsec_dev->quirks = info->quirks;
 	intel_vsec_dev->base_addr = info->base_addr;
+	intel_vsec_dev->priv_data = info->priv_data;
 
 	if (header->id == VSEC_ID_SDSI)
 		intel_vsec_dev->ida = &intel_vsec_sdsi_ida;
diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
index ff7998cadab4..003301783331 100644
--- a/include/linux/intel_vsec.h
+++ b/include/linux/intel_vsec.h
@@ -67,10 +67,15 @@ enum intel_vsec_quirks {
 	VSEC_QUIRK_EARLY_HW     = BIT(4),
 };
 
+struct pmt_callbacks {
+	int (*read_telem)(void *args, u32 guid, u64 *data, u32 count);
+};
+
 /* Platform specific data */
 struct intel_vsec_platform_info {
 	struct device *parent;
 	struct intel_vsec_header **headers;
+	void *priv_data;
 	unsigned long caps;
 	unsigned long quirks;
 	u64 base_addr;
-- 
2.44.0

