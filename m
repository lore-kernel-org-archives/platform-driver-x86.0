From: "Valdis Kl=?utf-8?Q?=c4=93?=tnieks" <valdis.kletnieks@vt.edu>
Subject: [PATCH] drivers/platform/x86/dell-rbtn.c - add missing #include
Date: Tue, 12 Mar 2019 07:26:06 -0400
Message-ID: <17631.1552389966@turing-police>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: pali.rohar@gmail.com, Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Building with W=1 complains:
  CC [M]  drivers/platform/x86/dell-rbtn.o
drivers/platform/x86/dell-rbtn.c:345:5: warning: no previous prototype for 'dell_rbtn_notifier_register' [-Wmissing-prototypes]
  345 | int dell_rbtn_notifier_register(struct notifier_block *nb)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/platform/x86/dell-rbtn.c:371:5: warning: no previous prototype for 'dell_rbtn_notifier_unregister' [-Wmissing-prototypes]
  371 | int dell_rbtn_notifier_unregister(struct notifier_block *nb)
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
The real problem is a missing include. Add it to keep dell-rbtn.c and .h in sync

Signed-off-by: Valdis Kletnieks <valdis.kletnieks@vt.edu>

diff --git a/drivers/platform/x86/dell-rbtn.c b/drivers/platform/x86/dell-rbtn.c
index f3afe778001e..d50ca96d99f0 100644
--- a/drivers/platform/x86/dell-rbtn.c
+++ b/drivers/platform/x86/dell-rbtn.c
@@ -17,6 +17,7 @@
 #include <linux/acpi.h>
 #include <linux/rfkill.h>
 #include <linux/input.h>
+#include "dell-rbtn.h"
 
 enum rbtn_type {
 	RBTN_UNKNOWN,
