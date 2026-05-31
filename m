Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D71633D4E9;
	Sun, 31 May 2026 19:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780256789; cv=none; b=OGYkaIm21ApbOJtcTTQA+/vtZCtq+3WoqoHs58E5zKqyJYm/iZUu9xZ064c0qxcGNVedsSkjYDTkJSbpdvx9brfi7wV+CZOhkaHL459AUD1Vxgmcs3EWhC5iqckU9713WGdFGia1wqOzTLARrnXBzUCCG+K9LLWVaxiroOzyXR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780256789; c=relaxed/simple;
	bh=NrgzIXarc6mLPrjAFfyH9JlEN7ATq/mjHNfq0P6R3lA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Serdim9mEvL1Bn7wWOfBHr6Fjxz33wC2AUTuo7IBffB2tZJfG/04yxp0z+u27NSbggtY3CkwidBjd9nZUn/qzmefih6YaH+vBBEJtG2VGHcXwFD8oB1dKj0Ec8Q+BNRd/P62tzmg2f7w/c5g+0u36mFEg0oTFyc0NHm8QUHXe9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M8aRXf7Y; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M8aRXf7Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780256789; x=1811792789;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NrgzIXarc6mLPrjAFfyH9JlEN7ATq/mjHNfq0P6R3lA=;
  b=M8aRXf7YDjYvH6lRHyLIOBItFh1ZkihuEbY1tdV433DJq4cBTBL+uho1
   j7MlrTyyRhbCNdcP8V0UWGOIhFH0h75qiucDqbgHlJL2Vzp6lxYjEgVci
   Y2RV5iz1ljtw8V2R3DA8eNZcSwj2wetvq/Zyr9nsOwo2qBHa1zfGD+Po2
   WUgD+gy6QgMtp5WmksrXIzzYOepDSo5B1VzhwAXS7GxP9hkFgFk/LUdv/
   +bPmvF6+U1J24pKzWVuabefxnb9Y0TCX199GghcYbgfP7VLhNXUzEZOML
   EOlYj+iElXBI34T4RcTLlRFg5lPCyS9/surPC7kUVjqVQXu69ARGWtDkV
   Q==;
X-CSE-ConnectionGUID: AchrDBgRRfKY4ai3C1wv6w==
X-CSE-MsgGUID: IZq2PZ7KS/+sjETBc/P7LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="80751281"
X-IronPort-AV: E=Sophos;i="6.24,179,1774335600"; 
   d="scan'208";a="80751281"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 12:46:25 -0700
X-CSE-ConnectionGUID: XZMp1WyUSBCmto1I6VU/iQ==
X-CSE-MsgGUID: 8dJ/iHyYSfyYQQXq/cHx9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,179,1774335600"; 
   d="scan'208";a="247363894"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 12:46:25 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	irenic.rajneesh@gmail.com
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	srinivas.pandruvada@linux.intel.com,
	xi.pardee@linux.intel.com
Subject: [PATCH v6 04/15] platform/x86/intel/pmt: Pass discovery index instead of resource
Date: Sun, 31 May 2026 12:46:06 -0700
Message-ID: <cf859ac42b8b5a8dcfdf999dee86ce251587451f.1780248804.git.david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1780248804.git.david.e.box@linux.intel.com>
References: <cover.1780248804.git.david.e.box@linux.intel.com>
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

