Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA8D19AA58
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Jul 2024 12:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721910248; cv=none; b=WoT+2akB6yX7pQkASkDI06V8QmC3FSQlembgvTsbHtyrmefw5i95W3lDR2SgLkwB7R9RVmJ9Fxc6Rg3Cj/iHaUlQ11D5Fh21/VWwyjjlHxy5duokIHiMlK75jjeHYDF7GkcPV30fF94n3jVbiLGHYnTzYJ3Ma+RQrkIIFN+YPjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721910248; c=relaxed/simple;
	bh=1FyhjEujvcHbnTpXOjI5J/XRQNsLRqw6RVYF/BcYzR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=saT0faX3RbP/nujy7MPKK27iwK7h5y4ly3PFVvKIFEDhzfcOn5PqM+J+dWtPxppCk96MxY3OWiuW6QkPuJtzo7LJW17k/1Z7kME0BgVx0/BzIlnrciTjjka2ITh81DNJ7WbaQHsg+xVYsFhsqeH/QW02XGSNzFYHTZCYcHt7N3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y19DMM7F; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y19DMM7F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721910246; x=1753446246;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1FyhjEujvcHbnTpXOjI5J/XRQNsLRqw6RVYF/BcYzR4=;
  b=Y19DMM7FriNbB+gpGAADaPOlaiC1lSjZ83lhQgjPjIORL+z+rSQ0tSW4
   jUUExQww9q71UQ8N/NxjUiP3XcpXjBAYVM+tLALU/iFYGJP8TAB3rwG1R
   n8oOrc0EqZkVl7hL+hkJTSXKh8I4GLa/n1RHec/hx9EFgVxaivR2yVuTk
   jxfWiwT5e/z+XBD0P0h99iwcKqjPmE1t/e1si0nzqJlwcMMdtPbI3pr9J
   VnWh2ZryxM/3UAfeHx1vb66UtBoxx2sckGZnVaL/UC5UlO/nga8G/dfxm
   yLcqf//8ayugay5xlQ97jU/ol6uxAbI7uywofQ33h5obVQW8bu7QAMpe9
   g==;
X-CSE-ConnectionGUID: m2GeI5caTpq7QXBHs6Veog==
X-CSE-MsgGUID: q9Dx9CW3SVqTSietTQUbHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19493168"
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="19493168"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2024 05:24:05 -0700
X-CSE-ConnectionGUID: ytgZNDtuSXyBEILGYLIrrA==
X-CSE-MsgGUID: fZ9UMVRaRwCKOApT2KqgSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="53153606"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2024 05:24:05 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: intel-xe@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	david.e.box@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	matthew.brost@intel.com,
	andriy.shevchenko@linux.intel.com
Cc: michael.j.ruhl@intel.com
Subject: [PATCH v9 2/6] platform/x86/intel/vsec: Add PMT read callbacks
Date: Thu, 25 Jul 2024 08:23:41 -0400
Message-ID: <20240725122346.4063913-3-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240725122346.4063913-1-michael.j.ruhl@intel.com>
References: <20240725122346.4063913-1-michael.j.ruhl@intel.com>
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

