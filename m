Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C103B7B76;
	Thu, 30 Jul 2026 21:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785445580; cv=none; b=c/5TT6I3ZYvR/m+KQDu5E/FDfU/bG+ILcgtdWqrEljDtrX7GVujwLsqmmjw2h42G4yEPoI2q4FAjgLqpysSRZaOwt8u1B73f7UFBmt224M3cHsxCdeJSABl0qgmEDULoguY5f3OEWk5jO+9dnr6FACbqajgBKaWS92Qw3IRhmZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785445580; c=relaxed/simple;
	bh=c5vdJX+14W5uHf45GQdnXORtzTRs2LpNJBoNz+dP40I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gzYOo/uclJbm50Nv+CVq9xDsyP/VWB/GyNrTP7NOLKrtYHPSPvRkrKomxGkHrrnLTg98QD7EajjvEL7aUI9e5vUOey/iFXP7cNZdBRhI24gsr+lcHZP0qzZWgwzOdNyJQgpXvcwyCOdFJYvJA27cuz390/DKcttVnCbsgoT3Z20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kb/7MpGz; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kb/7MpGz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785445578; x=1816981578;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=c5vdJX+14W5uHf45GQdnXORtzTRs2LpNJBoNz+dP40I=;
  b=kb/7MpGzxvPizYu4xFcDzlKiMZNvdI9L2pjl9X97Z60t8/SFv5exR42F
   HOVCqrTBaRD7sJbXacpGYwfC5QbOmzo/l7hiFrhYdgdl/WGNfBdvVRAZI
   meJHCNOe64PCCSZMC/NHzkIOHcdgKInYloz6yDNvGR5j+jpCKgvhlfyIA
   RgcOfDWlRzdbbDDuBHVLqFhozpwv+TS4dSSaiceKAku0baMKiQvYkQQ+/
   /fCJiRbpgCF1Nu4Q9XKdbiiqa4osUulH18cZ/7jY+z9Egi7cDwncdKeYF
   SXRwHAMAMgfZRpbHO9c9saLjsN6IkJsT84j7pq13treiAQLzrlTq3Yoeh
   Q==;
X-CSE-ConnectionGUID: yKu69MljReSsZv6MqYtNtw==
X-CSE-MsgGUID: ULquD/nwQ6qw/TbPKhmoqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="85840788"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="85840788"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 14:05:59 -0700
X-CSE-ConnectionGUID: QsWnVGa1SQqKb6W5eryFVg==
X-CSE-MsgGUID: 4M+lAEToRxCkSSL+X2POkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="256099625"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 14:05:58 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: david.e.box@intel.com,
	david.e.box@linux.intel.com,
	xi.pardee@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: update Intel PMC Core maintainer contact
Date: Thu, 30 Jul 2026 14:05:41 -0700
Message-ID: <20260730210546.3936101-1-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Replace the Intel PMC Core Driver maintainer entry with the current
maintainer email contact.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
Signed-off-by: Xi Pardee <xi.pardee@linux.intel.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 716acfc3d7c1..6410a69a319e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13296,7 +13296,7 @@ F:	drivers/platform/x86/intel/punit_ipc.c
=20
 INTEL PMC CORE DRIVER
 M:	Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>
-M:	David E Box <david.e.box@intel.com>
+M:	Xi Pardee <xi.pardee@linux.intel.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	Documentation/ABI/testing/sysfs-platform-intel-pmc

base-commit: f5098b6bae761e346ebcd9da7f95622c04733cff
--=20
2.43.0

