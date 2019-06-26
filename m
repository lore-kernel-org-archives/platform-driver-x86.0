From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 01/10] platform/x86: ISST: Update ioctl-number.txt for Intel Speed Select interface
Date: Wed, 26 Jun 2019 15:38:42 -0700
Message-ID: <20190626223851.19138-2-srinivas.pandruvada@linux.intel.com>
References: <20190626223851.19138-1-srinivas.pandruvada@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190626223851.19138-1-srinivas.pandruvada@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy@infradead.org, andriy.shevchenko@intel.com, corbet@lwn.net
Cc: rjw@rjwysocki.net, alan@linux.intel.com, lenb@kernel.org, prarit@redhat.com, darcari@redhat.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Reserve ioctl numbers for intel Speed Select Technology interface
drivers.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 Documentation/ioctl/ioctl-number.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/ioctl/ioctl-number.txt b/Documentation/ioctl/ioctl-number.txt
index c9558146ac58..ab0b3f686454 100644
--- a/Documentation/ioctl/ioctl-number.txt
+++ b/Documentation/ioctl/ioctl-number.txt
@@ -348,3 +348,4 @@ Code  Seq#(hex)	Include File		Comments
 0xF6	all	LTTng			Linux Trace Toolkit Next Generation
 					<mailto:mathieu.desnoyers@efficios.com>
 0xFD	all	linux/dm-ioctl.h
+0xFE	all	linux/isst_if.h
-- 
2.17.2
