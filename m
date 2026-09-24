Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DC74ACC7A;
	Thu, 24 Sep 2026 18:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790274248; cv=none; b=QMLvyuazjQjjsARSRcmOCt2yS1ejrmD1yfKs+/bIVP0h2jfD7/m84PVEVb6besXu7zG5FJWA+B0BZUxu/Gg9hn6xzChdFQDiS+GWONxboKkfc4iYkbpdETS0sjDtgw8Knl4uY2/nWFKJpZVPdBMX2PUyS84yIZXSKXlzf6xdx4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790274248; c=relaxed/simple;
	bh=YOXuTLCnuojBHaTSP6FpVtt8+J9N0CS4hHMRj9peKkY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hX4OnON6qMxAhVAbNO9CsC9sosPEjRAs5JeI8jCn+XPCSF2LNdQk4DW+mgaF967838Lh0y2fHplJ0YBMyNtKyaTnL2PD2pyzoWlISa4gPYMtEvP0hnUoknSupqNn7DGDj3iacjF0u1eMnzhmsEuSQ3vNv3cfO2HdFgAl7QZPdJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aivZ2wmU; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aivZ2wmU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790274246; x=1821810246;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YOXuTLCnuojBHaTSP6FpVtt8+J9N0CS4hHMRj9peKkY=;
  b=aivZ2wmUBr1dcKuqhovEboTV/3wcMLjx8xtqPYlWiNeKaz0XUMkFjLB6
   M2Fc8PPoaVBzFVIbny9bpzyyck212rGQ4rM2VFB53n2oNQo+pJDLVAAY1
   8gQFpQzp0ygtPFgZ0rDbFN/trn/1XQvmuachakUZIFYrwAYl+1wg5DmR5
   mYVI8n12aP4Qkwkl7J1eyEyR5/pcNg3r6fHLqMibIiNqzU9Ft1AYjeD/C
   iqq+wjSIRs8DSkgrlKYTA6r/YCMjDvsqemTSguq9SG4uCWD0KeA0l/Zwb
   +ArO0tcAQ9PCMN3hpuxkCz8lbXYVxm/T8L0MQADGC+Iy6t3kDm4N5NZLn
   g==;
X-CSE-ConnectionGUID: H4sZ31mUSXi6gALMTIlJ6Q==
X-CSE-MsgGUID: qYEblQ+TSde5Pnrax78XDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="91164278"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="91164278"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 11:23:45 -0700
X-CSE-ConnectionGUID: sE5KL/e5QTK8y6ijjbHPKQ==
X-CSE-MsgGUID: wOOxjReUR3GkzTAmoYCPBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="272229940"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 11:23:45 -0700
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/19] platform/x86/intel/tpmi: Include the headers tpmi_common.c relies on
Date: Thu, 24 Sep 2026 11:23:33 -0700
Message-ID: <20260924182342.212709-12-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924182342.212709-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20260924182342.212709-1-sathyanarayanan.kuppuswamy@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

tpmi_common.c uses a number of interfaces whose headers it never includes
directly and only gets by chance through other headers:

  BIT_ULL(), GENMASK_ULL()	bits.h
  __packed			compiler_attributes.h
  EXPORT_SYMBOL_NS_GPL()	export.h
  DEFINE_IDA()			idr.h
  IORESOURCE_MEM		ioport.h
  DEFINE_MUTEX(), mutex_lock()	mutex.h
  seq_printf(), seq_hex_dump()	seq_file.h
  kmalloc(), kzalloc_flex()	slab.h
  USEC_PER_MSEC, USEC_PER_SEC	time64.h
  uXX				types.h

Include them, so that the file does not break when an unrelated header
stops pulling them in.

Drop io.h while at it, as iopoll.h already includes it, and sort the
block alphabetically: debugfs.h and cleanup.h were the wrong way round.

No functional change intended.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 drivers/platform/x86/intel/tpmi_common.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/tpmi_common.c b/drivers/platform/x86/intel/tpmi_common.c
index 0db766309529..83362d4bb726 100644
--- a/drivers/platform/x86/intel/tpmi_common.c
+++ b/drivers/platform/x86/intel/tpmi_common.c
@@ -32,19 +32,28 @@
 #include <linux/array_size.h>
 #include <linux/auxiliary_bus.h>
 #include <linux/bitfield.h>
-#include <linux/debugfs.h>
+#include <linux/bits.h>
 #include <linux/cleanup.h>
+#include <linux/compiler_attributes.h>
+#include <linux/debugfs.h>
 #include <linux/delay.h>
+#include <linux/export.h>
+#include <linux/idr.h>
 #include <linux/intel_tpmi.h>
 #include <linux/intel_vsec.h>
-#include <linux/io.h>
 #include <linux/iopoll.h>
+#include <linux/ioport.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/notifier.h>
 #include <linux/pci.h>
 #include <linux/security.h>
+#include <linux/seq_file.h>
 #include <linux/sizes.h>
+#include <linux/slab.h>
 #include <linux/string_helpers.h>
+#include <linux/time64.h>
+#include <linux/types.h>
 
 #include "tpmi_common.h"
 
-- 
2.43.0

