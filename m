Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D782F28E3;
	Fri, 22 May 2026 02:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779416527; cv=none; b=EybX23NdIH629GaZhVh8upiZQEKGTmvI1w/u3FwZk0Vss0PqMRSOJFAiX8euVKcUqLKZMJuv+JC/ZKRntnQd7Rp+UkYq67wGWNPxudKs+X2LKo+j8StDZ9kII4BoaUCJAPQkvaaINJmV15cPPgnMXbIcH/L4ESfnWIR75cxUMLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779416527; c=relaxed/simple;
	bh=LI8YVMTRoNz4q2JSpYLuLeogGrOzJAXkSllN+bAB0zs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RWz3a97tOqmCOnDuf/3CIDjaHLcXJBYCStrPfv1GenJnfc6HfpGSspmSMj2EU4re/qEm8fV1XhKh9NDjacdDxVV9FREVBIfP8Qg+DAQ27LAx5Bin2qpB9RdD2egX10zO8VeDfy3c41OaR/5gUALjPlp7HwBMIeqc5+AGrvugiQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GeTU1GEd; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GeTU1GEd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779416522; x=1810952522;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LI8YVMTRoNz4q2JSpYLuLeogGrOzJAXkSllN+bAB0zs=;
  b=GeTU1GEdASyKTUiKIlXvgYlLLfrf4xKBnfwnAdkwWTUVRbCZ1EKzqUxb
   SFiS0zb/8KwLCQiP6zNWGKzJ9m4W5HkHftl6PIThUdBJrr2rrk71qYoR+
   r9NPwBlnMseSMlrCEwLB215SJ68UK3/Dj6WSqi6qqHZw4yy7nI13hDUl0
   8rqAKZ8VoYSWuP0XOdfUtUOfHCM5h3GbZ6IO5oNrKuDD9E6Ez2dGnejpI
   KtQSuKgKfzmSXrrXPsUg95DzVQAY4/FQK54U12yL56rdyeYazC13EG1Zd
   qsQ6yu8GyvJc2rRiYvjwsD1pfi5+3bL3iywI6sH71ktZlmJMyZaWvZi7f
   w==;
X-CSE-ConnectionGUID: qkyemUyXRZi5szHx72D92g==
X-CSE-MsgGUID: EVb2+VfnRi+tmTyTIf9vnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80400529"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="80400529"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 19:21:59 -0700
X-CSE-ConnectionGUID: JjYj9bKzR36GrBEzmoN27w==
X-CSE-MsgGUID: 40NKEcwtSAGQH0iMtBGC9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="236335373"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 19:21:59 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xi Pardee <xi.pardee@linux.intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v5 05/16] platform/x86/intel/pmt: Cache the telemetry discovery header
Date: Thu, 21 May 2026 19:21:35 -0700
Message-ID: <20260522022147.4137494-6-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522022147.4137494-1-david.e.box@linux.intel.com>
References: <20260522022147.4137494-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

pmt_telem_header_decode() only needs the discovery header dwords, but it
currently decodes them by reading directly from entry->disc_table.

Cache the discovery header in intel_pmt_entry when the device is created
and have telemetry decode use the cached values instead of performing MMIO
reads at decode time.

The DVSEC discovery resource for a namespace is sized by its per-entry
entry_size (in dwords), which can be less than the 4-dword cache (e.g.
telemetry uses entry_size =3D 3, i.e. 12 bytes). Cap the memcpy_fromio()
to resource_size(disc_res) so the new cache does not read past the
mapped region. Any unread dwords stay zero from the zero-initialized
allocation of the containing struct.

This keeps the telemetry header decode path independent of how the
discovery data is backed and avoids baking a direct MMIO assumption into
the feature-specific decode logic.

Assisted-by: GitHub-Copilot:claude-opus-4.7
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
V5 changes:
  - Cap memcpy_fromio() of the cached discovery header to
    resource_size(disc_res) so the newly introduced cache does not
    over-read namespaces whose DVSEC entry_size is smaller than the
    cache (e.g. telemetry has entry_size =3D 3, 12 bytes).

