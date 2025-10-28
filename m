Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91952DBF75
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Oct 2025 08:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761641406; cv=none; b=cxelHCPt1nD2XVxQzp0wP4+GdntwdwMRc2ROoFEDHksbhCaiSGqQxWyRcdbOcjfUjcSNdGM5sWBfJ1ObVK6UakeSfrnQIwpWR93SFcBcTtEv18vVTmWiEOyyWmBLcDwuynTBmuXIaubzwuRNF5FOuGez25Cq+M5dKfjy2DIoD9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761641406; c=relaxed/simple;
	bh=WBDgWgw3JzodLFZ0JOIOkukU0O6cyimC7wTtJ67I9GI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RSjtSD0TEDdWbEIMvOG5l7D7qoCH2lH5A5D556eFsd8XzuuXX+02n7XNTBMxyzShnAyI9kfMSmDiayXV6ZPZU6i96VMrlt4bdSZa7hdvDRPPeMnkws7Nmnd5AMCDMrdxtdlgpLmYnSwXUQZbXDIE1nrJ/DD2qpzlww/ho09SwHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bS5BQLXA; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bS5BQLXA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761641404; x=1793177404;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WBDgWgw3JzodLFZ0JOIOkukU0O6cyimC7wTtJ67I9GI=;
  b=bS5BQLXAKpsujQjZXJMRCTzKwppzufp76pQjJvjCu4YFiV86YWCeVy7k
   b08ioqh57wuA+Pusbz04219+61P4sDhreRlsBf1hng77Dmvck+vyk7/Np
   Kz+4ToUHpgT8Dbzv7HGqwo+Re1EYu0DXzMX6PPic8Ig9p7KsBMejGqpYL
   vKsqg1IA6mmNI8y5WvHVL9VPRxMeMzxcJt9Vn1KyVMm9jVwVaOqeknEOR
   aUYo1A9WhcI44ofhw3zG+y5QWqhfVrH0DTG5ZaOpy8Y6Wprc+KukJ1jA9
   jmliqWsRsoyLc3B7IquxOkvt/36HCmt05fh/ipUj4eAQpr+lXilC8fODp
   g==;
X-CSE-ConnectionGUID: frneirkERfSVFXIbw7GjAQ==
X-CSE-MsgGUID: 5vAVH51GR9KaeUltWZng/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81365708"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="81365708"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 01:50:03 -0700
X-CSE-ConnectionGUID: 7f1N61LQTmuPgFHujch98Q==
X-CSE-MsgGUID: RSOiwENXTuSXyqRzKLiBYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="184986224"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.104])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 01:50:02 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C242911F830;
	Tue, 28 Oct 2025 10:49:59 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vDfOx-00000001ehr-2jOR;
	Tue, 28 Oct 2025 10:49:59 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: platform-driver-x86@vger.kernel.org
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 1/1] MAINTAINERS: Update int3472 maintainers
Date: Tue, 28 Oct 2025 10:49:59 +0200
Message-ID: <20251028084959.394795-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add myself as the maintainer of the int3472 driver. Also update Daniel's
e-mail address while at it.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 252b06d4240c..ebc9f33f3f19 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12887,7 +12887,8 @@ F:	tools/testing/selftests/sgx/*
 K:	\bSGX_
 
 INTEL SKYLAKE INT3472 ACPI DEVICE DRIVER
-M:	Daniel Scally <djrscally@gmail.com>
+M:	Daniel Scally <dan.scally@ideasonboard.com>
+M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 S:	Maintained
 F:	drivers/platform/x86/intel/int3472/
 F:	include/linux/platform_data/x86/int3472.h
-- 
2.47.3

