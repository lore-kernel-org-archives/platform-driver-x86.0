Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795103695;
	b=iinQL12RrMmYOPrdJY3/8sw5NWRJupTXOsztzdb0g+SS35AGwpjK9vsk+E875t3ergFL
	 HjwE0Cod6CvFcw46AmSKzpmR8ciPAWWbEOzT/g6nUh8QxcnwFOwAc05Mpzu5Ri0204+MI
	 NE9M8X11OEut33VMp3CtX/RaH5XZMMXV4pyjBhrpL756NzoGO6U+cVYctrZil5vAauhRI
	 ocuIT+IDQOUzDUJ9tMqqLrCl2BdFY662Amf9YUeCet93HGti71crn5iYR6UDFWR8Yd/Y/
	 SGbtAmmhC0Qr4j8OqGEIJeH87HQOSZgdXxjs7cuCFPXYL+s1oq2AuSGFj5Mav3/RmnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795103695;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iQxE0vmhZDQZAcXrgEFePiOhv4+R+nHlWQzf4Hf0FEg=;
	b=icxgRVpv99FTuxHV4xA1hq3lUADEfVbDxkpPhKOsw0JvH5s5ptKplmcEP1SC2tQy/77z
	 ft3452aLGZQUlXUahpNsL0C161yHZ6gY6dY5lHMWvtucufONe/uIcFoMnNHlBeTIj80KD
	 rMyybpweawPV+xDKNqM0ptDT26Z1Db/JcNzWw2U3HFAQ/hTb2JQxsHmSX5QcFSislm/Zx
	 IkxbfYQaC2oUNx/pE93I6XulbD82wNh1L48f19jtMN9MxnDBPQWSRUBnS/U4OydUQonct
	 8PkLQMXqoFt0B7P0OJEUY00+SsH9R5datxpZ+jwlCoPXgm48EJE2t/geZRd2NycSpvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h4YGi59V;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D414C606A33A
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 15:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D414C606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h4YGi59V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795103694; x=1826639694;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=S6q4CoHx00wX9ayNpHzhHf1RM3dQTEKLx+xiO1g8tN4=;
  b=h4YGi59ViYt+jUulRxu8XbIJbQl9FpQN8J1704MCLCTNLgGwecWdZaT9
   MnOG7djxKl3B14RqedCBSnDGGLMca5snkGDQdLGTU8ZVmsQoWJ8EraPzG
   /joJ2aCh4wImphnCXgG7g4ejIPa7dINdL/HG/3BbrwQPs5C70V2RYZb3S
   GCW5qENd9H5HoctDUj5EaHlt4X+H20YqPLWAs9k0b7dRphPmD/QmOPs8P
   3Jki3Bo0RH+hu/+C5kU9Cn6MYi0TsyRu6jXgn7D0O4msK0rqSfIfrFh2f
   0h1ThGW3LcM9B60xPAe0vX6U/BrZjhkZZ1IAN6vXvkMfKH4EHTvxPv3Pv
   g==;
X-CSE-ConnectionGUID: zErAQYO7TUChJzOadqnTBQ==
X-CSE-MsgGUID: ilJTGGz5TLWi0C9l47EOLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3848933"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3848933"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 07:54:51 -0800
X-CSE-ConnectionGUID: ioUAx3gwQ+ee4MspHZofdA==
X-CSE-MsgGUID: gY3+aGG1QiOR0DOQJntb5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10263375"
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
Subject: [PATCH v19 02/19] platform/x86/intel/pmt: Use the pre-populated header info for crashlog
Date: Thu, 19 Nov 2026 07:54:40 -0800
Message-ID: <20261119155438.40762-23-michael.j.ruhl@intel.com>
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

Discovery data is pre-populated.

Use the data for crashlog probe.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/platform/x86/intel/pmt/crashlog.c | 24 +++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index d7018b495217..f7c391d145ff 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -27,10 +27,10 @@
 #define CRASH_TYPE_OOBMSM	1
 
 /* Crashlog Discovery Header */
-#define CONTROL_OFFSET		0x0
-#define GUID_OFFSET		0x4
-#define BASE_OFFSET		0x8
-#define SIZE_OFFSET		0xC
+#define STATUS_IDX		0
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
+	*crash_type = GET_TYPE(disc_header[STATUS_IDX]);
+	*version = GET_VERSION(disc_header[STATUS_IDX]);
 
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
+	header->access_type = GET_ACCESS(disc_header[STATUS_IDX]);
+	header->guid = disc_header[GUID_IDX];
+	header->base_offset = disc_header[BASE_IDX];
 
 	/* Size is measured in DWORDS, but accessor returns bytes */
-	header->size = GET_SIZE(readl(disc_table + SIZE_OFFSET));
+	header->size = GET_SIZE(disc_header[SIZE_IDX]);
 
 	return 0;
 }
-- 
2.43.0

