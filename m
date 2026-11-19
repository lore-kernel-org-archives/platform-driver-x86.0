Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795103696;
	b=Bl1gTZhIT6hpzNzf7guQBjzct0wNjMeLHVPQhSfy7dT5CJR0vb8T1ZgL98O/5oYlNmBB
	 x0OLm1SfVjXBNOsDJtTt2EVRZzUR7qMPQeAeXYkHUIwNW9QALBU9mO/V+flnaAhZAQ/4H
	 0TmY4jrKzUMT3VK1iC0/p2nXLkcy3q+KRUsqUJL02QuSqLY4tTq4pw0VpTIpnLQswlFO5
	 9Y+fofzZgDarm1aTeh7+0FJth48ecbfSVZsLJbTL468yWa+wtnj/RTj9FIRTPicFd9BB4
	 FrhVc5AIFPUbW02PRikvSSIBtdj224iXG8iPIGEMPbbLdhq8bgGA4Fvq7G0zwuaRSsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795103696;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PUzy19sm3KcLAVqCjccbmMklnguhr45m5/rGFT+PpC0=;
	b=CllePa2Wn25lRJL74Dk8DK4erJs19CTivUmAyzVlFFDuupZl3SgLk9IabJ3Ie6EHxoed
	 +xNAtVrZPgBMGdmz0mHuKWsQmUpMxPJ+Qm39SRvXf3hLNP+RJDvjYDcs9i5+5Aj7rZRU8
	 joP1k6lcuM1xwCtcaf20nwpiiH/S95wxTRcTXRplSmxuZpnPsEXk6vLfuvUoaJ9j//u5c
	 nRgYhPJOjm+4dybq0qE/cYFeFMzQ5/60L+CDqPVKDgeQkzbOMNXLHELSAs9d3lvVmZu1N
	 xHY957TyeKjmCsF6e5CGNKDYzXKielubzBm3eZI6R5ve0yTPo1GmspfR8UNdtENXtEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dbdxqS4J;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FD0606A32C
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 15:54:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6FD0606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dbdxqS4J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795103695; x=1826639695;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=uay/Cx0/k430084MsYY3VlYn1ElgrwCY9RQJnFYgDyE=;
  b=dbdxqS4JZpd0It0OkhbWgUDGMAcaYdPDDvq84Wu4NT9yJCA8+ktDwVkG
   Bws8eDm1DuBiwHu/OUtXIiJsBEzCB1L8lnw5xr5YZeGi7XKV138lh/tp4
   lKnuQU8vArgMnuO9OgZa4l/SR4WkGtQ8Rgrxg29tETazWcIPMocg4GEiG
   FuJA2jCWKpjPqQ+2LRDrQBcRONlWmrqeC+tqxYuhqwzQ/X7epWkLHEPI+
   fUh+keChfTkPQPhC3Rw09zzSmBvZp6Z8kVm9jzFqwZvwkCBUPb+vELRh/
   ImMdXbueuWQ+pzcn6KH55XMqiNp49pFTTYSfbO3HvEBzRcy/MosDxeVNV
   g==;
X-CSE-ConnectionGUID: ZblON4UCQs+e8j/4/aq5Mw==
X-CSE-MsgGUID: dHZcdXTPQtGJ2me26BbDtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3848951"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3848951"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 07:54:52 -0800
X-CSE-ConnectionGUID: fp+y50MjRyqblzGPgmbwMw==
X-CSE-MsgGUID: 6EPu8DFARDCmaEUv90ctqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10263373"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 07:54:49 -0800
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org,
	intel-xe@lists.freedesktop.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	matthew.brost@intel.com,
	rodrigo.vivi@intel.com,
	thomas.hellstrom@linux.intel.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	david.e.box@linux.intel.com,
	anoop.c.vijay@intel.com,
	badal.nilawar@intel.com,
	matthew.d.roper@intel.com,
	james.ausmus@intel.com
Subject: [PATCH v19 01/19] platform/x86/intel/pmt: Introduce a callback for discovery data
Date: Thu, 19 Nov 2026 07:54:39 -0800
Message-ID: <20261119155438.40762-22-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119155438.40762-21-michael.j.ruhl@intel.com>
References: <20261119155438.40762-21-michael.j.ruhl@intel.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some devices require special handling to access discovery data.

Provide a callback to allow for the special handling.

Suggested-by: David E. Box <david.e.box@linux.intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/class.c | 18 ++++++++++++------
 include/linux/intel_vsec.h             |  6 ++++++
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
index 2b11c4012f6a..601cdf68f0bc 100644
--- a/drivers/platform/x86/intel/pmt/class.c
+++ b/drivers/platform/x86/intel/pmt/class.c
@@ -466,12 +466,17 @@ static int pmt_get_headers(struct intel_vsec_device *ivdev, int idx,
 	switch (ivdev->src) {
 	case INTEL_VSEC_DISC_PCI: {
 		struct resource *disc_res = &ivdev->resource[idx];
+		struct pmt_callbacks *cb = ivdev->priv_data;
 		void __iomem *disc_table;
+		int ret = 0;
 
 		disc_table = devm_ioremap_resource(dev, disc_res);
 		if (IS_ERR(disc_table))
 			return PTR_ERR(disc_table);
 
+		/* Used by crashlog driver */
+		entry->disc_table = disc_table;
+
 		/*
 		 * The mapped resource is sized by the namespace's DVSEC
 		 * entry_size (in dwords), which can be less than the default
@@ -480,13 +485,14 @@ static int pmt_get_headers(struct intel_vsec_device *ivdev, int idx,
 		 * region.
 		 */
 		memset(entry->disc_header, 0, header_bytes);
-		memcpy_fromio(entry->disc_header, disc_table,
-			      min(header_bytes, resource_size(disc_res)));
-
-		/* Used by crashlog driver */
-		entry->disc_table = disc_table;
 
-		return 0;
+		if (cb && cb->read_discovery)
+			ret = cb->read_discovery(ivdev->dev, ivdev->cap_id, idx,
+						 entry->disc_header);
+		else
+			memcpy_fromio(entry->disc_header, disc_table,
+				      min(header_bytes, resource_size(disc_res)));
+		return ret;
 	}
 	case INTEL_VSEC_DISC_ACPI: {
 		memcpy(entry->disc_header, &ivdev->acpi_disc[idx][0], header_bytes);
diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
index 8686e79c4f75..400231989b49 100644
--- a/include/linux/intel_vsec.h
+++ b/include/linux/intel_vsec.h
@@ -94,6 +94,11 @@ enum intel_vsec_quirks {
  * * data:  buffer for the data to be copied
  * * off:   offset into the requested buffer
  * * count: size of buffer
+ * @read_discovery: when specified called by client driver to read PMT discovery structs
+ * * dev:     device reference for the callback's use
+ * * cap_id: telem, crashlog, etc, ilog2 of VSEC_CAP value
+ * * idx:     element to access
+ * * disc_data:  buffer for the discovery data to be copied
  * @read_reg: when specified called by client driver to read PMT state
  * * dev:      device reference for the callback's use
  * * guid:     ID of data to access
@@ -107,6 +112,7 @@ enum intel_vsec_quirks {
  */
 struct pmt_callbacks {
 	int (*read_telem)(struct device *dev, u32 guid, u64 *data, loff_t off, u32 count);
+	int (*read_discovery)(struct device *dev, unsigned long cap_id, u32 idx, u32 *disc_data);
 	int (*read_reg)(struct device *dev, u32 guid, u32 *reg_data, u32 offset);
 	int (*write_reg)(struct device *dev, u32 guid, u32 reg_data, u32 offset);
 };
-- 
2.43.0

