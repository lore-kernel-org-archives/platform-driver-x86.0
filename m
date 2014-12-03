From: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Subject: [PATCH 2/3] dell-wmi: Don't report keypresses for radio state changes
Date: Thu,  4 Dec 2014 00:16:22 +0100
Message-ID: <1417648583-9336-3-git-send-email-gabriele.mzt@gmail.com>
References: <1417648583-9336-1-git-send-email-gabriele.mzt@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1417648583-9336-1-git-send-email-gabriele.mzt@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mjg59@srcf.ucam.org, dvhart@infradead.org
Cc: pavel@ucw.cz, pali.rohar@gmail.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

The state of radio devices is changed directly by the BIOS when hotkeys
are pressed, so no events should be reported.

Signed-off-by: Gabriele Mazzotta <gabriele.mzt@gmail.com>
---
 drivers/platform/x86/dell-wmi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
index 1e31fab..9d3507c 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -65,9 +65,8 @@ static const struct key_entry dell_wmi_legacy_keymap[] __initconst = {
 	/* Battery health status button */
 	{ KE_KEY, 0xe007, { KEY_BATTERY } },
 
-	/* Although physically a switch, the notification does not provide
-	 * an indication of state and so it should be reported as a key */
-	{ KE_KEY, 0xe008, { KEY_RFKILL } },
+	/* Radio devices state change */
+	{ KE_IGNORE, 0xe008, { KEY_RFKILL } },
 
 	/* The next device is at offset 6, the active devices are at
 	   offset 8 and the attached devices at offset 10 */
-- 
2.1.3
