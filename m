From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] platform/x86: acer-wmi: refactor function has_cap
Date: Mon, 6 Aug 2018 15:00:52 -0500
Message-ID: <20180806200052.GA29026@embeddedor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: "Lee, Chun-Yi" <jlee@suse.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Joe Perches <joe@perches.com>, David Laight <David.Laight@ACULAB.COM>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
List-Id: platform-driver-x86.vger.kernel.org

Refactor function has_cap in order to avoid returning integer
values, when instead it should return booleans.

This code was detected with the help of Coccinelle.

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/platform/x86/acer-wmi.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 8952173..ff1689d 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -672,10 +672,7 @@ static void __init find_quirks(void)
 
 static bool has_cap(u32 cap)
 {
-	if ((interface->capability & cap) != 0)
-		return 1;
-
-	return 0;
+	return (interface->capability & cap) != 0;
 }
 
 /*
-- 
2.7.4
