Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D10227AC2F
	for <platform-driver-x86@vger.kernel.org>; Fri, 30 May 2025 20:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748637495; cv=none; b=YaaE9acjrUYo3h/sJI69FEWduVa3Uao0UGnNObo1g7uGyStp/YKi68FB2Kc5dE4bxmaZpmCGQqnCtJZ8VTfPEWkl9nloVgzpAruxsxO23HIeIKPbzrkihkJ3Rhtd1hKQQM0fOxTUpLNv8pUAkQDrbpUSGB/mCo6xhVTP5ZLVd7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748637495; c=relaxed/simple;
	bh=wJv3c/1LezX8Oe1JiPDGB77Ypq2pscUvluUa/9cETfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J1MzvlgGYb8VzYWriiYu3swVkHNUWfS4YK4JedO5h/kY+GpCM95AbvFxN3LV2SRiWh5LGXTuhpZEAGXWDwhmiHLGDfqdl7yGzR+F9+DFSsJZdGfejyfLUzrZn+L1w6/IXgPg33c61nSpruSElx3sLWT5nBufRhW8OseAYbpNr14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QBfNSOwG; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QBfNSOwG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748637494; x=1780173494;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wJv3c/1LezX8Oe1JiPDGB77Ypq2pscUvluUa/9cETfA=;
  b=QBfNSOwGMsXTwyNZNZ874umzL5HauXmDRXWL1wwhZFgwweqQuveQibib
   4cE3rEagT4JnC6NjJXpSLEtfA4l/ya8GrZ5/a6fbmtMYD/1nabmJJtOLO
   vLgLPkcyZEFnii2Gjwkm9dmesyfvpScocBBBfDHPh3Oa/qRqd9QXql7ll
   NUwmahAtiY7HIk6o9btVw+a2UxuMuuhXlViYyl8J9dqLBytaOKfP9b42+
   0N0cTcL8346nMH9QE9ovn0myA8VK9jRqwSxkIl9phYj8USKfJ4+jILCt3
   HZlfkzcIb8QOr4eECyBgAdOzqQX+nh8sPBR0C8+Hn/luok29qZJ66/g5h
   A==;
X-CSE-ConnectionGUID: H6gaaGwJQIaqUz1fXAEOnQ==
X-CSE-MsgGUID: t2vIbUkdTdSpeh5JThrx1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="54405997"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="54405997"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 13:38:14 -0700
X-CSE-ConnectionGUID: slSZLBpxRFObNfbi27Hc4A==
X-CSE-MsgGUID: mM8ACSJ6TrSmzZuTwr6pVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="143824188"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.223.23])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 13:38:13 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org,
	intel-xe@lists.freedesktop.org,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH v2 1/8] drm/xe: Correct BMG VSEC header sizing
Date: Fri, 30 May 2025 16:37:50 -0400
Message-ID: <20250530203757.190853-2-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530203757.190853-1-michael.j.ruhl@intel.com>
References: <20250530203757.190853-1-michael.j.ruhl@intel.com>
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

