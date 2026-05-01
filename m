Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F37372ECD;
	Fri,  1 May 2026 23:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777677064; cv=none; b=Z6yxuCx/wUYNdMmXDROGGiMAix9k+UP5EnVYZI7oSPUa3nwvbMpF4E5/RUR5NhaB/3zWX1zeFIqE+Zj6lDKwKheUwXPXbjgXH8GpFbebBpgdcuYDGHjB2EUgl6txmCY4nkOkwTXltp+1Msp2BBgjVkBdCj8M/pAnM3VnFmQmMtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777677064; c=relaxed/simple;
	bh=hnuktE/c3m5wCtEqHDBbPGv8iua3W60RViVmBXfygas=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lL2Gt7TIq7YT3xICyrInTfWyF9jqcOV6gpeJnNQjmfGldO8e1ObZYaYi4LYUNTcEONGEbzk47jl/+EUtun4X5gCaybfqyByTndrwCntDZquKkz7NqGUSxZMA3YEdKYMIHZpT/0a4RwqK4jmbHHx9QzWDD8r5/Wkf1YmY+aj1nH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ETQqYvcC; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ETQqYvcC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777677062; x=1809213062;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hnuktE/c3m5wCtEqHDBbPGv8iua3W60RViVmBXfygas=;
  b=ETQqYvcCXoveLLiqQjO9cgWatrLbus+pKfBk+HYowcQrP7i3iBmMY13W
   +M+Y+0RVLkA5DYzj+aSJiEJmriFrEqkf4r2xYOHu9tADVbyimoEvDD8vb
   0D6EFjGQjzDUPa4WD8qJB21Tz0/FIDSkaNYwY9OzKfc2vBoPRIHoQKvW9
   SpQlKXrExb/KSqEmToOwRLj9GvN3hB8IM6R96lJxANsLKkBJ1UwC5nElJ
   tHYdk1icHf+YNn6fHRD0z6nQJ460kWOxI8mAeZvcugXOK/qE5JoWM/11r
   +5kv+nRf0klMInSAWJJsFH4cHNY3PBXol0EHnGkhSMBuPjG/YZ9p+1ljw
   w==;
X-CSE-ConnectionGUID: qAS1r72tTqOS6SC2BjYk7g==
X-CSE-MsgGUID: rNm//DGlQ++E3iWPcMe4bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="78740124"
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="78740124"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 16:11:00 -0700
X-CSE-ConnectionGUID: WwOenXPoRV6OPcjeCaq/sg==
X-CSE-MsgGUID: lKF5pPN0QEOZcCvOTDXniA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="238948955"
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
Subject: [PATCH V3 03/16] platform/x86/intel/pmt/telemetry: Move overlap check to post-decode hook
Date: Fri,  1 May 2026 16:10:40 -0700
Message-ID: <20260501231054.3890305-4-david.e.box@linux.intel.com>
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

Update the telemetry namespace to use the new PMT class pre/post decode
interface. The overlap check, which previously occurred during header
decode, is now performed in the post-decode hook once header fields are
populated. This preserves existing behavior while reusing the same header
decode logic across PMT drivers.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
---
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

