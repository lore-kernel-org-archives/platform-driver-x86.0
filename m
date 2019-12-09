From: Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH] x86/platform/goldfish: add a check for platform_device_register_simple
Date: Tue, 10 Dec 2019 00:22:30 +0800
Message-ID: <20191209162230.14991-1-hslester96@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@linux.intel.com>, x86@kernel.org, Bruce Beare <bruce.j.beare@intel.com>, Sheng Yang <sheng@linux.intel.com>, Yunhong Jiang <yunhong.jiang@intel.com>, Alan Cox <alan@linux.intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Chuhong Yuan <hslester96@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

goldfish_init() misses a check for platform_device_register_simple().
Add a check to fix it.

Fixes: ddd70cf93d78 ("goldfish: platform device for x86")
Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 arch/x86/platform/goldfish/goldfish.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/x86/platform/goldfish/goldfish.c b/arch/x86/platform/goldfish/goldfish.c
index 6b6f8b4360dd..e9694baf6e72 100644
--- a/arch/x86/platform/goldfish/goldfish.c
+++ b/arch/x86/platform/goldfish/goldfish.c
@@ -44,11 +44,16 @@ __setup("goldfish", goldfish_setup);
 
 static int __init goldfish_init(void)
 {
+	struct platform_device *pdev;
+
 	if (!goldfish_enable)
 		return -ENODEV;
 
-	platform_device_register_simple("goldfish_pdev_bus", -1,
-					goldfish_pdev_bus_resources, 2);
+	pdev =  platform_device_register_simple("goldfish_pdev_bus", -1,
+					goldfish_pdev_bus_resources, 2);
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
+
 	return 0;
 }
 device_initcall(goldfish_init);
-- 
2.24.0
