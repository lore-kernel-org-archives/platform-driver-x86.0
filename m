Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6F627281E;
	Wed, 25 Mar 2026 01:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774403309; cv=none; b=dxupIhTkuVzCsbaT71OcbqZx2Ny+SYvfKGn27+dOke/mSGQxW7uBhdejs8aSpvGESFZ5F/Ywx0kILvWtOPN+be5ps0+mV7vLP6xoIpQ8DsReh1YMqCAQiY6lFV6YsUyp0nc6swry9fuZ7X12u0aqNFZsNTTcAvyPNHoiqJ2JnUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774403309; c=relaxed/simple;
	bh=i1ecLgcNoR9HAax0E0XF/g8dAznGag43FCd8P7rp4A8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V6fGI5050Kmjg/YZuqQoCe+D+oJRtjwlZkmFz2+/+ByOF2akZydqQDXKXKZIzq6/3wBJ5V6Hv3BA2XS2L68zlGgoJ+nEginrLkMwJyemFYZzK94mkYg7GQVfIUOjqoKpv5XOp2XY7hHTbV+ESRqdd9EOOAQap1KgAe8BzaSoURU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OPWSqS8E; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OPWSqS8E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774403308; x=1805939308;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=i1ecLgcNoR9HAax0E0XF/g8dAznGag43FCd8P7rp4A8=;
  b=OPWSqS8EjNFfua9iAgXN1J995ZePwLduuYOSn8iUN0xeNim64dTMUkP5
   pe8nGw1HBaWk2Bq+S/Dwq1Iyc6yg4M+wsIB4HQjNg6+q+6GDpovCwvv5l
   zBHTr0B+6/bpVQDm/tau3JrWkCxZbssYn4PW4On7jZM5FOqovgCCCP6b6
   hu9p/5VbqQwjAwjBbH4C2zH5tDg7/I0VAYOkf/yOF2TcDUsFACiASiKJ4
   RowJKkcmyYwEvjHo0P9Nuevbzn4ccr4X48IIhk8O913LqP87vDG3a+SqT
   6hRCyvENZWhHDjek22pwbdYaYx9Z4M+CERuu67HYZACu2nozhbDoqXN5K
   A==;
X-CSE-ConnectionGUID: B2MpdCrDSL2Q9Ykvo+L4Yg==
X-CSE-MsgGUID: vpM0zca4Tw20ijpMWh/Jsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75317492"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="75317492"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 18:48:26 -0700
X-CSE-ConnectionGUID: TGW+pxBsSpql+/qvvyDVCA==
X-CSE-MsgGUID: AgWz5LDOTLSwipoZz6OuWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="221190778"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 18:48:26 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: irenic.rajneesh@gmail.com,
	ilpo.jarvinen@linux.intel.com,
	srinivas.pandruvada@linux.intel.com,
	xi.pardee@linux.intel.com,
	david.e.box@linux.intel.com
Cc: hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH V2 03/17] platform/x86/intel/pmt/telemetry: Move overlap check to post-decode hook
Date: Tue, 24 Mar 2026 18:48:05 -0700
Message-ID: <20260325014819.1283566-4-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325014819.1283566-1-david.e.box@linux.intel.com>
References: <20260325014819.1283566-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Update the telemetry namespace to use the new PMT class pre/post decode
interface. The overlap check, which previously occurred during header
decode, is now performed in the post-decode hook once header fields are
populated. This preserves existing behavior while reusing the same header
decode logic across PMT drivers.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---

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

