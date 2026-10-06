Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF454A4EE2;
	Tue,  6 Oct 2026 18:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791311468; cv=none; b=G460fxX0CHf6dtOXfwyxHjn+SxfusGJBJRhGvoGBZrd2QtKAJZmINl7Ki6kNXWQxvfGeZGVpVAVZlrHX2Qze/suwhHrwEyHXT1cKy9PuGZQl1AarIO6iOhseZnFmwHkfciAFXhMkLK6icJJU83qvxueXdnTpCCKixQLV6Kbkf7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791311468; c=relaxed/simple;
	bh=X4cqXUcmpiZuYqLvTt7lqgHmKdai1YzomAEpVhxlZZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PyuTu0KfsSVu6iYGlrs2hSq0LPQeypRlZ0Ym/nFg4R18J4GhevkiR7ams6WGAZEVslQvAJA6T57mX7lg+iU4GgzIsX0MJwYC5ybk6FFa9jqUZ/qSvsE7nxeV0DxeBqcPpionKwKYrdH/Z4FrlTtU7oSLkHVYxe9mOpk6mBLPgqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eqVi5yjd; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eqVi5yjd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791311462; x=1822847462;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=X4cqXUcmpiZuYqLvTt7lqgHmKdai1YzomAEpVhxlZZs=;
  b=eqVi5yjd3ZFT3Y+U38dgFlOvO+T6u5V8qV8JFNfK5ZTlgj8KD0pFgt+/
   VY4wvaspwNk4lGCr+WdBOGnOH6c25sLEs5rla27g3I16uJ1y1GC/gogsC
   odXqaT4fucXpnNv4jVWnnLtuivt6xZW2TbIzqyhcNXyVEpDEBN4lymrCb
   mh4W04PTD3eOmKleiF/rIXxVDLvUKx94b6P9mAgQiEn8E9ACwRaTpR7hk
   OLVTI5CcnU1nLGSnQZL3ukRrzzFg0evcXfyqQ95rhuwWRv6jG+7eMc+qH
   IzpfAKeDcnQ16S95KY2ca1UwSd+vIhR3aFxYhmLbdzPTdjxPkd8sNNx8E
   g==;
X-CSE-ConnectionGUID: CGLtzvQxTr2y/xDRfg+7Sg==
X-CSE-MsgGUID: spHVc/1TQQSdzVFmCmFFqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="102591611"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="102591611"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 11:30:56 -0700
X-CSE-ConnectionGUID: MW2L9bjESaGqAeDdLQllSA==
X-CSE-MsgGUID: /vSW+MjeR/q4aAHPwM1QpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="303500276"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 11:30:56 -0700
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 11/20] platform/x86/intel/tpmi: Include the headers tpmi_common.c relies on
Date: Tue,  6 Oct 2026 11:30:28 -0700
Message-ID: <20261006183037.1507007-12-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261006183037.1507007-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20261006183037.1507007-1-sathyanarayanan.kuppuswamy@linux.intel.com>
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
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

