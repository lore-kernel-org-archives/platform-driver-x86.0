Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6996D363C77;
	Thu, 22 Jan 2026 01:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769046605; cv=none; b=GRIRCcgL1cyV9UTjAgNWxS+9JitAq8Xrn7W00JUdQrcJcOBIyCxpikwDREX1kZ28UzIuzImOqGC6CbvfqBQo/yEEpVbKf4Jsppwq3LCvDvEmrT80/X6S6hBmNoz7V0Lqh0Cq5bdCNvYxojzpLuSXfnyCc8CoYEH+n4YdmrRLu2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769046605; c=relaxed/simple;
	bh=LXx/yKCUpEf6dCzC9OPUHqNbTAkeWvD/lrjM3M9ASx4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TUVQLQI1CfHBOpEBpeDtyOSwasrClDBOPektUOs/urzyomCu+hO5M4OifMiyCxByYBR3dBGdOvu3J/u4k0VPhc/RS5AZq+rEW2Ed5v4B9TMGlX0kkhJK1miRyjJHx1yimFdeh3wBkdAlmUpGI0y7hbDNoDN2/nQa6QIFKIcs2q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AerI4bHV; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AerI4bHV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769046604; x=1800582604;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LXx/yKCUpEf6dCzC9OPUHqNbTAkeWvD/lrjM3M9ASx4=;
  b=AerI4bHVTFuZpG0vMmXVKXO5rIKXu11VEd8RhqYj6QKQksQkJ8BT4822
   cb67c7u6oNmD5aGB0a7AV9s1GQlzO3VbQGqUaheWkEXAlzxM1c8rriOD1
   u7l5gkV9VIMB+X1yaNPWCNrX7hvUfrn/ReFrPrmindXQ7AAxh5heehjg0
   HdeiZLQNrBlUapB/Bq3hRSeYHm8YbV+9CLX5kLy48V+cUsa0Q7riM8NxS
   inBm9w3B2Nz141tiVmY0YkAkYOzMRaER5ShUsqIP3jZiK9Eg2/hzOi9Fo
   WCt67HgyJCtZbBM7pBCEoDkzGiZDUJG3dk7f+z2OhRV6S9WcJgM+1j86Y
   g==;
X-CSE-ConnectionGUID: eNCT8bHeQNa6GOh/9cCLYg==
X-CSE-MsgGUID: dl/lK9B/QSii3xorhNtWMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="73910941"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="73910941"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 17:49:56 -0800
X-CSE-ConnectionGUID: S6lBprw4SgK8ubActwou7g==
X-CSE-MsgGUID: iOchXWQUS7amNCBuloDxOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="211616432"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 17:49:56 -0800
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
Subject: [PATCH v2 5/6] platform/x86/intel/vsec: Return real error codes from registration path
Date: Wed, 21 Jan 2026 17:49:46 -0800
Message-ID: <20260122014948.3158069-6-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260122014948.3158069-1-david.e.box@linux.intel.com>
References: <20260122014948.3158069-1-david.e.box@linux.intel.com>
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

