From: Alan Cox <alan@linux.intel.com>
Subject: [PATCH] scu_ipc: Fix warning caused by include changes
Date: Mon, 13 Sep 2010 15:55:05 +0100
Message-ID: <20100913145423.15750.4076.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:57046 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752867Ab0IMPjh (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 13 Sep 2010 11:39:37 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, linux-next@vger.kernel.org, mjg@redhat.com

We need to include the SFI headers. This is fine as the SCU is only
relevant to x86 platforms with SFI.

Fixes the -next warning report.

Signed-off-by: Alan Cox <alan@linux.intel.com>
---

 drivers/platform/x86/intel_scu_ipc.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)


diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index 6abe18e..41a9e34 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -23,6 +23,7 @@
 #include <linux/pm.h>
 #include <linux/pci.h>
 #include <linux/interrupt.h>
+#include <linux/sfi.h>
 #include <asm/mrst.h>
 #include <asm/intel_scu_ipc.h>
 
