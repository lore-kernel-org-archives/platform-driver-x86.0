Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C525534CFD3;
	Thu, 11 Jun 2026 04:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781152495; cv=none; b=rtnBkbcfFOXJwGd875eMbvfEZeW+9spPeF66JxAwSgvEze44ZRtRNPTUxlaao62PJelV+lTJ59Hfavs2o6Y2mN5saWD70MlpZmIohXn5/E3Uc16bzfrUpNJthEc72c+eHrozDEeQuEqOttEnjK2Q8+7TdPj6+CPBi2v0lxbRG0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781152495; c=relaxed/simple;
	bh=Vz9ilumcl4r+acVdcF4bhFzi2Dgg4ui21QMNo07L2CQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fWLm1Vo/jdWsennKtDq3hPiTUn1QASB6jdjsDLB1TAvBaZ6crc5Bupvaa7QoY2ZolaW4+LwoKFbCRsj/tGMAu1gfhok8sHlY4q1jYnyWcLjix5sMbAHif+phTzFRn6IG5nHxzBeHGkE5IJbuCHmqoAeBJ/F4j2MzLIzaD+JYOT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aean4z/V; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aean4z/V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781152494; x=1812688494;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Vz9ilumcl4r+acVdcF4bhFzi2Dgg4ui21QMNo07L2CQ=;
  b=aean4z/VRrGXHXwLPuuOqIHkKGQ/vWXTMBpXV4uDZlyIKcZnP7oueGip
   /hdjrVjJ4oDBA1N55vsofAxS2FcLX2lfath1o6HZwEIK5FUWL+QgvzD1x
   09+eStwhYk8wdq9QoyJ579TycGxQ2v+BRjg9gM50gryKLVeQZM7o3LVpn
   BMNXImSQZftZAdb7Y7QstJRjof4hBpfbzcBVB5SSwEFyL2svlGYEepjfa
   b/+A0q7+NA7Q3htWAnl4V1MtlTIp28dVtSIkfUdGwDZGw9WiVxpp1tYjI
   2oi/3FikvUsbgTdPLWBX3niDsZCAzvOedOtPY2MFkcsQFSAkk9WLH9Bqk
   Q==;
X-CSE-ConnectionGUID: KiItgvNpQn+d8DgqcOLPsA==
X-CSE-MsgGUID: GH+QKJeeQIWN1mscDMn3qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="84530994"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="84530994"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 21:34:52 -0700
X-CSE-ConnectionGUID: R0TinJ2CSRmaJhpQT0OhQg==
X-CSE-MsgGUID: 0Rd1HbW7R3SYv1Qcm4B+Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="251468343"
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
Subject: [PATCH v7 04/15] platform/x86/intel/pmt: Pass discovery index instead of resource
Date: Wed, 10 Jun 2026 21:34:32 -0700
Message-ID: <294ce3bc80422043112838d4db02323b06181499.1781146840.git.david.e.box@linux.intel.com>
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

Change PMT class code to pass a discovery index rather than a direct struct
resource when creating entries. This allows the class to identify the
discovery source generically without assuming PCI BAR resources. For PCI
devices, the index still resolves to a resource in the intel_vsec_device.
Other discovery sources, such as ACPI, can use the same index without
needing a struct resource.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
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

