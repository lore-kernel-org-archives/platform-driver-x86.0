Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E7F347FCC;
	Tue,  3 Mar 2026 05:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772515207; cv=none; b=X3tCCrpbfLgs0hP7PBhfSmgG3FSTCvTrcbfdz3H6GjABjgw1jqa816Hsl8IU9dWYCJJ+XaABKYXM4ePDqM0A1o32RtaVLOcjPrVZxYlpyccY3OA8EmutnijEfQQe+WkNOfLsMzq/vsYxMRVZ7uBnyDT91eWieQiE99xSjyMdsLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772515207; c=relaxed/simple;
	bh=IOayjJtDTZfdMge/Pz0t18B/ED4I6iuq6j8Enn7Aolk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lh6zHke6tFkSArzRw1YaB2fU5JhR7oZ/bYkyFgG1W2FdWzIslypXSHqH5isryJQiYyPojZ6vQkTz4Y9dTUrOC3R6PyaEJyHrebsyOXmkG3ohLnjbxsNOLFCPwiyR1Rpw6u7YNAilMIOYRY4KfBqyJmUqXrB60Vgkbhs2jS8RlMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AZMDgeNn; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AZMDgeNn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772515207; x=1804051207;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IOayjJtDTZfdMge/Pz0t18B/ED4I6iuq6j8Enn7Aolk=;
  b=AZMDgeNnklXhvjcnKJcGj1uu4BCnlojvkptBekih5xVUlBsrDrNKTdDi
   7sO9If67DyBH2e/hvH3anQCGI5f8NaYL9O+jYf3rfZ+lRtK/eDQEk7aFQ
   PC5AwSDGlnSi0vRqF3ifmdyC9FHbh+bqjFPhf4hC+dUPnupiR4bejsObJ
   QCylisfwVFZqA19LfQklHnoIcVIJHgWlYLT6BDD+QMeKfCtlFhYXyNmsW
   loG+tAyttbg5FI+ZfgTCICHmPDfg0DE1LPRAnP/9gomAca7L8WQIOhTPI
   9jEPfeciZZtzQ9fI9CdyowuMo2g7nPC9ZvX1L6rL4FpjusqyFIYNMsjd2
   g==;
X-CSE-ConnectionGUID: t6Wm3QcyT2+Ri3XW3mTeiQ==
X-CSE-MsgGUID: 0X1GV48ZSWGNqYdPWYlN7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73445424"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="73445424"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 21:20:01 -0800
X-CSE-ConnectionGUID: UjTuAvspSjq1BXUSTS30KQ==
X-CSE-MsgGUID: pro2r6E4Se63EWLhoU3WjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="217110179"
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
Subject: [PATCH v7 5/6] platform/x86/intel/vsec: Return real error codes from registration path
Date: Mon,  2 Mar 2026 21:19:52 -0800
Message-ID: <20260303051953.1453372-6-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303051953.1453372-1-david.e.box@linux.intel.com>
References: <20260303051953.1453372-1-david.e.box@linux.intel.com>
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

Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
Changes in v7:
  - No change
=20=20=20=20
Changes in v6:
  - No change
=20=20=20=20
Changes in v5:
  - No change
=20=20=20=20
Changes in v4:
  - No change
=20=20
Changes in v3:
  - No change
=20=20=20
Changes in v2:
  - No change (previous patch 3)

 drivers/platform/x86/intel/vsec.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel=
/vsec.c
index a547e4b98245..34b2c19ecff0 100644
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

