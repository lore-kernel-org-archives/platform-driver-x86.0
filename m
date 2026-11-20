Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795208155;
	b=mH/Ihs8YG89TqnF53xB6chpm6Kn/QbAbsKBSP4klPOyc1mZt4w0HYwLP4+Qcq9BthN85
	 0fI1cmYCv1v/B/UzqumBWUk+5LSbUPkM5/Zc58UvjNuNu+Fu5dpdc6uIg8jBnheQ4rULI
	 7Wq9C1il0DPS6o8IySffvI1pCjQQGjdEoaTtvLTb14fZIPTdPN//R1N3l3/6xM2Abn/qU
	 He1/AEqW6aSyrSyFy+acqRUMKIy0J9wU1fCPiLxtf/FILoYasDGMCgmXNlFsmN77tCC7m
	 91b53LdMdIRy+tzaPddhRYUxiiHRdlonqU6V/6MVi02uV1yvV5W7WcHlhT7spZSv7iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795208155;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xR1yaKW30K73T95DkryhO5eLCuL/LvhrqS1OtX8WqG8=;
	b=miuvVW6jXc5r6RsVBZOwHDl8/xFADthBg+rvO3LTneqaaEFhT5EM9GnDSQtpi7gSjhoQ
	 gVYHnNvW7hgP9R2vNvqe6pv2LK7LVpm8eiXV5f9FDH4MHgObHgQadZ0XzBFpvDB9i1sLc
	 aFFcXGSk5we2JyCV3gIb6AS9Ap9Z3qSkRXdMg+Oz+Xeni5KBa5n4NOtfd9A4U1fA+3N7O
	 NueHQ9Khpx5FHJMICzLmrP5vFchI2y0RpXFMnBJqwE0SXkl/yh0c9i0wVGXRCIvSZvCfc
	 KxnQ3jaWLxDDw/jqBl9J8B/CfxtmqkrU9Cr20otc4A9rxI9PnHPoTrwvMKfgeSh69Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DXhaNI1w;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6BD606A687
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 20:55:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E6BD606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DXhaNI1w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795208151; x=1826744151;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=UXF2DxyUOjVxj+Or9Q9UthjLgDRcnp2jzwsBYagh7d0=;
  b=DXhaNI1w4UZhhChpu3N7QpqPBNPM2svTjat45n6rCatZfkupJgGBOMQ1
   hfVfRspe2fnLcgT1Sk9RXcUVA3Ts7y37f3wg+655yKdyoDTwZ/DdOeW9o
   4vW1ccTuhoV4BvFDzbAThbh68QxQOxICb23RhJ0YQiUI4DCxKe2EOQDSe
   5yhwwwEi+AsQcdRmPvpxUM9BoPEhQNQ/AkMSalUJQSYxgSBv87FjOrUNJ
   KCWGcTczbej4a9vJfbdn9kx7uPap/R2DZ4fecdGW6mowRUONhBCHaKwbd
   ondGffO2GpcD52exMtn7hGnfE3et5mdt5i++WIOJt9JZVCXIIn6ME18HR
   Q==;
X-CSE-ConnectionGUID: RUYjLU8zRDieXJQJm2SpJA==
X-CSE-MsgGUID: dGY6rxTbQq2hx+qe4g+0Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4136344"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4136344"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 12:55:50 -0800
X-CSE-ConnectionGUID: FG5GUdZGRWmCsFFn48z1Zg==
X-CSE-MsgGUID: vD1xOFMGQIGi74Rn8rk5Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="10908690"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 12:55:48 -0800
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
Subject: [PATCH v21 01/19] platform/x86/intel/pmt: Introduce a callback for discovery data
Date: Fri, 20 Nov 2026 12:55:41 -0800
Message-ID: <20261120205540.1220643-22-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120205540.1220643-21-michael.j.ruhl@intel.com>
References: <20261120205540.1220643-21-michael.j.ruhl@intel.com>
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

