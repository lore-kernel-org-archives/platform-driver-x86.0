From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 14/19] sony-laptop: fix handling sony_nc_hotkeys_decode result
Date: Thu, 24 Sep 2015 16:00:22 +0200
Message-ID: <1443103227-25612-15-git-send-email-a.hajda@samsung.com>
References: <1443103227-25612-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1443103227-25612-1-git-send-email-a.hajda@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Mattia Dongili <malattia@linux.it>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

The function can return negative value.

The problem has been detected using proposed semantic patch
scripts/coccinelle/tests/assign_signed_to_unsigned.cocci [1].

[1]: http://permalink.gmane.org/gmane.linux.kernel/2046107

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
Hi,

To avoid problems with too many mail recipients I have sent whole
patchset only to LKML. Anyway patches have no dependencies.

Regards
Andrzej
---
 drivers/platform/x86/sony-laptop.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index aeb80d1..d8a2115 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -1204,6 +1204,8 @@ static void sony_nc_notify(struct acpi_device *device, u32 event)
 {
 	u32 real_ev = event;
 	u8 ev_type = 0;
+	int ret;
+
 	dprintk("sony_nc_notify, event: 0x%.2x\n", event);
 
 	if (event >= 0x90) {
@@ -1225,13 +1227,15 @@ static void sony_nc_notify(struct acpi_device *device, u32 event)
 		case 0x0100:
 		case 0x0127:
 			ev_type = HOTKEY;
-			real_ev = sony_nc_hotkeys_decode(event, handle);
+			ret = sony_nc_hotkeys_decode(event, handle);
 
-			if (real_ev > 0)
-				sony_laptop_report_input_event(real_ev);
-			else
+			if (ret > 0) {
+				sony_laptop_report_input_event(ret);
+				real_ev = ret;
+			} else {
 				/* restore the original event for reporting */
 				real_ev = event;
+			}
 
 			break;
 
-- 
1.9.1
