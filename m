Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5978410D32;
	Fri, 29 May 2026 18:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780079525; cv=none; b=eSMSCOTuAP1hFgVdjfdA5kFDP464OgmzUjc3I2wyURHUqENvZFlt+FzmKM7uQfLFOX4K45j1VWgCCsm5bNPdTHQMYzFT8G0WKQzDMj/S55S5oeuz8urC8IPkvBkzOg4xjgiAIbL6wtyBR2/I2MwTlnGuC5EUNM1CA2dG/psYPVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780079525; c=relaxed/simple;
	bh=WMH6cPQ6DeXEzvVXzjWhAajSkmqe1HU5AyBylQfcpYM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VLCHgZh+u9gYyltXBRkjZK2k53YzQ/schU/cIGCpCSocd49WLBr/BUh1PuX974uAgQAYJaPJcG1rhmTia8y9ffg8tEPayZdyZEXyb0kPQTqknqiV/vuH2jERRRF4RskAM8Ad/4HqC/CP8ynSOH8HDzuSNl9XyupmGzGf8pue3rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nHDYm9Iv; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nHDYm9Iv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780079521; x=1811615521;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WMH6cPQ6DeXEzvVXzjWhAajSkmqe1HU5AyBylQfcpYM=;
  b=nHDYm9IvMgZ5XDkfa+48XwxEx2QqHy+rDgReHd8NkdCkcwb81VOaH0xm
   EBgn9gTDpqb/j5hMlU3BLHj6+UD/voSHhUA4WvllzzwNjIPYo7eXllB/T
   SdTCllgCryp7VTf8Wnziagc+IAcmZouWuTr4jy6htvtkqLEyb6ti1F/K4
   rGJiBfrXdigdaPyH6Mg0ecMNy5/x4z44bKgBvkX/NYr/hda1OP8dr2nel
   bh3qdcMphpP73ekUjYebqv9bPqy0jJFm4I4HORCBFAF6YejslB5tTYS+2
   Zyj2afmdWyFCY2jllJuf3nZ3PPBSflx2YEM0x0PncMMlZWYMyIpGN+CWn
   g==;
X-CSE-ConnectionGUID: sk2gjqGISR6YYNsKZosNqA==
X-CSE-MsgGUID: D89y2ZlWSTmVMILAkCKuZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="92053462"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="92053462"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 11:32:00 -0700
X-CSE-ConnectionGUID: Eyw1OWoTSYWsUq3qENROKg==
X-CSE-MsgGUID: oQPU5cy9Sw+0r/giwVh9xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="244754455"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 11:31:59 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: ilpo.jarvinen@linux.intel.com,
	michael.j.ruhl@intel.com,
	david.e.box@linux.intel.com
Cc: matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com,
	intel-xe@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86/intel/vsec: Restore BAR fallback for header walk
Date: Fri, 29 May 2026 11:31:49 -0700
Message-ID: <20260529183150.129744-1-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The base_addr refactor changed intel_vsec_walk_header() to pass
info->base_addr as the discovery-table base address. For the PCI VSEC
driver this info comes from driver_data, but exported callers may provide
their own static headers and leave base_addr unset.

For xe, this made the discovery-table base address zero instead of the BAR
selected by header->tbir, preventing PMT endpoints from being created.

Restore the previous behavior for the header-walk path by falling back to
pci_resource_start(pdev, header->tbir) when base_addr is not specified.
Keep explicit base_addr override behavior unchanged.

This preserves the refactor structure while fixing the functional
regression in manual-header users.

Fixes: 904b333fc51c ("platform/x86/intel/vsec: Refactor base_addr handling")
Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 drivers/platform/x86/intel/vsec.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel=
/vsec.c
index 1657834fd275..3c6d8a1928c0 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -482,10 +482,25 @@ static int intel_vsec_walk_header(struct device *dev,
 				  const struct intel_vsec_platform_info *info)
 {
 	struct intel_vsec_header **header =3D info->headers;
+	u64 base_addr;
 	int ret;
=20
 	for ( ; *header; header++) {
-		ret =3D intel_vsec_register_device(dev, *header, info, info->base_addr);
+		if (info->base_addr) {
+			base_addr =3D info->base_addr;
+		} else {
+			struct pci_dev *pdev;
+
+			if (!dev_is_pci(dev)) {
+				dev_err(dev, "non-PCI device without a base address\n");
+				return -EINVAL;
+			}
+
+			pdev =3D to_pci_dev(dev);
+			base_addr =3D pci_resource_start(pdev, (*header)->tbir);
+		}
+
+		ret =3D intel_vsec_register_device(dev, *header, info, base_addr);
 		if (ret)
 			return ret;
 	}

base-commit: a167ae8eace52dd6c80438b77d92450fe12cd4be
--=20
2.43.0

