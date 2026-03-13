Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954CA3375CB;
	Fri, 13 Mar 2026 01:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773366745; cv=none; b=RVYMeI5zANJar+IyAaftw5IjNMZ61T/64UUgYyb2ynpdKXslgl3SqUPCtuAxjIr7Rrv1KQ90XOtvc75dq9giAz9ulGCcFFUrrIGIuAJdk7AKkVbaUMT6Kzmt9th/n0Shtz9mz6NC37Or/FNmA2+lcgReuiPzoOwtZljZVPPo2Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773366745; c=relaxed/simple;
	bh=ZVaA4c+uExkzKcsDngXFQGH+LH7WwMyEcUWFkbRccJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VzxoFkarnkkCEVzEtuSrbdvbpe/gFAESRIPwkn4WmBaluhj+cQlKD6pbiK39vZMHodajlAevgtKKcbzUaIklKAVFnqZIu7FzyPQtBG/4gA2l18aCEok9hcnrQu5xr71fXk5ivNrbydEsE3unmW5bD3qabV9edX5fWoDvOApl51A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cv1kpif+; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cv1kpif+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773366743; x=1804902743;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZVaA4c+uExkzKcsDngXFQGH+LH7WwMyEcUWFkbRccJ0=;
  b=Cv1kpif+8sLEUU3CjlOI9MXGEyZF6fLB69STU3kcdQ4VMbSDZHv8ZM4a
   p81o8QkpiuzUV4W0EH3vM410PYcjFFOpoyYOpC8xYNdhq0eO/kmEBjKSl
   q15d2Booqywz2mREBC/3gYxMGpYDnoEUdTX67iD5bDBonh0tTo1o1AWMI
   PNp5uvUC/ZE2rShfonQoQT/JI47JGabEwotOziGGLF1LBO0LtIlDiXZhF
   CW02MJ/4hte98JqO3EyIUVMQRf+oF36I2a6dwUAU7q2JF/uGXCKN8k6pR
   TbierJuuWDwss2reqSA4f/lRqE45mvwen0Vx+vKnSU5fxLRlNglbyahNd
   Q==;
X-CSE-ConnectionGUID: BZye6goNSuufOpeDdRyvFg==
X-CSE-MsgGUID: SnHoPjo7TCad49yd6NL5BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74354571"
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="74354571"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 18:52:12 -0700
X-CSE-ConnectionGUID: MQrHz6HkSNuX6XR1QPhgDQ==
X-CSE-MsgGUID: 34ONSJ87SkmaXSu2cVqQuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="220108494"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 18:52:12 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: thomas.hellstrom@linux.intel.com,
	rodrigo.vivi@intel.com,
	irenic.rajneesh@gmail.com,
	ilpo.jarvinen@linux.intel.com,
	srinivas.pandruvada@linux.intel.com,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	xi.pardee@linux.intel.com
Cc: david.e.box@linux.intel.com,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 09/22] platform/x86/intel/pmt/telemetry: Move overlap check to post-decode hook
Date: Thu, 12 Mar 2026 18:51:48 -0700
Message-ID: <20260313015202.3660072-10-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313015202.3660072-1-david.e.box@linux.intel.com>
References: <20260313015202.3660072-1-david.e.box@linux.intel.com>
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

