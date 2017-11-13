From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: [PATCH v5 01/11] intel_sgx: updated MAINTAINERS
Date: Mon, 13 Nov 2017 21:45:18 +0200
Message-ID: <20171113194528.28557-2-jarkko.sakkinen@linux.intel.com>
References: <20171113194528.28557-1-jarkko.sakkinen@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171113194528.28557-1-jarkko.sakkinen@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: intel-sgx-kernel-dev@lists.01.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

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
