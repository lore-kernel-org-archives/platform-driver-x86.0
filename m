From: Wei Yongjun <weiyongjun1@huawei.com>
Subject: [PATCH -next] platform/x86: dell-laptop: make some local functions static
Date: Sat, 23 Dec 2017 02:01:22 +0000
Message-ID: <1513994482-89811-1-git-send-email-weiyongjun1@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from szxga04-in.huawei.com ([45.249.212.190]:2715 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1756993AbdLWB4s (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 22 Dec 2017 20:56:48 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg59@srcf.ucam.org, pali.rohar@gmail.com, dvhart@infradead.org, andy@infradead.org, Mario Limonciello <mario.limonciello@dell.com>, quasisec@google.com
Cc: Wei Yongjun <weiyongjun1@huawei.com>, platform-driver-x86@vger.kernel.org

Fixes the following sparse warnings:

drivers/platform/x86/dell-laptop.c:289:6: warning:
 symbol 'dell_set_arguments' was not declared. Should it be static?
drivers/platform/x86/dell-laptop.c:298:5: warning:
 symbol 'dell_send_request' was not declared. Should it be static?

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/platform/x86/dell-laptop.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index 629d960..a94936a 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -286,7 +286,7 @@ static int __init dmi_matched(const struct dmi_system_id *dmi)
 	{ }
 };
 
-void dell_set_arguments(u32 arg0, u32 arg1, u32 arg2, u32 arg3)
+static void dell_set_arguments(u32 arg0, u32 arg1, u32 arg2, u32 arg3)
 {
 	memset(buffer, 0, sizeof(struct calling_interface_buffer));
 	buffer->input[0] = arg0;
@@ -295,7 +295,7 @@ void dell_set_arguments(u32 arg0, u32 arg1, u32 arg2, u32 arg3)
 	buffer->input[3] = arg3;
 }
 
-int dell_send_request(u16 class, u16 select)
+static int dell_send_request(u16 class, u16 select)
 {
 	int ret;
