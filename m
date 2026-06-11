Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3658C352035;
	Thu, 11 Jun 2026 04:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781152497; cv=none; b=ZDtOu5xeJnXFPfk5xObaLQsk9OaO6TpvuM/sI14skxpT2pQfLrB01n77zZ5YTX191YlPXnG9uQiFBAx8uNl+L9bTcoYy+W5FvgENmVmBcAogbtBFCjZLuGYNsYWipcr0dzoVFfeQoiP1RFy/vjZGJgHX5wCc7/ae2peyXLE5BZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781152497; c=relaxed/simple;
	bh=tqOUivDLbePFu+pvH9SVRpc6O2rT/1HuJ8Dr5EFHsUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jeif+ENU6ScQmKbqyCjjImUP7LFpvzn176jWoMeltguhSz+Jw7D8BVdzMobMtm1i5FPPIVbN4V99ATimPOsaP5Ht6iOonJJmZmnBx7ls+ApFgQ/gJAbtp0qneU4S28rdW0HV7fsk7aFk+sGgWWAQbEIDlu8VlbBRGbdAIacdz48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i9liS8IM; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i9liS8IM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781152495; x=1812688495;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tqOUivDLbePFu+pvH9SVRpc6O2rT/1HuJ8Dr5EFHsUU=;
  b=i9liS8IMPJa3Iy4D2E9gs9OVnQWWwVgJhJ8hYgLIn+B6KPGST0IVjXRZ
   xgWFV3fCVBqlrsdMYTFGL1Sfn6UvHE3XQ4enZFHtqmuUdw6Y4CD7eXc/U
   GmCTvoUd+3kZK0voujOb+LPEd6eh0bmE34nO7XMtsFtudRn+E2ddFkyYk
   6+CAz2nhZLSwI/wcPw7PgHaxae/Sof4cJEhP2QOJfUxM4eFlX8GhOlzTi
   amZHNiEsgxpyvVm0JB9jRPY3DAWIOhgJVyKbd6GxwID2LjacUnrl70piW
   1bmXJgokXVhhiGQCkfkUL2qqqhwtmtcrI26GaUrv9YsECfc5OtXhXcvCq
   A==;
X-CSE-ConnectionGUID: /e3c+oDARQa31oBM4v6nBQ==
X-CSE-MsgGUID: QBEoK0ypR2uM4YXiEepW3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="84530997"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="84530997"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 21:34:53 -0700
X-CSE-ConnectionGUID: h9y10CZEQp+CX5/ElKVgtg==
X-CSE-MsgGUID: /tRhj+8CT1KoVa7EjvRJhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="251468345"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 21:34:52 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	irenic.rajneesh@gmail.com
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	xi.pardee@linux.intel.com
Subject: [PATCH v7 05/15] platform/x86/intel/pmt: Cache the telemetry discovery header
Date: Wed, 10 Jun 2026 21:34:33 -0700
Message-ID: <a8ed255fbc473259d1db5247bbfb5089d6fe7c0b.1781146840.git.david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1781146840.git.david.e.box@linux.intel.com>
References: <cover.1781146840.git.david.e.box@linux.intel.com>
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
V7 changes:
  - Replaced min_t(size_t, ...) with min() because both operands are size_t
    (Ilpo).

V6 changes:
  - Added #include <linux/minmax.h> for min_t() macro used in
    memcpy_fromio() size calculation (Ilpo).

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
index 7da8279b54f8..8d27f59d5bff 100644
--- a/drivers/platform/x86/intel/pmt/class.c
+++ b/drivers/platform/x86/intel/pmt/class.c
@@ -12,6 +12,7 @@
 #include <linux/log2.h>
 #include <linux/intel_vsec.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/mm.h>
 #include <linux/pci.h>
@@ -383,6 +384,16 @@ int intel_pmt_dev_create(struct intel_pmt_entry *entry=
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
+		      min(sizeof(entry->disc_header), resource_size(disc_res)));
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

