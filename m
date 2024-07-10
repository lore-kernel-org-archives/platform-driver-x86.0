Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3656195FE0
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jul 2024 19:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720639389; cv=none; b=cznbJ+9S6sQnmScYnUmUOMRHNMRJqZDW58u4KfXZHaEsCOaGz3E2srs0RWDK5JPHRDpL7Fakf0fUDONQYyQf1KojHohFUvsP4kQguPdwmg+8bM2yLxRg/BsWJA1/YFHdTraDz3BkGHT/co69BEdbMdbkrTsLTen9AAKP5o0z5Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720639389; c=relaxed/simple;
	bh=jOSYaF+zNDJsbF67Ix39IMeN/8XcJ6KNXiF0ePJG56o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i8uGEaVF0bC1Zf1fIg0rorWPZPsL1f+Zn0alHUlO0PMHsmdG/4zwNOPeBBqxjrLDqLHLDk1nmFEsP0Lyp4mGM60nmB1VE49QvJbFKqEbo3D32BChYWdSoc8CYdxYe+t9SMuCrzcpeoN63rObiGufOjNATZBiJGYA/DCtAlUv0Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=niZ7PTZH; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="niZ7PTZH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720639387; x=1752175387;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jOSYaF+zNDJsbF67Ix39IMeN/8XcJ6KNXiF0ePJG56o=;
  b=niZ7PTZHG/yCXMK6L3NC98zo/BhOFA8hopqK/Anj4Yh/3HP+tmqKlPVs
   n1WKvjC/yJ4YwfIQN/zSUtPxVqXiAbeMOF+FZhoB7tvalMLlfOG3cMXPt
   WjuX1m0IOykot3Dkk6sAjqoeQ/FU1Bk8vsbnsmpNn5sp0oQeppAq5b2a8
   KVFSjKC3IG5oqm7C+jjAzhwVschIFdoVxShQlxtADNPz6DIzZww07ZjSD
   GY1oRGpw82KYr5rFfpLCqHaauhl0cx3YPu+RTJqJFNS3gMDxwT94/dj9d
   Ht2yqQx0mTlPXwe3kzqm+9OCnOWxJYvFj3EfpSJAslZmvyR346HfD2M1c
   w==;
X-CSE-ConnectionGUID: nNt2F1fGTCSwpo5uttoFBA==
X-CSE-MsgGUID: m6Rro3KtQyqrao5cgZnbYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="17856463"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="17856463"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 12:23:07 -0700
X-CSE-ConnectionGUID: 8VynDh5fQG+Q9avkqCDaZw==
X-CSE-MsgGUID: j2tJeuS6S+atSng1bttTQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="53483063"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 12:23:07 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	david.e.box@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	matthew.brost@intel.com
Cc: michael.j.ruhl@intel.com
Subject: [PATCH v6 5/6] platform/x86/intel/pmt: Add support for PMT base adjust
Date: Wed, 10 Jul 2024 15:22:46 -0400
Message-ID: <20240710192249.3915396-6-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240710192249.3915396-1-michael.j.ruhl@intel.com>
References: <20240710192249.3915396-1-michael.j.ruhl@intel.com>
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
index 4569a55e8645..1fd0fcc5615d 100644
--- a/include/linux/intel_vsec.h
+++ b/include/linux/intel_vsec.h
@@ -95,6 +95,7 @@ struct intel_vsec_platform_info {
 	unsigned long caps;
 	unsigned long quirks;
 	u64 base_addr;
+	s32 base_adjust;
 };
 
 /**
@@ -120,6 +121,7 @@ struct intel_vsec_device {
 	size_t priv_data_size;
 	unsigned long quirks;
 	u64 base_addr;
+	s32 base_adjust;
 };
 
 int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
-- 
2.44.0

