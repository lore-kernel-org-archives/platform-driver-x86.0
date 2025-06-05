Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFC9824A3
	for <platform-driver-x86@vger.kernel.org>; Thu,  5 Jun 2025 18:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749149125; cv=none; b=EQQG3d/v9zEUaYeOaSvFvI+uABKRFcat3Vrq8Rjt5U00dU46oBt5wVoVZYkpoH6f7r3AYOI+v+EfOtGhVIuPsgHg3C31jAkEIfOQ4IlZpBqx9VrRwImztasjSbDPo4IruAAd/vjkU4ID+CmtlV+SOGvkDtKlIHDo7xqy+r+Zf4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749149125; c=relaxed/simple;
	bh=NlPrUi4ud3vMA1lroQEN9zE5GQj2yj9GhG0lx4NLOlA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uF7zZc2K3GIAilc945hGJORylZ2fik+chK9jHMY7het6CdR9ggxu0yZ7yZblmPh0Megr32H2feTQWxYBjTumaFgXGmPsKj/d8m/Wvlrg0Y6NmvC/sRkofpyieVq9QVf6Tfz3CZJJ7ykaZlIV4pcx3KTslz9ORnJoWWTUAuUTnJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lIEt31hG; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lIEt31hG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749149124; x=1780685124;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NlPrUi4ud3vMA1lroQEN9zE5GQj2yj9GhG0lx4NLOlA=;
  b=lIEt31hGpB6ve2K8pGW2YSGG2GC9r59L8ypEYqiOi3204UWML7FiPkTE
   opACsIZadA8eg3LGaU6Ad0MDTgk861vR3mlyttfy+iNgvcPTjrHHppWeq
   PuAxnAVlZRzsiX2DheAeByC2nyrDsv5MtPioS7Z3nWnP3ztISrQ/SdsiD
   BfzBO/O+gkcuU2KR3CQ5tOHd9GuTjj2Hk7DW7cclMb5EGNuraYB4xxMCg
   3FeJ+RxJr+YCmgLNhYpmVkaf2UTtEciN/Ki1SM8Iak4dEUC7g3LxZDPLx
   JnZeUcAAzqEvozBnGscYaC7q6vDqPx9nNrVAc49v0J8WWMmZsAslhYJbd
   w==;
X-CSE-ConnectionGUID: 8Y396+SLQFKHKZRHFHCA5w==
X-CSE-MsgGUID: 6QrD0GmESfiVIJVnHyIqig==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="38916618"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; 
   d="scan'208";a="38916618"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 11:45:23 -0700
X-CSE-ConnectionGUID: UwCkKPgBTLKp3W82NT6j4g==
X-CSE-MsgGUID: rGBGoB0UTqSZPvvz2a2LLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; 
   d="scan'208";a="182782464"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.222.42])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 11:45:22 -0700
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
Subject: [PATCH v3 03/11] drm/xe: Correct BMG VSEC header sizing
Date: Thu,  5 Jun 2025 14:44:36 -0400
Message-ID: <20250605184444.515556-4-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605184444.515556-1-michael.j.ruhl@intel.com>
References: <20250605184444.515556-1-michael.j.ruhl@intel.com>
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

