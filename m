Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516017640D
	for <platform-driver-x86@vger.kernel.org>; Thu, 20 Jun 2024 21:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718918479; cv=none; b=tzkV6OMAgQaQRaTT/nMLIiCgncyX4sbBivrFbDJ1GLLL5UsrUmsDL2pgrgsBGhkXGLTAdB6Rlr6zHCh1BPDHFzWXzuIS5NfJgaVUs4CeAakXf4xWdacarHLfJSPePCoDy3DC5PlXyoysEGNvQN4mvQxxz6aPyPzT15qVPdvHtLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718918479; c=relaxed/simple;
	bh=o7pgEsl1M4jkRAL2OMPP8br1xBPkYV2QP+YAJ1OanhY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OUGaOI+iFQSLJ/pocymRehsH/Ebb1VFoMTKyOynoMu5zDTsNg1msgEK5F07YjZUV/b7O5aKLQCF0gXA3Y+ckwZn1+XQUiz1QtD34mARxxTsamGW4slqKBIZwffPb2JAAjEDs5C2TgRYUrvGPfoxSFs7LydL+07C19oFkzcuQd5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GnYHGJYb; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GnYHGJYb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718918478; x=1750454478;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=o7pgEsl1M4jkRAL2OMPP8br1xBPkYV2QP+YAJ1OanhY=;
  b=GnYHGJYbHMkxKr2bRbbmu+pSctrcXVEpaBa8s9B7obGcVmg7m7S7OfZX
   HYbLFiPt7JLqXBrN/y5pEsvZnRvQA1qWLh3Vw2hCndavtfR1LGFQ49dhF
   SQdy+B+x3ZniZBJP1FhoEW4rFeikRndwzP9ClJM2IUDEs9akT72nHFLOg
   Z3vLhmtECgM581p/VWC57Ddfk8/RkiL+UkzB9hhCB8wUh4HeOfswr+Pqx
   tt853hOPewfvqRNzwtyZTkOv58r+7FfgLAo/cYUaYiZv473pRngMdpZu/
   ZP64FpTKRGmRcu3jgRogVQwiifHGcWJNkjdHDrtvEyDsxhEgBqwC1gRZJ
   w==;
X-CSE-ConnectionGUID: 25NnxNFKTs6q85rzxBrZag==
X-CSE-MsgGUID: kdTH6dmDQfmFMG+DMeKSRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="19811229"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="19811229"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 14:21:18 -0700
X-CSE-ConnectionGUID: rp1PzKjTSxu/zUzNxhyItQ==
X-CSE-MsgGUID: k9EnhowQSGG2v/xTrGfXKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="79883691"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 14:21:17 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	david.e.box@linux.intel.com,
	pavel.e.popov@intel.com
Cc: michael.j.ruhl@intel.com
Subject: [PATCH v2 5/6] platform/x86/intel/pmt: Add support for PMT base adjust
Date: Thu, 20 Jun 2024 17:20:49 -0400
Message-ID: <20240620212055.3314064-6-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240620212055.3314064-1-michael.j.ruhl@intel.com>
References: <20240620212055.3314064-1-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DVSEC offsets are based on the endpoint BAR.  If an endpoint is
not avialable allow the offset information to be adjusted by the
parent driver.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/class.h     | 1 +
 drivers/platform/x86/intel/pmt/telemetry.c | 9 +++++++++
 drivers/platform/x86/intel/vsec.c          | 1 +
 include/linux/intel_vsec.h                 | 2 ++
 4 files changed, 13 insertions(+)

diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x86/intel/pmt/class.h
index a267ac964423..984cd40ee814 100644
--- a/drivers/platform/x86/intel/pmt/class.h
+++ b/drivers/platform/x86/intel/pmt/class.h
@@ -46,6 +46,7 @@ struct intel_pmt_entry {
 	void __iomem		*base;
 	struct pmt_callbacks	*cb;
 	unsigned long		base_addr;
+	s32			base_adjust;
 	size_t			size;
 	u32			guid;
 	int			devid;
diff --git a/drivers/platform/x86/intel/pmt/telemetry.c b/drivers/platform/x86/intel/pmt/telemetry.c
index c9feac859e57..5c44e500e8f6 100644
--- a/drivers/platform/x86/intel/pmt/telemetry.c
+++ b/drivers/platform/x86/intel/pmt/telemetry.c
@@ -78,6 +78,13 @@ static int pmt_telem_header_decode(struct intel_pmt_entry *entry,
 	header->access_type = TELEM_ACCESS(readl(disc_table));
 	header->guid = readl(disc_table + TELEM_GUID_OFFSET);
 	header->base_offset = readl(disc_table + TELEM_BASE_OFFSET);
+	if (entry->base_adjust) {
+		u32 new_base = header->base_offset + entry->base_adjust;
+
+		dev_dbg(dev, "Adjusting baseoffset from 0x%x to 0x%x\n",
+			header->base_offset, new_base);
+		header->base_offset = new_base;
+	}
 
 	/* Size is measured in DWORDS, but accessor returns bytes */
 	header->size = TELEM_SIZE(readl(disc_table));
@@ -302,6 +309,8 @@ static int pmt_telem_probe(struct auxiliary_device *auxdev, const struct auxilia
 	for (i = 0; i < intel_vsec_dev->num_resources; i++) {
 		struct intel_pmt_entry *entry = &priv->entry[priv->num_entries];
 
+		entry->base_adjust = intel_vsec_dev->base_adjust;
+
 		mutex_lock(&ep_lock);
 		ret = intel_pmt_dev_create(entry, &pmt_telem_ns, intel_vsec_dev, i);
 		mutex_unlock(&ep_lock);
diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel/vsec.c
index 7b5cc9993974..be079d62a7bc 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -212,6 +212,7 @@ static int intel_vsec_add_dev(struct pci_dev *pdev, struct intel_vsec_header *he
 	intel_vsec_dev->num_resources = header->num_entries;
 	intel_vsec_dev->quirks = info->quirks;
 	intel_vsec_dev->base_addr = info->base_addr;
+	intel_vsec_dev->base_adjust = info->base_adjust;
 	intel_vsec_dev->priv_data = info->priv_data;
 
 	if (header->id == VSEC_ID_SDSI)
diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
index 003301783331..930eab246fa1 100644
--- a/include/linux/intel_vsec.h
+++ b/include/linux/intel_vsec.h
@@ -79,6 +79,7 @@ struct intel_vsec_platform_info {
 	unsigned long caps;
 	unsigned long quirks;
 	u64 base_addr;
+	s32 base_adjust;
 };
 
 struct intel_vsec_device {
@@ -92,6 +93,7 @@ struct intel_vsec_device {
 	size_t priv_data_size;
 	unsigned long quirks;
 	u64 base_addr;
+	s32 base_adjust;
 };
 
 int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
-- 
2.44.0

