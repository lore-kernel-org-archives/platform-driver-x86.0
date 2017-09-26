From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v2 02/14] platform/x86: dell-smbios: drop needless includes
Date: Tue, 26 Sep 2017 13:50:00 -0500
Message-ID: <cc9ebe36b3c0adee5789253b6d77a2a5e3a7e765.1506451187.git.mario.limonciello@dell.com>
References: <cover.1506451187.git.mario.limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1506451187.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1506451187.git.mario.limonciello@dell.com>
References: <cover.1506451187.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, quasisec@google.com, pali.rohar@gmail.com, Mario Limonciello <mario.limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

These aren't needed to compile the module.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
 drivers/platform/x86/dell-smbios.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/dell-smbios.c
index 0a5723468bff..6654ad44a04c 100644
--- a/drivers/platform/x86/dell-smbios.c
+++ b/drivers/platform/x86/dell-smbios.c
@@ -17,10 +17,7 @@
 #include <linux/module.h>
 #include <linux/dmi.h>
 #include <linux/err.h>
-#include <linux/gfp.h>
 #include <linux/mutex.h>
-#include <linux/slab.h>
-#include <linux/io.h>
 #include "../../firmware/dcdbas.h"
 #include "dell-smbios.h"
 
-- 
2.14.1
