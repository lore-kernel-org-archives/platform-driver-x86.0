From: Yannick Guerrini <yguerrini@tomshardware.fr>
Subject: [PATCH] platform: x86: Fix trivial typo in comment
Date: Fri, 6 Mar 2015 22:50:30 +0100
Message-ID: <1425678630-9332-1-git-send-email-yguerrini@tomshardware.fr>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org
Cc: trivial@kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Yannick Guerrini <yguerrini@tomshardware.fr>
List-Id: platform-driver-x86.vger.kernel.org

Change 'disalbe' to 'disable'

Signed-off-by: Yannick Guerrini <yguerrini@tomshardware.fr>
---
 drivers/platform/x86/intel_oaktrail.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel_oaktrail.c b/drivers/platform/x86/intel_oaktrail.c
index a4a4258..8037c8b 100644
--- a/drivers/platform/x86/intel_oaktrail.c
+++ b/drivers/platform/x86/intel_oaktrail.c
@@ -62,7 +62,7 @@
  * (1 << 1):	Bluetooth enable/disable, RW.
  * (1 << 2):	GPS enable/disable, RW.
  * (1 << 3):	WiFi enable/disable, RW.
- * (1 << 4):	WWAN (3G) enable/disalbe, RW.
+ * (1 << 4):	WWAN (3G) enable/disable, RW.
  * (1 << 5):	Touchscreen enable/disable, Read Only.
  */
 #define OT_EC_DEVICE_STATE_ADDRESS	0xD6
-- 
1.9.5.msysgit.0
