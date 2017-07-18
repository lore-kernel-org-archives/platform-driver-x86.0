From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] ibm_rtl: remove unnecessary static in ibm_rtl_write()
Date: Tue, 18 Jul 2017 17:01:45 -0500
Message-ID: <20170718220145.GA11460@embeddedgus>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
List-Id: platform-driver-x86.vger.kernel.org

Remove unnecessary static on local variable cmd_port_val. Such variable
is initialized before being used, on every execution path throughout
the function. The static has no benefit and, removing it reduces the
object file size.

This issue was detected using Coccinelle and the following semantic patch:
https://github.com/GustavoARSilva/coccinelle/blob/master/static/static_unused.cocci

In the following log you can see a difference in the object file size.
This log is the output of the size command, before and after the code
change:

before:
   text    data     bss     dec     hex filename
   3932    3440     512    7884    1ecc drivers/platform/x86/ibm_rtl.o

after:
   text    data     bss     dec     hex filename
   3887    3384     448    7719    1e27 drivers/platform/x86/ibm_rtl.o

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/platform/x86/ibm_rtl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/ibm_rtl.c b/drivers/platform/x86/ibm_rtl.c
index c62e5e1..610ac83 100644
--- a/drivers/platform/x86/ibm_rtl.c
+++ b/drivers/platform/x86/ibm_rtl.c
@@ -103,7 +103,7 @@ static void rtl_port_unmap(void __iomem *addr)
 static int ibm_rtl_write(u8 value)
 {
 	int ret = 0, count = 0;
-	static u32 cmd_port_val;
+	u32 cmd_port_val;
 
 	RTL_DEBUG("%s(%d)\n", __func__, value);
 
-- 
2.5.0
