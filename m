Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795486085;
	b=3SVTHQl7kcj91fD7ke3uXWRp+K0R8bKYstewzlnHfOhSPqIoEEqAsYqbkQCrSkW5uEQz
	 hBlV1Bu7zAMDprhluu9+pDMVMmNCbNUfn8xPCDzVW/rSCBs2nKoJxnFjCzTUv0LAKxUbl
	 Ymh/WzScrY5jYpA4qTFgMJtiP4wL97aqfaoDu3xvU7Rmf2OkIIvkR6iXcCA4BsFCC4TtD
	 zIxyWj/YTT/kvyJH+GdV6B8eV1aRUT6Z7kiOvoPlEaA+EjOoZUy1dMfXGgkLdmrLWIW2W
	 Z/S8J7jsiGDqLf/GmxJVk9e932xA9dB07DHLtqfYwfkJmul4iqdyXzC8d876iY3uWog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795486085;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0l1Bzpc9zw5KbnrzQuTunx9lYtQSKDxuLKvRXakouWw=;
	b=vw2tTDhw5N3x33yjpHaZh1buG1xmF1hwctghG6WAjwyWKJhwFBMjVr0ACiYk+AzqkcWK
	 l77KStjIot9vzPOPpg/GK0w88l5rjTHkt9qo7LF/kKc9KvnE8giEQqOJE/vbZJ88HR1by
	 lWGre73vfYV8wQWEctBF8//GPeh4ilzexPzaJZL0A60nvUlcRhOjGztG53oYru/Wa9BoT
	 yP/WSm0Em6NZCsciUn+abmFMlkDXT5ClZbZF6BYgjHwwMkR7MVYpRXM9iZW3XxdYt6Bbv
	 30iqHysQ/PWLMqBjHAvYzb0LwEILUqmyizZtx/CEHVn3iJi7ooAhI1w4xSImYsSVOfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Oao+uS4e;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE56606A321
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 02:08:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CE56606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Oao+uS4e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795486085; x=1827022085;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=vdYjeiryOcvMslvJXkQiNrklhhsQczKbeZnsj7m8VGE=;
  b=Oao+uS4eaanxrKs9AvNx8jALu11mAP/+Y2gUt8GTsWQHj3jHjsx9DWQk
   I8IMFFD68dlq/BOIPX8vpg4tHgbvR9PgWz9kAy+cAU85B2fx1NHbtBlbI
   9Xm2uiMuSFxbC+1Oh9pXESkwOjEtCdoerzp1V8puox0gIv9Pom6Bop/0q
   GJ+1Whl6EU+F2ngB6m+5fWhugjxpwUrEiPDgfPzS/SuhOEwdKdXzPBbIw
   1iQubrIn7aTm7HGRsbn+B+QoClXueDXnB5/g7/yxcu+qeZPoPjKs+PORx
   JDOsgZqV1K06ZJen04EfiW73NxJXOw/AC3Il2N2UTtugq2MWb7GWTv9EX
   A==;
X-CSE-ConnectionGUID: cWoyMghOTiKjBkq0hCJ7OA==
X-CSE-MsgGUID: hkuvCX1LSDujdj69YsuTGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4153490"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4153490"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 18:08:03 -0800
X-CSE-ConnectionGUID: DS0S8exbQNqHdQY2yykzJA==
X-CSE-MsgGUID: 81slQSG/TCiDZZA6OuKMEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="11621406"
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
Subject: [PATCH v23 02/19] platform/x86/intel/pmt: Use the pre-populated header info for crashlog
Date: Mon, 23 Nov 2026 18:07:54 -0800
Message-ID: <20261124020752.30551-23-michael.j.ruhl@intel.com>
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

