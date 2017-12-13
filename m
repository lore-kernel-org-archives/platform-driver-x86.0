From: Dhaval Shah <dhaval.shah@softnautics.com>
Subject: [PATCH] platform/x86: dell-smo8800: Possible unnecessary 'out of memory' message
Date: Wed, 13 Dec 2017 13:53:54 +0530
Message-ID: <20171213082354.23273-1-dhaval.shah@softnautics.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ma1ind01on0115.outbound.protection.outlook.com ([104.47.100.115]:10591
        "EHLO IND01-MA1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751173AbdLMIYD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Dec 2017 03:24:03 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: pali.rohar@gmail.com, dvhart@infradead.org, andy@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Dhaval Shah <dhaval.shah@softnautics.com>

Removed Possible unnecessary 'out of memory' message checkpatch warnings.
Issue found by checkpatch.

Signed-off-by: Dhaval Shah <dhaval.shah@softnautics.com>
---
 drivers/platform/x86/dell-smo8800.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/platform/x86/dell-smo8800.c b/drivers/platform/x86/dell-smo8800.c
index 1d87237bc731..9590d5e7c5ca 100644
--- a/drivers/platform/x86/dell-smo8800.c
+++ b/drivers/platform/x86/dell-smo8800.c
@@ -150,10 +150,8 @@ static int smo8800_add(struct acpi_device *device)
 	struct smo8800_device *smo8800;
 
 	smo8800 = devm_kzalloc(&device->dev, sizeof(*smo8800), GFP_KERNEL);
-	if (!smo8800) {
-		dev_err(&device->dev, "failed to allocate device data\n");
+	if (!smo8800)
 		return -ENOMEM;
-	}
 
 	smo8800->dev = &device->dev;
 	smo8800->miscdev.minor = MISC_DYNAMIC_MINOR;
-- 
2.11.0
