Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7ECA378D7B;
	Fri, 12 Jun 2026 21:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781298137; cv=none; b=e0RLA1GH9KOkRh4ylhlOl/5hFMk7dasUQzh0iLV1dED3Dn1qv9XJG/Q470ptBJeUDpftL9Vf4QrcQPD/dG8VOQLmokw6+GJCVzeCQ9n2CfW92bAk87/GHr4qbqu2Yl0glG8oHEMRxIlOMR3qoirw80fNnyXd1SAWjDT5y3YVc00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781298137; c=relaxed/simple;
	bh=shsubIcOJx7r9kv+cZT18jLRPEMLd/R2mTpleBFUREQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=URT8DfbBKRQ8WxdRYFJkTjcZifCjF1zRsaYo3GpUsg5PY9t360YuU2zgMK2lOgPgHI5qnNhfcFuNb8R/FbrFyMLSk7QwiN5lPB4i7AbQFlvdLbN883PE578J7bfZasu8E7MzmlY5GLqHT1wPrXB0fPqxfg5Y2J/R//rWDb4vhEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UQzhCfIf; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UQzhCfIf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781298136; x=1812834136;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=shsubIcOJx7r9kv+cZT18jLRPEMLd/R2mTpleBFUREQ=;
  b=UQzhCfIf7DlBG2E0b7wtPHCG+EFrX7aR/ekfP47jXojsl/kyi7LVJUS7
   f55HtLo6byR79phOTjc0Pv2JKJzEOljc08xWzgllbA2etwzYZTU9ZMkz2
   7IJXPp+WkiHWcZYSp6HblaJPCnmkOdkB2AKs26R8am+eO0HOzbPVHiLTY
   7X4KaIcWCQxpYbtuHmB4q3R1uNRfCfZdyOBmugAbNGmdVULUiQGeUUsGO
   WRCornyxh9Fr9ajxh7sXCiB5JRHvNReSKVfMCWJIKe+ZmxtzjcVPxDLub
   mztqEGIO2ROAz2cFIJpPhf9Ii5DsEsoFCfXpuu+B/c7XRHH8twHbXpOwL
   Q==;
X-CSE-ConnectionGUID: RGKHyb+GQvCKfs5j6FZOaA==
X-CSE-MsgGUID: hdvazc0oTdmSEMGX+EcxFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="86037980"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="86037980"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 14:02:12 -0700
X-CSE-ConnectionGUID: CfmByY+NSLKvD2qOS833Tw==
X-CSE-MsgGUID: RXtJ+Y0uShuZr98xNGakUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="250832862"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 14:02:11 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	irenic.rajneesh@gmail.com
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	xi.pardee@linux.intel.com
Subject: [PATCH v8 04/15] platform/x86/intel/pmt: Pass discovery index instead of resource
Date: Fri, 12 Jun 2026 14:01:45 -0700
Message-ID: <8e785902c6a3ac1b5a9c3f0f65096553dc5acd4f.1781294741.git.david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1781294741.git.david.e.box@linux.intel.com>
References: <cover.1781294741.git.david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Change PMT class code to pass a discovery index rather than a direct struct
resource when creating entries. This allows the class to identify the
discovery source generically without assuming PCI BAR resources. For PCI
devices, the index still resolves to a resource in the intel_vsec_device.
Other discovery sources, such as ACPI, can use the same index without
needing a struct resource.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
V8 - No changes

V7 - No changes

V6 - No changes

V5 - No changes

V4 - No changes

V3 changes:
  - Rebased after dropping the previous "Move header decode into common
    helper" patch
  - Adjusted the intel_pmt_populate_entry() call path to match the restored
    intel_pmt_dev_create() flow
  - Did not apply Ilpo V2 signoff due to these changes.

V2 - No changes

 drivers/platform/x86/intel/pmt/class.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/=
intel/pmt/class.c
index 9b315334a69b..7da8279b54f8 100644
--- a/drivers/platform/x86/intel/pmt/class.c
+++ b/drivers/platform/x86/intel/pmt/class.c
@@ -206,11 +206,12 @@ EXPORT_SYMBOL_GPL(intel_pmt_class);
=20
 static int intel_pmt_populate_entry(struct intel_pmt_entry *entry,
 				    struct intel_vsec_device *ivdev,
-				    struct resource *disc_res)
+				    int idx)
 {
 	struct pci_dev *pci_dev =3D to_pci_dev(ivdev->dev);
 	struct device *dev =3D &ivdev->auxdev.dev;
 	struct intel_pmt_header *header =3D &entry->header;
+	struct resource *disc_res;
 	u8 bir;
=20
 	/*
@@ -235,6 +236,7 @@ static int intel_pmt_populate_entry(struct intel_pmt_en=
try *entry,
 		 * For access_type LOCAL, the base address is as follows:
 		 * base address =3D end of discovery region + base offset
 		 */
+		disc_res =3D &ivdev->resource[idx];
 		entry->base_addr =3D disc_res->end + 1 + header->base_offset;
=20
 		/*
@@ -397,7 +399,7 @@ int intel_pmt_dev_create(struct intel_pmt_entry *entry,=
 struct intel_pmt_namespa
 			return ret;
 	}
=20
-	ret =3D intel_pmt_populate_entry(entry, intel_vsec_dev, disc_res);
+	ret =3D intel_pmt_populate_entry(entry, intel_vsec_dev, idx);
 	if (ret)
 		return ret;
=20
--=20
2.43.0

