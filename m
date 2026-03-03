Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A1534751F;
	Tue,  3 Mar 2026 05:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772515207; cv=none; b=iX5boLQcTg76PwZrrSIU+O2nP/YhiuJOFf1to8XHM1wmxdRM5J8a5tJTzFirXstA+1a9tQYUUqtNxyrVRIKVCaRPtPkxeBR0a+WDJ+nwMhzBJ5JS2qSmBKZsipzHr8fB2A4Gu0lPGo3Cql2KdUXh9qUZwJWF7+w+6dQkDg4AUs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772515207; c=relaxed/simple;
	bh=XjAt9ULcdjkGNQNSzEQqU6CAR4EsbvsDM7nysjGXakA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WWyuCoGJCU8Ki32GM/l/3EQm9UdN8dTxmmkm2o+2hOdrh421uFqLAlXuLQbuPmbTe2qOvJGLvNpX+7G1XKTA+BTbC6G9i5fgPdOjulY2q+vo62JZqa0Xll9Gw2zuxFrwDS/g4HqyDRroAOQXpdXw50LzzDaBo+oRmMUULhR0j3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HH7zUhju; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HH7zUhju"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772515207; x=1804051207;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XjAt9ULcdjkGNQNSzEQqU6CAR4EsbvsDM7nysjGXakA=;
  b=HH7zUhjupMysa/BicXC60lDQaMboorcnR7FpOP6us3g3qOwOL3Lqugym
   NHuJNO29XgKReH54qNXZxnInw27rVrDyiZa5tZMZZxj+osbUNgHVqw3Km
   YhTRqU+Zc94NOF3ep5sKzTtQcUnQmggfyvWo8rC2V3/IOHTTh1MvIb4Xo
   /cCYpS9CGEHq85Nz139u/ze6kFimUKDuhHWCqeI/MT8xo9DlNz3vx6A31
   W9zyEydFNaoCOjpjpIhF+JRvMPNuGNKDsMKzlgZW1oxGvWqP4g+pW6tiN
   ELwnj4siJfHHKsOq19xaYCb3Xt1Cp6nzyj4Fq+pJu+ziaeNc26pdvfIQ0
   g==;
X-CSE-ConnectionGUID: imLqNRfmTfuzn2Ft6xsegg==
X-CSE-MsgGUID: 5xWEYy8FT12sTnQ2rD6MOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73445408"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="73445408"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 21:20:01 -0800
X-CSE-ConnectionGUID: 49jopBzyTtOXf/BZz5sQFg==
X-CSE-MsgGUID: ufLanesJQwOKXTGCHsN+3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="217110167"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 21:20:01 -0800
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
Subject: [PATCH v7 1/6] platform/x86/intel/vsec: Refactor base_addr handling
Date: Mon,  2 Mar 2026 21:19:48 -0800
Message-ID: <20260303051953.1453372-2-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303051953.1453372-1-david.e.box@linux.intel.com>
References: <20260303051953.1453372-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The base_addr field in intel_vsec_platform_info was originally added to
support devices that emulate PCI VSEC capabilities in MMIO. Previously,
the code would check at registration time whether base_addr was set,
falling back to the PCI BAR if not.

Refactor this by making base_addr an explicit function parameter. This
clarifies ownership of the value and removes conditional logic from
intel_vsec_add_dev(). It also enables making intel_vsec_platform_info
const in a later patch, since the function no longer needs to write to
info->base_addr.

No functional change intended.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
Changes in v7:
  - No change

Changes in v6:
  - No change

Changes in v5:
  - No change

Changes in v4:
  - No change

Changes in v3:
  - No change

Changes in v2:
  - Use pci_resource_start() macro instead of direct pdev->resource array
    access (suggested by Ilpo)

 drivers/platform/x86/intel/vsec.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel=
