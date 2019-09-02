From: Yizhuo <yzhai003@ucr.edu>
Subject: [PATCH] compal-laptop: Variable "value" in function ec_read_u8() could be uninitialized
Date: Mon,  2 Sep 2019 12:52:49 -0700
Message-ID: <20190902195249.18221-1-yzhai003@ucr.edu>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: csong@cs.ucr.edu, zhiyunq@cs.ucr.edu, Yizhuo <yzhai003@ucr.edu>, Cezary Jackiewicz <cezary.jackiewicz@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

In function ec_read_u8(), variable "value" could be uninitialized
if ec_read() fails. However, "value" is returned directly and used
in its callers. This is potentially unsafe.

Signed-off-by: Yizhuo <yzhai003@ucr.edu>
---
 drivers/platform/x86/compal-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/compal-laptop.c b/drivers/platform/x86/compal-laptop.c
index 09dfa6f48a1a..ab610376fdad 100644
--- a/drivers/platform/x86/compal-laptop.c
+++ b/drivers/platform/x86/compal-laptop.c
@@ -226,7 +226,7 @@ static const unsigned char pwm_lookup_table[256] = {
 /* General access */
 static u8 ec_read_u8(u8 addr)
 {
-	u8 value;
+	u8 value = 0;
 	ec_read(addr, &value);
 	return value;
 }
-- 
2.17.1
