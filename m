From: Mathias Krause <minipli@googlemail.com>
Subject: [PATCH] ideapad-laptop: Constify DMI tables for real!
Date: Mon, 18 Aug 2014 21:52:50 +0200
Message-ID: <1408391570-4560-1-git-send-email-minipli@googlemail.com>
References: <CA+rthh-myi4kN2EQdcLAMGZxnJEVy8saDZTBfYtwveUKFcCGyg@mail.gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:49665 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750915AbaHRTxJ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 18 Aug 2014 15:53:09 -0400
Received: by mail-wi0-f172.google.com with SMTP id n3so4331616wiv.17
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Aug 2014 12:53:08 -0700 (PDT)
In-Reply-To: <CA+rthh-myi4kN2EQdcLAMGZxnJEVy8saDZTBfYtwveUKFcCGyg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, platform-driver-x86@vger.kernel.org, Mathias Krause <minipli@googlemail.com>, Ike Panhc <ike.pan@canonical.com>

This is a follow-up patch to commit 49458e83082d ("ideapad-laptop:
Constify DMI table and other r/o variables") to do what its commit
message says. The actual commit differs from the patch posted at
https://www.mail-archive.com/platform-driver-x86@vger.kernel.org/msg05340.html
significantly, probably due to a bad merge conflict resolution. Fix up
the mess and constify the DMI tables (two by now) for real and fix the
bogus double-const of ideapad_rfk_data[].

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Mathias Krause <minipli@googlemail.com>
Cc: Ike Panhc <ike.pan@canonical.com>
---
 drivers/platform/x86/ideapad-laptop.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index fc468a3d95..1f84ea3676 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -456,7 +456,7 @@ struct ideapad_rfk_data {
 	int type;
 };
 
-const const struct ideapad_rfk_data ideapad_rfk_data[] = {
+static const struct ideapad_rfk_data ideapad_rfk_data[] = {
 	{ "ideapad_wlan",    CFG_WIFI_BIT, VPCCMD_W_WIFI, RFKILL_TYPE_WLAN },
 	{ "ideapad_bluetooth", CFG_BT_BIT, VPCCMD_W_BT, RFKILL_TYPE_BLUETOOTH },
 	{ "ideapad_3g",        CFG_3G_BIT, VPCCMD_W_3G, RFKILL_TYPE_WWAN },
@@ -833,7 +833,7 @@ static void ideapad_acpi_notify(acpi_handle handle, u32 event, void *data)
  * always results in 0 on these models, causing ideapad_laptop to wrongly
  * report all radios as hardware-blocked.
  */
-static struct dmi_system_id no_hw_rfkill_list[] = {
+static const struct dmi_system_id no_hw_rfkill_list[] = {
 	{
 		.ident = "Lenovo Yoga 2 11 / 13 / Pro",
 		.matches = {
@@ -848,7 +848,7 @@ static struct dmi_system_id no_hw_rfkill_list[] = {
  * Some models don't offer touchpad ctrl through the ideapad interface, causing
  * ideapad_sync_touchpad_state to send wrong touchpad enable/disable events.
  */
-static struct dmi_system_id no_touchpad_ctrl_list[] = {
+static const struct dmi_system_id no_touchpad_ctrl_list[] = {
 	{
 		.ident = "Lenovo Yoga 1 series",
 		.matches = {
-- 
1.7.10.4
