From: Mathias Krause <minipli@googlemail.com>
Subject: [PATCHv2] ideapad-laptop: Constify DMI table for real!
Date: Thu, 28 Aug 2014 13:02:49 +0200
Message-ID: <1409223769-8660-1-git-send-email-minipli@googlemail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f48.google.com ([74.125.82.48]:47163 "EHLO
	mail-wg0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S936498AbaH1LDE (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 28 Aug 2014 07:03:04 -0400
Received: by mail-wg0-f48.google.com with SMTP id n12so573559wgh.7
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Aug 2014 04:03:02 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, platform-driver-x86@vger.kernel.org, Mathias Krause <minipli@googlemail.com>, Matthew Garrett <matthew.garrett@nebula.com>, Ike Panhc <ike.pan@canonical.com>

This is a follow-up patch to commit 49458e83082d ("ideapad-laptop:
Constify DMI table and other r/o variables") to do what its commit
message says. The actual commit differs from the patch posted at
https://www.mail-archive.com/platform-driver-x86@vger.kernel.org/msg05340.html
significantly, probably due to a bad merge conflict resolution. Fix up
the mess and constify the DMI table for real and fix the bogus
double-const of ideapad_rfk_data[].

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Mathias Krause <minipli@googlemail.com>
Cc: Matthew Garrett <matthew.garrett@nebula.com>
Cc: Ike Panhc <ike.pan@canonical.com>
---
Initial patch was posted here but somehow has fallen through the cracks:
https://www.mail-archive.com/platform-driver-x86@vger.kernel.org/msg05398.html

v2:
- rebased to linux-platform-drivers-x86.git/for-linus
- removed the second DMI table constification as that code was reverted
  by commit 3b264d279e72 ("Revert "ideapad-laptop: Disable touchpad...")

 drivers/platform/x86/ideapad-laptop.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index de1e0c30d1f1..02152de135b5 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -455,7 +455,7 @@ struct ideapad_rfk_data {
 	int type;
 };
 
-const const struct ideapad_rfk_data ideapad_rfk_data[] = {
+static const struct ideapad_rfk_data ideapad_rfk_data[] = {
 	{ "ideapad_wlan",    CFG_WIFI_BIT, VPCCMD_W_WIFI, RFKILL_TYPE_WLAN },
 	{ "ideapad_bluetooth", CFG_BT_BIT, VPCCMD_W_BT, RFKILL_TYPE_BLUETOOTH },
 	{ "ideapad_3g",        CFG_3G_BIT, VPCCMD_W_3G, RFKILL_TYPE_WWAN },
@@ -829,7 +829,7 @@ static void ideapad_acpi_notify(acpi_handle handle, u32 event, void *data)
  * always results in 0 on these models, causing ideapad_laptop to wrongly
  * report all radios as hardware-blocked.
  */
-static struct dmi_system_id no_hw_rfkill_list[] = {
+static const struct dmi_system_id no_hw_rfkill_list[] = {
 	{
 		.ident = "Lenovo Yoga 2 11 / 13 / Pro",
 		.matches = {
-- 
1.7.10.4
