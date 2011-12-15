From: Corentin Chary <corentincj@iksaif.net>
Subject: [PATCH 2/9] eeepc-laptop: log unknown keys
Date: Thu, 15 Dec 2011 08:27:32 +0100
Message-ID: <1323934059-1221-3-git-send-email-corentincj@iksaif.net>
References: <1323934059-1221-1-git-send-email-corentincj@iksaif.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1323934059-1221-1-git-send-email-corentincj@iksaif.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg@redhat.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Corentin Chary <corentincj@iksaif.net>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

From: Corentin Chary <corentin.chary@gmail.com>

Signed-off-by: Corentin Chary <corentin.chary@gmail.com>
---
 drivers/platform/x86/eeepc-laptop.c |   13 ++++++++++---
 1 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/eeepc-laptop.c b/drivers/platform/x86/eeepc-laptop.c
index ea44abd..6deb0d7 100644
--- a/drivers/platform/x86/eeepc-laptop.c
+++ b/drivers/platform/x86/eeepc-laptop.c
@@ -1251,6 +1251,14 @@ static void eeepc_input_exit(struct eeepc_laptop *eeepc)
 /*
  * ACPI driver
  */
+static void eeepc_input_notify(struct eeepc_laptop *eeepc, int event)
+{
+	if (!eeepc->inputdev)
+		return ;
+	if (!sparse_keymap_report_event(eeepc->inputdev, event, 1, true))
+		pr_info("Unknown key %x pressed\n", event);
+}
+
 static void eeepc_acpi_notify(struct acpi_device *device, u32 event)
 {
 	struct eeepc_laptop *eeepc = acpi_driver_data(device);
@@ -1287,12 +1295,11 @@ static void eeepc_acpi_notify(struct acpi_device *device, u32 event)
 				* event will be desired value (or else ignored)
 				*/
 			}
-			sparse_keymap_report_event(eeepc->inputdev, event,
-						   1, true);
+			eeepc_input_notify(eeepc, event);
 		}
 	} else {
 		/* Everything else is a bona-fide keypress event */
-		sparse_keymap_report_event(eeepc->inputdev, event, 1, true);
+		eeepc_input_notify(eeepc, event);
 	}
 }
 
-- 
1.7.5.4
