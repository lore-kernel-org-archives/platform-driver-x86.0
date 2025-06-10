Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEB626980E
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Jun 2025 21:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749589964; cv=none; b=c4/caH1Yh1ECm+ojT88D9yddCNg1T1I2p19DdgJ+KwPb7aMsKfQHdS/0w+9OB6CsUbidd0mM1x4fo4DYsfnoDwRcx6jRYr6jCN9JQqRfqjJWa/w/Fx9dI0UjDU/rtmL4u9m+PjN8Eaky41P4VDLu94zjsTed05ayEM6uBwha0YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749589964; c=relaxed/simple;
	bh=E4bt8/36Du6A+i4TIkEWgeSL1+mddI4OuQIet7d/e+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f8tcwD5wqfihd8eVXGKetbtRYT6K/8QGR5/iQ5oBVOWWZjhchHMFtEWLZrIkUqF26hhFQicjnTMcB//ZnNZrN+OT+ralc1VIuWfjOXkf4MeZBQJc9fEnPIIiMM8cVgg/Vo9ZLrPg8pRJwM/Yym08aG4TR1+2DnOX98QEVWc3ma4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KIMLZua+; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KIMLZua+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749589963; x=1781125963;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=E4bt8/36Du6A+i4TIkEWgeSL1+mddI4OuQIet7d/e+g=;
  b=KIMLZua+Wgq7SwVmzbo1z/2Wpdpi3+BDwLRmBL4xb3rZEY4hnsjVIPhM
   2AaMgvMw18K8k3svkTr2wLr3LFBCTKt6fuupPmbIk9NgSacoNGABI7A7Y
   bHl4raGMY3Oec4kT2BgmbGJ1DOIM6ubcA+p3ZlmKdulqloohppPNyQtDj
   ojyhEn58/xAQt83ybCUTn7RLRvO6ZFoevFdQn3sXAr9VmwNWOuFfT5opb
   im1GkwGax8TrssOaZ6f9HIT2onVyLmvM41GsOAXjfi3eADgSRXbwZZI7D
   ihR2IZAY87bGG7YcjOfjgOtZidIXX2eRXREc1T2WsULh+ZFg/24Sl3Zek
   A==;
X-CSE-ConnectionGUID: 7dgX/38aQEOQIqCelTPEvQ==
X-CSE-MsgGUID: GWVg1uihQZeMQN/F+7QL/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51816890"
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; 
   d="scan'208";a="51816890"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 14:12:43 -0700
X-CSE-ConnectionGUID: mo34wUlHSwmOxF67DWId0g==
X-CSE-MsgGUID: MmTxL7qsT2SZo5wqmhKgTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; 
   d="scan'208";a="146939700"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.220.88])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 14:12:41 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org,
	intel-xe@lists.freedesktop.org,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com,
	thomas.hellstrom@linux.intel.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	david.e.box@linux.intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH v4 02/10] drm/xe: Correct BMG VSEC header sizing
Date: Tue, 10 Jun 2025 17:12:17 -0400
Message-ID: <20250610211225.1085901-3-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610211225.1085901-1-michael.j.ruhl@intel.com>
References: <20250610211225.1085901-1-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The intel_vsec_header information for the crashlog feature is
incorrect.

Update the VSEC header with correct sizing and count.

Since the crashlog entries are "merged" (num_entries = 2), the
separate capabilities entries must be merged as well.

Fixes: 0c45e76fcc62 ("drm/xe/vsec: Support BMG devices")
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

