Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8945535580E;
	Thu, 22 Jan 2026 02:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769048483; cv=none; b=hv2Ga06elUnm+iVaQcqI9DmQMd5Xf7sY2oAw7R6LKbrGK90pgrbI+/T5BhsGoDM6XLq/0XFH19O0w2rchXuWO0bq2zh0Cwxh9LdLSeHFWnNRNK1+xNIsa74YGzXNCwmQaqy+/eAyhIWpASPmMjozkpku+LUpgK7AmmO/r4zLrtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769048483; c=relaxed/simple;
	bh=PEtJWqEg1Na377NtdLgHjjNojvWtZ0IVjnCkagWJ7dU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gyxLW9C2W6KXLLfz/T7NmaPVn5oD4K4g7qzIsPfCigI2puqy3e4wZUt/+PmPgm0zUKZDtPUJAa+oHFwPCGHzUoKx2AdLLsiKs8543HlLW80V4u2LFArZdw/lydqrAaRyS2neAy0bASMC56n2wShp5EePE5FZrj7qRwupMYQzz3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F0nIyukF; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F0nIyukF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769048481; x=1800584481;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PEtJWqEg1Na377NtdLgHjjNojvWtZ0IVjnCkagWJ7dU=;
  b=F0nIyukFhJBTWVVyH/jf+427Dca5WPZI7IWiyqLM88kZ/PMyAFG2ICdw
   AUAmtb0vXzuX8uB4jAWenyJ6TljJnFh157TESaLxEjqmQsqkBnaqFUifm
   6yA22P1VC/nXldXuuPb2F1iOZ918LZLcGISNGZ/DdEJ5hWAN+bZefYmuz
   Lz8ZEwe+/bJ2ehs7Q4ydJjavTHPnQovjgNnhqMCQJiJlR6moDVXoEKieI
   uxF2Gz66XPkXbflj0jr4WsG4wKNJRcn3cOEEqZKzfc7VANkehML07qLA/
   Efml4aLZWqRom3Hj1U5Ymf50bf1tyd5SHYzEOhjKYGTMW7M1xIfCtsmnT
   Q==;
X-CSE-ConnectionGUID: yx3lmb6uQA+XB0n1+1KDSQ==
X-CSE-MsgGUID: mMCsABcER16rIfM44+jtag==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70377523"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="70377523"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 18:21:21 -0800
X-CSE-ConnectionGUID: mcJztTFDSc+6SQtd4plpMA==
X-CSE-MsgGUID: ufg9/n24QSKc5rBoLkQPPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="206862930"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 18:21:20 -0800
From: "David E. Box" <david.e.box@linux.intel.com>
To: ilpo.jarvinen@linux.intel.com,
	xi.pardee@linux.intel.com,
	andriy.shevchenko@linux.intel.com
Cc: "David E. Box" <david.e.box@linux.intel.com>,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86/intel/vsec: Add Nova Lake PUNIT support
Date: Wed, 21 Jan 2026 18:21:08 -0800
Message-ID: <20260122022110.3231344-1-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add PCI ID for Nova Lake, supporting PUNIT telemetry.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 drivers/platform/x86/intel/vsec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel=
/vsec.c
index ecfc7703f201..012d87878afd 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -766,6 +766,7 @@ static const struct intel_vsec_platform_info lnl_info =
=3D {
 #define PCI_DEVICE_ID_INTEL_VSEC_LNL_M		0x647d
 #define PCI_DEVICE_ID_INTEL_VSEC_PTL		0xb07d
 #define PCI_DEVICE_ID_INTEL_VSEC_WCL		0xfd7d
+#define PCI_DEVICE_ID_INTEL_VSEC_NVL		0xd70d
 static const struct pci_device_id intel_vsec_pci_ids[] =3D {
 	{ PCI_DEVICE_DATA(INTEL, VSEC_ADL, &tgl_info) },
 	{ PCI_DEVICE_DATA(INTEL, VSEC_DG1, &dg1_info) },
@@ -778,6 +779,7 @@ static const struct pci_device_id intel_vsec_pci_ids[] =
=3D {
 	{ PCI_DEVICE_DATA(INTEL, VSEC_LNL_M, &lnl_info) },
 	{ PCI_DEVICE_DATA(INTEL, VSEC_PTL, &mtl_info) },
 	{ PCI_DEVICE_DATA(INTEL, VSEC_WCL, &mtl_info) },
+	{ PCI_DEVICE_DATA(INTEL, VSEC_NVL, &mtl_info) },
 	{ }
 };
 MODULE_DEVICE_TABLE(pci, intel_vsec_pci_ids);

base-commit: 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
--=20
2.43.0

