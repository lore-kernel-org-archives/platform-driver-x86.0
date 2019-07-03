From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH] MAINTAINERS: Update for Intel Speed Select Technology
Date: Tue,  2 Jul 2019 18:53:31 -0700
Message-ID: <20190703015331.5449-1-srinivas.pandruvada@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy@infradead.org, andriy.shevchenko@intel.com, corbet@lwn.net
Cc: rjw@rjwysocki.net, alan@linux.intel.com, lenb@kernel.org, prarit@redhat.com, darcari@redhat.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Added myself as the maintainer.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5cfbea4ce575..b6ed7958372d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8101,6 +8101,14 @@ S:	Supported
 F:	drivers/infiniband/hw/i40iw/
 F:	include/uapi/rdma/i40iw-abi.h
 
+INTEL SPEED SELECT TECHNOLOGY
+M:	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/intel_speed_select_if/
+F:	tools/power/x86/intel-speed-select/
+F:	include/uapi/linux/isst_if.h
+
 INTEL TELEMETRY DRIVER
 M:	Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
 M:	"David E. Box" <david.e.box@linux.intel.com>
-- 
2.17.2
