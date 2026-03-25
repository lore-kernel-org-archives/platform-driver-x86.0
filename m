Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BED6275AFD;
	Wed, 25 Mar 2026 01:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774403310; cv=none; b=WbtmmG2Jm4e3VS2LS/k7VqKJHrleiX2yAiC2k1HLpE7/9HYpg7ZvM0Qpno6jiJA5gPkrvKb06XshpT0XVYPyHrxYohJmZATFJS8nHs9NwUwiPWOhSyvAOTKPe8LAGlGVbK0453CoL7+db/C0u7xphyQByJyak/74KXV/l3MuFQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774403310; c=relaxed/simple;
	bh=tl7BrBjb85ZeuLHWNcJDNnwzzj//w046XBYDy35hDRg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pln/hZYy1Ccp/8CWKWEyVGwx075T8/tMQ+PIl6tI5TZrBTSa3h+DWdS+UiJ9xaRbo9JUIesQEfT8df8E6kC1FuCJg4BPbwueDc98ensXCnFEqw1rRcHtkj8US7ICST13B6I5hSkM7ruxonc9LML7Eg7u+W7ijrwaAIP+6Xx5Tk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GKtp12E4; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GKtp12E4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774403308; x=1805939308;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tl7BrBjb85ZeuLHWNcJDNnwzzj//w046XBYDy35hDRg=;
  b=GKtp12E4I0OEFXajDhKQpdd8tloeWg8L6p2UW6yHQq3w0sOCSg+5ns26
   YLW4+oCKguDYzK27Pc8ENiu9+oL/I0UmgkgRdqPDzX0QUioHjY8PumVfI
   D2aj/MBGaXd6TNvgj6WjS/o/gbHFSdM6hlh6o5VYh3o/1MLiri88yb9rJ
   MIG0dzk6/KhByji34BfNZ5r7jP/Cm5okzAfmtTfYfLsvV/0T5nfVhZyWQ
   T95gIq5B+bBs4bYsnDlF99QKDrngEElG7Cn9FG5pMfYbzxmUbJ95BEsYP
   Yy4VVBSdmPLndHIAWVzMwHqA5aUFc+cUzamdUQdDmbZuMVCvDJEKT14zM
   g==;
X-CSE-ConnectionGUID: ZvrAR3FvQCanjeEwElp+JQ==
X-CSE-MsgGUID: f4UKVPA8S9i8+PkWbzHVhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75317495"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="75317495"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 18:48:27 -0700
X-CSE-ConnectionGUID: lrTAWigbSuG/34QVh/RFrA==
X-CSE-MsgGUID: fa18HYz6QhCifT/hWGks+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="221190779"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 18:48:27 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: irenic.rajneesh@gmail.com,
	ilpo.jarvinen@linux.intel.com,
	srinivas.pandruvada@linux.intel.com,
	xi.pardee@linux.intel.com,
	david.e.box@linux.intel.com
Cc: hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH V2 04/17] platform/x86/intel/pmt: Move header decode into common helper
Date: Tue, 24 Mar 2026 18:48:06 -0700
Message-ID: <20260325014819.1283566-5-david.e.box@linux.intel.com>
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

Unify PMT discovery table parsing by moving header decode logic into the
class driver. A new helper, pmt_read_header(), now fills in the standard
header fields from the discovery table, replacing the per-namespace
pmt_header_decode callbacks in telemetry and crashlog.

This centralizes the discovery table bit-field definitions in class.h,
removes duplicate decode code from telemetry and crashlog, and prepares the
PMT class for additional discovery sources.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---

V2 changes:
- Added PMT_GET_SIZE_BYTES(v), addressing Ilpo feedback on macro naming
  and unit clarity
- Also in PMT_GET_SIZE_BYTES(v) change ((v) << 2) to ((v) * sizeof(u32))
  for clarity
- Removed unused macros from crashlog.c per feedback from Ilpo

 drivers/platform/x86/intel/pmt/class.c     | 37 +++++++++++++++-------
 drivers/platform/x86/intel/pmt/class.h     | 15 +++++++--
 drivers/platform/x86/intel/pmt/crashlog.c  | 23 --------------
 drivers/platform/x86/intel/pmt/telemetry.c | 26 ---------------
 4 files changed, 39 insertions(+), 62 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/=
intel/pmt/class.c
index 9b315334a69b..d652b21261f0 100644
--- a/drivers/platform/x86/intel/pmt/class.c
+++ b/drivers/platform/x86/intel/pmt/class.c
@@ -8,6 +8,7 @@
  * Author: "Alexander Duyck" <alexander.h.duyck@linux.intel.com>
  */
=20
+#include <linux/bitfield.h>
 #include <linux/kernel.h>
 #include <linux/log2.h>
 #include <linux/intel_vsec.h>
