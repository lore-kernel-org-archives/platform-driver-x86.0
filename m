Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23CE37AA86;
	Fri, 23 Jan 2026 02:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769136728; cv=none; b=Ai4XJtKG5uxyomDcTyNySyIot4ds5gpWpFEwmMonqBTGCRw9sKspsY9Hi2oW+APuMbTX8VmLSVRMtmEHC3tsTADPzxXabhtvf1J7Ay35Md40f0N87JEEZx2rjsqKrO4VMHGt94vZ+E9ZEWod0DPr/fKGPC/CbwmvPszjI8stYd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769136728; c=relaxed/simple;
	bh=IkFZpzs541WQmSZtkua5evkrxZci3tNerzy+F0bK7ww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OTgD7q/H1gUf1NUMEKhDBB4Df/znWoTs1RFYS+Ozj4+E5AebphjOSRDjZxPvHj7frkvFGFiRiRSbhmmgB0EtWvTUjh2x1iYV+xc3sGKSNp41B5/x51aiNoysw0g2xnIA3FSxaFG4sEa7vn9ZhzXF5lBhaRFFpDLbGSg6s0e0lAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dixad80U; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dixad80U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769136698; x=1800672698;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IkFZpzs541WQmSZtkua5evkrxZci3tNerzy+F0bK7ww=;
  b=dixad80UhPblUTSSJ+11KbFpmsfDjx/JxIrVU5KdXowRBrafU1MIF54x
   VYYxcx/4EN1GiPYYf+ER51MMGj8uEysHN1WjRIrI7QuxW1aKLbSp2ionS
   BQ+32lNYN2l2T17fjEHZUa5NXfgcKmXuli4dAPvz2WdnZ5bsvi2pOwc2f
   gT2Q6n7ND9f6txE2kMaXYRs9RjJ3ltp36u5bX5K1v3aHX6NQFwiNGv2nh
   KfwhAZoSfnPB6NYHGTZ3s3rSp1WKzjcuqVYQgWSWvOYswcGBj/lU9k4r9
   60epV+xjlbdVDO/3YuhQU+7L2EOWuYwPOuHELzfic6dBCG4hsbvI2+SO5
   g==;
X-CSE-ConnectionGUID: +wm1AYW3T02FAtoY7g9btQ==
X-CSE-MsgGUID: VeIHAPByRo207bCb0aKVyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="81016467"
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="81016467"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 18:51:19 -0800
X-CSE-ConnectionGUID: cTbTRGHRS3OaOuNuE5QadA==
X-CSE-MsgGUID: 3YoWD05sTn2ev9TIILltqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="211773102"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 18:51:18 -0800
From: "David E. Box" <david.e.box@linux.intel.com>
To: thomas.hellstrom@linux.intel.com,
	rodrigo.vivi@intel.com,
	irenic.rajneesh@gmail.com,
	ilpo.jarvinen@linux.intel.com,
	srinivas.pandruvada@linux.intel.com,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	xi.pardee@linux.intel.com
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v4 5/6] platform/x86/intel/vsec: Return real error codes from registration path
Date: Thu, 22 Jan 2026 18:51:06 -0800
Message-ID: <20260123025108.3772255-6-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260123025108.3772255-1-david.e.box@linux.intel.com>
References: <20260123025108.3772255-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Stop collapsing registration results into booleans. Make
intel_vsec_walk_header() return int and propagate the first non-zero error
from intel_vsec_register_device(). intel_vsec_register() now returns that
error directly and 0 on success.

This preserves success behavior while surfacing meaningful errors instead
of hiding them behind a bool/-ENODEV, which makes debugging and probe
ordering issues clearer.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
---
v4:
  - No change

v3:
  - No change

v2:
  - No change (previous patch 3)

 drivers/platform/x86/intel/vsec.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel=
/vsec.c
index 675074c90b79..4aeb0728b435 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -461,20 +461,19 @@ static int intel_vsec_register_device(struct device *=
dev,
 	return -EAGAIN;
 }
=20
-static bool intel_vsec_walk_header(struct device *dev,
-				   const struct intel_vsec_platform_info *info)
+static int intel_vsec_walk_header(struct device *dev,
+				  const struct intel_vsec_platform_info *info)
 {
 	struct intel_vsec_header **header =3D info->headers;
-	bool have_devices =3D false;
 	int ret;
=20
 	for ( ; *header; header++) {
 		ret =3D intel_vsec_register_device(dev, *header, info, info->base_addr);
-		if (!ret)
-			have_devices =3D true;
+		if (ret)
+			return ret;
 	}
=20
-	return have_devices;
+	return 0;
 }
=20
 static bool intel_vsec_walk_dvsec(struct pci_dev *pdev,
@@ -580,10 +579,7 @@ int intel_vsec_register(struct device *dev,
 	if (!dev || !info || !info->headers)
 		return -EINVAL;
=20
-	if (!intel_vsec_walk_header(dev, info))
-		return -ENODEV;
-	else
-		return 0;
+	return intel_vsec_walk_header(dev, info);
 }
 EXPORT_SYMBOL_NS_GPL(intel_vsec_register, "INTEL_VSEC");
=20
--=20
2.43.0

