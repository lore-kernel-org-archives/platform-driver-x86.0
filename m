Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795486084;
	b=xLUqqUq7U1QqDGuIc9w6UQKvpjYuQi9KCRqls+uJV9Fu77vT8lr/dH/+k2SVnwh0q2Fu
	 tvoSy8ieUGmKxGlrE/1MNjh2Cn0AU7utgKG8lDHy8xTqtITIGt6LQ13YHfCGvb08Q6wzc
	 p066D90aPbDjfIWn6tAK6gmohuqsfUWLszwr55EIcndwAA3kCG1s5tnfQAhsTZYjGrEok
	 fjt/bpUClh8ql5FEESRJ0iiTUFeRJcpn+SGe6sZNt5NN8q8A9wnEOv/Vz58SzM8p3jDhE
	 uAYVa3MLn1dyN/cnNqNWaThJfzbJc4VwnW3+B+ZJrjSNtawvGVbeJABXs98ImNFL5BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795486084;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2R8fUtkHRgiGFJQf3DY3pQz4IdLYWUFpoKdpHfxjYXc=;
	b=PHezPbMAEnUzizuwXlQgy+/NLtDH/oBA7F0C4c1GoI+a0TuVIvUHasrj7S89LtZG4G5E
	 huLodtMA2snH727glgm6WH8toIkNMY2FNynpKLK2DJP6EL1qEN/FcPBtJBnG4yioKucxk
	 zmhcApi7+AvRSqb+720X3evYoUBMBzwYgIo871grOidBP4Lkv2AZlR00IiYORrk3YCbhi
	 R8y1O6+4wXdTSLMW4mzUxS5Atv8SMWOw+ebzMXHqzZGrwXeQBRybhJ07U/k+AKB8k9zft
	 i2mBg5mscrfXDP9dTK6SOn1ErQycG/bfPDAfMCQwdM+Rp/cOmD0zO95HWKSxhoWAEDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q5KhNkhW;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B48606A31E
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 02:08:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66B48606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q5KhNkhW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795486084; x=1827022084;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=j/8SX9BL9aGZ1vpMY3X3ia+baJyEjngmgUxNxy5GKyo=;
  b=Q5KhNkhWBuPylJbuNDgIInTNFwyAw4Kt4HtLs1Yq3ujEu0ZU5DkYCVHk
   iulecFGROBVMJuhgT6Zzq5iVlpcqQLcvVuNMt4q0ECr0ShDk/aHBEH6cz
   FchvmQo6zWU2EXdZczO3wgZXOh1nRBp9AhtVpvo5xdOdNwIKeWIiSip/N
   8u9vD/WruWLwTLuhWuLqef4ayzXKWpb2r0FEsYOSKvJ5sZCr/FjvsQGR4
   fLhUuwFaiKRoL69n2N9IZrLYf8YPhjryMkMxBve1iQKPhvhFADo/yy8Bo
   uLAxKu8IixzsdUiBapfgqcdJmqieA1yLqo8+ra6y+Qd33hrdbt4MMjlgs
   w==;
X-CSE-ConnectionGUID: kujlru1dR/ebj/nzYKzoyw==
X-CSE-MsgGUID: of06+KPmRliyNJe3UEWLpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4153485"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4153485"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 18:08:03 -0800
X-CSE-ConnectionGUID: r7sVjlbRQAK0X4i8lAqTkA==
X-CSE-MsgGUID: f43ajjXmR3yCj3PJcoOw6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11621404"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 18:08:01 -0800
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
Subject: [PATCH v23 01/19] platform/x86/intel/pmt: Introduce a callback for discovery data
Date: Mon, 23 Nov 2026 18:07:53 -0800
Message-ID: <20261124020752.30551-22-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124020752.30551-21-michael.j.ruhl@intel.com>
References: <20261124020752.30551-21-michael.j.ruhl@intel.com>
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

A further difficulty is the read_data path requires a GUID which will
not be known until after discovery, so the current read_data callback
cannot be used.

Provide a callback that uses the capability and discovery index, for
reading discovery data.

Reviewed-by: David E. Box <david.e.box@linux.intel.com>
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

