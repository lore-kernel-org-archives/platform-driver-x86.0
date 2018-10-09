From: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
Subject: [Patch v2] MAINTAINERS: intel_telemetry: Update maintainers info
Date: Tue,  9 Oct 2018 19:48:33 +0530
Message-ID: <20181009141833.25972-1-rajneesh.bhardwaj@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, rajneesh.bhardwaj@intel.com, david.e.box@linux.intel.com, Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Add myself and David as the new maintainers for Intel Telemetry driver
since Souvik no longer works with Intel. David and I work on power
management and debug related drivers which are pretty close to this one
in terms of functionalities so volunteering for the task.

Signed-off-by: Box, David E <david.e.box@linux.intel.com>
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 22065048d89d..f33ebd1b8034 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7530,7 +7530,8 @@ F:	arch/x86/crypto/sha*-mb/
 F:	crypto/mcryptd.c
 
 INTEL TELEMETRY DRIVER
-M:	Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
+M:	Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
+M:	Box, David E <david.e.box@linux.intel.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	arch/x86/include/asm/intel_telemetry.h
-- 
2.17.1
