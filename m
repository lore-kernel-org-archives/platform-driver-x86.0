From: =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>
Subject: [PATCH] platform/x86: hp-wmi: Actually use mask parameter in hp_wmi_hw_state
Date: Tue, 28 Nov 2017 16:17:58 +0100
Message-ID: <20171128151758.9234-1-michel@daenzer.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

We were always checking bit 0 (which represents the docked state)
regardless of the mask.

Fixes the "tablet mode" state always being reported the same as the
docked state, which with current libinput can cause the built-in input
devices of laptops to be incorrectly disabled while docked.

Cc: stable@vger.kernel.org
Fixes: ("platform/x86: hp-wmi: Refactor dock and tablet state fetchers")
Signed-off-by: Michel Dänzer <michel@daenzer.net>
---
 drivers/platform/x86/hp-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index b4ed3dc983d5..2bdd6bbdb353 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -297,7 +297,7 @@ static int hp_wmi_hw_state(int mask)
 	if (state < 0)
 		return state;
 
-	return state & 0x1;
+	return (state & mask) ? 1 : 0;
 }
 
 static int __init hp_wmi_bios_2008_later(void)
-- 
2.15.0
