Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B12051EE0D;
	Wed, 30 Sep 2026 17:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790789387; cv=none; b=qtkoCaMU9Zf+j5RBhBvd48M/6lyTWUKvVLrZx8uiuzMAOrBkFe/bNyZjHTgDnpRO33R2/bbLddcUSlOi6fEKBgtmC+lkEUNLT9kDXdOBqvwJdLIJWsiamfzQV7Kzzt0as/6n/eDb7pWD59nXG9aPWXpilGwvmbICGKT6A+YHLew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790789387; c=relaxed/simple;
	bh=Iny8H30monaQX2vAxYF6KGlnj4w4sDkC//sKZ+qZT3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gjrRaOQIpdtDMIOvszMcIE+bFVUdbj6YBn8qPeQHfQsw5hv+w+RHXZsMPBdc8ymG6U6EuBzCmQQGMTNKgHBfWW1vM8feC5mr84ojl+yvRJXfS9rIOF7xpW9+ARPWLoWd8Rf8NIcRHMQAzJWb6j7xvwyDzfYAjC4x5YLycHEFz7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hBW8faFb; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hBW8faFb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790789386; x=1822325386;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Iny8H30monaQX2vAxYF6KGlnj4w4sDkC//sKZ+qZT3Y=;
  b=hBW8faFbUbeokFr9r80N97R2SSiM+JO++LJ9Tl3sXXzN2dDzUHp9irk9
   v3PBYPXQmf3nWMCQmanO5HRJOZjkdcud5Nh1ann/bg6/ZyUK/SfMwdhHs
   wJM4+iIW/lfmGZSucTTWp+4Po15NQQDl0OlOYSTnZJxMK2ym2D6NVYPba
   R7ykzb/lD7e5KTxNSpcs6ea+qyfsYv+xF66kcaWW4VcafWhSIT6cyE5p6
   dE9iNUrNWmjLALd5e8XzUWU4Oggjhn8/FvLPuVbYB6utkfte/0Lm0stSw
   pKJ81f4a/WlmZZW4RqK/E5CZl0R3lEgbOqr1P/1FNO5UbssjZ8USme+8j
   Q==;
X-CSE-ConnectionGUID: aNYK1TVfScidNrLQZ2E5Ww==
X-CSE-MsgGUID: Z/anM+uMT1ydw22FEMMWbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="91632073"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="91632073"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 10:29:35 -0700
X-CSE-ConnectionGUID: AULctnF9Q4KvODMVZ9c0KA==
X-CSE-MsgGUID: adr2XXf1RCWylJ1jtCQBbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="278959420"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 10:29:34 -0700
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 11/20] platform/x86/intel/tpmi: Include the headers tpmi_common.c relies on
Date: Wed, 30 Sep 2026 10:29:08 -0700
Message-ID: <20260930172918.743656-12-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930172918.743656-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20260930172918.743656-1-sathyanarayanan.kuppuswamy@linux.intel.com>
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
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