/vsec.c
index 5059d320edf8..46966edca03b 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -271,14 +271,13 @@ EXPORT_SYMBOL_NS_GPL(intel_vsec_add_aux, "INTEL_VSEC"=
);
=20
 static int intel_vsec_add_dev(struct pci_dev *pdev, struct intel_vsec_head=
er *header,
 			      struct intel_vsec_platform_info *info,
-			      unsigned long cap_id)
+			      unsigned long cap_id, u64 base_addr)
 {
 	struct intel_vsec_device __free(kfree) *intel_vsec_dev =3D NULL;
 	struct resource __free(kfree) *res =3D NULL;
 	struct resource *tmp;
 	struct device *parent;
 	unsigned long quirks =3D info->quirks;
-	u64 base_addr;
 	int i;
=20
 	if (info->parent)
@@ -310,11 +309,6 @@ static int intel_vsec_add_dev(struct pci_dev *pdev, st=
ruct intel_vsec_header *he
 	if (quirks & VSEC_QUIRK_TABLE_SHIFT)
 		header->offset >>=3D TABLE_OFFSET_SHIFT;
=20
-	if (info->base_addr)
-		base_addr =3D info->base_addr;
-	else
-		base_addr =3D pdev->resource[header->tbir].start;
-
 	/*
 	 * The DVSEC/VSEC contains the starting offset and count for a block of
 	 * discovery tables. Create a resource array of these tables to the
@@ -412,7 +406,8 @@ static int get_cap_id(u32 header_id, unsigned long *cap=
_id)
=20
 static int intel_vsec_register_device(struct pci_dev *pdev,
 				      struct intel_vsec_header *header,
-				      struct intel_vsec_platform_info *info)
+				      struct intel_vsec_platform_info *info,
+				      u64 base_addr)
 {
 	const struct vsec_feature_dependency *consumer_deps;
 	struct vsec_priv *priv;
@@ -428,7 +423,7 @@ static int intel_vsec_register_device(struct pci_dev *p=
dev,
 	 * For others using the exported APIs, add the device directly.
 	 */
 	if (!pci_match_id(intel_vsec_pci_ids, pdev))
-		return intel_vsec_add_dev(pdev, header, info, cap_id);
+		return intel_vsec_add_dev(pdev, header, info, cap_id, base_addr);
=20
 	priv =3D pci_get_drvdata(pdev);
 	if (priv->state[cap_id] =3D=3D STATE_REGISTERED ||
@@ -444,7 +439,7 @@ static int intel_vsec_register_device(struct pci_dev *p=
dev,
=20
 	consumer_deps =3D get_consumer_dependencies(priv, cap_id);
 	if (!consumer_deps || suppliers_ready(priv, consumer_deps, cap_id)) {
-		ret =3D intel_vsec_add_dev(pdev, header, info, cap_id);
+		ret =3D intel_vsec_add_dev(pdev, header, info, cap_id, base_addr);
 		if (ret)
 			priv->state[cap_id] =3D STATE_SKIP;
 		else
@@ -464,7 +459,7 @@ static bool intel_vsec_walk_header(struct pci_dev *pdev,
 	int ret;
=20
 	for ( ; *header; header++) {
-		ret =3D intel_vsec_register_device(pdev, *header, info);
+		ret =3D intel_vsec_register_device(pdev, *header, info, info->base_addr);
 		if (!ret)
 			have_devices =3D true;
 	}
@@ -512,7 +507,8 @@ static bool intel_vsec_walk_dvsec(struct pci_dev *pdev,
 		pci_read_config_dword(pdev, pos + PCI_DVSEC_HEADER2, &hdr);
 		header.id =3D PCI_DVSEC_HEADER2_ID(hdr);
=20
-		ret =3D intel_vsec_register_device(pdev, &header, info);
+		ret =3D intel_vsec_register_device(pdev, &header, info,
+						 pci_resource_start(pdev, header.tbir));
 		if (ret)
 			continue;
=20
@@ -557,7 +553,8 @@ static bool intel_vsec_walk_vsec(struct pci_dev *pdev,
 		header.tbir =3D INTEL_DVSEC_TABLE_BAR(table);
 		header.offset =3D INTEL_DVSEC_TABLE_OFFSET(table);
=20
-		ret =3D intel_vsec_register_device(pdev, &header, info);
+		ret =3D intel_vsec_register_device(pdev, &header, info,
+						 pci_resource_start(pdev, header.tbir));
 		if (ret)
 			continue;
=20
--=20
2.43.0