V4 - No changes

V3 changes:
  - New patch split out from PMT header-fetch rework to cache discovery
    header data before downstream decode/population.
  - Added to carry the post-v3 bug fix while preserving the original series
    ordering intent.

 drivers/platform/x86/intel/pmt/class.c     | 11 +++++++++++
 drivers/platform/x86/intel/pmt/class.h     |  1 +
 drivers/platform/x86/intel/pmt/telemetry.c | 12 ++++++------
 3 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/=
intel/pmt/class.c
index 7da8279b54f8..246e11837800 100644
--- a/drivers/platform/x86/intel/pmt/class.c
+++ b/drivers/platform/x86/intel/pmt/class.c
@@ -383,6 +383,17 @@ int intel_pmt_dev_create(struct intel_pmt_entry *entry=
, struct intel_pmt_namespa
 	if (IS_ERR(entry->disc_table))
 		return PTR_ERR(entry->disc_table);
=20
+	/*
+	 * The mapped discovery resource may be smaller than disc_header (its
+	 * size is the namespace's DVSEC entry_size in dwords, which can be
+	 * less than 4). Cap the copy to the actual resource size to avoid
+	 * reading past the mapped region; any unread dwords stay zero from
+	 * the zero-initialized allocation of the containing struct.
+	 */
+	memcpy_fromio(entry->disc_header, entry->disc_table,
+		      min_t(size_t, sizeof(entry->disc_header),
+			    resource_size(disc_res)));
+
 	if (ns->pmt_pre_decode) {
 		ret =3D ns->pmt_pre_decode(intel_vsec_dev, entry);
 		if (ret)
diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x86/=
intel/pmt/class.h
index 8a0db0ef58c1..84202fc7920c 100644
--- a/drivers/platform/x86/intel/pmt/class.h
+++ b/drivers/platform/x86/intel/pmt/class.h
@@ -44,6 +44,7 @@ struct intel_pmt_entry {
 	struct telem_endpoint	*ep;
 	struct pci_dev		*pcidev;
 	struct intel_pmt_header	header;
+	u32			disc_header[4];
 	struct bin_attribute	pmt_bin_attr;
 	const struct attribute_group *attr_grp;
 	struct kobject		*kobj;
diff --git a/drivers/platform/x86/intel/pmt/telemetry.c b/drivers/platform/=
x86/intel/pmt/telemetry.c
index d22f633638be..953f35b6daec 100644
--- a/drivers/platform/x86/intel/pmt/telemetry.c
+++ b/drivers/platform/x86/intel/pmt/telemetry.c
@@ -72,16 +72,16 @@ static bool pmt_telem_region_overlaps(struct device *de=
v, u32 guid, u32 type)
 static int pmt_telem_header_decode(struct intel_pmt_entry *entry,
 				   struct device *dev)
 {
-	void __iomem *disc_table =3D entry->disc_table;
 	struct intel_pmt_header *header =3D &entry->header;
+	u32 *disc_header =3D entry->disc_header;
=20
-	header->access_type =3D TELEM_ACCESS(readl(disc_table));
-	header->guid =3D readl(disc_table + TELEM_GUID_OFFSET);
-	header->base_offset =3D readl(disc_table + TELEM_BASE_OFFSET);
+	header->access_type =3D TELEM_ACCESS(disc_header[0]);
+	header->guid =3D disc_header[1];
+	header->base_offset =3D disc_header[2];
=20
 	/* Size is measured in DWORDS, but accessor returns bytes */
-	header->size =3D TELEM_SIZE(readl(disc_table));
-	header->telem_type =3D TELEM_TYPE(readl(entry->disc_table));
+	header->size =3D TELEM_SIZE(disc_header[0]);
+	header->telem_type =3D TELEM_TYPE(disc_header[0]);
=20
 	return 0;
 }
--=20
2.43.0

