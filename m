From: Corentin Chary <corentin.chary@gmail.com>
Subject: [PATCH 04/14] asus-wmi: on/off bit is not set when reading the value
Date: Tue, 20 Mar 2012 09:53:04 +0100
Message-ID: <1332233594-13099-5-git-send-email-corentin.chary@gmail.com>
References: <1332233594-13099-1-git-send-email-corentin.chary@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1332233594-13099-1-git-send-email-corentin.chary@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Corentin Chary <corentin.chary@gmail.com>, Corentin Chary <corentincj@iksaif.net>, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Signed-off-by: Corentin Chary <corentin.chary@gmail.com>
---
 drivers/platform/x86/asus-wmi.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 72d731c..2b88347 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -411,7 +411,7 @@ static int kbd_led_read(struct asus_wmi *asus, int *level, int *env)
 
 	if (retval >= 0) {
 		if (level)
-			*level = retval & 0x80 ? retval & 0x7F : 0;
+			*level = retval & 0x7F;
 		if (env)
 			*env = (retval >> 8) & 0x7F;
 		retval = 0;
-- 
1.7.3.4
