Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DACA199E8B
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Jul 2024 12:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721910151; cv=none; b=PtD1+gOWPa07+7XsGO/FuvAoXzpeaNQ71nycBdGq6EjMfFXsEkzYZjqZtITsJscilCMsym28J2oKPo/TNaVu0Lz0gu7Tya1Qaa8Ntpb6X09NZ4ZjojdhA36MutOk9pL4k+JAsppI07xACHhZFjWnJFqgISJdWdogXbtdrNzjxwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721910151; c=relaxed/simple;
	bh=1FyhjEujvcHbnTpXOjI5J/XRQNsLRqw6RVYF/BcYzR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H0tbb0ftWsNDK0TdL+pPupWpLpApxcidrg7Ipzw4aUGVMV67ePmbkReUJ8B9Qbh+L+oed5CAPW8xaW/ApH5c1ed7Ljhax1H04j6a/9kQlVhMaV+YHaygAEa4HMY0euw9TYjZlH4YnaKq8L2FBUVnzc2tdzrZ3zf/A5MWOuvhYYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XDytqksk; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XDytqksk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721910150; x=1753446150;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1FyhjEujvcHbnTpXOjI5J/XRQNsLRqw6RVYF/BcYzR4=;
  b=XDytqkskqnhqEQt8fl/H8o5VlopFFE49TRJhM2Xw69OQhD7nVD/dgleE
   qyzaRHknSqV/gv5bh8awqkvknl9dDQs4WBW+ggWpb+/LMtia+Q0iX5zm6
   lwBJznZJsl7jqOk+givpBIcnPEQvn5Z4NhgO+X48ylYO4ug+R+BB3Aw9N
   xTO9quMpLx37r/invh4H1K4nOVe4oDJkgA2dco7BX/SSt51iPrrITp6Ky
   qpdClteuCaT9+xMKxCs2Nk1se8hS+0xXk5y/nbrEHWRvBWidwW5e9+IXH
   s1xZPh888OoO057aUlIGhTxeCQ1lqWMM1XWnm3YFbk0u33+8Wk2ZCWuan
   A==;
X-CSE-ConnectionGUID: LJhRuIkISdC6P+UeucG4DA==
X-CSE-MsgGUID: jpq80HZtTAuUPs4Q8/QRWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="31060752"
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="31060752"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2024 05:22:29 -0700
X-CSE-ConnectionGUID: D1EAH+kQRcOrClCBjB0nQQ==
X-CSE-MsgGUID: mCqjTdh5SeG10cWVYC8JTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="52786161"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2024 05:22:28 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	david.e.box@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	matthew.brost@intel.com,
	andriy.shevchenko@linux.intel.com
Cc: michael.j.ruhl@intel.com
Subject: [PATCH v8 2/6] platform/x86/intel/vsec: Add PMT read callbacks
Date: Thu, 25 Jul 2024 08:22:09 -0400
Message-ID: <20240725122214.4063886-3-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240725122214.4063886-1-michael.j.ruhl@intel.com>
References: <20240725122214.4063886-1-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: "David E. Box" <david.e.box@linux.intel.com>

Some PMT providers require device specific actions before their telemetry
can be read. Provide assignable PMT read callbacks to allow providers to
perform those actions.

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 drivers/platform/x86/intel/vsec.c |  1 +
 include/linux/intel_vsec.h        | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

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
index 6495e37c9079..11ee185566c3 100644
--- a/include/linux/intel_vsec.h
+++ b/include/linux/intel_vsec.h
@@ -67,10 +67,24 @@ enum intel_vsec_quirks {
 	VSEC_QUIRK_EARLY_HW     = BIT(4),
 };
 
+/**
+ * struct pmt_callbacks - Callback infrastructure for PMT devices
+ * ->read_telem() when specified, called by client driver to access PMT data (instead
+ * of direct copy).
+ * @pdev:  PCI device reference for the callback's use
+ * @guid:  ID of data to acccss
+ * @data:  buffer for the data to be copied
+ * @count: size of buffer
+ */
+struct pmt_callbacks {
+	int (*read_telem)(struct pci_dev *pdev, u32 guid, u64 *data, u32 count);
+};
+
 /**
  * struct intel_vsec_platform_info - Platform specific data
  * @parent:    parent device in the auxbus chain
  * @headers:   list of headers to define the PMT client devices to create
+ * @priv_data: private data, usable by parent devices, currently a callback
  * @caps:      bitmask of PMT capabilities for the given headers
  * @quirks:    bitmask of VSEC device quirks
  * @base_addr: allow a base address to be specified (rather than derived)
@@ -78,6 +92,7 @@ enum intel_vsec_quirks {
 struct intel_vsec_platform_info {
 	struct device *parent;
 	struct intel_vsec_header **headers;
+	void *priv_data;
 	unsigned long caps;
 	unsigned long quirks;
 	u64 base_addr;
-- 
2.44.0

