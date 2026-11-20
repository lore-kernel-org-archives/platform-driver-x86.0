Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795208159;
	b=XOdT6IewyBQF9TY11iO5GkZlUbHITlq45jWTBOb6z8NYEtxA4yHndsYRgN2COJhrGEu/
	 BGdafu+IxZmekhNoonLmZmIlNVuCqj6FbawqDdZtOznSaqGR5U+S0PG+nOjNYx7yt45jG
	 jkqvoJZgtGiU060c+UkVMKqtr3UOl0BB3iNIWMvXEjzyCEWRxiVJFk+VbV3eNPYHDK4RW
	 DLsYo4y9edHzimh6EymDEXWZMX02rxONwy1j2QXLZyLnyGgY4duEbm676lCZdRTZ6uo/K
	 iuZp7fv40x0L4MFx1x4ngoYriDe19hOOFrUOvyOQR8SOSUf+WxhswAgSKYU7rA2sAkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795208159;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0l1Bzpc9zw5KbnrzQuTunx9lYtQSKDxuLKvRXakouWw=;
	b=sx8+WUfaoox3F4Q6BZAUyTJh1egBklxIjBT0dUQecn1reZ30AXSFfcyQM9GxH0IeLdcW
	 tMpitMl2LeBi05S5aHHg0NkH0lH6QWF0vxnPMlunp9cQeBPNRdcDIxGXu+IihQ8BmMzTg
	 SsVQDI3DlRiqx4pJrtKOsLP9pgKkDaKr6YwUu7bTTnj+snXCMwBf/iDVW7XoFnYVKhBJV
	 ojbzN7edpK9qg7iMWBfVxov6LVoZ8/xX4ZcCYdXhzAtWCroY1KtpDW1m3S4W7r3MfSGbW
	 duAcDhxpuEi8famIBS2ZzfjN1XMF8KlOZVnCFx3vusIIsScm/gBQS7OW2kU/6AZUioQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JOp2zxzy;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D97606A6B3
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 20:55:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34D97606A6B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JOp2zxzy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795208153; x=1826744153;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=vdYjeiryOcvMslvJXkQiNrklhhsQczKbeZnsj7m8VGE=;
  b=JOp2zxzynNXXTyeHP7K1TKHhcqcy6ZmMY170ygR7O0EGFmbTF7JLB7jT
   H1HjlzMejHCEG6xVAlqsQuq6E4yQPxcLXkbZMlY3+FEyH5p4/2BcSurK0
   J3EW0CqVbuwVjeCv9B5UyqGqW5YGy6iAiwBu3CAEbBZf+TflNk2GirWIo
   YXmgh0bMTYEEs8OgC5ARcYrWfQIgf1h0Ln3II1WeT6MUdfUBNSDqTyaj+
   ds+OvDGZDC5sxanlUoylvJaiPWzD44nlFvZtXJ8TMTx+kRvoYXPEAuRpD
   Enqkr/9nQrpJ6VYVKAx6AUV04rVG6GM7lEvwk3iEXRS4Y8CvZnK/tkwr5
   A==;
X-CSE-ConnectionGUID: IouxRMOVSrmMWjsAJ1kS1Q==
X-CSE-MsgGUID: fN+6fcKHQaCUIyZZU5KfLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4136349"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4136349"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 12:55:50 -0800
X-CSE-ConnectionGUID: iyZtqICnRgecUjYYHKkGqA==
X-CSE-MsgGUID: fVZhtIv7SQGLBjyAvTHeVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="10908693"
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
Subject: [PATCH v21 02/19] platform/x86/intel/pmt: Use the pre-populated header info for crashlog
Date: Fri, 20 Nov 2026 12:55:42 -0800
Message-ID: <20261120205540.1220643-23-michael.j.ruhl@intel.com>
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

Crashlog reads discovery data directly from the discovery table.

For parents that provide a read_discovery callback, this data may
not be readable with this method.

Update to use the pre-populated discovery data (disc_header), rather
than reading directly (disc_table) for probe.

Reviewed-by: David E. Box <david.e.box@linux.intel.com>
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/crashlog.c | 24 +++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index d7018b495217..e2af09732dd6 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -27,10 +27,10 @@
 #define CRASH_TYPE_OOBMSM	1
 
 /* Crashlog Discovery Header */
-#define CONTROL_OFFSET		0x0
-#define GUID_OFFSET		0x4
-#define BASE_OFFSET		0x8
-#define SIZE_OFFSET		0xC
+#define ACCESS_IDX		0
+#define GUID_IDX		1
+#define BASE_IDX		2
+#define SIZE_IDX		3
 #define GET_ACCESS(v)		((v) & GENMASK(3, 0))
 #define GET_TYPE(v)		(((v) & GENMASK(7, 4)) >> 4)
 #define GET_VERSION(v)		(((v) & GENMASK(19, 16)) >> 16)
@@ -208,10 +208,10 @@ static int pmt_crashlog_disabled(struct crashlog_entry *crashlog, bool *state)
 
 static bool pmt_crashlog_supported(struct intel_pmt_entry *entry, u32 *crash_type, u32 *version)
 {
-	u32 discovery_header = readl(entry->disc_table + CONTROL_OFFSET);
+	u32 *disc_header = entry->disc_header;
 
-	*crash_type = GET_TYPE(discovery_header);
-	*version = GET_VERSION(discovery_header);
+	*crash_type = GET_TYPE(disc_header[ACCESS_IDX]);
+	*version = GET_VERSION(disc_header[ACCESS_IDX]);
 
 	/*
 	 * Currently we only recognize OOBMSM (type 1) and version 0 or 2
@@ -608,15 +608,15 @@ static int pmt_crashlog_pre_decode(struct intel_vsec_device *ivdev,
 static int pmt_crashlog_header_decode(struct intel_pmt_entry *entry,
 				      struct device *dev)
 {
-	void __iomem *disc_table = entry->disc_table;
 	struct intel_pmt_header *header = &entry->header;
+	u32 *disc_header = entry->disc_header;
 
-	header->access_type = GET_ACCESS(readl(disc_table));
-	header->guid = readl(disc_table + GUID_OFFSET);
-	header->base_offset = readl(disc_table + BASE_OFFSET);
+	header->access_type = GET_ACCESS(disc_header[ACCESS_IDX]);
+	header->guid = disc_header[GUID_IDX];
+	header->base_offset = disc_header[BASE_IDX];
 
 	/* Size is measured in DWORDS, but accessor returns bytes */
-	header->size = GET_SIZE(readl(disc_table + SIZE_OFFSET));
+	header->size = GET_SIZE(disc_header[SIZE_IDX]);
 
 	return 0;
 }
-- 
2.43.0

