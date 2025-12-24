Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D5529B204
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Dec 2025 06:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766556864; cv=none; b=PZAxeiMTgizKEJqhbt2AKZaApRtmOEf2odEYx35Ffj8gXwZZp/Vn2ZXufdb0Q9FFqV3bm4UtNjX/CTkRlwbSFPw3PTiueEAiOdgSMHtzkIXm4lG4WQf5jGZ1BmthtcWoWUJIgBdJa+ayxPwjwWZPzlhdQBqmupJEWvVNeYciYGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766556864; c=relaxed/simple;
	bh=OgYM7W5k7WDEqR7CZ4hOXgGssxKmCZd+e0LnOmyK6nU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mQ+z+C/nGwKJ0kc8tq712uzSII+r5f151laUo/XKqxDj6k0Zlvg8JvGiCwmsWHuwmkZanEyxA6R7fgQ05lkXD8V3HjM7NZfZh6nm9QpeFeLQT9bLeyYoRf4I6tTKXv4GgBkSgOpJdfkBOAneHT6g/vn3nbBd8joJzuEMHNOSaxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a4hBa7zT; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a4hBa7zT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766556862; x=1798092862;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OgYM7W5k7WDEqR7CZ4hOXgGssxKmCZd+e0LnOmyK6nU=;
  b=a4hBa7zTQHJAtBcjqV1AFpF33CjCk2iNtDq+c7xe3C59nM2TgmMn3BAG
   7JAiWOIUw3v18bRA/oqrENIDBX1CnY1WSNc1aN3N04d7fG9xYgn1TveYl
   Rz4g1KCjdTzYE1klr0clWQuIbYiegyPS77LcbjTPOr9nsskmSbKezvoUo
   hcuYkbSxVD8LFR36QPZRo8vUEfazlYGTq74/M041360EZiWZBKPR/qIRB
   HU8KoCDmagDFOftD7EX/qDR2FXkDbVoEjgy/m4+0WZmN7Lj8CmwbGAV07
   dkFouAJ18MeseFunRPZp8bggdyY1SDjTQGL84jDA8flFeoj8eZczSSCjC
   g==;
X-CSE-ConnectionGUID: EcffHsjvTKihSMMVGiPvqw==
X-CSE-MsgGUID: YHF3xyl8T1ebRkR7tlUt8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="93871483"
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="93871483"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 22:14:21 -0800
X-CSE-ConnectionGUID: nHosVS4ARcyf+lsPl7gdhw==
X-CSE-MsgGUID: yu+JN0VfRIuursuHlSR93w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="223429478"
Received: from baandr0id001.iind.intel.com ([10.66.253.151])
  by fmviesa002.fm.intel.com with ESMTP; 23 Dec 2025 22:14:20 -0800
From: Kaushlendra Kumar <kaushlendra.kumar@intel.com>
To: david.e.box@linux.intel.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	Kaushlendra Kumar <kaushlendra.kumar@intel.com>
Subject: [PATCH] platform/x86: intel_telemetry: Fix PSS event register mask
Date: Wed, 24 Dec 2025 11:41:44 +0530
Message-Id: <20251224061144.3925519-1-kaushlendra.kumar@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PSS telemetry info parsing incorrectly applies
TELEM_INFO_SRAMEVTS_MASK when extracting event register
count from firmware response. This reads bits 15-8 instead
of the correct bits 7-0, causing misdetection of hardware
capabilities.

The IOSS path correctly uses TELEM_INFO_NENABLES_MASK for
register count. Apply the same mask to PSS parsing for
consistency.

Fixes: 9d16b482b059 ("platform:x86: Add Intel telemetry platform driver")
Signed-off-by: Kaushlendra Kumar <kaushlendra.kumar@intel.com>
---
 drivers/platform/x86/intel/telemetry/pltdrv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/telemetry/pltdrv.c b/drivers/platform/x86/intel/telemetry/pltdrv.c
index f23c170a55dc..d9aa349f81e4 100644
--- a/drivers/platform/x86/intel/telemetry/pltdrv.c
+++ b/drivers/platform/x86/intel/telemetry/pltdrv.c
@@ -610,7 +610,7 @@ static int telemetry_setup(struct platform_device *pdev)
 	/* Get telemetry Info */
 	events = (read_buf & TELEM_INFO_SRAMEVTS_MASK) >>
 		  TELEM_INFO_SRAMEVTS_SHIFT;
-	event_regs = read_buf & TELEM_INFO_SRAMEVTS_MASK;
+	event_regs = read_buf & TELEM_INFO_NENABLES_MASK;
 	if ((events < TELEM_MAX_EVENTS_SRAM) ||
 	    (event_regs < TELEM_MAX_EVENTS_SRAM)) {
 		dev_err(&pdev->dev, "PSS:Insufficient Space for SRAM Trace\n");
-- 
2.34.1

