From: Lad Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH] Sony-laptop: fix sparse warning
Date: Thu,  5 Feb 2015 14:49:41 +0000
Message-ID: <1423147781-26018-1-git-send-email-prabhakar.csengg@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mattia Dongili <malattia@linux.it>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>

this patch fixes following sparse warning:

sony-laptop.c:1035:29: warning: symbol 'sony_bl_props' was not declared. Should it be static?

Signed-off-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>
---
 Found this issue on linux-next (gcc  version 4.9.2,
 sparse version  0.4.5-rc1) and applies on top linux-next.

 drivers/platform/x86/sony-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 6dd1c0e..e51c1e7 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -1032,7 +1032,7 @@ struct sony_backlight_props {
 	u8			offset;
 	u8			maxlvl;
 };
-struct sony_backlight_props sony_bl_props;
+static struct sony_backlight_props sony_bl_props;
 
 static int sony_backlight_update_status(struct backlight_device *bd)
 {
-- 
1.9.1
