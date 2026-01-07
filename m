Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863851DED42;
	Wed,  7 Jan 2026 00:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767745337; cv=none; b=HvVPAsjipI7bA+pDUAA9Is2LNO1itAQ4n97nSMar3AiS64JTW/6uYGpO0dU2fq9QcKEwXdXyAlZXPwXjz8iMOvwcoK49BYXfyuB9wcsQuvRFjEEv7wvBMA/lUNBqDdFnC0HzX4VJ4Q6FEFEt3IXRa7eR9GjHZeIl7mfGlkpRytw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767745337; c=relaxed/simple;
	bh=PqjVYCDUKkqMaY/J6kWsbzjBfCex8qasIuQ9PbHpHV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KgjU+TP6S2wt3aDfyrdmHMgqrqqNWr9Vw5x6F9vtlb6tDo2yEiqMCa09qPvKE9CtT79Ct4QsgT5TcujG7fe/jr58F4+0IdS99X0zF8gHsXbLnvs/Z31XmDbHsuTMPPC1wZVzBJETV5OEtpnMyQhp1KS8he6/ol1kBmLAEd4wJGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AUq5VP8k; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AUq5VP8k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767745336; x=1799281336;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PqjVYCDUKkqMaY/J6kWsbzjBfCex8qasIuQ9PbHpHV8=;
  b=AUq5VP8kI17rRBKvDdUTvP06Up3Ofzp5X9QCYtWrPo74+voYp8MIr91t
   1IbhIx5+7Sp+dQUFkxXNIK16Im53jRKUwunUZWNqNY/fhx8Y/Z+a+1Nqr
   QB1XXYEWQr+HHo93GDtOefMCbdvX602wdls8osBpjSs0s5u/nVd/i8FGX
   fSEdWlPF5oa9twfDoJ+/9grdxBSUVkWn9G5fKQviLlCwlmNVM5+FUJzyn
   Zsipa0UTKAL35RkrxNBcHw0ASKv87VMND4dKExvjf8O2lgRar8fc3tnFF
   DuQxm7HngI7QsDefyQacCfxjHuCJ4RSWF0Pu3qAtK1C7Qtg7uwkXBM7TQ
   g==;
X-CSE-ConnectionGUID: MGzK4MmLTh67i33SrwsJsQ==
X-CSE-MsgGUID: wiIUfLQMTdiUhChq5unF8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="69164122"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="69164122"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 16:22:09 -0800
X-CSE-ConnectionGUID: LStnZQhNSjqFXnmNQgn5Xw==
X-CSE-MsgGUID: eWEp3f3VSEuc64fUKPyPVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="206931525"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 16:22:08 -0800
From: "David E. Box" <david.e.box@linux.intel.com>
To: thomas.hellstrom@linux.intel.com,
	rodrigo.vivi@intel.com,
	irenic.rajneesh@gmail.com,
	ilpo.jarvinen@linux.intel.com,
	srinivas.pandruvada@linux.intel.com,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	xi.pardee@linux.intel.comn
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 3/4] platform/x86/intel/vsec: Return real error codes from registration path
Date: Tue,  6 Jan 2026 16:21:50 -0800
Message-ID: <20260107002153.63830-4-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107002153.63830-1-david.e.box@linux.intel.com>
References: <20260107002153.63830-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Stop collapsing registration results into booleans. Make
intel_vsec_walk_header() return int and propagate the first non-zero error
from intel_vsec_register_device(). intel_vsec_register() now returns that
error directly and 0 on success.

This preserves success behavior while surfacing meaningful errors instead
of hiding them behind a bool/-ENODEV, which makes debugging and probe
ordering issues clearer.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 drivers/platform/x86/intel/vsec.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel=
/vsec.c
index b84bb92624ef..42471fd609b1 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -461,20 +461,19 @@ static int intel_vsec_register_device(struct device *=
dev,
 	return -EAGAIN;
 }
=20
-static bool intel_vsec_walk_header(struct device *dev,
-				   struct intel_vsec_platform_info *info)
+static int intel_vsec_walk_header(struct device *dev,
+				  struct intel_vsec_platform_info *info)
 {
 	struct intel_vsec_header **header =3D info->headers;
-	bool have_devices =3D false;
 	int ret;
=20
 	for ( ; *header; header++) {
 		ret =3D intel_vsec_register_device(dev, *header, info);
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
@@ -582,10 +581,7 @@ int intel_vsec_register(struct device *dev,
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

