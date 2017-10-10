From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: [PATCH RFC v3 01/12] intel_sgx: updated MAINTAINERS
Date: Tue, 10 Oct 2017 17:32:47 +0300
Message-ID: <20171010143258.21623-2-jarkko.sakkinen@linux.intel.com>
References: <20171010143258.21623-1-jarkko.sakkinen@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:52005 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932075AbdJJOdE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 10 Oct 2017 10:33:04 -0400
In-Reply-To: <20171010143258.21623-1-jarkko.sakkinen@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: intel-sgx-kernel-dev@lists.01.org
Cc: platform-driver-x86@vger.kernel.org, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2d3d750b19c0..30a4b7f97a93 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14932,6 +14932,11 @@ L:	linux-mm@kvack.org
 S:	Maintained
 F:	mm/zswap.c
 
+INTEL SGX
+M:	Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
+L:	intel-sgx-kernel-dev@lists.01.org
+Q:	https://patchwork.kernel.org/project/intel-sgx/list/
+
 THE REST
 M:	Linus Torvalds <torvalds@linux-foundation.org>
 L:	linux-kernel@vger.kernel.org
-- 
2.14.1
