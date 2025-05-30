Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D67E15990C
	for <platform-driver-x86@vger.kernel.org>; Fri, 30 May 2025 20:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748637260; cv=none; b=GdkqdvytKYK1sU97Pld4Hvoqu7YyqZOgQFvdaDdVmUsHDFVYUWO8Mc5t+65gJolFAhf0QCAb8pVuoazdc87GMlP+ex2dIoUmvUPxxbBT101E8DuibfrF1snBLnBdIgkTzDhu/8yz6hCj0GdYRBx6GzlASgjlm9QluTPJHe6nSP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748637260; c=relaxed/simple;
	bh=wJv3c/1LezX8Oe1JiPDGB77Ypq2pscUvluUa/9cETfA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BT6Hm8lvqNmmka79GMu5gBmlBWzU1RRxvO/KtfZS2/VRQQHIusoBsUlg80DJ5q1YJgLDJ7mo0X/EYz18HYWd7/HTIJBH4wC5Wjp1s3GGilJxWWK4Resc5/ZqmXbhd5Naun8cH7zzxrOGpl2Z/2k+9mIrnYRZShuIqLbY03cE43s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SaXlEiU8; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SaXlEiU8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748637259; x=1780173259;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wJv3c/1LezX8Oe1JiPDGB77Ypq2pscUvluUa/9cETfA=;
  b=SaXlEiU8IpLii8zJK3fE+/sLLSrqtyCptgAPwWAgQ6zN4y05BQQ/peCG
   2PFegBDR9+7pojgijDZWZOhyTmfJ41Ogkgq4wJXuoIAn1nhAFfhkwJ+CS
   zu9cKRA7iJKkjh0ekOKkjmkhoyGEsveF/+X9+iS3CU0aJp8+wGGyUqCZT
   AZl2b3q+2bwIiPfpN8hRNevS6Eosx53NPQ932qTkw02v70xMh0ZRV6gtZ
   xXNMipVcIiclfi5e+n0I24yEYvRuMZI8XKbtm3AjactqX65QTRA7borVi
   7r/xCpdNPor6GJH4ZtFWp0br9UXGPRmcmK6zIunwZau/GfdXbNF7Jqm5B
   w==;
X-CSE-ConnectionGUID: FQGs/3daSmq78MLe9pZZ0w==
X-CSE-MsgGUID: ZF/8+C17R2ez8pamWhD7xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="54405763"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="54405763"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 13:34:17 -0700
X-CSE-ConnectionGUID: T3BejNYKRlKEsfUWc5rsbg==
X-CSE-MsgGUID: +boAGk7hReOnlqpm1UDU2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="149246635"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.223.23])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 13:34:16 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org,
	intel-xe@lists.freedesktop.org,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH 01/10] drm/xe: Correct BMG VSEC header sizing
Date: Fri, 30 May 2025 16:33:38 -0400
Message-ID: <20250530203356.190234-1-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The intel_vsec_header information for the crashlog feature
is incorrect.

Update the VSEC header with correct sizing and count.

Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_vsec.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index 3e573b0b7ebd..67238fc57a4d 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -32,28 +32,18 @@ static struct intel_vsec_header bmg_telemetry = {
 	.offset = BMG_DISCOVERY_OFFSET,
 };
 
-static struct intel_vsec_header bmg_punit_crashlog = {
-	.length = 0x10,
+static struct intel_vsec_header bmg_crashlog = {
+	.length = 0x18,
 	.id = VSEC_ID_CRASHLOG,
-	.num_entries = 1,
-	.entry_size = 4,
+	.num_entries = 2,
+	.entry_size = 6,
 	.tbir = 0,
 	.offset = BMG_DISCOVERY_OFFSET + 0x60,
 };
 
-static struct intel_vsec_header bmg_oobmsm_crashlog = {
-	.length = 0x10,
-	.id = VSEC_ID_CRASHLOG,
-	.num_entries = 1,
-	.entry_size = 4,
-	.tbir = 0,
-	.offset = BMG_DISCOVERY_OFFSET + 0x78,
-};
-
 static struct intel_vsec_header *bmg_capabilities[] = {
 	&bmg_telemetry,
-	&bmg_punit_crashlog,
-	&bmg_oobmsm_crashlog,
+	&bmg_crashlog,
 	NULL
 };
 
-- 
2.49.0

