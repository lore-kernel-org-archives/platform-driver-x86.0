Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407A21862;
	Thu, 27 Aug 2026 15:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787845881; cv=none; b=CxEZrzxIMKj0DdSHHphXu9WEqIilBuEW4WlYMb3RY327+MC88egReBu8KcWJ521dZPUzxfPYq+FnQkHVBH4/Qzz6NtsdkW9sv7djBNcwqYbY2CHZavnGFsE3WssgmGp5MwQPIEgrYvwRl2HScL5zJ35B5xcTkUCgx0CYBl4K2M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787845881; c=relaxed/simple;
	bh=Y4x0dxrbSqRY2g48IqQoIg8JqV0VgrfKmAuzL06vrVo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lFl3oHzFwRZlqwNQ8Vxfl7K7NHg1tP3vfcJaAh5YrmRSeyPoEsXcA9ZspCHVT282o+gNeZ/OT0Q/Cfd6IT0VP6EunnXGWZujln1MS4JXKOMNx4nS4+VnraUvcSdxT8Cq4IwVsDK5PMMdqYKOsFm9RT/Tk0WSvoKnjBrghdZZYGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nVp2Swho; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nVp2Swho"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787845880; x=1819381880;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Y4x0dxrbSqRY2g48IqQoIg8JqV0VgrfKmAuzL06vrVo=;
  b=nVp2SwhoCs7nPocPazbhFzyzDT8YInM7HTy98sNgRuI5GSK288lDagVe
   wB1/9qFuKEAuti3I4lP42XdoYtkF82F+2hEoprs7fiDbqJseuMBBm4Cha
   aezrN4BaBp2TCKwtzMVIvRm0uFS5+wmGSYY7ah02k+9R0pJvsSldy9JlH
   Rcy1f52K6QfDHWTxO6a8EG2jsmBTal/yBVN1YJQFcHvE91ejLHIsnvLVG
   0SLJ6eLWZOkBfNmVqi0Zn3nWJf1djVdZ2cTyFUzf/ArrwaadtcEkpy1JP
   lqMz+3xR27O6uyg507876H/Sz/2YxOk2sGdCO39ewPzALbB53xl0ZOZz8
   w==;
X-CSE-ConnectionGUID: VRFgMpJkQDaTJtvtZon4xw==
X-CSE-MsgGUID: oRbPm+8+RmixCTFAlgj6Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="99510530"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="99510530"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 08:51:19 -0700
X-CSE-ConnectionGUID: 86OQoUobTq2KSfrJdlz3HA==
X-CSE-MsgGUID: YWLFXHGVRkyvzo4h/XuVlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="297793898"
Received: from smtp.ostc.intel.com ([10.54.69.131])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 08:51:18 -0700
Received: from ray2.intel.com (unknown [10.125.109.108])
	by smtp.ostc.intel.com (Postfix) with ESMTP id 802595E92;
	Thu, 27 Aug 2026 08:51:18 -0700 (PDT)
From: Dave Hansen <dave.hansen@linux.intel.com>
To: linux-kernel@vger.kernel.org
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: int1092: Mark as orphan
Date: Thu, 27 Aug 2026 08:50:53 -0700
Message-ID: <20260827155053.2334792-1-dave.hansen@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The email for Shravan Sudhakar is bouncing. There are no remaining
maintainers for int1092, so mark it as an orphan.

Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>
Cc: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6d8de95f10ab8..3ec149f89b6df 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13012,9 +13012,8 @@ S:	Maintained
 F:	drivers/platform/x86/intel/atomisp2/led.c
 
 INTEL BIOS SAR INT1092 DRIVER
-M:	Shravan Sudhakar <s.shravan@intel.com>
 L:	platform-driver-x86@vger.kernel.org
-S:	Maintained
+S:	Orphan
 F:	drivers/platform/x86/intel/int1092/
 
 INTEL BROXTON PMC DRIVER
-- 
2.43.0

