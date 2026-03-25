Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FBD2773E5;
	Wed, 25 Mar 2026 01:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774403310; cv=none; b=tyJo88C49jXycQJNjFV2Yuqr3E7x60AFx3k2RwxW8qNg8jOoCp7VrENVuDuCfw3ajpcDWEMgoGwJyG9q2Gkt0OW3eHYWhx2MBQjf5D7Xqqs0s4BqybC4RpK2Aco/ZwNONNri5YOG7dJQULyF8gH2aQmI/WMizuRhfJAtLF+KguI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774403310; c=relaxed/simple;
	bh=LXgyDtKXXnbiORT6eUF+1y0ZABeSt4RDb1/na+wDnxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bPfzt+iRacqji2/aq0MrR2PLNEC5b3fhP28MnDFx8EUzPF/Ze/jjfO6BLRI4qSVDWcKL1wfTSm+d626bl5jvl0z47Hc3VCIzcjrE2i4Ttko4WXojPOR+jawfswjmRWu3XUi6nkMJ33SUg6dqTG8GgBvsSEy9cbLtpEa6r5EDPeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K4z5MN0H; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K4z5MN0H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774403309; x=1805939309;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LXgyDtKXXnbiORT6eUF+1y0ZABeSt4RDb1/na+wDnxA=;
  b=K4z5MN0Hph2V4timpuDwXyFNkCVmLCi5FxVm6GHlNVxGT2BsF7CZiMBq
   8snv73xQK9rc7V+3QkDQwiIhfMVXumBLVayZi19IgU7TYkQqOn/q2rVP+
   3nhKdBk1IbkPjMeAJeKQTVSYOlopipTNc3vpMaGdu43jBnJa03G8kWBa/
   KtfCj3Bj0d3yH40bVdgivnBGchyxr0KLMN/P2kTfXWFIyDrBytll/78I8
   uNR2/9xQghrFaPC78eClCLL9RO35OxVl8ef0582MEu+QQHO1RQzVsxhYS
   nnhPW3OVoNFLrz0Z3jDiJ7qSheQ+N7r3lBptNuzievU++u+iJj3+Jx4PW
   Q==;
X-CSE-ConnectionGUID: sUB1Ood8TUmrbrCH0bfHcQ==
X-CSE-MsgGUID: XzvH6g+NR+ySGzBOxgm0tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75317498"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="75317498"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 18:48:27 -0700
X-CSE-ConnectionGUID: TwOHORClSSmRRNItJsoWmQ==
X-CSE-MsgGUID: vTAqKqF3SOSRbx/AQbVQOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="221190780"
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
Subject: [PATCH V2 05/17] platform/x86/intel/pmt: Pass discovery index instead of resource
Date: Tue, 24 Mar 2026 18:48:07 -0700
Message-ID: <20260325014819.1283566-6-david.e.box@linux.intel.com>
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

Change PMT class code to pass a discovery index rather than a direct struct
resource when creating entries. This allows the class to identify the
discovery source generically without assuming PCI BAR resources. For PCI
devices, the index still resolves to a resource in the intel_vsec_device.
Other discovery sources, such as ACPI, can use the same index without
needing a struct resource.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---

V2 - No changes

 drivers/platform/x86/intel/pmt/class.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/=
intel/pmt/class.c
index d652b21261f0..3fcea6a6e763 100644
--- a/drivers/platform/x86/intel/pmt/class.c
+++ b/drivers/platform/x86/intel/pmt/class.c
@@ -207,11 +207,12 @@ EXPORT_SYMBOL_GPL(intel_pmt_class);
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
@@ -236,6 +237,7 @@ static int intel_pmt_populate_entry(struct intel_pmt_en=
try *entry,
 		 * For access_type LOCAL, the base address is as follows:
 		 * base address =3D end of discovery region + base offset
 		 */
+		disc_res =3D &ivdev->resource[idx];
 		entry->base_addr =3D disc_res->end + 1 + header->base_offset;
=20
 		/*
@@ -412,7 +414,7 @@ int intel_pmt_dev_create(struct intel_pmt_entry *entry,=
 struct intel_pmt_namespa
 			return ret;
 	}
=20
-	ret =3D intel_pmt_populate_entry(entry, intel_vsec_dev, &intel_vsec_dev->=
resource[idx]);
+	ret =3D intel_pmt_populate_entry(entry, intel_vsec_dev, idx);
 	if (ret)
 		return ret;
=20
--=20
2.43.0

