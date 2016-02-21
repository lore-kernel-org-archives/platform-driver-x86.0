From: Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH] intel-hid: allocate correct amount of memory for private struct
Date: Sun, 21 Feb 2016 15:22:27 +0100
Message-ID: <1456064574-11245-1-git-send-email-wsa@the-dreams.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: Wolfram Sang <wsa@the-dreams.de>, Alex Hung <alex.hung@canonical.com>, Darren Hart <dvhart@infradead.org>, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

We want the size of the struct, not of a pointer to it. To be future
proof, just dereference the pointer to get the desired type.

Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
---

Compile tested only. Found by static code analysis.

 drivers/platform/x86/intel-hid.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel-hid.c b/drivers/platform/x86/intel-hid.c
index e20f23e04c24ce..f93abc8c1424ad 100644
--- a/drivers/platform/x86/intel-hid.c
+++ b/drivers/platform/x86/intel-hid.c
@@ -180,8 +180,7 @@ static int intel_hid_probe(struct platform_device *device)
 		return -ENODEV;
 	}
 
-	priv = devm_kzalloc(&device->dev,
-			    sizeof(struct intel_hid_priv *), GFP_KERNEL);
+	priv = devm_kzalloc(&device->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 	dev_set_drvdata(&device->dev, priv);
-- 
2.7.0
