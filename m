Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB99198E7D
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Jul 2024 12:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721910156; cv=none; b=Muf5oIS6Vj2gaBAkRRzvYh7KjwqhlkOdqpQPpDuGFRj1+wU6LoeOMwXsLVEt3z85nWCnMz12275/OTbW4utSl6W9NIFf0eF0Lz0A94bc4fi3qs8nA7actBmB6BUScIW3RClZUk9UxpQeqSOGqlw1HA0Gv9G7Ug/GxKgC3Sk2MTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721910156; c=relaxed/simple;
	bh=wyN+6vlgHGDP8X6HQQjWIl85e1yzHPrW2QH2cE5m7Yo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YV+xMCQwqCHTQznJZgvSNZ3h9xMj0k+6bXW9MAIwCfTZ/M0YHmB5Qprfd4sTVV6Y2+lduWr990xieNGuoRn1Tk68fWH7cZ7b4pEcZoo5ZN6zNpA53O9x+1YUdMdbbq0YwBZM3aqFJaS3BxOmuX+Qyegq7Slc86IBKww3DyLkPl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CXYj82xD; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CXYj82xD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721910154; x=1753446154;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wyN+6vlgHGDP8X6HQQjWIl85e1yzHPrW2QH2cE5m7Yo=;
  b=CXYj82xD0T9qkJVe37fjo0CauErWSdUY/YBSzNNqmJwOibl+oL8+vRiJ
   cHhQ6iOfU/egG0lRqDXx0/mrZ+djTKY1mJemRwTPIQpB7HnxA0q5ul2l9
   FE5Sb0MyyOf17EL3aB769QZ8TSvU3x40PeC4CzCmt1jwOhDAiYnwsk5qT
   4+06HCsMnCfPO5da5ZccHyQw1W6urfvY/+JtAHsGqBRAc0+VDv4p+iN+k
   bdshL1Z2nA/eUcEmws7dz3IFwV9ICFLj2W4xPt5E5PH3WFVZ55miwt8Rw
   CiGnpQW+brD1Kp/FLDMu4X35gs5rOpLSq4sNwtDhNDihGYYawlQ/swv4s
   A==;
X-CSE-ConnectionGUID: lFxwTB9sQmy5lRQsoaZ2Bw==
X-CSE-MsgGUID: D07fqTCNSl2XUzzM3s4kuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="31060759"
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="31060759"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2024 05:22:34 -0700
X-CSE-ConnectionGUID: kY3U4MGWR4CilLeRwDjvLA==
X-CSE-MsgGUID: dPPv/otuSL+EG3OG0h4O7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="52786196"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2024 05:22:33 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	david.e.box@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	matthew.brost@intel.com,
	andriy.shevchenko@linux.intel.com
Cc: michael.j.ruhl@intel.com
Subject: [PATCH v8 5/6] platform/x86/intel/pmt: Add support for PMT base adjust
Date: Thu, 25 Jul 2024 08:22:12 -0400
Message-ID: <20240725122214.4063886-6-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240725122214.4063886-1-michael.j.ruhl@intel.com>
References: <20240725122214.4063886-1-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DVSEC offsets are based on the endpoint BAR.  If an endpoint is
not available allow the offset information to be adjusted by the
parent driver.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/class.h     | 1 +
 drivers/platform/x86/intel/pmt/telemetry.c | 9 +++++++++
 drivers/platform/x86/intel/vsec.c          | 1 +
 include/linux/intel_vsec.h                 | 3 +++
 4 files changed, 14 insertions(+)

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
index c9feac859e57..88e4f1315097 100644
--- a/drivers/platform/x86/intel/pmt/telemetry.c
+++ b/drivers/platform/x86/intel/pmt/telemetry.c
@@ -78,6 +78,13 @@ static int pmt_telem_header_decode(struct intel_pmt_entry *entry,
 	header->access_type = TELEM_ACCESS(readl(disc_table));
 	header->guid = readl(disc_table + TELEM_GUID_OFFSET);
 	header->base_offset = readl(disc_table + TELEM_BASE_OFFSET);
+	if (entry->base_adjust) {
+		u32 new_base = header->base_offset + entry->base_adjust;
+
+		dev_dbg(dev, "Adjusting base offset from 0x%x to 0x%x\n",
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
index 11ee185566c3..75d17fa10d05 100644
--- a/include/linux/intel_vsec.h
+++ b/include/linux/intel_vsec.h
@@ -88,6 +88,7 @@ struct pmt_callbacks {
  * @caps:      bitmask of PMT capabilities for the given headers
  * @quirks:    bitmask of VSEC device quirks
  * @base_addr: allow a base address to be specified (rather than derived)
+ * @base_adjust: allow adjustment to base offset information
  */
 struct intel_vsec_platform_info {
 	struct device *parent;
@@ -96,6 +97,7 @@ struct intel_vsec_platform_info {
 	unsigned long caps;
 	unsigned long quirks;
 	u64 base_addr;
+	s32 base_adjust;
 };
 
 /**
@@ -121,6 +123,7 @@ struct intel_vsec_device {
 	size_t priv_data_size;
 	unsigned long quirks;
 	u64 base_addr;
+	s32 base_adjust;
 };
 
 int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
-- 
2.44.0

