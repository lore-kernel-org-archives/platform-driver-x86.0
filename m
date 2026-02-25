Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5A6256C84;
	Wed, 25 Feb 2026 01:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771984225; cv=none; b=rwYY9H4BQdc2IaB99znWvhbZDhYeEnxcyaaGADvMDz4ZpWAAILKErgd6x4v4F6ua6mTL0aIGG8uNWjDXS+xV4q2WSfKZe4ZTsTzPKUHRW/yntCBZ2sPJDDtmQbXsL/mjWiaLzrbXg2GKOws/u9tO7piyyXeWssT1PqfxPKoDAKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771984225; c=relaxed/simple;
	bh=fSIiv1MGJjtDsU7kc0w3muW7oyI7Q9GUEUBMC+2vOjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UQ84HysBkr1b6SPMBy/XYOaVwi67e7a07StLPZ33jeeCt2A+hbcQXEO5X84YUPPYMMWFFvz2ZmyWwupGO9mfmPMWNdqVoasvg/oTLa2OSlmAGDsWG3tNnx/14IejoHuOG7Sm1rp4gvbsoC3GcDZm5qPCP2AA7NYx+DedBi4lEjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vg8ocu3T; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vg8ocu3T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771984225; x=1803520225;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fSIiv1MGJjtDsU7kc0w3muW7oyI7Q9GUEUBMC+2vOjQ=;
  b=Vg8ocu3TohBOHMjSn2L/4dpznmq4qRXcY3dpmxaYA9koInJjBbheMxUD
   juBZ0bxw3rF0zgx4KXgHl1toEEF4yoxNYnwkX2dTVd6G8uyzN8uuSmVvo
   RJ/sl1QZMNobz4xtQdjn8GfVsFcAkgeRP8UWj/dF7d+Rz3UjxNkgF8NYi
   L3f3nE1Veer/q+cZy+pmfFMdB8mOQR1YUPFdNJDcWYcpKLHZenrKdRG0O
   5abFjLnlBNKgnR48CAwNUf6km/uuum1wleCd6agNJPHLAj4UHhp8uaZN5
   dKweKuO+p2/HM8Rqv028FzL9KMA+C6rKQeOk+9uwlRkW/hQfqxwRL8SlI
   g==;
X-CSE-ConnectionGUID: NXKVm2EUTLam7pOrt7DWAg==
X-CSE-MsgGUID: WZxsv50aTref7pJYBRYAfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="76622919"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="76622919"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 17:50:22 -0800
X-CSE-ConnectionGUID: YiekmFIiQXe8nD43mFzdAQ==
X-CSE-MsgGUID: etfffBWVR6Czh7MjhhodMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="216096186"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 17:50:21 -0800
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
Subject: [PATCH v5 5/6] platform/x86/intel/vsec: Return real error codes from registration path
Date: Tue, 24 Feb 2026 17:50:11 -0800
Message-ID: <20260224-upstream-pmt-acpi-v5-v5-5-8dd73bcf049c@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224-upstream-pmt-acpi-v5-v5-0-8dd73bcf049c@linux.intel.com>
References: <20260224-upstream-pmt-acpi-v5-v5-0-8dd73bcf049c@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Changes in v5:
- No change

Changes in v4:
- No change

Changes in v3:
- No change

Changes in v2:
- No chnage (previous patch 3)

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
