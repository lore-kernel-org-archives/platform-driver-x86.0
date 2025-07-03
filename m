Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6F676C61
	for <platform-driver-x86@vger.kernel.org>; Thu,  3 Jul 2025 21:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751577138; cv=none; b=ZHsRa8tJRsyidh96PI4Re/5z55gqqk0O+2UNCOVFkG/Ooq+YtWSA5ath0aQOvHlp/0QqVoWThbgPodGWtYNfvDE2M9BhmMSfPKam4EijAGiNtapLHrGPH3rMu6Q1PhvJ5mTN56vrlMcAjRMJyvZAfGaMyCeGBRwgNcQxiGjGE+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751577138; c=relaxed/simple;
	bh=9ZOuxYhkBiPpkd4QPKWvOeEWr4LBtt2gcd1tso0s8mk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ncTMT1I5kmpqLnwgoujikTUCeYmT0Gthhx/PoRrB1thZZXqRt86wa1XPUbMtWa2/rv9XfMkrtLtz0KRS6jf5D0FRBqWYTT8QMylwEhhNJIN1beS6n8LsmeYw0ylGGl0TA4z43FYGtszpHqDBUUUSR/o9TRqpTC6E5FjwH++zMNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j/vLtrDV; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j/vLtrDV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751577137; x=1783113137;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9ZOuxYhkBiPpkd4QPKWvOeEWr4LBtt2gcd1tso0s8mk=;
  b=j/vLtrDV5lGZZ9H6Mgrkvp/HGQ9iBZ2VMc2v4XmW2Ma8ZUqosmjRgUHL
   FWk/aEPIoAchVeQSaHuvOKTVNMBhQFL2kqY2mkE+cIrLTu51auVgUrvh2
   v2VxIJb15PHM3l4OOO82PMysplwtxA7xpjY3XstPmSjw+MEaE0o9zmDC4
   v9ej7ty2Yt1cy6w3C0JotNsbgE1DG2BtNQ5/LAiSYD4wOtsnvT+DNgRGz
   tG1ErPQGZ3JswhJfMeu9uHh6UwgHcG8+Itv/P2R0xubr1CqWKiw0uxuHe
   iCVd0n7q7Z0jfcst7lZH+KEeN1EvuFL4IwJsgUJfCx1KLmGD9VWdkT5Vh
   g==;
X-CSE-ConnectionGUID: Lm6gynqSSs6eHvzR+sVuOw==
X-CSE-MsgGUID: /cFSMiF1QIuvXR0TyGxiOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="79353001"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="79353001"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 14:12:17 -0700
X-CSE-ConnectionGUID: vDUboYbzSMWfwB/0ONxfmg==
X-CSE-MsgGUID: 0/ztsyJ1S1CylS9MLo0tvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="154240025"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.223.97])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 14:12:15 -0700
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
Subject: [PATCH v6 02/12] drm/xe: Correct BMG VSEC header sizing
Date: Thu,  3 Jul 2025 17:11:40 -0400
Message-ID: <20250703211150.135320-3-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703211150.135320-1-michael.j.ruhl@intel.com>
References: <20250703211150.135320-1-michael.j.ruhl@intel.com>
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

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
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

