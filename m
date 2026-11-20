Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795141184;
	b=N36IfoyOFusQa9vAzrdDUY9C/au5hbrG5zahTM1DKgLZwFINv7Ha8VOLnjmDaURBkP4h
	 5Ia5vtwaYT+cvx0NJA+KkXseBKiaLIDDBVV6NxAwH8ZcJyaYspuJokIYMBt5Jj7BxkYXV
	 e5Kcx1m2eQqeVadTQuE6/hOILMEADU3dTRByDt029nV0s0uVuuW3cz86D6X3+J/lNoG0r
	 VCe6k52uPNyxu9iZnJ/7dPUe87WhoNkmwWLeFf4ggzQC2MzliiVU+4+jNtLq/mKxW0xHR
	 gwww59n6M5/AIWNpKUArHl/DiaYl5fpQPYFQ3rRwh94n5Odai1Z+YayUat+J4/wl/oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795141184;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WngzWktJtulCmSvjOXQHy7GOIGeKM7qn6tJWE6ublyA=;
	b=puZQO8cxa/WszyvYji9b7cNfqGtRbzjptwfjGSXJm7wgafjEfjQn40dFx9AU1vn0AMn0
	 yv6igXeOzX+14nq256UID7C7k8aRq/JYCnTfngBa6LTeYBS3UDglE7r6US8fNur9tDw8Z
	 ZmVXqnKAqTjRI5TxCHExqLf2gHf/BKN5VsOEQU3N/UJELvVYZVLk5DyhhxflPSWVEDkiA
	 fIRETvX6OCdF6vUWFpF5IuPfkGVk08U9A7u0f5F8sanIIhi2lFYVAQm14Tprv1yhNshvJ
	 D2ViAOtaFS47Xk/u1z+HtRIksS48hkiB3NlHj999U5d3avYLr3m43i6LQ2Dw3h3Op2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="MGH/JIi+";
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD49606A326
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 02:19:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FD49606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MGH/JIi+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795141184; x=1826677184;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=aD+ldafuLpQ+H40Tt1rTlY3EYmIeLGBrx2K2GTRuWxI=;
  b=MGH/JIi+uAvJBpOnecHVXaQ/vhT9OyYJusX9LDZNih+NppDOSk8HH4tG
   iQ0auR9Tc5MC526bMupHfo0Vty/MW06P4Z09Trp5uYJFR6V9Z1l/3DlwF
   J/9x+mqKHmMK5RdlxwQTGuNW48/97gAA+9zZKzt9EbcrihfplLIQSevo7
   qWXLhTVUcUwfmO+VNZrJN1oyc15xDD+N6y2LiOprUxSiyL3ZMLd/aUcR5
   8mD3+6sTFI7s42UEVDwsPvAyRF+IiftbpHgqLqKhVqrfhXs8g/1XOlGea
   5pt18/FMXn2K9CapCqokfQRTGu4YiXQcMujzqJla8zfs9Z8T3JSYv31iV
   g==;
X-CSE-ConnectionGUID: zTe/DW/BSdO+utqTaJ6RYQ==
X-CSE-MsgGUID: PGh3bbSXR2eGHHrGWnAe5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3898390"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3898390"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 18:19:43 -0800
X-CSE-ConnectionGUID: WGG3CB/VR4m0Klzt0cLwzA==
X-CSE-MsgGUID: srRUJbpyRqmOR5PcQo1+og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="10487090"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 18:19:42 -0800
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
Subject: [PATCH v20 01/19] platform/x86/intel/pmt: Introduce a callback for discovery data
Date: Thu, 19 Nov 2026 18:19:31 -0800
Message-ID: <20261120021929.473553-22-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120021929.473553-21-michael.j.ruhl@intel.com>
References: <20261120021929.473553-21-michael.j.ruhl@intel.com>
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

Crescent Island GPUs have a windowed access to discovery and data.
Because of this, direct access to the devices MMIO space can be unsafe.

A further difficuly is the read_data path requires a GUID which will
not be known until after discovery, so the current read_data callback
cannot be used.

Provide a callback that uses the capbility and disocvery index, for
reading discovery data.

Suggested-by: David E. Box <david.e.box@linux.intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/class.c | 18 ++++++++++++------
 include/linux/intel_vsec.h             | 10 ++++++++++
 2 files changed, 22 insertions(+), 6 deletions(-)

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
index 8686e79c4f75..e4afdb6478e3 100644
--- a/include/linux/intel_vsec.h
+++ b/include/linux/intel_vsec.h
@@ -94,6 +94,11 @@ enum intel_vsec_quirks {
  * * data:  buffer for the data to be copied
  * * off:   offset into the requested buffer
  * * count: size of buffer
+ * @read_discovery: when specified called by client driver to read PMT discovery structs
+ * * dev:       device reference for the callback's use
+ * * cap_id:    ilog2 of VSEC_CAP value
+ * * idx:       index to access based on the capability header enumerated by intel_vsec_register()
+ * * disc_data: PMT_DISC_DWORDS dword sized buffer for the discovery data to be copied
  * @read_reg: when specified called by client driver to read PMT state
  * * dev:      device reference for the callback's use
  * * guid:     ID of data to access
@@ -104,9 +109,14 @@ enum intel_vsec_quirks {
  * * guid:     ID of data to access
  * * reg_data: register data
  * * offset:   offset of register to write
+ *
+ * NOTE: Callbacks may be called from the client driver's probe and remove paths.
+ *       A parent MUST not hold a lock taken by the callbacks across the registration
+ *       path or while its devices are being removed.
  */
 struct pmt_callbacks {
 	int (*read_telem)(struct device *dev, u32 guid, u64 *data, loff_t off, u32 count);
+	int (*read_discovery)(struct device *dev, unsigned long cap_id, u32 idx, u32 *disc_data);
 	int (*read_reg)(struct device *dev, u32 guid, u32 *reg_data, u32 offset);
 	int (*write_reg)(struct device *dev, u32 guid, u32 reg_data, u32 offset);
 };
-- 
2.43.0

