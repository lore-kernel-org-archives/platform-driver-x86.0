Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F17B351C2F;
	Tue, 28 Jul 2026 18:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785262268; cv=none; b=EBUhe0/Gvhn3s24bFOLpQEqhKSy2ScCCCUepDL2OAcuj8bVSapGYoM5vGbZb7DMzbMDVWkweZDfynX2oyP9fI6kopNTqMTGrZfjfhEBFgJ4+KvJIGoGhPv18CMOSj6s1kMRPGwLunj+SiPmAb8KsW2bsf8u+Bo4j9dNT9jJLzKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785262268; c=relaxed/simple;
	bh=FZwRfE6YKP7ojGSPJAKpzeUO+7jUv4pgFB4gPdaa0Bg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CxR70FiCa3J+d6y7YUX80AC0U9D2MRD3zz5qPMhXHvRFEnpVcMJEtOsPskUFyktENLaX/mgPOuTZAXUcpSFBQ2ALZJmjdQbvP6zHE9EmazLIGOKPmY6Rm+Mef6NDwqgv7+84D4y6c7d0vLIsyCLOygXkhkzT21YpXImEZEWSz+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tekz6zFR; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tekz6zFR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785262267; x=1816798267;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FZwRfE6YKP7ojGSPJAKpzeUO+7jUv4pgFB4gPdaa0Bg=;
  b=Tekz6zFRmhktP6NhIZxxHFjGbXRaxxHlm3EbuP/Cqw/P4gp7Q5YRzSzK
   SyHalE3FxxCCMS4r8bypYtcojTG3Wbw2lnlYMGChr3iPrNaWe28+hA35F
   uTLEzKRf4nCKXQ5iqDaZUD8hJS4GfQdi2HBvQVwaHUgMMcOP8pL2eegLU
   Ww0lthvVPEpnRRdwqBjJSbX+ssh0iHL9htWVrNoRSIMjBDNt1VLLowCTx
   JC9oy5LUSnKViefxHj0iCzq+rrypcscugsxCG9m5+wNIdZAHg+VRMWgSp
   ZGuT+b1TeiVzpfYD3QG/jdB0jbUwe7mmzT84/7FJMd3bNwqAL7QhcBYAH
   w==;
X-CSE-ConnectionGUID: 4Aj1NsmQQsKYzaJIy8O3vg==
X-CSE-MsgGUID: Od8q0esiTT23MZdEAxQQbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85733029"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="85733029"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 11:11:06 -0700
X-CSE-ConnectionGUID: GOdTMZoVS32kbdrVAbGJEw==
X-CSE-MsgGUID: ippUhyCXRz6f1979N6RVgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="257101679"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.69])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 11:11:05 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E3D02121C2B;
	Tue, 28 Jul 2026 21:11:04 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1womGd-0000000019N-3GWI;
	Tue, 28 Jul 2026 21:11:03 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	dan.scally@ideasonboard.com,
	ilpo.jarvinen@linux.intel.com
Subject: [PATCH 1/1] MAINTAINERS: Add L: linux-media for int3472
Date: Tue, 28 Jul 2026 21:11:03 +0300
Message-ID: <20260728181103.4413-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The int3472 patches now go via LMML, add the list to L: section for the
int3472 driver in MAINTAINERS as well.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index febe918d6316..580f03d9c2eb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13371,6 +13371,7 @@ K:	\bSGX_
 INTEL SKYLAKE INT3472 ACPI DEVICE DRIVER
 M:	Daniel Scally <dan.scally@ideasonboard.com>
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
+L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
 F:	drivers/platform/x86/intel/int3472/
-- 
2.47.3

