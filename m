Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D367A286419;
	Wed, 25 Mar 2026 01:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774403313; cv=none; b=TkM/LXZstwJFSrzf1ivLP/0xilY8HDuT4lntcynu96wf9T74vh0bxfM1pvHzQ0yOsyi0gXIcNsSV2pI8Sk1TCNQoUAjDlH6lBPaZ/GIWHxOIa3ZBUkmtpXABW1mR0Za5if9YQcT0dh3eCiPYiTVnNooxz3PMEgKl8OsmqFoAf/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774403313; c=relaxed/simple;
	bh=zFMNEZm6Uk8EBinNcApU4GO+lYKwQ895O8e35I19Wfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=byyXIbX6Mi/lOQfWLi1kgxG2G5En0HA4LdjpyKKiIWo9eHawVrchAGuQ5SQSIUjUhrJVv83KhyDsRFCM0R6H94iVjq7/TZkdKv+CwVT1a1Q4x4/Cnf4pTqKFGHWu6ReFro9AOj+g5pqfUe7yZz8fBz4JAE7KuHBI5Pw1MDbN/x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jr72sEFt; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jr72sEFt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774403312; x=1805939312;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zFMNEZm6Uk8EBinNcApU4GO+lYKwQ895O8e35I19Wfo=;
  b=jr72sEFtNxodlD2zObQ43TWG6kYRhmk0RaIlhS81KWk12v2pALTO++0A
   E1T26+mb5VwucHojJNSFL/o6rTCU32z8nXnxg0/wybqcec6QnQbxfmBG5
   m8KSqRLY3v72W61oEn7MS8pTgeZHERU/PjQPSCE5yB9DZhq3Jmunr//Uu
   L1sVeJz72xTpRLV9qCLhHtgLQjflolzRzDWHT0F/gVEuEA0U/W3PH8mBo
   8t79908m8j87RdgRYsY1tM/JZvRO1YIIaRvXx82Nmz6yw7vXMR/NnWaXu
   3/ATmHL9b8e9s65uvjjS7sKycKmpMp4DHn6Rbxv+G/OoqQQc/aP8y8whP
   A==;
X-CSE-ConnectionGUID: gHCkW5ffSZKpHT/b6afJqg==
X-CSE-MsgGUID: tDTiKVa8TlKjajOexJwhGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75317514"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="75317514"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 18:48:31 -0700
X-CSE-ConnectionGUID: rFGJj0qMRoaUM8+2OFQNpA==
X-CSE-MsgGUID: uHc9asd6SniV9lHwmLJl5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="221190790"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 18:48:30 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: irenic.rajneesh@gmail.com,
	ilpo.jarvinen@linux.intel.com,
	srinivas.pandruvada@linux.intel.com,
	xi.pardee@linux.intel.com,
	david.e.box@linux.intel.com
Cc: hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH V2 10/17] platform/x86/intel/pmc/ssram: Use fixed-size static pmc array
Date: Tue, 24 Mar 2026 18:48:12 -0700
Message-ID: <20260325014819.1283566-11-david.e.box@linux.intel.com>
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

From: Xi Pardee <xi.pardee@linux.intel.com>

Switch pmc_ssram_telems from a devm-allocated pointer to a fixed-size
static array, eliminating per-probe allocation overhead and simplifying
lifetime management.

Correspondingly simplify pmc_ssram_telemetry_get_pmc_info() validation to
check devid availability and tighten input bounds checking. Drop
null-pointer checks now that the storage is static.

Signed-off-by: Xi Pardee <xi.pardee@linux.intel.com>
Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---

V2 changes:
- Replaced hardcoded array size [3] with MAX_NUM_PMC constant

 drivers/platform/x86/intel/pmc/ssram_telemetry.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/intel/pmc/ssram_telemetry.c b/drivers/pla=
tform/x86/intel/pmc/ssram_telemetry.c
index 1deb4d71da3f..4bfe60ee55ca 100644
--- a/drivers/platform/x86/intel/pmc/ssram_telemetry.c
+++ b/drivers/platform/x86/intel/pmc/ssram_telemetry.c
@@ -24,7 +24,7 @@
=20
 DEFINE_FREE(pmc_ssram_telemetry_iounmap, void __iomem *, if (_T) iounmap(_=
T))
=20
-static struct pmc_ssram_telemetry *pmc_ssram_telems;
+static struct pmc_ssram_telemetry pmc_ssram_telems[MAX_NUM_PMC];
 static bool device_probed;
=20
 static int
@@ -140,7 +140,7 @@ int pmc_ssram_telemetry_get_pmc_info(unsigned int pmc_i=
dx,
 	if (pmc_idx >=3D MAX_NUM_PMC)
 		return -EINVAL;
=20
-	if (!pmc_ssram_telems || !pmc_ssram_telems[pmc_idx].devid)
+	if (!pmc_ssram_telems[pmc_idx].devid)
 		return -ENODEV;
=20
 	pmc_ssram_telemetry->devid =3D pmc_ssram_telems[pmc_idx].devid;
@@ -153,12 +153,6 @@ static int pmc_ssram_telemetry_probe(struct pci_dev *p=
cidev, const struct pci_de
 {
 	int ret;
=20
-	pmc_ssram_telems =3D devm_kzalloc(&pcidev->dev, sizeof(*pmc_ssram_telems)=
 * MAX_NUM_PMC,
-					GFP_KERNEL);
-	if (!pmc_ssram_telems) {
-		ret =3D -ENOMEM;
-		goto probe_finish;
-	}
=20
 	ret =3D pcim_enable_device(pcidev);
 	if (ret) {
--=20
2.43.0

