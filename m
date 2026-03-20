Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83C32D8DC3;
	Fri, 20 Mar 2026 22:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774045239; cv=none; b=nwqpTVodvs8I6aK1XCM/Jbf9oX7Ooisr7P02AO7h5vG8ATlydpuiO+/skzXDxVTkMVS4QptMaDaWJQMobdx3Bbxp5GxeVi8tivFX/UU6SKD4z2wu6AkbbiqTq6o/RwbrXqp02kWOPPorcF9qJ8JrFzhHa8L3OenivmjvJIksB0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774045239; c=relaxed/simple;
	bh=K+EPUj1oHh0zenV/SVGoxTyNKQQoz7q9jDCwFiGHsD4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hnfSWHIZ1Z81ryuk/NBukO8t6UBKUzUgPnei0dBD+IB3pPm7Pst/3dHAVws0xqaL9fD5JZh9mkiIRKH/iL4ke7LBAZW9/srtIfde4vDTmJcQVnmvT9KUc+k+OQ2zanluC5kbvB+IMBWGvNUY0zCvGDk1vyP6Aw8jUxVhk3s1DzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V6BLjMng; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V6BLjMng"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774045239; x=1805581239;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=K+EPUj1oHh0zenV/SVGoxTyNKQQoz7q9jDCwFiGHsD4=;
  b=V6BLjMngYZuKrsF16SED/DFj3owX8WOOG1cRYFDMBVeSJxBXrIUY1EXu
   PjklzjRLXHcMvERMdhxlwq9z/CzEHiYNjug4Ur+TFn11mhNnewLAb+Dgi
   diXoaHQKb/xylTLvbc2Mao6nixZHtslOi1RKfxAO8IIgcHBE4gjcBiOvS
   A3wj2thm0LOAO6v/UhOBvrJvBrltRskov+8ISCqK92tmQmh7TO1jSRo4y
   EJUDVSqn0pf/JUwned1/xjUkaOQOLZdFzr/1Agz/Muo1hpd81VXdrmVji
   bJ5up8v6w5sSIcZoipvWfWx5+naks/VwLB9R8lwQxQYQ8CNY7VwryZjWz
   Q==;
X-CSE-ConnectionGUID: 08KuMpgRRIKhfqVe6kVZRQ==
X-CSE-MsgGUID: gEt+ik2/TriLVHhovDfhrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="77746229"
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="77746229"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 15:20:38 -0700
X-CSE-ConnectionGUID: R7+JuWXjS1yeFQKJZgnu0A==
X-CSE-MsgGUID: ncgBpzOuTFKTahpdPgQWUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="225297490"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 20 Mar 2026 15:20:36 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 81AF495; Fri, 20 Mar 2026 23:20:35 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Vadim Pasternak <vadimp@nvidia.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] platform/mellanox: nvsw-sn2201: Drop unused include
Date: Fri, 20 Mar 2026 23:20:33 +0100
Message-ID: <20260320222033.3238317-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This driver includes the legacy header <linux/gpio.h> but does
not use any symbols from it. Drop the inclusion.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/mellanox/nvsw-sn2201.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/mellanox/nvsw-sn2201.c b/drivers/platform/mellanox/nvsw-sn2201.c
index 51504113c17e..92b58ba8f97b 100644
--- a/drivers/platform/mellanox/nvsw-sn2201.c
+++ b/drivers/platform/mellanox/nvsw-sn2201.c
@@ -10,7 +10,6 @@
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
-#include <linux/gpio.h>
 #include <linux/module.h>
 #include <linux/platform_data/mlxcpld.h>
 #include <linux/platform_data/mlxreg.h>
-- 
2.50.1

