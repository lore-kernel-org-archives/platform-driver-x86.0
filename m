From: =?UTF-8?q?Stefan=20Br=C3=BCns?= <stefan.bruens@rwth-aachen.de>
Subject: [PATCH] platform/x86: hp-wmi: Fix tablet mode detection for convertibles
Date: Fri, 3 Nov 2017 03:01:53 +0100
Message-ID: <31e69338-e296-4e26-84ac-19fb172df2b3@rwthex-w2-a.rwth-ad.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Stefan=20Br=C3=BCns?= <stefan.bruens@rwth-aachen.de>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Commit f9cf3b2880cc ("platform/x86: hp-wmi: Refactor dock and tablet
state fetchers") consolidated the methods for docking and laptop mode
detection, but omitted to apply the correct mask for the laptop mode
(it always uses the constant for docking).

Signed-off-by: Stefan Brüns <stefan.bruens@rwth-aachen.de>

---

This change is untested, but restores the previous behaviour.
---
 drivers/platform/x86/hp-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index b4ed3dc983d5..b4224389febe 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -297,7 +297,7 @@ static int hp_wmi_hw_state(int mask)
 	if (state < 0)
 		return state;
 
-	return state & 0x1;
+	return !!(state & mask);
 }
 
 static int __init hp_wmi_bios_2008_later(void)
-- 
2.14.3
