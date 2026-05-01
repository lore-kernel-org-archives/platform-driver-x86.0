Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F136B37CD48;
	Fri,  1 May 2026 23:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777677064; cv=none; b=gaywzUjmiCHQNN71dxdO1xbq1x5ohIirhSGNjdchJIVT1Ud4bpJkZJ1IaYAU9Vw+lQ2hNy1o7EIKCFtN7iz2l8ybo6gxDq/M6pHksoNtxHxM6YY7AMlvfXyhQ8R43bXq4BwMHs1qCwb/VznjkbbbV/11dJk5Pg/RE7v1wiM1q9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777677064; c=relaxed/simple;
	bh=A1sN8k6CZmAVrfDmD5qnc2QOH0/B9xeXRU0w+LTVMts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D0MnkVaQxJllHBhOL+jxE9ke/RWZILMDev0CN3IV3VTysL+zUNme4XCPcWBhk5gNiZ5J060o+nMbKA1cvZeDu8nFGdae/s77+MGlLqJvFP3jSR+chyho2qZw/XSqzVvkvlwrYlcM5PaidhTvwABmfqSOBBxl0/OC9WLNO804Y9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cnWU9ehF; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cnWU9ehF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777677063; x=1809213063;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=A1sN8k6CZmAVrfDmD5qnc2QOH0/B9xeXRU0w+LTVMts=;
  b=cnWU9ehFLkAS7R9lKRQeKe6UBgormzIRKiq1WIOj9Uc+cbEQSjrfUYXD
   q72+x1IqqP4SkXkEWnn0VDKmnKMSlcUKPBg5dKPV5DopLgbvVu7jZ8nMc
   5P7Mso13w5UjNjymlVzLax9KBSosGRULkj4n0YZbIq1ljnUbsWoG1uObW
   P5mvfyhKlScJU5SWxP4qSKDvDhsEn3C8MxH7QKNZ2exaCQBCEMCHohPML
   pvJ9ZtVg95GDVq/HNrOvP8/hStCC6jV7XFSYlHWLpdpYBrBHGKm7Fzsu3
   yyurOtwqFp26AievHUuZ98e1dnubHJAgGBnJuAWAGnyWvxkN66+134Jhr
   Q==;
X-CSE-ConnectionGUID: bX3higxYRGy29u7XSE21Ew==
X-CSE-MsgGUID: vehFdk8QQr+fTog2rff8Sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="78740128"
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="78740128"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 16:11:00 -0700
X-CSE-ConnectionGUID: d8B3ibCdSUisVmiRAeB+og==
X-CSE-MsgGUID: 5wiDM8zRR8uEP54wEHxIGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="238948957"
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
Subject: [PATCH V3 04/16] platform/x86/intel/pmt: Pass discovery index instead of resource
Date: Fri,  1 May 2026 16:10:41 -0700
Message-ID: <20260501231054.3890305-5-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260501231054.3890305-1-david.e.box@linux.intel.com>
References: <20260501231054.3890305-1-david.e.box@linux.intel.com>
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

