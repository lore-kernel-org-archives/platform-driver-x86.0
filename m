From: "David E. Box" <david.e.box@intel.com>
Subject: [PATCH V3] MAINTAINERS: intel_telemetry: Update maintainers info
Date: Fri, 12 Oct 2018 09:28:16 -0700
Message-ID: <20181012162816.14396-1-david.e.box@intel.com>
References: <262d8a05cedc76bc90fa5be7d3b92d5faa2b4ce9.camel@perches.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <262d8a05cedc76bc90fa5be7d3b92d5faa2b4ce9.camel@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: dvhart@infradead.org, andy@infradead.org, linux-kernel@vger.kernel.org, rajneesh.bhardwaj@linux.intel.com, "David E. Box" <david.e.box@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Remove Souvik who has left this role. Add Rajneesh and David who work
jointly on telemetry updates for new platforms.

Signed-off-by: David E. Box <david.e.box@intel.com>
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
---

	V3: Change signoff format

 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 544cac829cf4..cbe1595db4a5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7355,7 +7355,8 @@ F:	arch/x86/crypto/sha*-mb
 F:	crypto/mcryptd.c
 
 INTEL TELEMETRY DRIVER
-M:	Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
+M:	Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
+M:	"David E. Box" <david.e.box@linux.intel.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	arch/x86/include/asm/intel_telemetry.h
-- 
2.14.4
