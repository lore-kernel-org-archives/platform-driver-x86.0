Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C0D36A01A;
	Fri,  1 May 2026 23:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777677064; cv=none; b=BbwKOMf0eB1LaOvs5HtCOyeZLvwCl5WXfXc2gMq6yLByfI14ZR09yXwHtf2aW9vKZp0ZrM8sVg9KcpRhMFaZ/0ogdkcBGmo2KX1wiCEbljoJqShaeDwSxk9hjUXxcPzg2gUEAg6Drdp1TJ8lZPaf9uqkkcZWlBc0WhZtP2sgZ2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777677064; c=relaxed/simple;
	bh=lpum5mZvq1LLcpwO5DFZHMXRX9wXByswQOusB8UQW3o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=saP2opbc2FJpw5ti3PRUsIL777PimcNUm2DwlvSb318lD1XiAdh2kG0DSe9+9Hc4Gj3q6aDuQd2cH2YW221q2n3mOf2DQ5sn5MLq+f4/zZDLYXNWhtJiEo8c2SqNMkmtPKVQszhqwwD+E8XBDEyR3iVqw3oUgIKPhAwj/FYYD5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QaE/ADxv; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QaE/ADxv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777677062; x=1809213062;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lpum5mZvq1LLcpwO5DFZHMXRX9wXByswQOusB8UQW3o=;
  b=QaE/ADxvu06DlYTZp08sHKMWlgRypJ1TpdU3o7SvUxBHuVOkmBOCSDeL
   rYjrGKoBS5GYwlm31l9SeRa5zbYfPK11oZZRx/FozpZvfdPnlVxDUF5kR
   VoIQ5Dpv6DoFc0pSX6DpBGCMGxvkIKCwEfZAI3ncH/n5Z4ph8fCzpUPfC
   qLTxNySfqqTMyWEOt1iSJcWZivB+ol8kHALwJcVWf1eB9GdyRlifMpjEx
   tPIw6NI/fkT3AA7sbZ7Pni3bIPLleoJDrM73XjEU7UGSxNzDcIIUBWmRo
   YpLBQ18A6s3BMS2MPpNCTFdXiSK1ZmjdC5PjpoY5IRSNfSYY5QOfSnpDA
   g==;
X-CSE-ConnectionGUID: sjEEeUWoQt29q/eUxY484w==
X-CSE-MsgGUID: VkVNguVZQjWd2UDInlJT1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="78740120"
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="78740120"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 16:11:00 -0700
X-CSE-ConnectionGUID: RHmte0QmTJ+u2i9MKVuI+A==
X-CSE-MsgGUID: hgwZphUkR7SHvtDGl39KxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="238948954"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 16:11:00 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: irenic.rajneesh@gmail.com,
	ilpo.jarvinen@linux.intel.com,
	srinivas.pandruvada@linux.intel.com,
	xi.pardee@linux.intel.com,
	david.e.box@linux.intel.com
Cc: hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH V3 02/16] platform/x86/intel/pmt/crashlog: Split init into pre-decode
Date: Fri,  1 May 2026 16:10:39 -0700
Message-ID: <20260501231054.3890305-3-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260501231054.3890305-1-david.e.box@linux.intel.com>
References: <20260501231054.3890305-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Refactor crashlog initialization to use the PMT namespace pre-decode hook:

  - Add pmt_crashlog_pre_decode() to parse type/version, select the
    crashlog_info, initialize the control mutex, and set entry->attr_grp.
  - Simplify pmt_crashlog_header_decode() to only read header fields from
    the discovery table.
  - Wire the namespace with .pmt_pre_decode =3D pmt_crashlog_pre_decode.

This separates structural initialization from header parsing, aligning
crashlog with the PMT class pre/post decode flow.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
---
V3 - No changes

V2 - No changes

 drivers/platform/x86/intel/pmt/crashlog.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x=
86/intel/pmt/crashlog.c
index b0393c9c5b4b..f936daf99e4d 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -496,11 +496,9 @@ static const struct crashlog_info *select_crashlog_inf=
o(u32 type, u32 version)
 	return &crashlog_type1_ver2;
 }
=20
-static int pmt_crashlog_header_decode(struct intel_pmt_entry *entry,
-				      struct device *dev)
+static int pmt_crashlog_pre_decode(struct intel_vsec_device *ivdev,
+				   struct intel_pmt_entry *entry)
 {
-	void __iomem *disc_table =3D entry->disc_table;
-	struct intel_pmt_header *header =3D &entry->header;
 	struct crashlog_entry *crashlog;
 	u32 version;
 	u32 type;
@@ -513,6 +511,16 @@ static int pmt_crashlog_header_decode(struct intel_pmt=
_entry *entry,
 	mutex_init(&crashlog->control_mutex);
=20
 	crashlog->info =3D select_crashlog_info(type, version);
+	entry->attr_grp =3D crashlog->info->attr_grp;
+
+	return 0;
+}
+
+static int pmt_crashlog_header_decode(struct intel_pmt_entry *entry,
+				      struct device *dev)
+{
+	void __iomem *disc_table =3D entry->disc_table;
+	struct intel_pmt_header *header =3D &entry->header;
=20
 	header->access_type =3D GET_ACCESS(readl(disc_table));
 	header->guid =3D readl(disc_table + GUID_OFFSET);
@@ -521,8 +529,6 @@ static int pmt_crashlog_header_decode(struct intel_pmt_=
entry *entry,
 	/* Size is measured in DWORDS, but accessor returns bytes */
 	header->size =3D GET_SIZE(readl(disc_table + SIZE_OFFSET));
=20
-	entry->attr_grp =3D crashlog->info->attr_grp;
-
 	return 0;
 }
=20
@@ -530,6 +536,7 @@ static DEFINE_XARRAY_ALLOC(crashlog_array);
 static struct intel_pmt_namespace pmt_crashlog_ns =3D {
 	.name =3D "crashlog",
 	.xa =3D &crashlog_array,
+	.pmt_pre_decode =3D pmt_crashlog_pre_decode,
 	.pmt_header_decode =3D pmt_crashlog_header_decode,
 };
=20
--=20
2.43.0

