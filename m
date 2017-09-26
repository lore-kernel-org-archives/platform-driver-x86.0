From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH v2 04/14] platform/x86: dell-smbios: Add pr_fmt definition to driver
Date: Tue, 26 Sep 2017 13:50:02 -0500
Message-ID: <07ad38ebb4f6cfec06656fa025b0da449b429a28.1506451187.git.mario.limonciello@dell.com>
References: <cover.1506451187.git.mario.limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1506451187.git.mario.limonciello@dell.com>
In-Reply-To: <cover.1506451187.git.mario.limonciello@dell.com>
References: <cover.1506451187.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, quasisec@google.com, pali.rohar@gmail.com, Mario Limonciello <mario.limonciello@dell.com>
List-Id: platform-driver-x86.vger.kernel.org

pr_fmt provides formatting to be used by the driver when
displaying errors and messages.

Reviewed-by: Pali Pohar <pali.rohar@gmail.com>
Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
---
 drivers/platform/x86/dell-smbios.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/dell-smbios.c
index 6654ad44a04c..579be67de2a3 100644
--- a/drivers/platform/x86/dell-smbios.c
+++ b/drivers/platform/x86/dell-smbios.c
@@ -12,6 +12,7 @@
  *  it under the terms of the GNU General Public License version 2 as
  *  published by the Free Software Foundation.
  */
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/kernel.h>
 #include <linux/module.h>
-- 
2.14.1
