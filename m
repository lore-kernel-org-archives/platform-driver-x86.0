Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2254542ED2;
	Tue, 13 Oct 2026 19:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791919807; cv=none; b=cGvuLFJRdq5PEsrdy6wExY9TDAGboPRc6JoHLHfgYcZTqJm8IjxjDuZY/i47wm85YURXItaxvso+qThw4vwmkKB9guItf9B9HVg0yKeHREG21elI6J1S+MhgAZM2intBnWOprKzAmzvNohNeYw3kxpnusMm4KMsEBMpKGEC/ZtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791919807; c=relaxed/simple;
	bh=X4cqXUcmpiZuYqLvTt7lqgHmKdai1YzomAEpVhxlZZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DDfSzW/owzKIcOEgPYaTFv0TYUp/AMucrjJdR6qJyHoQo3Icxw0dDSC8QUIg5e0yY8UKQ82/gRRiLkqsMUkPPRkR9G9S5NTAMrITXlj8t9pwGQ3odyqxJmOqdvc76i1OYVWweAaqy6CQMazaxNwADayLjNID78jkSfcQ30SUtEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WTk16ub2; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WTk16ub2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791919805; x=1823455805;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=X4cqXUcmpiZuYqLvTt7lqgHmKdai1YzomAEpVhxlZZs=;
  b=WTk16ub2kopCBiNjDeKWNpeDz5rKV3VSHmzdAEccLGgU9bJHx9LfBaN4
   bO69VKafWVyJ61wK5GcDlvcNJFiwnS5eC5nmTHy1Gly6B02RBKHteOmjl
   jSsmhsY+OX17DIBcd+dZ9gzwJlqyMyNZKvtKTMu/fmOftoq2rsAkRUYzk
   EsTvwHB15badMF/pbiKhPtZJvjWv43PfQiD8L8WdNauqML/iTKkN/+9nU
   QlNVKU2RQFz8ZTXL/SoKwjcENP8yyrWzUzK5b5wDv9FTh5Rf/EnpLKNmw
   f3k19As9bmQg2PNa9ES6EtGML/eXinNdbHbcz5Fuz16BeV7uOMa85yE9m
   Q==;
X-CSE-ConnectionGUID: UGpsh/TTQv+nbhaTNd85GQ==
X-CSE-MsgGUID: +zzZTGhMScytPrJiWmfKFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="544129"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="544129"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 12:29:49 -0700
X-CSE-ConnectionGUID: rsndHKHIRF2CCdoGq77fNQ==
X-CSE-MsgGUID: Ev4gZliqSQK+1KXlG6P+qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1167691"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 12:29:49 -0700
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 11/20] platform/x86/intel/tpmi: Include the headers tpmi_common.c relies on
Date: Tue, 13 Oct 2026 12:29:26 -0700
Message-ID: <20261013192935.2243291-12-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013192935.2243291-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20261013192935.2243291-1-sathyanarayanan.kuppuswamy@linux.intel.com>
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

