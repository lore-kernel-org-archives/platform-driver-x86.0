From: Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH v2] x86/platform/goldfish: add a check for platform_device_register_simple
Date: Tue, 10 Dec 2019 11:15:59 +0800
Message-ID: <20191210031559.18715-1-hslester96@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@linux.intel.com>, x86@kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Chuhong Yuan <hslester96@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

goldfish_init() misses a check for platform_device_register_simple().
Add a check to fix it.

Fixes: ddd70cf93d78 ("goldfish: platform device for x86")
Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
Changes in v2:
  - Use PLATFORM_DEVID_NONE instead of -1.
  - Use PTR_ERR_OR_ZERO() to simplify the code.

 arch/x86/platform/goldfish/goldfish.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/x86/platform/goldfish/goldfish.c b/arch/x86/platform/goldfish/goldfish.c
index 6b6f8b4360dd..736f3fba234d 100644
--- a/arch/x86/platform/goldfish/goldfish.c
+++ b/arch/x86/platform/goldfish/goldfish.c
@@ -44,11 +44,14 @@ __setup("goldfish", goldfish_setup);
 
 static int __init goldfish_init(void)
 {
+	struct platform_device *pdev;
+
 	if (!goldfish_enable)
 		return -ENODEV;
 
-	platform_device_register_simple("goldfish_pdev_bus", -1,
-					goldfish_pdev_bus_resources, 2);
-	return 0;
+	pdev =  platform_device_register_simple("goldfish_pdev_bus",
+					 PLATFORM_DEVID_NONE,
+					 goldfish_pdev_bus_resources, 2);
+	return PTR_ERR_OR_ZERO(pdev);
 }
 device_initcall(goldfish_init);
-- 
2.24.0
