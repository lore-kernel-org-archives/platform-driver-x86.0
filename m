Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E374B27F4D9
	for <platform-driver-x86@vger.kernel.org>; Sun, 13 Jul 2025 17:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752427800; cv=none; b=BQnSeVFaKACMC5aUriAcD9M2sCTSQBlWthT6S9vVqpcSYAh9Qe2KCTTP0qLnkLsBnePOZDntBR7q2i8JwPoTLnLVdRGYdKc6a3fOPDwpchgueRIIfRTz0ZjbTrBXy82WUzjGhEeRECWXTiEqOaQMbAxWUdcle3GwX0EgM6uzFQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752427800; c=relaxed/simple;
	bh=gViMR+2hZr7V6J2nRL0g3HoCq3Aw83lyYK0dYyPFOSI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cDHMB6zrg0Ldi0mYSoa7JSQGs1j3bvHSMexlDGD/pSuEFxv0Un4vBwZ3Q6Cf/B1UFDrQPUae2ZFMlxIRyp6j1/c8quJ+P0jh+rdt6DM1s8J1bJ5bU2Z72rWpvEb/xkzQEfRsW7g83sDFdQbT2xLYin+GGRWQyNOpEC52ErSjdII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NkLk7+BO; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NkLk7+BO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752427799; x=1783963799;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gViMR+2hZr7V6J2nRL0g3HoCq3Aw83lyYK0dYyPFOSI=;
  b=NkLk7+BOIv5xdkq7RB4MKt23JrOVxuU3fRC7ELrE000c0A+ek9k9NmMP
   F1f+yFuGSzSRbJyFt08eZhQJ0X0g0A67vPoCwHk2Sakj1NMinhXCZ7lRy
   +/Ss/Ori/v/wg1lrGtKTYTdZr43IHJUa5eTlIVqUzDxs3n0cjVWhklVL9
   DWFH5EYPG/oQOKGWIieABu2f/9Mja/2WC+Q5Sk+2sfuwuVFGJqwm0OLeZ
   8VwbI3xZ2usL/leCis0y19eA+sGN59GaVJYlNY70CpafvD3vxwBTht+Ve
   /CaxvIg/JFdEOXIwYu0rXFNVSEwSKbyJ4JVvucc1HK7+bP1WHePzHHebA
   g==;
X-CSE-ConnectionGUID: uNoysxpdSNqiDZV+2gdcgQ==
X-CSE-MsgGUID: bvZLrmFkSymiCCby9tdBpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65334116"
X-IronPort-AV: E=Sophos;i="6.16,309,1744095600"; 
   d="scan'208";a="65334116"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 10:29:58 -0700
X-CSE-ConnectionGUID: w5xDd6miQKm69b9kyBC2sA==
X-CSE-MsgGUID: D3uaVgVaRQi1nomAhnaP1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,309,1744095600"; 
   d="scan'208";a="161069184"
Received: from mgoodin-mobl3.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.223.19])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 10:29:56 -0700
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
Subject: [PATCH v8 02/13] drm/xe: Correct the rev value for the DVSEC entries
Date: Sun, 13 Jul 2025 13:29:32 -0400
Message-ID: <20250713172943.7335-3-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250713172943.7335-1-michael.j.ruhl@intel.com>
References: <20250713172943.7335-1-michael.j.ruhl@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

By definition, the Designated Vendor Specific Extended Capability
(DVSEC) revision should be 1.

Add the rev value to be correct.

Fixes: 0c45e76fcc62 ("drm/xe/vsec: Support BMG devices")
Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/xe_vsec.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
index 3e573b0b7ebd..d279e0ace7d7 100644
--- a/drivers/gpu/drm/xe/xe_vsec.c
+++ b/drivers/gpu/drm/xe/xe_vsec.c
@@ -24,6 +24,7 @@
 #define BMG_DEVICE_ID 0xE2F8
 
 static struct intel_vsec_header bmg_telemetry = {
+	.rev = 1,
 	.length = 0x10,
 	.id = VSEC_ID_TELEMETRY,
 	.num_entries = 2,
@@ -33,6 +34,7 @@ static struct intel_vsec_header bmg_telemetry = {
 };
 
 static struct intel_vsec_header bmg_punit_crashlog = {
+	.rev = 1,
 	.length = 0x10,
 	.id = VSEC_ID_CRASHLOG,
 	.num_entries = 1,
@@ -42,6 +44,7 @@ static struct intel_vsec_header bmg_punit_crashlog = {
 };
 
 static struct intel_vsec_header bmg_oobmsm_crashlog = {
+	.rev = 1,
 	.length = 0x10,
 	.id = VSEC_ID_CRASHLOG,
 	.num_entries = 1,
-- 
2.50.0

