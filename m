Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7159331A65;
	Fri, 13 Mar 2026 01:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773366743; cv=none; b=JlGl0Ar0ZH1qNKfVxsUAKdAqvTEEA3qQMu7iD1nK0WcnPYMvE16S0VqY8t2CVERnabt0omRKlCMsyEp8uqdUid7YQbUtvWIMeFqmzMpIgscvlOutVhfs7IXb6N/lcnAeb840lh2M9ozhQrLPf+ZNmNrvNrnVIrc6MPbbAJFALQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773366743; c=relaxed/simple;
	bh=oXXOP1gqycimx7oikYmx2NO26Ma/Qa/r2+tpGF/GmCg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WULpDLnFT/lF/8lo9GhKpP72KjEXuxEm/UpzWGOFDCZFQTvUIM/kaiFS/OmwyOqY4GQVAAGqn7rc/FUIdXv+fNARkdtx/8oFrw4qG3DzcGdl4ucnOt/sREwEcyV8qWqPDJTl8faykjlqQKqPIXQM1Usq/mQaxl6CeHP8jglq2xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y8y+9RXj; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y8y+9RXj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773366742; x=1804902742;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oXXOP1gqycimx7oikYmx2NO26Ma/Qa/r2+tpGF/GmCg=;
  b=Y8y+9RXjrzrnWh60UlLAsoCZyTSJMl1lXOIpf3zWFH9GzMg/7r7u7GaA
   10o8uJHAg/FXP1dIK/d5cSL+nusOKXpb2gGY7qhMhk8wAH1JX8GbP/Jil
   denFefmOezzXXmNP6bSwhk9gk1TYYsZST5mYs/iOZDf0G4skmVCz7lwmL
   nVICNtfRfAwhLxLxz8A0iGpNkk3ag5KsTIEL7SvndRjO4Ja+2qbOWITCZ
   ARpsl90x8KIoh48tuJFGqOr+x2cbCgBt0XyWD6EU9NDUsXsTDYruj1m7W
   AzJ4IUG1ucoor1pOgJHt1j8MLatM0hyIeuoKcxyrusgmKvZ0hJiGHyBm5
   g==;
X-CSE-ConnectionGUID: 2lWntya2SlmIEpe/zCmzsA==
X-CSE-MsgGUID: fjm2ck15QxaIzscfbYl0lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74354555"
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="74354555"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 18:52:12 -0700
X-CSE-ConnectionGUID: tpoATOHLSdKE+DtE+0Uxhg==
X-CSE-MsgGUID: Wmt5vo9rToi/S8iyG1jyRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="220108481"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 18:52:12 -0700
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
Subject: [PATCH 05/22] platform/x86/intel/vsec: Return real error codes from registration path
Date: Thu, 12 Mar 2026 18:51:44 -0700
Message-ID: <20260313015202.3660072-6-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313015202.3660072-1-david.e.box@linux.intel.com>
References: <20260313015202.3660072-1-david.e.box@linux.intel.com>
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

Previous changelog:
  Changes in v7:
  - No change
=20=20
  Changes in v6:
  - No change
=20=20
  Changes in v5:
  - No change
=20=20
  Changes in v4:
  - No change
=20=20
  Changes in v3:
  - No change
=20=20
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

