From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 3/8] sony-laptop: ignore hard switch rfkill events (SPIC)
Date: Sat, 19 Feb 2011 11:52:27 +0900
Message-ID: <1298083952-22493-4-git-send-email-malattia@linux.it>
References: <1298083952-22493-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from static-220-247-10-204.b-man.svips.gol.ne.jp ([220.247.10.204]:60584
	"EHLO smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752874Ab1BSDAQ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 18 Feb 2011 22:00:16 -0500
In-Reply-To: <1298083952-22493-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

There is not much use for these events in userspace and handling the
events themselves seems to get in the way of the actual activation of
the rf devices. The SNC device doesn't expose them already.
https://bugzilla.kernel.org/show_bug.cgi?id=15303

Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c |    8 +++++---
 include/linux/sonypi.h             |    1 +
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 3aaa92e..ad7c496 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -1591,8 +1591,8 @@ static struct sonypi_event sonypi_blueev[] = {
 
 /* The set of possible wireless events */
 static struct sonypi_event sonypi_wlessev[] = {
-	{ 0x59, SONYPI_EVENT_WIRELESS_ON },
-	{ 0x5a, SONYPI_EVENT_WIRELESS_OFF },
+	{ 0x59, SONYPI_EVENT_IGNORE },
+	{ 0x5a, SONYPI_EVENT_IGNORE },
 	{ 0, 0 }
 };
 
@@ -2732,6 +2732,9 @@ static irqreturn_t sony_pic_irq(int irq, void *dev_id)
 			if (ev == dev->event_types[i].events[j].data) {
 				device_event =
 					dev->event_types[i].events[j].event;
+				/* some events may require ignoring */
+				if (!device_event)
+					return IRQ_HANDLED;
 				goto found;
 			}
 		}
@@ -2751,7 +2754,6 @@ found:
 	sony_laptop_report_input_event(device_event);
 	acpi_bus_generate_proc_event(dev->acpi_dev, 1, device_event);
 	sonypi_compat_report_event(device_event);
-
 	return IRQ_HANDLED;
 }
 
diff --git a/include/linux/sonypi.h b/include/linux/sonypi.h
index 0e6dc38..c0f87da 100644
--- a/include/linux/sonypi.h
+++ b/include/linux/sonypi.h
@@ -40,6 +40,7 @@
 
 /* events the user application reading /dev/sonypi can use */
 
+#define SONYPI_EVENT_IGNORE			 0
 #define SONYPI_EVENT_JOGDIAL_DOWN		 1
 #define SONYPI_EVENT_JOGDIAL_UP			 2
 #define SONYPI_EVENT_JOGDIAL_DOWN_PRESSED	 3
-- 
1.7.2.3
