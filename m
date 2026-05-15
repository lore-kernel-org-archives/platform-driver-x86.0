Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29772221FB1;
	Fri, 15 May 2026 00:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778804509; cv=none; b=LzhDC0TJnrTpVWT2888rKSVkHVJOzjihsmWawLOJ4Ph/aTQd0xsqRLHUx5AoSVdE6zUlYwAgTV4eMr+UQE7Op+T4K3OvLCY7TsbeWK+D+mV1swkqxioBsVGGQYSjYOuux+hNi0aW7j44TLI6y+6V8dEMbJ4xRrSgm7vLjW2pOHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778804509; c=relaxed/simple;
	bh=l908usdlWw9SSN8/whL+RlRFkp0/UnePAjiM5oTUp/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BqY+/kmaHGd/aaOwm8YQaoAJ2cPMcwRkI0QeogqXcVdOgccQXk2KFNtjgx3T4KAMbrlv/jmt1jZZaZpybBwNRWMdeHrVRLw2TBxbuVOACUrGu0F5isPQrJ2wO3e65H7NWYtRrj5ao6DUjXozOq/VLazzP6CO4aHIIBTewB91DeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c8zuBxPE; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c8zuBxPE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778804508; x=1810340508;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=l908usdlWw9SSN8/whL+RlRFkp0/UnePAjiM5oTUp/Q=;
  b=c8zuBxPE37l4YWzWNp6r2XZeDHzVzps8LWcS2qNs5pI91G97TPrcQHQI
   zBXiRAt/pbKkV0cpoCVEkblWCJRgc8pRwNkjqlJXyf0yrzaaFwT2jgd2A
   g/ZkqnPx9awF/uav26wwiu6l1TkQXLLTKRPhFzGLJhvRDfW5IpEeY/Dz5
   yAZchHadSVEsnfps4BFUV/Z+oCTtF8pUA3Q/NZfbDcthTu87CeCFrlBep
   8ejATfEiFZfFMtbhEn11NhNLrmK3jyx2SKsZRF1m9pLCKM4Zv0yfaSZ4N
   0liCEN0QZwoGeP4042FAfdMgmfsZ0GmfnjnPA3yvPHDkgtL41aoJxBSBb
   w==;
X-CSE-ConnectionGUID: SBqUBtbYRg2P5DXnO923ng==
X-CSE-MsgGUID: HY3tMtcyRSKEFFLH+gF3yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="78895154"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="78895154"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 17:21:44 -0700
X-CSE-ConnectionGUID: jthh5NZrRvGXauKt5alrQw==
X-CSE-MsgGUID: 1BfLswasT5Sn5pLl/uifpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="242879063"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 17:21:45 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: y,
	Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xi Pardee <xi.pardee@linux.intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v4 03/16] platform/x86/intel/pmt/telemetry: Move overlap check to post-decode hook
Date: Thu, 14 May 2026 17:21:10 -0700
Message-ID: <20260515002130.701457-4-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260515002130.701457-1-david.e.box@linux.intel.com>
References: <20260515002130.701457-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Update the telemetry namespace to use the new PMT class pre/post decode
interface. The overlap check, which previously occurred during header
decode, is now performed in the post-decode hook once header fields are
populated. This preserves existing behavior while reusing the same header
decode logic across PMT drivers.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
---
V4 - No changes

V3 - No changes

V2 - No changes

 drivers/platform/x86/intel/pmt/class.h     |  1 +
 drivers/platform/x86/intel/pmt/telemetry.c | 24 ++++++++++++++--------
 2 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x86/=
intel/pmt/class.h
index ff39014b208c..8a0db0ef58c1 100644
--- a/drivers/platform/x86/intel/pmt/class.h
+++ b/drivers/platform/x86/intel/pmt/class.h
@@ -37,6 +37,7 @@ struct intel_pmt_header {
 	u32	size;
 	u32	guid;
 	u8	access_type;
+	u8	telem_type;
 };
=20
 struct intel_pmt_entry {
diff --git a/drivers/platform/x86/intel/pmt/telemetry.c b/drivers/platform/=
x86/intel/pmt/telemetry.c
index bdc7c24a3678..d22f633638be 100644
--- a/drivers/platform/x86/intel/pmt/telemetry.c
+++ b/drivers/platform/x86/intel/pmt/telemetry.c
@@ -58,14 +58,9 @@ struct pmt_telem_priv {
 	struct intel_pmt_entry		entry[];
 };
=20
-static bool pmt_telem_region_overlaps(struct intel_pmt_entry *entry,
-				      struct device *dev)
+static bool pmt_telem_region_overlaps(struct device *dev, u32 guid, u32 ty=
pe)
 {
-	u32 guid =3D readl(entry->disc_table + TELEM_GUID_OFFSET);
-
 	if (intel_pmt_is_early_client_hw(dev)) {
-		u32 type =3D TELEM_TYPE(readl(entry->disc_table));
-
 		if ((type =3D=3D TELEM_TYPE_PUNIT_FIXED) ||
 		    (guid =3D=3D TELEM_CLIENT_FIXED_BLOCK_GUID))
 			return true;
@@ -80,15 +75,25 @@ static int pmt_telem_header_decode(struct intel_pmt_ent=
ry *entry,
 	void __iomem *disc_table =3D entry->disc_table;
 	struct intel_pmt_header *header =3D &entry->header;
=20
-	if (pmt_telem_region_overlaps(entry, dev))
-		return 1;
-
 	header->access_type =3D TELEM_ACCESS(readl(disc_table));
 	header->guid =3D readl(disc_table + TELEM_GUID_OFFSET);
 	header->base_offset =3D readl(disc_table + TELEM_BASE_OFFSET);
=20
 	/* Size is measured in DWORDS, but accessor returns bytes */
 	header->size =3D TELEM_SIZE(readl(disc_table));
+	header->telem_type =3D TELEM_TYPE(readl(entry->disc_table));
+
+	return 0;
+}
+
+static int pmt_telem_post_decode(struct intel_vsec_device *ivdev,
+				 struct intel_pmt_entry *entry)
+{
+	struct intel_pmt_header *header =3D &entry->header;
+	struct device *dev =3D &ivdev->auxdev.dev;
+
+	if (pmt_telem_region_overlaps(dev, header->guid, header->telem_type))
+		return 1;
=20
 	/*
 	 * Some devices may expose non-functioning entries that are
@@ -131,6 +136,7 @@ static struct intel_pmt_namespace pmt_telem_ns =3D {
 	.name =3D "telem",
 	.xa =3D &telem_array,
 	.pmt_header_decode =3D pmt_telem_header_decode,
+	.pmt_post_decode =3D pmt_telem_post_decode,
 	.pmt_add_endpoint =3D pmt_telem_add_endpoint,
 };
=20
--=20
2.43.0

