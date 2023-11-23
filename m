Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="asa4+sDC"
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13B11D48;
	Wed, 22 Nov 2023 20:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700712240; x=1732248240;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=5ZZAKxI4gVSEhTRWxoAY8gcBKY1IXr9jOeKv5If/tc8=;
  b=asa4+sDCer8oL6EvCBvQ2oOOHS+KlIJMRg7xnBL+AE7Gf5TDURuGAmf2
   Q+Zd09rPaDWaCrezuNGCylWFIwk17toqzXXRFSxJidfgS7v95ml7xwlcy
   KD1qQlXOEEg2IOtBrtdnHpcEsE5163bI5kIWKJ504E1CJB3JJHnPFYBlq
   8LACWQzy+UQkp4N5kFLMEFzQ62aFbCXoGBSzZxRG92VOgd1MRYpMZciFd
   vPFAun+QljxVduibEeLvorfWZ1ovuCQwt2sT/Ju9PgcZq1pj+NKjjdIOO
   F7H71yPpXSqAqMzvmjXY3uFg6sWaYAI4ZKfnoa+uJ8qf1DDu8HR1/+Nyu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="5334663"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="5334663"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 20:03:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="837671154"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="837671154"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 20:03:57 -0800
Received: from debox1-desk4.lan (snpatel1-mobl.amr.corp.intel.com [10.209.89.91])
	by linux.intel.com (Postfix) with ESMTP id C57AF580CA6;
	Wed, 22 Nov 2023 20:03:56 -0800 (PST)
From: "David E. Box" <david.e.box@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	rajvi.jingar@linux.intel.com,
	dave.hansen@linux.intel.com,
	peterz@infradead.org
Subject: [PATCH V5 12/20] asm-generic/io.h: iounmap/ioport_unmap cleanup.h support
Date: Wed, 22 Nov 2023 20:03:47 -0800
Message-Id: <20231123040355.82139-13-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231123040355.82139-1-david.e.box@linux.intel.com>
References: <20231123040355.82139-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add auto-release cleanups for iounmap() and ioport_unmap().

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
V2 - Move from linux/io.h to asm-generic/io.h. Adds iounmap cleanup if
     iounmap() is defined. Adds ioport_unmap cleanup if CONFIG_IOPORT_MAP
     is defined.

 include/asm-generic/io.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/asm-generic/io.h b/include/asm-generic/io.h
index bac63e874c7b..9ef0332490b1 100644
--- a/include/asm-generic/io.h
+++ b/include/asm-generic/io.h
@@ -8,6 +8,7 @@
 #define __ASM_GENERIC_IO_H
 
 #include <asm/page.h> /* I/O is all done through memory accesses */
+#include <linux/cleanup.h>
 #include <linux/string.h> /* for memset() and memcpy() */
 #include <linux/types.h>
 #include <linux/instruction_pointer.h>
@@ -1065,6 +1066,10 @@ static inline void __iomem *ioremap(phys_addr_t addr, size_t size)
 #endif
 #endif /* !CONFIG_MMU || CONFIG_GENERIC_IOREMAP */
 
+#ifdef iounmap
+DEFINE_FREE(iounmap, void __iomem *, iounmap(_T));
+#endif
+
 #ifndef ioremap_wc
 #define ioremap_wc ioremap
 #endif
@@ -1127,6 +1132,7 @@ static inline void ioport_unmap(void __iomem *p)
 extern void __iomem *ioport_map(unsigned long port, unsigned int nr);
 extern void ioport_unmap(void __iomem *p);
 #endif /* CONFIG_GENERIC_IOMAP */
+DEFINE_FREE(ioport_unmap, void __iomem *, ioport_unmap(_T));
 #endif /* CONFIG_HAS_IOPORT_MAP */
 
 #ifndef CONFIG_GENERIC_IOMAP
-- 
2.34.1

