Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923FD3451B5;
	Fri, 20 Mar 2026 22:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774044709; cv=none; b=m9Zy09npZtZoQCxcfJUtbtCtC2NKpAMgpsDWJAI2Ts91nNy/l+ZZ4oQeyZ+kfKbp75RCEVpSWhrpGkB9NHJeIyr6bANP+UnI4MDPLbCQVNA0xeOuu5MbRpIxJkM9odke06MDP9dARJf4jSnJKWVODk7Oj76JdX8MclGZUsvVYf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774044709; c=relaxed/simple;
	bh=qWk5tXrIj8MQDi+BGa7ftCMkLLelJluB3u5P16T1u9E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cVIuNyqr51UtuYuzQ2/mZ0mP4SeVwjHrvcAYtnh6Nc281EYSUJ9xLr7Ri2qetTvDXme37ozg5O0/6uapcz8ve37u2nX0Ft2ZBuGOCVIEWr58aSPkTCtIYfms5prWYqc6WgWGRdmJts7Cgcmhk4kg9eVWa3nKpPsXd+XGBggR3r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iN+0OhNP; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iN+0OhNP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774044708; x=1805580708;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qWk5tXrIj8MQDi+BGa7ftCMkLLelJluB3u5P16T1u9E=;
  b=iN+0OhNPoD0/L/ujfn9G7ewOAD5hZBk/RYhS/xpjDwYDv/qKozDrzVyZ
   5SMI6xdV5FK78yAVmXMRKIIaleaNS3N8ZQB8B1Thxe2nXvZyCOgQaOpij
   pUmrahA15GK7JiBJAUdjD+rSEKwEgjlQtAAsk5ritJ6eseyYrDpEnqrZa
   QrBfhJmaHhF1OZPox3bFxTToTdzxOF/eiuQqzpwLwvd506UPlhmyeiigH
   UVuisAjonQKrSGk82IKlyP4nNX7g5JONLpFYwgwsoThw62cxZvIzBMLjc
   +EHeVYmBRHKhYgP0LOzQwiVM02CPMdnQJpBRe2dr5vfMf7H/kjWUiBpuR
   w==;
X-CSE-ConnectionGUID: uMP9m2BGQx6SbTXE7Y8ZwA==
X-CSE-MsgGUID: r/FZRPOJR+GnPzq6K14Zww==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="77745817"
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="77745817"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 15:11:48 -0700
X-CSE-ConnectionGUID: XTsigfIGTJ62vVkixAjobw==
X-CSE-MsgGUID: 7HHflp7tSz+Fz+D1bMit6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="228142975"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 20 Mar 2026 15:11:46 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id E1DC195; Fri, 20 Mar 2026 23:11:45 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v1 1/1] platform/surface: hotplug: Correct inclusion for GPIO APIs
Date: Fri, 20 Mar 2026 23:11:43 +0100
Message-ID: <20260320221143.3237791-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The modern GPIO APIs are available for users via linux/gpio/consumer.h.
The linux/gpio.h is legacy header that is subject to remove. Hence
replace the latter by the former in the driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/surface/surface_hotplug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/surface/surface_hotplug.c b/drivers/platform/surface/surface_hotplug.c
index c0d83ed5a208..33a8a9d41900 100644
--- a/drivers/platform/surface/surface_hotplug.c
+++ b/drivers/platform/surface/surface_hotplug.c
@@ -14,7 +14,7 @@
  */
 
 #include <linux/acpi.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-- 
2.50.1

