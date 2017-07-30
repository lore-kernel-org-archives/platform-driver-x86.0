From: Paulo Alcantara <pcacjr@zytor.com>
Subject: [PATCH] platform/x86: hp-wmi: Remove unused macro helper
Date: Sun, 30 Jul 2017 12:40:50 -0300
Message-ID: <20170730154050.21545-1-pcacjr@zytor.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from terminus.zytor.com ([65.50.211.136]:38209 "EHLO mail.zytor.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753961AbdG3PlL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 30 Jul 2017 11:41:11 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Paulo Alcantara <pcacjr@zytor.com>

Signed-off-by: Paulo Alcantara <pcacjr@zytor.com>
---
 drivers/platform/x86/hp-wmi.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 0df4209648d1..5a88553e31e9 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -107,13 +107,6 @@ enum hp_wmi_hardware_mask {
 	HPWMI_TABLET_MASK	= 0x04,
 };
 
-#define BIOS_ARGS_INIT(write, ctype, size)				\
-	(struct bios_args)	{	.signature = 0x55434553,	\
-					.command = (write) ? 0x2 : 0x1,	\
-					.commandtype = (ctype),		\
-					.datasize = (size),		\
-					.data = 0 }
-
 struct bios_return {
 	u32 sigpass;
 	u32 return_code;
-- 
2.11.0