@@ -368,26 +369,40 @@ static int intel_pmt_dev_register(struct intel_pmt_en=
try *entry,
 	return ret;
 }
=20
-int intel_pmt_dev_create(struct intel_pmt_entry *entry, struct intel_pmt_n=
amespace *ns,
-			 struct intel_vsec_device *intel_vsec_dev, int idx)
+static int pmt_read_header(struct intel_vsec_device *ivdev, int idx,
+			   struct intel_pmt_entry *entry)
 {
-	struct device *dev =3D &intel_vsec_dev->auxdev.dev;
-	struct resource	*disc_res;
-	int ret;
+	struct intel_pmt_header *header =3D &entry->header;
+	struct device *dev =3D &ivdev->auxdev.dev;
+	u64 headers[2];
=20
-	disc_res =3D &intel_vsec_dev->resource[idx];
-
-	entry->disc_table =3D devm_ioremap_resource(dev, disc_res);
+	entry->disc_table =3D devm_ioremap_resource(dev, &ivdev->resource[idx]);
 	if (IS_ERR(entry->disc_table))
 		return PTR_ERR(entry->disc_table);
=20
+	memcpy_fromio(headers, entry->disc_table, 2 * sizeof(u64));
+
+	header->access_type =3D FIELD_GET(PMT_ACCESS_TYPE, headers[0]);
+	header->telem_type =3D FIELD_GET(PMT_TELEM_TYPE, headers[0]);
+	header->size =3D PMT_GET_SIZE_BYTES(headers[0]);
+	header->guid =3D FIELD_GET(PMT_GUID32, headers[0]);
+	header->base_offset =3D FIELD_GET(PMT_BASE_OFFSET, headers[1]);
+
+	return 0;
+}
+
+int intel_pmt_dev_create(struct intel_pmt_entry *entry, struct intel_pmt_n=
amespace *ns,
+			 struct intel_vsec_device *intel_vsec_dev, int idx)
+{
+	int ret;
+
 	if (ns->pmt_pre_decode) {
 		ret =3D ns->pmt_pre_decode(intel_vsec_dev, entry);
 		if (ret)
 			return ret;
 	}
=20
-	ret =3D ns->pmt_header_decode(entry, dev);
+	ret =3D pmt_read_header(intel_vsec_dev, idx, entry);
 	if (ret)
 		return ret;
=20
@@ -397,11 +412,11 @@ int intel_pmt_dev_create(struct intel_pmt_entry *entr=
y, struct intel_pmt_namespa
 			return ret;
 	}
=20
-	ret =3D intel_pmt_populate_entry(entry, intel_vsec_dev, disc_res);
+	ret =3D intel_pmt_populate_entry(entry, intel_vsec_dev, &intel_vsec_dev->=
resource[idx]);
 	if (ret)
 		return ret;
=20
-	return intel_pmt_dev_register(entry, ns, dev);
+	return intel_pmt_dev_register(entry, ns, &intel_vsec_dev->auxdev.dev);
 }
 EXPORT_SYMBOL_NS_GPL(intel_pmt_dev_create, "INTEL_PMT");
=20
diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x86/=
intel/pmt/class.h
index 8a0db0ef58c1..96ebb15f0053 100644
--- a/drivers/platform/x86/intel/pmt/class.h
+++ b/drivers/platform/x86/intel/pmt/class.h
@@ -11,6 +11,19 @@
=20
 #include "telemetry.h"
=20
+/* PMT Discovery Table DWORD 1 */
+#define PMT_ACCESS_TYPE		GENMASK_ULL(3, 0)
+#define PMT_TELEM_TYPE		GENMASK_ULL(7, 4)
+#define PMT_SIZE		GENMASK_ULL(27, 12)
+#define PMT_GUID32		GENMASK_ULL(63, 32)
+
+/* PMT Discovery Table DWORD 2 */
+#define PMT_BASE_OFFSET		GENMASK_ULL(31, 0)
+#define PMT_TELE_ID		GENMASK_ULL(63, 32)
+
+/* Convert DWORD size to bytes */
+#define PMT_GET_SIZE_BYTES(h)	((FIELD_GET(PMT_SIZE, h)) * sizeof(u32))
+
 /* PMT access types */
 #define ACCESS_BARID		2
 #define ACCESS_LOCAL		3
