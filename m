Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795480748;
	b=Ms4pqtjpzHMGFAXaat6+IjpOi/2VsXRsdqpiMUC5Q4ej0NSh29793c2fXeYdkzx5FDKm
	 v6ZxfXyuT+HRHmHkVb/X1VNG9SbAoaVB3YgBLsNYU+8xgA9fda1mTRDaLBUEvaj2fJcA3
	 ZZn9zqIPcr86Z2UWrf5HBf8BKaVYhSZiW96e/JLZchXGMwO+s8HXbYlk0E3sFdeBYfxB9
	 GhB12VIDqUvx0sWX97+lbJKkVjlZImqvM38XDuTDkw/JnWaHR9DsHqVv2l+unoT3Sganb
	 JsrTVQoVUOWuftSMhx24dupi5R7OCj3U6r9uy0eX3Uzu37hophRHBGoBZgvQVauhQ8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795480748;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0l1Bzpc9zw5KbnrzQuTunx9lYtQSKDxuLKvRXakouWw=;
	b=sFZ1QCUXZqI77vf9Ccwsfq8f2e8atTC9iulI+Z4kywon4oDKfFpy2V6sONAD/NS3z/+I
	 1Fk2BHXn4G6TvCwZFhowMsJr0YhYJDbcPCdygshsOyxxPFFN1475Dm+3SEQgdF0bSkKad
	 FXkZfF07LedBuk1KlulosdlXLsGwQv6g4m8hbfkxB2CcukqfnmRi0hxbAEX60GLx+U5Um
	 wi8b0+2yxrt55Rez+V8FJ6yjUMTlgmrZ5Dyn9lmGMrn14g7liNXfoapWpxKiSokqcz/qR
	 5yo5wg2nvI3upS5dJ/CBDeS2/QrIaWc9AdrLE5x4ZiXZUmh8Wh3PP6FqSqb91dyxntw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GAxWHCHL;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367F2606A321
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 00:39:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 367F2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GAxWHCHL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795480747; x=1827016747;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=vdYjeiryOcvMslvJXkQiNrklhhsQczKbeZnsj7m8VGE=;
  b=GAxWHCHLOj85/NLus8PpklEBuGD2krPYGDrnBLBrsnc+RmUeJe18KxUz
   n8tlOzjuq2oGlOoo7J4n/6qD8XP5XFtVF1uJn4TAuqn00RE9TE56gfwdA
   csq20/P3GU6CIeZRwuVCNpj3wqKE1iItFfoZoC0LY9rsHhtp3PQOMd0Tc
   Yur7ECCJMV6y2iz+AqSOD0bGPxHJ9zR5bRwfuYnOs1N2MSa3Hbg5RDPn/
   tC3t8enyq8H9ekEsBG6Y7ErJS8/ptbIhkEjMDVwliVijpdZBeDGlDtE+q
   4o9sSv3LFwcnIrJw5uIjKnDspGBL+CmsIp8hcMfpttjeL5bin0mfMbdFB
   Q==;
X-CSE-ConnectionGUID: NKgOReQJSNqelhCWUCafdQ==
X-CSE-MsgGUID: YRaardOER9Kyip7cUVbLqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4332827"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4332827"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 16:39:05 -0800
X-CSE-ConnectionGUID: i2ObtDKYQJOJDQw29J3uWw==
X-CSE-MsgGUID: 1G7t23grQIirJCLaJ5/H+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11805733"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 16:39:06 -0800
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
Subject: [PATCH v22 02/19] platform/x86/intel/pmt: Use the pre-populated header info for crashlog
Date: Mon, 23 Nov 2026 16:38:58 -0800
Message-ID: <20261124003856.4145635-23-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124003856.4145635-21-michael.j.ruhl@intel.com>
References: <20261124003856.4145635-21-michael.j.ruhl@intel.com>
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

