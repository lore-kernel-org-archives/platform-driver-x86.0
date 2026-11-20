Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795141184;
	b=tCQVG7hVc14KS+OFfHFFPw+8cMHph1UWcmv3vJebvPTDIQ8isXXXzz10FMaEn77I2O9i
	 2DqgaPwXre0i42oTu3MNaLW1r7kYCt4IjFFfWWGs8+bS84oQEyDBGf7Eea682GIeuCzpJ
	 KaVIR4eBiHSlQTBSjSdPuPaKUDTxqW8KeMDyk+IrqS0Gvc/10NbVhEFYeI/V37bTbhU1a
	 0bC9gyqIlo3HXZPpwP31yssNWwFazYddxSrp6zxV1pgcmMGaNJu4g+P830da0zKsxZw1X
	 kZSztYEdgIPyGlO9pdjZRiF7PzA87L32hHiolWC9B5j/yjXDNXBst0Hxrzc6vKKjW4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795141184;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oCbukSEOIDG9j7KzPH2tYSE9Q9ivTHN8g+p4aXzTk9M=;
	b=eeLQzne95tkG3RiNm4ud6N7SkItDy8MBODkQnseUoxnuqJNzzMi9g7ayd07hfQyBQ0ub
	 23WBAI7lhM4x2Wa9r9ekYXsC/4pLA/6DcxMDnzOpuppG+vaXzCupEZxLk1kH2yG3NCCq7
	 poTEdYL8vD6UkKENdQJ9/9aB9KJhw22BgVFUORpZM7YiVmvbbG65ge0Pax4TQzQiQn6RX
	 MId0gX4XCp4XrtHjdWo7SMtsHD4F2T+kzGs9FbphqfCzYRi9guaW0FI4iSi+5q2pNI+hJ
	 6Gz6kCHX4V8UU9ug1nUSWSJwXI185VwOEqy4z6Y7rO+11DKawfSdcCEzDQ6RsZ/YxBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Lrs14aqd;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE4C606A320
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 02:19:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EE4C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Lrs14aqd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795141184; x=1826677184;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=DI50tQVDiWQxHjr6f4HWa340tKvgwcS2zkXrq6iQI3s=;
  b=Lrs14aqduqoux/l9iw4dLuTjxYWQ2x1tdRxn04beNsSrD57MW0xbxZA6
   nI7uPcen8Llhs3VQ5Zp5QCidocbQI01tRjik3F1nzrgwPW500GK/YaF+l
   b2Lqy9qZZJKI3x9JRtY9z3otTpBMT0c0FEKkXBqkMvy8wgSbpqHufeEDb
   LgEsfTDQcSCIXjMB9QOyYBOmGNtRhEFCgHf1vpTbNH6pH2uS4R/09JeDh
   XJJnX7tuy1k7jBMV11zOHGPyDcT1IYxFYlAdywFUL6FSjAciUkxOyNIqn
   lOj1TBWftaQyVi8AM1Z3sjRTT4adrGgHpYQT1gvezxZFo+Pd+REm4VzaW
   A==;
X-CSE-ConnectionGUID: osN/hY+vQGyuxKYAvl8E6Q==
X-CSE-MsgGUID: osB8KUa+SfudQF4234borw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3898395"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3898395"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 18:19:43 -0800
X-CSE-ConnectionGUID: Q6NaZdDrQkK/UwJs+vXesQ==
X-CSE-MsgGUID: q+nJefbLRxqErTVbNVGA3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="10487094"
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
Subject: [PATCH v20 02/19] platform/x86/intel/pmt: Use the pre-populated header info for crashlog
Date: Thu, 19 Nov 2026 18:19:32 -0800
Message-ID: <20261120021929.473553-23-michael.j.ruhl@intel.com>
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

Crashlog reads discovery data directly from the discovery table.

For parents that provide a read_discovery callback, this data may
not be readable with this method.

Update to use the pre-populated discovery data (disc_header), rather
than reading directly (disc_table) for probe.

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