@@ -61,8 +74,6 @@ struct intel_pmt_entry {
 struct intel_pmt_namespace {
 	const char *name;
 	struct xarray *xa;
-	int (*pmt_header_decode)(struct intel_pmt_entry *entry,
-				 struct device *dev);
 	int (*pmt_pre_decode)(struct intel_vsec_device *ivdev,
 			      struct intel_pmt_entry *entry);
 	int (*pmt_post_decode)(struct intel_vsec_device *ivdev,
diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x=
86/intel/pmt/crashlog.c
index f936daf99e4d..ef1826b15cf4 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -26,14 +26,8 @@
=20
 /* Crashlog Discovery Header */
 #define CONTROL_OFFSET		0x0
-#define GUID_OFFSET		0x4
-#define BASE_OFFSET		0x8
-#define SIZE_OFFSET		0xC
-#define GET_ACCESS(v)		((v) & GENMASK(3, 0))
 #define GET_TYPE(v)		(((v) & GENMASK(7, 4)) >> 4)
 #define GET_VERSION(v)		(((v) & GENMASK(19, 16)) >> 16)
-/* size is in bytes */
-#define GET_SIZE(v)		((v) * sizeof(u32))
=20
 /*
  * Type 1 Version 0
@@ -516,28 +510,11 @@ static int pmt_crashlog_pre_decode(struct intel_vsec_=
device *ivdev,
 	return 0;
 }
=20
-static int pmt_crashlog_header_decode(struct intel_pmt_entry *entry,
-				      struct device *dev)
-{
-	void __iomem *disc_table =3D entry->disc_table;
-	struct intel_pmt_header *header =3D &entry->header;
-
-	header->access_type =3D GET_ACCESS(readl(disc_table));
-	header->guid =3D readl(disc_table + GUID_OFFSET);
-	header->base_offset =3D readl(disc_table + BASE_OFFSET);
-
-	/* Size is measured in DWORDS, but accessor returns bytes */
-	header->size =3D GET_SIZE(readl(disc_table + SIZE_OFFSET));
-
-	return 0;
-}
-
 static DEFINE_XARRAY_ALLOC(crashlog_array);
 static struct intel_pmt_namespace pmt_crashlog_ns =3D {
 	.name =3D "crashlog",
 	.xa =3D &crashlog_array,
 	.pmt_pre_decode =3D pmt_crashlog_pre_decode,
-	.pmt_header_decode =3D pmt_crashlog_header_decode,
 };
=20
 /*
diff --git a/drivers/platform/x86/intel/pmt/telemetry.c b/drivers/platform/=
x86/intel/pmt/telemetry.c
index d22f633638be..80773e3c3efa 100644
--- a/drivers/platform/x86/intel/pmt/telemetry.c
+++ b/drivers/platform/x86/intel/pmt/telemetry.c
@@ -27,14 +27,6 @@
=20
 #include "class.h"
=20
-#define TELEM_SIZE_OFFSET	0x0
-#define TELEM_GUID_OFFSET	0x4
-#define TELEM_BASE_OFFSET	0x8
-#define TELEM_ACCESS(v)		((v) & GENMASK(3, 0))
-#define TELEM_TYPE(v)		(((v) & GENMASK(7, 4)) >> 4)
-/* size is in bytes */
-#define TELEM_SIZE(v)		(((v) & GENMASK(27, 12)) >> 10)
-
 /* Used by client hardware to identify a fixed telemetry entry*/
 #define TELEM_CLIENT_FIXED_BLOCK_GUID	0x10000000
=20
@@ -69,23 +61,6 @@ static bool pmt_telem_region_overlaps(struct device *dev=
, u32 guid, u32 type)
 	return false;
 }
=20
-static int pmt_telem_header_decode(struct intel_pmt_entry *entry,
-				   struct device *dev)
-{
-	void __iomem *disc_table =3D entry->disc_table;
-	struct intel_pmt_header *header =3D &entry->header;
-
-	header->access_type =3D TELEM_ACCESS(readl(disc_table));
-	header->guid =3D readl(disc_table + TELEM_GUID_OFFSET);
-	header->base_offset =3D readl(disc_table + TELEM_BASE_OFFSET);
-
-	/* Size is measured in DWORDS, but accessor returns bytes */
-	header->size =3D TELEM_SIZE(readl(disc_table));
-	header->telem_type =3D TELEM_TYPE(readl(entry->disc_table));
-
-	return 0;
-}
-
 static int pmt_telem_post_decode(struct intel_vsec_device *ivdev,
 				 struct intel_pmt_entry *entry)
 {
@@ -135,7 +110,6 @@ static DEFINE_XARRAY_ALLOC(telem_array);
 static struct intel_pmt_namespace pmt_telem_ns =3D {
 	.name =3D "telem",
 	.xa =3D &telem_array,
-	.pmt_header_decode =3D pmt_telem_header_decode,
 	.pmt_post_decode =3D pmt_telem_post_decode,
 	.pmt_add_endpoint =3D pmt_telem_add_endpoint,
 };
--=20
2.43.0

