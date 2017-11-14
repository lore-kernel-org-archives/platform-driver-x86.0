From: Wei Yongjun <weiyongjun1@huawei.com>
Subject: [PATCH -next] platform/x86: dell-laptop: fix error return code in dell_init()
Date: Tue, 14 Nov 2017 13:40:13 +0000
Message-ID: <1510666813-173192-1-git-send-email-weiyongjun1@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from szxga05-in.huawei.com ([45.249.212.191]:10539 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752526AbdKNNii (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Nov 2017 08:38:38 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg59@srcf.ucam.org, pali.rohar@gmail.com, dvhart@infradead.org, andy@infradead.org, Mario Limonciello <mario.limonciello@dell.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, platform-driver-x86@vger.kernel.org

Fix to return error code -ENOMEM from the kzalloc() error handling
case instead of 0, as done elsewhere in this function.

Fixes: 549b4930f057 ("platform/x86: dell-smbios: Introduce dispatcher for SMM calls")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/platform/x86/dell-laptop.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index c4903c5..0a8f359 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -2081,8 +2081,10 @@ static int __init dell_init(void)
 	}
 
 	buffer = kzalloc(sizeof(struct calling_interface_buffer), GFP_KERNEL);
-	if (!buffer)
+	if (!buffer) {
+		ret = -ENOMEM;
 		goto fail_buffer;
+	}
 
 	if (quirks && quirks->touchpad_led)
 		touchpad_led_init(&platform_device->dev);
